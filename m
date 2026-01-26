Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0DMINQCOd2m9hgEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jan 2026 16:53:36 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C31A8A586
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jan 2026 16:53:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B050810E231;
	Mon, 26 Jan 2026 15:53:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="FS4vX71h";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B577B10E1CA
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jan 2026 15:53:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=TQzki6V6Wc6dWw2C1daHHNLgkz+vy7+xcpAnIH6Bttc=; b=FS4vX71h/fQjIcaqU7cvPsmlHV
 wmEAlP/ZL/dqm//aWtMi9DNozlpIKf0my2g/ktf/+S82Tw17EJCgTFOz88ts7Yd961ZKaKiuVDkB/
 OqCsZPa7GLDJsUs32ISQwTCPr0dGLX7GRHFzZGf8Qfk3lC87/SzuDJa0cO+jlztQwuCN/p/pgbjGU
 cgjkyJct80O4te4pi5pTyOXJSUX09Own5h32cRYz/ClRuUGefaGgxmWkjpp33rrWFyfgXqECrMRKm
 Qi81KyrEEk8f8tvBqpYmrihXgxni4xe0SrDWwxtwAtA6yMp8v0eiMbz3F/5s1ek94k3j/eK+r9/LO
 k2s1Gfcw==;
Received: from [90.240.106.137] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1vkOu4-00A6u4-QI; Mon, 26 Jan 2026 16:53:24 +0100
Message-ID: <c7f78d19-ab62-4f74-bc60-b779d1596725@igalia.com>
Date: Mon, 26 Jan 2026 15:53:23 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/v3d: Replace IDR with XArray for perfmon tracking
To: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Melissa Wen <mwen@igalia.com>, Iago Toral <itoral@igalia.com>,
 Maxime Ripard <mripard@kernel.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
Cc: dri-devel@lists.freedesktop.org, kernel-dev@igalia.com
References: <20260115150903.92163-2-mcanal@igalia.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <20260115150903.92163-2-mcanal@igalia.com>
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.49 / 15.00];
	R_DKIM_REJECT(1.00)[igalia.com:s=20170329];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[igalia.com : SPF not aligned (relaxed),none];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:mcanal@igalia.com,m:mwen@igalia.com,m:itoral@igalia.com,m:mripard@kernel.org,m:dave.stevenson@raspberrypi.com,m:kernel-list@raspberrypi.com,m:kernel-dev@igalia.com,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER(0.00)[tvrtko.ursulin@igalia.com,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[igalia.com:-];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-0.995];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tvrtko.ursulin@igalia.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,igalia.com:mid,igalia.com:email]
X-Rspamd-Queue-Id: 1C31A8A586
X-Rspamd-Action: no action


On 15/01/2026 15:05, Maíra Canal wrote:
> The IDR interface is deprecated and the XArray API is the recommended
> replacement. Replace the per-file IDR used to track perfmons with an
> XArray. This allows us to remove the external mutex that protects the
> IDR.
> 
> While here, introduce the v3d_perfmon_delete() helper to consolidate
> the perfmon cleanup logic used by both v3d_perfmon_close_file() and
> v3d_perfmon_destroy_ioctl().
> 
> Signed-off-by: Maíra Canal <mcanal@igalia.com>
> ---
>   drivers/gpu/drm/v3d/v3d_drv.h     |  5 +--
>   drivers/gpu/drm/v3d/v3d_perfmon.c | 55 +++++++++++--------------------
>   2 files changed, 21 insertions(+), 39 deletions(-)
> 
> diff --git a/drivers/gpu/drm/v3d/v3d_drv.h b/drivers/gpu/drm/v3d/v3d_drv.h
> index 99a39329bb85..314213c26710 100644
> --- a/drivers/gpu/drm/v3d/v3d_drv.h
> +++ b/drivers/gpu/drm/v3d/v3d_drv.h
> @@ -220,10 +220,7 @@ v3d_has_csd(struct v3d_dev *v3d)
>   struct v3d_file_priv {
>   	struct v3d_dev *v3d;
>   
> -	struct {
> -		struct idr idr;
> -		struct mutex lock;
> -	} perfmon;
> +	struct xarray perfmons;
>   
>   	struct drm_sched_entity sched_entity[V3D_MAX_QUEUES];
>   
> diff --git a/drivers/gpu/drm/v3d/v3d_perfmon.c b/drivers/gpu/drm/v3d/v3d_perfmon.c
> index 9a3fe5255874..41325ffc7f43 100644
> --- a/drivers/gpu/drm/v3d/v3d_perfmon.c
> +++ b/drivers/gpu/drm/v3d/v3d_perfmon.c
> @@ -290,24 +290,23 @@ struct v3d_perfmon *v3d_perfmon_find(struct v3d_file_priv *v3d_priv, int id)
>   {
>   	struct v3d_perfmon *perfmon;
>   
> -	mutex_lock(&v3d_priv->perfmon.lock);
> -	perfmon = idr_find(&v3d_priv->perfmon.idr, id);
> +	xa_lock(&v3d_priv->perfmons);
> +	perfmon = xa_load(&v3d_priv->perfmons, id);
>   	v3d_perfmon_get(perfmon);
> -	mutex_unlock(&v3d_priv->perfmon.lock);
> +	xa_unlock(&v3d_priv->perfmons);
>   
>   	return perfmon;
>   }
>   
>   void v3d_perfmon_open_file(struct v3d_file_priv *v3d_priv)
>   {
> -	mutex_init(&v3d_priv->perfmon.lock);
> -	idr_init_base(&v3d_priv->perfmon.idr, 1);
> +	xa_init_flags(&v3d_priv->perfmons, XA_FLAGS_ALLOC1);
>   }
>   
> -static int v3d_perfmon_idr_del(int id, void *elem, void *data)
> +static void v3d_perfmon_delete(struct v3d_file_priv *v3d_priv,
> +			       struct v3d_perfmon *perfmon)
>   {
> -	struct v3d_perfmon *perfmon = elem;
> -	struct v3d_dev *v3d = (struct v3d_dev *)data;
> +	struct v3d_dev *v3d = v3d_priv->v3d;
>   
>   	/* If the active perfmon is being destroyed, stop it first */
>   	if (perfmon == v3d->active_perfmon)
> @@ -317,19 +316,17 @@ static int v3d_perfmon_idr_del(int id, void *elem, void *data)
>   	cmpxchg(&v3d->global_perfmon, perfmon, NULL);
>   
>   	v3d_perfmon_put(perfmon);
> -
> -	return 0;
>   }
>   
>   void v3d_perfmon_close_file(struct v3d_file_priv *v3d_priv)
>   {
> -	struct v3d_dev *v3d = v3d_priv->v3d;
> +	struct v3d_perfmon *perfmon;
> +	unsigned long id;
>   
> -	mutex_lock(&v3d_priv->perfmon.lock);
> -	idr_for_each(&v3d_priv->perfmon.idr, v3d_perfmon_idr_del, v3d);
> -	idr_destroy(&v3d_priv->perfmon.idr);
> -	mutex_unlock(&v3d_priv->perfmon.lock);
> -	mutex_destroy(&v3d_priv->perfmon.lock);
> +	xa_for_each(&v3d_priv->perfmons, id, perfmon)
> +		v3d_perfmon_delete(v3d_priv, perfmon);

Looking outside the XArray conversion the situation with 
v3d->active_perfmon caught my eye. It doesn't look that driver global 
field is protected by any lock, right? So if one client would be 
exiting, is there enough serialisation between that and perhaps 
v3d_switch_perfmon() (from run_job()) could see a stale 
v3d->active_perfmon pointer and attempt to double put it? I am not sure, 
but gain, that seem outside the scope of this conversion.

> +
> +	xa_destroy(&v3d_priv->perfmons);
>   }
>   
>   int v3d_perfmon_create_ioctl(struct drm_device *dev, void *data,
> @@ -341,6 +338,7 @@ int v3d_perfmon_create_ioctl(struct drm_device *dev, void *data,
>   	struct v3d_perfmon *perfmon;
>   	unsigned int i;
>   	int ret;
> +	u32 id;
>   
>   	/* Number of monitored counters cannot exceed HW limits. */
>   	if (req->ncounters > DRM_V3D_MAX_PERF_COUNTERS ||
> @@ -366,18 +364,16 @@ int v3d_perfmon_create_ioctl(struct drm_device *dev, void *data,
>   	refcount_set(&perfmon->refcnt, 1);
>   	mutex_init(&perfmon->lock);
>   
> -	mutex_lock(&v3d_priv->perfmon.lock);
> -	ret = idr_alloc(&v3d_priv->perfmon.idr, perfmon, V3D_PERFMONID_MIN,
> -			V3D_PERFMONID_MAX, GFP_KERNEL);

Hm it seems V3D_PERFMONID_MAX being U32_MAX used to overflow the end 
argument of idr_alloc.

> -	mutex_unlock(&v3d_priv->perfmon.lock);
> -
> +	ret = xa_alloc(&v3d_priv->perfmons, &id, perfmon,
> +		       XA_LIMIT(V3D_PERFMONID_MIN, V3D_PERFMONID_MAX),

Could perheps even lose the V3D_PERFMON_MIN/MAX defines and just use 
xa_limit_32b.

> +		       GFP_KERNEL);
>   	if (ret < 0) {
>   		mutex_destroy(&perfmon->lock);
>   		kfree(perfmon);
>   		return ret;
>   	}
>   
> -	req->id = ret;
> +	req->id = id;
>   
>   	return 0;
>   }
> @@ -387,24 +383,13 @@ int v3d_perfmon_destroy_ioctl(struct drm_device *dev, void *data,
>   {
>   	struct v3d_file_priv *v3d_priv = file_priv->driver_priv;
>   	struct drm_v3d_perfmon_destroy *req = data;
> -	struct v3d_dev *v3d = v3d_priv->v3d;
>   	struct v3d_perfmon *perfmon;
>   
> -	mutex_lock(&v3d_priv->perfmon.lock);
> -	perfmon = idr_remove(&v3d_priv->perfmon.idr, req->id);
> -	mutex_unlock(&v3d_priv->perfmon.lock);
> -
> +	perfmon = xa_erase(&v3d_priv->perfmons, req->id);
>   	if (!perfmon)
>   		return -EINVAL;
>   
> -	/* If the active perfmon is being destroyed, stop it first */
> -	if (perfmon == v3d->active_perfmon)
> -		v3d_perfmon_stop(v3d, perfmon, false);
> -
> -	/* If the global perfmon is being destroyed, set it to NULL */
> -	cmpxchg(&v3d->global_perfmon, perfmon, NULL);
> -
> -	v3d_perfmon_put(perfmon);
> +	v3d_perfmon_delete(v3d_priv, perfmon);

Nice consolidation.

Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>

Regards,

Tvrtko

>   
>   	return 0;
>   }

