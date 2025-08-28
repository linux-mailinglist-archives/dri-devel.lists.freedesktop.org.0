Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61870B3A5C5
	for <lists+dri-devel@lfdr.de>; Thu, 28 Aug 2025 18:12:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0002510EA44;
	Thu, 28 Aug 2025 16:11:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="OJmXGypS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com
 [209.85.214.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6363710EA44
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Aug 2025 16:11:56 +0000 (UTC)
Received: by mail-pl1-f181.google.com with SMTP id
 d9443c01a7336-24646202152so14062215ad.0
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Aug 2025 09:11:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1756397516; x=1757002316; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=VCgz87AQbD+NIqYtaGv4MfNGpvxEv3mxEjPpigap2YI=;
 b=OJmXGypS7+g55bJKuN1tuZkOYEWw7iX5YLJmScAEtKJYmFCSFfSkjBqq3rSWpRKJ1J
 PeQnNuIjf72mJdrHblYgB0vqHJRGkCgt00wEyNdQXZYeqgYGkWTNiLd97lx6gDG5qncE
 mV9R10KAxDXFmboecH3KQW0h2bZ4XhrLW2GjqCn1ZIYXCCVOMR9I50MxfrBDLw5vgtbm
 wbzT6b1g7QBvZ/o1+SfraqaNV0zatwn6vUkNay7zvYrIbsb8iByhBSgHrqgy7GVs+Gz+
 nroHTrvSO+FGUt4QUDH7TPX26bAc1dJx4j1ocRZLa7nR+nz2uilE7VX1I0R+hSwAVpCA
 pjBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756397516; x=1757002316;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=VCgz87AQbD+NIqYtaGv4MfNGpvxEv3mxEjPpigap2YI=;
 b=rOAITUwcv9lkZgPSTG77KGdXnASokcvrdEyr7JWuIocrvza11xIC0HsEM0CIaT7qLg
 1Hp5kbcaDVeET4m2BDxLCvXc4/6V81jbgMiVcg3lBrDbpO7r8Zzwx5qZhgnGXOiR/tla
 jmRXfzxAXfCYfW9fA4jJbGCe6jKib8DXQ7/OWT1Iv/f3KqIMMkMWVpUu8ImWiqRElnSp
 flFINewcstuG0Oh7CJy9V87qElWXQQjmkgIyeNssm3k8fG418WJ9FwODjSf9iUh4Qz0i
 BbxQoDIfuqN23Zg8JBYj7C24DpjRR5z82qj01UHZUBDf3JjuK8Zs4HeyjgZ5UYIpnWj0
 1wig==
X-Forwarded-Encrypted: i=1;
 AJvYcCVggc3//m5FsmOBnDuSMTSm94KDjaHHRk7zzrPAnzmUv+gITidRaeQ+/LH/5nsJJ5slAWqvqL8aD3o=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzS4sD62lmZ2oEMstQIKojLZsepTDujCNAhKsIMSfW97OQsC2x7
 VTbeN5I3Ze/PR7uhq5FXQAkzkuktZoLPAiHGP8m7M86RePx7FZh9Hgy+
X-Gm-Gg: ASbGncsIiKDBcrY8Wpg6hvgfc+x7eFRaxIiVR2J20ewX9kncBk3Sk1XXlXA/OAIyfKY
 PEoM0wrWVuHpuSBTnrAUSgILZX4ABk+I4YWYxOl/zFV1WgmU4etQaPK9F8dQ0zlZ/REY6D4aFsi
 20TyzgJ9uhKUyG53wAcrUrC6Jte9mKT7kkKgBAy0bic7/mQOrSrrJGeEoWWnfYRuyYKWtsK9EcJ
 aGUGsh/8wj9d1ZGqnirHof/xZ0NFLo7Q7i21RZ68pDDoAJm6ti0Tg84JVuNBXNsRByWZdBzF4bp
 axlVpxFQk/VJL0F14qduI96P8O3+S9h8HqMGUTWLTe0b1sAvU095gP+LD0td2B4jCMJDLJRM4YZ
 cUUhG2h2oZv+7Tovmpl3KQzTjRSM/e19Q2iRMd1M8NpKDyoqgr7trmIq8jh1PdvCn
X-Google-Smtp-Source: AGHT+IEelSOuEo8Npbahj3GwLi0XEymTTpHMsSHpMsvQzhvD7rxDhVw5w3VB77ZuaLmwNpmmTqLyYw==
X-Received: by 2002:a17:903:19ec:b0:248:9e56:e806 with SMTP id
 d9443c01a7336-2489e56ea30mr87843455ad.12.1756397515676; 
 Thu, 28 Aug 2025 09:11:55 -0700 (PDT)
Received: from [192.168.1.111] ([59.188.211.98])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-248a63b5916sm45971445ad.52.2025.08.28.09.11.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Aug 2025 09:11:55 -0700 (PDT)
Message-ID: <932e0085-c901-40f8-b0d5-67f8f0b934e6@gmail.com>
Date: Fri, 29 Aug 2025 00:11:40 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/37] arm64: Add initial device trees for Apple M2
 Pro/Max/Ultra devices
To: Janne Grunau <j@jannau.net>, Sven Peter <sven@kernel.org>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Hector Martin <marcan@marcan.st>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>, Thomas Gleixner
 <tglx@linutronix.de>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Mark Kettenis <kettenis@openbsd.org>, Andi Shyti <andi.shyti@kernel.org>,
 Jassi Brar <jassisinghbrar@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sasha Finkelstein <fnkl.kernel@gmail.com>,
 Marcel Holtmann <marcel@holtmann.org>,
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
 Johannes Berg <johannes@sipsolutions.net>, van Spriel <arend@broadcom.com>,
 Lee Jones <lee@kernel.org>, =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?=
 <ukleinek@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck
 <linux@roeck-us.net>, Michael Turquette <mturquette@baylibre.com>,
 =?UTF-8?Q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>,
 Vinod Koul <vkoul@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Marc Zyngier <maz@kernel.org>,
 Ulf Hansson <ulf.hansson@linaro.org>, Keith Busch <kbusch@kernel.org>,
 Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@lst.de>,
 Sagi Grimberg <sagi@grimberg.me>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org, iommu@lists.linux.dev, linux-gpio@vger.kernel.org,
 linux-i2c@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-bluetooth@vger.kernel.org, linux-wireless@vger.kernel.org,
 linux-pwm@vger.kernel.org, linux-watchdog@vger.kernel.org,
 linux-clk@vger.kernel.org, dmaengine@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-spi@vger.kernel.org,
 linux-nvme@lists.infradead.org
References: <20250828-dt-apple-t6020-v1-0-507ba4c4b98e@jannau.net>
Content-Language: en-US
From: Nick Chan <towinchenmi@gmail.com>
In-Reply-To: <20250828-dt-apple-t6020-v1-0-507ba4c4b98e@jannau.net>
Content-Type: text/plain; charset=UTF-8
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


Janne Grunau 於 2025/8/28 晚上10:01 寫道:
> This series adds device trees for Apple's M2 Pro, Max and Ultra based
> devices. The M2 Pro (t6020), M2 Max (t6021) and M2 Ultra (t6022) SoCs
> follow design of the t600x family so copy the structure of SoC *.dtsi
> files.
[...]
> After discussion with the devicetree maintainers we agreed to not extend
> lists with the generic compatibles anymore [1]. Instead either the first
> compatible SoC or t8103 is used as fallback compatible supported by the
> drivers. t8103 is used as default since most drivers and bindings were
> initially written for M1 based devices.
>
> The series adds those fallback compatibles to drivers where necessary,
> annotates the SoC lists for generic compatibles as "do not extend" and
> adds t6020 per-SoC compatibles.

The series is inconsistent about the use of generic fallback compatibles.

"apple,aic2", "apple,s5l-fpwm", "apple,asc-mailbox-v4" is still used.


[...]

Best regards,
Nick Chan
