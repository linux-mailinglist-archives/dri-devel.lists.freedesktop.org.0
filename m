Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A96778073F
	for <lists+dri-devel@lfdr.de>; Fri, 18 Aug 2023 10:36:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0630E10E06C;
	Fri, 18 Aug 2023 08:36:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C79210E06C
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Aug 2023 08:36:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=XKN80SfFGypJirt+cdgki2jDChFRCplkAZ3H5uKAtR8=; b=PjYp4ZvyVrcLO9omX8s45FYpF0
 W7vXcxMGZOn/tcKZFm0Q6GXyw6PuuiOJvFQLbJSl/DeGUbfwfGJDAD9tpiH6xFypa1ghXRZOMoZL1
 Q8EpdYc0K5ffnSw1LDMHXmmzemhfHniXB315a+kvUvjo4EgKoL7l6nw1P+yhILUe+jXUhrWzzXuo2
 XwwH2de6qtcLpIKYoy0ypbrekwiEet3Hm5ZzdxKiY2LIKgGAo48aLW3QlEjTkvv9vVkq20VBS+Z8Y
 4XrlYmFFl6FUb7OEO90vU6xi/8Ba5r6r6WOFYpysjrDTNwSXV867DwXIDUJkAY0EOepNwf4XRK7Fd
 g53/Qx8w==;
Received: from [38.44.68.151] (helo=mail.igalia.com)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1qWuyK-002EV3-Q3; Fri, 18 Aug 2023 10:36:44 +0200
Date: Fri, 18 Aug 2023 07:36:40 -0100
From: Melissa Wen <mwen@igalia.com>
To: =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>
Subject: Re: [PATCH v2 1/2] drm/v3d: Implement show_fdinfo() callback for GPU
 usage stats
Message-ID: <20230818083626.std465czq452og4h@mail.igalia.com>
References: <20230807211849.49867-1-mcanal@igalia.com>
 <20230807211849.49867-2-mcanal@igalia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="xsal4ucg4opzpcbi"
Content-Disposition: inline
In-Reply-To: <20230807211849.49867-2-mcanal@igalia.com>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, kernel-dev@igalia.com,
 Emma Anholt <emma@anholt.net>, dri-devel@lists.freedesktop.org,
 Chema Casanova <jmcasanova@igalia.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--xsal4ucg4opzpcbi
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="mb3crjidxhnng7nv"
Content-Disposition: inline


--mb3crjidxhnng7nv
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 08/07, Ma=EDra Canal wrote:
> This patch exposes the accumulated amount of active time per client
> through the fdinfo infrastructure. The amount of active time is exposed
> for each V3D queue: BIN, RENDER, CSD, TFU and CACHE_CLEAN.
>=20
> In order to calculate the amount of active time per client, a CPU clock
> is used through the function local_clock(). The point where the jobs has
> started is marked and is finally compared with the time that the job had
> finished.
>=20
> Moreover, the number of jobs submitted to each queue is also exposed on
> fdinfo through the identifier "v3d-jobs-<queue>".
>=20
> Co-developed-by: Jose Maria Casanova Crespo <jmcasanova@igalia.com>
> Signed-off-by: Jose Maria Casanova Crespo <jmcasanova@igalia.com>
> Signed-off-by: Ma=EDra Canal <mcanal@igalia.com>
> ---
>  drivers/gpu/drm/v3d/v3d_drv.c   | 30 +++++++++++++++++++++++++++++-
>  drivers/gpu/drm/v3d/v3d_drv.h   | 23 +++++++++++++++++++++++
>  drivers/gpu/drm/v3d/v3d_gem.c   |  1 +
>  drivers/gpu/drm/v3d/v3d_irq.c   | 17 +++++++++++++++++
>  drivers/gpu/drm/v3d/v3d_sched.c | 24 ++++++++++++++++++++++++
>  5 files changed, 94 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/v3d/v3d_drv.c b/drivers/gpu/drm/v3d/v3d_drv.c
> index ffbbe9d527d3..ca65c707da03 100644
> --- a/drivers/gpu/drm/v3d/v3d_drv.c
> +++ b/drivers/gpu/drm/v3d/v3d_drv.c
> @@ -19,6 +19,7 @@
>  #include <linux/module.h>
>  #include <linux/of_platform.h>
>  #include <linux/platform_device.h>
> +#include <linux/sched/clock.h>
>  #include <linux/reset.h>
> =20
>  #include <drm/drm_drv.h>
> @@ -111,6 +112,10 @@ v3d_open(struct drm_device *dev, struct drm_file *fi=
le)
>  	v3d_priv->v3d =3D v3d;
> =20
>  	for (i =3D 0; i < V3D_MAX_QUEUES; i++) {
> +		v3d_priv->enabled_ns[i] =3D 0;
> +		v3d_priv->start_ns[i] =3D 0;
> +		v3d_priv->jobs_sent[i] =3D 0;
> +
>  		sched =3D &v3d->queue[i].sched;
>  		drm_sched_entity_init(&v3d_priv->sched_entity[i],
>  				      DRM_SCHED_PRIORITY_NORMAL, &sched,
> @@ -136,7 +141,29 @@ v3d_postclose(struct drm_device *dev, struct drm_fil=
e *file)
>  	kfree(v3d_priv);
>  }
> =20
> -DEFINE_DRM_GEM_FOPS(v3d_drm_fops);
> +static void v3d_show_fdinfo(struct drm_printer *p, struct drm_file *file)
> +{
> +	struct v3d_file_priv *file_priv =3D file->driver_priv;
> +	u64 timestamp =3D local_clock();
> +	enum v3d_queue queue;
> +
> +	for (queue =3D 0; queue < V3D_MAX_QUEUES; queue++) {
> +		drm_printf(p, "drm-engine-%s: \t%llu ns\n",
> +			   v3d_queue_to_string(queue),
> +			   file_priv->start_ns[queue] ? file_priv->enabled_ns[queue]
> +						      + timestamp - file_priv->start_ns[queue]
> +						      : file_priv->enabled_ns[queue]);
> +
> +		drm_printf(p, "v3d-jobs-%s: \t%llu jobs\n",
> +			   v3d_queue_to_string(queue), file_priv->jobs_sent[queue]);
> +	}
> +}
> +
> +static const struct file_operations v3d_drm_fops =3D {
> +	.owner =3D THIS_MODULE,
> +	DRM_GEM_FOPS,
> +	.show_fdinfo =3D drm_show_fdinfo,
> +};

Dunno where, but could you document somewhere what is the expected
counting behavior in case of a GPU reset?

> =20
>  /* DRM_AUTH is required on SUBMIT_CL for now, while we don't have GMP
>   * protection between clients.  Note that render nodes would be
> @@ -176,6 +203,7 @@ static const struct drm_driver v3d_drm_driver =3D {
>  	.ioctls =3D v3d_drm_ioctls,
>  	.num_ioctls =3D ARRAY_SIZE(v3d_drm_ioctls),
>  	.fops =3D &v3d_drm_fops,
> +	.show_fdinfo =3D v3d_show_fdinfo,
> =20
>  	.name =3D DRIVER_NAME,
>  	.desc =3D DRIVER_DESC,
> diff --git a/drivers/gpu/drm/v3d/v3d_drv.h b/drivers/gpu/drm/v3d/v3d_drv.h
> index 7f664a4b2a75..7f2897e5b2cb 100644
> --- a/drivers/gpu/drm/v3d/v3d_drv.h
> +++ b/drivers/gpu/drm/v3d/v3d_drv.h
> @@ -21,6 +21,18 @@ struct reset_control;
> =20
>  #define V3D_MAX_QUEUES (V3D_CACHE_CLEAN + 1)
> =20
> +static inline char *v3d_queue_to_string(enum v3d_queue queue)
> +{
> +	switch (queue) {
> +	case V3D_BIN: return "bin";
> +	case V3D_RENDER: return "render";
> +	case V3D_TFU: return "tfu";
> +	case V3D_CSD: return "csd";
> +	case V3D_CACHE_CLEAN: return "cache_clean";
> +	}
> +	return "UNKNOWN";
> +}
> +
>  struct v3d_queue_state {
>  	struct drm_gpu_scheduler sched;
> =20
> @@ -167,6 +179,12 @@ struct v3d_file_priv {
>  	} perfmon;
> =20
>  	struct drm_sched_entity sched_entity[V3D_MAX_QUEUES];
> +
> +	u64 start_ns[V3D_MAX_QUEUES];
> +
> +	u64 enabled_ns[V3D_MAX_QUEUES];
> +
> +	u64 jobs_sent[V3D_MAX_QUEUES];
>  };
> =20
>  struct v3d_bo {
> @@ -238,6 +256,11 @@ struct v3d_job {
>  	 */
>  	struct v3d_perfmon *perfmon;
> =20
> +	/* File descriptor of the process that submitted the job that could be =
used
> +	 * for collecting stats by process of GPU usage.
> +	 */
> +	struct drm_file *file;
> +
>  	/* Callback for the freeing of the job on refcount going to 0. */
>  	void (*free)(struct kref *ref);
>  };
> diff --git a/drivers/gpu/drm/v3d/v3d_gem.c b/drivers/gpu/drm/v3d/v3d_gem.c
> index 2e94ce788c71..40ed0c7c3fad 100644
> --- a/drivers/gpu/drm/v3d/v3d_gem.c
> +++ b/drivers/gpu/drm/v3d/v3d_gem.c
> @@ -415,6 +415,7 @@ v3d_job_init(struct v3d_dev *v3d, struct drm_file *fi=
le_priv,
>  	job =3D *container;
>  	job->v3d =3D v3d;
>  	job->free =3D free;
> +	job->file =3D file_priv;
> =20
>  	ret =3D drm_sched_job_init(&job->base, &v3d_priv->sched_entity[queue],
>  				 v3d_priv);
> diff --git a/drivers/gpu/drm/v3d/v3d_irq.c b/drivers/gpu/drm/v3d/v3d_irq.c
> index e714d5318f30..c898800ae9c2 100644
> --- a/drivers/gpu/drm/v3d/v3d_irq.c
> +++ b/drivers/gpu/drm/v3d/v3d_irq.c
> @@ -14,6 +14,7 @@
>   */
> =20
>  #include <linux/platform_device.h>
> +#include <linux/sched/clock.h>
> =20
>  #include "v3d_drv.h"
>  #include "v3d_regs.h"
> @@ -100,6 +101,10 @@ v3d_irq(int irq, void *arg)
>  	if (intsts & V3D_INT_FLDONE) {
>  		struct v3d_fence *fence =3D
>  			to_v3d_fence(v3d->bin_job->base.irq_fence);
> +		struct v3d_file_priv *file =3D v3d->bin_job->base.file->driver_priv;
> +
> +		file->enabled_ns[V3D_BIN] +=3D local_clock() - file->start_ns[V3D_BIN];
> +		file->start_ns[V3D_BIN] =3D 0;
> =20
>  		trace_v3d_bcl_irq(&v3d->drm, fence->seqno);
>  		dma_fence_signal(&fence->base);
> @@ -109,6 +114,10 @@ v3d_irq(int irq, void *arg)
>  	if (intsts & V3D_INT_FRDONE) {
>  		struct v3d_fence *fence =3D
>  			to_v3d_fence(v3d->render_job->base.irq_fence);
> +		struct v3d_file_priv *file =3D v3d->render_job->base.file->driver_priv;
> +
> +		file->enabled_ns[V3D_RENDER] +=3D local_clock() - file->start_ns[V3D_R=
ENDER];
> +		file->start_ns[V3D_RENDER] =3D 0;
> =20
>  		trace_v3d_rcl_irq(&v3d->drm, fence->seqno);
>  		dma_fence_signal(&fence->base);
> @@ -118,6 +127,10 @@ v3d_irq(int irq, void *arg)
>  	if (intsts & V3D_INT_CSDDONE) {
>  		struct v3d_fence *fence =3D
>  			to_v3d_fence(v3d->csd_job->base.irq_fence);
> +		struct v3d_file_priv *file =3D v3d->csd_job->base.file->driver_priv;
> +
> +		file->enabled_ns[V3D_CSD] +=3D local_clock() - file->start_ns[V3D_CSD];
> +		file->start_ns[V3D_CSD] =3D 0;
> =20
>  		trace_v3d_csd_irq(&v3d->drm, fence->seqno);
>  		dma_fence_signal(&fence->base);
> @@ -154,6 +167,10 @@ v3d_hub_irq(int irq, void *arg)
>  	if (intsts & V3D_HUB_INT_TFUC) {
>  		struct v3d_fence *fence =3D
>  			to_v3d_fence(v3d->tfu_job->base.irq_fence);
> +		struct v3d_file_priv *file =3D v3d->tfu_job->base.file->driver_priv;
> +
> +		file->enabled_ns[V3D_TFU] +=3D local_clock() - file->start_ns[V3D_TFU];
> +		file->start_ns[V3D_TFU] =3D 0;
> =20
>  		trace_v3d_tfu_irq(&v3d->drm, fence->seqno);
>  		dma_fence_signal(&fence->base);
> diff --git a/drivers/gpu/drm/v3d/v3d_sched.c b/drivers/gpu/drm/v3d/v3d_sc=
hed.c
> index 06238e6d7f5c..b360709c0765 100644
> --- a/drivers/gpu/drm/v3d/v3d_sched.c
> +++ b/drivers/gpu/drm/v3d/v3d_sched.c
> @@ -18,6 +18,7 @@
>   * semaphores to interlock between them.
>   */
> =20
> +#include <linux/sched/clock.h>
>  #include <linux/kthread.h>
> =20
>  #include "v3d_drv.h"
> @@ -76,6 +77,7 @@ static struct dma_fence *v3d_bin_job_run(struct drm_sch=
ed_job *sched_job)
>  {
>  	struct v3d_bin_job *job =3D to_bin_job(sched_job);
>  	struct v3d_dev *v3d =3D job->base.v3d;
> +	struct v3d_file_priv *file =3D job->base.file->driver_priv;
>  	struct drm_device *dev =3D &v3d->drm;
>  	struct dma_fence *fence;
>  	unsigned long irqflags;
> @@ -107,6 +109,9 @@ static struct dma_fence *v3d_bin_job_run(struct drm_s=
ched_job *sched_job)
>  	trace_v3d_submit_cl(dev, false, to_v3d_fence(fence)->seqno,
>  			    job->start, job->end);
> =20
> +	file->start_ns[V3D_BIN] =3D local_clock();
> +	file->jobs_sent[V3D_BIN]++;
> +
>  	v3d_switch_perfmon(v3d, &job->base);
> =20
>  	/* Set the current and end address of the control list.
> @@ -131,6 +136,7 @@ static struct dma_fence *v3d_render_job_run(struct dr=
m_sched_job *sched_job)
>  {
>  	struct v3d_render_job *job =3D to_render_job(sched_job);
>  	struct v3d_dev *v3d =3D job->base.v3d;
> +	struct v3d_file_priv *file =3D job->base.file->driver_priv;
>  	struct drm_device *dev =3D &v3d->drm;
>  	struct dma_fence *fence;
> =20
> @@ -158,6 +164,9 @@ static struct dma_fence *v3d_render_job_run(struct dr=
m_sched_job *sched_job)
>  	trace_v3d_submit_cl(dev, true, to_v3d_fence(fence)->seqno,
>  			    job->start, job->end);
> =20
> +	file->start_ns[V3D_RENDER] =3D local_clock();
> +	file->jobs_sent[V3D_RENDER]++;
> +
>  	v3d_switch_perfmon(v3d, &job->base);
> =20
>  	/* XXX: Set the QCFG */
> @@ -176,6 +185,7 @@ v3d_tfu_job_run(struct drm_sched_job *sched_job)
>  {
>  	struct v3d_tfu_job *job =3D to_tfu_job(sched_job);
>  	struct v3d_dev *v3d =3D job->base.v3d;
> +	struct v3d_file_priv *file =3D job->base.file->driver_priv;
>  	struct drm_device *dev =3D &v3d->drm;
>  	struct dma_fence *fence;
> =20
> @@ -190,6 +200,9 @@ v3d_tfu_job_run(struct drm_sched_job *sched_job)
> =20
>  	trace_v3d_submit_tfu(dev, to_v3d_fence(fence)->seqno);
> =20
> +	file->start_ns[V3D_TFU] =3D local_clock();
> +	file->jobs_sent[V3D_TFU]++;
> +
>  	V3D_WRITE(V3D_TFU_IIA, job->args.iia);
>  	V3D_WRITE(V3D_TFU_IIS, job->args.iis);
>  	V3D_WRITE(V3D_TFU_ICA, job->args.ica);
> @@ -213,6 +226,7 @@ v3d_csd_job_run(struct drm_sched_job *sched_job)
>  {
>  	struct v3d_csd_job *job =3D to_csd_job(sched_job);
>  	struct v3d_dev *v3d =3D job->base.v3d;
> +	struct v3d_file_priv *file =3D job->base.file->driver_priv;
>  	struct drm_device *dev =3D &v3d->drm;
>  	struct dma_fence *fence;
>  	int i;
> @@ -231,6 +245,9 @@ v3d_csd_job_run(struct drm_sched_job *sched_job)
> =20
>  	trace_v3d_submit_csd(dev, to_v3d_fence(fence)->seqno);
> =20
> +	file->start_ns[V3D_CSD] =3D local_clock();
> +	file->jobs_sent[V3D_CSD]++;
> +
>  	v3d_switch_perfmon(v3d, &job->base);
> =20
>  	for (i =3D 1; i <=3D 6; i++)
> @@ -246,9 +263,16 @@ v3d_cache_clean_job_run(struct drm_sched_job *sched_=
job)
>  {
>  	struct v3d_job *job =3D to_v3d_job(sched_job);
>  	struct v3d_dev *v3d =3D job->v3d;
> +	struct v3d_file_priv *file =3D job->file->driver_priv;
> +
> +	file->start_ns[V3D_CACHE_CLEAN] =3D local_clock();
> +	file->jobs_sent[V3D_CACHE_CLEAN]++;
> =20
>  	v3d_clean_caches(v3d);
> =20
> +	file->enabled_ns[V3D_CACHE_CLEAN] +=3D local_clock() - file->start_ns[V=
3D_CACHE_CLEAN];
> +	file->start_ns[V3D_CACHE_CLEAN] =3D 0;
> +
>  	return NULL;
>  }
> =20
> --=20
> 2.41.0
>=20

--mb3crjidxhnng7nv--

--xsal4ucg4opzpcbi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEd8WOo/JViG+Tu+XIwqF3j0dLehwFAmTfLZgACgkQwqF3j0dL
ehxYjA//VG5sWIJ0/IenymIzP9I6YMhUk6jqPzNyd9t0P/AsGl8ijmNWYrIfE+Xw
ycEdzjyCQMs0HK/eKkDlVqNn8L2BlcPlMpOum+uces7CK3K0CMcZJjDn5shoGI4J
0UYGFOmbOdahppcIBfrIHI2W5CGQqgUbFzg+SQzTMVg5jvy7zQ5WIw6hOQQidYZl
OZVCQ3ADyu4otHNSFG8G3wlpYBwlty4fA4BNrCEJSXbMo69tndTAov9aMOH+OyoL
GUf/3we7K1pOGxmRhDwZQoAYcUns2j9ZVlciWbDyCR1P3olFJRfJfTqJ0DcQZ7gZ
3Ap4G2b9yaHrvr7PBuAXAsLH3U7SKDLuGc1wxTruvAC9ObmVgNDV6uBJPqXzz2R4
GVgrtfXu1rDTWr/bNKJeRJwA3pOZBvWKRjn05CL5nfsowU4CEUcTeuBvA55jvJO5
Jl6leon0862m5kOvZWxaQt+4Mwf56imJjLYOlktQmY0ifU+kOKgzBjDtl5FHcKM8
8IGXvfLk3dOPIxjTKgkfTerLW6Li5obdHa1/OPdaPnq9eNAyxm9uyOxTrL8UV6XI
+WPPKzHl7sqTCZP6ducSjDnHhFzaZ9kA4NkQjrUVV9Urnt3zzgw1Zc6JNx23tKyA
bu0FSSvMSL2537QNB8dw85CiDmLYX9PjLj+ziZRxvGHx6RwiwJM=
=iNbZ
-----END PGP SIGNATURE-----

--xsal4ucg4opzpcbi--
