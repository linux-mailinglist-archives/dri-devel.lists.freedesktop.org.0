Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2DA8B40983
	for <lists+dri-devel@lfdr.de>; Tue,  2 Sep 2025 17:47:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBCED10E7B8;
	Tue,  2 Sep 2025 15:47:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="gR0vrFjX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCB1A10E7B8
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Sep 2025 15:47:14 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-45a1b065d59so38383665e9.1
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Sep 2025 08:47:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1756828033; x=1757432833; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=s4ni6DYQQHBDySZ7UbEZ/7lnZ6pICpjz1prMHmfQhmA=;
 b=gR0vrFjXWQXBjIlJbIevlL8e4nO/G/rzY4pvTWr8/IwdmeLMzR4yoUX2g4pCIVlQxU
 zxTk9bFqE/JDBLubYuECT8Pp2zzM4rYZh97dr+Y3P122iX82guqOHQPBvnvl5Qh2DN4i
 mrLkNUiZLLTnYrCB/cBBwEhK4uM0vUvxrARxbEVnwwwDgg7KWbHfZjmvzbH4lvOXPvi1
 7+l4OYZ2Sx6l5DZbjS0JgRx43wI51lb2F5/JNSj8weWk97gbQkB92sUQD6iaFN1g7ceB
 A+0A2aQHzBjgpNOvIuxBIkPBleJyqfLGoVm+V8UqaRkuJZfZaJQ8SgGILW8idyoasl9F
 Uruw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756828033; x=1757432833;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=s4ni6DYQQHBDySZ7UbEZ/7lnZ6pICpjz1prMHmfQhmA=;
 b=IjEmq/+FPGBYxm39DavFt3EP/+Jro5XF5XH0fSNfKNqSBDo4aiwJShPvy6j1w4sCT9
 s9F4zLBgIMW36ega5ZSshx62NTam2TjFreQ83G76i8XwykIrmS6ooOpcS5lZesYOizoE
 pmzH1r9rmA5qnckWdPrXLMewnoF5owiDYdvRpWsTzSEAKWTVfID7f1Gwb5zUid/7eNEl
 3Y9Gid61dGU1rRncquOG4H1q3fiKP/WkqHDz75kBQiFv8ctepXr1X5t/TClJMdJ1NqVP
 AMhFiyAMzuHEpAIcTfLyPrWxG6E/IC2fel1G1bd8pxPXwyq9giYWcixtnhj1PNyR96md
 Up6Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUnPBG2Pz652zUpIn9c57dPnaVR/WfhMMALBJkgLLug13qH6GdQUyOJlWgZe/fTU9VL4dDryOaZeNM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzdRQqlsjkxD0QHVIWoa6v7OaqJm36/YM/NbO0ssCbe61lMZod5
 qDxajlIQDwfpyal0nQrNTsl3v8ro9icf8831+QQtY5buThnEd6B/fdGq
X-Gm-Gg: ASbGncsm+AtTafc5Pws1XYwV7LpFtvpLCIuZTEsfOQiiT7oJV+Aele0L2HPz2nLklXP
 a64XrqLA950BoPPQGxNsm4sAHBZu+nsdldVDae/g9uGyv79GN2H3aUvgrXm/+fdtLQ9acj2fvy3
 uH+8BKrIF3Oo+nKNCatTPYg8Ma4Hd9e6hb2uVBqdwreoFU3qSm5EbHnFV4oIukcZlcMU6WC/lAL
 q4t41JgRF6UkbQWuCO1OiyXgHhxrVzuFGkZiGRpGWjYsiy4qLEAU4decgYLwNeROW9NmoQzulfY
 sunFMOe108J+priihdC64pJ77F7OMQ5GAwQtv4EoDossohj3MMaNiAbfHCLae/yF9oteLuRKU68
 BwewalTt+UAPB9DNFXueqiBPJvC/vm1PwV2Ve5Bo9Kdm43nz0F4Vlf21atWVico/Ff3B/sW+BpB
 NiqD3gokiSkE+RtA==
X-Google-Smtp-Source: AGHT+IF6uqhh0MoB6VhNHwPxlLM19ybnZxxGRDzHhQIuurCjTrk9XBgo1dEpxbne5cu5+x+vhkeceQ==
X-Received: by 2002:a05:600c:3b01:b0:45b:88c6:709d with SMTP id
 5b1f17b1804b1-45b88c67339mr80656105e9.25.1756828033201; 
 Tue, 02 Sep 2025 08:47:13 -0700 (PDT)
Received: from localhost
 (p200300e41f1c4d00f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f1c:4d00:f22f:74ff:fe1f:3a53])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-45b7e8879cesm201587945e9.12.2025.09.02.08.47.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Sep 2025 08:47:07 -0700 (PDT)
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
Subject: [PATCH 8/9] arm64: tegra: Hook up VPR to host1x
Date: Tue,  2 Sep 2025 17:46:28 +0200
Message-ID: <20250902154630.4032984-9-thierry.reding@gmail.com>
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

The host1x needs access to the VPR region, so make sure to reference it
via the memory-region property.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra234.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra234.dtsi b/arch/arm64/boot/dts/nvidia/tegra234.dtsi
index 4f8031055ad0..0b9c2e1b47d2 100644
--- a/arch/arm64/boot/dts/nvidia/tegra234.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra234.dtsi
@@ -4414,6 +4414,9 @@ host1x@13e00000 {
 				    <14 &smmu_niso1 TEGRA234_SID_HOST1X_CTX6 1>,
 				    <15 &smmu_niso1 TEGRA234_SID_HOST1X_CTX7 1>;
 
+			memory-region = <&vpr>;
+			memory-region-names = "protected";
+
 			vic@15340000 {
 				compatible = "nvidia,tegra234-vic";
 				reg = <0x0 0x15340000 0x0 0x00040000>;
-- 
2.50.0

