Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91609B4097F
	for <lists+dri-devel@lfdr.de>; Tue,  2 Sep 2025 17:47:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2A7A10E7BC;
	Tue,  2 Sep 2025 15:47:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="WZkNXdYX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04C8D10E7D8
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Sep 2025 15:47:03 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-45b9c35bc0aso4888515e9.2
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Sep 2025 08:47:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1756828021; x=1757432821; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kqVDx7JqAPgJ8o1edyCmRNgqjh3YbvmCUsqqhz4V0Ns=;
 b=WZkNXdYXwniHeefrzssFYs2cNv+YNVeZL+5W8WgcbVo3zHp/IFKBA1f1lKJafzyZu2
 X/UOSH84wPTIXfpwMq/7SyQVVcRqE6fzjpggDMzL0AwkPCFL6Scj9zHAaugIbfoggPhZ
 ua3uTEYmLO6BFgzJXTvmfaoh9lOIx1tnFjSeCC64YwiA6BhvuLWMluRAfEai1BhvLMx2
 AkHSwP8/54u6T4rBARxCSc8IKZDIbGM01Jpy2Bp5skde+MznvGNdEVIUdfjj9cxWYUCe
 N7sy17Jp9U6Kz7QmjKnYlrXcCzlF3EjIRVT4r5jB3OvoXihJaVEfEJchATtVs/ngAlft
 ejVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756828021; x=1757432821;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kqVDx7JqAPgJ8o1edyCmRNgqjh3YbvmCUsqqhz4V0Ns=;
 b=XIcySKVMnbI7/5KPYqvxSXdfWpPrPPiEXHTI6uLz99bflENjm2kM6mAVJwWELdUeqi
 zNQTbomI6kV8ykbe33dPlh2MM3AnBtd3ARAKS3J+cmV1MChYYmcJGO0Yv1XAHQXRKMbD
 iL/DasC0V9X+yoXOvHt67arYjJEE+OyoC6gEWSFH/hjYqpai/2uxw78HJkDz+Rqjo0PZ
 D4vag7FwHh26oZLSN3slhOvSF8Z2r8OO3FFI0uMV3m52khbmcWpz+p88BELCQVzL4iqg
 SMfMzBjODh4c/qsgwG2crN8dd4d9fGgpPjTK6p5mT1g7rd5IyQktMcQPUJhxd6i0qhPE
 TqLQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV1FOWLwYiMlC2p5jPvXi65vaGI78bMlb0SoOxj8ekQgIIaBcEzzMutn0CieZ36plJ1o0efc4tK+Js=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YymL/kC7iSlvEujIFBfRWJ4bZIvg9aqa1kT7cd04FZNmzV03MlB
 YXbSGsrbpzdIDwk00g8r63O/41cyzUnr1h7CKdDZW2KHwJxgbZD/f4jd
X-Gm-Gg: ASbGncuet9XFKMlWdYdWbNRPSIGsdh6YzQjw0suaJl41X+v635Z4mfM62TFGPLGtOMd
 wdZ7JBA8P9pIl5cWYp3bcKquFAorowjqQmWMpcqAjtKAd0idm93rbPajV9fQiwEqw5BodT8/dWe
 96N+vk2q7ELYiC207ouMAqbe/nAuTSiwQAM47Ab3NJA7cpdQp/OtgLO3guLY8br4ya2Hv25IzU3
 DN8MbN0ZIb9FU4KbMTHOYEivQqimWgDnwWyG7faxPSQqQz9EuGKP/NuTm5pi/ks699ms2jAmTP4
 7YDGuD/dJwRTqjCZ6BzbZoC8M+v+l9gqTAp2YWrKmMArPru1XvBg+VxdJdHBd2SHcBELUVNZooS
 xYwAHIAxyAnmnA0bKLxjFo/U/sP50274mH4UB7IXeDg6GdsYrfJ0tZEVa91Kc3aWugN0Swj/QD3
 NGtmJIy5rrokpStXBeH+XdMTLd
X-Google-Smtp-Source: AGHT+IGhjQ61sFdI6+vTwemnHBbvz8ZNQ9haJ2DTjk2jvyEjnERfMyfPcIWCXNf5u0RiWSHPgdHosg==
X-Received: by 2002:a05:600c:524b:b0:45b:84f2:76ff with SMTP id
 5b1f17b1804b1-45b8549c809mr99393805e9.0.1756828021297; 
 Tue, 02 Sep 2025 08:47:01 -0700 (PDT)
Received: from localhost
 (p200300e41f1c4d00f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f1c:4d00:f22f:74ff:fe1f:3a53])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-45b7e7d2393sm202232315e9.3.2025.09.02.08.47.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Sep 2025 08:47:00 -0700 (PDT)
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
Subject: [PATCH 6/9] arm64: tegra: Add VPR placeholder node on Tegra234
Date: Tue,  2 Sep 2025 17:46:26 +0200
Message-ID: <20250902154630.4032984-7-thierry.reding@gmail.com>
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

This node contains two sets of properties, one for the case where the
VPR is resizable (in which case the VPR region will be dynamically
allocated at boot time) and another case where the VPR is fixed in size
and initialized by early firmware.

The firmware running on the device is responsible for updating the node
with the real physical address for the fixed VPR case and remove the
properties needed only for resizable VPR. Similarly, if the VPR is
resizable, the firmware should remove the "reg" property since it is no
longer needed.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra234.dtsi | 34 ++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra234.dtsi b/arch/arm64/boot/dts/nvidia/tegra234.dtsi
index df034dbb8285..4d572f5fa0b1 100644
--- a/arch/arm64/boot/dts/nvidia/tegra234.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra234.dtsi
@@ -28,6 +28,40 @@ aliases {
 		i2c8 = &dp_aux_ch3_i2c;
 	};
 
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		vpr: video-protection-region@0 {
+			compatible = "nvidia,tegra-video-protection-region";
+			status = "disabled";
+			no-map;
+
+			/*
+			 * Two variants exist for this. For fixed VPR, the
+			 * firmware is supposed to update the "reg" property
+			 * with the fixed memory region configured as VPR.
+			 *
+			 * For resizable VPR we don't care about the exact
+			 * address and instead want a reserved region to be
+			 * allocated with a certain size and alignment at
+			 * boot time.
+			 *
+			 * The firmware is responsible for removing the
+			 * unused set of properties.
+			 */
+
+			/* fixed VPR */
+			reg = <0x0 0x0 0x0 0x0>;
+
+			/* resizable VPR */
+			size = <0x0 0x70000000>;
+			alignment = <0x0 0x100000>;
+			reusable;
+		};
+	};
+
 	bus@0 {
 		compatible = "simple-bus";
 
-- 
2.50.0

