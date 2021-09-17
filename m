Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E73764100E6
	for <lists+dri-devel@lfdr.de>; Fri, 17 Sep 2021 23:50:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CACD66E06E;
	Fri, 17 Sep 2021 21:50:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6286F6E06E
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Sep 2021 21:50:07 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10110"; a="222538267"
X-IronPort-AV: E=Sophos;i="5.85,302,1624345200"; d="scan'208";a="222538267"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2021 14:50:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,302,1624345200"; d="scan'208";a="611446340"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga001.fm.intel.com with ESMTP; 17 Sep 2021 14:50:06 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Fri, 17 Sep 2021 14:50:06 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Fri, 17 Sep 2021 14:50:05 -0700
Received: from orsmsx611.amr.corp.intel.com ([10.22.229.24]) by
 ORSMSX611.amr.corp.intel.com ([10.22.229.24]) with mapi id 15.01.2242.012;
 Fri, 17 Sep 2021 14:50:05 -0700
From: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
To: Gurchetan Singh <gurchetansingh@chromium.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "virtio-dev@lists.oasis-open.org" <virtio-dev@lists.oasis-open.org>
CC: "kraxel@redhat.com" <kraxel@redhat.com>
Subject: RE: [PATCH v2 11/12] drm/virtio: implement context init: add
 virtio_gpu_fence_event
Thread-Topic: [PATCH v2 11/12] drm/virtio: implement context init: add
 virtio_gpu_fence_event
Thread-Index: AQHXq2CmEDO5KMBP30y3PbWDgrLt66uourkA
Date: Fri, 17 Sep 2021 21:50:05 +0000
Message-ID: <3ea050e89fbb40aeba368025b2213844@intel.com>
References: <20210917010842.503-1-gurchetansingh@chromium.org>
 <20210917010842.503-12-gurchetansingh@chromium.org>
In-Reply-To: <20210917010842.503-12-gurchetansingh@chromium.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.6.200.16
dlp-reaction: no-action
x-originating-ip: [10.1.200.100]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
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

Hi Gurchetan,

>=20
> Similar to DRM_VMW_EVENT_FENCE_SIGNALED.  Sends a pollable event
> to the DRM file descriptor when a fence on a specific ring is
> signaled.
>=20
> One difference is the event is not exposed via the UAPI -- this is
> because host responses are on a shared memory buffer of type
> BLOB_MEM_GUEST [this is the common way to receive responses with
> virtgpu].  As such, there is no context specific read(..)
> implementation either -- just a poll(..) implementation.
[Kasireddy, Vivek] Given my limited understanding of virtio_gpu 3D/Virgl, I=
 am
wondering why you'd need a new internal event associated with a fence; woul=
d
you not be able to accomplish the same by adding the out_fence_fd (from exe=
cbuf)
to your userspace's event loop (in addition to DRM fd) and get signalled?

Thanks,
Vivek

>=20
> Signed-off-by: Gurchetan Singh <gurchetansingh@chromium.org>
> Acked-by: Nicholas Verne <nverne@chromium.org>
> ---
>  drivers/gpu/drm/virtio/virtgpu_drv.c   | 43 +++++++++++++++++++++++++-
>  drivers/gpu/drm/virtio/virtgpu_drv.h   |  7 +++++
>  drivers/gpu/drm/virtio/virtgpu_fence.c | 10 ++++++
>  drivers/gpu/drm/virtio/virtgpu_ioctl.c | 34 ++++++++++++++++++++
>  4 files changed, 93 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.c b/drivers/gpu/drm/virti=
o/virtgpu_drv.c
> index 9d963f1fda8f..749db18dcfa2 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_drv.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_drv.c
> @@ -29,6 +29,8 @@
>  #include <linux/module.h>
>  #include <linux/console.h>
>  #include <linux/pci.h>
> +#include <linux/poll.h>
> +#include <linux/wait.h>
>=20
>  #include <drm/drm.h>
>  #include <drm/drm_aperture.h>
> @@ -155,6 +157,35 @@ static void virtio_gpu_config_changed(struct virtio_=
device
> *vdev)
>  	schedule_work(&vgdev->config_changed_work);
>  }
>=20
> +static __poll_t virtio_gpu_poll(struct file *filp,
> +				struct poll_table_struct *wait)
> +{
> +	struct drm_file *drm_file =3D filp->private_data;
> +	struct virtio_gpu_fpriv *vfpriv =3D drm_file->driver_priv;
> +	struct drm_device *dev =3D drm_file->minor->dev;
> +	struct drm_pending_event *e =3D NULL;
> +	__poll_t mask =3D 0;
> +
> +	if (!vfpriv->ring_idx_mask)
> +		return drm_poll(filp, wait);
> +
> +	poll_wait(filp, &drm_file->event_wait, wait);
> +
> +	if (!list_empty(&drm_file->event_list)) {
> +		spin_lock_irq(&dev->event_lock);
> +		e =3D list_first_entry(&drm_file->event_list,
> +				     struct drm_pending_event, link);
> +		drm_file->event_space +=3D e->event->length;
> +		list_del(&e->link);
> +		spin_unlock_irq(&dev->event_lock);
> +
> +		kfree(e);
> +		mask |=3D EPOLLIN | EPOLLRDNORM;
> +	}
> +
> +	return mask;
> +}
> +
>  static struct virtio_device_id id_table[] =3D {
>  	{ VIRTIO_ID_GPU, VIRTIO_DEV_ANY_ID },
>  	{ 0 },
> @@ -194,7 +225,17 @@ MODULE_AUTHOR("Dave Airlie <airlied@redhat.com>");
>  MODULE_AUTHOR("Gerd Hoffmann <kraxel@redhat.com>");
>  MODULE_AUTHOR("Alon Levy");
>=20
> -DEFINE_DRM_GEM_FOPS(virtio_gpu_driver_fops);
> +static const struct file_operations virtio_gpu_driver_fops =3D {
> +	.owner          =3D THIS_MODULE,
> +	.open           =3D drm_open,
> +	.release        =3D drm_release,
> +	.unlocked_ioctl =3D drm_ioctl,
> +	.compat_ioctl   =3D drm_compat_ioctl,
> +	.poll           =3D virtio_gpu_poll,
> +	.read           =3D drm_read,
> +	.llseek         =3D noop_llseek,
> +	.mmap           =3D drm_gem_mmap
> +};
>=20
>  static const struct drm_driver driver =3D {
>  	.driver_features =3D DRIVER_MODESET | DRIVER_GEM | DRIVER_RENDER |
> DRIVER_ATOMIC,
> diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h b/drivers/gpu/drm/virti=
o/virtgpu_drv.h
> index cb60d52c2bd1..e0265fe74aa5 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_drv.h
> +++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
> @@ -138,11 +138,18 @@ struct virtio_gpu_fence_driver {
>  	spinlock_t       lock;
>  };
>=20
> +#define VIRTGPU_EVENT_FENCE_SIGNALED_INTERNAL 0x10000000
> +struct virtio_gpu_fence_event {
> +	struct drm_pending_event base;
> +	struct drm_event event;
> +};
> +
>  struct virtio_gpu_fence {
>  	struct dma_fence f;
>  	uint32_t ring_idx;
>  	uint64_t fence_id;
>  	bool emit_fence_info;
> +	struct virtio_gpu_fence_event *e;
>  	struct virtio_gpu_fence_driver *drv;
>  	struct list_head node;
>  };
> diff --git a/drivers/gpu/drm/virtio/virtgpu_fence.c
> b/drivers/gpu/drm/virtio/virtgpu_fence.c
> index 98a00c1e654d..f28357dbde35 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_fence.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_fence.c
> @@ -152,11 +152,21 @@ void virtio_gpu_fence_event_process(struct virtio_g=
pu_device
> *vgdev,
>  				continue;
>=20
>  			dma_fence_signal_locked(&curr->f);
> +			if (curr->e) {
> +				drm_send_event(vgdev->ddev, &curr->e->base);
> +				curr->e =3D NULL;
> +			}
> +
>  			list_del(&curr->node);
>  			dma_fence_put(&curr->f);
>  		}
>=20
>  		dma_fence_signal_locked(&signaled->f);
> +		if (signaled->e) {
> +			drm_send_event(vgdev->ddev, &signaled->e->base);
> +			signaled->e =3D NULL;
> +		}
> +
>  		list_del(&signaled->node);
>  		dma_fence_put(&signaled->f);
>  		break;
> diff --git a/drivers/gpu/drm/virtio/virtgpu_ioctl.c b/drivers/gpu/drm/vir=
tio/virtgpu_ioctl.c
> index be7b22a03884..fdaa7f3d9eeb 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_ioctl.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
> @@ -38,6 +38,36 @@
>  				    VIRTGPU_BLOB_FLAG_USE_SHAREABLE | \
>  				    VIRTGPU_BLOB_FLAG_USE_CROSS_DEVICE)
>=20
> +static int virtio_gpu_fence_event_create(struct drm_device *dev,
> +					 struct drm_file *file,
> +					 struct virtio_gpu_fence *fence,
> +					 uint32_t ring_idx)
> +{
> +	struct virtio_gpu_fpriv *vfpriv =3D file->driver_priv;
> +	struct virtio_gpu_fence_event *e =3D NULL;
> +	int ret;
> +
> +	if (!(vfpriv->ring_idx_mask & (1 << ring_idx)))
> +		return 0;
> +
> +	e =3D kzalloc(sizeof(*e), GFP_KERNEL);
> +	if (!e)
> +		return -ENOMEM;
> +
> +	e->event.type =3D VIRTGPU_EVENT_FENCE_SIGNALED_INTERNAL;
> +	e->event.length =3D sizeof(e->event);
> +
> +	ret =3D drm_event_reserve_init(dev, file, &e->base, &e->event);
> +	if (ret)
> +		goto free;
> +
> +	fence->e =3D e;
> +	return 0;
> +free:
> +	kfree(e);
> +	return ret;
> +}
> +
>  /* Must be called with &virtio_gpu_fpriv.struct_mutex held. */
>  static void virtio_gpu_create_context_locked(struct virtio_gpu_device *v=
gdev,
>  					     struct virtio_gpu_fpriv *vfpriv)
> @@ -195,6 +225,10 @@ static int virtio_gpu_execbuffer_ioctl(struct drm_de=
vice *dev,
> void *data,
>  		goto out_unresv;
>  	}
>=20
> +	ret =3D virtio_gpu_fence_event_create(dev, file, out_fence, ring_idx);
> +	if (ret)
> +		goto out_unresv;
> +
>  	if (out_fence_fd >=3D 0) {
>  		sync_file =3D sync_file_create(&out_fence->f);
>  		if (!sync_file) {
> --
> 2.33.0.464.g1972c5931b-goog

