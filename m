Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 331959F638B
	for <lists+dri-devel@lfdr.de>; Wed, 18 Dec 2024 11:41:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B19C210EB5B;
	Wed, 18 Dec 2024 10:41:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="puKyDylp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 048F810EB5B
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Dec 2024 10:41:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=wZEniM/2Nn6hjg1ZC00ZDvQ1FUtTUX37QQl4uIZPIwA=; b=puKyDylpER8GPNY7zwlSASMnIz
 OAOXZ3GXBZs6ibCfR2hBf1xZ0oiin8bGLLucGxLtyXxxYcggU4fhai8E2G2MJU9s7/eMlgeTUS3Oo
 YlJ/1/ELjhgSCJh8hVEkh61o43GHXkYzwNyrZ6st+WLk6seDka6ww1w9kvNTIyR6VOI/CphkErWJN
 LwOjiNhWgXIPAHhpPeegcUi1ltixHPVOQ7459qICyOUoQiHGJNXW2GXGX1Wm7u0XFA8EBPIR0R2WW
 aF2iWRrOzbkqgCdEZa9WvAQD0XU/9Aw2QVFZq11AmfXvICj2LeKEJCar0zGf3OcTPbRoGNr44bkSj
 WkGFIlRg==;
Received: from [90.241.98.187] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1tNrUP-004kdl-M1; Wed, 18 Dec 2024 11:41:13 +0100
Message-ID: <37e139ad-d2e0-4f60-b032-96be4f6ea9dc@igalia.com>
Date: Wed, 18 Dec 2024 10:41:12 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] drm/vc4: Use DMA Resv to implement VC4 wait BO
 IOCTL
To: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Melissa Wen <mwen@igalia.com>, Maxime Ripard <mripard@kernel.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Tvrtko Ursulin <tursulin@igalia.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, kernel-dev@igalia.com
References: <20241212202337.381614-1-mcanal@igalia.com>
 <20241212202337.381614-3-mcanal@igalia.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <20241212202337.381614-3-mcanal@igalia.com>
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


On 12/12/2024 20:20, Maíra Canal wrote:
> As the BOs used by VC4 have DMA Reservation Objects attached to it,
> there is no need to use seqnos wait for the BOs availability. Instead,
> we can use `dma_gem_dma_resv_wait()`.
> 
> Signed-off-by: Maíra Canal <mcanal@igalia.com>
> ---
>   drivers/gpu/drm/vc4/vc4_drv.h | 10 ++++++++++
>   drivers/gpu/drm/vc4/vc4_gem.c | 31 +++++++++++++++++++------------
>   2 files changed, 29 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vc4/vc4_drv.h b/drivers/gpu/drm/vc4/vc4_drv.h
> index 4a078ffd9f82..03ed40ab9a93 100644
> --- a/drivers/gpu/drm/vc4/vc4_drv.h
> +++ b/drivers/gpu/drm/vc4/vc4_drv.h
> @@ -924,6 +924,16 @@ struct vc4_validated_shader_info {
>   						   (Wmax))
>   #define wait_for(COND, MS)		_wait_for((COND), (MS) * 1000, 10, 1000)
>   
> +static inline unsigned long nsecs_to_jiffies_timeout(const u64 n)
> +{
> +	/* nsecs_to_jiffies64() does not guard against overflow */
> +	if ((NSEC_PER_SEC % HZ) != 0 &&
> +	    div_u64(n, NSEC_PER_SEC) >= MAX_JIFFY_OFFSET / HZ)
> +		return MAX_JIFFY_OFFSET;
> +
> +	return min_t(u64, MAX_JIFFY_OFFSET, nsecs_to_jiffies64(n) + 1);
> +}
> +
>   /* vc4_bo.c */
>   struct drm_gem_object *vc4_create_object(struct drm_device *dev, size_t size);
>   struct vc4_bo *vc4_bo_create(struct drm_device *dev, size_t size,
> diff --git a/drivers/gpu/drm/vc4/vc4_gem.c b/drivers/gpu/drm/vc4/vc4_gem.c
> index 1021f45cb53c..4037c65eb269 100644
> --- a/drivers/gpu/drm/vc4/vc4_gem.c
> +++ b/drivers/gpu/drm/vc4/vc4_gem.c
> @@ -1017,11 +1017,13 @@ int
>   vc4_wait_bo_ioctl(struct drm_device *dev, void *data,
>   		  struct drm_file *file_priv)
>   {
> -	struct vc4_dev *vc4 = to_vc4_dev(dev);
>   	int ret;
> +	struct vc4_dev *vc4 = to_vc4_dev(dev);
>   	struct drm_vc4_wait_bo *args = data;
> -	struct drm_gem_object *gem_obj;
> -	struct vc4_bo *bo;
> +	unsigned long timeout_jiffies =
> +		nsecs_to_jiffies_timeout(args->timeout_ns);

What about a potentially simpler alternative:

timeout_jiffies = usecs_to_jiffies(div_u64(args->timeout_ns, 1000));

No need for a new helper and code cannot sleep for less than one jiffy 
anyway.

> +	ktime_t start = ktime_get();
> +	u64 delta_ns;
>   
>   	if (WARN_ON_ONCE(vc4->gen > VC4_GEN_4))
>   		return -ENODEV;
> @@ -1029,17 +1031,22 @@ vc4_wait_bo_ioctl(struct drm_device *dev, void *data,
>   	if (args->pad != 0)
>   		return -EINVAL;
>   
> -	gem_obj = drm_gem_object_lookup(file_priv, args->handle);
> -	if (!gem_obj) {
> -		DRM_DEBUG("Failed to look up GEM BO %d\n", args->handle);
> -		return -EINVAL;
> -	}
> -	bo = to_vc4_bo(gem_obj);
> +	ret = drm_gem_dma_resv_wait(file_priv, args->handle,
> +				    true, timeout_jiffies);
>   
> -	ret = vc4_wait_for_seqno_ioctl_helper(dev, bo->seqno,
> -					      &args->timeout_ns);
> +	/* Decrement the user's timeout, in case we got interrupted
> +	 * such that the ioctl will be restarted.
> +	 */
> +	delta_ns = ktime_to_ns(ktime_sub(ktime_get(), start));
> +	if (delta_ns < args->timeout_ns)
> +		args->timeout_ns -= delta_ns;
> +	else
> +		args->timeout_ns = 0;
> +
> +	/* Asked to wait beyond the jiffy/scheduler precision? */
> +	if (ret == -ETIME && args->timeout_ns)
> +		ret = -EAGAIN;

EAGAIN is new from here, right? Will userspace cope in the right way?

Regards,

Tvrtko

>   
> -	drm_gem_object_put(gem_obj);
>   	return ret;
>   }
>   
