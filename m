Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14A6995EC52
	for <lists+dri-devel@lfdr.de>; Mon, 26 Aug 2024 10:48:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E482A10E159;
	Mon, 26 Aug 2024 08:48:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="P+ow5oZZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8968110E159
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Aug 2024 08:48:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724662130; x=1756198130;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=ivDrXDjZCvz0itNYQSrMVAf6h59DsHsxfzGPHAE7xRY=;
 b=P+ow5oZZ68klKh5xL+XuXF8if+pCMoq10lPWllqzpMAiRfIFjDhQg7oA
 4T4e1ByRM/pgSL1LlV3pUKV7OnkwiDtkzvSqbyFMJaC13+9Npbuc2TCV7
 rR+8eaz5dWt3bOeDXtDXXVTVccyMvIpKhBn8WSaVliK2TrYgmOXQ9WdJE
 9QjdTWQkQqInYkuQnJnsMOlnL2MdykBU1RRosfj9/LuXDYRfy9P1diK1H
 h/c4mVUkUApmrHbXHt5QsyOdiGWSrc0V/j/9inPg38PcQSHm15rJSI24/
 XLiX72iPuapbjLBbCLSjv/+mdshGhwW6/1nFFgSPCNr2+WPsPF1MXjDXD Q==;
X-CSE-ConnectionGUID: I/fxiJOOSEmufjnybteOwQ==
X-CSE-MsgGUID: hqCYA7GzQZSjHqdTHwmG/Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11175"; a="33637142"
X-IronPort-AV: E=Sophos;i="6.10,177,1719903600"; d="scan'208";a="33637142"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2024 01:48:50 -0700
X-CSE-ConnectionGUID: 0vx/ju4ORuSGax8Dbe0qCg==
X-CSE-MsgGUID: 50Dv08qmT8OMDmfHS1js4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,177,1719903600"; d="scan'208";a="62139246"
Received: from sschumil-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.113])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2024 01:48:47 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Derek Foreman <derek.foreman@collabora.com>,
 dri-devel@lists.freedesktop.org
Cc: Maxime Ripard <mripard@kernel.org>, kernel@collabora.com, Derek Foreman
 <derek.foreman@collabora.com>
Subject: Re: [PATCH v2] drm/connector: hdmi: Increase
 HDMI_MAX_INFOFRAME_SIZE to 30
In-Reply-To: <20240823164621.385651-1-derek.foreman@collabora.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240823164621.385651-1-derek.foreman@collabora.com>
Date: Mon, 26 Aug 2024 11:48:34 +0300
Message-ID: <87bk1f3c0t.fsf@intel.com>
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

On Fri, 23 Aug 2024, Derek Foreman <derek.foreman@collabora.com> wrote:
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
> Increase HDMI_MAX_INFOFRAME_SIZE to 30 so we can successfully
> write DRM infoframes.
>
> The drm_debugfs code is similarly updated.
>
> Signed-off-by: Derek Foreman <derek.foreman@collabora.com>

Okay, thanks for the info. Looking into it, I think keeping this in two
places and disconnected from the actual infoframe size definitions is
hard to maintain. Maybe something like this:


diff --git a/drivers/gpu/drm/display/drm_hdmi_state_helper.c b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
index 7854820089ec..feb7a3a75981 100644
--- a/drivers/gpu/drm/display/drm_hdmi_state_helper.c
+++ b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
@@ -521,8 +521,6 @@ int drm_atomic_helper_connector_hdmi_check(struct drm_connector *connector,
 }
 EXPORT_SYMBOL(drm_atomic_helper_connector_hdmi_check);
 
-#define HDMI_MAX_INFOFRAME_SIZE		29
-
 static int clear_device_infoframe(struct drm_connector *connector,
 				  enum hdmi_infoframe_type type)
 {
@@ -563,7 +561,7 @@ static int write_device_infoframe(struct drm_connector *connector,
 {
 	const struct drm_connector_hdmi_funcs *funcs = connector->hdmi.funcs;
 	struct drm_device *dev = connector->dev;
-	u8 buffer[HDMI_MAX_INFOFRAME_SIZE];
+	u8 buffer[HDMI_INFOFRAME_SIZE(MAX)];
 	int ret;
 	int len;
 
diff --git a/drivers/gpu/drm/drm_debugfs.c b/drivers/gpu/drm/drm_debugfs.c
index 6b239a24f1df..9d3e6dd68810 100644
--- a/drivers/gpu/drm/drm_debugfs.c
+++ b/drivers/gpu/drm/drm_debugfs.c
@@ -520,8 +520,6 @@ static const struct file_operations drm_connector_fops = {
 	.write = connector_write
 };
 
-#define HDMI_MAX_INFOFRAME_SIZE		29
-
 static ssize_t
 audio_infoframe_read(struct file *filp, char __user *ubuf, size_t count, loff_t *ppos)
 {
@@ -579,7 +577,7 @@ static ssize_t _f##_read_infoframe(struct file *filp, \
 	struct drm_connector *connector; \
 	union hdmi_infoframe *frame; \
 	struct drm_device *dev; \
-	u8 buf[HDMI_MAX_INFOFRAME_SIZE]; \
+	u8 buf[HDMI_INFOFRAME_SIZE(MAX)]; \
 	ssize_t len = 0; \
 	\
 	connector = filp->private_data; \
diff --git a/include/linux/hdmi.h b/include/linux/hdmi.h
index 3bb87bf6bc65..3a442a59919e 100644
--- a/include/linux/hdmi.h
+++ b/include/linux/hdmi.h
@@ -59,6 +59,9 @@ enum hdmi_infoframe_type {
 #define HDMI_DRM_INFOFRAME_SIZE    26
 #define HDMI_VENDOR_INFOFRAME_SIZE  4
 
+/* The biggest infoframe size */
+#define HDMI_MAX_INFOFRAME_SIZE		HDMI_DRM_INFOFRAME_SIZE
+
 #define HDMI_INFOFRAME_SIZE(type)	\
 	(HDMI_INFOFRAME_HEADER_SIZE + HDMI_ ## type ## _INFOFRAME_SIZE)
 



> ---
>  drivers/gpu/drm/display/drm_hdmi_state_helper.c | 2 +-
>  drivers/gpu/drm/drm_debugfs.c                   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/display/drm_hdmi_state_helper.c b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
> index 7854820089ec..cc7747d33fdf 100644
> --- a/drivers/gpu/drm/display/drm_hdmi_state_helper.c
> +++ b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
> @@ -521,7 +521,7 @@ int drm_atomic_helper_connector_hdmi_check(struct drm_connector *connector,
>  }
>  EXPORT_SYMBOL(drm_atomic_helper_connector_hdmi_check);
>  
> -#define HDMI_MAX_INFOFRAME_SIZE		29
> +#define HDMI_MAX_INFOFRAME_SIZE		30
>  
>  static int clear_device_infoframe(struct drm_connector *connector,
>  				  enum hdmi_infoframe_type type)
> diff --git a/drivers/gpu/drm/drm_debugfs.c b/drivers/gpu/drm/drm_debugfs.c
> index 6b239a24f1df..3439fd65275a 100644
> --- a/drivers/gpu/drm/drm_debugfs.c
> +++ b/drivers/gpu/drm/drm_debugfs.c
> @@ -520,7 +520,7 @@ static const struct file_operations drm_connector_fops = {
>  	.write = connector_write
>  };
>  
> -#define HDMI_MAX_INFOFRAME_SIZE		29
> +#define HDMI_MAX_INFOFRAME_SIZE		30
>  
>  static ssize_t
>  audio_infoframe_read(struct file *filp, char __user *ubuf, size_t count, loff_t *ppos)

-- 
Jani Nikula, Intel
