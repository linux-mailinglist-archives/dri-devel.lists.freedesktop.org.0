Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE845B052E7
	for <lists+dri-devel@lfdr.de>; Tue, 15 Jul 2025 09:25:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2C6F10E531;
	Tue, 15 Jul 2025 07:24:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Wj93LomZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com
 [209.85.210.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1214F10E452;
 Mon, 14 Jul 2025 10:45:36 +0000 (UTC)
Received: by mail-pf1-f174.google.com with SMTP id
 d2e1a72fcca58-7481600130eso4696846b3a.3; 
 Mon, 14 Jul 2025 03:45:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752489935; x=1753094735; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ew3z3tT1Iqc1DaqYrhCVfFfwHfKONsa2dCPq/VLPSGE=;
 b=Wj93LomZTonaWohRf8rTzbNYCWnuC/heqXhSTYxIUK5qwv5iNThkAxvXjsaniH3m+F
 vmu12YUuArMJ3UxFhcI76jIswCqqFKjvTuaw0PsVL+bYzAIHb/cpgfSXOaqLlz5OR2yx
 6pZizoiVIG2KHSwAf7DA4pEMfwyWVpf0m8QTNTHieDTWnCxkJHGvp1Ig0jKzfOegLOxS
 GRdOUNKgZwxbYpOGRqujqngmwtVPSNSSxleNUdNwhuzcIhqAiK9id5J0GLIA4NnXO74i
 1iiAAZtp68rqYFZa89/GLGdZZZgiO0WPLX3iJew0aE2MyBVTdKf7llbSGb1fIg7FpYPP
 E1EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752489935; x=1753094735;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ew3z3tT1Iqc1DaqYrhCVfFfwHfKONsa2dCPq/VLPSGE=;
 b=vvbQYmHPDTzwB1l0IoNhofDKYwcUFb01tAHVrZhPi0HRm8FvUJS1NmCjrVIFwH2wSf
 4pYewbepeNB+UNRMVf5if29OfylKQ3S4BLjwA4hT+KXp5Uwc2TAmGHy0rJWqbzuE5UOL
 2k1urBDQnpG//E+r8HXPqwi46wzC5uwpwFLoM9vX8pLEGy3FL+ybOxdUBBPKpHx3pzp/
 oJVLXqofRfoY2lPjA/d3BMvNmUm77dLW5CubXtfMcvAZHQr2DWdShSAeAFmtF4GdYRsS
 qBtTmGTFGWcjZXgDbYZt0waT4xe0L+8xJxjuD+TsMfc2crtTaOtomvfQ3Vjzu1lAtdXo
 l4Vg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWh9NhlmI8NKO4lIrICs8pylc1oLWYXZqW6vqTy+PX5w7o67FbYZM2HeZLm515Nh/+A993NxmZS5Q==@lists.freedesktop.org,
 AJvYcCWq32ZdNqUnf4TcNjr7kq0wBBlLPxNwFi6Zacn/oSmg7R0cfYPtAB2mfVKxXpVolIkeB2awNDGS41E=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzrSQIjGC43CiafYSJX8atgVw2hz/1eGpfKPEgv8GS70rpdHoF5
 AwzFyeyuA7wu6JmDMMYIpUSIOanxSEvNe0N9GbAL+wUpU6T1Az34NrMO
X-Gm-Gg: ASbGnctADNKB2FsJxKexHtLcTft9vvJrhfqYL3yrFLtauqKE41MNbupldOfB42YHwXb
 dAx1PMUaJuqN+7ILqtYqypyYvQgT8AY2QbqehoF57BT4aWS/RyezFievp7OuL8t3q4AAe+kPk7q
 oHPSE5vC/cbPbqCLl0185v39mq3Z2qf+THVl7pq0vUhl1IKPQBl5E2YsV/yg0Qb6/KBd1rpG5fH
 cDqUqO5j6bAaRsg1QRpY83woOHXlTVuy1GMvVXjqN5KPEkqJF+KaegKRIYWdUefgjLlKDbzWUTx
 LvxKNIkKrxidCSO9rDNVkNq5jk81cd1n7453UEUcEGyDvO65tolDyGA/fXdGsM8bPkMgRGMP5Hx
 va0jgZNrkUQDRAFszBNMOMDNf
X-Google-Smtp-Source: AGHT+IHPYYr30tbc+ztqYQvY2Rm0RrK+nh/L+wMF4ZiTUbfKfx+mQjBJD6fZBwNC0fwr8N+K5R84jQ==
X-Received: by 2002:a05:6a20:2d23:b0:215:d611:5d9b with SMTP id
 adf61e73a8af0-2311d95ce85mr18201600637.12.1752489935443; 
 Mon, 14 Jul 2025 03:45:35 -0700 (PDT)
Received: from quat-desktop ([2001:569:514a:9100:3f23:7b0f:f6a2:1ebd])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-74eb9e058fesm10320909b3a.40.2025.07.14.03.45.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jul 2025 03:45:35 -0700 (PDT)
From: Rhys Lloyd <krakow20@gmail.com>
To: acourbot@nvidia.com,
	dakr@kernel.org
Cc: Rhys Lloyd <krakow20@gmail.com>, rust-for-linux@vger.kernel.org,
 airlied@gmail.com, simona@ffwll.ch, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH] gpu: nova-core: vbios: split out PmuLookupTableHeader from
 PmuLookupTable
Date: Mon, 14 Jul 2025 03:43:13 -0700
Message-ID: <20250714104322.100511-2-krakow20@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250714104322.100511-1-krakow20@gmail.com>
References: <20250714104322.100511-1-krakow20@gmail.com>
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

Separating the header allows the use of `size_of::<PmuLookupTableHeader>()`
instead of the magic number 4.

Signed-off-by: Rhys Lloyd <krakow20@gmail.com>
---
 drivers/gpu/nova-core/vbios.rs | 56 +++++++++++++++++++++-------------
 1 file changed, 35 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/nova-core/vbios.rs b/drivers/gpu/nova-core/vbios.rs
index 663fc50e8b66..20011c5c9bbc 100644
--- a/drivers/gpu/nova-core/vbios.rs
+++ b/drivers/gpu/nova-core/vbios.rs
@@ -889,6 +889,32 @@ fn try_from(base: BiosImageBase) -> Result<Self> {
     }
 }
 
+/// The [`PmuLookupTableHeader`] structure is header information for [`PmuLookupTable`].
+///
+/// See the [`PmuLookupTable`] description for more information.
+#[expect(dead_code)]
+struct PmuLookupTableHeader {
+    version: u8,
+    header_len: u8,
+    entry_len: u8,
+    entry_count: u8,
+}
+
+impl PmuLookupTableHeader {
+    fn new(data: &[u8]) -> Result<Self> {
+        if data.len() < core::mem::size_of::<Self>() {
+            return Err(EINVAL);
+        }
+
+        Ok(PmuLookupTableHeader {
+            version: data[0],
+            header_len: data[1],
+            entry_len: data[2],
+            entry_count: data[3],
+        })
+    }
+}
+
 /// The [`PmuLookupTableEntry`] structure is a single entry in the [`PmuLookupTable`].
 ///
 /// See the [`PmuLookupTable`] description for more information.
@@ -918,24 +944,18 @@ fn new(data: &[u8]) -> Result<Self> {
 ///
 /// The table of entries is pointed to by the falcon data pointer in the BIT table, and is used to
 /// locate the Falcon Ucode.
-#[expect(dead_code)]
 struct PmuLookupTable {
-    version: u8,
-    header_len: u8,
-    entry_len: u8,
-    entry_count: u8,
+    header: PmuLookupTableHeader,
     table_data: KVec<u8>,
 }
 
 impl PmuLookupTable {
     fn new(pdev: &pci::Device, data: &[u8]) -> Result<Self> {
-        if data.len() < 4 {
-            return Err(EINVAL);
-        }
+        let header = PmuLookupTableHeader::new(data)?;
 
-        let header_len = data[1] as usize;
-        let entry_len = data[2] as usize;
-        let entry_count = data[3] as usize;
+        let header_len = header.header_len as usize;
+        let entry_len = header.entry_len as usize;
+        let entry_count = header.entry_count as usize;
 
         let required_bytes = header_len + (entry_count * entry_len);
 
@@ -963,27 +983,21 @@ fn new(pdev: &pci::Device, data: &[u8]) -> Result<Self> {
             );
         }
 
-        Ok(PmuLookupTable {
-            version: data[0],
-            header_len: header_len as u8,
-            entry_len: entry_len as u8,
-            entry_count: entry_count as u8,
-            table_data,
-        })
+        Ok(PmuLookupTable { header, table_data })
     }
 
     fn lookup_index(&self, idx: u8) -> Result<PmuLookupTableEntry> {
-        if idx >= self.entry_count {
+        if idx >= self.header.entry_count {
             return Err(EINVAL);
         }
 
-        let index = (idx as usize) * self.entry_len as usize;
+        let index = (idx as usize) * self.header.entry_len as usize;
         PmuLookupTableEntry::new(&self.table_data[index..])
     }
 
     // find entry by type value
     fn find_entry_by_type(&self, entry_type: u8) -> Result<PmuLookupTableEntry> {
-        for i in 0..self.entry_count {
+        for i in 0..self.header.entry_count {
             let entry = self.lookup_index(i)?;
             if entry.application_id == entry_type {
                 return Ok(entry);

base-commit: 215a3f91713383a3c0d2da82d223a608a3c17ac1
-- 
2.50.1

