Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BAD78A07296
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jan 2025 11:16:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16DE710ED3E;
	Thu,  9 Jan 2025 10:16:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="r5nethUC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 884D710ED3E
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jan 2025 10:16:26 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-436202dd7f6so9270335e9.0
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Jan 2025 02:16:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1736417725; x=1737022525;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=zArLxslrcGh/OtDf8pnaxX4ZYz74YYcQRl2Asrd/XEs=;
 b=r5nethUCHbVhKTNEnYp7e89aPrn+6i35fjLHGK7STRctf6iRRtu+sXn+Ut7DWlMx/6
 bc4fEGsQkkFxO0Pb1+Y6ZqeypWow/k39wyDuolZLx5ZB96kI0eemUuws1jdESMRO279b
 4FLOOuNJE9jcUO1F0IPgvBt7o8SFk0srUq9gFTzVaRkXIGzcMgC545wF8jd3BzrZGYOK
 SXR7tU8/GWf9xcGj3vbcoJFC/KEmWkPZL6jzhIEy2RRgf84GvMaBVuScI2gi/GUcxYNw
 OqbqUURpiJUSELjFCZInLfpC5ZCYNR0MztASio4Ha/HuGOKtp3gWXnFjc2GzF7m5tIFi
 e2wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736417725; x=1737022525;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zArLxslrcGh/OtDf8pnaxX4ZYz74YYcQRl2Asrd/XEs=;
 b=AlWp88xBFUjP93Xy1du3Gi46K828Iz8W7GpetfOB2Pb5Z81WyRnC90ZTi9odHFm4qu
 mdU8XOon/8SlsS2TDpcxmIyYQbwHTVeN2jiiaC4dEW+4ZcMQ1dLY7hZasq3rx0VYI+Ud
 msXFb2j/h5ZYxPa6ieM8UizvlhSUxyoazRD5Zl9tyhfbG/ZRjo/nQgsGgdRqjfC5vmSL
 PdGtsTEhRotu4sJ7w5+HzI/fGSSI4kfvS0tk+WNJIGGGcsLixB7veh9q0+jt7dxRFmog
 bZnX+knWxfPNN/ukLj2XpSs9VxSMTpnfb5qxNC6dEC1JFqnEHyp0GqGgAFep4+x7gdtS
 m3QQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUIoaCKLUfyG/kIMdYPWThKK8MKz9mqYn3nw9gcLCFhmVjOL7HN5+qzm5ePyJI/2pbKEUy4sP3yzvs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxbclIqBrr1M/UV9VDmCYAvaP40gZputQkDuYYhDRQVPBsH1ZM+
 M2MDfZoGeaKQZe64X3BqcnW6IS8Xn2x9ecForDry7iFkGufJmmSNtjCpx/O4ZK0=
X-Gm-Gg: ASbGncuqnI5d6SjLy5PTKZ2foF8ZOl5cNLXaNkssw2SiVRcRUtJwcbxvsIfGvRpHsKz
 XJGYyoAfZySuhIkY9iXiMV2fYVd5h7bbSntsIk3y3kRd7jiptohP+M7o8uvTvVF8xZMIYjYWqiS
 txP1Deh8OO8kuuSD3xQDD1sP2mUV+bKnxmRWc6fKc+V3lBzEkbq/ugkGc1nCzwYjIcJ4SUtqKGo
 t+yEOon6aqSi6ZikEL/YN/G+C3BMDp2Zw9du7IfBdP4z1D5ydg7NvTWv+79/cSOfpcNwAE6cpWd
 Y9drGM3NLF5H/BEFITG2BURIXQ==
X-Google-Smtp-Source: AGHT+IE5w//k14IKPlz1xAW4lBSZknnT4+N1Jzl2DExoz1dSucjgBd2oOBz/i2tz+E9s1wYVK89kVw==
X-Received: by 2002:a05:600c:354e:b0:434:f9c4:a850 with SMTP id
 5b1f17b1804b1-436e269c42dmr62514755e9.10.1736417725129; 
 Thu, 09 Jan 2025 02:15:25 -0800 (PST)
Received: from ?IPV6:2a01:e0a:5ee:79d0:125:358f:ea05:210e?
 ([2a01:e0a:5ee:79d0:125:358f:ea05:210e])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-436e2dc08bbsm49704145e9.12.2025.01.09.02.15.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Jan 2025 02:15:24 -0800 (PST)
Message-ID: <9afabb6b-2e02-4b7c-8e51-9ca5b9a42aab@baylibre.com>
Date: Thu, 9 Jan 2025 11:15:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/7] dt-bindings: display: mediatek: dpi: add
 power-domains property
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 Maxime Ripard <mripard@kernel.org>, Fabien Parent <fparent@baylibre.com>,
 Will Deacon <will@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Simona Vetter <simona.vetter@ffwll.ch>, CK Hu <ck.hu@mediatek.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org, Jitao Shi <jitao.shi@mediatek.com>,
 Conor Dooley <conor+dt@kernel.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
References: <20231023-display-support-v5-0-3905f1e4b835@baylibre.com>
 <20231023-display-support-v5-1-3905f1e4b835@baylibre.com>
 <173635697547.725897.5297567835361998238.robh@kernel.org>
Content-Language: en-US
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <173635697547.725897.5297567835361998238.robh@kernel.org>
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

Thanks, fixed for v6


On 08/01/2025 18:22, Rob Herring (Arm) wrote:
> My bot found errors running 'make dt_binding_check' on your patch:
> 
> yamllint warnings/errors:
> ./Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml:100:3:
>   [error] duplication of key "power-domains" in mapping (key-duplicates)

-- 
Regards,
Alexandre
