Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A364E7356F5
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jun 2023 14:35:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DD5F10E1F0;
	Mon, 19 Jun 2023 12:35:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0927910E1F7
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jun 2023 12:35:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1687178126;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=yAWE58CsaAMtd+AIOuACgTo0t+B1QSHHfRWY4TLyueI=;
 b=A9yhcoVfG5oJmjDT+EDu2tPwpQCZdN5Oheh/0c2unraZtETTS+w1gbE03ao+n0eeoR/H1v
 57lJZf6LSGQx0dgCQ4e7GPFLC2jzer6K1VB2yzZZ/T4/GsWLnU919/OdlXvDrkVIW6zxJB
 DjPhwX6aAF6xWZi9JYSJp1bDbw4xTRc=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-434-iZkqP-SwMrCQnSEB2MSuuw-1; Mon, 19 Jun 2023 08:35:23 -0400
X-MC-Unique: iZkqP-SwMrCQnSEB2MSuuw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A24D52A59570;
 Mon, 19 Jun 2023 12:35:22 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.194.241])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4644740C6F58;
 Mon, 19 Jun 2023 12:35:22 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id E201218003AB; Mon, 19 Jun 2023 14:35:15 +0200 (CEST)
Date: Mon, 19 Jun 2023 14:35:15 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Mike Kravetz <mike.kravetz@oracle.com>
Subject: Re: [PATCH] udmabuf: revert 'Add support for mapping hugepages (v4)'
Message-ID: <jdfdmwanxzi6udltiezoqli77kutoeuzodet6tsfyyu4sibbom@yxhycebnts6j>
References: <20230608204927.88711-1-mike.kravetz@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230608204927.88711-1-mike.kravetz@oracle.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
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
Cc: mhocko@suse.com, jmarchan@redhat.com, Dongwon Kim <dongwon.kim@intel.com>,
 David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org,
 Junxiao Chang <junxiao.chang@intel.com>, muchun.song@linux.dev,
 Vivek Kasireddy <vivek.kasireddy@intel.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 James Houghton <jthoughton@google.com>, stable@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Andrew Morton <akpm@linux-foundation.org>, kirill.shutemov@linux.intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jun 08, 2023 at 01:49:27PM -0700, Mike Kravetz wrote:
> This effectively reverts commit 16c243e99d33 ("udmabuf: Add support
> for mapping hugepages (v4)").  Recently, Junxiao Chang found a BUG
> with page map counting as described here [1].  This issue pointed out
> that the udmabuf driver was making direct use of subpages of hugetlb
> pages.  This is not a good idea, and no other mm code attempts such use.
> In addition to the mapcount issue, this also causes issues with hugetlb
> vmemmap optimization and page poisoning.
> 
> For now, remove hugetlb support.
> 
> If udmabuf wants to be used on hugetlb mappings, it should be changed to
> only use complete hugetlb pages.  This will require different alignment
> and size requirements on the UDMABUF_CREATE API.
> 
> [1] https://lore.kernel.org/linux-mm/20230512072036.1027784-1-junxiao.chang@intel.com/
> 
> Fixes: 16c243e99d33 ("udmabuf: Add support for mapping hugepages (v4)")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Mike Kravetz <mike.kravetz@oracle.com>

Acked-by: Gerd Hoffmann <kraxel@redhat.com>

