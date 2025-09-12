Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B5090B5503F
	for <lists+dri-devel@lfdr.de>; Fri, 12 Sep 2025 16:03:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB18B10EC58;
	Fri, 12 Sep 2025 14:03:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ji+0kHW6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
 [209.85.221.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAC7410EC58
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Sep 2025 14:03:16 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id
 ffacd0b85a97d-3dae49b117bso1562185f8f.1
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Sep 2025 07:03:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1757685795; x=1758290595; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=uH+YHXFVH2K1mzrQAHIZiTdd0wND2UdYXw5OhP6ad/I=;
 b=ji+0kHW6SACaeVmjyHvF5bvawVM1dUS1ykkR5mAPWfhl89EO1+MSG9Rb3W6060GSul
 QKY0gmsHRiPnLc/P3D4c9uhkhmTSvcz/u44H2yGK5eFvVvxNiRGJy/sIkhcOq0kfszJX
 tBCo+1RfHYE2DD8AonR8nmWaU5aEJYwOZbccBirBlLM/tgP51slH81Wcy7r+qLNdHtTV
 f7cpSgd2NFsuQ//R60lfpwPKuIwwFZPNjr/DSYQyfgb6GQR/CzeavNfEjeGkJxnLj+24
 m3A6eyVALYFBDy1ahhEyhLHOw92z2V/XDNz3/notVShu0Nvj7AJQUdAWBXA3HLU8q4iu
 0QiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757685795; x=1758290595;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uH+YHXFVH2K1mzrQAHIZiTdd0wND2UdYXw5OhP6ad/I=;
 b=uidFo8HboKjNtsqyjaAEGyg7jQS53bjjp2MT58ykYWRCcVroc7vW7VQfYjwI+ulUF9
 fHEGDnkqtib0eRgYce5Qwc/OHiKfnAh4m9pE1aBi8XlRXhqnJtvv7w4nFOsbgpNWfmxI
 4woa1Cs/ro3u8te3HeYEEIT+PeB/kJoghKW/R0K13QRPJySy8Tf2QVRXq3LHDzvZ3aWR
 /uxHC8OixUQgxQqKK4SZ9tbJA5bxEX9G+EoWQQJHizoYmv/32ia1qMthbvyiCIN53ZpN
 bcZhCX1G8JkzSZBl360Mc6hFC6QmTa/6jFkOhQP1kSqLhcvoiRv5RE9YTq7oQ8Wz5Yhp
 z1vg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU81Vsd+NQYR3cKF1QxLPXRFuJVhavKGzEO2TlyFXNHBSFsUnf+kOMYJfhINgSxIDaP+zVvpHiU/fU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxV4aEbuzcbhKiD83U3Z3yfWRe4+o6PHJ6b8EbjEJpY4dTy+7EA
 KBC1umh66qbd7d2mlCcpM2b/pi4NPksYXSdN2oE4MVM2JdXfNgboTISt
X-Gm-Gg: ASbGncv5pgb/FZWbC7JtP2uqRi3/ImsWoTpsZGaELE18hM07dq0k1hCtIc8KyzEBpRN
 8m2cNPpHp/KGQXLjqecnIZGkrwUSwETr/cbqpkhKO/5dW5qpVaLd6jGZldcLRHNt7iZtz42ArKG
 rNX5urF3RhRWfrSc1+16NNGGJzP7aWkIhul1G4N4e9Fkqsrs1p71WkSc8fNvzYBvWtCZFgGmT3W
 kYCR07KfNoi13E6cuIUhBwqrNszV4Rmp7KL/dmn2nJTLeYZS0tSsm6/0fY1m/KYfXLSW6QMeNBn
 zLCWxYc9O2hGDblm2uJG31zZpQhCGQl9dXclqdB9o3CIE4NFs9ZWUFT4JfMiBbTvIgsmc6Jjnon
 k4ch3oC1xpZZofhu5dJVJTwOKB4ukolkaRuLrHHcFzuGzamdGyGeC
X-Google-Smtp-Source: AGHT+IHkpXgL67su2eP0NWVxDv0gnk9lbCDXLQlAVKtF0IvH2Kl70osZH/zbwKbUjcuxvdmzPdw9Pw==
X-Received: by 2002:a05:6000:61e:b0:3e7:4414:794b with SMTP id
 ffacd0b85a97d-3e765a018a5mr2537897f8f.50.1757685794754; 
 Fri, 12 Sep 2025 07:03:14 -0700 (PDT)
Received: from [192.168.2.177] ([91.116.220.47])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3e774a3fb5bsm2033837f8f.58.2025.09.12.07.03.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Sep 2025 07:03:13 -0700 (PDT)
Message-ID: <7765f224-60b2-4c92-a597-58c1c6bc5580@gmail.com>
Date: Fri, 12 Sep 2025 16:03:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 19/38] arm64: dts: mediatek: mt6795: Add mediatek, infracfg
 to iommu node
To: Fei Shao <fshao@chromium.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-mediatek@lists.infradead.org, robh@kernel.org,
 daniel.lezcano@linaro.org, mwalle@kernel.org, devicetree@vger.kernel.org,
 linus.walleij@linaro.org, linux-remoteproc@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 olivia.wen@mediatek.com, shane.chien@mediatek.com,
 linux-gpio@vger.kernel.org, linux-phy@lists.infradead.org,
 airlied@gmail.com, simona@ffwll.ch, herbert@gondor.apana.org.au,
 jassisinghbrar@gmail.com, jiaxin.yu@mediatek.com, andy.teng@mediatek.com,
 chunfeng.yun@mediatek.com, jieyy.yang@mediatek.com, chunkuang.hu@kernel.org,
 conor+dt@kernel.org, jitao.shi@mediatek.com, p.zabel@pengutronix.de,
 arnd@arndb.de, kishon@kernel.org, kyrie.wu@mediatek.corp-partner.google.com,
 maarten.lankhorst@linux.intel.com, tinghan.shen@mediatek.com,
 mripard@kernel.org, ck.hu@mediatek.com, broonie@kernel.org,
 eugen.hristev@linaro.org, houlong.wei@mediatek.com, tglx@linutronix.de,
 mchehab@kernel.org, linux-arm-kernel@lists.infradead.org,
 granquet@baylibre.com, sam.shih@mediatek.com, mathieu.poirier@linaro.org,
 fparent@baylibre.com, andersson@kernel.org, sean.wang@kernel.org,
 linux-sound@vger.kernel.org, lgirdwood@gmail.com, vkoul@kernel.org,
 linux-crypto@vger.kernel.org, tzimmermann@suse.de, atenart@kernel.org,
 krzk+dt@kernel.org, linux-media@vger.kernel.org, davem@davemloft.net
References: <20250724083914.61351-1-angelogioacchino.delregno@collabora.com>
 <20250724083914.61351-20-angelogioacchino.delregno@collabora.com>
 <CAC=S1nguRWyG3ubmSFE95_zgsCjjq4dxGWr5ErV9-Yu2+mTmpw@mail.gmail.com>
Content-Language: en-US, ca-ES, es-ES
From: Matthias Brugger <matthias.bgg@gmail.com>
Autocrypt: addr=matthias.bgg@gmail.com; keydata=
 xsFNBFP1zgUBEAC21D6hk7//0kOmsUrE3eZ55kjc9DmFPKIz6l4NggqwQjBNRHIMh04BbCMY
 fL3eT7ZsYV5nur7zctmJ+vbszoOASXUpfq8M+S5hU2w7sBaVk5rpH9yW8CUWz2+ZpQXPJcFa
 OhLZuSKB1F5JcvLbETRjNzNU7B3TdS2+zkgQQdEyt7Ij2HXGLJ2w+yG2GuR9/iyCJRf10Okq
 gTh//XESJZ8S6KlOWbLXRE+yfkKDXQx2Jr1XuVvM3zPqH5FMg8reRVFsQ+vI0b+OlyekT/Xe
 0Hwvqkev95GG6x7yseJwI+2ydDH6M5O7fPKFW5mzAdDE2g/K9B4e2tYK6/rA7Fq4cqiAw1+u
 EgO44+eFgv082xtBez5WNkGn18vtw0LW3ESmKh19u6kEGoi0WZwslCNaGFrS4M7OH+aOJeqK
 fx5dIv2CEbxc6xnHY7dwkcHikTA4QdbdFeUSuj4YhIZ+0QlDVtS1QEXyvZbZky7ur9rHkZvP
 ZqlUsLJ2nOqsmahMTIQ8Mgx9SLEShWqD4kOF4zNfPJsgEMB49KbS2o9jxbGB+JKupjNddfxZ
 HlH1KF8QwCMZEYaTNogrVazuEJzx6JdRpR3sFda/0x5qjTadwIW6Cl9tkqe2h391dOGX1eOA
 1ntn9O/39KqSrWNGvm+1raHK+Ev1yPtn0Wxn+0oy1tl67TxUjQARAQABzSlNYXR0aGlhcyBC
 cnVnZ2VyIDxtYXR0aGlhcy5iZ2dAZ21haWwuY29tPsLBkgQTAQIAPAIbAwYLCQgHAwIGFQgC
 CQoLBBYCAwECHgECF4AWIQTmuZIYwPLDJRwsOhfZFAuyVhMC8QUCWt3scQIZAQAKCRDZFAuy
 VhMC8WzRD/4onkC+gCxG+dvui5SXCJ7bGLCu0xVtiGC673Kz5Aq3heITsERHBV0BqqctOEBy
 ZozQQe2Hindu9lasOmwfH8+vfTK+2teCgWesoE3g3XKbrOCB4RSrQmXGC3JYx6rcvMlLV/Ch
 YMRR3qv04BOchnjkGtvm9aZWH52/6XfChyh7XYndTe5F2bqeTjt+kF/ql+xMc4E6pniqIfkv
 c0wsH4CkBHqoZl9w5e/b9MspTqsU9NszTEOFhy7p2CYw6JEa/vmzR6YDzGs8AihieIXDOfpT
 DUr0YUlDrwDSrlm/2MjNIPTmSGHH94ScOqu/XmGW/0q1iar/Yr0leomUOeeEzCqQtunqShtE
 4Mn2uEixFL+9jiVtMjujr6mphznwpEqObPCZ3IcWqOFEz77rSL+oqFiEA03A2WBDlMm++Sve
 9jpkJBLosJRhAYmQ6ey6MFO6Krylw1LXcq5z1XQQavtFRgZoruHZ3XlhT5wcfLJtAqrtfCe0
 aQ0kJW+4zj9/So0uxJDAtGuOpDYnmK26dgFN0tAhVuNInEVhtErtLJHeJzFKJzNyQ4GlCaLw
 jKcwWcqDJcrx9R7LsCu4l2XpKiyxY6fO4O8DnSleVll9NPfAZFZvf8AIy3EQ8BokUsiuUYHz
 wUo6pclk55PZRaAsHDX/fNr24uC6Eh5oNQ+v4Pax/gtyyc7BTQRd1TlIARAAm78mTny44Hwd
 IYNK4ZQH6U5pxcJtU45LLBmSr4DK/7er9chpvJ5pgzCGuI25ceNTEg5FChYcgfNMKqwCAekk
 V9Iegzi6UK448W1eOp8QeQDS6sHpLSOe8np6/zvmUvhiLokk7tZBhGz+Xs5qQmJPXcag7AMi
 fuEcf88ZSpChmUB3WflJV2DpxF3sSon5Ew2i53umXLqdRIJEw1Zs2puDJaMqwP3wIyMdrfdI
 H1ZBBJDIWV/53P52mKtYQ0Khje+/AolpKl96opi6o9VLGeqkpeqrKM2cb1bjo5Zmn4lXl6Nv
 JRH/ZT68zBtOKUtwhSlOB2bE8IDonQZCOYo2w0opiAgyfpbij8uiI7siBE6bWx2fQpsmi4Jr
 ZBmhDT6n/uYleGW0DRcZmE2UjeekPWUumN13jaVZuhThV65SnhU05chZT8vU1nATAwirMVeX
 geZGLwxhscduk3nNb5VSsV95EM/KOtilrH69ZL6Xrnw88f6xaaGPdVyUigBTWc/fcWuw1+nk
 GJDNqjfSvB7ie114R08Q28aYt8LCJRXYM1WuYloTcIhRSXUohGgHmh7usl469/Ra5CFaMhT3
 yCVciuHdZh3u+x+O1sRcOhaFW3BkxKEy+ntxw8J7ZzhgFOgi2HGkOGgM9R03A6ywc0sPwbgk
 gF7HCLirshP2U/qxWy3C8DkAEQEAAcLBdgQYAQgAIBYhBOa5khjA8sMlHCw6F9kUC7JWEwLx
 BQJd1TlIAhsMAAoJENkUC7JWEwLxtdcP/jHJ9vI8adFi1HQoWUKCQbZdZ5ZJHayFKIzU9kZE
 /FHzzzMDZYFgcCTs2kmUVyGloStXpZ0WtdCMMB31jBoQe5x9LtICHEip0irNXm80WsyPCEHU
 3wx91QkOmDJftm6T8+F3lqhlc3CwJGpoPY7AVlevzXNJfATZR0+Yh9NhON5Ww4AjsZntqQKx
 E8rrieLRd+he57ZdRKtRRNGKZOS4wetNhodjfnjhr4Z25BAssD5q+x4uaO8ofGxTjOdrSnRh
 vhzPCgmP7BKRUZA0wNvFxjboIw8rbTiOFGb1Ebrzuqrrr3WFuK4C1YAF4CyXUBL6Z1Lto//i
 44ziQUK9diAgfE/8GhXP0JlMwRUBlXNtErJgItR/XAuFwfO6BOI43P19YwEsuyQq+rubW2Wv
 rWY2Bj2dXDAKUxS4TuLUf2v/b9Rct36ljzbNxeEWt+Yq4IOY6QHnE+w4xVAkfwjT+Vup8sCp
 +zFJv9fVUpo/bjePOL4PMP1y+PYrp4PmPmRwoklBpy1ep8m8XURv46fGUHUEIsTwPWs2Q87k
 7vjYyrcyAOarX2X5pvMQvpAMADGf2Z3wrCsDdG25w2HztweUNd9QEprtJG8GNNzMOD4cQ82T
 a7eGvPWPeXauWJDLVR9jHtWT9Ot3BQgmApLxACvwvD1a69jaFKov28SPHxUCQ9Y1Y/Ct
In-Reply-To: <CAC=S1nguRWyG3ubmSFE95_zgsCjjq4dxGWr5ErV9-Yu2+mTmpw@mail.gmail.com>
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



On 25/07/2025 12:52, Fei Shao wrote:
> On Thu, Jul 24, 2025 at 5:49 PM AngeloGioacchino Del Regno
> <angelogioacchino.delregno@collabora.com> wrote:
>>
>> The "M4U" IOMMU requires a handle to the infracfg to switch to
>> the 4gb/pae addressing mode: add it.
>>
>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> 
> Reviewed-by: Fei Shao <fshao@chromium.org>

Applied thanks

> 
>> ---
>>   arch/arm64/boot/dts/mediatek/mt6795.dtsi | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/arch/arm64/boot/dts/mediatek/mt6795.dtsi b/arch/arm64/boot/dts/mediatek/mt6795.dtsi
>> index e5e269a660b1..38f65aad2802 100644
>> --- a/arch/arm64/boot/dts/mediatek/mt6795.dtsi
>> +++ b/arch/arm64/boot/dts/mediatek/mt6795.dtsi
>> @@ -427,6 +427,7 @@ iommu: iommu@10205000 {
>>                          clocks = <&infracfg CLK_INFRA_M4U>;
>>                          clock-names = "bclk";
>>                          interrupts = <GIC_SPI 146 IRQ_TYPE_LEVEL_LOW>;
>> +                       mediatek,infracfg = <&infracfg>;
>>                          mediatek,larbs = <&larb0 &larb1 &larb2 &larb3>;
>>                          power-domains = <&spm MT6795_POWER_DOMAIN_MM>;
>>                          #iommu-cells = <1>;
>> --
>> 2.50.1
>>
>>

