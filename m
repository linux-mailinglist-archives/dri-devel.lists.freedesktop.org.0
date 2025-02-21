Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F8FCA3FE89
	for <lists+dri-devel@lfdr.de>; Fri, 21 Feb 2025 19:15:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94F9A10E238;
	Fri, 21 Feb 2025 18:15:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="PuiN/8Wb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03D2410E238
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Feb 2025 18:15:44 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id
 ffacd0b85a97d-38f1e8efef5so1474087f8f.1
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Feb 2025 10:15:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740161743; x=1740766543; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4XQxXF+PqlTv7K3oBNr3byDHUiGFiR8jDQTmJ+u89x0=;
 b=PuiN/8WbPiC/s2OCk5BCaiPrzB0+wbJ+5Izt9VRHeeylcbi7EjUW6xhNVqcbpnPDSR
 VL5b0GSd964UvQehP9KHgfZtZ29fK4MbnpmtFwzlT5AHjZGydLeat7c4CH/ozlJh4ma3
 8Gm5aML8/2b874tVX2dpFaFwHQe2ltLUfW4LgN9hU4LwMi1fH9wWfTnPZt5MFhx1qJzk
 eEJahwpnpulaKuVscdQMB1LjNW/Mi4gdD38K9Wv0Dm6psr5A789oOCuPsYQbq3Y9T07+
 Bl16GMhOC7WLW0v2zcUgr+GqxLYbpItWQXQbI1DYxSgD/4BhdYl5EjcBOLs0n/8zKXdZ
 7vVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740161743; x=1740766543;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4XQxXF+PqlTv7K3oBNr3byDHUiGFiR8jDQTmJ+u89x0=;
 b=cNM8NLqYl/t3phl3O+oOvfrCZWGBx4rfBIQwP6UcbyoLj9flCyIDvxkJsBE+XCQI5v
 b/XihFvZ24kQihDKIiFBrv3hKOQ1QxNy4SQcaq+FLoN4jV7RTTrnnY+wu6EbQaJ3EKkB
 Ay/2sQpeAN1zTFh+ltf2A5ZF2g2zXCTOrtFXj80/aLEPWDHVcDFlmdMVV6AjgodB3cvI
 MM91ethaH7OuoiYddLMn+rEggOtz3ZTjlf4vl4Lwn1dQePBEyunQkFlWLo1VJzjElVon
 fixNBrSZkbZcDRLJhbPhD7Ql3y1W5vue2kBYswg/qm2PA+8xXphMUtUVkQ+/CX40jSrY
 G2MQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWEdEO0CagaqWyL65IgfDGSxeAabXDOjCv+T2Tlvp3rLgHh14HWwf2SUHZzRqIpawrFs82/+hXQhoI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxa9FYAwtWsZqvEERjxJ2sueOCTtHis6by/7rgGQS3kuG8jG204
 DQhaI8JWPHz5HSv/d7W5I3teqnckD8vnOgGuDXjNUKakqU4eyvoE
X-Gm-Gg: ASbGncuZeB2U6/uTFOQ0HYWLzu/lR4y7plfzfzKiHxxYzpMusRlfVSQNtfQ4D7SOpeh
 QGsGVIKnuMf14NgI3SX6A8/vl3VK2xfL6oedZZFFxdiDnDGsdbWKVc/3cagEJX+oEI4+sgTv+V8
 FgBSUeA1a3HnHxq8h3YOh/9kCEXex+t98vrqmQyaPu5ttjEacD4UhDLcC5I789+FTl8ZHlyF498
 Fi/rjl4XywNE/yXPVllEJ/lEZFg/+vAsPMzV4jCsDFd8klmYQ4UN11Yuo6yaWH60d0RSRDG6tk9
 rePQWpo3Jhq2+qptnhshZ7jbZ4niSc5D9rIK7hvubnoGVgPDR1+TFwNlJ4Vlz4dxy46nDQ8FLx4
 7Lw==
X-Google-Smtp-Source: AGHT+IEUcd8ZVq/GSMpj0nEp4xNKJ3oVuqW8jkTX+24Fpx6yj7XA7+1f/SvbeSr2zKHVbT8cItUZ6A==
X-Received: by 2002:a05:6000:1543:b0:38f:46c4:4a6e with SMTP id
 ffacd0b85a97d-38f6e979cdcmr3162525f8f.24.1740161743326; 
 Fri, 21 Feb 2025 10:15:43 -0800 (PST)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net.
 [86.58.6.171]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38f2591513bsm24244645f8f.55.2025.02.21.10.15.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Feb 2025 10:15:43 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Ulf Hansson <ulf.hansson@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>, Andre Przywara <andre.przywara@arm.com>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-pm@vger.kernel.org
Subject: Re: [PATCH 5/5] arm64: dts: allwinner: h616: enable Mali GPU for all
 boards
Date: Fri, 21 Feb 2025 19:15:41 +0100
Message-ID: <13703667.uLZWGnKmhe@jernej-laptop>
In-Reply-To: <20250221005802.11001-6-andre.przywara@arm.com>
References: <20250221005802.11001-1-andre.przywara@arm.com>
 <20250221005802.11001-6-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
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

Dne petek, 21. februar 2025 ob 01:58:02 Srednjeevropski standardni =C4=8Das=
 je Andre Przywara napisal(a):
> All Allwinner H616/H618 SoCs contain a Mali G31 MP2 GPU.
>=20
> Enable the DT nodes for that GPU, and specify the regulator providing
> power to the VDD_GPU pins of the package. The rest of the DT node is set
> by the SoC, so is not board specific.
>=20
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


