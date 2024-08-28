Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66458962B3F
	for <lists+dri-devel@lfdr.de>; Wed, 28 Aug 2024 17:08:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4E2E10E56F;
	Wed, 28 Aug 2024 15:08:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="i6634UzB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACBAB10E56F
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Aug 2024 15:08:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724857692; x=1756393692;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=bxF82gL7X9odamSqVR+Ny6CDw0IEU91RCpBvq6pdbPE=;
 b=i6634UzBvLdh8slh4WRQ9MlJ0FcWV/kdK03TlE/AVrEf7+UpNiS2b0yT
 UZ9n6oUmURFbBkrNwD7oVqMD9/zzDcAHBFUSgcQiOto9VurPLccxZARJI
 Oe6n5qTYyhNtUpCBu0rC3aGpafPM4BO8pQ9GmmJWtd0LTzmXs/asd1fN4
 JQjObFe+b45IbPJoNC0x91I7ApB6dZSy95U8+SL04fQEQIzGFiq19FLGK
 vMBYaZw12b9B/Q6yqC0hyV/L4xhCJmL8ENgbeadBIvkHYY2POPZHaBHqn
 xF6CTEjD0VZ6LhdHYaO2DVG5toGmyg5xRC5SFcQQSVs/titMIVg30DNmW Q==;
X-CSE-ConnectionGUID: ujemeRglQ5Kl33WmTVRHIQ==
X-CSE-MsgGUID: CePQ62ebTWmbpWxnIyW7UA==
X-IronPort-AV: E=McAfee;i="6700,10204,11178"; a="23353234"
X-IronPort-AV: E=Sophos;i="6.10,183,1719903600"; d="scan'208";a="23353234"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2024 08:08:12 -0700
X-CSE-ConnectionGUID: 3tsZuQ/bRHKZBM4yUOslTQ==
X-CSE-MsgGUID: e0pZOZEDTASN9xCyo5svrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,183,1719903600"; d="scan'208";a="68095820"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.246.110])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2024 08:08:09 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>, linux-media@vger.kernel.org
Cc: Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, Hans Verkuil
 <hverkuil-cisco@xs4all.nl>
Subject: Re: [PATCH 2/7] media: v4l2-core: add v4l2_debugfs_if_alloc/free()
In-Reply-To: <931a281c72e9c3081eaedc2d76806ebd770a0913.1724855053.git.hverkuil-cisco@xs4all.nl>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1724855053.git.hverkuil-cisco@xs4all.nl>
 <931a281c72e9c3081eaedc2d76806ebd770a0913.1724855053.git.hverkuil-cisco@xs4all.nl>
Date: Wed, 28 Aug 2024 18:08:03 +0300
Message-ID: <87jzg0y9bg.fsf@intel.com>
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

On Wed, 28 Aug 2024, Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:
> Add new helpers to export received or transmitted HDMI InfoFrames to
> debugfs.
>
> This complements similar code in drm where the transmitted HDMI infoframes
> are exported to debugfs.
>
> The same names have been used as in drm, so this is consistent.
>
> The exported infoframes can be parsed with the edid-decode utility.
>
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> ---
>  drivers/media/v4l2-core/v4l2-dv-timings.c | 63 +++++++++++++++++++++++
>  include/media/v4l2-dv-timings.h           | 48 +++++++++++++++++
>  2 files changed, 111 insertions(+)
>
> diff --git a/drivers/media/v4l2-core/v4l2-dv-timings.c b/drivers/media/v4l2-core/v4l2-dv-timings.c
> index 942d0005c55e..86a8627f4bcc 100644
> --- a/drivers/media/v4l2-core/v4l2-dv-timings.c
> +++ b/drivers/media/v4l2-core/v4l2-dv-timings.c
> @@ -1154,3 +1154,66 @@ int v4l2_phys_addr_validate(u16 phys_addr, u16 *parent, u16 *port)
>  	return 0;
>  }
>  EXPORT_SYMBOL_GPL(v4l2_phys_addr_validate);
> +
> +#ifdef CONFIG_DEBUG_FS
> +
> +#define DEBUGFS_FOPS(type, flag)					\
> +static ssize_t								\
> +infoframe_read_##type(struct file *filp,				\
> +		      char __user *ubuf, size_t count, loff_t *ppos)	\
> +{									\
> +	struct v4l2_debugfs_if *infoframes = filp->private_data;	\
> +									\
> +	return infoframes->if_read((flag), infoframes->priv, filp,	\
> +				   ubuf, count, ppos);			\
> +}									\
> +									\
> +static const struct file_operations infoframe_##type##_fops = {		\
> +	.owner   = THIS_MODULE,						\
> +	.open    = simple_open,						\
> +	.read    = infoframe_read_##type,				\
> +}
> +
> +DEBUGFS_FOPS(avi, V4L2_DEBUGFS_IF_AVI);
> +DEBUGFS_FOPS(audio, V4L2_DEBUGFS_IF_AUDIO);
> +DEBUGFS_FOPS(spd, V4L2_DEBUGFS_IF_SPD);
> +DEBUGFS_FOPS(hdmi, V4L2_DEBUGFS_IF_HDMI);
> +
> +struct v4l2_debugfs_if *v4l2_debugfs_if_alloc(struct dentry *root, u32 if_types,
> +					      void *priv,
> +					      v4l2_debugfs_if_read_t if_read)
> +{
> +	struct v4l2_debugfs_if *infoframes;
> +
> +	if (IS_ERR_OR_NULL(root) || !if_types || !if_read)
> +		return NULL;
> +
> +	infoframes = kzalloc(sizeof(*infoframes), GFP_KERNEL);
> +	if (!infoframes)
> +		return NULL;
> +
> +	infoframes->if_dir = debugfs_create_dir("infoframes", root);
> +	infoframes->priv = priv;
> +	infoframes->if_read = if_read;
> +	if (if_types & V4L2_DEBUGFS_IF_AVI)
> +		debugfs_create_file("avi", 0400, infoframes->if_dir, infoframes, &infoframe_avi_fops);
> +	if (if_types & V4L2_DEBUGFS_IF_AUDIO)
> +		debugfs_create_file("audio", 0400, infoframes->if_dir, infoframes, &infoframe_audio_fops);
> +	if (if_types & V4L2_DEBUGFS_IF_SPD)
> +		debugfs_create_file("spd", 0400, infoframes->if_dir, infoframes, &infoframe_spd_fops);
> +	if (if_types & V4L2_DEBUGFS_IF_HDMI)
> +		debugfs_create_file("hdmi", 0400, infoframes->if_dir, infoframes, &infoframe_hdmi_fops);
> +	return infoframes;
> +}
> +EXPORT_SYMBOL_GPL(v4l2_debugfs_if_alloc);
> +
> +void v4l2_debugfs_if_free(struct v4l2_debugfs_if *infoframes)
> +{
> +	if (infoframes) {
> +		debugfs_remove_recursive(infoframes->if_dir);
> +		kfree(infoframes);
> +	}
> +}
> +EXPORT_SYMBOL_GPL(v4l2_debugfs_if_free);
> +
> +#endif
> diff --git a/include/media/v4l2-dv-timings.h b/include/media/v4l2-dv-timings.h
> index 8fa963326bf6..13830411bd6c 100644
> --- a/include/media/v4l2-dv-timings.h
> +++ b/include/media/v4l2-dv-timings.h
> @@ -8,6 +8,7 @@
>  #ifndef __V4L2_DV_TIMINGS_H
>  #define __V4L2_DV_TIMINGS_H
>  
> +#include <linux/debugfs.h>

Please don't include headers from headers if you can get by with forward
declarations.

I recently discovered a lot of drm depending on getting seq_file.h and
debugfs.h via media/cec.h...

BR,
Jani.


>  #include <linux/videodev2.h>
>  
>  /**
> @@ -251,4 +252,51 @@ void v4l2_set_edid_phys_addr(u8 *edid, unsigned int size, u16 phys_addr);
>  u16 v4l2_phys_addr_for_input(u16 phys_addr, u8 input);
>  int v4l2_phys_addr_validate(u16 phys_addr, u16 *parent, u16 *port);
>  
> +/* Add support for exporting InfoFrames to debugfs */
> +
> +/*
> + * HDMI InfoFrames start with a 3 byte header, then a checksum,
> + * followed by the actual IF payload.
> + *
> + * The payload length is limited to 30 bytes according to the HDMI spec,
> + * but since the length is encoded in 5 bits, it can be 31 bytes theoretically.
> + * So set the max length as 31 + 3 (header) + 1 (checksum) = 35.
> + */
> +#define V4L2_DEBUGFS_IF_MAX_LEN (35)
> +
> +#define V4L2_DEBUGFS_IF_AVI	BIT(0)
> +#define V4L2_DEBUGFS_IF_AUDIO	BIT(1)
> +#define V4L2_DEBUGFS_IF_SPD	BIT(2)
> +#define V4L2_DEBUGFS_IF_HDMI	BIT(3)
> +
> +typedef ssize_t (*v4l2_debugfs_if_read_t)(u32 type, void *priv,
> +					  struct file *filp, char __user *ubuf,
> +					  size_t count, loff_t *ppos);
> +
> +struct v4l2_debugfs_if {
> +	struct dentry *if_dir;
> +	void *priv;
> +
> +	v4l2_debugfs_if_read_t if_read;
> +};
> +
> +#ifdef CONFIG_DEBUG_FS
> +struct v4l2_debugfs_if *v4l2_debugfs_if_alloc(struct dentry *root, u32 if_types,
> +					      void *priv,
> +					      v4l2_debugfs_if_read_t if_read);
> +void v4l2_debugfs_if_free(struct v4l2_debugfs_if *infoframes);
> +#else
> +static inline
> +struct v4l2_debugfs_if *v4l2_debugfs_if_alloc(struct dentry *root, u32 if_types,
> +					      void *priv,
> +					      v4l2_debugfs_if_read_t if_read)
> +{
> +	return NULL;
> +}
> +
> +static inline void v4l2_debugfs_if_free(struct v4l2_debugfs_if *infoframes)
> +{
> +}
> +#endif
> +
>  #endif

-- 
Jani Nikula, Intel
