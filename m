Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KDfuOQg3lmkkcQIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 18 Feb 2026 23:02:48 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D8EC15A8BC
	for <lists+dri-devel@lfdr.de>; Wed, 18 Feb 2026 23:02:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4BBE10E31F;
	Wed, 18 Feb 2026 22:02:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="OaRZUspW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B37A10E31F
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Feb 2026 22:02:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ibgZwGw/5Ehw9YgJ1RR+okYJVR653HZ/L0RFQFCN7mI=; b=OaRZUspWf7JezDn0NVHszFHREm
 pmUHaEpfjWvQXyLUkZLJfB2mClM7mVaOIpico0ZKmQAF/VjDWVTDu4WUA+E1vi0UEHHPdLsKY7QMb
 yq0SejdBdz1w2qJDCdPPEoQo3zFBgnFggIYL8aHunIb2Zxer8aR3yAUJRn0fwcxZAgyiGveW/rYKp
 C6IkvpEOuQ2c/1fb0+eHTwA1nBV3Xax3p0+dyPJxoH9S79YZ6oMPG94iGCG9gzHZczG1dHRMESi11
 eyAnrIkD4Z9AsK9K1TFG3AQCvOB+FgBF/p7lMBE11f5cte4ifhgEExnXrNSNpd/wC48FO8kmJv2LJ
 x1bAyEhw==;
Received: from [186.208.68.119] (helo=[192.168.18.14])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1vspcz-002ETB-BE; Wed, 18 Feb 2026 23:02:37 +0100
Message-ID: <722cef4a-1047-46f9-b4c2-b636b54994ea@igalia.com>
Date: Wed, 18 Feb 2026 19:02:33 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/11] drm/vc4: Move vc4_wait_bo_ioctl() to vc4_bo.c
To: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Maxime Ripard <mripard@kernel.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: kernel-dev@igalia.com, dri-devel@lists.freedesktop.org
References: <20260205-vc4-drm-scheduler-v1-0-c6174fd7bbc1@igalia.com>
 <20260205-vc4-drm-scheduler-v1-3-c6174fd7bbc1@igalia.com>
Content-Language: en-US
From: Melissa Wen <mwen@igalia.com>
In-Reply-To: <20260205-vc4-drm-scheduler-v1-3-c6174fd7bbc1@igalia.com>
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
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	DMARC_POLICY_SOFTFAIL(0.10)[igalia.com : SPF not aligned (relaxed),none];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:mcanal@igalia.com,m:mripard@kernel.org,m:dave.stevenson@raspberrypi.com,m:kernel-list@raspberrypi.com,m:maarten.lankhorst@linux.intel.com,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:kernel-dev@igalia.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[igalia.com,kernel.org,raspberrypi.com,linux.intel.com,suse.de,gmail.com,ffwll.ch];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[mwen@igalia.com,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-0.954];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mwen@igalia.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[igalia.com:-];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,igalia.com:mid,igalia.com:email]
X-Rspamd-Queue-Id: 6D8EC15A8BC
X-Rspamd-Action: no action



On 05/02/2026 18:31, Maíra Canal wrote:
> Move vc4_wait_bo_ioctl() from vc4_gem.c to vc4_bo.c, grouping it with
> the other BO-related ioctls. No functional change.
Reviewed-by: Melissa Wen <mwen@igalia.com>
>
> Signed-off-by: Maíra Canal <mcanal@igalia.com>
> ---
>   drivers/gpu/drm/vc4/vc4_bo.c  | 33 +++++++++++++++++++++++++++++++++
>   drivers/gpu/drm/vc4/vc4_drv.h |  4 ++--
>   drivers/gpu/drm/vc4/vc4_gem.c | 33 ---------------------------------
>   3 files changed, 35 insertions(+), 35 deletions(-)
>
> diff --git a/drivers/gpu/drm/vc4/vc4_bo.c b/drivers/gpu/drm/vc4/vc4_bo.c
> index 46b4474ac41d46f836f0896b3b5f57f09629e24e..c32e3d24d26af1ffb50e099decb37252769de9a0 100644
> --- a/drivers/gpu/drm/vc4/vc4_bo.c
> +++ b/drivers/gpu/drm/vc4/vc4_bo.c
> @@ -830,6 +830,39 @@ int vc4_mmap_bo_ioctl(struct drm_device *dev, void *data,
>   	return 0;
>   }
>   
> +int
> +vc4_wait_bo_ioctl(struct drm_device *dev, void *data,
> +		  struct drm_file *file_priv)
> +{
> +	struct vc4_dev *vc4 = to_vc4_dev(dev);
> +	int ret;
> +	struct drm_vc4_wait_bo *args = data;
> +	unsigned long timeout_jiffies =
> +		usecs_to_jiffies(div_u64(args->timeout_ns, 1000));
> +	ktime_t start = ktime_get();
> +	u64 delta_ns;
> +
> +	if (WARN_ON_ONCE(vc4->gen > VC4_GEN_4))
> +		return -ENODEV;
> +
> +	if (args->pad != 0)
> +		return -EINVAL;
> +
> +	ret = drm_gem_dma_resv_wait(file_priv, args->handle,
> +				    true, timeout_jiffies);
> +
> +	/* Decrement the user's timeout, in case we got interrupted
> +	 * such that the ioctl will be restarted.
> +	 */
> +	delta_ns = ktime_to_ns(ktime_sub(ktime_get(), start));
> +	if (delta_ns < args->timeout_ns)
> +		args->timeout_ns -= delta_ns;
> +	else
> +		args->timeout_ns = 0;
> +
> +	return ret;
> +}
> +
>   int
>   vc4_create_shader_bo_ioctl(struct drm_device *dev, void *data,
>   			   struct drm_file *file_priv)
> diff --git a/drivers/gpu/drm/vc4/vc4_drv.h b/drivers/gpu/drm/vc4/vc4_drv.h
> index dbcc83b7df004519c9c74a618b81877a14796d36..0f2fb035fef177dd446ff8322da2413c861ecfd3 100644
> --- a/drivers/gpu/drm/vc4/vc4_drv.h
> +++ b/drivers/gpu/drm/vc4/vc4_drv.h
> @@ -906,6 +906,8 @@ int vc4_bo_dumb_create(struct drm_file *file_priv,
>   		       struct drm_mode_create_dumb *args);
>   int vc4_create_bo_ioctl(struct drm_device *dev, void *data,
>   			struct drm_file *file_priv);
> +int vc4_wait_bo_ioctl(struct drm_device *dev, void *data,
> +		      struct drm_file *file_priv);
>   int vc4_create_shader_bo_ioctl(struct drm_device *dev, void *data,
>   			       struct drm_file *file_priv);
>   int vc4_mmap_bo_ioctl(struct drm_device *dev, void *data,
> @@ -990,8 +992,6 @@ int vc4_submit_cl_ioctl(struct drm_device *dev, void *data,
>   			struct drm_file *file_priv);
>   int vc4_wait_seqno_ioctl(struct drm_device *dev, void *data,
>   			 struct drm_file *file_priv);
> -int vc4_wait_bo_ioctl(struct drm_device *dev, void *data,
> -		      struct drm_file *file_priv);
>   void vc4_submit_next_bin_job(struct drm_device *dev);
>   void vc4_submit_next_render_job(struct drm_device *dev);
>   void vc4_move_job_to_render(struct drm_device *dev, struct vc4_exec_info *exec);
> diff --git a/drivers/gpu/drm/vc4/vc4_gem.c b/drivers/gpu/drm/vc4/vc4_gem.c
> index f943ff7da28ae528c0fdfac76e989a2d5286d193..9df2634e48566ba12858c135a3c313efa7bd120c 100644
> --- a/drivers/gpu/drm/vc4/vc4_gem.c
> +++ b/drivers/gpu/drm/vc4/vc4_gem.c
> @@ -962,39 +962,6 @@ vc4_wait_seqno_ioctl(struct drm_device *dev, void *data,
>   					       &args->timeout_ns);
>   }
>   
> -int
> -vc4_wait_bo_ioctl(struct drm_device *dev, void *data,
> -		  struct drm_file *file_priv)
> -{
> -	struct vc4_dev *vc4 = to_vc4_dev(dev);
> -	int ret;
> -	struct drm_vc4_wait_bo *args = data;
> -	unsigned long timeout_jiffies =
> -		usecs_to_jiffies(div_u64(args->timeout_ns, 1000));
> -	ktime_t start = ktime_get();
> -	u64 delta_ns;
> -
> -	if (WARN_ON_ONCE(vc4->gen > VC4_GEN_4))
> -		return -ENODEV;
> -
> -	if (args->pad != 0)
> -		return -EINVAL;
> -
> -	ret = drm_gem_dma_resv_wait(file_priv, args->handle,
> -				    true, timeout_jiffies);
> -
> -	/* Decrement the user's timeout, in case we got interrupted
> -	 * such that the ioctl will be restarted.
> -	 */
> -	delta_ns = ktime_to_ns(ktime_sub(ktime_get(), start));
> -	if (delta_ns < args->timeout_ns)
> -		args->timeout_ns -= delta_ns;
> -	else
> -		args->timeout_ns = 0;
> -
> -	return ret;
> -}
> -
>   /**
>    * vc4_submit_cl_ioctl() - Submits a job (frame) to the VC4.
>    * @dev: DRM device
>

