Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BA494786E0
	for <lists+dri-devel@lfdr.de>; Fri, 17 Dec 2021 10:16:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46D1910FB2D;
	Fri, 17 Dec 2021 09:16:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 7A59910FB2D
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Dec 2021 09:16:22 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BBD491435;
 Fri, 17 Dec 2021 01:16:21 -0800 (PST)
Received: from [10.57.6.245] (unknown [10.57.6.245])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 760A93F774;
 Fri, 17 Dec 2021 01:16:20 -0800 (PST)
Subject: Re: [PATCH] drm/panfrost: Avoid user size passed to kvmalloc()
To: Dan Carpenter <dan.carpenter@oracle.com>
References: <20211216161603.983711-1-steven.price@arm.com>
 <CAL_JsqKZBsJxy8h5EQf0wwfioWS-Kx9i=0cQ7p4FHckEXstGiw@mail.gmail.com>
 <4c564c0d-7702-9dfe-910f-969fe130aba8@arm.com> <20211217091046.GG1978@kadam>
From: Steven Price <steven.price@arm.com>
Message-ID: <4e56a7a8-c48c-49dc-6535-730ad871d1e1@arm.com>
Date: Fri, 17 Dec 2021 09:16:19 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211217091046.GG1978@kadam>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
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
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>, David Airlie <airlied@linux.ie>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 17/12/2021 09:10, Dan Carpenter wrote:
> On Fri, Dec 17, 2021 at 08:55:50AM +0000, Steven Price wrote:
>> However this one is harder to fix without setting an arbitrary cap on
>> the number of BOs during a sumbit. I'm not sure how other drivers handle
>> this - the ones I've looked at so far all have the same issue. There's
>> obviously the list that Dan already sent, but e.g. msm has the same bug
>> in msm_gem_submit.c:submit_create() with an amusing bug where the check
>> for (sz > SIZE_MAX) will never hit, although the call is to kzalloc() so
>> large allocations are going to fail anyway.
> 
> sz is u64 and SIZE_MAX is ULONG_MAX so the (sz > SIZE_MAX) condition
> does work to prevent an integer overflow on 32bit systems.  But it's not
> beautiful.

sz is the result of struct_size() which returns a size_t, and SIZE_MAX
in case of an overflow. However the check is *greater than* SIZE_MAX
which will never occur even on 32 bit systems.

However the chances of kzalloc() allocating SIZE_MAX are 0 so I don't
see it's an exploitable bug.

Steve
