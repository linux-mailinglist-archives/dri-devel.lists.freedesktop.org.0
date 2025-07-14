Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7915B052E2
	for <lists+dri-devel@lfdr.de>; Tue, 15 Jul 2025 09:24:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F9CF10E529;
	Tue, 15 Jul 2025 07:24:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="GV5p2vey";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
 [209.85.214.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCB9010E462;
 Mon, 14 Jul 2025 11:02:49 +0000 (UTC)
Received: by mail-pl1-f180.google.com with SMTP id
 d9443c01a7336-2352400344aso37316535ad.2; 
 Mon, 14 Jul 2025 04:02:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752490969; x=1753095769; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=zY2RufSpt2fWThIm+JO9PtJKALSoq3fBtnelRxK+RwU=;
 b=GV5p2veyqOdnRyIJfSoJWThznMajp8Fuct5Fsu/zshGxPyGlPkVjEvWdMO6+Z7rrc5
 hyO3lE4Ace4AEPt4EL0/w9ERXIOgRJwWHW37do4a51kh8P8b6Ihuh8rkGV02gq2TEhOu
 wuCkcqiUvDcnUHJ6VMgfnM7W1H40QrWJr6C4OkT+LvnlV/8sNKEgbya60TfQzlcHAmrK
 XNHw+MVWlxAJuTZura+YHmYBHPSk3TqYHQsMWdYBt5bj2rLRQiK8+I37bzrMrLO+EW9O
 v1HJs436jAku9rkLLgJeE4ZkAVx3HItAZ8FBTy6thkzbgbVYpoRdVSZbYO5Z4lzW8U4m
 PcDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752490969; x=1753095769;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zY2RufSpt2fWThIm+JO9PtJKALSoq3fBtnelRxK+RwU=;
 b=tsEHs1dviU8A0Bd+m+Pww+NH9ft1EX6mJhAUH2eSTWDgLKvT+ycSJQXXcOfG1knIgy
 sWgsvk02aGL658v/FuXjsm966q468wKtZV9wn4FaRjej5MV/U9TG1zT+gBusqduGRnjk
 z/p9EoXAvaJ5EpIVbY+AQf2AXfl440vRzvZfohHxiPFy22DzGsMklLt4C7qf5ezQRb7w
 RHxKf/ykyIoRPfx4z6TJhushlrqaHyPEsccAGkc0s0jV5MfY99b5fKRMIqntR/U5x8em
 VhLFLdKEheE7IbftK6mEeij/lLViBWx25m6i+ON73nRSnk8Q09j32qylAL1Qm8iQoTTa
 xSGg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUb1y5EZ3qm/6BhtPM4SYX7/u1B16JwFVb1cbJF5M8i/7YD1Vj+NRNsL40X5k8MzHOMBbhjq8yRiE8=@lists.freedesktop.org,
 AJvYcCXXbNMai/0pE7FVc2bAx+qZiCFnKK5O2Bdb2GibwuWB+1Xqzd/87fIDkYD/+oh9CYMCSwZZAygvJQ==@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyz3ny3+el4EfOASyCY/WArSlk7KCkRJK9A0kGLEUs0I+Gsk4rN
 YF4oLn4xnD3Azu1/aizou0v+H6gMUopOcl5l8+dOOYAAFbwWd+q0cL1s
X-Gm-Gg: ASbGncu1TIAUajFhD+y75aQi2NfLXzvJjkMMHjJx3811Nr/Z4I9z7yBVaons8fK2C/h
 PJT6nCB3b1/+ru/DIyMcqG5Wn8rP58hzlEsh6TaMcS4AkwGTtCye2eRJFW8pP6MtPva3XHq7ott
 tYDSrq5XEUf4dA2jFzKXM6TmlNTAQ0DsnXmyW/26Euewb8Pky8H1oZX6Fgm5BXiRvWtB6Px6mCQ
 pEOLfAfNmbLcVGdiO4/HfFcIkglAtAK2y7TNrdGEDTbwGSBH/znnIyPejikRc1p8yvQtSssV+/A
 ecCqOBffsNLS3fMU3aJy3d/Ohg3Ly1NGAy5dKWh338sYOLKiWO/KMl/+L0VSR4Rb4LKQPbX8QEh
 phNJxhPqFnBZoLrW1/+D/02XO
X-Google-Smtp-Source: AGHT+IG6MvbACALZhHxOleL2gcaqp+TEs087W9l8VZmEIwt1vhqvLmUpApCU4JU0NP+hWfxq2ez7lw==
X-Received: by 2002:a17:902:e88c:b0:238:d19:864b with SMTP id
 d9443c01a7336-23df093eba5mr200332105ad.41.1752490968886; 
 Mon, 14 Jul 2025 04:02:48 -0700 (PDT)
Received: from quat-desktop ([2001:569:514a:9100:3f23:7b0f:f6a2:1ebd])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23de42ad2fesm95136035ad.70.2025.07.14.04.02.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jul 2025 04:02:48 -0700 (PDT)
From: Rhys Lloyd <krakow20@gmail.com>
To: acourbot@nvidia.com,
	dakr@kernel.org
Cc: Rhys Lloyd <krakow20@gmail.com>, rust-for-linux@vger.kernel.org,
 airlied@gmail.com, simona@ffwll.ch, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2] gpu: nova-core: vbios: change PmuLookupTableEntry to relax
 alignment
Date: Mon, 14 Jul 2025 04:02:23 -0700
Message-ID: <20250714110229.141221-1-krakow20@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 15 Jul 2025 07:24:49 +0000
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

Instead of the data field containing a u32 and changing the alignment,
change data to [u8; 4] and convert to u32 with a helper function.
Removes another magic number by making the struct the same size as
the data it needs to read, allowing the use of
`size_of::<PmuLookupTableEntry>()`

Signed-off-by: Rhys Lloyd <krakow20@gmail.com>
---
Changes in v2:
- get_data helper function renamed to data

---
 drivers/gpu/nova-core/vbios.rs | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/nova-core/vbios.rs b/drivers/gpu/nova-core/vbios.rs
index 5b5d9f38cbb3..339c66e63c7e 100644
--- a/drivers/gpu/nova-core/vbios.rs
+++ b/drivers/gpu/nova-core/vbios.rs
@@ -896,21 +896,26 @@ fn try_from(base: BiosImageBase) -> Result<Self> {
 struct PmuLookupTableEntry {
     application_id: u8,
     target_id: u8,
-    data: u32,
+    data: [u8; 4],
 }
 
 impl PmuLookupTableEntry {
     fn new(data: &[u8]) -> Result<Self> {
-        if data.len() < 6 {
+        if data.len() < core::mem::size_of::<Self>() {
             return Err(EINVAL);
         }
 
         Ok(PmuLookupTableEntry {
             application_id: data[0],
             target_id: data[1],
-            data: u32::from_le_bytes(data[2..6].try_into().map_err(|_| EINVAL)?),
+            data: [data[2], data[3], data[4], data[5]],
         })
     }
+
+    /// Construct a u32 from `self.data`.
+    fn data(&self) -> u32 {
+        u32::from_le_bytes(self.data)
+    }
 }
 
 /// The [`PmuLookupTableEntry`] structure is used to find the [`PmuLookupTableEntry`] for a given
@@ -1037,7 +1042,7 @@ fn setup_falcon_data(
             .find_entry_by_type(FALCON_UCODE_ENTRY_APPID_FWSEC_PROD)
         {
             Ok(entry) => {
-                let mut ucode_offset = entry.data as usize;
+                let mut ucode_offset = entry.data() as usize;
                 ucode_offset -= pci_at_image.base.data.len();
                 if ucode_offset < first_fwsec.base.data.len() {
                     dev_err!(pdev.as_ref(), "Falcon Ucode offset not in second Fwsec.\n");

base-commit: 215a3f91713383a3c0d2da82d223a608a3c17ac1
prerequisite-patch-id: d80f92d314a0693d4c89ffb7810d9ab6990336fa
-- 
2.50.1

