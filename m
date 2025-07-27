Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32F08B12EE1
	for <lists+dri-devel@lfdr.de>; Sun, 27 Jul 2025 11:51:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88A9810E27F;
	Sun, 27 Jul 2025 09:51:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="miiOkEJp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com
 [209.85.216.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7186B10E398;
 Sun, 27 Jul 2025 09:51:25 +0000 (UTC)
Received: by mail-pj1-f48.google.com with SMTP id
 98e67ed59e1d1-3190fbe8536so3152759a91.3; 
 Sun, 27 Jul 2025 02:51:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1753609885; x=1754214685; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Q75mBtp8jcS9+B1UD9cGfUNuIFaVl8oU2VgPg7QjKsg=;
 b=miiOkEJpjhNDnnwPfGh9PM8m4mNbcHTZbhpzd/f5Ux+CRo/Ol5Bj/4zc3E0eay52b3
 UUalCOb7kIWJO+tmRNaGhLiqSkGMY0Gy33MhCX7kdatVF6fo9uoT+tCvGKJpmDCdTeKB
 6r2ZXgshz07nH83BsUNsqgKVMrZ+eUaEr8+OPKleJSDDQXGIosmxPdPL2nGqtYDNEfMw
 i4aQzj9A9BuB8URcRw9QRYI4ddTkGHGdfnHQ1frNcb2Hf/q8zxZhK2ROPopf6wNPI2/J
 i8+A/MwVc+BQpCACXZJKSa8Cst25W3OzI3++nadqy1RAK6ZaJDELSXhKI90lerF5BxSu
 nMRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753609885; x=1754214685;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Q75mBtp8jcS9+B1UD9cGfUNuIFaVl8oU2VgPg7QjKsg=;
 b=OV5jneSBzbihJcobbXnaHH58BjhxwaEitPKDR5NCk5aKs1Hz4vhLLAetjyNBo01bFW
 xb2r6kQsGDw0GCb3/zWKVDcD52DFqGQza4FxlyukHJHhh43uHRSH0OFnz4CckLY6N24T
 k07nVHN5M62bLWo32IyzwK6XyisVHd89WI/4hp2Ccm+YW738k4S53NFkcVwiz1BOsKAb
 2eWvGDu7fGWmTq2GPyn4u+c+HEQDnHDPNY5jlBRDLTjZL7sd3Pp/lxec3iTTTewMMwdf
 3n3n3FCFVZYsNw+PjB6FAz74i9ciuSfyXa0TMzq0nudOUX65gUFF0hUNprjpn2TbAYGZ
 5fqw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUhm/d7IpLL40/4/MCSB5ZwkwMu4eU7AGltjsDDh7vs8CeHV2oxPXNrzZX8hMg7MjtDD+LLoOpxiAk=@lists.freedesktop.org,
 AJvYcCWsD3QB3MRST0Tt/R+womo7/YN9YLt5diGAMqptrhhYku41bACcKoq75E1fGQmB8GwAvM5dUMpkiw==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwP0uG0l0bWNEzSfFxbbUNltKnRMn9995INqR+TD8e3QAgF5T5d
 m/ORnanw5+dVbQ88oUhAx7e5x6agfNVc6kjHYhZ+AEERCEp+Z3+QNJYh
X-Gm-Gg: ASbGncs3k87P5NWo+sAy5m5b7aC9pIV0J4BHkFhKHYc7iFGaOviT+QcEtoOc2fwrPTL
 rwFS+Y7E8jMejzGiwcuS6lWlEz3JP0ar6KzG5VyUJCA25RKSuyTPtMky1hk7u1EbaondJbGDOvL
 MFTG4RQiX4tnDIVmcmxBylXJZSRAQAOaLpdZZW++ht7rCksYvD/qjJv/CAEDzcDbaFt41a7xB9Z
 SAbPtp+5NDFntcnE4O2nwiZH1LebYMJ89lAsJNZmnG78SLFZ2KkeYy86xeNmK2lsOzeLcfYv9ma
 yA+Jjd2ijEFDClRAd6voXIkYmYQ1Bnlnk+flQBo3oitQZl8hQmBJCkQfGGqJVtqpd/uN1ZQqzEN
 93KjZyeUDzng0S1Xct3rBqZzf
X-Google-Smtp-Source: AGHT+IFphsUeaQG/0HS39YHZVYaXChSqW9BbhaZJq4ICXtoyWmtTBglaeojibI0sGzaXO/VryFY/5A==
X-Received: by 2002:a17:90b:58b0:b0:31e:e3e1:3686 with SMTP id
 98e67ed59e1d1-31ee3e137eamr293498a91.19.1753609884768; 
 Sun, 27 Jul 2025 02:51:24 -0700 (PDT)
Received: from quat-desktop ([2001:569:514a:9100:3f23:7b0f:f6a2:1ebd])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-31ea8c1770dsm2012652a91.36.2025.07.27.02.51.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Jul 2025 02:51:24 -0700 (PDT)
From: Rhys Lloyd <krakow20@gmail.com>
To: acourbot@nvidia.com,
	dakr@kernel.org
Cc: Rhys Lloyd <krakow20@gmail.com>, rust-for-linux@vger.kernel.org,
 airlied@gmail.com, simona@ffwll.ch, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] gpu: nova-core: vbios: use offset_of in
 PmuLookupTableHeader::new
Date: Sun, 27 Jul 2025 02:49:00 -0700
Message-ID: <20250727094903.20483-2-krakow20@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250727094903.20483-1-krakow20@gmail.com>
References: <20250727094903.20483-1-krakow20@gmail.com>
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

Use the offset_of macro for each struct field, annotate the
`PmuLookupTableHeader` struct with `#[repr(C)]` attribute,
and add a TODO message to use FromBytes when available.

Signed-off-by: Rhys Lloyd <krakow20@gmail.com>
---
 drivers/gpu/nova-core/vbios.rs | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/nova-core/vbios.rs b/drivers/gpu/nova-core/vbios.rs
index a77d7a4c8595..cedfcf3476bb 100644
--- a/drivers/gpu/nova-core/vbios.rs
+++ b/drivers/gpu/nova-core/vbios.rs
@@ -893,6 +893,7 @@ fn try_from(base: BiosImageBase) -> Result<Self> {
 ///
 /// See the [`PmuLookupTable`] description for more information.
 #[expect(dead_code)]
+#[repr(C)]
 struct PmuLookupTableHeader {
     version: u8,
     header_len: u8,
@@ -901,16 +902,17 @@ struct PmuLookupTableHeader {
 }
 
 impl PmuLookupTableHeader {
+    // TODO[TRSM]: use FromBytes::from_bytes when it becomes available.
     fn new(data: &[u8]) -> Result<Self> {
         if data.len() < core::mem::size_of::<Self>() {
             return Err(EINVAL);
         }
 
         Ok(PmuLookupTableHeader {
-            version: data[0],
-            header_len: data[1],
-            entry_len: data[2],
-            entry_count: data[3],
+            version: data[const { core::mem::offset_of!(PmuLookupTableHeader, version) }],
+            header_len: data[const { core::mem::offset_of!(PmuLookupTableHeader, header_len) }],
+            entry_len: data[const { core::mem::offset_of!(PmuLookupTableHeader, entry_len) }],
+            entry_count: data[const { core::mem::offset_of!(PmuLookupTableHeader, entry_count) }],
         })
     }
 }
-- 
2.50.1

