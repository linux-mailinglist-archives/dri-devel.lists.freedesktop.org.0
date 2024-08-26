Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E8F995F647
	for <lists+dri-devel@lfdr.de>; Mon, 26 Aug 2024 18:18:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE48010E22B;
	Mon, 26 Aug 2024 16:18:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BIFQ/K2a";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D37A610E22B
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Aug 2024 16:18:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724689104; x=1756225104;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=FdlkCjD8XrEIoC7N9AW9ZPmGp2u2r0P+rfej/fGoCM0=;
 b=BIFQ/K2a2WThJYE9HoPKUtS4A/cXlPVSrJqpt2nwHYV5skkq2rJc1ic9
 3VMcg1T1h1d4qJZKu6KEQyPqAG6ySVI9Bq+WEtvbVxvFprFsQuk99YMBZ
 p78+Gr6uwl3sB3F1vtnITjwzIbUSfCyymTEeM/jWHPLo7OpvBOuF961ev
 MtlAddqVpI+THTOFsMtAxqv11G/glPl01nJSneqoguStDOBGapqi6OArN
 27i+s6xAaCoW1x4UiA8QMS/fHjUpaXPKICBHMTfBJeEM1m/OR1QjOrrKT
 qyx9J3+LIEwt6dNZCwWqH9pIa8RWLHDTan4psDkxg8ArvsRChiyxTkPa6 w==;
X-CSE-ConnectionGUID: u7+VAZGbRZeCDGyw+Tqmzg==
X-CSE-MsgGUID: n9w3CfKsRz+vFiFxA1CoHw==
X-IronPort-AV: E=McAfee;i="6700,10204,11176"; a="33787559"
X-IronPort-AV: E=Sophos;i="6.10,178,1719903600"; d="scan'208";a="33787559"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2024 09:18:23 -0700
X-CSE-ConnectionGUID: Hy22Te2UT66YPT1jOCT0GA==
X-CSE-MsgGUID: iTuyWEsYTnav5M4Xg7MfXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,178,1719903600"; d="scan'208";a="67461918"
Received: from sschumil-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.113])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2024 09:18:20 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Derek Foreman <derek.foreman@collabora.com>,
 dri-devel@lists.freedesktop.org, Helge Deller <deller@gmx.de>,
 linux-fbdev@vger.kernel.org
Cc: Maxime Ripard <mripard@kernel.org>, kernel@collabora.com, Derek Foreman
 <derek.foreman@collabora.com>
Subject: Re: [PATCH v3] drm/connector: hdmi: Fix writing Dynamic Range
 Mastering infoframes
In-Reply-To: <20240826121029.491976-1-derek.foreman@collabora.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240826121029.491976-1-derek.foreman@collabora.com>
Date: Mon, 26 Aug 2024 19:18:08 +0300
Message-ID: <87cylv1cn3.fsf@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 26 Aug 2024, Derek Foreman <derek.foreman@collabora.com> wrote:
> The largest infoframe we create is the DRM (Dynamic Range Mastering)
> infoframe which is 26 bytes + a 4 byte header, for a total of 30
> bytes.
>
> With HDMI_MAX_INFOFRAME_SIZE set to 29 bytes, as it is now, we
> allocate too little space to pack a DRM infoframe in
> write_device_infoframe(), leading to an ENOSPC return from
> hdmi_infoframe_pack(), and never calling the connector's
> write_infoframe() vfunc.
>
> Instead of having HDMI_MAX_INFOFRAME_SIZE defined in two places,
> replace HDMI_MAX_INFOFRAME_SIZE with HDMI_INFOFRAME_SIZE(MAX) and make
> MAX the same size as the DRM infoframe.

Fixes: f378b77227bc ("drm/connector: hdmi: Add Infoframes generation")
Fixes: c602e4959a0c ("drm/connector: hdmi: Create Infoframe DebugFS entries")
Reviewed-by: Jani Nikula <jani.nikula@intel.com>

> Signed-off-by: Derek Foreman <derek.foreman@collabora.com>
> ---
>  drivers/gpu/drm/display/drm_hdmi_state_helper.c | 4 +---
>  drivers/gpu/drm/drm_debugfs.c                   | 4 +---
>  include/linux/hdmi.h                            | 3 +++

This file doesn't actually have a MAINTAINERS entry, Cc: Helge and
linux-fbdev for good measure because it really corresponds to
drivers/video/hdmi.c. But it's benign, should be fine to merge via
drm-misc.

BR,
Jani.


>  3 files changed, 5 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/display/drm_hdmi_state_helper.c b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
> index 7854820089ec..feb7a3a75981 100644
> --- a/drivers/gpu/drm/display/drm_hdmi_state_helper.c
> +++ b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
> @@ -521,8 +521,6 @@ int drm_atomic_helper_connector_hdmi_check(struct drm_connector *connector,
>  }
>  EXPORT_SYMBOL(drm_atomic_helper_connector_hdmi_check);
>  
> -#define HDMI_MAX_INFOFRAME_SIZE		29
> -
>  static int clear_device_infoframe(struct drm_connector *connector,
>  				  enum hdmi_infoframe_type type)
>  {
> @@ -563,7 +561,7 @@ static int write_device_infoframe(struct drm_connector *connector,
>  {
>  	const struct drm_connector_hdmi_funcs *funcs = connector->hdmi.funcs;
>  	struct drm_device *dev = connector->dev;
> -	u8 buffer[HDMI_MAX_INFOFRAME_SIZE];
> +	u8 buffer[HDMI_INFOFRAME_SIZE(MAX)];
>  	int ret;
>  	int len;
>  
> diff --git a/drivers/gpu/drm/drm_debugfs.c b/drivers/gpu/drm/drm_debugfs.c
> index 6b239a24f1df..9d3e6dd68810 100644
> --- a/drivers/gpu/drm/drm_debugfs.c
> +++ b/drivers/gpu/drm/drm_debugfs.c
> @@ -520,8 +520,6 @@ static const struct file_operations drm_connector_fops = {
>  	.write = connector_write
>  };
>  
> -#define HDMI_MAX_INFOFRAME_SIZE		29
> -
>  static ssize_t
>  audio_infoframe_read(struct file *filp, char __user *ubuf, size_t count, loff_t *ppos)
>  {
> @@ -579,7 +577,7 @@ static ssize_t _f##_read_infoframe(struct file *filp, \
>  	struct drm_connector *connector; \
>  	union hdmi_infoframe *frame; \
>  	struct drm_device *dev; \
> -	u8 buf[HDMI_MAX_INFOFRAME_SIZE]; \
> +	u8 buf[HDMI_INFOFRAME_SIZE(MAX)]; \
>  	ssize_t len = 0; \
>  	\
>  	connector = filp->private_data; \
> diff --git a/include/linux/hdmi.h b/include/linux/hdmi.h
> index 3bb87bf6bc65..3a442a59919e 100644
> --- a/include/linux/hdmi.h
> +++ b/include/linux/hdmi.h
> @@ -59,6 +59,9 @@ enum hdmi_infoframe_type {
>  #define HDMI_DRM_INFOFRAME_SIZE    26
>  #define HDMI_VENDOR_INFOFRAME_SIZE  4
>  
> +/* The biggest infoframe size */
> +#define HDMI_MAX_INFOFRAME_SIZE		HDMI_DRM_INFOFRAME_SIZE
> +
>  #define HDMI_INFOFRAME_SIZE(type)	\
>  	(HDMI_INFOFRAME_HEADER_SIZE + HDMI_ ## type ## _INFOFRAME_SIZE)

-- 
Jani Nikula, Intel
