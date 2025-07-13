Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 469F6B037EB
	for <lists+dri-devel@lfdr.de>; Mon, 14 Jul 2025 09:28:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F90810E403;
	Mon, 14 Jul 2025 07:28:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="cCXM7Rj3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com
 [209.85.216.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C687C10E033;
 Sun, 13 Jul 2025 02:53:46 +0000 (UTC)
Received: by mail-pj1-f52.google.com with SMTP id
 98e67ed59e1d1-313eeb77b1fso2793844a91.1; 
 Sat, 12 Jul 2025 19:53:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752375226; x=1752980026; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6BjtA+38PaXu4R7KEWbDJSP4mSWUP1v/3PF8r8C6k8w=;
 b=cCXM7Rj3mHF+NbLb3GpIAao2+Nr8rShQiaU6Ti2Ee837xRnulCoIXwp+pzW9cyj55s
 /y4q3Mvss5Vi0LArDjW7/7l4iT+6u9xX2zv2OhIfZU4HgWPALOF9jlvl1yQmNvhCWez8
 qqyq1pOa9hxJYaKWFDalo2NXb3QHSPRoYDi+If1lf41YmBip2HWtZpBhSaxD2Zz2k1GH
 GPqL6bv3aYEzgMZ6G/fkyAUwjAgpyTCoVrW8x6NJxInEtG+KqK4bWi5kISPqqs3z7zFt
 9W5jmWFFYoXRTciWNgoioF8wGRJmYJkOhbu5F4Bbc7fE5OsK/5XGlqOZ+L45L0snkPMB
 QMBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752375226; x=1752980026;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6BjtA+38PaXu4R7KEWbDJSP4mSWUP1v/3PF8r8C6k8w=;
 b=WAPlHqsBaBLEGOIFjtu+iPUsPIy7c6kd8y7FZiKpqgynXf+eunqA6+vH2SyDjUJHDA
 97XafUiXP0Q5BaZRrHxHLLQZD/gNMUEqcsDMMT4exe3TIv4x4UBQh3PccgXCWCxC5wGs
 c8UMRY+4Y3OgEOfkfz5FfJbhKn2GBYGklzJblyY8jNmhWweeQ8nQAZF3A6gLPRkiHuMh
 7uH9kwy9eGReiJzG9gO8NXZ5MLcdYdB2RarfBB4gZDBpNDhkeGQW/iW6Rr9f24hTBzO7
 E7oBegyEH5/dxiZvM2SoSQvzPivBJXQXCMRPZha4px1bwKZz7ACJe4zyWQmZeHMz+de5
 QOFw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUa0k4ZOf2G+IuLT+Ayo87mc3FoZU+Az10kuxX6vYkMvynGdNwzvrE2eqE6dP8crgEkiMwF4sDUoQ==@lists.freedesktop.org,
 AJvYcCVliATgOEPwUmgtnvq52l3uqdH+oHuTmocSKT3t02bL9HyKOm3sJr8UlLOJREPEV8V3II8RTPaLBf0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyCrmkEUvxUvW78CZxTGJ3Ln/artGx78qcfoyHqLdeQGhtoN9Sf
 yBpjn/H0VWV17jrmoLT4RjJijBsXFU2Hj9PGCj7jSyhiMg0Xefo2tXNa
X-Gm-Gg: ASbGncsafvm8jveaOwMbygge+94X7YvkDDN6SDAi0XLgfTS2/dt2X5GjF5F5PSmnirX
 GwSyzrKVE1cjr8v8jr803ZKr8FZVfPKuEn0RmUmchZtV+JrL7pp2exoh9oi0CoFZVhedSZUCZ/T
 yYv91autAbnq58B/5teIpkaHCcxg2QJacF7wyoK3a9CMt2I7VaKSP8XKxYBgwhx9HUlENIuOafv
 QMzJLCLxNoJqk86vcuiIDndA5xHAQfAnER+svh6qIYpkA9AtleoBJ773rFXfdKCx1qmqjndQ0D+
 j34qswJrrUx/cZRAWx+M25K8Vwi3kOlQh/s5x+AgFU3Qt5jCDn88E3y7q+GBXm8pnXFN2W5kdVj
 iOJgfT6mDxtvvHKbC551KbPbZ
X-Google-Smtp-Source: AGHT+IEho1Foj4fnk6PgnQ8W8nqUpc5SNVdnaWd11d+U1bW/ogI/EC1H+8IGCCJPQ3wJ6U4piH66Dg==
X-Received: by 2002:a17:90a:c88c:b0:31c:23f2:d2ac with SMTP id
 98e67ed59e1d1-31c4f53f737mr10947368a91.19.1752375225640; 
 Sat, 12 Jul 2025 19:53:45 -0700 (PDT)
Received: from quat-desktop ([2001:569:514a:9100:3f23:7b0f:f6a2:1ebd])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23de4286da3sm76345145ad.34.2025.07.12.19.53.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 12 Jul 2025 19:53:45 -0700 (PDT)
From: Rhys Lloyd <krakow20@gmail.com>
To: dakr@kernel.org,
	acourbot@nvidia.com
Cc: airlied@gmail.com, simona@ffwll.ch, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, Rhys Lloyd <krakow20@gmail.com>
Subject: [PATCH] gpu: nova-core: define named constants for magic numbers
Date: Sat, 12 Jul 2025 19:51:10 -0700
Message-ID: <20250713025108.9364-4-krakow20@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250713025108.9364-2-krakow20@gmail.com>
References: <20250713025108.9364-2-krakow20@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 14 Jul 2025 07:28:12 +0000
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

Introduce an associated constant `MIN_LEN` for each struct that checks
the length of the input data in its constructor against a magic number.

Signed-off-by: Rhys Lloyd <krakow20@gmail.com>
---
Changes in v2:
- Add commit description
- Fix author to match SoB
- Add base commit

---
 drivers/gpu/nova-core/vbios.rs | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/nova-core/vbios.rs b/drivers/gpu/nova-core/vbios.rs
index 5b5d9f38cbb3..d456c494374d 100644
--- a/drivers/gpu/nova-core/vbios.rs
+++ b/drivers/gpu/nova-core/vbios.rs
@@ -364,8 +364,9 @@ struct BitHeader {
 }
 
 impl BitHeader {
+    const MIN_LEN: usize = 12;
     fn new(data: &[u8]) -> Result<Self> {
-        if data.len() < 12 {
+        if data.len() < Self::MIN_LEN {
             return Err(EINVAL);
         }
 
@@ -467,8 +468,9 @@ struct PciRomHeader {
 }
 
 impl PciRomHeader {
+    const MIN_LEN: usize = 26;
     fn new(pdev: &pci::Device, data: &[u8]) -> Result<Self> {
-        if data.len() < 26 {
+        if data.len() < Self::MIN_LEN {
             // Need at least 26 bytes to read pciDataStrucPtr and sizeOfBlock.
             return Err(EINVAL);
         }
@@ -772,10 +774,11 @@ fn into_image(self) -> Result<BiosImage> {
         BiosImage::try_from(self)
     }
 
+    const MIN_LEN: usize = 26;
     /// Creates a new BiosImageBase from raw byte data.
     fn new(pdev: &pci::Device, data: &[u8]) -> Result<Self> {
         // Ensure we have enough data for the ROM header.
-        if data.len() < 26 {
+        if data.len() < Self::MIN_LEN {
             dev_err!(pdev.as_ref(), "Not enough data for ROM header\n");
             return Err(EINVAL);
         }
@@ -900,8 +903,9 @@ struct PmuLookupTableEntry {
 }
 
 impl PmuLookupTableEntry {
+    const MIN_LEN: usize = 6;
     fn new(data: &[u8]) -> Result<Self> {
-        if data.len() < 6 {
+        if data.len() < Self::MIN_LEN {
             return Err(EINVAL);
         }
 
@@ -928,8 +932,9 @@ struct PmuLookupTable {
 }
 
 impl PmuLookupTable {
+    const MIN_LEN: usize = 4;
     fn new(pdev: &pci::Device, data: &[u8]) -> Result<Self> {
-        if data.len() < 4 {
+        if data.len() < Self::MIN_LEN {
             return Err(EINVAL);
         }
 

base-commit: 215a3f91713383a3c0d2da82d223a608a3c17ac1
prerequisite-patch-id: d80f92d314a0693d4c89ffb7810d9ab6990336fa
-- 
2.50.1

