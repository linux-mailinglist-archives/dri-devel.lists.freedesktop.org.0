Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F31B9BA7A0
	for <lists+dri-devel@lfdr.de>; Sun,  3 Nov 2024 20:21:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D870D10E0B9;
	Sun,  3 Nov 2024 19:21:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="QpGVCBwm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7B5910E0B9
 for <dri-devel@lists.freedesktop.org>; Sun,  3 Nov 2024 19:21:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=J/6SU1HJ8xE7gPw4eHrRzj+Uzo984l9Ml8YmT7mOWCA=; b=QpGVCBwm70MpQzjYakqZLSCsNt
 +t1aWpO8cdnbYHVG2oeBbo6ElQG8g7GGGpoBl1z2GUf8gHqYZTz4tb7k7pLIkppGRhEmhTlAKNhhG
 CLBvZmqFzPn/kYFUsY27ca0XNI7v/OTT35gJ8xsLN31DXkQuXV7oxrNEaT++JDNiZKZv2eZbviCS0
 TW0nih8DzCTOAW5oCPRtQyjzTyvNAhkyyZLSTolEE/FqVYLs5nizPE8ZYk8TZVkYU6WMZ3oZoK5O+
 g+e0sefYbeU/f+MgBaAKLeHL9F8+z9MaeJbgmMQJKn1Ftpw9urwwmIwlorfqx1QkaiNyDXITUPJ1G
 Ch1kwS5A==;
Received: from [187.36.213.55] (helo=[192.168.1.103])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1t7gAE-001Eiu-Bf; Sun, 03 Nov 2024 20:21:30 +0100
Message-ID: <4c3eeaf2-218a-451b-aa51-f0e9f4bef0d6@igalia.com>
Date: Sun, 3 Nov 2024 16:21:22 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/v3d: Add DRM_IOCTL_V3D_PERFMON_SET_GLOBAL
To: Christian Gmeiner <christian.gmeiner@gmail.com>,
 Melissa Wen <mwen@igalia.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: kernel-dev@igalia.com, Christian Gmeiner <cgmeiner@igalia.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20241031205140.541907-1-christian.gmeiner@gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
In-Reply-To: <20241031205140.541907-1-christian.gmeiner@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

Hi Christian,

Thanks for your patch! Just some small nits.

On 31/10/24 17:51, Christian Gmeiner wrote:
> From: Christian Gmeiner <cgmeiner@igalia.com>
> 
> Add a new ioctl, DRM_IOCTL_V3D_PERFMON_SET_GLOBAL, to allow
> configuration of a global performance monitor (perfmon).
> Use the global perfmon for all jobs to ensure consistent
> performance tracking across submissions.

I'd mention how this feature can be useful for user-space (for example,
the implementation of a Perfetto datasource).

> 
> Signed-off-by: Christian Gmeiner <cgmeiner@igalia.com>
> 
> ---
> Changes in v2:
> - Reworked commit message.
> - Removed num_perfmon counter for tracking perfmon allocations.
> - Allowing allocation of perfmons when the global perfmon is active.
> - Return -EAGAIN for submissions with a per job perfmon if the global perfmon is active.
> ---
>   drivers/gpu/drm/v3d/v3d_drv.c     |  1 +
>   drivers/gpu/drm/v3d/v3d_drv.h     |  8 ++++++++
>   drivers/gpu/drm/v3d/v3d_perfmon.c | 34 +++++++++++++++++++++++++++++++
>   drivers/gpu/drm/v3d/v3d_sched.c   | 14 ++++++++++---
>   drivers/gpu/drm/v3d/v3d_submit.c  | 10 +++++++++
>   include/uapi/drm/v3d_drm.h        | 15 ++++++++++++++
>   6 files changed, 79 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/v3d/v3d_drv.c b/drivers/gpu/drm/v3d/v3d_drv.c
> index d7ff1f5fa481..3c89f0daa5b8 100644
> --- a/drivers/gpu/drm/v3d/v3d_drv.c
> +++ b/drivers/gpu/drm/v3d/v3d_drv.c
> @@ -214,6 +214,7 @@ static const struct drm_ioctl_desc v3d_drm_ioctls[] = {
>   	DRM_IOCTL_DEF_DRV(V3D_PERFMON_GET_VALUES, v3d_perfmon_get_values_ioctl, DRM_RENDER_ALLOW),
>   	DRM_IOCTL_DEF_DRV(V3D_SUBMIT_CPU, v3d_submit_cpu_ioctl, DRM_RENDER_ALLOW | DRM_AUTH),
>   	DRM_IOCTL_DEF_DRV(V3D_PERFMON_GET_COUNTER, v3d_perfmon_get_counter_ioctl, DRM_RENDER_ALLOW),
> +	DRM_IOCTL_DEF_DRV(V3D_PERFMON_SET_GLOBAL, v3d_perfmon_set_global_ioctl, DRM_RENDER_ALLOW),
>   };
>   
>   static const struct drm_driver v3d_drm_driver = {
> diff --git a/drivers/gpu/drm/v3d/v3d_drv.h b/drivers/gpu/drm/v3d/v3d_drv.h
> index cf4b23369dc4..a0d920ec2b1d 100644
> --- a/drivers/gpu/drm/v3d/v3d_drv.h
> +++ b/drivers/gpu/drm/v3d/v3d_drv.h
> @@ -179,6 +179,12 @@ struct v3d_dev {
>   		u32 num_allocated;
>   		u32 pages_allocated;
>   	} bo_stats;
> +
> +	/* To support a performance analysis tool in user space, we require
> +	 * a single, globally configured performance monitor (perfmon) for
> +	 * all jobs.
> +	 */
> +	struct v3d_perfmon *global_perfmon;
>   };
>   
>   static inline struct v3d_dev *
> @@ -584,6 +590,8 @@ int v3d_perfmon_get_values_ioctl(struct drm_device *dev, void *data,
>   				 struct drm_file *file_priv);
>   int v3d_perfmon_get_counter_ioctl(struct drm_device *dev, void *data,
>   				  struct drm_file *file_priv);
> +int v3d_perfmon_set_global_ioctl(struct drm_device *dev, void *data,
> +				 struct drm_file *file_priv);
>   
>   /* v3d_sysfs.c */
>   int v3d_sysfs_init(struct device *dev);
> diff --git a/drivers/gpu/drm/v3d/v3d_perfmon.c b/drivers/gpu/drm/v3d/v3d_perfmon.c
> index 156be13ab2ef..bf42303c292b 100644
> --- a/drivers/gpu/drm/v3d/v3d_perfmon.c
> +++ b/drivers/gpu/drm/v3d/v3d_perfmon.c
> @@ -312,6 +312,9 @@ static int v3d_perfmon_idr_del(int id, void *elem, void *data)
>   	if (perfmon == v3d->active_perfmon)
>   		v3d_perfmon_stop(v3d, perfmon, false);
>   
> +	/* If the global perfmon is being destroyed, set it to NULL */
> +	cmpxchg(&v3d->global_perfmon, perfmon, NULL);
> +
>   	v3d_perfmon_put(perfmon);
>   
>   	return 0;
> @@ -451,3 +454,34 @@ int v3d_perfmon_get_counter_ioctl(struct drm_device *dev, void *data,
>   
>   	return 0;
>   }

[...]

> index 87fc5bb0a61e..709724fe28e6 100644
> --- a/include/uapi/drm/v3d_drm.h
> +++ b/include/uapi/drm/v3d_drm.h
> @@ -43,6 +43,7 @@ extern "C" {
>   #define DRM_V3D_PERFMON_GET_VALUES                0x0a
>   #define DRM_V3D_SUBMIT_CPU                        0x0b
>   #define DRM_V3D_PERFMON_GET_COUNTER               0x0c
> +#define DRM_V3D_PERFMON_SET_GLOBAL                0x0d
>   
>   #define DRM_IOCTL_V3D_SUBMIT_CL           DRM_IOWR(DRM_COMMAND_BASE + DRM_V3D_SUBMIT_CL, struct drm_v3d_submit_cl)
>   #define DRM_IOCTL_V3D_WAIT_BO             DRM_IOWR(DRM_COMMAND_BASE + DRM_V3D_WAIT_BO, struct drm_v3d_wait_bo)
> @@ -61,6 +62,8 @@ extern "C" {
>   #define DRM_IOCTL_V3D_SUBMIT_CPU          DRM_IOW(DRM_COMMAND_BASE + DRM_V3D_SUBMIT_CPU, struct drm_v3d_submit_cpu)
>   #define DRM_IOCTL_V3D_PERFMON_GET_COUNTER DRM_IOWR(DRM_COMMAND_BASE + DRM_V3D_PERFMON_GET_COUNTER, \
>   						   struct drm_v3d_perfmon_get_counter)
> +#define DRM_IOCTL_V3D_PERFMON_SET_GLOBAL  DRM_IOW(DRM_COMMAND_BASE + DRM_V3D_PERFMON_SET_GLOBAL, \
> +						   struct drm_v3d_perfmon_set_global)
>   
>   #define DRM_V3D_SUBMIT_CL_FLUSH_CACHE             0x01
>   #define DRM_V3D_SUBMIT_EXTENSION		  0x02
> @@ -765,6 +768,18 @@ struct drm_v3d_perfmon_get_counter {
>   	__u8 reserved[7];
>   };
>   
> +#define DRM_V3D_PERFMON_CLEAR_GLOBAL    0x0001
> +
> +/*

Please, use kernel-doc [1]. So, here is /**

[1] https://docs.kernel.org/doc-guide/kernel-doc.html

> + * struct drm_v3d_perfmon_set_global - ioctl to define a

The colunm width is 80.

> + * global performance counter that is used if a job has

s/counter/monitor

> + * not assigned one on its own.

This description isn't really precise. When the global performance
monitor is enabled, the job perfmon doesn't matter. Currently, we don't
even allow a job perfmon to be submitted, but if we did, the global
perfmon would be used even if the job had a perfmon.

Best Regards,
- Maíra

> + */
> +struct drm_v3d_perfmon_set_global {
> +	__u32 flags;
> +	__u32 id;
> +};
> +
>   #if defined(__cplusplus)
>   }
>   #endif

