Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D3F5A1D7C2
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jan 2025 15:08:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B01A310E531;
	Mon, 27 Jan 2025 14:08:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Qwv+YrDv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE44210E531
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jan 2025 14:08:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1737986883;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zR8Lw8IGEDS84mnZ2x73Xq3Ymaut8qRwt5YhN2RHp0g=;
 b=Qwv+YrDvLLdpr0/IaEkQW95RZsTSyS0VJSqtoWtmPwKmSXyNBQeDLkDZNtgEwjFHIeIA/m
 K7tsaquZRv5opD/tTOFAhWXOPGFKHF7CvDk/TMARL5HX2dr5PRR90mQuSfXNoELIMBkIuu
 xDqABkh5eYXW3i6npaG94T6ZD875hKQ=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-646-QMMRZ-XnPhmSRg9rsOy0UA-1; Mon, 27 Jan 2025 09:08:00 -0500
X-MC-Unique: QMMRZ-XnPhmSRg9rsOy0UA-1
X-Mimecast-MFC-AGG-ID: QMMRZ-XnPhmSRg9rsOy0UA
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-385e03f54d0so1755549f8f.3
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jan 2025 06:07:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737986878; x=1738591678;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zR8Lw8IGEDS84mnZ2x73Xq3Ymaut8qRwt5YhN2RHp0g=;
 b=gcEdCJvFtYr2liVygeoyXOOTNkT0q5ebe0Y2vbqcn1rC50bMBaE48SixwaCEw7pEhQ
 ZYmppYj1YAFQmj3julsXiR4yStG8gjEsprjT66Nfx6Im/86j/j5t/1OZbIDmjCobgck3
 aYsR0Qng3x6am2mutiJ6OsHJ6vNd104Equdp2QcotjHHFdXsB75nT4i7l5kYK68uWjBr
 IlSVx23IYIgVW6uE4wWBIuO+n2vbTLyhYQFkSCD6GvlrFbc1F9jpLTpp4JNVcGsG7HkI
 FBm18YqSa9BqT7IBHdajXoEeXO/hes2x0H/BfBcNSMJ1GaHEbWYg1vu9n/RQtNlmUDh/
 ygaQ==
X-Gm-Message-State: AOJu0Yy7960MzjSmRqHum+psRsh+wB7YX+33Cti79xvabXTidBfNaSZb
 Olh7KU+Qi2O3gyACpaj7NDU3ku6M/9OALvb9yNAzHAwM6gxwDjF+QNmSZjQqzOOqyTl+zGGzlIk
 dhHJxssrmfDqs8UkmY2IvqrzvU8uFzKDv2cK3PhJrA/+cxtWMzwHjp3U+EYMTYYg6Ag==
X-Gm-Gg: ASbGncsaGubsIbYMFFeQryS0oo4EIVYck1WENtlpPeWJbtbBU0UPZpKL0hr9fo2wgir
 iDKWjrqyarTCuequGrRbh97rawjziQhA0A68MOjGmRZ8NevTnuHA5MPlEoRC4z2rWx1b4fQSwq7
 Uw8cxX41HR3JK6/b+i9rZPUix5eIpz967NwzGIWYZsf36kC7QaoP8CQ8oo2MBU47S2hK0U6+IPr
 OqtVfqqFvGSVhGXcE+0auOfoYSp+tA96wPs+DCGtW4MFWUKmy1DCdDKyGmnKXMJe0CBdccbGM95
 J7PPi6eUAHmLn1VeEgItlPPNcEpOj25H4pqsLg5AhmDU
X-Received: by 2002:a5d:6b8b:0:b0:38a:8b2c:53ac with SMTP id
 ffacd0b85a97d-38bf57b3fe9mr27112551f8f.42.1737986878511; 
 Mon, 27 Jan 2025 06:07:58 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEE3g8f4oZ3mR7Gu+X5ihE0o/p/nxzvRr76U53vdHbo533RF2hLIvkpnKEtGmuyjpJGP5WYSA==
X-Received: by 2002:a5d:6b8b:0:b0:38a:8b2c:53ac with SMTP id
 ffacd0b85a97d-38bf57b3fe9mr27112512f8f.42.1737986878119; 
 Mon, 27 Jan 2025 06:07:58 -0800 (PST)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38c2a188a61sm11357664f8f.52.2025.01.27.06.07.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Jan 2025 06:07:57 -0800 (PST)
Message-ID: <83d74018-0029-413b-ac6b-77658b109e4a@redhat.com>
Date: Mon, 27 Jan 2025 15:07:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/ast: astdp: Fix timeout for enabling video signal
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@redhat.com
Cc: dri-devel@lists.freedesktop.org, stable@vger.kernel.org
References: <20250127134423.84266-1-tzimmermann@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20250127134423.84266-1-tzimmermann@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 4IU4msPfpUNm6aZPJ1TXdkLGWZBV6qBEYwyO90ccUIc_1737986878
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
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

On 27/01/2025 14:44, Thomas Zimmermann wrote:
> The ASTDP transmitter sometimes takes up to second for enabling the
> video signal, while the timeout is only 200 msec. This results in a
> kernel error message. Increase the timeout to 1 second. An example
> of the error message is shown below.
> 
> [  697.084433] ------------[ cut here ]------------
> [  697.091115] ast 0000:02:00.0: [drm] drm_WARN_ON(!__ast_dp_wait_enable(ast, enabled))
> [  697.091233] WARNING: CPU: 1 PID: 160 at drivers/gpu/drm/ast/ast_dp.c:232 ast_dp_set_enable+0x123/0x140 [ast]
> [...]
> [  697.272469] RIP: 0010:ast_dp_set_enable+0x123/0x140 [ast]
> [...]
> [  697.415283] Call Trace:
> [  697.420727]  <TASK>
> [  697.425908]  ? show_trace_log_lvl+0x196/0x2c0
> [  697.433304]  ? show_trace_log_lvl+0x196/0x2c0
> [  697.440693]  ? drm_atomic_helper_commit_modeset_enables+0x30a/0x470
> [  697.450115]  ? ast_dp_set_enable+0x123/0x140 [ast]
> [  697.458059]  ? __warn.cold+0xaf/0xca
> [  697.464713]  ? ast_dp_set_enable+0x123/0x140 [ast]
> [  697.472633]  ? report_bug+0x134/0x1d0
> [  697.479544]  ? handle_bug+0x58/0x90
> [  697.486127]  ? exc_invalid_op+0x13/0x40
> [  697.492975]  ? asm_exc_invalid_op+0x16/0x20
> [  697.500224]  ? preempt_count_sub+0x14/0xc0
> [  697.507473]  ? ast_dp_set_enable+0x123/0x140 [ast]
> [  697.515377]  ? ast_dp_set_enable+0x123/0x140 [ast]
> [  697.523227]  drm_atomic_helper_commit_modeset_enables+0x30a/0x470
> [  697.532388]  drm_atomic_helper_commit_tail+0x58/0x90
> [  697.540400]  ast_mode_config_helper_atomic_commit_tail+0x30/0x40 [ast]
> [  697.550009]  commit_tail+0xfe/0x1d0
> [  697.556547]  drm_atomic_helper_commit+0x198/0x1c0
> 
> This is a cosmetical problem. Enabling the video signal still works
> even with the error message. The problem has always been present, but
> only recent versions of the ast driver warn about missing the timeout.

Thanks, it looks good to me.

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>

> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Fixes: 4e29cc7c5c67 ("drm/ast: astdp: Replace ast_dp_set_on_off()")
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Jocelyn Falempe <jfalempe@redhat.com>
> Cc: Dave Airlie <airlied@redhat.com>
> Cc: dri-devel@lists.freedesktop.org
> Cc: <stable@vger.kernel.org> # v6.13+
> ---
>   drivers/gpu/drm/ast/ast_dp.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/ast/ast_dp.c b/drivers/gpu/drm/ast/ast_dp.c
> index 30aad5c0112a1..2d7482a65f62a 100644
> --- a/drivers/gpu/drm/ast/ast_dp.c
> +++ b/drivers/gpu/drm/ast/ast_dp.c
> @@ -201,7 +201,7 @@ static bool __ast_dp_wait_enable(struct ast_device *ast, bool enabled)
>   	if (enabled)
>   		vgacrdf_test |= AST_IO_VGACRDF_DP_VIDEO_ENABLE;
>   
> -	for (i = 0; i < 200; ++i) {
> +	for (i = 0; i < 1000; ++i) {
>   		if (i)
>   			mdelay(1);
>   		vgacrdf = ast_get_index_reg_mask(ast, AST_IO_VGACRI, 0xdf,

