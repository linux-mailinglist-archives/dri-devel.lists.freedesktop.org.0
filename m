Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9878175040E
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jul 2023 12:03:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5745910E4CA;
	Wed, 12 Jul 2023 10:03:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3530D10E4BB;
 Wed, 12 Jul 2023 10:03:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689156187; x=1720692187;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=jjBYupbDnYR+DL1FMgiB0E8uYCbK8bAAwazn7OuIEyo=;
 b=JZE4DiuzTJLHQQomSHUA+MQfi9DJv4L+zl8z2PJA/1pxW6jy3K4tUUqT
 wOpe1kkUYckbP0Wp/5gGEGXwhMAYqCifrS7YtlT8O3SGflgnj0zWHI5NP
 U95iY9vRfXSQaEL1JeTuQvMIlHFc1ENEwF8ihh+o9VcAd1YGW0J2m9pUJ
 kGrEBy6V/6jIu5QDNFaeaijIS2N+SxKrA2FQuyBb7WCI9xYvbDgZ2W3zd
 4LhhEA5AwDZeA7FnIXQsvEIYWR+qrEdqhUrzuettsJ4umrySoVEHEp+d2
 NyEovYLtz2ATqfkj2jFPK0ukdN00SxWwVMrfbYQcwD2yQGKTVcKz/2suR Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10768"; a="349705002"
X-IronPort-AV: E=Sophos;i="6.01,199,1684825200"; d="scan'208";a="349705002"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jul 2023 03:03:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10768"; a="786983840"
X-IronPort-AV: E=Sophos;i="6.01,199,1684825200"; d="scan'208";a="786983840"
Received: from ahajda-mobl.ger.corp.intel.com (HELO [10.213.31.249])
 ([10.213.31.249])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jul 2023 03:03:04 -0700
Message-ID: <39c15fad-92fa-4414-11f5-b7a8e60ac5d2@intel.com>
Date: Wed, 12 Jul 2023 12:03:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.13.0
Subject: Re: [Intel-gfx] [PATCH] drm/i915/huc: check HuC and GuC version
 compatibility on MTL
Content-Language: en-US
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 intel-gfx@lists.freedesktop.org
References: <20230711203150.4140313-1-daniele.ceraolospurio@intel.com>
From: Andrzej Hajda <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20230711203150.4140313-1-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11.07.2023 22:31, Daniele Ceraolo Spurio wrote:
> Due to a change in the auth flow on MTL, GuC 70.7.0 and newer will only
> be able to authenticate HuC 8.5.1 and newer. The plan is to update the 2
> binaries sinchronously in linux-firmware so that the fw repo always has
> a matching pair that works; still, it's better to check in the kernel so
> we can print an error message and abort HuC loading if the binaries are
> out of sync instead of failing the authentication.
> 
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: John Harrison <John.C.Harrison@Intel.com>
> ---
>   drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c | 42 ++++++++++++++++++++++++
>   1 file changed, 42 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
> index 08e16017584b..f0cc5bb47fa0 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
> @@ -803,11 +803,53 @@ static int try_firmware_load(struct intel_uc_fw *uc_fw, const struct firmware **
>   	return 0;
>   }
>   
> +static int check_mtl_huc_guc_compatibility(struct intel_gt *gt,
> +					   struct intel_uc_fw_file *huc_selected)
> +{
> +	struct intel_uc_fw_file *guc_selected = &gt->uc.guc.fw.file_selected;
> +	struct intel_uc_fw_ver *huc_ver = &huc_selected->ver;
> +	struct intel_uc_fw_ver *guc_ver = &guc_selected->ver;
> +	bool new_huc;
> +	bool new_guc;
> +
> +	/* we can only do this check after having fetched both GuC and HuC */
> +	GEM_BUG_ON(!huc_selected->path || !guc_selected->path);
> +
> +	/*
> +	 * Due to changes in the authentication flow for MTL, HuC 8.5.1 or newer
> +	 * requires GuC 70.7.0 or newer. Older HuC binaries will instead require
> +	 * GuC < 70.7.0.
> +	 */
> +	new_huc = huc_ver->major > 8 ||
> +		  (huc_ver->major == 8 && huc_ver->minor > 5) ||
> +		  (huc_ver->major == 8 && huc_ver->minor == 5 && huc_ver->patch >= 1);
> +
> +	new_guc = guc_ver->major > 70 ||
> +		  (guc_ver->major == 70 && guc_ver->minor >= 7);

Wouldn't be more readable to define sth like UC_VER_FULL(v)
then use UC_VER_FULL(huc_ver) >= IP_VER_FULL(8, 5, 1).
I am not sure if it is worth for two checks.


> +
> +	if (new_huc != new_guc) {
> +		UNEXPECTED(gt, "HuC %u.%u.%u is incompatible with GuC %u.%u.%u\n",
> +			   huc_ver->major, huc_ver->minor, huc_ver->patch,
> +			   guc_ver->major, guc_ver->minor, guc_ver->patch);
> +		gt_info(gt, "MTL GuC 70.7.0+ and HuC 8.5.1+ don't work with older releases\n");
> +		return -ENOEXEC;
> +	}
> +
> +	return 0;
> +}
> +
>   int intel_uc_check_file_version(struct intel_uc_fw *uc_fw, bool *old_ver)
>   {
>   	struct intel_gt *gt = __uc_fw_to_gt(uc_fw);
>   	struct intel_uc_fw_file *wanted = &uc_fw->file_wanted;
>   	struct intel_uc_fw_file *selected = &uc_fw->file_selected;
> +	int ret;
> +
> +	if (IS_METEORLAKE(gt->i915) && uc_fw->type == INTEL_UC_FW_TYPE_HUC) {

Moving this check inside check function would make it more generic, up 
to you.

Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>

Regards
Andrzej


> +		ret = check_mtl_huc_guc_compatibility(gt, selected);
> +		if (ret)
> +			return ret;
> +	}
>   
>   	if (!wanted->ver.major || !selected->ver.major)
>   		return 0;

