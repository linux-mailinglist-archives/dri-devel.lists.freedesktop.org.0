Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E7A4184B862
	for <lists+dri-devel@lfdr.de>; Tue,  6 Feb 2024 15:51:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0377F10EF32;
	Tue,  6 Feb 2024 14:51:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="rYUsvpKq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com
 [209.85.208.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D29AE10EF32
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Feb 2024 14:51:42 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id
 4fb4d7f45d1cf-5600d950442so1193704a12.1
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Feb 2024 06:51:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1707231100; x=1707835900;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=vXiKICFUMp4cupYFDlAs4KtUHT8wkU7NDkai+RaSVpk=;
 b=rYUsvpKqbPQ+/OsI3TJ4GEKwbzCcxMMBzDFdLM0rotdEkPmbJu2KgmmiE7wGIdd7TH
 5NO50SJB/uRxwRK/1n7J+TfBczmDTI8wNsYdmp36rVm/bZMCh/Ky0Sussu6LbPGZvqYr
 IIdi1OeQxww/N5I/mUzpq7Il7g6LyKOIzXva2TA2YpHOQ1eko8cMiResePN9NAk8ZRsf
 9zoiFw3FZbaUmZP4WrM8CxaIY0vUxWdPVjOFFMvs9Jd7kQjgcY2EU1XX7OOqAqvHaDVf
 sxnhEplaDR+v1SZQvVTHzsTAwm30J3GWcmB/mH6v0xybYltdQj3Dfjp3LGlb+Xa937R9
 ufeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707231100; x=1707835900;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vXiKICFUMp4cupYFDlAs4KtUHT8wkU7NDkai+RaSVpk=;
 b=pTeaNUANXmkvPaZA8LjtjtLSbPvJ1pGCkXxlyzj4GXInVLWuUbzrvL1u1ETHjEEJUU
 2+xpTeXe4bexVhfpJGQONTS+Tgb6w9CLwmY3iErDLmfXsGmNgW7/iwJgH4bC8JygUF0F
 BY2vkSjSJ0NnQbEvqDl21aj1DzVzewuf0TcZ5/fUzGPFggdm8qFLuB0Ala2OBKT3fIDy
 yX4IZby4cXFprhx6XSVYP4JmYjvFf7nqEomllq8oQI1SaEhqVJwQ79DS69hNtKesSqNE
 yF7hTfZd/vxCy3sbmY6GYxAGl/DV0/lPQGUHoEBpknU6BwUxX5yhq5cbs7YtEtsjUJFF
 Imrw==
X-Gm-Message-State: AOJu0YwAOUPKVa1Zx+vaVKohorqDQrUCxlwpafhQX+SjrUbTAXSAS82w
 hdNUi6BXkrwbhmEVQt0bcKJ4qHD/OplJ7XJetC6KDsfvSLxyX9FdXKqCa89eoY8=
X-Google-Smtp-Source: AGHT+IGk/qAzmQdexrg//Spd63iGrgIA/GzcXA+iMKVhkBJiYtjxKIuf/ZU7NrSaSJk3CzFARyyORA==
X-Received: by 2002:a17:906:b30b:b0:a37:28e9:bfdc with SMTP id
 n11-20020a170906b30b00b00a3728e9bfdcmr2112593ejz.27.1707231100398; 
 Tue, 06 Feb 2024 06:51:40 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCWTqHSLrCXjFvE9Ul/QpJL+/GDuRyHitBIP/6fB8Teb21BawmrIMsaAkLtWbVD/1fuSeIp4tnlbj1FlEtNcsDjBZBuuCxRpdqv4Rbw1/0BlH1POEjjfMjbqqmc8pZcg5l1hc8E3Y0DpZ3vMXowY0gRoW0vRDePzr22Bty2PWPDkN64BgBK3OMnWBmVknsdGSzEGWt+mpapQ2N17qgZ7G3cNyo2+dEAHJ6Mwd5OAsWe/leT2nGe2b1wabbjziFMgWfjCwtt3GvX01vw69jTZwI1k0Z9gBLQcK4flOn3WgSObajdEcI+/de7T99EmBurySdMF9gt+e9F5hChjCaVGU5FHGgcqhp9MjWxHSnc35kUR9mKHW8UZg85Vyvx70N1RZdzt5/buyVJnjycYl1OTgtZ/SC83U1f4QQ2bSA==
Received: from [192.168.1.172] ([93.5.22.158])
 by smtp.gmail.com with ESMTPSA id
 d20-20020a1709061f5400b00a3785efe1c4sm1231091ejk.85.2024.02.06.06.51.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Feb 2024 06:51:39 -0800 (PST)
Message-ID: <06d0f56f-c27f-4d6a-9a88-e2932de29bf3@baylibre.com>
Date: Tue, 6 Feb 2024 15:51:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/9] drm/mediatek: dsi: Fix DSI RGB666 formats and
 definitions
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 chunkuang.hu@kernel.org
Cc: fshao@chromium.org, p.zabel@pengutronix.de, airlied@gmail.com,
 daniel@ffwll.ch, matthias.bgg@gmail.com, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, kernel@collabora.com
References: <20240206120748.136610-1-angelogioacchino.delregno@collabora.com>
 <20240206120748.136610-3-angelogioacchino.delregno@collabora.com>
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <20240206120748.136610-3-angelogioacchino.delregno@collabora.com>
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

Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>

On 06/02/2024 13:07, AngeloGioacchino Del Regno wrote:
> The register bits definitions for RGB666 formats are wrong in multiple
> ways: first, in the DSI_PS_SEL bits region, the Packed 18-bits RGB666
> format is selected with bit 1, while the Loosely Packed one is bit 2,
> and second - the definition name "LOOSELY_PS_18BIT_RGB666" is wrong
> because the loosely packed format is 24 bits instead!
> 
> Either way, functions mtk_dsi_ps_control_vact() and mtk_dsi_ps_control()
> do not even agree on the DSI_PS_SEL bit to set in DSI_PSCTRL: one sets
> loosely packed (24) on RGB666, the other sets packed (18), and the other
> way around for RGB666_PACKED.
> 
> Fixing this entire stack of issues is done in one go:
>   - Use the correct bit for the Loosely Packed RGB666 definition
>   - Rename LOOSELY_PS_18BIT_RGB666 to LOOSELY_PS_24BIT_RGB666
>   - Change ps_bpp_mode in mtk_dsi_ps_control_vact() to set:
>      - Loosely Packed, 24-bits for MIPI_DSI_FMT_RGB666
>      - Packed, 18-bits for MIPI_DSI_FMT_RGB666_PACKED

-- 
Regards,
Alexandre
