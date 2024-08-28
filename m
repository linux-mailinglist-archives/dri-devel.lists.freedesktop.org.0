Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E4EE5962252
	for <lists+dri-devel@lfdr.de>; Wed, 28 Aug 2024 10:31:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C172E10E3C5;
	Wed, 28 Aug 2024 08:31:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="K31rlQvD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12D4410E3C5
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Aug 2024 08:31:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724833885; x=1756369885;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=xJuZ+EJ94pLSsNkzA+mfLjJFjy+ge3Om+5ox8Q/Z4rY=;
 b=K31rlQvDwaUnoGDmfNcPiDUWehbKSYG1XlpdsD5gXtTO8dLA/4YT897x
 LAIV73Vrj4JR/Hb9TTROkuruFkoZghAWWGp8DyJKdQgE8NOjO53DJwYT1
 0Bbm1nU+Ri1Abz+0XBtK46js0BZ7hpz/BJFkpf6ziitIg96ugoi9xvWrQ
 HYLQeh8hVKgKr8vy/RokaqQ9gxAw6/lCV8Mr0Dq8qeN4/DquA9aMJnC+n
 MmRg/Z5NqR3Ad3ow7QDE9y7swY2yd7cHnHzMGPtI+XIvwSlxLAOPuy9+c
 TNHjVqGlJoHVLHdK+Bi48jqTKVW8SffnssavJcvmkygBgLSK9erR0eC6n A==;
X-CSE-ConnectionGUID: IWHmRov+SMeUhJEP2nNZrg==
X-CSE-MsgGUID: hfFSTNK8TxG3l1aiQdvP6w==
X-IronPort-AV: E=McAfee;i="6700,10204,11177"; a="13255676"
X-IronPort-AV: E=Sophos;i="6.10,182,1719903600"; d="scan'208";a="13255676"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2024 01:31:24 -0700
X-CSE-ConnectionGUID: eR2uKhlqSY6k0yuMgG2gSg==
X-CSE-MsgGUID: CKK6zCmsTDaHJ11r4Su9vA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,182,1719903600"; d="scan'208";a="67830578"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.246.110])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2024 01:31:21 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Derek Foreman <derek.foreman@collabora.com>,
 dri-devel@lists.freedesktop.org
Cc: Maxime Ripard <mripard@kernel.org>, kernel@collabora.com, Helge Deller
 <deller@gmx.de>, linux-fbdev@vger.kernel.org, Derek Foreman
 <derek.foreman@collabora.com>
Subject: Re: [PATCH v4] drm/connector: hdmi: Fix writing Dynamic Range
 Mastering infoframes
In-Reply-To: <20240827163918.48160-1-derek.foreman@collabora.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240827163918.48160-1-derek.foreman@collabora.com>
Date: Wed, 28 Aug 2024 11:31:15 +0300
Message-ID: <87cyltyros.fsf@intel.com>
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

On Tue, 27 Aug 2024, Derek Foreman <derek.foreman@collabora.com> wrote:
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
> MAX 27 bytes - which is defined by the HDMI specification to be the
> largest infoframe payload.
>
> Fixes: f378b77227bc ("drm/connector: hdmi: Add Infoframes generation")
> Fixes: c602e4959a0c ("drm/connector: hdmi: Create Infoframe DebugFS entries")
>

Superfluous blank line. Can be fixed while applying.

Reviewed-by: Jani Nikula <jani.nikula@intel.com>


> Signed-off-by: Derek Foreman <derek.foreman@collabora.com>
> ---
>  drivers/gpu/drm/display/drm_hdmi_state_helper.c | 4 +---
>  drivers/gpu/drm/drm_debugfs.c                   | 4 +---
>  include/linux/hdmi.h                            | 9 +++++++++
>  3 files changed, 11 insertions(+), 6 deletions(-)
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
> index 3bb87bf6bc65..455f855bc084 100644
> --- a/include/linux/hdmi.h
> +++ b/include/linux/hdmi.h
> @@ -59,6 +59,15 @@ enum hdmi_infoframe_type {
>  #define HDMI_DRM_INFOFRAME_SIZE    26
>  #define HDMI_VENDOR_INFOFRAME_SIZE  4
>  
> +/*
> + * HDMI 1.3a table 5-14 states that the largest InfoFrame_length is 27,
> + * not including the packet header or checksum byte. We include the
> + * checksum byte in HDMI_INFOFRAME_HEADER_SIZE, so this should allow
> + * HDMI_INFOFRAME_SIZE(MAX) to be the largest buffer we could ever need
> + * for any HDMI infoframe.
> + */
> +#define HDMI_MAX_INFOFRAME_SIZE    27
> +
>  #define HDMI_INFOFRAME_SIZE(type)	\
>  	(HDMI_INFOFRAME_HEADER_SIZE + HDMI_ ## type ## _INFOFRAME_SIZE)

-- 
Jani Nikula, Intel
