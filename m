Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 698E1851D3D
	for <lists+dri-devel@lfdr.de>; Mon, 12 Feb 2024 19:50:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3108010E793;
	Mon, 12 Feb 2024 18:50:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="E5yeGUe1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com
 [209.85.210.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C19C010E633
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Feb 2024 18:49:58 +0000 (UTC)
Received: by mail-ot1-f46.google.com with SMTP id
 46e09a7af769-6e2ee49ebaaso354987a34.0
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Feb 2024 10:49:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1707763798; x=1708368598; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=BLzcSEHbNUSeOFrNtcrpXIPfOMtCBqOUofoVjSWgQKU=;
 b=E5yeGUe13leS0CpPlJdAcugTVop1uCIg0wOB29EIzobb4VgtFCXTdoqs5dC6VUvdxB
 4tDBhpWtPMsNDLUXwUcWFtvpWWsTiDq9gLXd4mPXfXk1yaNwPWNYLLD1MCyCJ28UaGGe
 NA5HysyJjCoNLaNQ9MdcOoeTFC7mqPHEU34L9RvuR++RO/NWrQDy/k6nPfCHdO0Vlw/K
 U1YbSZF9ZbE6D5UwVUEmfvsKZbOW1P1MGjBnq+qJqzcRlsaZDixOYoHjTNd6P3q4EGXB
 mrRwlTdg/9hhW8TezssQ91kuRy7oowx8XetchN97FVKf7+6zQhtBTF1NMnUrHD7/gm8W
 4qFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707763798; x=1708368598;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=BLzcSEHbNUSeOFrNtcrpXIPfOMtCBqOUofoVjSWgQKU=;
 b=If4JsWpSZJIrFLOJ5U3/Lfk4oAYhHQQnmyD/8NcsUdjk9a1odZoNWlm1G7WusxSsiF
 9PIPOpmo9crdlQGPDdS8CoZD5kvke1suVOheblB+VqyZOPcEm+WfcqtZeWNcWqGwkkUN
 LkWkaVL6VcisHVRkaVv5nM2/tyJ7uK/RjAdtOWyUjpiZzUasow3y+2qMOUPp+51cyqn9
 bVwVHm/s+jSr+pU0kZ1pPErftUcp12WcAjvVKyStGHoEfxGczGnPXwBsfiDPD6MW1xhU
 tigffj9jJJZLwFNTA/tage8gQvVuIRhljuy97MOVwR9KtEp5zfXFu847iQsaYodiM+au
 0JcQ==
X-Gm-Message-State: AOJu0YzCOSrn8fRJVT7cuCFJkNMP7UzET2EeZo4/d0v7+166bqYmOpNi
 RcoOPVS64BehT2yhHBcU3e4FZAjvvEdG8vKy9+tCYLUDfMHJp5yG
X-Google-Smtp-Source: AGHT+IHneg5XD8S4MizRHRt/A1l7Ent/MUBvmmK/9w/tsrBI3iKx6+jgmxqd49TSSEHch/JK9vCwvg==
X-Received: by 2002:a05:6820:d87:b0:59d:3ada:e3dd with SMTP id
 ek7-20020a0568200d8700b0059d3adae3ddmr5725639oob.0.1707763797902; 
 Mon, 12 Feb 2024 10:49:57 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCWHcL7AtxWani3dggaoRAzrQC/P6uqNHc1JJtDf2wpBkcvKsUYL+Mn7PrL8YZRQLocnfPPeQz5C8DGAVmTrTxLhbWYbJ11eaV+hYG9IL/cO9tA16yA0uDP+/2gSK8rz72DBbrhUcGk3PAW97VdpdNpOii0/MEDbA+hxZH0hQPYv+f57lSrrSgGWdWSGbzx5Trf4o0l/kv7wOGz9pd7VbzC9pQSgtieEQC40NKGVdK8IrtWCIVpZVbBAfo691Y81XhkcF8skiqKeEvhDVeQiygVDaueAyf9COSoxBEgrRl8LwAhgPY8Rukz9sY1MdJnD6VeDL/n4SPFoNYyo8ljXUGxrDs+dsZWfndr5+Ds1ygJfq5hG440zQ5EYbCyo5rTfOGSdMO427pycf2/FurDo68VZ/AapVtlqsSnAlq/Kuwr2WxJXoVYFn+9OC8aJ0VNNZtuazEq2Kcx+wTwK/hEAUY1PsBhQEjP/w/9vEp7SaFsGDjWfvLnKgTuOnzWnNlV5EThGVUyiGxQdKgVtPkAmj3B/MgAc/wK9p1hxG5tBXZP5Hjl09nEhD4ONTIZy
Received: from localhost.localdomain ([75.28.21.198])
 by smtp.gmail.com with ESMTPSA id
 b7-20020a4a3407000000b0059d5360c62esm171939ooa.11.2024.02.12.10.49.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Feb 2024 10:49:57 -0800 (PST)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-rockchip@lists.infradead.org
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 tzimmermann@suse.de, mripard@kernel.org, maarten.lankhorst@linux.intel.com,
 daniel@ffwll.ch, airlied@gmail.com, sam@ravnborg.org,
 quic_jesszhan@quicinc.com, neil.armstrong@linaro.org, megi@xff.cz,
 kernel@puri.sm, agx@sigxcpu.org, heiko@sntech.de, conor+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org,
 Chris Morgan <macromorgan@hotmail.com>
Subject: [PATCH 0/7] Add Support for RK3566 Powkiddy RGB10MAX3
Date: Mon, 12 Feb 2024 12:49:43 -0600
Message-Id: <20240212184950.52210-1-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.34.1
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Chris Morgan <macromorgan@hotmail.com>

Add support for the Powkiddy RGB10MAX3 handheld gaming console.

[1] https://powkiddy.com/products/pre-sale-powkiddy-rgb10max3-handheld-game-console

Chris Morgan (7):
  dt-bindings: display: st7703: Add Powkiddy RGB10MAX3 panel
  drm/panel: st7703: Add Powkiddy RGB10MAX3 Panel Support
  dt-bindings: display: Document ST7703 panel rotation
  drm/panel: st7703: Add Panel Rotation Support
  arm64: dts: rockchip: Update powkiddy rk2023 dtsi for RGB10MAX3
  dt-bindings: arm: rockchip: Add Powkiddy RGB10MAX3
  arm64: dts: rockchip: Add Powkiddy RGB10MAX3

 .../devicetree/bindings/arm/rockchip.yaml     |   1 +
 .../display/panel/rocktech,jh057n00900.yaml   |   4 +
 arch/arm64/boot/dts/rockchip/Makefile         |   1 +
 .../rockchip/rk3566-powkiddy-rgb10max3.dts    |  87 +++++++++++++++
 .../dts/rockchip/rk3566-powkiddy-rgb30.dts    |  18 +++
 .../dts/rockchip/rk3566-powkiddy-rk2023.dts   |  18 +++
 .../dts/rockchip/rk3566-powkiddy-rk2023.dtsi  |  18 +--
 drivers/gpu/drm/panel/panel-sitronix-st7703.c | 104 ++++++++++++++++++
 8 files changed, 234 insertions(+), 17 deletions(-)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3566-powkiddy-rgb10max3.dts

-- 
2.34.1

