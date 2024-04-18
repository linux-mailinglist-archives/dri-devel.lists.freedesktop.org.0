Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F4298A9694
	for <lists+dri-devel@lfdr.de>; Thu, 18 Apr 2024 11:46:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2253710FB82;
	Thu, 18 Apr 2024 09:46:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="HQOrU0GE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
 [209.85.167.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D66610FB82
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Apr 2024 09:46:16 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id
 2adb3069b0e04-518a56cdbcfso981490e87.2
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Apr 2024 02:46:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1713433574; x=1714038374;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=qHTQNdaixaJmXmKKuqa6bURMHudpKto3SJOTxQWsB1k=;
 b=HQOrU0GExtgt7KjggVLfDER7sNKrd4z1JgOXKigCmiZ3jtQXsViBCU32azqSaLVlm7
 gRQaWJNiBhwfNijgOGSOvjclHvJW1xP6rFHMhBHE40CMIiudNg5VS3VG4/ULTdy+dEhg
 FaN/v9FZlCpe7FC9iPVNqgSZ9cPX3mx8dffzyHJiaCGeIZy6NYLutA3K5x3mrq+yIpZ3
 88EkydSTt8AvpHXZ2GDUk4/m8e8kdZLOVmN0Q52lyXXZzhtKG/X31ZQCn9SyZPbS923s
 9uaoovE5ge2+++3ThBomLlVyNAk7htJYoSJ6KWBGhqR62vPQYd8fOTAcro9dh0wkbBCp
 e2Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713433574; x=1714038374;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qHTQNdaixaJmXmKKuqa6bURMHudpKto3SJOTxQWsB1k=;
 b=l52sFMXv7QvnneB9Xnsf/uNoul5w2hdoAnVDeEdM6THkZy2RG6LKaw+u/sbfwn0UEv
 4blQ5Cvb5OzAvtgF6oCpYfUOSZ3mnAnfjyzoen1FlG+UF/O3Zis94ENWXXzKyPhWRJ4D
 1nIJovGxNAXm+as8GI8dhAPBtZYLkLxvdtLXkWQcUjFUhdTEw200EWpDiO72W6uB9JfB
 0bJv0zdz9pBqAu8TGs5LQm25GFkNGZnYRi9QvgWpUaJI5yW9LSIUxVf0DUPG+s3PKYAp
 PoDdMVZqCNci5VOuOMMILxsqNnwN4R8bJ0/Xs7ShDvDm4tJSiRnNwlbK4b3M1wrvvIcG
 kFKQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXkcF7cezndzwnsvEwRWSgou1IBZId9bgwZU4x32T0tZXROFU9kaX7i+AnYcwQ0I5zX+N8ASe32ArNilU7qcY/z1x5LEpCPvQUW9orR1Naj
X-Gm-Message-State: AOJu0YzEC68hjYyWSXNKxauxAxERzh6iBsXz/DgZs5Ps2jZgqJvi3RyH
 b76Z+zUfRXpWwRp2J4vVZD6f9nDEplrs8Cp54Mk2VmSPxmBs4SixHG9c7mUgJDI=
X-Google-Smtp-Source: AGHT+IFKKdpyMPlE5wECrwePw/LL4UVvAqkEhlLOtaK+0nLQSsDUk8IMg3W91iM2KaJpK31eRkk28Q==
X-Received: by 2002:a05:6512:ea5:b0:518:e7ed:3c7c with SMTP id
 bi37-20020a0565120ea500b00518e7ed3c7cmr1799688lfb.14.1713433573769; 
 Thu, 18 Apr 2024 02:46:13 -0700 (PDT)
Received: from [192.168.1.172] ([93.5.22.158])
 by smtp.gmail.com with ESMTPSA id
 q10-20020a170906388a00b00a46aba003eesm647759ejd.215.2024.04.18.02.46.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Apr 2024 02:46:13 -0700 (PDT)
Message-ID: <286945bc-f207-4373-9589-0a9b62df1b36@baylibre.com>
Date: Thu, 18 Apr 2024 11:46:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 12/18] dt-bindings: pwm: mediatek,pwm-disp: add
 compatible for mt8365 SoC
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Jitao Shi <jitao.shi@mediatek.com>, CK Hu <ck.hu@mediatek.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-pwm@vger.kernel.org, linux-clk@vger.kernel.org
References: <20231023-display-support-v2-0-33ce8864b227@baylibre.com>
 <20231023-display-support-v2-12-33ce8864b227@baylibre.com>
 <vasuzy7cf5x6p5rnrmdrk5z54oncu2yuutupf25h5fgd5y6fpl@mnkf67agw64g>
Content-Language: en-US
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <vasuzy7cf5x6p5rnrmdrk5z54oncu2yuutupf25h5fgd5y6fpl@mnkf67agw64g>
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

Hi Uwe

On 17/04/2024 10:06, Uwe Kleine-König wrote:
> Hello,
> 
> On Tue, Apr 16, 2024 at 05:53:13PM +0200, Alexandre Mergnat wrote:
>> Add a compatible string for MediaTek Genio 350 MT8365's display PWM
>> block: this is the same as MT8183.
>>
>> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> Acked-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
>> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
> 
> I already asked in reply to v1 what the merge plan is here. There are
> changes in my pwm tree to the mediatek,pwm-disp binding already. I don't
> think they conflict with this patch, but maybe it's still easier to take
> this via pwm?!

Sorry, I though the merge strategy wasn't addressed to me because I'm not a maintainer.
It's fine for me to merge it in the PWM tree.
IMO, this change [1] shouldn't conflict with this patch.

Can you add the "Acked-by: Rob Herring (Arm) <robh@kernel.org>" please if you merge this version ?

Thanks for the review and help.

[1]: 
https://git.kernel.org/pub/scm/linux/kernel/git/ukleinek/linux.git/commit/Documentation/devicetree/bindings/pwm/mediatek,pwm-disp.yaml?h=pwm/for-next&id=fb7c3d8ba039df877886fd457538d8b24ca9c84b

-- 
Regards,
Alexandre
