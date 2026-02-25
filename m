Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GJegI5Yhn2mPZAQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 25 Feb 2026 17:21:42 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB46519A7D8
	for <lists+dri-devel@lfdr.de>; Wed, 25 Feb 2026 17:21:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 357DC10E255;
	Wed, 25 Feb 2026 16:21:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ursulin.net header.i=@ursulin.net header.b="FwortLot";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8AA210E255
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Feb 2026 16:21:37 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-4806cc07ce7so66581865e9.1
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Feb 2026 08:21:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ursulin.net; s=google; t=1772036496; x=1772641296; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=OO3CJh02/qdvHrL++jNNJeGHaSQf/MMi0XFi9TCjoGc=;
 b=FwortLotrmq3PzCM4qeX7wHF6W7mo+EPUvyYFlXmf9F9IepMsRdEUIioA4pBHmIUT2
 QMVevTrzqthRsNovtu5t+PNoEKg9AxmH58Z4W2qdDQOyqN581YBl9muBfTlBE39qrAkM
 EbLSkwOQzSJroS6C9w2L2zso9ne/hYZADmUKMIj6k+Bg+aPVmwnf8qz53Q5m0TGegAcn
 QEZAwoMeN5RUb7V+gts6h6UCx5kC5CZp2Q4TkstdQpUpfwhfuGneAm9U4qO/edAUQAGw
 DKeFJDwn+gWa/I5vSlvARX6ztHee4FrhsDJQErmfGotx3xl6f6y9EJgi4BR5XiBayQSq
 dh4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772036496; x=1772641296;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=OO3CJh02/qdvHrL++jNNJeGHaSQf/MMi0XFi9TCjoGc=;
 b=qZvDUaEp/4ZTgQPKDI0NPweuLE7ecWgE3311cVTyZJ5+nbvlQ+Q7RWiBKuMr94PwYl
 ppF2hW04auRIMhSUncg17PY+cQKEWA299kPLWwD8lPZGSLjH8PKyBizKV6BfejYBvjDC
 RN0bxxioUyjORWoRN0Ua67c3357olG3F2UBGGI6uCtIT7AvExbsuUnZXHw2YP2iAoAdq
 W3+gntRzxFSttWqT+zWQmJFrYXhdjMqs7jw1SJM4ELFtuXc64LBClqtzMSQgtNbaqeNV
 KOeQCNuxDEAyHBkVf8zNduFTaruSbd2d/TzPpzmxpMZXokN6SCgw20nmMjPjsM/FRgWr
 3n3w==
X-Gm-Message-State: AOJu0Yw0C2NbHsO297sJYbeyWcVK4it5h17M92SHJJSHQCNGa8HyuoOx
 NGGtktnZL/L5YimPugtdemjj0bT6qpmaXti7Lc7u4kmse49Alzb5hEf5lQ+Y39Twsqg=
X-Gm-Gg: ATEYQzxVpqfCXrLo52fZKfydZpl/wXASDmfqHQccoKlY6A2HOK6OkA9m5RfZ8JoPgex
 aANb7UtNxfm5nxt+QkOuxaB9NEzv+BrPSR1SwmHNz3cx6yG62Ri+G02DeIiBlxx9dAVBDRBIYzD
 3EYV74iVi2LAW+tOTI63hE0v49y4iSVV7phi4u/pcAzbZkp2dpozHnFpVZI1ZqchXpmssgzwUo5
 DEq4EK9qQHUI4TIulYclRW1MGlMW0emuFgnzb+KXs+ThZQmYfYmPbjxw1e1h4N7Wbg2qC9cJ4pl
 xlAeKV+J48UOFrcELrcHf/iQMdl7SExUOzZOAK/kBndCHi1AUWhhKkaMyRVrRAVJzhFdDHyKOOc
 dcdZVQiXyEbr3lG41B+QHPaKLkjaufkUUP+ruwF8LB5otWPjc/cX3JD7RjPuUnogiePbJswspKo
 Uzf0GYP2L3btTqm1myH/8HRSe6KcVBjU330THy2gn765EI
X-Received: by 2002:a05:600d:8450:20b0:483:b505:9db4 with SMTP id
 5b1f17b1804b1-483b5059e2dmr134758965e9.31.1772036495912; 
 Wed, 25 Feb 2026 08:21:35 -0800 (PST)
Received: from [192.168.0.101] ([90.240.106.137])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483bfabb84esm54103155e9.0.2026.02.25.08.21.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Feb 2026 08:21:34 -0800 (PST)
Message-ID: <e06314cd-7cc1-4d1b-8f2d-bbbcc372ab82@ursulin.net>
Date: Wed, 25 Feb 2026 16:21:34 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v3 1/3] drm/syncobj: Add flag
 DRM_SYNCOBJ_QUERY_FLAGS_ERROR to query errors
To: Yicong Hui <yiconghui@gmail.com>, christian.koenig@amd.com,
 michel.daenzer@mailbox.org
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 skhan@linuxfoundation.org, david.hunter.linux@gmail.com
References: <20260225124609.968505-1-yiconghui@gmail.com>
 <20260225124609.968505-2-yiconghui@gmail.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <20260225124609.968505-2-yiconghui@gmail.com>
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
X-Spamd-Result: default: False [0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[ursulin.net:s=google];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_NA(0.00)[ursulin.net];
	FORGED_RECIPIENTS(0.00)[m:yiconghui@gmail.com,m:christian.koenig@amd.com,m:michel.daenzer@mailbox.org,m:linux-kernel@vger.kernel.org,m:skhan@linuxfoundation.org,m:david.hunter.linux@gmail.com,m:davidhunterlinux@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,amd.com,mailbox.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[tursulin@ursulin.net,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[ursulin.net:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.993];
	MID_RHS_MATCH_FROM(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[tursulin@ursulin.net,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,vger.kernel.org,linuxfoundation.org,gmail.com];
	RCPT_COUNT_SEVEN(0.00)[7];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,mailbox.org:email]
X-Rspamd-Queue-Id: DB46519A7D8
X-Rspamd-Action: no action


On 25/02/2026 12:46, Yicong Hui wrote:
> Add flag DRM_SYNCOBJ_QUERY_FLAGS_ERROR to make the
> DRM_IOCTL_SYNCOBJ_QUERY ioctl fill out the handles array with the
> error code of the first fence found per syncobj and 0 if one is not
> found and maintain the normal return value in points.
> 
> Suggested-by: Christian König <christian.koenig@amd.com>
> Suggested-by: Michel Dänzer <michel.daenzer@mailbox.org>
> Signed-off-by: Yicong Hui <yiconghui@gmail.com>
> ---
> Changes in v3:
> * Fixed inline comments by converting to multi-line comments in
> accordance to kernel style guidelines.
> * No longer using a separate superfluous function to walk the fence
> chain, and instead queries the last signaled fence in in the chain for
> its error code
> * Fixed types for error and handles array.
> 
> 
>   drivers/gpu/drm/drm_syncobj.c | 22 ++++++++++++++++++++--
>   include/uapi/drm/drm.h        |  5 +++++
>   2 files changed, 25 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_syncobj.c b/drivers/gpu/drm/drm_syncobj.c
> index 2d4ab745fdad..b74e491f9d8b 100644
> --- a/drivers/gpu/drm/drm_syncobj.c
> +++ b/drivers/gpu/drm/drm_syncobj.c
> @@ -1654,14 +1654,17 @@ int drm_syncobj_query_ioctl(struct drm_device *dev, void *data,
>   {
>   	struct drm_syncobj_timeline_array *args = data;
>   	struct drm_syncobj **syncobjs;
> +	unsigned int valid_flags = DRM_SYNCOBJ_QUERY_FLAGS_LAST_SUBMITTED |
> +				   DRM_SYNCOBJ_QUERY_FLAGS_ERROR;
>   	uint64_t __user *points = u64_to_user_ptr(args->points);
> +	uint32_t __user *handles = u64_to_user_ptr(args->handles);
>   	uint32_t i;
> -	int ret;
> +	int ret, error;
>   
>   	if (!drm_core_check_feature(dev, DRIVER_SYNCOBJ_TIMELINE))
>   		return -EOPNOTSUPP;
>   
> -	if (args->flags & ~DRM_SYNCOBJ_QUERY_FLAGS_LAST_SUBMITTED)
> +	if (args->flags & ~valid_flags)
>   		return -EINVAL;
>   
>   	if (args->count_handles == 0)
> @@ -1681,6 +1684,7 @@ int drm_syncobj_query_ioctl(struct drm_device *dev, void *data,
>   
>   		fence = drm_syncobj_fence_get(syncobjs[i]);
>   		chain = to_dma_fence_chain(fence);
> +

Random whitespace changes should be avoided.

>   		if (chain) {
>   			struct dma_fence *iter, *last_signaled =
>   				dma_fence_get(fence);
> @@ -1688,6 +1692,8 @@ int drm_syncobj_query_ioctl(struct drm_device *dev, void *data,
>   			if (args->flags &
>   			    DRM_SYNCOBJ_QUERY_FLAGS_LAST_SUBMITTED) {
>   				point = fence->seqno;
> +				error = dma_fence_get_status(fence);
> +

Ditto.

>   			} else {
>   				dma_fence_chain_for_each(iter, fence) {
>   					if (iter->context != fence->context) {
> @@ -1702,16 +1708,28 @@ int drm_syncobj_query_ioctl(struct drm_device *dev, void *data,
>   				point = dma_fence_is_signaled(last_signaled) ?
>   					last_signaled->seqno :
>   					to_dma_fence_chain(last_signaled)->prev_seqno;
> +
> +				error = dma_fence_get_status(last_signaled);
>   			}
>   			dma_fence_put(last_signaled);
>   		} else {
>   			point = 0;
> +			error = fence ? dma_fence_get_status(fence) : 0;
>   		}
>   		dma_fence_put(fence);
> +

More of the same. Although in this case I think it is an improvement so 
you may keep it.

>   		ret = copy_to_user(&points[i], &point, sizeof(uint64_t));
>   		ret = ret ? -EFAULT : 0;
>   		if (ret)
>   			break;
> +
> +		if (args->flags & DRM_SYNCOBJ_QUERY_FLAGS_ERROR) {
> +			ret = copy_to_user(&handles[i], &error, sizeof(*handles));
> +

This blank line is not inserted between the existing code but still 
please remove it - it is not separating any logical blocks so it is not 
improving readability.

Apart from nitpicks, the implementation looks correct to me. But 
userspace folks need to bless it and use it, as other people have 
already commented.

And uapi is fine since fence status is already UABI courtesy of 
sync_file. So it is not promoting anything kernel internal to UABI.

> +			ret = ret ? -EFAULT : 0;
> +			if (ret)
> +				break;
> +		}
>   	}
>   	drm_syncobj_array_free(syncobjs, args->count_handles);
>   
> diff --git a/include/uapi/drm/drm.h b/include/uapi/drm/drm.h
> index 27cc159c1d27..213b4dc9b612 100644
> --- a/include/uapi/drm/drm.h
> +++ b/include/uapi/drm/drm.h
> @@ -1044,6 +1044,11 @@ struct drm_syncobj_array {
>   };
>   
>   #define DRM_SYNCOBJ_QUERY_FLAGS_LAST_SUBMITTED (1 << 0) /* last available point on timeline syncobj */
> +/*
> + * Copy the status of the fence as output into the handles array.
> + * The handles array is overwritten by that.

The documentation could be improved though. Make it clear that one 
status per handle is returned (use more plural) and we need an 
explanation of what is the status, or a link to something existing.

For example sync_file uapi header documents it like this:

  * @status:		status of the fence 0:active 1:signaled <0:error

See if you can come up with something clear and to the point for this 
comment block?

Regards,

Tvrtko

> + */
> +#define DRM_SYNCOBJ_QUERY_FLAGS_ERROR (1 << 1)
>   struct drm_syncobj_timeline_array {
>   	__u64 handles;
>   	__u64 points;

