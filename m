Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0HF7LpqOd2m9hgEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jan 2026 16:56:10 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FC458A5EC
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jan 2026 16:56:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B6C510E1CA;
	Mon, 26 Jan 2026 15:56:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="K3b/Bwwf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08DA410E1CA
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jan 2026 15:56:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=wedspOJik8L++O945OTNa1RJ1BHKSK4Ca3mAtnAvPmE=; b=K3b/BwwfaJGEUgRHPZ+8p4eVyp
 Q+SteKYC6AmyL5vFYMpW5iwN5RkGptuCfHXbrdJgcLDowEXl6DEDmsuHB6VTvw3XLEFJsIzZd8X9o
 4BtBPq/ZHm7tw4jUDfveI1fHcq31vf47W9RSpNPTRLtmkNh5f1qY2BjcfIco+WGkOM/WnsY3bkGNq
 tHrjbh4pKW1vNTsPuzGQpMFC/4KgegH0kJtSy0Halv0QtnQ19MvdUhONUaEpRja2XBR42cByq8k5h
 Z5hg5KZCQ3xVajG2Vdkzo/lLO4zQ7pzxYKzrSIOMpaJb48mRRFfijc1sIXOD1io9L+/3zoXi9c+of
 iNxvvq+Q==;
Received: from [90.240.106.137] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1vkOwc-00A6y2-2x; Mon, 26 Jan 2026 16:56:02 +0100
Message-ID: <6d8255e7-cfc2-43e8-a046-c9960c9e9522@igalia.com>
Date: Mon, 26 Jan 2026 15:56:01 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/vc4: Replace IDR with XArray for perfmon tracking
To: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Melissa Wen <mwen@igalia.com>, Iago Toral <itoral@igalia.com>,
 Maxime Ripard <mripard@kernel.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
Cc: dri-devel@lists.freedesktop.org, kernel-dev@igalia.com
References: <20260115150903.92163-2-mcanal@igalia.com>
 <20260115150903.92163-3-mcanal@igalia.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <20260115150903.92163-3-mcanal@igalia.com>
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
	ARC_NA(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER(0.00)[tvrtko.ursulin@igalia.com,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[igalia.com:-];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-0.996];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tvrtko.ursulin@igalia.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,igalia.com:mid,igalia.com:email]
X-Rspamd-Queue-Id: 1FC458A5EC
X-Rspamd-Action: no action


On 15/01/2026 15:05, Maíra Canal wrote:
> The IDR interface is deprecated and the XArray API is the recommended
> replacement. Replace the per-file IDR used to track perfmons with an
> XArray. This allows us to remove the external mutex that protects the
> IDR.
> 
> While at it, introduce the vc4_perfmon_delete() helper to consolidate
> the perfmon cleanup logic used by both vc4_perfmon_close_file() and
> vc4_perfmon_destroy_ioctl(). Also, remove the redundant assignment of
> vc4file->dev to itself in vc4_perfmon_open_file().
> 
> Signed-off-by: Maíra Canal <mcanal@igalia.com>
> ---
>   drivers/gpu/drm/vc4/vc4_drv.h     |  5 +---
>   drivers/gpu/drm/vc4/vc4_perfmon.c | 49 ++++++++++++++-----------------
>   2 files changed, 23 insertions(+), 31 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vc4/vc4_drv.h b/drivers/gpu/drm/vc4/vc4_drv.h
> index 221d8e01d539..dbcc83b7df00 100644
> --- a/drivers/gpu/drm/vc4/vc4_drv.h
> +++ b/drivers/gpu/drm/vc4/vc4_drv.h
> @@ -791,10 +791,7 @@ struct vc4_exec_info {
>   struct vc4_file {
>   	struct vc4_dev *dev;
>   
> -	struct {
> -		struct idr idr;
> -		struct mutex lock;
> -	} perfmon;
> +	struct xarray perfmons;
>   
>   	bool bin_bo_used;
>   };
> diff --git a/drivers/gpu/drm/vc4/vc4_perfmon.c b/drivers/gpu/drm/vc4/vc4_perfmon.c
> index 1ac80c0b258f..29e549342852 100644
> --- a/drivers/gpu/drm/vc4/vc4_perfmon.c
> +++ b/drivers/gpu/drm/vc4/vc4_perfmon.c
> @@ -95,10 +95,10 @@ struct vc4_perfmon *vc4_perfmon_find(struct vc4_file *vc4file, int id)
>   	if (WARN_ON_ONCE(vc4->gen > VC4_GEN_4))
>   		return NULL;
>   
> -	mutex_lock(&vc4file->perfmon.lock);
> -	perfmon = idr_find(&vc4file->perfmon.idr, id);
> +	xa_lock(&vc4file->perfmons);
> +	perfmon = xa_load(&vc4file->perfmons, id);
>   	vc4_perfmon_get(perfmon);
> -	mutex_unlock(&vc4file->perfmon.lock);
> +	xa_unlock(&vc4file->perfmons);
>   
>   	return perfmon;
>   }
> @@ -110,37 +110,34 @@ void vc4_perfmon_open_file(struct vc4_file *vc4file)
>   	if (WARN_ON_ONCE(vc4->gen > VC4_GEN_4))
>   		return;
>   
> -	mutex_init(&vc4file->perfmon.lock);
> -	idr_init_base(&vc4file->perfmon.idr, VC4_PERFMONID_MIN);
> -	vc4file->dev = vc4;
> +	xa_init_flags(&vc4file->perfmons, XA_FLAGS_ALLOC1);
>   }
>   
> -static int vc4_perfmon_idr_del(int id, void *elem, void *data)
> +static void vc4_perfmon_delete(struct vc4_file *vc4file,
> +			       struct vc4_perfmon *perfmon)
>   {
> -	struct vc4_perfmon *perfmon = elem;
> -	struct vc4_dev *vc4 = (struct vc4_dev *)data;
> +	struct vc4_dev *vc4 = vc4file->dev;
>   
>   	/* If the active perfmon is being destroyed, stop it first */
>   	if (perfmon == vc4->active_perfmon)
>   		vc4_perfmon_stop(vc4, perfmon, false);
>   
>   	vc4_perfmon_put(perfmon);
> -
> -	return 0;
>   }
>   
>   void vc4_perfmon_close_file(struct vc4_file *vc4file)
>   {
>   	struct vc4_dev *vc4 = vc4file->dev;
> +	struct vc4_perfmon *perfmon;
> +	unsigned long id;
>   
>   	if (WARN_ON_ONCE(vc4->gen > VC4_GEN_4))
>   		return;
>   
> -	mutex_lock(&vc4file->perfmon.lock);
> -	idr_for_each(&vc4file->perfmon.idr, vc4_perfmon_idr_del, vc4);
> -	idr_destroy(&vc4file->perfmon.idr);
> -	mutex_unlock(&vc4file->perfmon.lock);
> -	mutex_destroy(&vc4file->perfmon.lock);
> +	xa_for_each(&vc4file->perfmons, id, perfmon)
> +		vc4_perfmon_delete(vc4file, perfmon);
> +
> +	xa_destroy(&vc4file->perfmons);
>   }
>   
>   int vc4_perfmon_create_ioctl(struct drm_device *dev, void *data,
> @@ -152,6 +149,7 @@ int vc4_perfmon_create_ioctl(struct drm_device *dev, void *data,
>   	struct vc4_perfmon *perfmon;
>   	unsigned int i;
>   	int ret;
> +	u32 id;
>   
>   	if (WARN_ON_ONCE(vc4->gen > VC4_GEN_4))
>   		return -ENODEV;
> @@ -185,17 +183,16 @@ int vc4_perfmon_create_ioctl(struct drm_device *dev, void *data,
>   
>   	refcount_set(&perfmon->refcnt, 1);
>   
> -	mutex_lock(&vc4file->perfmon.lock);
> -	ret = idr_alloc(&vc4file->perfmon.idr, perfmon, VC4_PERFMONID_MIN,
> -			VC4_PERFMONID_MAX, GFP_KERNEL);
> -	mutex_unlock(&vc4file->perfmon.lock);
> -
> +	ret = xa_alloc(&vc4file->perfmons, &id, perfmon,
> +		       XA_LIMIT(VC4_PERFMONID_MIN, VC4_PERFMONID_MAX),

Appears the same further cleanup potential with the min/max defines as 
in v3d. Anyway, conversion looks good to me:

Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>

Regards,

Tvrtko

> +		       GFP_KERNEL);
>   	if (ret < 0) {
>   		kfree(perfmon);
>   		return ret;
>   	}
>   
> -	req->id = ret;
> +	req->id = id;
> +
>   	return 0;
>   }
>   
> @@ -215,14 +212,12 @@ int vc4_perfmon_destroy_ioctl(struct drm_device *dev, void *data,
>   		return -ENODEV;
>   	}
>   
> -	mutex_lock(&vc4file->perfmon.lock);
> -	perfmon = idr_remove(&vc4file->perfmon.idr, req->id);
> -	mutex_unlock(&vc4file->perfmon.lock);
> -
> +	perfmon = xa_erase(&vc4file->perfmons, req->id);
>   	if (!perfmon)
>   		return -EINVAL;
>   
> -	vc4_perfmon_put(perfmon);
> +	vc4_perfmon_delete(vc4file, perfmon);
> +
>   	return 0;
>   }
>   

