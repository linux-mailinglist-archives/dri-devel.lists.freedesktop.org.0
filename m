Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D114B95CD8C
	for <lists+dri-devel@lfdr.de>; Fri, 23 Aug 2024 15:15:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 448B210EA99;
	Fri, 23 Aug 2024 13:15:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=boris.brezillon@collabora.com header.b="Mp70CWP7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3BE910E828
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Aug 2024 13:15:47 +0000 (UTC)
Delivered-To: daniel.almeida@collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1724418946; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=cd3xSoD3IjX74gVNZbUc2Ehc4GTHGd2A6Nignz8UqhEFkcvoW4TXVMgN5vNVvZFoESO5MiGMkBeVvOq/Uly/WNyQy05Zu6w3UWGX51N8qYANGIvwAwuN0Z3Wf8/2WEJpiTRkVSh6ofOL33qLztEwa/TiHyhTLdpjWvTbAbQYx7I=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1724418946;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=bIOzjUb5MLRVm8nptIqhgliQ+vrgbIOHPw3AvGvE9rY=; 
 b=G1PGLhlwSorowQJTRCbSyNoOsD3Fv1fV00k51GP+snaHg/NeLe+zBiZfbtGPGCdWF7meDSmTEwCtXLLYPZvUZCk9EelVrHddwFugugjHGS1UDnl5ljc0ZRmqaXZliAj/G1GkKQ0e01MJ9xA1U2QDUWE4j1T8NTAVYnbiq9Oi708=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=boris.brezillon@collabora.com;
 dmarc=pass header.from=<boris.brezillon@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1724418946; 
 s=zohomail; d=collabora.com; i=boris.brezillon@collabora.com; 
 h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=bIOzjUb5MLRVm8nptIqhgliQ+vrgbIOHPw3AvGvE9rY=;
 b=Mp70CWP7T39pzvYYY98jbBji1E5CrZHBVhNvZq9vHiGcz7ktu6e9bRU/pcUnUjQg
 fI6gCW74p0hodJ+Fu8B6YHUjVl61EIcjwPwHjE/C+tAFQzaVB1ckA1fMfk/txqCmWZh
 x0JTah6xJhx0ZDWwdyimfTt4xKrMcpz3CLs9Vwfg=
Received: by mx.zohomail.com with SMTPS id 1724418943978468.99591708195624;
 Fri, 23 Aug 2024 06:15:43 -0700 (PDT)
Date: Fri, 23 Aug 2024 15:15:34 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: liviu.dudau@arm.com, steven.price@arm.com, carsten.haitzler@arm.com,
 robh@kernel.org, faith.ekstrand@collabora.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 RESEND 1/5] drm: panthor: expose some fw information
 through the query ioctl
Message-ID: <20240823151534.6e2f7f42@collabora.com>
In-Reply-To: <20240821143826.3720-2-daniel.almeida@collabora.com>
References: <20240710225011.275153-1-daniel.almeida@collabora.com>
 <20240821143826.3720-1-daniel.almeida@collabora.com>
 <20240821143826.3720-2-daniel.almeida@collabora.com>
Organization: Collabora
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External
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

On Wed, 21 Aug 2024 11:37:27 -0300
Daniel Almeida <daniel.almeida@collabora.com> wrote:

> This is of interest to userspace, and similar in nature to the GPU
> and CSIF information we already return in the query ioctl.
> 
> Signed-off-by: Daniel Almeida <daniel.almeida@collabora.com>
> ---
>  drivers/gpu/drm/panthor/panthor_device.h |  3 +++
>  drivers/gpu/drm/panthor/panthor_drv.c    |  8 ++++++++
>  drivers/gpu/drm/panthor/panthor_sched.c  |  5 +++++
>  include/uapi/drm/panthor_drm.h           | 19 +++++++++++++++++++
>  4 files changed, 35 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_device.h b/drivers/gpu/drm/panthor/panthor_device.h
> index e388c0472ba7..224c53dcfe6d 100644
> --- a/drivers/gpu/drm/panthor/panthor_device.h
> +++ b/drivers/gpu/drm/panthor/panthor_device.h
> @@ -100,6 +100,9 @@ struct panthor_device {
>  	/** @csif_info: Command stream interface information. */
>  	struct drm_panthor_csif_info csif_info;
>  
> +	/** @fw_info: Firmware info for the global interface */
> +	struct drm_panthor_fw_info fw_info;
> +
>  	/** @gpu: GPU management data. */
>  	struct panthor_gpu *gpu;
>  
> diff --git a/drivers/gpu/drm/panthor/panthor_drv.c b/drivers/gpu/drm/panthor/panthor_drv.c
> index b8a84f26b3ef..fb30e119d9bf 100644
> --- a/drivers/gpu/drm/panthor/panthor_drv.c
> +++ b/drivers/gpu/drm/panthor/panthor_drv.c
> @@ -164,6 +164,7 @@ panthor_get_uobj_array(const struct drm_panthor_obj_array *in, u32 min_stride,
>  	_Generic(_obj_name, \
>  		 PANTHOR_UOBJ_DECL(struct drm_panthor_gpu_info, tiler_present), \
>  		 PANTHOR_UOBJ_DECL(struct drm_panthor_csif_info, pad), \
> +		 PANTHOR_UOBJ_DECL(struct drm_panthor_fw_info, instr_features), \
>  		 PANTHOR_UOBJ_DECL(struct drm_panthor_sync_op, timeline_value), \
>  		 PANTHOR_UOBJ_DECL(struct drm_panthor_queue_submit, syncs), \
>  		 PANTHOR_UOBJ_DECL(struct drm_panthor_queue_create, ringbuf_size), \
> @@ -765,6 +766,10 @@ static int panthor_ioctl_dev_query(struct drm_device *ddev, void *data, struct d
>  			args->size = sizeof(ptdev->csif_info);
>  			return 0;
>  
> +		case DRM_PANTHOR_DEV_QUERY_FW_INFO:
> +			args->size = sizeof(ptdev->fw_info);
> +			return 0;
> +
>  		default:
>  			return -EINVAL;
>  		}
> @@ -777,6 +782,9 @@ static int panthor_ioctl_dev_query(struct drm_device *ddev, void *data, struct d
>  	case DRM_PANTHOR_DEV_QUERY_CSIF_INFO:
>  		return PANTHOR_UOBJ_SET(args->pointer, args->size, ptdev->csif_info);
>  
> +	case DRM_PANTHOR_DEV_QUERY_FW_INFO:
> +		return PANTHOR_UOBJ_SET(args->pointer, args->size, ptdev->fw_info);
> +
>  	default:
>  		return -EINVAL;
>  	}
> diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
> index 79ffcbc41d78..e0ecc8bcfaae 100644
> --- a/drivers/gpu/drm/panthor/panthor_sched.c
> +++ b/drivers/gpu/drm/panthor/panthor_sched.c
> @@ -3495,6 +3495,11 @@ int panthor_sched_init(struct panthor_device *ptdev)
>  	ptdev->csif_info.cs_slot_count = sched->cs_slot_count;
>  	ptdev->csif_info.scoreboard_slot_count = sched->sb_slot_count;
>  
> +	ptdev->fw_info.version = glb_iface->control->version;
> +	ptdev->fw_info.features = glb_iface->control->features;
> +	ptdev->fw_info.group_num = glb_iface->control->group_num;
> +	ptdev->fw_info.instr_features = glb_iface->control->instr_features;
> +
>  	sched->last_tick = 0;
>  	sched->resched_target = U64_MAX;
>  	sched->tick_period = msecs_to_jiffies(10);
> diff --git a/include/uapi/drm/panthor_drm.h b/include/uapi/drm/panthor_drm.h
> index aaed8e12ad0b..e235cf452460 100644
> --- a/include/uapi/drm/panthor_drm.h
> +++ b/include/uapi/drm/panthor_drm.h
> @@ -260,6 +260,9 @@ enum drm_panthor_dev_query_type {
>  
>  	/** @DRM_PANTHOR_DEV_QUERY_CSIF_INFO: Query command-stream interface information. */
>  	DRM_PANTHOR_DEV_QUERY_CSIF_INFO,
> +
> +	/** @DRM_PANTHOR_DEV_QUERY_FW_INFO: Query firmware information */
> +	DRM_PANTHOR_DEV_QUERY_FW_INFO,
>  };
>  
>  /**
> @@ -377,6 +380,22 @@ struct drm_panthor_csif_info {
>  	__u32 pad;
>  };
>  
> +/** struct drm_panthor_fw_info - FW information
> + *
> + * Structure grouping all queryable information relating to the global FW interface.
> + */
> +
> +struct drm_panthor_fw_info {
> +	/** @version: Global interface version */
> +	__u32 version;
> +	/** @features: Global interface features */

The fact the information comes from the global interface is not
super useful. How about replacing "Global interface" by "Firmware" in
the description?

> +	__u32 features;
> +	/** @group_num: Number of CSG interfaces */
> +	__u32 group_num;
> +	/** @instr_features: Instrumentation features */
> +	__u32 instr_features;
> +};
> +
>  /**
>   * struct drm_panthor_dev_query - Arguments passed to DRM_PANTHOR_IOCTL_DEV_QUERY
>   */

