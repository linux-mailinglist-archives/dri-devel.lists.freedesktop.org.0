Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 919E7914370
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jun 2024 09:18:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2235410E373;
	Mon, 24 Jun 2024 07:18:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="T8ul4DGr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com
 [209.85.208.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C33A710E373
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2024 07:18:38 +0000 (UTC)
Received: by mail-ed1-f42.google.com with SMTP id
 4fb4d7f45d1cf-57d1d614049so4388424a12.1
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2024 00:18:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1719213516; x=1719818316;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=VVMa9A6daZ/dRP8VM8IurvG+X0g0NVTgiHoFw7o3XMY=;
 b=T8ul4DGrCJebuFAQwVW4/Ngq/pwbCuddqRmT8RcA75TK6ULOuMrn7YEaAL782pm2Fo
 0W68dMn6LqCz29/eG8mrcCLLr/m8q7nqGRTSEtSnJKbTxnkS402uOApFn/86of66gRuI
 y7JOEOq6Bt08RIBINQg8KIL37dssgog4MstXtwr6vvZlmzu9TEwKFko0ykI8RUx+77Sm
 GuWIJSjx9fYVML0AdZkNDDhH8HVpZLfrqydD8lvlECUExNfTffZ9lc03lsV3OMBOOc46
 erVpicvN3jsmrq/lfXNLd6YZqryaB/1kXI6oqgvmdc3/OrQGqLUrsDCdNmvdlu1wrk8F
 smyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719213516; x=1719818316;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=VVMa9A6daZ/dRP8VM8IurvG+X0g0NVTgiHoFw7o3XMY=;
 b=XpgSkSqLq1y2poe+pi6MnO/1KjytWfAn66egZdqXeAd6t0GM2gZocK6MVu9D8j6AF2
 DOK1iYy0BlmiA0OW6q/3KwAIHw9AehboIt2mQbf9RAc0VwoojyJZFqGwyYXufcCSmuUS
 FD0bTj0uBYVZaJMw+hLlcEPsXqbVuX8VfXwMcCBXcSNbsMrsL0rCZFiDT0YLzqmfxCSV
 VwBeNrUyIuI5zBPr1jQPPsQ2HJD0PeUgnGGusLj7JDyNh9rxCq1LVbw+Uu+xDdXVtr6U
 U3qitBNJNx9MKWZ53O7QXlOOW0a8O2gM+yPHF9sIqqpWJbpvW9lk8LE5pVhV8syU7Uk3
 5ylg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWDeQEWZKa95/GoKBPY78JDorCzst+a5YHBlVsW9XzVoACWinpokjJ2eb/fhA4KJqjoKDwiAUe344P+T8RyFaSBrhyGwUXKWT2ZThE7OSEs
X-Gm-Message-State: AOJu0Yzo5pjcniPEKjAq40IdsT73ymc6sCuKeMExlKhR25v2bdpTJFmh
 uxNZ1mlWpKiWOD4dWymMSegFd5AvZG7ZFg5AAC0bWfuYm2a2KeuGQprIcoiuIDA=
X-Google-Smtp-Source: AGHT+IFYuzkC5GcaR7ybJaQuKfvtiTIdzs6hbNIAng1NWd/STYMqVRnXwAQr3lPQRgqXQ/dOhA/qTg==
X-Received: by 2002:a50:d503:0:b0:57d:3ea:3862 with SMTP id
 4fb4d7f45d1cf-57d4bdbe7d0mr3049784a12.27.1719213516347; 
 Mon, 24 Jun 2024 00:18:36 -0700 (PDT)
Received: from [192.168.1.172] ([93.5.22.158])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-57d303da378sm4280811a12.18.2024.06.24.00.18.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Jun 2024 00:18:36 -0700 (PDT)
Message-ID: <20fe8bd0-2760-4568-94eb-889b9cdd4339@baylibre.com>
Date: Mon, 24 Jun 2024 09:18:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 06/15] dt-bindings: display: mediatek: dpi: add
 power-domains property
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Jitao Shi <jitao.shi@mediatek.com>, CK Hu <ck.hu@mediatek.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Fabien Parent <fparent@baylibre.com>
References: <20231023-display-support-v4-0-ed82eb168fb1@baylibre.com>
 <20231023-display-support-v4-6-ed82eb168fb1@baylibre.com>
 <CAAOTY_-sk1aoXdG=Wq_fMAtCxqA=VC+GVOMURhaDadXnBqm_kQ@mail.gmail.com>
Content-Language: en-US
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <CAAOTY_-sk1aoXdG=Wq_fMAtCxqA=VC+GVOMURhaDadXnBqm_kQ@mail.gmail.com>
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



On 21/06/2024 17:10, Chun-Kuang Hu wrote:
> Hi, Alexandre:
> 
> <amergnat@baylibre.com>  於 2024年5月23日 週四 下午8:49寫道：
>> From: Fabien Parent<fparent@baylibre.com>
>>
>> DPI is part of the display / multimedia block in MediaTek SoCs, and
>> always have a power-domain (at least in the upstream device-trees).
>> Add the power-domains property to the binding documentation.
> I've tired to apply this patch but has conflict. Please rebase this
> patch onto latest mainline kernel.
> Other binding patches in this series is applied to mediatek-drm-next [1].
> 
> [1]https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/log/?h=mediatek-drm-next

Hello Chun-Kuang,

First, thank you for the review and merge.
This serie has been rebased on top of Angelo's series [1] to
use the OF graphs support.
I have to rebase on the lastest Angelo's serie [2].

[1] https://lore.kernel.org/all/20240521075717.50330-1-angelogioacchino.delregno@collabora.com/
[2] https://lore.kernel.org/all/20240618101726.110416-1-angelogioacchino.delregno@collabora.com/

-- 
Regards,
Alexandre
