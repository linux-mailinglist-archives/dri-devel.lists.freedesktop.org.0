Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 27A21B12EDF
	for <lists+dri-devel@lfdr.de>; Sun, 27 Jul 2025 11:51:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F2A210E150;
	Sun, 27 Jul 2025 09:51:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="MOqWaG8+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com
 [209.85.216.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9788F10E00B;
 Sun, 27 Jul 2025 09:51:14 +0000 (UTC)
Received: by mail-pj1-f54.google.com with SMTP id
 98e67ed59e1d1-313154270bbso3637760a91.2; 
 Sun, 27 Jul 2025 02:51:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1753609874; x=1754214674; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=t1kXiH/iOIPgD/M4/LDkpVx0cWkoY7aI0S+hOevU85Y=;
 b=MOqWaG8+AuIM/OvlwvfiH9tZHtCFL4ayXi+jff3ZiHhKLos6SbYfajK5v2KIqIAxMI
 EXVXjPJG2TCZlS80bxNCtO9JzISfQsVz+uKaJwQzTmhv8K9+QyHmmirEU1ipPbP//rvZ
 5j4YInS5+OzS0Wux1IuHIofhyv6eAnsQIMlGWiYtLHqK7jH0hXmv6k4DjTTFf/MUL2L8
 W/P9ZdTzFErMyAX29Ujdw7Dx3mcLB8NCITzdjFCGJvr9WaMeH1YXO2MImkWEj/7kqiug
 TNuUneb4czmPsRP/2hEUaYDzSzbmhs/cM67V+Rya6KnK7Pt/Mln8to0U21OakJZJVwIu
 TqJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753609874; x=1754214674;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=t1kXiH/iOIPgD/M4/LDkpVx0cWkoY7aI0S+hOevU85Y=;
 b=Di2qipVWG4rcB2qDgovnzBKR8R9ExsfHfafVEmA5R1xYWxPWFUAwRSmxFsQkXJ6dS2
 5kpkyLEpSUGNnr0QqVh0aFAVmjaYerCWjxco83JdkeWAdKj7u7Juq+wsjkjoQzjOEFPK
 eBLhqRfeAORcPTgVewvhEYog0FRvbssawHD2TpeIe68hbx7U8bWRZCv8xPHFmWChzNlN
 GC5UfyFmOsldHy38tTSx28QPRGoyNnEsyUmP7H7JROt4Y1pDdHHTd0Kwuu0PWs40/uqc
 PqjBEIFBGclovx14vvedw0g4e8Z0oYAlwFKwBC8uKBn1RhjDsaMvL3CDcSip78fB1+le
 rv8g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXZl0uKhigOzO011APdeSKKo/x3ebu9WjDoP+5SWoMBN4NfHCxavov0hS3A7jg4lOsnxHjF7NplsA==@lists.freedesktop.org,
 AJvYcCXgIdwqn6ENCn5AjayM9tppGx3CT+iT0X9ELPlpmE4qNNQOd4IWj7T4KV92/GMbQGgs9C4EKrcS6eg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyC8MyHQ5p99iSremFk7TOdRJB1B+d59B/5Sk68G3sHJdJ5bAYW
 RpBP1uY2t82V6dKBo1OgnRQl6X4EKLskMZfKUlYhol+FMibw4VcZObQ6
X-Gm-Gg: ASbGncss6N27ZimctF/utjNznCmIfdQuUssqolcYXQxlNbb2rbyc9VPqxdWeV1a82FB
 kZL99xh42C0aFINPLNMeT4ZcLTPEOWJOoTtpPKxiNQ2u27cdkhrTHd9bD57+weTk4IVL/f7tsXB
 rGtAmcD+yJMv8oAIQjQXY+5uyqyRgmab5hc6+I45bdJzBaEJVfgon3z/UngKYjmJ6R1hbharVcr
 AmzpXlw2alRJIgYmW+yuqzvdYl6dqlHaeDCvRfV7ZO+PXf6IDpIpKu0+IHtrXtbKvooXeujABw6
 w+utByd33EjNRkEMrDXIrkaBBnLj5VIliDD99YClt7hEuj/+wIU8PrKALyZCMvCyJjpES66li7N
 4APwfVM6+VwUxIVGxzsNnBBxn
X-Google-Smtp-Source: AGHT+IHAGa1LiA4U0ZjULerVSzNUQ9qnTdRAU1E1dly2dZnZK61QY6vXTJDFJnRt1D8ULLgYMQEINA==
X-Received: by 2002:a17:90b:224d:b0:31c:c085:fde6 with SMTP id
 98e67ed59e1d1-31e77636196mr14021956a91.0.1753609873917; 
 Sun, 27 Jul 2025 02:51:13 -0700 (PDT)
Received: from quat-desktop ([2001:569:514a:9100:3f23:7b0f:f6a2:1ebd])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-31ea8c1770dsm2012652a91.36.2025.07.27.02.51.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Jul 2025 02:51:13 -0700 (PDT)
From: Rhys Lloyd <krakow20@gmail.com>
To: acourbot@nvidia.com,
	dakr@kernel.org
Cc: Rhys Lloyd <krakow20@gmail.com>, rust-for-linux@vger.kernel.org,
 airlied@gmail.com, simona@ffwll.ch, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] gpu: nova-core: vbios: split out PmuLookupTableHeader
 from PmuLookupTable
Date: Sun, 27 Jul 2025 02:48:59 -0700
Message-ID: <20250727094903.20483-1-krakow20@gmail.com>
X-Mailer: git-send-email 2.50.1
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

Separating the header allows the use of `size_of::<PmuLookupTableHeader>()`
instead of the magic number 4.

Signed-off-by: Rhys Lloyd <krakow20@gmail.com>
---
 drivers/gpu/nova-core/vbios.rs | 56 +++++++++++++++++++++-------------
 1 file changed, 35 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/nova-core/vbios.rs b/drivers/gpu/nova-core/vbios.rs
index 5b5d9f38cbb3..a77d7a4c8595 100644
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

base-commit: 14ae91a81ec8fa0bc23170d4aa16dd2a20d54105
-- 
2.50.1

