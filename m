Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3F56BC915F
	for <lists+dri-devel@lfdr.de>; Thu, 09 Oct 2025 14:42:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0594410EA25;
	Thu,  9 Oct 2025 12:42:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="D1FqyXZ/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7171310EA25
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Oct 2025 12:42:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1760013721;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kSkwsHp8oAa0DAmFsIWLiQzxk/uK9SKHg1W2Wnk28BU=;
 b=D1FqyXZ/w5r82XhbsmaJBfvWeDDR8g9oaMdkilJ977yQQl5YRhg62eUnSyG4GEQ+s+q3A3
 Nk5D61rfUDhzf5Uc5BlxG4wLT8WxOZtU2kLhE7CxB2o5axglLnZcTrJtXMBOy83FDaWx7F
 GEXIA4x5S2vNd5KQ5mHlIDi78+pmjOU=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-529-Awn2sK_QPFCGMpJv-L3_Gg-1; Thu, 09 Oct 2025 08:42:00 -0400
X-MC-Unique: Awn2sK_QPFCGMpJv-L3_Gg-1
X-Mimecast-MFC-AGG-ID: Awn2sK_QPFCGMpJv-L3_Gg_1760013719
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-3f93db57449so638381f8f.2
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Oct 2025 05:42:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760013719; x=1760618519;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kSkwsHp8oAa0DAmFsIWLiQzxk/uK9SKHg1W2Wnk28BU=;
 b=Zq9WiMQyV92KT85vt1BmJKSaxS2vf0qGgO2aqLzZ2xgCrxvmJb8KriPbKFu6ljyHKL
 tw1Arqj/S7mH2tPNl/K0ka374fjZ9AP8As4je7D6c1bTQIUOx2J9yNWXIG3HXSFG02Qt
 xVMQie3Ys2UeZ9jkat9YohoP21WHcKTzlEmHa6memW2QvJB9oYIw7WrlaoISVMQAIzWJ
 tlquEzk9aLuWVDWALauAqroAsUSx0tyGvAS7RHI2n9UYxMn85BbB8wuo0Iir3XAhRe/1
 2jS23orBlW8raw2eF+270YtjcEDW8MwBVmqwPEGwRle94lFIQYLrjk+GAHyfUm5OLT17
 BDvg==
X-Gm-Message-State: AOJu0YxC9/eRumcEQq2LLFZJDA1zZ8OjZqSNSn8ffiL9ozTMWVu56tzN
 PZyZ/gIAvP6peu5fdweuz52JjrA3DFKkPgNCgo5t2OJR23HyzJQE3hsOw2m44Es89xpPVSmRjbW
 xpCEt/Q8t657svUufLWUux0Epu+oTQG53CQlDrY+tSglY03jlkXFv8ec8iP1sVu1JPJrQTw==
X-Gm-Gg: ASbGncvK9rFwjmrxF+3aN+8X0KgOmcsEZZYCFhExX0u+TasAjtb/hUFqWzkDNLBouPc
 wFR71SqiTYXk3G9Lm5MxXRGoG98QZalYInQ0NPnMhWcXQV+H0NWIkQPOfTY4weOXoVEaA5mRSSX
 hVnuVh4sy7u7TlvLTn0jccikpVEJzCIyUorpqLiVMs6cyMr745Wo3w69OeEgY0h9aivA0yc3hXy
 LONgVnieTFYg/iVSfVTQ5eHJwrnmf4sVjMWbXXHRZaXmxB0beg24JAacvwFWpstw0wpf+tM4zOm
 YExxTdL7fILhUrAkLY1OtwC9on8flSMpUFq2lQZ/WGdeoF8xm7qPU51cazcgt7lPF7fTQOMNzLp
 NqakNTmoCcw==
X-Received: by 2002:a5d:5c8a:0:b0:425:8125:ac79 with SMTP id
 ffacd0b85a97d-42666ab97f0mr4792493f8f.25.1760013719268; 
 Thu, 09 Oct 2025 05:41:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGj5ZtPW3wj8BTr8a3k5V0GuJKzOJ7gnykrfgivzj0mXGnWaS3ccYCwqufWIeXe76tpr5p9OQ==
X-Received: by 2002:a5d:5c8a:0:b0:425:8125:ac79 with SMTP id
 ffacd0b85a97d-42666ab97f0mr4792476f8f.25.1760013718886; 
 Thu, 09 Oct 2025 05:41:58 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:8998:e0cf:68cc:1b62?
 ([2a01:e0a:c:37e0:8998:e0cf:68cc:1b62])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4255d8f0846sm35346392f8f.45.2025.10.09.05.41.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Oct 2025 05:41:58 -0700 (PDT)
Message-ID: <38517a7e-41fd-4a53-9d41-01f77757f33c@redhat.com>
Date: Thu, 9 Oct 2025 14:41:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] drm/ast: Store HSync adjustment in device quirks
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@redhat.com
Cc: dri-devel@lists.freedesktop.org
References: <20251007150343.273718-1-tzimmermann@suse.de>
 <20251007150343.273718-6-tzimmermann@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20251007150343.273718-6-tzimmermann@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: fjhcCGSvjTL8C6BrcNiZKU6EaAFijbgnJ3DShnje3SY_1760013719
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

On 10/7/25 16:54, Thomas Zimmermann wrote:
> Add the add4 flag to struct ast_device_quirks and set it on AST2600.
> Replaces a call to IS_AST_GEN7() in ast_set_crtc_reg().

Thanks, it looks good to me.

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   drivers/gpu/drm/ast/ast_2600.c | 1 +
>   drivers/gpu/drm/ast/ast_drv.h  | 6 ++++++
>   drivers/gpu/drm/ast/ast_mode.c | 3 +--
>   3 files changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/ast/ast_2600.c b/drivers/gpu/drm/ast/ast_2600.c
> index 7cde5ce9c41f..dee78fd5b022 100644
> --- a/drivers/gpu/drm/ast/ast_2600.c
> +++ b/drivers/gpu/drm/ast/ast_2600.c
> @@ -63,6 +63,7 @@ static const struct ast_device_quirks ast_2600_device_quirks = {
>   	.crtc_mem_req_threshold_low = 160,
>   	.crtc_mem_req_threshold_high = 224,
>   	.crtc_hsync_precatch_needed = true,
> +	.crtc_hsync_add4_needed = true,
>   };
>   
>   struct drm_device *ast_2600_device_create(struct pci_dev *pdev,
> diff --git a/drivers/gpu/drm/ast/ast_drv.h b/drivers/gpu/drm/ast/ast_drv.h
> index 76969244d36f..7be36a358e74 100644
> --- a/drivers/gpu/drm/ast/ast_drv.h
> +++ b/drivers/gpu/drm/ast/ast_drv.h
> @@ -176,6 +176,12 @@ struct ast_device_quirks {
>   	 * by AST2500PreCatchCRT in VBIOS mode flags.
>   	 */
>   	bool crtc_hsync_precatch_needed;
> +
> +	/*
> +	 * Workaround for modes with HSync Time that is not a multiple
> +	 * of 8 (e.g., 1920x1080@60Hz, HSync +44 pixels).
> +	 */
> +	bool crtc_hsync_add4_needed;
>   };
>   
>   struct ast_device {
> diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
> index ebb1ec82d904..a8917ab7028c 100644
> --- a/drivers/gpu/drm/ast/ast_mode.c
> +++ b/drivers/gpu/drm/ast/ast_mode.c
> @@ -288,8 +288,7 @@ static void ast_set_crtc_reg(struct ast_device *ast, struct drm_display_mode *mo
>   	ast_set_index_reg_mask(ast, AST_IO_VGACRI, 0xAC, 0x00, jregAC);
>   	ast_set_index_reg_mask(ast, AST_IO_VGACRI, 0xAD, 0x00, jregAD);
>   
> -	// Workaround for HSync Time non octave pixels (1920x1080@60Hz HSync 44 pixels);
> -	if (IS_AST_GEN7(ast) && (mode->crtc_vdisplay == 1080))
> +	if (ast->quirks->crtc_hsync_add4_needed && mode->crtc_vdisplay == 1080)
>   		ast_set_index_reg_mask(ast, AST_IO_VGACRI, 0xFC, 0xFD, 0x02);
>   	else
>   		ast_set_index_reg_mask(ast, AST_IO_VGACRI, 0xFC, 0xFD, 0x00);

