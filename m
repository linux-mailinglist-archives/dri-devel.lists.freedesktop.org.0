Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE478C32D3D
	for <lists+dri-devel@lfdr.de>; Tue, 04 Nov 2025 20:38:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2DFE10E32B;
	Tue,  4 Nov 2025 19:38:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="O0U34g9k";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50FEF10E32B
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Nov 2025 19:38:04 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-4710665e7deso28027755e9.1
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Nov 2025 11:38:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1762285083; x=1762889883; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0Xypec85439AsoYQYRLT5jRDZoV8gj7wZ5fnhiAzlQA=;
 b=O0U34g9kjzfbX7orcTctDELNw1P6JVo7NioFiBrqXNp6OPIdGal/EaoyY/f0dWRnI5
 dYFe8owGiac/r9LucdOgY64X9GUcnsEWzug10qIQXAHmqUrc5d/S91vKAfjelomAftp0
 ptcQzYeamjhEGJXHAVhe8zoQLlrEZQnTZ+LeovRiFHrDFBbyAuX2yzhGEAPgP6GFPivD
 UayaLw6KQ3OXx2cxhM98hjiTLfsLOmrF+O+7yVU7ir7tf+MRZJp0V3dC24PzRLqjulA6
 S6cA5YMEo1pSE2Iw+a+xiFVZ5ntPAZd1n5NA7vojT4XUF4aay3iTHkhm+t10Arfy4zmo
 0K7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762285083; x=1762889883;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0Xypec85439AsoYQYRLT5jRDZoV8gj7wZ5fnhiAzlQA=;
 b=Aw1TrcDQIwXRluGa+GjxAMq6TuWBUAQpDXEhKudHLIpmg2kgOPo7rcnqJIzDsoHrb/
 mGxboYY22gqR2Ep1dP8M2hVVn5QrvJvhmYAlYI/Ndujhhn6B77BuP1LXpT7OMWMQG0Xb
 1Jm03VAnpPRgeDEJxW22ASK+jmHaNcp1QO/iw+dGgWCjXiWfNgIVT1TyKmbvfNeRSQc/
 cAR28tNzJWduVfQVcZXssnQ0NMiNvDqIdOcuiJ39q9PpoO7QNuwi9HyGdGL4kziIFETO
 1ialFCCJ/HKD6zLqZgeHbunU6Xs7TJHt79m4AtxiSMGz7MMRSR9PLEbQWtBrpkWoO4ae
 BSog==
X-Forwarded-Encrypted: i=1;
 AJvYcCUKD02rDlRFEcJz4xdQIw0cMaXl7MuoH6SKALDPDmYgo8+H8aGVZ7XQZxWv7bgWRwq7WfK9mU785CU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxT+uKWDoJoErC4X7dhBlUiW9RtJ351dHy6HVHqtjH6pBj6+QfA
 nqeNg1YQLTwtqWzIuQJDnp8IplyHuWuDNxnr1us5qeNKG3pLLeN+hrCAQvS5VtdPftxWiw==
X-Gm-Gg: ASbGncvokwy29iP4iOrzZQvnKUtqDGUEh/7dkS6n6PJ/U05zBMdFY9t1k+gOgSsIYGG
 6jLq/N8HITOcoBC56emrnMF3/8EWBA2qQTkrvxmRmtejMx5q9jRzeAUnWsHG5KXP7RmRPI6Wu8B
 zQlvm/fbLRJi6UKfhYnJme330HfG/jcwOdL9+LUla7QHgnQLeCou7e7Hp82PPBJ1cHUX99EtmXv
 l6CQjk+iHhCqq4cv6q57RerC0l2VXEUEXl8ndNalV1gfYyCAzytVwJXjO7M2IskBW8j1XyfaNPt
 wLUhVyx31y/nqIXBrZ9mqOjUcE6Rox0tBtUhDXO67A2oSI+SQa0DJgYpfNy3kiCfmppqlNirbe7
 96KxvwWsEZNqkFH540vNkdLJHcLLCZJVu8jOdQlRGVzxQSvFfToawLtE1zG6XeDQtGN4uV49mgm
 nM3pURle1EQQbiOSBAuA==
X-Google-Smtp-Source: AGHT+IEg6aUY+0P7kqhINTv2xiPrN6T4RUVpHv5FGmHlhfMEaLbEGCK4acGBL7ICAZFqqzMOEyKd6w==
X-Received: by 2002:a05:600c:8216:b0:471:1716:11c4 with SMTP id
 5b1f17b1804b1-4775ce20dcemr6765225e9.34.1762285082750; 
 Tue, 04 Nov 2025 11:38:02 -0800 (PST)
Received: from archito ([2a01:e0a:acc:bb60:756b:64e3:20ef:1d08])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4775ce3ef38sm5549195e9.17.2025.11.04.11.38.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Nov 2025 11:38:02 -0800 (PST)
From: Daniel del Castillo <delcastillodelarosadaniel@gmail.com>
To: Danilo Krummrich <dakr@kernel.org>,
 Alexandre Courbot <acourbot@nvidia.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 =?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 rust-for-linux@vger.kernel.org,
 Daniel del Castillo <delcastillodelarosadaniel@gmail.com>
Subject: [PATCH v3 2/4] nova-core: Fix capitalization of some comments
Date: Tue,  4 Nov 2025 20:37:49 +0100
Message-ID: <20251104193756.57726-2-delcastillodelarosadaniel@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251104193756.57726-1-delcastillodelarosadaniel@gmail.com>
References: <20251104193756.57726-1-delcastillodelarosadaniel@gmail.com>
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

Some comments that already existed didn't start with a capital
letter, this patch fixes that.

Signed-off-by: Daniel del Castillo <delcastillodelarosadaniel@gmail.com>
---
 drivers/gpu/nova-core/firmware/fwsec.rs | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/nova-core/firmware/fwsec.rs b/drivers/gpu/nova-core/firmware/fwsec.rs
index 4f268fe09573..7d5203268313 100644
--- a/drivers/gpu/nova-core/firmware/fwsec.rs
+++ b/drivers/gpu/nova-core/firmware/fwsec.rs
@@ -35,7 +35,7 @@ struct FalconAppifHdrV1 {
     entry_size: u8,
     entry_count: u8,
 }
-// SAFETY: any byte sequence is valid for this struct.
+// SAFETY: Any byte sequence is valid for this struct.
 unsafe impl FromBytes for FalconAppifHdrV1 {}
 
 #[repr(C, packed)]
@@ -44,7 +44,7 @@ struct FalconAppifV1 {
     id: u32,
     dmem_base: u32,
 }
-// SAFETY: any byte sequence is valid for this struct.
+// SAFETY: Any byte sequence is valid for this struct.
 unsafe impl FromBytes for FalconAppifV1 {}
 
 #[derive(Debug)]
@@ -68,7 +68,7 @@ struct FalconAppifDmemmapperV3 {
     ucode_cmd_mask1: u32,
     multi_tgt_tbl: u32,
 }
-// SAFETY: any byte sequence is valid for this struct.
+// SAFETY: Any byte sequence is valid for this struct.
 unsafe impl FromBytes for FalconAppifDmemmapperV3 {}
 // SAFETY: This struct doesn't contain uninitialized bytes and doesn't have interior mutability.
 unsafe impl AsBytes for FalconAppifDmemmapperV3 {}
@@ -82,7 +82,7 @@ struct ReadVbios {
     size: u32,
     flags: u32,
 }
-// SAFETY: any byte sequence is valid for this struct.
+// SAFETY: Any byte sequence is valid for this struct.
 unsafe impl FromBytes for ReadVbios {}
 // SAFETY: This struct doesn't contain uninitialized bytes and doesn't have interior mutability.
 unsafe impl AsBytes for ReadVbios {}
@@ -96,7 +96,7 @@ struct FrtsRegion {
     size: u32,
     ftype: u32,
 }
-// SAFETY: any byte sequence is valid for this struct.
+// SAFETY: Any byte sequence is valid for this struct.
 unsafe impl FromBytes for FrtsRegion {}
 // SAFETY: This struct doesn't contain uninitialized bytes and doesn't have interior mutability.
 unsafe impl AsBytes for FrtsRegion {}
@@ -108,7 +108,7 @@ struct FrtsCmd {
     read_vbios: ReadVbios,
     frts_region: FrtsRegion,
 }
-// SAFETY: any byte sequence is valid for this struct.
+// SAFETY: Any byte sequence is valid for this struct.
 unsafe impl FromBytes for FrtsCmd {}
 // SAFETY: This struct doesn't contain uninitialized bytes and doesn't have interior mutability.
 unsafe impl AsBytes for FrtsCmd {}
-- 
2.51.2

