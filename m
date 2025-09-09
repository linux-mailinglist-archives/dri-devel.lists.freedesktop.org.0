Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 20226B4A4EF
	for <lists+dri-devel@lfdr.de>; Tue,  9 Sep 2025 10:17:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93A3610E236;
	Tue,  9 Sep 2025 08:17:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ursulin-net.20230601.gappssmtp.com header.i=@ursulin-net.20230601.gappssmtp.com header.b="q50nA+kw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C63B310E64A
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Sep 2025 08:17:41 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id
 ffacd0b85a97d-3d19699240dso3748196f8f.1
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Sep 2025 01:17:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ursulin-net.20230601.gappssmtp.com; s=20230601; t=1757405860; x=1758010660;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=6bIhnKcS3S70H3FZzFxNSCh5KKC75qWJ8QzD4ToSAuU=;
 b=q50nA+kwteKk+1OVZKAnJgmB9ACboZHFfbmfmcmJUPf2OyPkwMhZqoMj7Nc4QAL7Au
 KSJpNOWYQWzhkZ2VxLvOYpPiO6nqx3leJHBm7k3d2eumD+Vn64MDlhn6xIByhUgMhzWe
 KNrdgg1Dde0nua9+O+g0We2yAHYF6p7gh1psRMZC9BRZ+DKvLBzojQhapDDM6vP2M7AB
 atY8D0K+rIVTF1CMpc+kDLck09ep+irhmx8DEmE1llI0h2gpYQh53NnGPZCOM2odNwC9
 Yo3LD3wIumjOZ94zHzLqmGPUHCHJsCygedOjlyt7fYINKdYq5yZ03+M5EcR0V4DCnDn+
 CUGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757405860; x=1758010660;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6bIhnKcS3S70H3FZzFxNSCh5KKC75qWJ8QzD4ToSAuU=;
 b=MOiN4W9R2xqC3BetRd/7dr+46jBPSG0zz8PK6Z+r0EfYZwp2h0svfcasPO4M+aIcA7
 QC69PAZRnuN8wHqwQxw4LAcyMkWUyauUqV9N/5uWFL+oUkwgqNZO3GOoY4ofp3iayVpM
 nRYr207vH+5jDOLhuWhOUQ3azqc2WcKJvqMX+uqk2BB4+hdS9r3MRWcbfyt7dm87j9Xp
 BU8hTmgD1mZVHTCyAVOqpkN1dJ4mEw6osa2dmaJeUb0HFFaqtKHXwNryZU1l41CEt7lp
 TpZzy8VqqNnaTna+epEwQrTXJeuP2X8/NAH1oXSdceigPkkabVkyU/I3aTPL4lj+gs04
 +THg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXGdnakzGmN0zerinzmMq56nrcG5n1a+QwbtJrn3TDXH8/By3hBVY86mJMhMG42BSGMkdT9mEwl44w=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwcwFOjgK8y6SCUXyVPyqcrfkvDqXV/LUrLqDWmawLWTlrc6/AS
 Y5s5RKUDtRvvviKjGQNeNR1RyTh7byUP72L6avZvBBIesvOH9acYuNsJSj+D+uHE8Vs=
X-Gm-Gg: ASbGncu6NiQ5nm827i0JRkWcL95BcN/sa0M1BAFxb81Pm5X7D188a8k27Ltk0Kn6yvh
 CcpLTds6xTKcSEwlJuEydyjDfLptdl1A3hFmxmlGGmItZ2uz664RT1iqAIcFJ2mKDhon4qg4o9w
 SyH2aI3QKfxfec2xhJsIL6QQmdpGWsTZMEZ49x4wOeLz7RTZLYPVfOAYtmVQ/rpSP1b0Sf98DNF
 55CK9dWgASCt7P14XfjtLvXSzdVcq3IeBLc5d2P3VQuVwcIZoyXZ2D9QfIQ/GdH8LvcHB4WrVxZ
 dvCG1oueDNyZ8BfaFolHkvV8TlZHIOMgcSuA1ICyNSw8Hm4unRMW0KMZ6E1C2qgnQohatzA5bWU
 CPwhe3ayJ6opAHn32WTfj3Jlh2HOrzF7pU4E=
X-Google-Smtp-Source: AGHT+IGk/HS1vx4EfCGI4dFGwAuLXmkcrlGKuUZjVSXZ43a4gop7RXKKeI1Ok/7F2vR2eAlPxii3Yg==
X-Received: by 2002:a05:6000:178a:b0:3d8:3eca:a97d with SMTP id
 ffacd0b85a97d-3e6289efdafmr9689272f8f.11.1757405859678; 
 Tue, 09 Sep 2025 01:17:39 -0700 (PDT)
Received: from [192.168.0.101] ([84.66.36.92])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3e752238851sm1551187f8f.29.2025.09.09.01.17.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Sep 2025 01:17:39 -0700 (PDT)
Message-ID: <4005498b-d866-4e41-a8a4-d8228b2062e7@ursulin.net>
Date: Tue, 9 Sep 2025 09:17:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amdgpu: Replace kzalloc + copy_from_user with
 memdup_user
To: Thorsten Blum <thorsten.blum@linux.dev>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20250908211559.519892-1-thorsten.blum@linux.dev>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <20250908211559.519892-1-thorsten.blum@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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


On 08/09/2025 22:15, Thorsten Blum wrote:
> Replace kzalloc() followed by copy_from_user() with memdup_user() to
> improve and simplify ta_if_load_debugfs_write() and
> ta_if_invoke_debugfs_write().
> 
> No functional changes intended.
> 
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_psp_ta.c | 20 ++++++--------------
>   1 file changed, 6 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp_ta.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_psp_ta.c
> index 38face981c3e..6e8aad91bcd3 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp_ta.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_psp_ta.c
> @@ -171,13 +171,9 @@ static ssize_t ta_if_load_debugfs_write(struct file *fp, const char *buf, size_t
>   
>   	copy_pos += sizeof(uint32_t);
>   
> -	ta_bin = kzalloc(ta_bin_len, GFP_KERNEL);
> -	if (!ta_bin)
> -		return -ENOMEM;
> -	if (copy_from_user((void *)ta_bin, &buf[copy_pos], ta_bin_len)) {
> -		ret = -EFAULT;
> -		goto err_free_bin;
> -	}
> +	ta_bin = memdup_user(&buf[copy_pos], ta_bin_len);
> +	if (IS_ERR(ta_bin))
> +		return PTR_ERR(ta_bin);
>   
>   	/* Set TA context and functions */
>   	set_ta_context_funcs(psp, ta_type, &context);
> @@ -327,13 +323,9 @@ static ssize_t ta_if_invoke_debugfs_write(struct file *fp, const char *buf, size
>   		return -EFAULT;
>   	copy_pos += sizeof(uint32_t);
>   
> -	shared_buf = kzalloc(shared_buf_len, GFP_KERNEL);
> -	if (!shared_buf)
> -		return -ENOMEM;
> -	if (copy_from_user((void *)shared_buf, &buf[copy_pos], shared_buf_len)) {
> -		ret = -EFAULT;
> -		goto err_free_shared_buf;
> -	}
> +	shared_buf = memdup_user(&buf[copy_pos], shared_buf_len);
> +	if (IS_ERR(shared_buf))
> +		return PTR_ERR(shared_buf);
>   
>   	set_ta_context_funcs(psp, ta_type, &context);
>   

More complete than the one I sent in June^1.

Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>

I had some other in that series, not sure if you caught those.

Regards,

Tvrtko

1)
https://lore.kernel.org/amd-gfx/20250612104430.41169-1-tvrtko.ursulin@igalia.com/

