Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44365AF7529
	for <lists+dri-devel@lfdr.de>; Thu,  3 Jul 2025 15:12:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F0CF10E83A;
	Thu,  3 Jul 2025 13:12:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="JNCTWK0P";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D683C10E83A
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Jul 2025 13:12:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1751548351;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ocn2VL3GWs2YvCaCEhSfPD6Z1R/ETwpv922aiOfExSY=;
 b=JNCTWK0PoAPelblq/XypmRsDhZo49kdX0XxMTpKGM/ja2Zoxivq83GO4CQUGCJWDAWDUVT
 mgZRkPE9lxTIqyF3KgiRb7Ab5ZpBu389tbvC3YA2LP1HD0yVg1i+Z2eRN6qJbDBAbMmt6L
 3lxIgrVirwSmJsUMcuC2RVN5lE+Elec=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-458-oxGqwu77N4WGvk6U3I8N8Q-1; Thu, 03 Jul 2025 09:12:30 -0400
X-MC-Unique: oxGqwu77N4WGvk6U3I8N8Q-1
X-Mimecast-MFC-AGG-ID: oxGqwu77N4WGvk6U3I8N8Q_1751548349
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-450de98b28eso5023675e9.0
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Jul 2025 06:12:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751548348; x=1752153148;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Ocn2VL3GWs2YvCaCEhSfPD6Z1R/ETwpv922aiOfExSY=;
 b=Ny04rs3kxhQB1OH+8/TiaGVXybY880BgTyaslFweRpJ9RJXpRQL9TcylqZg1jgw8zY
 O1iHPArqHHx7HdHGLPgvzVLHCBGLAy0yuySLqsH5GyzGxZKAmX/VCJ2ugGV9UGL9EbCa
 tghOhoXSznBd4jiqzc0Y0u2B79RHmHD0jVOSR3Pd8xlEocIDasQVl1zV9fu3YA1yL78b
 8Plf93+k+gU13SCOImGSe6k/wT4X05GFv91EVfgLVerpnaGHpCqQadsagJkaqoNZWUVG
 kQMo1zn+acFNgDyKfRqdLDgK2Vov/TIUqIqzh3Q45XwaedWHk/91yY8i7mY/BkBodSuP
 VkHQ==
X-Gm-Message-State: AOJu0YwhrFgLH1oZeWEz1HJQ2Hs3vRTiSvNddeortJSS6jr8lR0RQ5Ri
 1v+5JK0YlyFiSRYDry7dRCMSdq9gcs+PaCDNIH274x/4nZaHxIz9E2kmzfy2S9kixr1HbzStnDy
 EYIjh0FxIvhCMzG+4TIFlFZ7Gj72chubqH709W5DWMCbGL9rUOO0O2tZnhtqW7bcJbovZUBs0dR
 yFtw==
X-Gm-Gg: ASbGncup4m/QoMw68/LFqkZLQryRn/x++wBYCcSn1sQHZOsmj/NKc0tok8PWJw0BZXP
 Ed/PDoKdWlHhlqAU5zwRH/sENJP5W1Qtrj4sRtDZx7HHi/V6HftguEzarrOJjeMWKKor/cXkjNo
 pJLrusnwk8CwldUbUCdxtqRCdiEnjF6nB0j4nETKHwPxMw5lacS0BGuntBz0DxeJOE5xw1e8Ogl
 YNFJ4ApoqDtuLwBXS8iZi+wSJIjmWUuOSpO3zAyD+t6ghiSmYtkKdburfm7Bqf2NCKcQDxZi00l
 HOQVUpmEYW0FcDcIjOtBK5+VYMoSnVQK3yEfZDfS8kDPGnDAcN3xjH3CU/hkZQ==
X-Received: by 2002:a05:600c:a31c:b0:453:92e:a459 with SMTP id
 5b1f17b1804b1-454b01ad46amr7736715e9.16.1751548348491; 
 Thu, 03 Jul 2025 06:12:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGYuispiLhfkqbJ8i1KdTvdHfvoobGpzxppitJELE/DhNKEUzLe3sk/aX6sq0vRgVfeiKTPrg==
X-Received: by 2002:a05:600c:a31c:b0:453:92e:a459 with SMTP id
 5b1f17b1804b1-454b01ad46amr7736465e9.16.1751548347968; 
 Thu, 03 Jul 2025 06:12:27 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:d5:a000:d252:5640:545:41db?
 ([2a01:e0a:d5:a000:d252:5640:545:41db])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-454a997af9esm26367225e9.14.2025.07.03.06.12.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Jul 2025 06:12:27 -0700 (PDT)
Message-ID: <d4fc016e-9f2a-4bf3-b177-b5848cde7fc2@redhat.com>
Date: Thu, 3 Jul 2025 15:12:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/10] drm/ast: Gen7: Disable VGASR0[1] as on Gen4+
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@redhat.com
Cc: dri-devel@lists.freedesktop.org
References: <20250702132431.249329-1-tzimmermann@suse.de>
 <20250702132431.249329-10-tzimmermann@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20250702132431.249329-10-tzimmermann@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: aVKup627qEkIOOiXZ8O1TvxXBDfllSKswiGP840QSg4_1751548349
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

On 02/07/2025 15:12, Thomas Zimmermann wrote:
> Set VGACRB6[5], which disables asynchronous sequencer resets via
> VGASR0[1]. This was most likely an oversight when adding support
> for Gen7. Aligns Gen7 with the earlier Gen4+.
> 

Thanks, it looks good to me.

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>

> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   drivers/gpu/drm/ast/ast_2600.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/ast/ast_2600.c b/drivers/gpu/drm/ast/ast_2600.c
> index f9b96c631d4c..a426a981949e 100644
> --- a/drivers/gpu/drm/ast/ast_2600.c
> +++ b/drivers/gpu/drm/ast/ast_2600.c
> @@ -60,6 +60,7 @@ void ast_2600_set_def_ext_reg(struct ast_device *ast)
>   
>   	/* Enable RAMDAC for A1 */
>   	reg = 0x04;
> +	reg |= 0x20;
>   	ast_set_index_reg_mask(ast, AST_IO_VGACRI, 0xb6, 0xff, reg);
>   }
>   

