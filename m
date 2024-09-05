Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 00C2396DE91
	for <lists+dri-devel@lfdr.de>; Thu,  5 Sep 2024 17:41:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1105D10E90A;
	Thu,  5 Sep 2024 15:41:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 14B8C10E90A
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Sep 2024 15:41:39 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 48C62FEC;
 Thu,  5 Sep 2024 08:42:05 -0700 (PDT)
Received: from [10.1.29.28] (e122027.cambridge.arm.com [10.1.29.28])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 00E903F73B;
 Thu,  5 Sep 2024 08:41:36 -0700 (PDT)
Message-ID: <2c89fc85-9132-4d78-b9d7-8a317e858686@arm.com>
Date: Thu, 5 Sep 2024 16:41:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/panthor: Add DEV_QUERY_GROUP_PRIORITIES_INFO dev
 query
To: Mary Guillemard <mary.guillemard@collabora.com>,
 linux-kernel@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Christopher Healy <healych@amazon.com>, kernel@collabora.com,
 Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
References: <20240905111338.95714-1-mary.guillemard@collabora.com>
 <20240905111338.95714-3-mary.guillemard@collabora.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <20240905111338.95714-3-mary.guillemard@collabora.com>
Content-Type: text/plain; charset=UTF-8
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 05/09/2024 12:13, Mary Guillemard wrote:
> Expose allowed group priorities with a new device query.
> 
> This new uAPI will be used in Mesa to properly report what priorities a
> user can use for EGL_IMG_context_priority.
> 
> Since this extends the uAPI and because userland needs a way to
> advertise priorities accordingly, this also bumps the driver minor
> version.
> 
> Signed-off-by: Mary Guillemard <mary.guillemard@collabora.com>

Minor nit below, but otherwise looks good.

> ---
>  drivers/gpu/drm/panthor/panthor_drv.c | 61 ++++++++++++++++++---------
>  include/uapi/drm/panthor_drm.h        | 38 +++++++++++++++++
>  2 files changed, 80 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_drv.c b/drivers/gpu/drm/panthor/panthor_drv.c
> index 7b1db2adcb4c..f85aa2d99f09 100644
> --- a/drivers/gpu/drm/panthor/panthor_drv.c
> +++ b/drivers/gpu/drm/panthor/panthor_drv.c
> @@ -170,6 +170,7 @@ panthor_get_uobj_array(const struct drm_panthor_obj_array *in, u32 min_stride,
>  		 PANTHOR_UOBJ_DECL(struct drm_panthor_gpu_info, tiler_present), \
>  		 PANTHOR_UOBJ_DECL(struct drm_panthor_csif_info, pad), \
>  		 PANTHOR_UOBJ_DECL(struct drm_panthor_timestamp_info, current_timestamp), \
> +		 PANTHOR_UOBJ_DECL(struct drm_panthor_group_priorities_info, pad), \
>  		 PANTHOR_UOBJ_DECL(struct drm_panthor_sync_op, timeline_value), \
>  		 PANTHOR_UOBJ_DECL(struct drm_panthor_queue_submit, syncs), \
>  		 PANTHOR_UOBJ_DECL(struct drm_panthor_queue_create, ringbuf_size), \
> @@ -777,11 +778,41 @@ static int panthor_query_timestamp_info(struct panthor_device *ptdev,
>  	return 0;
>  }
>  
> +static int group_priority_permit(struct drm_file *file,
> +				 u8 priority)
> +{
> +	/* Ensure that priority is valid */
> +	if (priority > PANTHOR_GROUP_PRIORITY_REALTIME)
> +		return -EINVAL;
> +
> +	/* Medium priority and below are always allowed */
> +	if (priority <= PANTHOR_GROUP_PRIORITY_MEDIUM)
> +		return 0;
> +
> +	/* Higher priorities require CAP_SYS_NICE or DRM_MASTER */
> +	if (capable(CAP_SYS_NICE) || drm_is_current_master(file))
> +		return 0;
> +
> +	return -EACCES;
> +}
> +
> +static void panthor_query_group_priorities_info(struct drm_file *file,
> +						struct drm_panthor_group_priorities_info *arg)
> +{
> +	int prio;
> +
> +	for (prio = PANTHOR_GROUP_PRIORITY_REALTIME; prio >= 0; prio--) {
> +		if (!group_priority_permit(file, prio))
> +			arg->allowed_mask |= 1 << prio;
> +	}
> +}
> +
>  static int panthor_ioctl_dev_query(struct drm_device *ddev, void *data, struct drm_file *file)
>  {
>  	struct panthor_device *ptdev = container_of(ddev, struct panthor_device, base);
>  	struct drm_panthor_dev_query *args = data;
>  	struct drm_panthor_timestamp_info timestamp_info;
> +	struct drm_panthor_group_priorities_info priorities_info;
>  	int ret;
>  
>  	if (!args->pointer) {
> @@ -798,6 +829,10 @@ static int panthor_ioctl_dev_query(struct drm_device *ddev, void *data, struct d
>  			args->size = sizeof(timestamp_info);
>  			return 0;
>  
> +		case DRM_PANTHOR_DEV_QUERY_GROUP_PRIORITIES_INFO:
> +			args->size = sizeof(priorities_info);
> +			return 0;
> +
>  		default:
>  			return -EINVAL;
>  		}
> @@ -818,6 +853,10 @@ static int panthor_ioctl_dev_query(struct drm_device *ddev, void *data, struct d
>  
>  		return PANTHOR_UOBJ_SET(args->pointer, args->size, timestamp_info);
>  
> +	case DRM_PANTHOR_DEV_QUERY_GROUP_PRIORITIES_INFO:
> +		panthor_query_group_priorities_info(file, &priorities_info);
> +		return PANTHOR_UOBJ_SET(args->pointer, args->size, priorities_info);
> +
>  	default:
>  		return -EINVAL;
>  	}
> @@ -1037,24 +1076,6 @@ static int panthor_ioctl_group_destroy(struct drm_device *ddev, void *data,
>  	return panthor_group_destroy(pfile, args->group_handle);
>  }
>  
> -static int group_priority_permit(struct drm_file *file,
> -				 u8 priority)
> -{
> -	/* Ensure that priority is valid */
> -	if (priority > PANTHOR_GROUP_PRIORITY_REALTIME)
> -		return -EINVAL;
> -
> -	/* Medium priority and below are always allowed */
> -	if (priority <= PANTHOR_GROUP_PRIORITY_MEDIUM)
> -		return 0;
> -
> -	/* Higher priorities require CAP_SYS_NICE or DRM_MASTER */
> -	if (capable(CAP_SYS_NICE) || drm_is_current_master(file))
> -		return 0;
> -
> -	return -EACCES;
> -}
> -
>  static int panthor_ioctl_group_create(struct drm_device *ddev, void *data,
>  				      struct drm_file *file)
>  {
> @@ -1436,6 +1457,8 @@ static void panthor_debugfs_init(struct drm_minor *minor)
>   * PanCSF driver version:
>   * - 1.0 - initial interface
>   * - 1.1 - adds DEV_QUERY_TIMESTAMP_INFO query
> + * - 1.2 - adds DEV_QUERY_GROUP_PRIORITIES_INFO query
> + *       - adds PANTHOR_GROUP_PRIORITY_REALTIME priority
>   */
>  static const struct drm_driver panthor_drm_driver = {
>  	.driver_features = DRIVER_RENDER | DRIVER_GEM | DRIVER_SYNCOBJ |
> @@ -1449,7 +1472,7 @@ static const struct drm_driver panthor_drm_driver = {
>  	.desc = "Panthor DRM driver",
>  	.date = "20230801",
>  	.major = 1,
> -	.minor = 1,
> +	.minor = 2,
>  
>  	.gem_create_object = panthor_gem_create_object,
>  	.gem_prime_import_sg_table = drm_gem_shmem_prime_import_sg_table,
> diff --git a/include/uapi/drm/panthor_drm.h b/include/uapi/drm/panthor_drm.h
> index 011a555e4674..520c467f946d 100644
> --- a/include/uapi/drm/panthor_drm.h
> +++ b/include/uapi/drm/panthor_drm.h
> @@ -263,6 +263,11 @@ enum drm_panthor_dev_query_type {
>  
>  	/** @DRM_PANTHOR_DEV_QUERY_TIMESTAMP_INFO: Query timestamp information. */
>  	DRM_PANTHOR_DEV_QUERY_TIMESTAMP_INFO,
> +
> +	/**
> +	 * @DRM_PANTHOR_DEV_QUERY_GROUP_PRIORITIES_INFO: Query allowed group priorities information.
> +	 */
> +	DRM_PANTHOR_DEV_QUERY_GROUP_PRIORITIES_INFO,
>  };
>  
>  /**
> @@ -399,6 +404,39 @@ struct drm_panthor_timestamp_info {
>  	__u64 timestamp_offset;
>  };
>  
> +/**
> + * enum drm_panthor_allowed_group_priority - Allowed group priority flags
> + */
> +enum drm_panthor_group_allow_priority_flags {
> +	/** @PANTHOR_GROUP_ALLOW_PRIORITY_LOW: Allow low priority group. */
> +	PANTHOR_GROUP_ALLOW_PRIORITY_LOW = 1 << 0,
> +
> +	/** @PANTHOR_GROUP_ALLOW_PRIORITY_MEDIUM: Allow medium priority group. */
> +	PANTHOR_GROUP_ALLOW_PRIORITY_MEDIUM = 1 << 1,
> +
> +	/** @PANTHOR_GROUP_ALLOW_PRIORITY_HIGH: Allow high priority group. */
> +	PANTHOR_GROUP_ALLOW_PRIORITY_HIGH = 1 << 2,
> +
> +	/** @PANTHOR_GROUP_ALLOW_PRIORITY_REALTIME: Allow realtime priority group. */
> +	PANTHOR_GROUP_ALLOW_PRIORITY_REALTIME = 1 << 3,
> +};

It would be good to reference the existing priority enums rather than
adding magic numbers. So:

PANTHOR_GROUP_ALLOW_PRIORITY_LOW = (1 << PANTHOR_GROUP_PRIORITY_LOW)

etc

Although I'd also be very tempted not to include this enum at all and
just add a explanation below that the bits in allowed_mask refer to the
corresponding bits from drm_panthor_group_priority. Personally if I was
writing code to check this I'd want to write something like:

if (allowed_mask & BIT(PANTHOR_GROUP_PRIORITY_HIGH))

Steve

> +
> +/**
> + * struct drm_panthor_group_priorities_info - Group priorities information
> + *
> + * Structure grouping all queryable information relating to the allowed group priorities.
> + */
> +struct drm_panthor_group_priorities_info {
> +	/**
> +	 * @allowed_mask: A mask of drm_panthor_group_allow_priority_flags flags containing the
> +	 * allowed group priorities.
> +	 */
> +	__u8 allowed_mask;
> +
> +	/** @pad: Padding fields, MBZ. */
> +	__u8 pad[3];
> +};
> +
>  /**
>   * struct drm_panthor_dev_query - Arguments passed to DRM_PANTHOR_IOCTL_DEV_QUERY
>   */

