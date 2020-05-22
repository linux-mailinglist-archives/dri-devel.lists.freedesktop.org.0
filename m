Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CE8B1DDD85
	for <lists+dri-devel@lfdr.de>; Fri, 22 May 2020 04:56:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A5076E971;
	Fri, 22 May 2020 02:56:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqnvemgate25.nvidia.com (hqnvemgate25.nvidia.com
 [216.228.121.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2F296E96C;
 Fri, 22 May 2020 02:56:16 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5ec73f000000>; Thu, 21 May 2020 19:54:56 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Thu, 21 May 2020 19:56:16 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Thu, 21 May 2020 19:56:16 -0700
Received: from [10.2.48.182] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 22 May
 2020 02:56:15 +0000
Subject: Re: [PATCH] mm/gup: fixup gup.c for "mm/gup: refactor and
 de-duplicate gup_fast() code"
To: Chris Wilson <chris@chris-wilson.co.uk>, Andrew Morton
 <akpm@linux-foundation.org>
References: <20200521233841.1279742-1-jhubbard@nvidia.com>
 <159011561851.32320.15372940900085926477@build.alporthouse.com>
X-Nvconfidentiality: public
From: John Hubbard <jhubbard@nvidia.com>
Message-ID: <19baba24-1f05-9497-2d23-36c2af09d080@nvidia.com>
Date: Thu, 21 May 2020 19:56:15 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <159011561851.32320.15372940900085926477@build.alporthouse.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1590116096; bh=ZAaG0RT29C3mMCelcOYrNPFdgL+X0u5fdvmv/XTgbkc=;
 h=X-PGP-Universal:Subject:To:CC:References:X-Nvconfidentiality:From:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=TJWMmnVXno2KwLrQrVCBptO62ixYJXrnhmGBvfspnNjIVECJQuuUtf1JeHSN6fv7P
 XwX/TlqcFZ6qoSxl/wadKFem1hPdciMiZTSzHaO8MPq6/UTnri7pGV+AQForDp/6Gp
 Xql98VL2kl7HJMdj/zhWZ4H18Mb+pTQZ3KM57Zh7dgSJVV5g0qswajsa4oLSTqUAmv
 zc/evDP3vS7BHBsJrkNzolR2q/x3MiEtqy3esU26QF5FXHmR/qj1bCBtKO+sfUtfJz
 eDnXjhUNbzvLztmlFWeBo5JQrKOUPA+JDHBf59Vnrrdx3AcmX+yFVQjh7k0UJlcipA
 8OOcXDtb3wVVQ==
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
Cc: Matthew Wilcox <willy@infradead.org>, dri-devel@lists.freedesktop.org,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>, David Airlie <airlied@linux.ie>,
 intel-gfx@lists.freedesktop.org, LKML <linux-kernel@vger.kernel.org>,
 linux-mm@kvack.org, Souptick Joarder <jrdr.linux@gmail.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Matthew Auld <matthew.auld@intel.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2020-05-21 19:46, Chris Wilson wrote:
> Quoting John Hubbard (2020-05-22 00:38:41)
>> Include FOLL_FAST_ONLY in the list of flags to *not* WARN()
>> on, in internal_get_user_pages_fast().
>>
>> Cc: Chris Wilson <chris@chris-wilson.co.uk>
>> Cc: Daniel Vetter <daniel@ffwll.ch>
>> Cc: David Airlie <airlied@linux.ie>
>> Cc: Jani Nikula <jani.nikula@linux.intel.com>
>> Cc: "Joonas Lahtinen" <joonas.lahtinen@linux.intel.com>
>> Cc: Matthew Auld <matthew.auld@intel.com>
>> Cc: Matthew Wilcox <willy@infradead.org>
>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> Cc: Souptick Joarder <jrdr.linux@gmail.com>
>> Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>> Signed-off-by: John Hubbard <jhubbard@nvidia.com>
>> ---
>>
>> Hi Andrew, Chris,
>>
>> Andrew: This is a fixup that applies to today's (20200521) linux-next.
>> In that tree, this fixes up:
>>
>> commit dfb8dfe80808 ("mm/gup: refactor and de-duplicate gup_fast() code")
>>
>> Chris: I'd like to request another CI run for the drm/i915 changes, so
>> for that, would you prefer that I post a v2 of the series [1], or
>> is it easier for you to just apply this patch here, on top of [2]?
> 
> If you post your series again with this patch included to intel-gfx, CI
> will pick it up. Or I'll do that in the morning.
> -Chris
> 

OK, perfect. I'll post a version for linux.git in a moment here.


thanks,
-- 
John Hubbard
NVIDIA
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
