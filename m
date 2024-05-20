Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4E638C9FC7
	for <lists+dri-devel@lfdr.de>; Mon, 20 May 2024 17:35:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9EE610E7E5;
	Mon, 20 May 2024 15:35:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="jTr+Bj0U";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9502B10E11F
 for <dri-devel@lists.freedesktop.org>; Mon, 20 May 2024 15:35:02 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id
 ffacd0b85a97d-351dc6aa900so2631889f8f.0
 for <dri-devel@lists.freedesktop.org>; Mon, 20 May 2024 08:35:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1716219301; x=1716824101;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=sAGBZ1PEBcf/fJDsVPro0tPE1WsZuaRgTUZ3iHIhxSQ=;
 b=jTr+Bj0UAg+Xv6zJOUL6hTq9lHRChYdZeijYNWq/sZJZYjXRloLP2EzgysyP/XED5T
 Ekt4s1ivg7Y3auVWXsd6txMOM4eiruzsyhmi174p5ht3NFqVISNKDWmpcN1JuugtWQWu
 72GXME1aot2P5kejFSpyhQEyDsqompjD6/mvcP1Q4M7x7mWl2ZXF6nM/1DmrxJ70Awu3
 VUoysQclu1br/2ODgeBv2lShvE/MPG1tiAJPonD3Iner1/QcrLJ6qwVqkYnXHWdidnfq
 ElQ1mSq775In23LQgrsMJ/HubVJ7HkrMAOio9yOfsblKQwFVnYQ88owP1SPI0ZF3uoiZ
 NtpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716219301; x=1716824101;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=sAGBZ1PEBcf/fJDsVPro0tPE1WsZuaRgTUZ3iHIhxSQ=;
 b=b7soZAP7AvgMxn6pLb6YkkMyEjzNDPRN825SR1B5r37FDB5mkKZTcMlj5olB1luPmf
 YmbZSfQms8XU3IZ9h9U8dem3ReRJyohyGEsIUZWm4RIQFB+K11n5lkN/V2UdMv/ErFyz
 sHAKa9OOMzwwSJyX4fL6rsRT67r3uzpq1/b50MuwYqETjqSylx33XdmSdBJeMw782cAz
 JXxAzCJr6/NQHq8lBWtJRqeuIRA8Mk+UyzAkeX3uua/gFJ7RVcxP+TRuImtcoRl5/3TR
 ATF5+z+SqaZHNREiFE87IZ9+yNTFXNxsESNJQ4Jz7DhweCWTAXmEpR65e6a6t8/znMK8
 UJQg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWLvsEqxSxAMuzTnj4pNclljT1Y8n3h3/pPH2wKwnAzE16WGmPlbNAzZmhvjgaDtp2y7xbd7fAD90/XwO0TAFCM1JdLuKBSSiRtf5i/lEvq
X-Gm-Message-State: AOJu0Yzj1T59Ip3i7Kr8UeVEWxQHYisFeLNFKN6BtZYs+ejusDHe7rA0
 /HnNyY2B6KgxaHtXvOGkfNc2DhbdbnHmLLogTUqVMqA0RZh/Fl7Pg8l3TclnSwg=
X-Google-Smtp-Source: AGHT+IFNk692k3RqaMXye+c2Qq79nAeUMEO50j29S1MXyLQIcYzL4B0x4R28xGbxScdBA6EWOGa/VA==
X-Received: by 2002:adf:e586:0:b0:34c:b2df:6f01 with SMTP id
 ffacd0b85a97d-3504a737f13mr21144851f8f.21.1716219300694; 
 Mon, 20 May 2024 08:35:00 -0700 (PDT)
Received: from [192.168.1.172] ([93.5.22.158])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3502b79bcedsm29225112f8f.19.2024.05.20.08.34.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 May 2024 08:35:00 -0700 (PDT)
Message-ID: <1de9d53c-bfc3-4d10-bf9a-b89ce756836b@baylibre.com>
Date: Mon, 20 May 2024 17:34:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/3] drm/mediatek: Implement OF graphs support for
 display paths
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 chunkuang.hu@kernel.org
Cc: robh@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 p.zabel@pengutronix.de, airlied@gmail.com, daniel@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 matthias.bgg@gmail.com, shawn.sung@mediatek.com, yu-chang.lee@mediatek.com,
 ck.hu@mediatek.com, jitao.shi@mediatek.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 wenst@chromium.org, kernel@collabora.com
References: <20240516081104.83458-1-angelogioacchino.delregno@collabora.com>
 <20240516081104.83458-4-angelogioacchino.delregno@collabora.com>
Content-Language: en-US
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <20240516081104.83458-4-angelogioacchino.delregno@collabora.com>
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
Tested-by: Alexandre Mergnat <amergnat@baylibre.com>

On 16/05/2024 10:11, AngeloGioacchino Del Regno wrote:
> It is impossible to add each and every possible DDP path combination
> for each and every possible combination of SoC and board: right now,
> this driver hardcodes configuration for 10 SoCs and this is going to
> grow larger and larger, and with new hacks like the introduction of
> mtk_drm_route which is anyway not enough for all final routes as the
> DSI cannot be connected to MERGE if it's not a dual-DSI, or enabling
> DSC preventively doesn't work if the display doesn't support it, or
> others.
> 
> Since practically all display IPs in MediaTek SoCs support being
> interconnected with different instances of other, or the same, IPs
> or with different IPs and in different combinations, the final DDP
> pipeline is effectively a board specific configuration.
> 
> Implement OF graphs support to the mediatek-drm drivers, allowing to
> stop hardcoding the paths, and preventing this driver to get a huge
> amount of arrays for each board and SoC combination, also paving the
> way to share the same mtk_mmsys_driver_data between multiple SoCs,
> making it more straightforward to add support for new chips.

-- 
Regards,
Alexandre
