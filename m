Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD7BFB40982
	for <lists+dri-devel@lfdr.de>; Tue,  2 Sep 2025 17:47:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23D8C10E7BF;
	Tue,  2 Sep 2025 15:47:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="cdiESKdO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7624D10E7BF
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Sep 2025 15:47:08 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-45b8b25296fso17472055e9.2
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Sep 2025 08:47:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1756828027; x=1757432827; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gR4jf6n49qoeIQa6xtB93bVvXG27Wam54T0FJ3gzKRg=;
 b=cdiESKdOgSSRo2Gbqk/IY81D/YfkiRnOJPxO1ON8+FPIqPh7NW5FEzqvgpTRXCoz3H
 Cpn/ZUYRZ8jQJb5ngcL6l4V8VM/xYDIelLogaTx/TZcNM3fONbcsau8T4D88TS+DHOEs
 L2q5Nct2AqLSFr7NBSNGKqwpeNNxZ1+Zt1y7iJ/ELgC0MTYWsqF+UVr16AYosfcdBiEm
 Co/1BBlsgvziQsFnGs3awMQAwKJ4zXxWSWy8+g4HUTplXvq11IjQGP11u9DGTE+EXyUY
 XdNxG1FcQK8LxdzBtWgvyKS+F7Sc7K/icaVT3Z87pZN/PbxTSVzkI7k82LnNRl1pb74g
 sfDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756828027; x=1757432827;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gR4jf6n49qoeIQa6xtB93bVvXG27Wam54T0FJ3gzKRg=;
 b=TD34AyJNEJu32HS4tE2qd7ZmszPrVavxnjXuFW4d0SVCxWQsl5mD17uNj0sqEc4kgn
 1/Dhnw82j326KGK8CfX4ETbNHFLT7Ns7a3G7ZDwivi1PRPbyNmja+FHRVVPU41lNwuEk
 gdN79ohAfpGUSYMz//YRI//AOKxaYiY89PVDedNMTB/q+KOJj+MOH5G9L1cYTPLomYaR
 GmOUZ4YfG+dMOl7N8vGFdbGEPv+Pl06rfxU7TuyJTIbHsW7OC2nFc9sK+Kc7g74G4lOE
 Jgnthv6v8ul6fZ8xiQEG7hFFzZyuXXS8YUqqQRGN/erUkIBfFUJSPeJzRwdNM+7kaMbp
 sZDA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXY4KNmu/ONT3NJeHC90MY4FjGP0zRURPI7LOwp3MZUMbmJqOtNfqrMRgmxsN1OEZqK6hQDgKELt9E=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxKdqo2vZA8/yqAuLGdRrnt+EktH4RKpsKSo3kmFjO1vS6Vmn0Z
 amIZfL0M2FACG2/v4O1opqV2JH2SCYrHE/QVuLKrN16YJWzF/BG6MQ1n
X-Gm-Gg: ASbGncu32HM1N9aHzkAaHibodHBKmDgjkuN7kKTGs55YfQ3UaZwuZInYYBrQiCXmJQz
 Gn9UPJvCKYIdjcN/6rY46evLk1kmfgpVYCJlIUaPzBycYh1B4LCV5mvuJ3qHQFT1ODC7FvNqUag
 UGMdMChhKlhdPwZX0HFWLwRE8cgFqDela85719N1TZRu5loNX9y+/lgeY5SSsp7Eh8l8GSQrha6
 6lnzywcdOmn3ISh+7d6mZIQfABhNSIdl26K0XrWq6F3w4HhsY0m7x2PN67vLIn6BlpWWvbcbcSP
 vzLaGdcasZKmJGUBCwsZ0R+gr5LKkAQB9gyr6d8HTTNz5ANyhFfdwgL9MNS5JFtmNqcbM3OwO1h
 igR9uLh5HFcPuvOYEf5lj8Wyi0rPlnnaIs+V1DhMe7KrK1h5bvdG5RyutChgj8GHIT1pRIybqnq
 bxjbLTugUjcNCEPg==
X-Google-Smtp-Source: AGHT+IFNHaA5Mk/OTIBuSkxqD2TLa8EhamiFfXy+xcSVyFlskbg2S2fkWFhv/WICHcU/8LVjc1jWCQ==
X-Received: by 2002:a05:600c:524b:b0:45b:8482:b9b9 with SMTP id
 5b1f17b1804b1-45b85e429f4mr103133785e9.35.1756828026881; 
 Tue, 02 Sep 2025 08:47:06 -0700 (PDT)
Received: from localhost
 (p200300e41f1c4d00f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f1c:4d00:f22f:74ff:fe1f:3a53])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-45b6b1cdf05sm163708975e9.1.2025.09.02.08.47.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Sep 2025 08:47:01 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>,
 "T.J. Mercier" <tjmercier@google.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@redhat.com>, Mike Rapoport <rppt@kernel.org>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-tegra@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 linux-mm@kvack.org
Subject: [PATCH 7/9] arm64: tegra: Add GPU node on Tegra234
Date: Tue,  2 Sep 2025 17:46:27 +0200
Message-ID: <20250902154630.4032984-8-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250902154630.4032984-1-thierry.reding@gmail.com>
References: <20250902154630.4032984-1-thierry.reding@gmail.com>
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

From: Thierry Reding <treding@nvidia.com>

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra234.dtsi | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra234.dtsi b/arch/arm64/boot/dts/nvidia/tegra234.dtsi
index 4d572f5fa0b1..4f8031055ad0 100644
--- a/arch/arm64/boot/dts/nvidia/tegra234.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra234.dtsi
@@ -5262,6 +5262,23 @@ pcie-ep@141e0000 {
 		};
 	};
 
+	gpu@17000000 {
+		compatible = "nvidia,ga10b";
+		reg = <0x0 0x17000000 0x0 0x1000000>,
+		      <0x0 0x18000000 0x0 0x1000000>;
+		interrupts = <GIC_SPI 67 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 68 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 70 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 71 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-names = "nonstall", "stall0", "stall1", "stall2";
+		power-domains = <&bpmp TEGRA234_POWER_DOMAIN_GPU>;
+		clocks = <&bpmp TEGRA234_CLK_GPUSYS>,
+			 <&bpmp TEGRA234_CLK_GPC0CLK>,
+			 <&bpmp TEGRA234_CLK_GPC1CLK>;
+		clock-names = "sys", "gpc0", "gpc1";
+		resets = <&bpmp TEGRA234_RESET_GPU>;
+	};
+
 	sram@40000000 {
 		compatible = "nvidia,tegra234-sysram", "mmio-sram";
 		reg = <0x0 0x40000000 0x0 0x80000>;
-- 
2.50.0

