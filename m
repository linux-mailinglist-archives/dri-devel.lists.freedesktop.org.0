Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A4D0BDA34B
	for <lists+dri-devel@lfdr.de>; Tue, 14 Oct 2025 17:04:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F98910E63C;
	Tue, 14 Oct 2025 15:03:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ursulin-net.20230601.gappssmtp.com header.i=@ursulin-net.20230601.gappssmtp.com header.b="P+NgjKVv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
 [209.85.221.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94B7F10E635
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Oct 2025 15:03:57 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id
 ffacd0b85a97d-3ee130237a8so4333297f8f.0
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Oct 2025 08:03:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ursulin-net.20230601.gappssmtp.com; s=20230601; t=1760454236; x=1761059036;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=KvLif0xXP5NnZk/gZt7mDLBmevCZybOrgLCvCymTSWA=;
 b=P+NgjKVv0jv5ACJpwXYkGD9jf0eMPj+XUtv476WSdJ1YMV60xrsMuGyuUagX2kLcKo
 1AyN0brZWj4tQMcJ1xev9TgNcTOp5XKys4v1HEaAEWVKdE8/WF7QAan42Y/tOXWU7PwG
 73pjDmotFY3JG1bJL+TbWOJQQ5DBBo7cc2BjZzr6f+LFlfXm6ZUB0kRCTLYrwGZfLxFw
 AXS63QF7hFh3vgSBOuJfBgRMAYZ66NdeaIIPq05Sx8pexMajQOaK+nZm7R/eOuaGezan
 xccb9w1jN/kUbWlYBQp2d5bd0zZyNS2CuKFJUUhb5aNVzPF6D5xBM0d8thdabIdcVjsH
 TG8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760454236; x=1761059036;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=KvLif0xXP5NnZk/gZt7mDLBmevCZybOrgLCvCymTSWA=;
 b=E1VVARspfL7Zae8LHJctDE+9OEB4aEtRiMerMJTIzVZO/e2rgqlHojEMYa6/Ujnrj7
 pHrtbl4hN14PKle1m29S9QczR4T+8WeAyoGCxT3eSiO6c27GZ48tWl+P+1oDwQwYIw5q
 +OcgNWieCU9T97me2L5bVUaSaXTrXI4xgL2jt5QRBOrBrAtVO7XM5Kr93H5kJJWopnj8
 1m7xED5fnrzzjATwigcX9MRwb99TiGdPLmSkoU0PHMRza7O1P+/S0KVGHUUS6yhAEwQO
 mZBtusD1N3C6zds6hN1YtxWkIGohoKaS0qHlp3UzwqGRe26Vhynt4i6T/GX6OIy+soXx
 2Nvg==
X-Gm-Message-State: AOJu0YxIvqLS/qagO0s1/mohAPAYs/un58r10aJVm5FlISQC//v6r0p0
 w+w0zYNkPuw/0Q/XXCQgTz0IuCjG5z2zf6yeMbbixOaNjoxTWNT8MRYMf6gy069PscQ=
X-Gm-Gg: ASbGncuFhfIjNz/lgfP3LKGhQ0B1cKmpm9zW7+hTR3aPsD2yjJ78q0sBreGeRuPKhiv
 ThpudJdlKdy8SOH2VsuuPjyBuIdgjDVdEGYv6VX+Ja+5AZb9h3rSGa1VZU9Y/GhC0OYDPkF3GYq
 1RhY847KWgMBmmkPDhQLMNEPnRI/+dMa+MOMlCCOPUi0fKcJsYT0MK9jkUfosCZE0HOky1arj+f
 kE2VfHEgyLJ4SUBaf8WBReSP+eKFJp+byPOpQTNomCqRCIK6O+rMkF9JmvHpMw75HmtBvMUOtBp
 sUx/Q9YDe1wRCcnbPU+Sv3mtzQ2wVSMNAus9ladmyUuAuSYQr18J4zwwyCKgc6V+eSN6AH9BZ8B
 RptF5FVT72ZLt3S+B1iNlZOU6GduEnCGcSMQhdtdvTFvikhSa1Qw0Bm3bntqU5esf4s0=
X-Google-Smtp-Source: AGHT+IEbGgBHynNzMEpqQZCy22mrVyYPNVZNNhtZAJURBbvEYkVoKSFha08SyV1BB8PWrTBOC2JRpQ==
X-Received: by 2002:a05:6000:24ca:b0:3e5:47a9:1c7f with SMTP id
 ffacd0b85a97d-4266e7df708mr16101225f8f.47.1760454235744; 
 Tue, 14 Oct 2025 08:03:55 -0700 (PDT)
Received: from [192.168.0.101] ([90.242.12.242])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-426ce5cf6b4sm24185121f8f.25.2025.10.14.08.03.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Oct 2025 08:03:55 -0700 (PDT)
Message-ID: <601678b2-8ebf-47f7-a1b9-077468dd8fc9@ursulin.net>
Date: Tue, 14 Oct 2025 16:03:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/15] dma-buf: rework stub fence initialisation
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 phasta@mailbox.org, alexdeucher@gmail.com, simona.vetter@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
References: <20251013143502.1655-1-christian.koenig@amd.com>
 <20251013143502.1655-3-christian.koenig@amd.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <20251013143502.1655-3-christian.koenig@amd.com>
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


On 13/10/2025 14:48, Christian König wrote:
> Instead of doing this on the first call of the function just initialize
> the stub fence during kernel load.
> 
> This has the clear advantage of lower overhead and also doesn't rely on
> the ops to not be NULL any more.
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>
> ---
>   drivers/dma-buf/dma-fence.c | 32 +++++++++++++++-----------------
>   1 file changed, 15 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
> index f0539c73ed57..51ee13d005bc 100644
> --- a/drivers/dma-buf/dma-fence.c
> +++ b/drivers/dma-buf/dma-fence.c
> @@ -121,29 +121,27 @@ static const struct dma_fence_ops dma_fence_stub_ops = {
>   	.get_timeline_name = dma_fence_stub_get_name,
>   };
>   
> +static int __init dma_fence_init_stub(void)
> +{
> +	dma_fence_init(&dma_fence_stub, &dma_fence_stub_ops,
> +		       &dma_fence_stub_lock, 0, 0);
> +
> +	set_bit(DMA_FENCE_FLAG_ENABLE_SIGNAL_BIT,
> +		&dma_fence_stub.flags);
> +
> +	dma_fence_signal_locked(&dma_fence_stub);
> +	return 0;
> +}
> +subsys_initcall(dma_fence_init_stub);
> +
>   /**
>    * dma_fence_get_stub - return a signaled fence
>    *
> - * Return a stub fence which is already signaled. The fence's
> - * timestamp corresponds to the first time after boot this
> - * function is called.
> + * Return a stub fence which is already signaled. The fence's timestamp
> + * corresponds to the initialisation time of the linux kernel.

We sure hope it's Linux kernel and not some imposter! :D (Ie. you can 
drop linux if you want.)

>    */
>   struct dma_fence *dma_fence_get_stub(void)
>   {
> -	spin_lock(&dma_fence_stub_lock);
> -	if (!dma_fence_stub.ops) {
> -		dma_fence_init(&dma_fence_stub,
> -			       &dma_fence_stub_ops,
> -			       &dma_fence_stub_lock,
> -			       0, 0);
> -
> -		set_bit(DMA_FENCE_FLAG_ENABLE_SIGNAL_BIT,
> -			&dma_fence_stub.flags);
> -
> -		dma_fence_signal_locked(&dma_fence_stub);
> -	}
> -	spin_unlock(&dma_fence_stub_lock);
> -
>   	return dma_fence_get(&dma_fence_stub);
>   }
>   EXPORT_SYMBOL(dma_fence_get_stub);

Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>

Regards,

Tvrtko

