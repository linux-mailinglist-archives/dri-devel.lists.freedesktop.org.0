Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7001A8A9AB6
	for <lists+dri-devel@lfdr.de>; Thu, 18 Apr 2024 15:02:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51C1010EF40;
	Thu, 18 Apr 2024 13:02:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="vNX3pCre";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com
 [209.85.218.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83DE110EF40
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Apr 2024 13:02:41 +0000 (UTC)
Received: by mail-ej1-f53.google.com with SMTP id
 a640c23a62f3a-a526d381d2fso345264666b.0
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Apr 2024 06:02:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1713445359; x=1714050159;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=bVyPUZzpnAkaHf5uIez6yP0jHFtLyERSTeCCJwCmVdY=;
 b=vNX3pCre/NC6aD0rEj+lbeKiVGxrWTLzrcHpveMpwK+6sAVs9LB1BmN8Pl45BM2y+5
 11iuNrovg340N1irBIefdG5cbicsEe3fcCifx/t4vnbjDb2IJSE9F/7xFb7BEGa/YudL
 +hmbcCNamCCvVMDzf1Nz7j/VeuBWxNz4JsuJPE47LeLl91EYyvQYjYsQnsPW5mkIgj5c
 VD4XOyf+5AE9cSnkdo48uRCvdVyCDzYm37pwOYaB6JU9d3R0rvTFAiTWQGUsS/lsXpeu
 xtMkhBnTPPEB64YDaABH+7C7NXC1IWH5vjenn0E8C9A7y1KJnmvwXDhU+eLPtIOfWiZV
 nd3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713445359; x=1714050159;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bVyPUZzpnAkaHf5uIez6yP0jHFtLyERSTeCCJwCmVdY=;
 b=n8CoyJT+LupCTaSu7fbr2iYUz42XbxC1KKyoGsffQnMOgu9rcxYr2F475/v1uCkx3/
 RoNDSDah8jZOMS4a4Lti7xfh59s6isI3d0KDKKn8bwyL85JCDyH0YQ/DHkQYZ9SEkecI
 vKTP4ahp/XnY4DiAKlL1InlqH9d9EAqiXIscgtcKJ2Rr84CmgZGfSrDsylAcG6kjkpyQ
 DVw3Mhka6deYPxQFdhTatmPqkFEFs8iC7UzzRn0HBKmd00M5bRY78K/oQ3n6AL1xKtvM
 FHcRVIbtew2JB/7QZuw2Hmn+DnJCR8u/4bN7SuhknPRYFvIysNGtQCxTn9+4DdaB/npD
 gSsg==
X-Gm-Message-State: AOJu0YyMxN+bs2j1FMDbM5yd8j6sK6NcIs4z1wT68Ea1bRJkesTclxzB
 1bUvhvi0Ziwp4DTTHCfDBOQnyyPgGF2WfkQnRB+xKywDNUOYZAYbw5w36y44dvQ=
X-Google-Smtp-Source: AGHT+IH0N89eEQyHSFCXfRykybkZDOZuDp2tJqO99tXBPvhuSPwv2IlxEhe/EsNO/07OXybXEnBOWw==
X-Received: by 2002:a17:907:36c1:b0:a55:6135:7ab7 with SMTP id
 bj1-20020a17090736c100b00a5561357ab7mr2297200ejc.6.1713445359195; 
 Thu, 18 Apr 2024 06:02:39 -0700 (PDT)
Received: from [192.168.1.172] ([93.5.22.158])
 by smtp.gmail.com with ESMTPSA id
 w23-20020a170907271700b00a556f2f18d6sm794633ejk.57.2024.04.18.06.02.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Apr 2024 06:02:38 -0700 (PDT)
Message-ID: <57d55af9-33d1-45de-b8e2-ff9ab2e74e4f@baylibre.com>
Date: Thu, 18 Apr 2024 15:02:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 18/18] arm64: dts: mediatek: add display support for
 mt8365-evk
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Jitao Shi <jitao.shi@mediatek.com>,
 CK Hu <ck.hu@mediatek.com>, =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?=
 <u.kleine-koenig@pengutronix.de>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-pwm@vger.kernel.org,
 linux-clk@vger.kernel.org
References: <20231023-display-support-v2-0-33ce8864b227@baylibre.com>
 <20231023-display-support-v2-18-33ce8864b227@baylibre.com>
 <ee8d0a32-b4fb-4fc4-83b2-300f7453d95f@collabora.com>
Content-Language: en-US
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <ee8d0a32-b4fb-4fc4-83b2-300f7453d95f@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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



On 17/04/2024 12:27, AngeloGioacchino Del Regno wrote:
> 
>> +        irq_ite_pins {
> 
> Did you run dtbs_check?!? :-)

Yes without error, here my command:
dt-validate -s Documentation/devicetree/bindings arch/arm64/boot/dts/mediatek/mt8365-evk.dtb

Also I've done a "make dtbs_check" just to be sure, nothing wrong on mt8365-evk.dtb.

For you, what is the issue please ?

-- 
Regards,
Alexandre
