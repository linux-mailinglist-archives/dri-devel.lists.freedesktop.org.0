Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yOHMKaRJqWlZ3wAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 10:15:16 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15A9720E1CC
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 10:15:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 533FC10EBC6;
	Thu,  5 Mar 2026 09:15:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="Wo8afc8K";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F30310EBC6
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Mar 2026 09:15:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=pqZNfs9ME7g9Q2BiFp3Ph4BXS9/5lc9UR/YjQ+Ua6TU=; b=Wo8afc8KJRO2tf1NqQIkL2sOER
 LL6rKLCgcc5l1i/pla9CVtnF9BEQ1/xALIXQuROfDoKJWtsj0FQ8+QQtmLG31RHYHIBe82yVxT8hR
 +6i5qQAOiasdr/FEJxSPcB2eFtJa99UEXgFKO/iYGhBfojPzfQ+iBC6yGIb5+VXfpceXfacCvKREc
 k2KGzJXE2M6hOXeWCEjh18U9AediX3ipSju58abPsFXvay9y2GjEGEKHXwdAR8aJeg0J+Z3jp75Sr
 H11fibJZrISlHc/24Kxrohw/QE9ckAhdnfEfrqNiuGLPicoxNBkMJXbdj4ORCgz4leDJWhwwJvw/j
 7YfAWWVw==;
Received: from ip160.dynamic.igalia.com ([192.168.10.160])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1vy4nV-009I2p-5S; Thu, 05 Mar 2026 10:15:09 +0100
Message-ID: <3c27ff4ab7e18c7d2d3208a46f18ced2d2ca6957.camel@igalia.com>
Subject: Re: [PATCH 5/6] drm/v3d: Attach per-fd reset counters to v3d_stats
From: Iago Toral <itoral@igalia.com>
To: =?ISO-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>, Melissa Wen
 <mwen@igalia.com>, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, Maxime
 Ripard <mripard@kernel.org>
Cc: kernel-dev@igalia.com, dri-devel@lists.freedesktop.org
Date: Thu, 05 Mar 2026 10:15:09 +0100
In-Reply-To: <20260217-v3d-reset-locking-improv-v1-5-0db848016869@igalia.com>
References: <20260217-v3d-reset-locking-improv-v1-0-0db848016869@igalia.com>
 <20260217-v3d-reset-locking-improv-v1-5-0db848016869@igalia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1.1 
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
X-Rspamd-Queue-Id: 15A9720E1CC
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.49 / 15.00];
	R_DKIM_REJECT(1.00)[igalia.com:s=20170329];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[igalia.com : SPF not aligned (relaxed),none];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:mcanal@igalia.com,m:mwen@igalia.com,m:tvrtko.ursulin@igalia.com,m:mripard@kernel.org,m:kernel-dev@igalia.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER(0.00)[itoral@igalia.com,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-0.962];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[itoral@igalia.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[igalia.com:-];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,igalia.com:mid,igalia.com:email]
X-Rspamd-Action: no action

El mar, 17-02-2026 a las 09:18 -0300, Ma=C3=ADra Canal escribi=C3=B3:
> From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>=20
> To remove the file_priv NULL-ing dance needed to check if the file
> descriptor is open, move the per-fd reset counter into v3d_stats,
> which
> is heap-allocated and refcounted, outliving the fd as long as jobs
> reference it.
>=20
> This change allows the removal of the last `queue_lock` usage to
> protect
> `job->file_priv` and avoids possible NULL ptr dereference issues due
> to
> lifetime mismatches.
>=20
> Also, to simplify locking, replace both the global and per-fd locked
> reset counters with atomics.
>=20
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> Co-developed-by: Ma=C3=ADra Canal <mcanal@igalia.com>
> Signed-off-by: Ma=C3=ADra Canal <mcanal@igalia.com>
> ---
> =C2=A0drivers/gpu/drm/v3d/v3d_drv.c=C2=A0=C2=A0 | 20 ++++----------------
> =C2=A0drivers/gpu/drm/v3d/v3d_drv.h=C2=A0=C2=A0 | 14 ++++----------
> =C2=A0drivers/gpu/drm/v3d/v3d_sched.c |=C2=A0 9 ++-------
> =C2=A03 files changed, 10 insertions(+), 33 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/v3d/v3d_drv.c
> b/drivers/gpu/drm/v3d/v3d_drv.c
> index
> aafb402c6ac3118a57df9fc0a0d21d35d48e3b2c..4e77f4808145df21746ff4b7058
> 089d0d161e3fc 100644
> --- a/drivers/gpu/drm/v3d/v3d_drv.c
> +++ b/drivers/gpu/drm/v3d/v3d_drv.c
> @@ -110,13 +110,13 @@ static int v3d_get_param_ioctl(struct
> drm_device *dev, void *data,
> =C2=A0		args->value =3D !!drm_gem_get_huge_mnt(dev);
> =C2=A0		return 0;
> =C2=A0	case DRM_V3D_PARAM_GLOBAL_RESET_COUNTER:
> -		mutex_lock(&v3d->reset_lock);
> -		args->value =3D v3d->reset_counter;
> -		mutex_unlock(&v3d->reset_lock);
> +		args->value =3D atomic_read(&v3d->reset_counter);

Don't we still need to take the reset lock here? Otherwise there would
be a chance that we read the counter while a reset is in flight, no?

Iago

> =C2=A0		return 0;
> =C2=A0	case DRM_V3D_PARAM_CONTEXT_RESET_COUNTER:
> =C2=A0		mutex_lock(&v3d->reset_lock);
> -		args->value =3D v3d_priv->reset_counter;
> +		args->value =3D 0;
> +		for (enum v3d_queue q =3D 0; q < V3D_MAX_QUEUES; q++)
> +			args->value +=3D atomic_read(&v3d_priv-
> >stats[q]->reset_counter);
> =C2=A0		mutex_unlock(&v3d->reset_lock);
> =C2=A0		return 0;
> =C2=A0	default:
> @@ -173,23 +173,11 @@ v3d_open(struct drm_device *dev, struct
> drm_file *file)
> =C2=A0static void
> =C2=A0v3d_postclose(struct drm_device *dev, struct drm_file *file)
> =C2=A0{
> -	struct v3d_dev *v3d =3D to_v3d_dev(dev);
> =C2=A0	struct v3d_file_priv *v3d_priv =3D file->driver_priv;
> -	unsigned long irqflags;
> =C2=A0	enum v3d_queue q;
> =C2=A0
> =C2=A0	for (q =3D 0; q < V3D_MAX_QUEUES; q++) {
> -		struct v3d_queue_state *queue =3D &v3d->queue[q];
> -		struct v3d_job *job =3D queue->active_job;
> -
> =C2=A0		drm_sched_entity_destroy(&v3d_priv-
> >sched_entity[q]);
> -
> -		if (job && job->base.entity =3D=3D &v3d_priv-
> >sched_entity[q]) {
> -			spin_lock_irqsave(&queue->queue_lock,
> irqflags);
> -			job->file_priv =3D NULL;
> -			spin_unlock_irqrestore(&queue->queue_lock,
> irqflags);
> -		}
> -
> =C2=A0		v3d_stats_put(v3d_priv->stats[q]);
> =C2=A0	}
> =C2=A0
> diff --git a/drivers/gpu/drm/v3d/v3d_drv.h
> b/drivers/gpu/drm/v3d/v3d_drv.h
> index
> 72c3f40715dae6e86e0c8356cb997cdf1cf03fae..3de485abd8fc274b361cd17a00c
> ab189d8e69643 100644
> --- a/drivers/gpu/drm/v3d/v3d_drv.h
> +++ b/drivers/gpu/drm/v3d/v3d_drv.h
> @@ -55,6 +55,8 @@ struct v3d_stats {
> =C2=A0	 * job queues, even the write side never is.
> =C2=A0	 */
> =C2=A0	seqcount_t lock;
> +
> +	atomic_t reset_counter;
> =C2=A0};
> =C2=A0
> =C2=A0struct v3d_queue_state {
> @@ -203,10 +205,8 @@ struct v3d_dev {
> =C2=A0	 */
> =C2=A0	struct v3d_perfmon *global_perfmon;
> =C2=A0
> -	/* Global reset counter. The counter must be incremented
> when
> -	 * a GPU reset happens. It must be protected by @reset_lock.
> -	 */
> -	unsigned int reset_counter;
> +	/* Global reset counter incremented on each GPU reset. */
> +	atomic_t reset_counter;
> =C2=A0};
> =C2=A0
> =C2=A0static inline struct v3d_dev *
> @@ -233,12 +233,6 @@ struct v3d_file_priv {
> =C2=A0
> =C2=A0	/* Stores the GPU stats for a specific queue for this fd. */
> =C2=A0	struct v3d_stats *stats[V3D_MAX_QUEUES];
> -
> -	/* Per-fd reset counter, must be incremented when a job
> submitted
> -	 * by this fd causes a GPU reset. It must be protected by
> -	 * &struct v3d_dev->reset_lock.
> -	 */
> -	unsigned int reset_counter;
> =C2=A0};
> =C2=A0
> =C2=A0struct v3d_bo {
> diff --git a/drivers/gpu/drm/v3d/v3d_sched.c
> b/drivers/gpu/drm/v3d/v3d_sched.c
> index
> 4adbf5175eb005b37d1feac1514150630ce6aab2..de6497741ff789b5de9212ae3e9
> 941a13cd0475d 100644
> --- a/drivers/gpu/drm/v3d/v3d_sched.c
> +++ b/drivers/gpu/drm/v3d/v3d_sched.c
> @@ -701,8 +701,6 @@ v3d_gpu_reset_for_timeout(struct v3d_dev *v3d,
> struct drm_sched_job *sched_job,
> =C2=A0			=C2=A0 enum v3d_queue q)
> =C2=A0{
> =C2=A0	struct v3d_job *job =3D to_v3d_job(sched_job);
> -	struct v3d_file_priv *v3d_priv =3D job->file_priv;
> -	unsigned long irqflags;
> =C2=A0	enum v3d_queue i;
> =C2=A0
> =C2=A0	mutex_lock(&v3d->reset_lock);
> @@ -717,11 +715,8 @@ v3d_gpu_reset_for_timeout(struct v3d_dev *v3d,
> struct drm_sched_job *sched_job,
> =C2=A0	/* get the GPU back into the init state */
> =C2=A0	v3d_reset(v3d);
> =C2=A0
> -	v3d->reset_counter++;
> -	spin_lock_irqsave(&v3d->queue[q].queue_lock, irqflags);
> -	if (v3d_priv)
> -		v3d_priv->reset_counter++;
> -	spin_unlock_irqrestore(&v3d->queue[q].queue_lock, irqflags);
> +	atomic_inc(&v3d->reset_counter);
> +	atomic_inc(&job->client_stats->reset_counter);
> =C2=A0
> =C2=A0	for (i =3D 0; i < V3D_MAX_QUEUES; i++)
> =C2=A0		drm_sched_resubmit_jobs(&v3d->queue[i].sched);
>=20

