Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cMsPN1cln2mPZAQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 25 Feb 2026 17:37:43 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3497819AC56
	for <lists+dri-devel@lfdr.de>; Wed, 25 Feb 2026 17:37:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13EF310E7F0;
	Wed, 25 Feb 2026 16:37:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ursulin.net header.i=@ursulin.net header.b="iFjK6UEP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F89A10E7F0
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Feb 2026 16:37:38 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id
 ffacd0b85a97d-436317c80f7so801015f8f.1
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Feb 2026 08:37:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ursulin.net; s=google; t=1772037457; x=1772642257; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=IIjuh7xicSafG0ljqjs2yM/yZzuJ98QSAxsCQUIs+5A=;
 b=iFjK6UEPZ1dzWXQmLp5EP80eWtIqB4AXR1ItfBf+M3hZWatBt3Yiv9joH3fcrc3A8V
 j8GGUTJAdSMdpwmAhNQAokXaCvOCgCtz8J14fGpCiYz9oFHq8y577Iwu/VcknjPAA8UM
 NNcHJA0VzsNVY33vVMq8a24gfWLbQvJeTUOWpJxmcz0KT/Rk2ryvqQ4RY6na5yz6bDM5
 4yL9eTqF82KpoDTIYXG8UPgAGFYWQNY9FVkjNqxOB7grA6vsFjYEq436k6LHKCEnUg2Z
 OmXliRQDJZqEFSyr+4XAzubSyMq0dj/O6VTOPVe/erqhEBOiZ/xGTgWz9iOuOMOwrgMZ
 Wa+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772037457; x=1772642257;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=IIjuh7xicSafG0ljqjs2yM/yZzuJ98QSAxsCQUIs+5A=;
 b=slEQqk6CHd7rwaYRVbCnzj/x1L0HjigdHI6vndBfgCz1F+C8wuEbdqbSbBiF2bQmlB
 G0Bynd32Ok9BkcW4k0hqXoivtqCZNQd/3ytOjA+mT/b/RDDiG8VLyn0Pi4Mmp24zKn+r
 JBwzkSkKRMQtqdgOSnWevYeHEh6mBSmYkDgqPjYGqiNpCMmTh0YVloH37yXyUvI23UwI
 EU/+kndTqR55OgOcWlLkCbka60cGylM47+d+gLnieoCFkJqiJkSUy3b6u9+H47l+3DGy
 GQK2iTsNhz8oRzses6gQmBGEuzHGJ38Ne6LSnlfZ678KSuOuauiQKytlCha52hn1c2Nd
 h0FQ==
X-Gm-Message-State: AOJu0Yy8otlP/7Ds6lnYVsqNNMLYSBQm6YRs9rJBB878K0U5XfP8dR9T
 XRlk+Q6d1XuH6kkMQXl4cMA7PROqLTJu5cjmMe8Me1pP3RqoEDig6mckwQHPLlXQ5Zs=
X-Gm-Gg: ATEYQzwG7MYnpBU0niLnReiRyGLhKaqi+2wDKsLWb4t8mhKz0C5Qh5B2OTUZt7fRHdl
 j5shDw4f67enBgqMqKga4u8m4h+vYMlh6B6YKPS7VMdHohYyliEnrfkLyUsDmn/7yxtYyXuuhlH
 ZL+R7OhXirpSzNdmMviS+p6nQPJeaizApjntppt19SsYMCR30xoWBf2hdi9FJcaz1Qtc7qd7g3g
 eobiXvVBJFSNwS8DyVPevIJrYc6U4V6NKA3gfxSBmpolKkuIX1LOH9pzKms5NHghPpRJAj/fPm6
 FAcqzKJxhvvWzSMFDxqAVQgcmH8My6NWvmFGxQbzAq5V2twYaT9/ZrMlPn488wiL66I7Z5YkZus
 bEdKTzj8Y8/DMOoI014fbi/BOcU6ZJizseypO/YttG/KXQVRxitsCFt1YvaAh6R5Uq5A1yJeN6O
 OhbhBfEiBEF5T8utgdp3QJuSJgGltmeC1Oad0IYHkZeKQZsb+26PHeRqo=
X-Received: by 2002:a05:6000:1867:b0:437:71b2:6f1a with SMTP id
 ffacd0b85a97d-4398d79a703mr7957440f8f.0.1772037456952; 
 Wed, 25 Feb 2026 08:37:36 -0800 (PST)
Received: from [192.168.0.101] ([90.240.106.137])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43970bfa015sm35229805f8f.8.2026.02.25.08.37.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Feb 2026 08:37:36 -0800 (PST)
Message-ID: <7ff6638b-53fc-4898-8219-fa498712d401@ursulin.net>
Date: Wed, 25 Feb 2026 16:37:35 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v3 2/3] drm/syncobj: Add
 DRM_SYNCOBJ_WAIT_FLAGS_ABORT_ON_ERROR ioctl flag
To: Yicong Hui <yiconghui@gmail.com>, christian.koenig@amd.com,
 michel.daenzer@mailbox.org
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 skhan@linuxfoundation.org, david.hunter.linux@gmail.com
References: <20260225124609.968505-1-yiconghui@gmail.com>
 <20260225124609.968505-3-yiconghui@gmail.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <20260225124609.968505-3-yiconghui@gmail.com>
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
	NEURAL_HAM(-0.00)[-0.986];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[mailbox.org:email,ursulin.net:mid,ursulin.net:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,amd.com:email]
X-Rspamd-Queue-Id: 3497819AC56
X-Rspamd-Action: no action


On 25/02/2026 12:46, Yicong Hui wrote:
> Add DRM_SYNCOBJ_WAIT_FLAGS_ABORT_ON_ERROR ioctl flag for the
> ioctls DRM_IOCTL_SYNCOBJ_WAIT and DRM_IOCTL_SYNCOBJ_TIMELINE_WAIT, which
> will make them abort their wait and return the error code and its
> associated syncobj.
> 
> Suggested-by: Christian König <christian.koenig@amd.com>
> Suggested-by: Michel Dänzer <michel.daenzer@mailbox.org>
> Signed-off-by: Yicong Hui <yiconghui@gmail.com>
> ---
> Changes in v3:
> * Fixed inline comments by converting to multi-line comments in
> accordance to kernel style guidelines.
> * Used dma_fence_get_status to query error instead of getting it
> directly.
> 
>   drivers/gpu/drm/drm_syncobj.c | 27 +++++++++++++++++++++++----
>   include/uapi/drm/drm.h        |  6 ++++++
>   2 files changed, 29 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_syncobj.c b/drivers/gpu/drm/drm_syncobj.c
> index b74e491f9d8b..2b23f638c1cc 100644
> --- a/drivers/gpu/drm/drm_syncobj.c
> +++ b/drivers/gpu/drm/drm_syncobj.c
> @@ -1042,6 +1042,7 @@ static signed long drm_syncobj_array_wait_timeout(struct drm_syncobj **syncobjs,
>   	struct dma_fence *fence;
>   	uint64_t *points;
>   	uint32_t signaled_count, i;
> +	int status;
>   
>   	if (flags & (DRM_SYNCOBJ_WAIT_FLAGS_WAIT_FOR_SUBMIT |
>   		     DRM_SYNCOBJ_WAIT_FLAGS_WAIT_AVAILABLE)) {
> @@ -1139,6 +1140,14 @@ static signed long drm_syncobj_array_wait_timeout(struct drm_syncobj **syncobjs,
>   			if (!fence)
>   				continue;
>   
> +			status = dma_fence_get_status(fence);
> +			if ((flags & DRM_SYNCOBJ_WAIT_FLAGS_ABORT_ON_ERROR) && status < 0) {
> +				if (idx)
> +					*idx = i;
> +				timeout = status;
> +				goto done_waiting;
> +			}
> +
>   			if ((flags & DRM_SYNCOBJ_WAIT_FLAGS_WAIT_AVAILABLE) ||
>   			    dma_fence_is_signaled(fence) ||
>   			    (!entries[i].fence_cb.func &&
> @@ -1242,8 +1251,12 @@ static int drm_syncobj_array_wait(struct drm_device *dev,
>   							 wait->flags,
>   							 timeout, &first,
>   							 deadline);

I am calling this helper an unhelpful helper and was suggesting to get 
rid of it:

https://lore.kernel.org/dri-devel/20250611140057.27259-2-tvrtko.ursulin@igalia.com/

"""
Helper which fails to consolidate the code and instead just forks into two
copies of the code based on a boolean parameter is not very helpful or
readable. Lets just remove it and proof in the pudding is the net smaller
code.
"""

Can we please nuke it?

> -		if (timeout < 0)
> +		if (timeout < 0) {
> +			if (wait->flags & DRM_SYNCOBJ_WAIT_FLAGS_ABORT_ON_ERROR)
> +				wait->first_signaled = first;

There can be timeout < 0 for reasons other than 
DRM_SYNCOBJ_WAIT_FLAGS_ABORT_ON_ERROR. Will 'first' contain a valid 
value to return to userspace in that case? Will userspace even be able 
to meaningfully distinguish between ioctl returning negative due some 
random error, versus a fence error where otherwise nothing else failed?

> +
>   			return timeout;
> +		}
>   		wait->first_signaled = first;
>   	} else {
>   		timeout = drm_timeout_abs_to_jiffies(timeline_wait->timeout_nsec);
> @@ -1253,8 +1266,12 @@ static int drm_syncobj_array_wait(struct drm_device *dev,
>   							 timeline_wait->flags,
>   							 timeout, &first,
>   							 deadline);
> -		if (timeout < 0)
> +		if (timeout < 0) {
> +			if (timeline_wait->flags & DRM_SYNCOBJ_WAIT_FLAGS_ABORT_ON_ERROR)
> +				timeline_wait->first_signaled = first;
> +
>   			return timeout;
> +		}
>   		timeline_wait->first_signaled = first;
>   	}
>   	return 0;
> @@ -1332,7 +1349,8 @@ drm_syncobj_wait_ioctl(struct drm_device *dev, void *data,
>   
>   	possible_flags = DRM_SYNCOBJ_WAIT_FLAGS_WAIT_ALL |
>   			 DRM_SYNCOBJ_WAIT_FLAGS_WAIT_FOR_SUBMIT |
> -			 DRM_SYNCOBJ_WAIT_FLAGS_WAIT_DEADLINE;
> +			 DRM_SYNCOBJ_WAIT_FLAGS_WAIT_DEADLINE |
> +			 DRM_SYNCOBJ_WAIT_FLAGS_ABORT_ON_ERROR;
>   
>   	if (args->flags & ~possible_flags)
>   		return -EINVAL;
> @@ -1376,7 +1394,8 @@ drm_syncobj_timeline_wait_ioctl(struct drm_device *dev, void *data,
>   	possible_flags = DRM_SYNCOBJ_WAIT_FLAGS_WAIT_ALL |
>   			 DRM_SYNCOBJ_WAIT_FLAGS_WAIT_FOR_SUBMIT |
>   			 DRM_SYNCOBJ_WAIT_FLAGS_WAIT_AVAILABLE |
> -			 DRM_SYNCOBJ_WAIT_FLAGS_WAIT_DEADLINE;
> +			 DRM_SYNCOBJ_WAIT_FLAGS_WAIT_DEADLINE |
> +			 DRM_SYNCOBJ_WAIT_FLAGS_ABORT_ON_ERROR;
>   
>   	if (args->flags & ~possible_flags)
>   		return -EINVAL;
> diff --git a/include/uapi/drm/drm.h b/include/uapi/drm/drm.h
> index 213b4dc9b612..e998d9351525 100644
> --- a/include/uapi/drm/drm.h
> +++ b/include/uapi/drm/drm.h
> @@ -977,6 +977,12 @@ struct drm_syncobj_transfer {
>   #define DRM_SYNCOBJ_WAIT_FLAGS_WAIT_FOR_SUBMIT (1 << 1)
>   #define DRM_SYNCOBJ_WAIT_FLAGS_WAIT_AVAILABLE (1 << 2) /* wait for time point to become available */
>   #define DRM_SYNCOBJ_WAIT_FLAGS_WAIT_DEADLINE (1 << 3) /* set fence deadline to deadline_nsec */
> +/*
> + * As soon as any of the fences in the set have an error,
> + * abort waiting and return its error code. Index of this
> + * first failed fence is returned in first_signaled.

What else can be returned in first_signaled?

Regards,

Tvrtko

> + */
> +#define DRM_SYNCOBJ_WAIT_FLAGS_ABORT_ON_ERROR (1 << 4)
>   struct drm_syncobj_wait {
>   	__u64 handles;
>   	/* absolute timeout */

