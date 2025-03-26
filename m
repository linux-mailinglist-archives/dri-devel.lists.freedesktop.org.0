Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E96A1A71321
	for <lists+dri-devel@lfdr.de>; Wed, 26 Mar 2025 09:55:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BDB610E67B;
	Wed, 26 Mar 2025 08:55:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="DRA8do40";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 963FC10E67B
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Mar 2025 08:55:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1742979316;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RBjxsdzcZF0AxPrUiP83/3qqo2wYgPtHLFKXkQ0ZmCM=;
 b=DRA8do408/fzH1vYLMT6KD0jGCcfYy07nnexWk4YGUL7vKC8X64gLi4iUzrmxvoMNIhwTh
 CL871uV1mAV3pIu7pNq14ykuRVfaI//sZleseUWqj3/IeM4VrBbR9IwbK7v5pCr9cB1OdZ
 rsV7QsnmhE+LxcUVq3aM7HzCHt8T3nY=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-498-6JHiDPwSO86n0Pm8RMxOiA-1; Wed, 26 Mar 2025 04:55:15 -0400
X-MC-Unique: 6JHiDPwSO86n0Pm8RMxOiA-1
X-Mimecast-MFC-AGG-ID: 6JHiDPwSO86n0Pm8RMxOiA_1742979314
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-39131851046so2860272f8f.0
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Mar 2025 01:55:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742979314; x=1743584114;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=RBjxsdzcZF0AxPrUiP83/3qqo2wYgPtHLFKXkQ0ZmCM=;
 b=r2pYc8iLJ7yuraCKpcoaaivfFwb78DXBWNBYLA7E7XnwLJI2SF5/xslaS0NMd2rOIZ
 NZgQIAhJXqf7Zp8CSQnXXujbqFM/Y4nxWGEdUykSqHkP1buF0bfd0QRXB6AJD4/MA3SO
 GxvoOY/94BZE2q4VQYxuoKRJIK4m8WjcsBAUlwrcnBlgvyqF1lLFuD0NWDC0sTo+nHWH
 j4A5OA77s6iP1I/j40+GWIV/2ybx5KRoraIyGU2ij6/xsJ/CnhcVljjHuLz+GD8rejFY
 CifpL7p6IYp3/LkiblSuddUsURhw+V02R1a8HXzomz/E+ENVJuLak8cISmwrbTw49CAQ
 kWHQ==
X-Gm-Message-State: AOJu0YwYytRJyMifZd+9LyfD/AU2Bme3pUVc9q/vWzF2hfijf4VskU97
 03xbrq82a83LPMh91PC+AR2wl38i6ns5bW8u8X+v3521hT2HDAC4nf2A2XBLPWp1hi2NaguvKgO
 ifteRoWlK78KU3iux7Od595X5W18JGAmNS0T89UMC/7E3/XRXE/jS1JO4TMCssWhthQ==
X-Gm-Gg: ASbGncusquQZEi8Rcpv0e+Vbo9oZHp5xxnm+7l/CBS4QjqwYQVFwPo5DkCKgEtggBkR
 0Vea2LK+WDre7v4rZ0ycB1huvRG8JWRgnxQwJgckK8oJB/T2QUkesviu1l3aggOkBkHZXR4DHQx
 +mhXGYskJGB0rAN+ME2b7tm1IbF9DL9ix2rm3mWNmpCHCYETsoSIylRClFsBSqJ7Nn4jilbkhD6
 JecAG5zX5uuqgZVOWYx76eLlBD/8oi0OFTiRrEjQtVDsegE3EivZgdWq03qdT/YgPtKfHdFwdLJ
 Y1mxqijVa4A5B4blOtifUzT2IXKDkw5oVIWSfnKQvX1L6v+SikvyvGk=
X-Received: by 2002:a05:6000:178d:b0:394:7c55:7030 with SMTP id
 ffacd0b85a97d-3997f90e02fmr13964296f8f.30.1742979313921; 
 Wed, 26 Mar 2025 01:55:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE95T95DxFVZi5+g/bja0GidIppV234+uJTef+jd4HdJ/dvJyeIb2tqIHWAt6e437Nei84YAw==
X-Received: by 2002:a05:6000:178d:b0:394:7c55:7030 with SMTP id
 ffacd0b85a97d-3997f90e02fmr13964285f8f.30.1742979313492; 
 Wed, 26 Mar 2025 01:55:13 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3997f9957efsm16431636f8f.14.2025.03.26.01.55.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Mar 2025 01:55:13 -0700 (PDT)
Message-ID: <cd525637-61e3-470e-b817-c61f9dddfa07@redhat.com>
Date: Wed, 26 Mar 2025 09:55:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/8] drm/format-helper: Optimize 32-to-24-bpp conversion
To: Thomas Zimmermann <tzimmermann@suse.de>, simona@ffwll.ch,
 airlied@gmail.com, mripard@kernel.org, maarten.lankhorst@linux.intel.com
Cc: dri-devel@lists.freedesktop.org
References: <20250325110407.81107-1-tzimmermann@suse.de>
 <20250325110407.81107-7-tzimmermann@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20250325110407.81107-7-tzimmermann@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 1a0Mh3wp2P6Zj2TjoKI2l_Uchi-RkoNChVRu44oTXY8_1742979314
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

On 25/03/2025 11:31, Thomas Zimmermann wrote:
> For ease of implementation, existing line-conversion functions
> for 24-bit formats write each byte individually. Optimize the
> performance by writing 4 pixels in 3 32-bit stores.
> 
Thanks, it looks good to me.

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>

> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   drivers/gpu/drm/drm_format_helper.c | 36 ++++++++++++++++++++++++++++-
>   1 file changed, 35 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/drm_format_helper.c b/drivers/gpu/drm/drm_format_helper.c
> index a926aa6671fc..b9c9c712aa9c 100644
> --- a/drivers/gpu/drm/drm_format_helper.c
> +++ b/drivers/gpu/drm/drm_format_helper.c
> @@ -274,10 +274,44 @@ static __always_inline void drm_fb_xfrm_line_32to24(void *dbuf, const void *sbuf
>   						    unsigned int pixels,
>   						    u32 (*xfrm_pixel)(u32))
>   {
> -	u8 *dbuf8 = dbuf;
> +	__le32 *dbuf32 = dbuf;
> +	u8 *dbuf8;
>   	const __le32 *sbuf32 = sbuf;
>   	const __le32 *send32 = sbuf32 + pixels;
>   
> +	/* write pixels in chunks of 4 */
> +	send32 -= pixels & GENMASK(1, 0);
> +	while (sbuf32 < send32) {
> +		u32 val24[4] = {
> +			xfrm_pixel(le32_to_cpup(sbuf32++)),
> +			xfrm_pixel(le32_to_cpup(sbuf32++)),
> +			xfrm_pixel(le32_to_cpup(sbuf32++)),
> +			xfrm_pixel(le32_to_cpup(sbuf32++)),
> +		};
> +		u32 out32[3] = {
> +			/* write output bytes in reverse order for little endianness */
> +			((val24[0] & 0x000000ff)) |
> +			((val24[0] & 0x0000ff00)) |
> +			((val24[0] & 0x00ff0000)) |
> +			((val24[1] & 0x000000ff) << 24),
> +			((val24[1] & 0x0000ff00) >> 8) |
> +			((val24[1] & 0x00ff0000) >> 8) |
> +			((val24[2] & 0x000000ff) << 16) |
> +			((val24[2] & 0x0000ff00) << 16),
> +			((val24[2] & 0x00ff0000) >> 16) |
> +			((val24[3] & 0x000000ff) << 8) |
> +			((val24[3] & 0x0000ff00) << 8) |
> +			((val24[3] & 0x00ff0000) << 8),
> +		};
> +
> +		*dbuf32++ = cpu_to_le32(out32[0]);
> +		*dbuf32++ = cpu_to_le32(out32[1]);
> +		*dbuf32++ = cpu_to_le32(out32[2]);
> +	}
> +	send32 += pixels & GENMASK(1, 0);
> +
> +	/* write trailing pixel */
> +	dbuf8 = (u8 __force *)dbuf32;
>   	while (sbuf32 < send32) {
>   		u32 val24 = xfrm_pixel(le32_to_cpup(sbuf32++));
>   		/* write output in reverse order for little endianness */

