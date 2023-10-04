Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EA6D7B7FEA
	for <lists+dri-devel@lfdr.de>; Wed,  4 Oct 2023 14:55:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E686410E36C;
	Wed,  4 Oct 2023 12:55:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABBD710E36C;
 Wed,  4 Oct 2023 12:55:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696424138; x=1727960138;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=FSbrP4SEDCHk1TQ/mV1THXmdKHiA2kUovZnWxBk21Rs=;
 b=bHq40djN72gtgDBcxzqVbo5DC0Em33fbtWDUmAo7Oyk+nYwGARloEvoe
 Oukc2nSFtVjw7vv6R0I7sFJV7FnH9c8q7TLR7x8IVMLR0gtmiE5E13Lm3
 2wIHo7uwxLXDphgpxds+29XBRHEA9BD3fjQhz86WREsd4TfRccTe/goLQ
 uEKszGv77SB83Jdd8hjsmHKE6TXrh/CkfWJtmkAR9+0LouK+0faliqYBz
 eCzEkXeBDqI3zDGrPhCABQWgn42kXSD53MvHfjrZn8oOgh8iwX2Thrau7
 fkBoNwzqI7XCVNVttPwhTaaLwsU+XHlRhij93mIlbmmvMOYgixr3Ksdr5 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="362517456"
X-IronPort-AV: E=Sophos;i="6.03,200,1694761200"; d="scan'208";a="362517456"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2023 05:55:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="841834662"
X-IronPort-AV: E=Sophos;i="6.03,200,1694761200"; d="scan'208";a="841834662"
Received: from msterni-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.56.48])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2023 05:55:36 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org, Dave Airlie <airlied@redhat.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH] drm/edid/firmware: drop drm_kms_helper.edid_firmware
 backward compat
In-Reply-To: <20230921153429.3822278-1-jani.nikula@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230921153429.3822278-1-jani.nikula@intel.com>
Date: Wed, 04 Oct 2023 15:55:34 +0300
Message-ID: <87y1gieed5.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 21 Sep 2023, Jani Nikula <jani.nikula@intel.com> wrote:
> Since the edid_firmware module parameter was moved from
> drm_kms_helper.ko to drm.ko in v4.15, we've had a backwards
> compatibility helper in place, with a DRM_NOTE() suggesting to migrate
> to drm.edid_firmware. This was added in commit ac6c35a4d8c7 ("drm: add
> backwards compatibility support for drm_kms_helper.edid_firmware").
>
> More than five years and 30+ kernel releases later, see if we could drop
> the backward compatibility. Leave some warnings in place for a while
> longer.

Dave, Daniel, thoughts?

BR,
Jani.

>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>  drivers/gpu/drm/drm_edid_load.c         | 16 ----------------
>  drivers/gpu/drm/drm_kms_helper_common.c | 11 ++++++-----
>  include/drm/drm_edid.h                  |  5 -----
>  3 files changed, 6 insertions(+), 26 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_edid_load.c b/drivers/gpu/drm/drm_edid_load.c
> index 5d9ef267ebb3..60fcb80bce61 100644
> --- a/drivers/gpu/drm/drm_edid_load.c
> +++ b/drivers/gpu/drm/drm_edid_load.c
> @@ -23,22 +23,6 @@ module_param_string(edid_firmware, edid_firmware, sizeof(edid_firmware), 0644);
>  MODULE_PARM_DESC(edid_firmware, "Do not probe monitor, use specified EDID blob "
>  	"from built-in data or /lib/firmware instead. ");
>  
> -/* Use only for backward compatibility with drm_kms_helper.edid_firmware */
> -int __drm_set_edid_firmware_path(const char *path)
> -{
> -	scnprintf(edid_firmware, sizeof(edid_firmware), "%s", path);
> -
> -	return 0;
> -}
> -EXPORT_SYMBOL(__drm_set_edid_firmware_path);
> -
> -/* Use only for backward compatibility with drm_kms_helper.edid_firmware */
> -int __drm_get_edid_firmware_path(char *buf, size_t bufsize)
> -{
> -	return scnprintf(buf, bufsize, "%s", edid_firmware);
> -}
> -EXPORT_SYMBOL(__drm_get_edid_firmware_path);
> -
>  #define GENERIC_EDIDS 6
>  static const char * const generic_edid_name[GENERIC_EDIDS] = {
>  	"edid/800x600.bin",
> diff --git a/drivers/gpu/drm/drm_kms_helper_common.c b/drivers/gpu/drm/drm_kms_helper_common.c
> index 0bf0fc1abf54..924e0f7bd5b7 100644
> --- a/drivers/gpu/drm/drm_kms_helper_common.c
> +++ b/drivers/gpu/drm/drm_kms_helper_common.c
> @@ -38,17 +38,18 @@ MODULE_LICENSE("GPL and additional rights");
>  
>  #if IS_ENABLED(CONFIG_DRM_LOAD_EDID_FIRMWARE)
>  
> -/* Backward compatibility for drm_kms_helper.edid_firmware */
>  static int edid_firmware_set(const char *val, const struct kernel_param *kp)
>  {
> -	DRM_NOTE("drm_kms_helper.edid_firmware is deprecated, please use drm.edid_firmware instead.\n");
> +	pr_warn("drm_kms_helper.edid_firmware has been removed, please use drm.edid_firmware instead.\n");
>  
> -	return __drm_set_edid_firmware_path(val);
> +	return -ENOENT;
>  }
>  
>  static int edid_firmware_get(char *buffer, const struct kernel_param *kp)
>  {
> -	return __drm_get_edid_firmware_path(buffer, PAGE_SIZE);
> +	pr_warn("drm_kms_helper.edid_firmware has been removed, please use drm.edid_firmware instead.\n");
> +
> +	return -ENOENT;
>  }
>  
>  static const struct kernel_param_ops edid_firmware_ops = {
> @@ -59,6 +60,6 @@ static const struct kernel_param_ops edid_firmware_ops = {
>  module_param_cb(edid_firmware, &edid_firmware_ops, NULL, 0644);
>  __MODULE_PARM_TYPE(edid_firmware, "charp");
>  MODULE_PARM_DESC(edid_firmware,
> -		 "DEPRECATED. Use drm.edid_firmware module parameter instead.");
> +		 "REMOVED. Use drm.edid_firmware module parameter instead.");
>  
>  #endif
> diff --git a/include/drm/drm_edid.h b/include/drm/drm_edid.h
> index 882d2638708e..00f0a778ab62 100644
> --- a/include/drm/drm_edid.h
> +++ b/include/drm/drm_edid.h
> @@ -387,11 +387,6 @@ int drm_edid_to_speaker_allocation(const struct edid *edid, u8 **sadb);
>  int drm_av_sync_delay(struct drm_connector *connector,
>  		      const struct drm_display_mode *mode);
>  
> -#ifdef CONFIG_DRM_LOAD_EDID_FIRMWARE
> -int __drm_set_edid_firmware_path(const char *path);
> -int __drm_get_edid_firmware_path(char *buf, size_t bufsize);
> -#endif
> -
>  bool drm_edid_are_equal(const struct edid *edid1, const struct edid *edid2);
>  
>  int

-- 
Jani Nikula, Intel
