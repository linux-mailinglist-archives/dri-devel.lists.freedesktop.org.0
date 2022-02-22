Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E571F4C04B9
	for <lists+dri-devel@lfdr.de>; Tue, 22 Feb 2022 23:37:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75EB510E701;
	Tue, 22 Feb 2022 22:37:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AD5710E701;
 Tue, 22 Feb 2022 22:37:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645569461; x=1677105461;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=ZkrZuNS+FMWqwStTuA03SedJDNaL5aEDD5LXFNdMfRI=;
 b=X3Rpae6vlW4g235JRj/P6rHH6A4UkKLRW2ZYK6gfD2OphVnPKAsfaCdI
 SPCdksz+x8NDtJBJwhqlQQEwN8XnTxBbxD5ejJif5Jjhrys8nyhfK5rIS
 CdDZF1DO+s+vin2Qj5EQuAVKq9vf/p0dUjouN4NMAshrSeJe5rcYvIveB
 Br5EYWg/tA8E2gQlmaZoMbNlXOnV6cFBpgbDrYuJO2qt98Abk1vxVWocY
 xpCFX/DvTU7GJxoSKp+4kqU7NDOkF8un/gT+C5PtBgCZUnekQ/uA86FWP
 ZKwnelTu4VfdHMv1Tx618lhBpYg1gLZ/ngxplXe0Jj+48oJNAuGGEH2Lp w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10266"; a="231803905"
X-IronPort-AV: E=Sophos;i="5.88,389,1635231600"; d="scan'208";a="231803905"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2022 14:37:40 -0800
X-IronPort-AV: E=Sophos;i="5.88,389,1635231600"; d="scan'208";a="683685523"
Received: from mdroper-desk1.fm.intel.com (HELO
 mdroper-desk1.amr.corp.intel.com) ([10.1.27.134])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2022 14:37:40 -0800
Date: Tue, 22 Feb 2022 14:37:39 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Michael Cheng <michael.cheng@intel.com>
Subject: Re: [PATCH v10 5/6] drm/i915/: Re-work clflush_write32
Message-ID: <YhVlsxcrPpo10SyC@mdroper-desk1.amr.corp.intel.com>
References: <20220210183636.1187973-1-michael.cheng@intel.com>
 <20220210183636.1187973-6-michael.cheng@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220210183636.1187973-6-michael.cheng@intel.com>
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
Cc: tvrtko.ursulin@linux.intel.com, balasubramani.vivekanandan@intel.com,
 wayne.boyer@intel.com, intel-gfx@lists.freedesktop.org,
 casey.g.bowman@intel.com, lucas.demarchi@intel.com,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Feb 10, 2022 at 10:36:35AM -0800, Michael Cheng wrote:
> Use drm_clflush_virt_range instead of clflushopt and remove the memory
> barrier, since drm_clflush_virt_range takes care of that.
> 
> Signed-off-by: Michael Cheng <michael.cheng@intel.com>
> ---
>  drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> index 498b458fd784..0854276ff7ba 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> @@ -1332,10 +1332,8 @@ static void *reloc_vaddr(struct i915_vma *vma,
>  static void clflush_write32(u32 *addr, u32 value, unsigned int flushes)
>  {
>  	if (unlikely(flushes & (CLFLUSH_BEFORE | CLFLUSH_AFTER))) {
> -		if (flushes & CLFLUSH_BEFORE) {
> -			clflushopt(addr);
> -			mb();
> -		}
> +		if (flushes & CLFLUSH_BEFORE)
> +			drm_clflush_virt_range(addr, sizeof(addr));

This is another case where it should technically be sizeof(*addr),
although in practice it won't change the behavior.

>  
>  		*addr = value;
>  
> @@ -1347,7 +1345,7 @@ static void clflush_write32(u32 *addr, u32 value, unsigned int flushes)
>  		 * to ensure ordering of clflush wrt to the system.
>  		 */
>  		if (flushes & CLFLUSH_AFTER)
> -			clflushopt(addr);
> +			drm_clflush_virt_range(addr, sizeof(addr));

Ditto.


Aside from those,

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>


>  	} else
>  		*addr = value;
>  }
> -- 
> 2.25.1
> 

-- 
Matt Roper
Graphics Software Engineer
VTT-OSGC Platform Enablement
Intel Corporation
(916) 356-2795
