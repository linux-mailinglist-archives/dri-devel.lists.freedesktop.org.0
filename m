Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51F27951687
	for <lists+dri-devel@lfdr.de>; Wed, 14 Aug 2024 10:23:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC08D10E41E;
	Wed, 14 Aug 2024 08:23:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="HeuzP6A+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
 [209.85.167.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85A4310E41E
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Aug 2024 08:23:17 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id
 2adb3069b0e04-530d0882370so6185264e87.3
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Aug 2024 01:23:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1723623795; x=1724228595;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=xk10wNvxLrP/sk7V6x9kzu7jdVHg9lMcvom23sK8kpk=;
 b=HeuzP6A+dSUU3YsRsMHpCjbqBuTWCkCuwmgteRV4jLXOsA0HQAWA/rCbzDdbc17Wng
 mNwi0bVHzySkL458tBavCboP3vg88wMpfytQWwEkgpx1l5laQGtszM17mXzpSGLvsIe9
 uCo4GeHHuuI28TBSSXZiSWR0aTadXnVX5fJ41B/dqlteJIvXsNgomHn6zNzi6q4Xsshu
 b0aoYXOyD/UCrPHN6qMYug3XF6ZjBJA0PZPZp/nrfhGe83XImgBsdc0eoO/Hww4gbNZ+
 fenotx3G9ByrgzQLQe+UrRDeuNkOH3kcTfWD+6QEPNJZwM2O0KR7Wsu0tshLraQST7PZ
 0kmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723623795; x=1724228595;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xk10wNvxLrP/sk7V6x9kzu7jdVHg9lMcvom23sK8kpk=;
 b=liaZEZCmrFtrBRcN4+Hcm5eSVKIGmUUyr/GoZsb0jY1VeRrTnf02iEzzWHrevAU4e9
 iaa9k5rFbcMKUcVHnafmtgzKCuDOgi/c49P811O5Dm4rAHkRDAA5pLW4BRPuz5tb14Jr
 pEwGyN1Tr8BOvLsOssilH0kfpoV6TIoTWVSJYCzhRWCLeaJdLNYhnZZKEHxOgkC7V5/I
 YzZ8h9aySuFutOQRNPjRb0611yYPbJb4sxskKoeYHpsq/xJ0AkXuWlrsI5AggF1+61oL
 ebPtUpx9ZEKfNOWseNclS1f9csnXI3G6MH78jb+WDZ86oBpIGBrv3X993CVLN3LHK64o
 a49w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUZ8AlPWdyhs+z/Pn8z+3OOcJI+NL6rtllcluA54JNvi+B/7WGyRPE6OKMYQWDlqnGhjnKSKRZjMQ4JEkG6jwmNU+Ccv+i1OXV0RtR9aZHm
X-Gm-Message-State: AOJu0YwF8AiSmROMCr4qJLE8pH6yF7K0Dm8yMVhUo7VEUsent/DO0//+
 StKox4fHNGtGxnrmQLAO+XlBtRgs4wBTArwz8IW9a0ig04pkgOwyU+jOLqO3CKc=
X-Google-Smtp-Source: AGHT+IG6QSK40+UiY4L+iFUDmpExRkRbgPPw1TX9OKeTaKxcEceJXBh+o1azq0f3RjCLgFSJ+P0yEg==
X-Received: by 2002:a05:6512:3e0c:b0:530:ad8b:de11 with SMTP id
 2adb3069b0e04-532eda8e5ddmr1174870e87.9.1723623795153; 
 Wed, 14 Aug 2024 01:23:15 -0700 (PDT)
Received: from [192.168.0.172] (88-127-185-239.subs.proxad.net.
 [88.127.185.239]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-36e4e51ebcdsm12266411f8f.78.2024.08.14.01.23.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Aug 2024 01:23:14 -0700 (PDT)
Message-ID: <24215f3d-30bf-4379-bb10-c4b183c16b8a@baylibre.com>
Date: Wed, 14 Aug 2024 10:23:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 00/16] Add audio support for the MediaTek Genio 350-evk
 board
To: Mark Brown <broonie@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: khilman@baylibre.com, linux-sound@vger.kernel.org,
 Liam Girdwood <lgirdwood@gmail.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, Rob Herring <robh@kernel.org>,
 Will Deacon <will@kernel.org>, linux-media@vger.kernel.org,
 Sumit Semwal <sumit.semwal@linaro.org>, Takashi Iwai <tiwai@suse.com>,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Nicolas Belin <nbelin@baylibre.com>, Lee Jones <lee@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Flora Fu <flora.fu@mediatek.com>,
 Jaroslav Kysela <perex@perex.cz>, =?UTF-8?Q?Christian_K=C3=B6nig?=
 <christian.koenig@amd.com>, Catalin Marinas <catalin.marinas@arm.com>
References: <20240226-audio-i350-v7-0-6518d953a141@baylibre.com>
Content-Language: en-US
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <20240226-audio-i350-v7-0-6518d953a141@baylibre.com>
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

Hi guys !

Simple gentle ping, the serie seems ready to be applied.
Thanks

-- 
Regards,
Alexandre
