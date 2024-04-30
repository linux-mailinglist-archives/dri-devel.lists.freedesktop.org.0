Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DF938B6F6F
	for <lists+dri-devel@lfdr.de>; Tue, 30 Apr 2024 12:18:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B01010FB7C;
	Tue, 30 Apr 2024 10:17:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="BQi05wsu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD12710FB7C
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Apr 2024 10:17:56 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-41b5dd5af48so38836205e9.0
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Apr 2024 03:17:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1714472275; x=1715077075;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=61QGK6EE+JvUrOTegIXYCGltaVd3HNOf6mVtdZdFzzs=;
 b=BQi05wsuGO55NbLVyiZWvLCdpiwLaLeLgLdOFJzsyRcPlnCbDSDtP/TUYCpdgM2Ydw
 Xec8gb07/mywyqgBzcSVd6e9LsTxwOYoX94NC2UihcJ8jT5kI8pUM7OqgMj0rdPX9z+B
 h0YkMGwWccTSRbllpHiZ4V+XUNEcufrt+6bgZf+7EdJ4dpbqbwAVSO1PdJCgbbuotY+P
 x6EKLcMYBmbC9gSrNB9UDYnUP7WYiCIsiVfudcPmEZmcq57HbRM2rl4+QHFr2AVfwXQN
 2iQYYRtQfyIAqVpXrj89zned2GacAcKMYTzlB5+AE0eXTR9Lb8NTOPlf2EQu8Nobd7zo
 e84Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714472275; x=1715077075;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=61QGK6EE+JvUrOTegIXYCGltaVd3HNOf6mVtdZdFzzs=;
 b=lK5SpELb9jdz3ZYvHtnBU1lyXDwcAPalOChTAsr9L6Ie4u62i1anztrZxEFF7zHBdw
 I5c5flNlGAtNDlTrjzT33EZjx6J0ALkYWxEg30SsAMM9YKBEBxklvAr1fy1Vn7iEN4l6
 LaNHVXhlnm6Pb0UDRNS+76ogWlzZKWCAnBsZcutYleUjmKwyE3ghAZhOn4kbSPTHU/5z
 OtPX8GAGz428YF/A83FCaljEasEOedfbUMisfi5wl3Q9Ib6q3mU4XXaVfm9qCWRRucXh
 jQV8a2KLhdN0ls1uIvjflpKZNadqrSpYIXGPLyORNHJ0HrQVH0CKzeZef3IedEoyzd+/
 mFNQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVTLn7HnRC1KO8My+kq3afAafEEb7k/OXKcJvoNWl+/wEIobVbI+bgwWKpyGEFWVOQsjXeRs1Lx/JMj2maqwbVT3lzFA7MsptX7LGvcCtED
X-Gm-Message-State: AOJu0YzTDk7Es3swfXFy78B+ttJfP/2avKt+U1oMdpJUlXdOlRuALe3j
 lD0E3spBaH6bT6+jTz+Ie9Tx/4AjhOSzBUvTQ1ZxgQedjeQ/Q+Uj6axEGkHwHFA=
X-Google-Smtp-Source: AGHT+IGicD8LgUlYM1L8jAIzwk7lp2yQ2IjySmGuztg67KCqJ6vLOq0P1wNOuCpEesOPQpne2u8iGQ==
X-Received: by 2002:a05:600c:1e28:b0:418:3eb7:e8c6 with SMTP id
 ay40-20020a05600c1e2800b004183eb7e8c6mr1897308wmb.5.1714472274834; 
 Tue, 30 Apr 2024 03:17:54 -0700 (PDT)
Received: from [192.168.1.172] ([93.5.22.158])
 by smtp.gmail.com with ESMTPSA id
 i17-20020adfe491000000b0034cc9dcccbdsm7046219wrm.113.2024.04.30.03.17.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Apr 2024 03:17:54 -0700 (PDT)
Message-ID: <1fc23530-89ba-4e36-9e9a-a1289f56a9bc@baylibre.com>
Date: Tue, 30 Apr 2024 12:17:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/3] drm/mediatek: Add support for OF graphs
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
References: <20240409120211.321153-1-angelogioacchino.delregno@collabora.com>
Content-Language: en-US
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <20240409120211.321153-1-angelogioacchino.delregno@collabora.com>
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

Hi Angelo,

On 09/04/2024 14:02, AngeloGioacchino Del Regno wrote:
> This series was tested on MT8195 Cherry Tomato and on MT8395 Radxa
> NIO-12L with both hardcoded paths, OF graph support and partially
> hardcoded paths (meaning main display through OF graph and external
> display hardcoded, because of OVL_ADAPTOR).

Is that make sense for you to add the DTS changes of these boards into this serie ?
I asked because, IMHO, that could help to understand the serie.

-- 
Regards,
Alexandre
