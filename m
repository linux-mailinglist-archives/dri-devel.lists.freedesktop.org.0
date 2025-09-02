Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59CC8B40985
	for <lists+dri-devel@lfdr.de>; Tue,  2 Sep 2025 17:47:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9253110E7C1;
	Tue,  2 Sep 2025 15:47:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="lVewK/oh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21BD710E7C1
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Sep 2025 15:47:18 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id
 ffacd0b85a97d-3d3ff4a4d6fso1945443f8f.0
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Sep 2025 08:47:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1756828036; x=1757432836; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Sg/JpW3SvRZNED9bEp4vwHJ/+yfFIdl8fwvEoOosPbg=;
 b=lVewK/oh2RU3j+Trb7Bp8GS85vyqQZQPn3bBNMx3c5yMGASbJgFNkS0CMAaRx36GPN
 ubQharUlqdqLdwiNuoG78PLIdUvTuO/Dy+si5qIbFpXZ/8ezGXVPbCZW0i0cEnfZ1BLH
 Xk0AerZa21Kwe5o568xJfefO5rDfi9bka02X1+UfhEx8iUA5YT1XDFSFfKnxgmnOe9BC
 APJYwjkNuVSc8cQ2BB1LklglBU6YmqWivEREntqynnK2WO+pi7ezrjzYMgyVnFwugDI9
 L5sJT/OBLnxXFJWBmvue1asdUsSgURrNEWvZaO6ndCQ/2N0hBwvhiAN+deo4sIm52hGg
 Fd7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756828036; x=1757432836;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Sg/JpW3SvRZNED9bEp4vwHJ/+yfFIdl8fwvEoOosPbg=;
 b=rw3sRBRCR/+RaDPPVxwikWYZwTfU/ByYk9gokk6ZH8rsNoWa18FDmaZelU6KCrmbfp
 cC0QgsPx8l2cDtLQeoDfKqFpRRHcqYvwvu3n208qApdLw04cpQQYui3WXk/w2tXFNwkt
 jRa5g9btGYOrTPvMlY9RVt8mhFkP+kDjIUqPM662N8MevQHblYUy2+cv54lOGnG6AXMT
 Q/3WzqMyUe1m/A8uejwm+RH2bZHZsj00qr0VfujehiZZLiK4qmjHSV+n5+S1oWka6hL9
 RDeXysBAdW0+RhVWfuky3Vtb/eVpm+mWBrqIpImqUFoGlCTlwJ3qqHnqOgdJj9+dYaVh
 CB8g==
X-Forwarded-Encrypted: i=1;
 AJvYcCV6B/EUe8pnaD/Tec1S8ziRV7ct4h+Y+OmUDkjyidGBr2EfJU6Pq/bfbaoPdM1wOZHPY32RwF14xXw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzIsnsHRRyiiVOtkJWjB4NPIZAtvY476BcW4DT2JPz2rs7JaGIX
 wJoqGwUW+hSJ7jQ8X/aQMN2koBCxa0/VeHMPc/lK0QyrN4sMYmlkueU3j2geqg==
X-Gm-Gg: ASbGncuSt/pc4yDhn4vvF8a3yUFzPB3aiLegw9ANekXSsGgFpQ/u2URakhzoAnqO4Pc
 l1TVcU5yETQ8VpkyAUg9xK5zCvKnVpIhaMwSLj0qUYYOMPnJEOC4x1idxmdb7E21cme5sv2HNrS
 d3r4seBsGrP74pshCuIXdMPwSeBX2Hs31GHiCUsb3p+KaCrBJAWE9vX40k8tlGY6GptnnrzYVqZ
 YprKfjkAwwiNzJX4Mx/Po0KmUgx+iGA308Ugw6y95VlGzy3Xfpui9F9zQ+K3AJ34LjxbhXljnkX
 MY5CtgwA8p15romKcHZZMPPb/AKiJK0JfRLb6eZDcLCIngQpfUyG2OXC0CeBnsb4MQQHWkmMY/R
 f6f+A99vwhxLMc9aCAKlyzBHi7Gbp+L9z66vE/wgj4MaQgqhU0xlIMyNat0zATE19uA6Mu6ohXz
 H3NK41U33qMpBD/X3+TRisxXaA
X-Google-Smtp-Source: AGHT+IG6QkcfvyEfQHcIkt21AHSSn0KPT2FNEyPTNaag6qHbdAblJtYW9hhT/NvtJKA8YQoxfOyM0A==
X-Received: by 2002:a05:6000:2011:b0:3c7:36f3:c352 with SMTP id
 ffacd0b85a97d-3d1df444ad2mr8516244f8f.59.1756828036486; 
 Tue, 02 Sep 2025 08:47:16 -0700 (PDT)
Received: from localhost
 (p200300e41f1c4d00f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f1c:4d00:f22f:74ff:fe1f:3a53])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3d0f85c287fsm18228079f8f.52.2025.09.02.08.47.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Sep 2025 08:47:13 -0700 (PDT)
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
Subject: [PATCH 9/9] arm64: tegra: Hook up VPR to the GPU
Date: Tue,  2 Sep 2025 17:46:29 +0200
Message-ID: <20250902154630.4032984-10-thierry.reding@gmail.com>
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

The GPU needs to be idled before the VPR can be resized and unidled
afterwards. Associate it with the VPR using the standard memory-region
device tree property.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra234.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra234.dtsi b/arch/arm64/boot/dts/nvidia/tegra234.dtsi
index 0b9c2e1b47d2..98d87144a2e4 100644
--- a/arch/arm64/boot/dts/nvidia/tegra234.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra234.dtsi
@@ -5280,6 +5280,9 @@ gpu@17000000 {
 			 <&bpmp TEGRA234_CLK_GPC1CLK>;
 		clock-names = "sys", "gpc0", "gpc1";
 		resets = <&bpmp TEGRA234_RESET_GPU>;
+
+		memory-region-names = "vpr";
+		memory-region = <&vpr>;
 	};
 
 	sram@40000000 {
-- 
2.50.0

