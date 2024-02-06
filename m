Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2832684B952
	for <lists+dri-devel@lfdr.de>; Tue,  6 Feb 2024 16:24:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D25610EEF9;
	Tue,  6 Feb 2024 15:24:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="KwpBWm14";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com
 [209.85.218.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18E3E10EEF9
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Feb 2024 15:24:14 +0000 (UTC)
Received: by mail-ej1-f51.google.com with SMTP id
 a640c23a62f3a-a380a1fa56fso132558666b.0
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Feb 2024 07:24:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1707233052; x=1707837852;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=c6oZEpefRF0Tyn24g9i4ewrS1OGMx8/CRX4tNeqvynA=;
 b=KwpBWm14Qu2ARxkCReCoe3djsjBW23B3lhkNEwjGkclzm3WGNGoquAMcc0FYAf3xPG
 41ArzJNUKOS/b0tKyUTMZtwQhU0vJJnR7FIZXT6Mz9cdP2XiibAchPB8pg6ZwL5VBPtM
 dhQJjrY3ZJhFlN4XnrCpfpH2IePJL9G05qeZXIZ3BBD4SI9xWE3/drtf8vEXsjkVXsD0
 OrX9kjs9svQ0eX3UmuJcY5gU3rdSc2bymvwCs6v1c4hDimCqWej0YR1KNC7rDKtbkJ39
 Obh6NQDn0+uIo6fsXXN9L6h24Vxqofl/39xNaNCKOU4PnIKKKYPILs04hWJBYPnhb1bU
 FMtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707233052; x=1707837852;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=c6oZEpefRF0Tyn24g9i4ewrS1OGMx8/CRX4tNeqvynA=;
 b=KsMEyqITdMQ/CFdNqUsCbiYPsqeBNbBlFOi8DGOp6uGoqfm0/ILK0gUNof20jPjt/q
 5G3sV7HovMal2hMXmLurH8oA9+TZo6jxRmkr/+aarc1fORKM91Q1xGOcamfvzoICkddz
 ttzCajcfaFyL5v+ZKeLtTk4gi8GOzVJVy7tftcY30KsF+6kf/5luY2VNAj69cF44MSI3
 PXRa735VZPAGv5BfjGyEorhRO7r/KiO4l2nXwmhEb0mIJU5cRDlWOor6Ww3bKqTppjdZ
 Py5cz+/UV0JnJBde92Y1Qg4ITh+CPYbR3ACeKRiKmHOGBoF7L2+4ZMjIZtpU5P9j0TOQ
 EQng==
X-Gm-Message-State: AOJu0Yy03SO2id6JSzy2siuXIdvVBCEwpkjkUhHoukx9kpEKUALEsnat
 LXsZnl0Oo0jDhrY3o9lidwnmkfI/fC5bZ0icsJPBSps1qbLLKNOaAmbAXOyDEXE=
X-Google-Smtp-Source: AGHT+IECn1jgZhlrG7/6jnwm37Zc7btXkbtdP+hBe0rhldbgW5nxFV90J4gPvjCdN1SPFQYj6LTRow==
X-Received: by 2002:a17:906:f90f:b0:a36:f672:5dab with SMTP id
 lc15-20020a170906f90f00b00a36f6725dabmr3379018ejb.16.1707233052557; 
 Tue, 06 Feb 2024 07:24:12 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCUVPrzdjhB8UqYzeAqOPAW1mFIJ+nEKHTmOwLUcBxGgvscPTDBVF8z1qZTrHEFsvtpNhdImONs8V8ARS+FNS9Pxl/Zw05V/dFmhstQfk5/XNeatnegHKoIO8eR1DzgVzZmbqd+f/vpMbFtwGlxnFeIt5og1MDpqdLVxs5KvI3/tbpSZNzf+L7FDLSdRpGbYHqMLqCO7QvpK1YztVlBkmhJwKBjWsvDM2+8EDnTUw6gOR1aeT/oNfYbf6k5TvQH774/Z3iiBzAXBW5xd0IfA1fFHmPtyyYIibzTu5oi4A6ltGVhQBuQodgQIWk8RRq/g/Y2hN9cnFj/9gelQ2Bd8CeYa6ibQ6nt4SgxzeweuMR+KtddOS1Rns9BdHrLg1Uu6Ybhzo2N9SC7TeQCX7V5GP2TfdQvVEvVfnD/veg==
Received: from [192.168.1.172] ([93.5.22.158])
 by smtp.gmail.com with ESMTPSA id
 ca3-20020a170906a3c300b00a35d6482fdbsm1270170ejb.77.2024.02.06.07.24.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Feb 2024 07:24:12 -0800 (PST)
Message-ID: <282d07cf-97b4-423f-b148-42a5d5ff9d10@baylibre.com>
Date: Tue, 6 Feb 2024 16:24:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 9/9] drm/mediatek: dsi: Use
 mipi_dsi_pixel_format_to_bpp() helper function
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 chunkuang.hu@kernel.org
Cc: fshao@chromium.org, p.zabel@pengutronix.de, airlied@gmail.com,
 daniel@ffwll.ch, matthias.bgg@gmail.com, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, kernel@collabora.com
References: <20240206120748.136610-1-angelogioacchino.delregno@collabora.com>
 <20240206120748.136610-10-angelogioacchino.delregno@collabora.com>
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <20240206120748.136610-10-angelogioacchino.delregno@collabora.com>
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
> Instead of open coding, use the mipi_dsi_pixel_format_to_bpp() helper
> function from drm_mipi_dsi.h in mtk_dsi_poweron() and for validation
> in mtk_dsi_bridge_mode_valid().
> 
> Note that this function changes the behavior of this driver: previously,
> in case of unknown formats, it would (wrongly) assume that it should
> account for a 24-bits format - now it will return an error and refuse
> to set clocks and/or enable the DSI.
> 
> This is done because setting the wrong data rate will only produce a
> garbage output that the display will misinterpret both because this
> driver doesn't actually provide any extra-spec format support and/or
> because the data rate (hence, the HS clock) will be wrong.

-- 
Regards,
Alexandre
