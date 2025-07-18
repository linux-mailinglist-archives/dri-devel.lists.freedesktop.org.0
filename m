Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2F35B0A3DB
	for <lists+dri-devel@lfdr.de>; Fri, 18 Jul 2025 14:09:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8ABF910E99C;
	Fri, 18 Jul 2025 12:09:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="FYzMZ3MR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com
 [209.85.214.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F1A510E91C;
 Fri, 18 Jul 2025 07:37:36 +0000 (UTC)
Received: by mail-pl1-f178.google.com with SMTP id
 d9443c01a7336-2350fc2591dso18907335ad.1; 
 Fri, 18 Jul 2025 00:37:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752824255; x=1753429055; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VlvIN4gw3K/irnbr3ye+l1lLYYjCQPCt7Dolbh9+AFM=;
 b=FYzMZ3MRLBdQZ2WARfHojJ7vXX8WfK+D0B5HdEjm02u82zsNLZMhW8+/r69be2Mkqm
 Zu9wwrkJY256Vj608TreiD+aaMoG/zoOAy3ll/Q/utedXG7cFsREzUmbYDHzKF3xe9x6
 VEGjO4VEEBK0lhpcXZ0H979CcCJj1Zt2uIe7bORODoH0scECPt3gL6iY1Xh26g+PEKVI
 OOvuU/hnYxTkgsLeMEZZHidBPPUht2jf0bJQ7nrB+KRYovqviCcEuKYVoredc6EzAfqP
 TrcmktUVlElhBAh4Jim4+ZyPajekfO9j3gd9Gkd88lQmuiac3GwE8DY9KFjj/8zuttqg
 HldA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752824255; x=1753429055;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VlvIN4gw3K/irnbr3ye+l1lLYYjCQPCt7Dolbh9+AFM=;
 b=LmfqdDigY7bxMvlN6qti8dPCF1hjDfiSN0X2qQBi7dcka6LU5Fp63CROaFhs3z0M0C
 yBlZVVx9Gvszlvu2x5qWxdlaLVUdX9iuxJklN6h6J3KdY8VXxyUWk4e+G39NJiA1aVXO
 Sd4NF+GYswsr65ABsuOL13d4Y3Ppqn0VnJ9LsWRTpu8AZ4dgXC0EmCT+5q2qeVth97zC
 yZM/SEqOKS4TfaznXVP/FTx3FFXPFV7TetfSSICL9/wxUa75rgnGicVUym44EM6q1UcB
 1apgl24wayhyUH3HtM6pmSwR5asftOx7ATCTOXTFUGFzynunBWwy+CV7AbvXdn4ihZd/
 NGFg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXYZVrkOxIngP/ofEzvrC05goDrObC9kaHClMG0m5Mqp3magNt1Ak6VXXnAxNXUiXH8hnADGMdbQg==@lists.freedesktop.org,
 AJvYcCXiSYNQ8idTWIeyhMA+77Sy9t9eMaXnHSSNrnZRHzweYy5vC8zpRgVb+X6R4la7EAuEyW0s9oFmnIE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyTVsttO/u/10ZPI2RbhpyHlRkUg2CpB3W7StRI6Eg7KSA7qHsP
 NfALlPx9PTJHM2oKEHXxnx5+hdohYxPadG/yP3GFA6UNF3MOXequov8L
X-Gm-Gg: ASbGnct+aXF7xq5RsdH83to5mvTrh9NhJZPO0f+OiI/KwCssVavy6JBtqU2U126DAy7
 w5Vv8VUMBlAQ1P+NA5MbH1jXwb4VZ2g7oyEvEjHDFe+JY770uTzqxMbRUEf+lPebEDT2GSJxLOE
 GY1UazaTnSyNbgkfnY7tj7MsNTojbvISvXwa4r+e3f2/9Zf9xIxsa6J913RQjXSNE4lyrhnChpX
 PWhyGnuGBc0sDK+bZyc8h1oAHpkcVhwZpR7D7iExr60KNjePlEws2TlpDQuB0efyQJUDAwxO5gm
 dlN3ckJXjTqs6KT8dRIt/XCPQoBsPn3JzD+fPR4zrEdsl9uiac4fPri+oYw+3LHASDPvsUsaXLF
 nkeHRyy2l23hV4EwfCGkDhpuI
X-Google-Smtp-Source: AGHT+IE4KnqF7Fpi+Oaw+hIzsHnb/lyisTQ8PFgnzh/ZzYpbtRnlDetOG91r/+F5ZBfJXXfvgIqSNQ==
X-Received: by 2002:a17:902:da87:b0:23e:35f3:7ffa with SMTP id
 d9443c01a7336-23e35f380c5mr71364715ad.14.1752824255391; 
 Fri, 18 Jul 2025 00:37:35 -0700 (PDT)
Received: from quat-desktop ([2001:569:514a:9100:3f23:7b0f:f6a2:1ebd])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23e3b6b4e84sm7671725ad.104.2025.07.18.00.37.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Jul 2025 00:37:34 -0700 (PDT)
From: Rhys Lloyd <krakow20@gmail.com>
To: acourbot@nvidia.com,
	dakr@kernel.org
Cc: Rhys Lloyd <krakow20@gmail.com>, rust-for-linux@vger.kernel.org,
 airlied@gmail.com, simona@ffwll.ch, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2] gpu: nova-core: vbios: use size_of instead of magic number
Date: Fri, 18 Jul 2025 00:36:24 -0700
Message-ID: <20250718073633.194032-2-krakow20@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250718073633.194032-1-krakow20@gmail.com>
References: <20250718073633.194032-1-krakow20@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 18 Jul 2025 12:09:10 +0000
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

12 is identical to the value of `size_of::<BitHeader>()`,
so use the latter instead.

Signed-off-by: Rhys Lloyd <krakow20@gmail.com>
---
Changes in v2:
- Added `#[repr(C)]` to `BitHeader`

---
 drivers/gpu/nova-core/vbios.rs | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/nova-core/vbios.rs b/drivers/gpu/nova-core/vbios.rs
index 5b5d9f38cbb3..912698308102 100644
--- a/drivers/gpu/nova-core/vbios.rs
+++ b/drivers/gpu/nova-core/vbios.rs
@@ -346,6 +346,7 @@ fn image_size_bytes(&self) -> usize {
 /// [`FwSecBiosImage`].
 #[derive(Debug, Clone, Copy)]
 #[expect(dead_code)]
+#[repr(C)]
 struct BitHeader {
     /// 0h: BIT Header Identifier (BMP=0x7FFF/BIT=0xB8FF)
     id: u16,
@@ -365,7 +366,7 @@ struct BitHeader {

 impl BitHeader {
     fn new(data: &[u8]) -> Result<Self> {
-        if data.len() < 12 {
+        if data.len() < core::mem::size_of::<Self>() {
             return Err(EINVAL);
         }


base-commit: 14ae91a81ec8fa0bc23170d4aa16dd2a20d54105
--
2.50.1
