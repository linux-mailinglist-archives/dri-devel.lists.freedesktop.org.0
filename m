Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 860FE305B34
	for <lists+dri-devel@lfdr.de>; Wed, 27 Jan 2021 13:24:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 579BD6E19B;
	Wed, 27 Jan 2021 12:24:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A19166E19B
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Jan 2021 12:24:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611750264;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ESk4erADjhVygeBOZ67K4CNLftTWe14rVACW2LGonko=;
 b=bMTZXhTTCfoIRCgd/jdHAbKvEusNn7IuZqxdC9v4CL+Qa4JFHbH4y8J6b/yg113Caly5QO
 IUlKqNDZHUmhYZa1NHIZgcBcuRg4Tfe8/miVHDd/sNSpuaeRHutZ5DFg3ICdzhA6mjWhb3
 5HlMfgSazYWrhrHNXDQL/5eQ0DfelfM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-29-qzwcez55O3y-wZw4QM2TmA-1; Wed, 27 Jan 2021 07:24:20 -0500
X-MC-Unique: qzwcez55O3y-wZw4QM2TmA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 754479CDA2;
 Wed, 27 Jan 2021 12:24:18 +0000 (UTC)
Received: from [10.36.114.237] (ovpn-114-237.ams2.redhat.com [10.36.114.237])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4AC0A60854;
 Wed, 27 Jan 2021 12:24:15 +0000 (UTC)
Subject: Re: [PATCH v1 2/2] mm: simplify free_highmem_page() and
 free_reserved_page()
To: Oscar Salvador <osalvador@suse.de>
References: <20210126182113.19892-1-david@redhat.com>
 <20210126182113.19892-3-david@redhat.com> <20210127115122.GA28728@linux>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat GmbH
Message-ID: <4cbbb828-016b-db98-485b-60239041cc07@redhat.com>
Date: Wed, 27 Jan 2021 13:24:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20210127115122.GA28728@linux>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Cc: linux-fbdev@vger.kernel.org, Wei Yang <richard.weiyang@linux.alibaba.com>,
 "Peter Zijlstra \(Intel\)" <peterz@infradead.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Michal Hocko <mhocko@kernel.org>, linux-mm@kvack.org,
 Andrew Morton <akpm@linux-foundation.org>,
 Thomas Gleixner <tglx@linutronix.de>, Mike Rapoport <rppt@kernel.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 27.01.21 12:51, Oscar Salvador wrote:
> On Tue, Jan 26, 2021 at 07:21:13PM +0100, David Hildenbrand wrote:
>> adjust_managed_page_count() as called by free_reserved_page() properly
>> handles pages in a highmem zone, so we can reuse it for
>> free_highmem_page().
>>
>> We can now get rid of totalhigh_pages_inc() and simplify
>> free_reserved_page().
>>
>> Cc: Andrew Morton <akpm@linux-foundation.org>
>> Cc: Thomas Gleixner <tglx@linutronix.de>
>> Cc: "Peter Zijlstra (Intel)" <peterz@infradead.org>
>> Cc: Mike Rapoport <rppt@kernel.org>
>> Cc: Oscar Salvador <osalvador@suse.de>
>> Cc: Michal Hocko <mhocko@kernel.org>
>> Cc: Wei Yang <richard.weiyang@linux.alibaba.com>
>> Signed-off-by: David Hildenbrand <david@redhat.com>
> 
> Reviewed-by: Oscar Salvador <osalvador@suse.de>
> 
>> +#define free_highmem_page(page) free_reserved_page(page)
> 
> Should we place that under #ifdef CONFIG_HIGHMEM to make clear
> that it is only used on that config?
> Maybe the #ifdefery ugliness does not pay off.

Yeah, most probably not worth it.

-- 
Thanks,

David / dhildenb

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
