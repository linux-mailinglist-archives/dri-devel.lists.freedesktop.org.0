Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 180BCA1D7E9
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jan 2025 15:18:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D164710E545;
	Mon, 27 Jan 2025 14:18:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="HnjxVuHV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4999010E546
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jan 2025 14:18:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1737987517;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RUYQ7pH0Tj2ls0rlf+7DVR9qDn76hIwV2M62iOqIZXU=;
 b=HnjxVuHVsllXbNYhISnSWLRWnzlB4DdCkBzemdw/wSCFr8mB3idsHVrUTrAYQdhCMyz1CW
 oIJKXEHIN5fyAsf4NiU6ldXRSsAAsCeDEieSz8CDRdQUToNkmRrH74a53jd+WPkDzwwnQB
 AU66Fxwckm9Rg2/fAAyWwnZlrdKf5Wc=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-606-1Y2DP6jMPpC_oczbXehNTg-1; Mon, 27 Jan 2025 09:18:35 -0500
X-MC-Unique: 1Y2DP6jMPpC_oczbXehNTg-1
X-Mimecast-MFC-AGG-ID: 1Y2DP6jMPpC_oczbXehNTg
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-385d52591d6so1907231f8f.1
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jan 2025 06:18:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737987514; x=1738592314;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=RUYQ7pH0Tj2ls0rlf+7DVR9qDn76hIwV2M62iOqIZXU=;
 b=GngFZqy1Lf0nXQATRie+Oqh82WDOAfNN30evZm4x6emXbPGrTO4To53RtEm72pMhhW
 uw/YzkGLUTdw03qy04uF67vDfA6WPX/smcg6TUZVoEIrMjz/N68m1Yh0eLk/h9HDzTLy
 oHdf1+haHqhHZIolFAhmWzzlG8EG7hrzTfAwlz2nGdbCfZ7DojYuM4XMqK3klFWDvWdb
 dbZ1u6Fa7Pw0BzW1ULMLd+BIF+zhBMa2cgobkGqKTpe6pU8fVuygY8fB9vfsSuvd7FhC
 rgwfbt5qhp5r9Nb87IbjvLKGhkqtByfeblfJpS40WrS1OzPYOEqs5fjaPjahOADo71j5
 QMNg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVT3Diapz1xO27/rJRuuLjLm8QSHwcAvW3VMZH0syy225Fzr/8WXgPLR4ZOIS/DWFLevOAESNWFYHg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz18g4PlTBRvEeh+gmgJxSUt8juozigXbg51vJTmDrJgIAWkyOq
 pkVpJGyYRPsDR0dOs36jou5ojpuOzAFSfL5G/gWmMPJjBRYwRdG7hPrYYtFBAlHfjacN1omQGdi
 iYYcXjcI2qKtTXscAiAP0kqrEtOdXgcqAXCZA84g03yyvwaN92/aj0wRbu0RWrrDVMw==
X-Gm-Gg: ASbGnctKpaJNey6xS58WjA1SgtwE7MvQwp5QjRQ1+g86kmEpLbhNOuZ3cN6oUm+10Xx
 vzJcw4HsK3SnyaOOthM70h2gCm9oDI/8KqoH8zID6wk51xpmwe4jqxI6SjPqwBukepde6gXhyf4
 5k7Devp7gBG2hzVC8cpe0OgZaPtKvAzh8wCZ8JmCIUOH2FES3oKgQwo3CWuUjYgl4NU2wHfyDcc
 stTNS/Sb8KWK40gyM055B0GT88ajm9TTMgfaO7F8dP8stzi6/Up4jOq5NAK1wMx15/N/g9xcYt8
 1Z5Q99PcqkEmc6URWhDLh9RYCT5M5wQctiXpAW8EB3wE
X-Received: by 2002:a05:6000:d09:b0:38a:88d0:1c9c with SMTP id
 ffacd0b85a97d-38c22275430mr14013158f8f.17.1737987514385; 
 Mon, 27 Jan 2025 06:18:34 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG3WPDmeaB4peeCb+zQipOwrdeZnKyUskBD9qXxKgHroqtklLLq3j09Qe2T+mknggVc+hlorA==
X-Received: by 2002:a05:6000:d09:b0:38a:88d0:1c9c with SMTP id
 ffacd0b85a97d-38c22275430mr14013136f8f.17.1737987514031; 
 Mon, 27 Jan 2025 06:18:34 -0800 (PST)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38c2a1761f4sm11188199f8f.20.2025.01.27.06.18.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Jan 2025 06:18:33 -0800 (PST)
Message-ID: <7f8c72f7-e3ea-4d6e-bce4-68cbe7547943@redhat.com>
Date: Mon, 27 Jan 2025 15:18:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/15] drm/ast: Remove 1152x864 from list of widescreen
 resolutions
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@redhat.com,
 dri-devel@lists.freedesktop.org
References: <20250124080546.9956-1-tzimmermann@suse.de>
 <20250124080546.9956-2-tzimmermann@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20250124080546.9956-2-tzimmermann@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: JcaDO6UN9xjmIXk87fsJZnScnTUuJSgB_BlSqqTchUA_1737987514
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

On 24/01/2025 08:57, Thomas Zimmermann wrote:
> The resolution 1152x864 has a ratio of 4:3 and is already handled
> as such. Remove it from the list of widescreen resolutions.

Thanks, yes it's redundant.

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>

> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   drivers/gpu/drm/ast/ast_mode.c | 2 --
>   1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
> index 9d5321c81e68d..b533eb6e233ed 100644
> --- a/drivers/gpu/drm/ast/ast_mode.c
> +++ b/drivers/gpu/drm/ast/ast_mode.c
> @@ -1035,8 +1035,6 @@ ast_crtc_helper_mode_valid(struct drm_crtc *crtc, const struct drm_display_mode
>   			return MODE_OK;
>   		if ((mode->hdisplay == 1600) && (mode->vdisplay == 900))
>   			return MODE_OK;
> -		if ((mode->hdisplay == 1152) && (mode->vdisplay == 864))
> -			return MODE_OK;
>   
>   		if ((ast->chip == AST2100) || // GEN2, but not AST1100 (?)
>   		    (ast->chip == AST2200) || // GEN3, but not AST2150 (?)

