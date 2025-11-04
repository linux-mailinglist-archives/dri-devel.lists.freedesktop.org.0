Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 916F8C32D40
	for <lists+dri-devel@lfdr.de>; Tue, 04 Nov 2025 20:38:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70E6B10E3A6;
	Tue,  4 Nov 2025 19:38:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="LPiLDzyP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8668710E664
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Nov 2025 19:38:06 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id
 ffacd0b85a97d-429c82bf86bso3273969f8f.1
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Nov 2025 11:38:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1762285085; x=1762889885; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fYgheLN32MsYWSBCELea5jaxOC/f7khm7azED0VQk/A=;
 b=LPiLDzyPdeQ8EHW203wIRtr7XXVMp3n8qYUkpxORybmQVFGWmoG4FV2RUfeZnZ6T6v
 ci2q+pVrxZqjzArPEiFQGdZpiMp/P69/DAdYlcV4CouVura5DdvVsdM4CkIhK+OBEX4X
 siDxlQ9HxqKh6crRgow0wYemWOTUKipmn+V/c57TQX+KnJPwE5MC3hoJyOS8Jzycx8Ba
 0CneNYb2crMWuNlWVM+DAYZ1XYOMnuZGLfjRN3Yl9NJYKQ1lfvjtUg/cxxpwXUWH0M2h
 ATNAJedQAGnwIZJxMxmZNAURLKbigZzpYNwtNSESsZ5EtnEaKEimIr9F5nu8wQp3DYNf
 zZKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762285085; x=1762889885;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fYgheLN32MsYWSBCELea5jaxOC/f7khm7azED0VQk/A=;
 b=vJnXz8jWyE3Osa8vqMaFKv8JCsUiJ+ZHyRhpGTbasp/sHa6hKbr6LIzmOzZCwer0z6
 +fOvpo6cAhAOxjmhtN0u8ZinqcxgRKws/0zuPaKbisz8PiEyt2SOZcZIUie9e3B3pkt/
 iCQLmPljbk3cH1ROCDspjvkgVOPFugiWxmeAdQqN9UtYTpJVka8F70QPSI6snDVuseSO
 Fgni1q/ghOm4imwzYMANQGDmymBNF65uF8JPGS3D2Pofu4uxpJVifJhX55lirgod6o5j
 NCy9zcHNug7JP+nd9zb99MVd4knnEYlCQh8S5BtMT2oytnpbBi+lx5Oo4vIHLFPwjYAS
 7e2g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXoWfDp6qI+sx8mU1+GPsY18EKdsNYOiKtqQJZH7wxJkPfuKejkPFf7/S/zO+uNVLsPD+vZPcheLbo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxR7YLGtsT7T8mwfJQkJZg91Ty2f7lPAAqmvtXF828n/4RfZbmI
 t31aKVoG/iUqR2sxZQc/DiG8E9sPUZRURs2i7wvL+stcgNpIun64bAYN
X-Gm-Gg: ASbGncvUESxkRm71hl//jIEd0vkSUZLGhQqJq+H90Cb7KSthq3CeW6d1wzqvWrZL+o0
 admYC9r/3CQprHcuVX8C9RrDJzIieJ2QQLVE2d7inlZxv6ug6FHOrvKSHEwR0IARFY2sv6foxIZ
 arWTOTc9y2bTMS4SqCmZHjb5zhHNCWNLzotdoY6zVepB+lRIQ8ybhWX41/hX9KPQYrNM1b3mxAm
 obZ+l+rdfnHeA/T2nIz3w9whMm383Rod8jNbs6jtGHWnVWEOrPp1Pmz6cAduK+HUXq2LuFyjho2
 NkRNEfWV6ZHzxcezc4nwEKYZGagZMyPdV9kWoWiLx8oxw6s9KTY4rxpknIpmxH5RFb+rPf1bKbG
 6tRBLaDcFNzdf1RKERqqDxQf3xcUKvLT5/bIcb3/av5u/kTwekdplRNNSKGBZjoufh+fECmLUWW
 rP0pfW5gN/Be2GU1nGZw==
X-Google-Smtp-Source: AGHT+IGkjMaYQNAOAYMzRxYOldsYeku+UMuN0PlwdK6jupihKC6msqilxvcotQ3WG/fqCuJVIjKe9g==
X-Received: by 2002:a05:6000:210c:b0:429:dde3:659d with SMTP id
 ffacd0b85a97d-429e3309ae3mr294212f8f.47.1762285084988; 
 Tue, 04 Nov 2025 11:38:04 -0800 (PST)
Received: from archito ([2a01:e0a:acc:bb60:756b:64e3:20ef:1d08])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4775ce3ef38sm5549195e9.17.2025.11.04.11.38.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Nov 2025 11:38:04 -0800 (PST)
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
Subject: [PATCH v3 3/4] nova-core: Simplify `DmaObject::from_data` in
 nova-core/dma.rs
Date: Tue,  4 Nov 2025 20:37:50 +0100
Message-ID: <20251104193756.57726-3-delcastillodelarosadaniel@gmail.com>
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

This patch solves one of the existing mentions of COHA, a task
in the Nova task list about improving the `CoherentAllocation` API.
It uses the `write` method from `CoherentAllocation`.

Signed-off-by: Daniel del Castillo <delcastillodelarosadaniel@gmail.com>

---

V1 -> V2: Split previous patch into two. One per reference to COHA.
          Added more details in Safety comment. Let me know your thoughts
          Kept the original map to avoid a temporary variable

V2 -> V3: Fixed compilation error.
---
 drivers/gpu/nova-core/dma.rs | 19 +++++--------------
 1 file changed, 5 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/nova-core/dma.rs b/drivers/gpu/nova-core/dma.rs
index 94f44bcfd748..9acbe2e4d4e5 100644
--- a/drivers/gpu/nova-core/dma.rs
+++ b/drivers/gpu/nova-core/dma.rs
@@ -25,20 +25,11 @@ pub(crate) fn new(dev: &device::Device<device::Bound>, len: usize) -> Result<Sel
     }
 
     pub(crate) fn from_data(dev: &device::Device<device::Bound>, data: &[u8]) -> Result<Self> {
-        Self::new(dev, data.len()).map(|mut dma_obj| {
-            // TODO[COHA]: replace with `CoherentAllocation::write()` once available.
-            // SAFETY:
-            // - `dma_obj`'s size is at least `data.len()`.
-            // - We have just created this object and there is no other user at this stage.
-            unsafe {
-                core::ptr::copy_nonoverlapping(
-                    data.as_ptr(),
-                    dma_obj.dma.start_ptr_mut(),
-                    data.len(),
-                );
-            }
-
-            dma_obj
+        Self::new(dev, data.len()).and_then(|mut dma_obj| {
+            // SAFETY: We have just allocated the DMA memory, we are the only users and
+            // we haven't made the device aware of the handle yet.
+            unsafe { dma_obj.write(data, 0)? }
+            Ok(dma_obj)
         })
     }
 }
-- 
2.51.2

