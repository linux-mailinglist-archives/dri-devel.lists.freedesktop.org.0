Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FD29B052F1
	for <lists+dri-devel@lfdr.de>; Tue, 15 Jul 2025 09:25:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A603210E536;
	Tue, 15 Jul 2025 07:25:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="f9NtvMl+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com
 [209.85.210.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A99C10E452;
 Mon, 14 Jul 2025 10:45:20 +0000 (UTC)
Received: by mail-pf1-f181.google.com with SMTP id
 d2e1a72fcca58-74264d1832eso5239100b3a.0; 
 Mon, 14 Jul 2025 03:45:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752489920; x=1753094720; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=DThnUhw5TFFjYMJ6Q+QpynsJ5dmeEt17gTWIuYiMaTo=;
 b=f9NtvMl+FrHzjHMrbLfB/e904p3JWrl4o7DYINwcy44InYm1FISZ+TYWBnfn+0f0ha
 5NWdDi2jxp3QL2N18VNfJmbkH7sdAsjvXYniDXF1U4AoFV379nqv4aP/oy6wAXYZf/O5
 /m5J0tsRiGFnPlO57dQc5jx/p3MoBLHNiK/+sMeJqnlGqMTAPUkcdnFQZ5H8tsCv2MWa
 OhQ8Ww0vtE8bPpyxoQmNlt+gEPHW5yJJP+gfffS/J4oA9GBLF26JzEaCdrTI/6Nea/Kh
 xbPn00GI50uwl3z2TyD+E3Prh/ymiMvucx5FvUBmVz+LxeRUb0lzv+oBkF4jRWdWG2WK
 ZNMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752489920; x=1753094720;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=DThnUhw5TFFjYMJ6Q+QpynsJ5dmeEt17gTWIuYiMaTo=;
 b=vfnsWk6ZHAZ0AfDUfbiAbIfhLx4BfDZvH7xsxj2qpB3S8+3gROF+/H1lAIIfOz4YL/
 sbKazIJcckvlUfitxIcw72s8IBhfL+htR8evMV8gM0fLedaMc8F0GpW/wAVrd2odKVtn
 qq8f0wEq9AZECCkitmQ92wm1HVPRLCpksF1YAmqSRV3rZSAffYWqr971xILTY05s/JWZ
 49w3ZnMkcR6TDNZzSrikv2wKJ2ybE0QpQhMIrEaMg2H7SS57jIAWx0BtNEG5XWWJ4w+7
 E/9u6RHwakjy23lq02lIvarY4zke5wFbn20zc0STQ0NJ5lnBBZ88s55RbPi60JTz7Vn3
 54fA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWSWpoFIqtwOF6FqzO6Ku+zx4rwkblbbC6WnlUiRSVX/mL96R/bnPxecXZXLAXrZAYW3RwkfWWg7vw=@lists.freedesktop.org,
 AJvYcCWt89AEcgTlMSbvJ3VgEDf7iRwr/GFd8/wUZeOM84wl5u6bjlUZEeN3kNs3CnqqprVmodR6qI28sA==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxjpAzrmQi5x6wPOGx6L0nZxvj5a1HQWWUxNMJS42udWIremqSd
 yUnCTjC+xL/q6BLdZ0TmNQB1PesAZBBkLMlv7DLqfTyLEQx4e81YQh5MWOCkqcTxAjU=
X-Gm-Gg: ASbGncsZ5SjaKKsr9311cULBJX9UnXKAXs9w6P4PZvL/uiRO+gqAUm+uOVIAhFugNHE
 9sWg/VTk3Zqi+X+w1wUhmhYtsNuS4Y2YRaFlOW0MO3jfbcvmmRNAMFy0DuyetFNIpGGV260g5yI
 cnp9RQgJzJBGsjplhfykzpAqxNaHpScKh8O6dqi/FX7qRC7lqZbK3p/7LQomZVY3LGqjTxuwMN+
 94tYEublqaBKcCapNQqJbm8VNraLppCum1Zy3VT3Ld0Mfn9mrCNlhnA3lr+wApsLF7Ug6ymUpeo
 BRRk/nFoSWMeU96AAWSQwrRc8VHxkEQs7TO0Bibw4KFhoRUFw5ve6LTJ/NfBhSbY5qxA/z9Qk2M
 89jKsAp5g75mUjKoNOb14W1JX
X-Google-Smtp-Source: AGHT+IHh8nvQAWLf0IaWZQL6rQlZ7/oYqf00LH67GRlU2rIWMZm1c6jUnva8RdcSbzLdp26M/41yaA==
X-Received: by 2002:a05:6a21:3318:b0:1fa:9819:c0a5 with SMTP id
 adf61e73a8af0-231363657d3mr19458861637.11.1752489919804; 
 Mon, 14 Jul 2025 03:45:19 -0700 (PDT)
Received: from quat-desktop ([2001:569:514a:9100:3f23:7b0f:f6a2:1ebd])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-74eb9e058fesm10320909b3a.40.2025.07.14.03.45.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jul 2025 03:45:19 -0700 (PDT)
From: Rhys Lloyd <krakow20@gmail.com>
To: acourbot@nvidia.com,
	dakr@kernel.org
Cc: Rhys Lloyd <krakow20@gmail.com>, rust-for-linux@vger.kernel.org,
 airlied@gmail.com, simona@ffwll.ch, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH] gpu: nova-core: vbios: change PmuLookupTableEntry to relax
 alignment
Date: Mon, 14 Jul 2025 03:43:12 -0700
Message-ID: <20250714104322.100511-1-krakow20@gmail.com>
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
 drivers/gpu/nova-core/vbios.rs | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/nova-core/vbios.rs b/drivers/gpu/nova-core/vbios.rs
index 5b5d9f38cbb3..40244485283c 100644
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
+    fn get_data(&self) -> u32 {
+        u32::from_le_bytes(self.data)
+    }
 }
 
 /// The [`PmuLookupTableEntry`] structure is used to find the [`PmuLookupTableEntry`] for a given
@@ -1037,7 +1042,7 @@ fn setup_falcon_data(
             .find_entry_by_type(FALCON_UCODE_ENTRY_APPID_FWSEC_PROD)
         {
             Ok(entry) => {
-                let mut ucode_offset = entry.data as usize;
+                let mut ucode_offset = entry.get_data() as usize;
                 ucode_offset -= pci_at_image.base.data.len();
                 if ucode_offset < first_fwsec.base.data.len() {
                     dev_err!(pdev.as_ref(), "Falcon Ucode offset not in second Fwsec.\n");

base-commit: 215a3f91713383a3c0d2da82d223a608a3c17ac1
prerequisite-patch-id: d80f92d314a0693d4c89ffb7810d9ab6990336fa
-- 
2.50.1

