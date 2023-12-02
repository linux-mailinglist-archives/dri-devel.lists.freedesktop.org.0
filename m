Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B6C2E801CB7
	for <lists+dri-devel@lfdr.de>; Sat,  2 Dec 2023 13:52:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE21710E1D6;
	Sat,  2 Dec 2023 12:52:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E09E810E19A
 for <dri-devel@lists.freedesktop.org>; Sat,  2 Dec 2023 12:52:00 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-a187cd4eb91so388388466b.3
 for <dri-devel@lists.freedesktop.org>; Sat, 02 Dec 2023 04:52:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701521519; x=1702126319; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=alZsdcAcMlLtVRnOYds6Kv0dEWGog0rlTIYGT7GnEUw=;
 b=ZNvrmwQye6OCvVbH9P8Ek/FsNqvQ1CAOwzNGTYk3P5DZoe0gB5ej5Me0ep7rYjFY85
 iyLBl8f9eEJZ268md1GkKPRmZvcXAOsgrfKj4JRhXGxDHZLYcUW2ENP48NITv8Fcoi1E
 F7ZcjKU2QtZeXudXtjSG89HVpXXvH2t5fDyh0HFQRiMoARnEctSs8c2zxjWy7AxJunfB
 iVtGdGVUS+BcuhADVyl0xzeeLp/vxOmWZZhMk4rQTKa7srfmys5Etukmm8vsq6JeXhHS
 ldnddUnksNAnDakX+YN3O88iEZN1MFyCRyXkg3kTvcA3tVh98e3ioj9cvibUcveEfD3V
 gQYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701521519; x=1702126319;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=alZsdcAcMlLtVRnOYds6Kv0dEWGog0rlTIYGT7GnEUw=;
 b=VlOWNQIKuooabxTc0JNItPHOJDufdImttmF7KJRaerHr72RwF5p+qfaLJRE+M7ie5K
 Zb1OYzQ1SqgaUV1rVbdHZU5at9YrVUAvVeRPS3kaO6pcbD2mBcWmtMo2p9WzckRyJAZ2
 uelNLnRo8NcdSZYJiGErkV4WMGtwyceDiGohAlArGehR0DvnGS4QVqsGlLCCC137gTPT
 /siBBXecs4tGrv8I6Hzd2wbdBlzKfavP8ezi52jOp9WNZtrTwlmEHFmHFoUVUBrw9Ugt
 gfNGYK0cMC8naWq4UUz+knjPLi36yo6S8OF0TQIC0mFisCaugn4HNu3cKtoSMJPJ0HI6
 R94w==
X-Gm-Message-State: AOJu0YwGbizHRVz1hXpT+BsojPyol3+sgVfdM6soiyWJzI6PhG1Abusj
 6t/YjZUbcrk4PZVQYd71YA==
X-Google-Smtp-Source: AGHT+IHtz8+Zp/uL1trpgUWl4gzjVY8w4Xh7BBppb7LpwHM+Q+E5jb/aRHUwTg4W9siZYL2ZFwznIQ==
X-Received: by 2002:a17:906:51d9:b0:a1a:76cd:697c with SMTP id
 v25-20020a17090651d900b00a1a76cd697cmr219758ejk.100.1701521519205; 
 Sat, 02 Dec 2023 04:51:59 -0800 (PST)
Received: from U4.lan ([2a02:810b:f40:4300:908e:b829:354b:f8ee])
 by smtp.gmail.com with ESMTPSA id
 g5-20020a170906198500b009c5c5c2c5a4sm3018161ejd.219.2023.12.02.04.51.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Dec 2023 04:51:58 -0800 (PST)
From: Alex Bee <knaerzche@gmail.com>
To: Heiko Stuebner <heiko@sntech.de>, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v2 0/5] Add power-controller and gpu for RK3128
Date: Sat,  2 Dec 2023 13:51:39 +0100
Message-ID: <20231202125144.66052-1-knaerzche@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
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
Cc: devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 Alex Bee <knaerzche@gmail.com>, linux-rockchip@lists.infradead.org,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The first patch in this series fixes the pm-domain driver and adds
power-domains which are currently missing. This touches the ABI which is
not and was never used until now. Not all of them are used yet, but when
the power-controller is added to the DT in patch 2 the ABI should not
be changed again.
Patch 3-5 are adding the the gpu compatible to dt-bindings, adding the gpu
node and the respective operating points to SoC DT and finally enabling it
for XPI-3128 board.

Note: DT patches are based on maintainer's repo.

Alex Bee (5):
  pmdomain: rockchip: Add missing powerdomains for RK3128
  ARM: dts: rockchip: Add power-controller for RK3128
  dt-bindings: gpu: mali-utgard: Add Rockchip RK3128 compatible
  ARM: dts: rockchip: Add GPU node for RK3128
  ARM: dts: rockchip: Enable GPU for XPI-3128

 .../bindings/gpu/arm,mali-utgard.yaml         |   1 +
 .../arm/boot/dts/rockchip/rk3128-xpi-3128.dts |   5 +
 arch/arm/boot/dts/rockchip/rk3128.dtsi        | 145 ++++++++++++++++++
 drivers/pmdomain/rockchip/pm-domains.c        |  13 +-
 include/dt-bindings/power/rk3128-power.h      |   3 +
 5 files changed, 162 insertions(+), 5 deletions(-)


base-commit: fd610e604837936440ef7c64ab6998b004631647
-- 
2.43.0

