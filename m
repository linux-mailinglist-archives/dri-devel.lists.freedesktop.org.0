Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A457BB51C0F
	for <lists+dri-devel@lfdr.de>; Wed, 10 Sep 2025 17:42:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CD0F10E956;
	Wed, 10 Sep 2025 15:42:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 4BBE810E956
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Sep 2025 15:42:36 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7ECEC16F2;
 Wed, 10 Sep 2025 08:42:27 -0700 (PDT)
Received: from [10.1.25.55] (e122027.cambridge.arm.com [10.1.25.55])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2DC6A3F694;
 Wed, 10 Sep 2025 08:42:33 -0700 (PDT)
Message-ID: <0627247d-4ab3-41c5-90ac-18912a96403b@arm.com>
Date: Wed, 10 Sep 2025 16:42:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] drm/panfrost: Introduce uAPI for JM context
 creation
To: =?UTF-8?Q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>,
 linux-kernel@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org,
 Boris Brezillon <boris.brezillon@collabora.com>, kernel@collabora.com,
 Rob Herring <robh@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
References: <20250904001054.147465-1-adrian.larumbe@collabora.com>
 <20250904001054.147465-2-adrian.larumbe@collabora.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <20250904001054.147465-2-adrian.larumbe@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

On 04/09/2025 01:07, Adrián Larumbe wrote:
> From: Boris Brezillon <boris.brezillon@collabora.com>
> 
> The new uAPI lets user space query the KM driver for the available
> priorities a job can be given at submit time. These are managed through
> the notion of a context, for which we also provide new creation and
> destruction ioctls.
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>

Reviewed-by: Steven Price <steven.price@arm.com>

> ---
>  include/uapi/drm/panfrost_drm.h | 50 +++++++++++++++++++++++++++++++++
>  1 file changed, 50 insertions(+)
> 
> diff --git a/include/uapi/drm/panfrost_drm.h b/include/uapi/drm/panfrost_drm.h
> index ed67510395bd..e8b47c9f6976 100644
> --- a/include/uapi/drm/panfrost_drm.h
> +++ b/include/uapi/drm/panfrost_drm.h
> @@ -22,6 +22,8 @@ extern "C" {
>  #define DRM_PANFROST_PERFCNT_DUMP		0x07
>  #define DRM_PANFROST_MADVISE			0x08
>  #define DRM_PANFROST_SET_LABEL_BO		0x09
> +#define DRM_PANFROST_JM_CTX_CREATE		0x0a
> +#define DRM_PANFROST_JM_CTX_DESTROY		0x0b
>  
>  #define DRM_IOCTL_PANFROST_SUBMIT		DRM_IOW(DRM_COMMAND_BASE + DRM_PANFROST_SUBMIT, struct drm_panfrost_submit)
>  #define DRM_IOCTL_PANFROST_WAIT_BO		DRM_IOW(DRM_COMMAND_BASE + DRM_PANFROST_WAIT_BO, struct drm_panfrost_wait_bo)
> @@ -31,6 +33,8 @@ extern "C" {
>  #define DRM_IOCTL_PANFROST_GET_BO_OFFSET	DRM_IOWR(DRM_COMMAND_BASE + DRM_PANFROST_GET_BO_OFFSET, struct drm_panfrost_get_bo_offset)
>  #define DRM_IOCTL_PANFROST_MADVISE		DRM_IOWR(DRM_COMMAND_BASE + DRM_PANFROST_MADVISE, struct drm_panfrost_madvise)
>  #define DRM_IOCTL_PANFROST_SET_LABEL_BO		DRM_IOWR(DRM_COMMAND_BASE + DRM_PANFROST_SET_LABEL_BO, struct drm_panfrost_set_label_bo)
> +#define DRM_IOCTL_PANFROST_JM_CTX_CREATE	DRM_IOWR(DRM_COMMAND_BASE + DRM_PANFROST_JM_CTX_CREATE, struct drm_panfrost_jm_ctx_create)
> +#define DRM_IOCTL_PANFROST_JM_CTX_DESTROY	DRM_IOWR(DRM_COMMAND_BASE + DRM_PANFROST_JM_CTX_DESTROY, struct drm_panfrost_jm_ctx_destroy)
>  
>  /*
>   * Unstable ioctl(s): only exposed when the unsafe unstable_ioctls module
> @@ -71,6 +75,12 @@ struct drm_panfrost_submit {
>  
>  	/** A combination of PANFROST_JD_REQ_* */
>  	__u32 requirements;
> +
> +	/** JM context handle. Zero if you want to use the default context. */
> +	__u32 jm_ctx_handle;
> +
> +	/** Padding field. MBZ. */
> +	__u32 pad;
>  };
>  
>  /**
> @@ -177,6 +187,7 @@ enum drm_panfrost_param {
>  	DRM_PANFROST_PARAM_AFBC_FEATURES,
>  	DRM_PANFROST_PARAM_SYSTEM_TIMESTAMP,
>  	DRM_PANFROST_PARAM_SYSTEM_TIMESTAMP_FREQUENCY,
> +	DRM_PANFROST_PARAM_ALLOWED_JM_CTX_PRIORITIES,
>  };
>  
>  struct drm_panfrost_get_param {
> @@ -299,6 +310,45 @@ struct panfrost_dump_registers {
>  	__u32 value;
>  };
>  
> +enum drm_panfrost_jm_ctx_priority {
> +	/**
> +	 * @PANFROST_JM_CTX_PRIORITY_LOW: Low priority context.
> +	 */
> +	PANFROST_JM_CTX_PRIORITY_LOW = 0,
> +
> +	/**
> +	 * @PANFROST_JM_CTX_PRIORITY_MEDIUM: Medium priority context.
> +	 */
> +	PANFROST_JM_CTX_PRIORITY_MEDIUM,
> +
> +	/**
> +	 * @PANFROST_JM_CTX_PRIORITY_HIGH: High priority context.
> +	 *
> +	 * Requires CAP_SYS_NICE or DRM_MASTER.
> +	 */
> +	PANFROST_JM_CTX_PRIORITY_HIGH,
> +};
> +
> +struct drm_panfrost_jm_ctx_create {
> +	/** @handle: Handle of the created JM context */
> +	__u32 handle;
> +
> +	/** @priority: Context priority (see enum drm_panfrost_jm_ctx_priority). */
> +	__u32 priority;
> +};
> +
> +struct drm_panfrost_jm_ctx_destroy {
> +	/**
> +	 * @handle: Handle of the JM context to destroy.
> +	 *
> +	 * Must be a valid context handle returned by DRM_IOCTL_PANTHOR_JM_CTX_CREATE.
> +	 */
> +	__u32 handle;
> +
> +	/** @pad: Padding field, MBZ. */
> +	__u32 pad;
> +};
> +
>  #if defined(__cplusplus)
>  }
>  #endif

