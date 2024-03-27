Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E93B588D98C
	for <lists+dri-devel@lfdr.de>; Wed, 27 Mar 2024 09:53:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE5A410F968;
	Wed, 27 Mar 2024 08:53:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="CHtMkjcz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B57310F968
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Mar 2024 08:53:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1711529631;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EQayDiLeMZdAEU12a7XUqQdU0MXKYllLESqhbcKtdFY=;
 b=CHtMkjczv/0Q0y8r2+XsUrfvnVmW4ofkzkViAOPKlkfU6WIaAGB2M7subwZynPbFGML3TP
 pujBcXT0/b74+Z45UhwMnL2H3v3sKL5nOmNdfRDX1GdmgF3RpA1zFIKTZWYFpdNspUHyGy
 JrnvMRPH/VmZE9D3HTq7NQys+E6Y+Cw=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-257-iann4-dCMfCTL4Kxi-bkAw-1; Wed, 27 Mar 2024 04:53:49 -0400
X-MC-Unique: iann4-dCMfCTL4Kxi-bkAw-1
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-41407fd718dso35136165e9.1
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Mar 2024 01:53:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711529627; x=1712134427;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=EQayDiLeMZdAEU12a7XUqQdU0MXKYllLESqhbcKtdFY=;
 b=UP8PHxWBsov2JiD37acgQAbHxqLMNZUfmqdichlzubsZxbe3W48PvZcGZbh0Z0kD0J
 2FaIiYiQH8RonrdYuh4dvCTvZynuZwdQn6Ix33yLG+nVTmIQxu3lDcm/bz6C647WGPYR
 A2C0u8yIthDyvi2+vb9PMwzRRri+5W3OpYwS0AZNC/L5YPia2MsCpB7NMLJ9LDWfFADW
 wt1yvSHVoG1uIjmMQkBiK8VFp2q9fdU86OmFQ0pNl7P3VUmDWK7cvEUpQ9WEX0XKQtnd
 UVKYi+ay4Weorl8U0LJNpvimEAuDyg6mXJFPXa8hBvtHmOxKRZ0N9/ptqoMwVhutH6DM
 Av6A==
X-Gm-Message-State: AOJu0YwZjGtriE2j+IbUNQo1GsAs1NeJuZehbIayQxVzT3R+fmBURT+B
 Q+E8NRdX4jvqBHM0Sum6QnxR6ajxaHM1EP9AFOSLBdfZduc4/swLsDELe3VpSUqnxZCW/Dofy+g
 fFIu2WgICl2D70IlAglHmWKCRKENhfS6DjgP+s+ZG8IQTHUGF8o3BWIOqDLHJYcriog==
X-Received: by 2002:adf:f451:0:b0:33e:48f9:169d with SMTP id
 f17-20020adff451000000b0033e48f9169dmr501988wrp.31.1711529627011; 
 Wed, 27 Mar 2024 01:53:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEyYZsP9X3qxXI8cZXakmL7rjWFiYhk/YTocnXK2U91YBDzGTzDlmcuOk2/rHJDPaHGdtJnTA==
X-Received: by 2002:adf:f451:0:b0:33e:48f9:169d with SMTP id
 f17-20020adff451000000b0033e48f9169dmr501974wrp.31.1711529626671; 
 Wed, 27 Mar 2024 01:53:46 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 bt17-20020a056000081100b00341b5cf0527sm4147245wrb.11.2024.03.27.01.53.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Mar 2024 01:53:46 -0700 (PDT)
Message-ID: <c04ebd16-f0b0-45be-a831-fae8b50b7011@redhat.com>
Date: Wed, 27 Mar 2024 09:53:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/ast: Fix soft lockup
To: Jammy Huang <orbit.huang@gmail.com>, tzimmermann@suse.de,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@redhat.com,
 airlied@gmail.com, daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Jammy Huang <jammy_huang@aspeedtech.com>, stable@vger.kernel.org
References: <20240325033515.814-1-jammy_huang@aspeedtech.com>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20240325033515.814-1-jammy_huang@aspeedtech.com>
X-Mimecast-Spam-Score: 0
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

Hi,

Thanks for your patch.
I'm wondering how you can trigger this infinite loop ?

Also this looks like a simple fix, that can be easily backported, so I'm 
adding stable in Cc.

If Thomas has no objections, I can push it to drm-misc-fixes.

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>

-- 

Jocelyn

On 25/03/2024 04:35, Jammy Huang wrote:
> Avoid infinite-loop in ast_dp_set_on_off().
> 
> Signed-off-by: Jammy Huang <jammy_huang@aspeedtech.com>
> ---
>   drivers/gpu/drm/ast/ast_dp.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/gpu/drm/ast/ast_dp.c b/drivers/gpu/drm/ast/ast_dp.c
> index ebb6d8ebd44e..1e9259416980 100644
> --- a/drivers/gpu/drm/ast/ast_dp.c
> +++ b/drivers/gpu/drm/ast/ast_dp.c
> @@ -180,6 +180,7 @@ void ast_dp_set_on_off(struct drm_device *dev, bool on)
>   {
>   	struct ast_device *ast = to_ast_device(dev);
>   	u8 video_on_off = on;
> +	u32 i = 0;
>   
>   	// Video On/Off
>   	ast_set_index_reg_mask(ast, AST_IO_VGACRI, 0xE3, (u8) ~AST_DP_VIDEO_ENABLE, on);
> @@ -192,6 +193,8 @@ void ast_dp_set_on_off(struct drm_device *dev, bool on)
>   						ASTDP_MIRROR_VIDEO_ENABLE) != video_on_off) {
>   			// wait 1 ms
>   			mdelay(1);
> +			if (++i > 200)
> +				break;
>   		}
>   	}
>   }
> 
> base-commit: b0546776ad3f332e215cebc0b063ba4351971cca

