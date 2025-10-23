Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53725C03707
	for <lists+dri-devel@lfdr.de>; Thu, 23 Oct 2025 22:52:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 583B310E20F;
	Thu, 23 Oct 2025 20:52:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Wkjkww1U";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com
 [209.85.208.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0758510E950
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Oct 2025 20:51:58 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id
 4fb4d7f45d1cf-63c21467e5bso2269415a12.0
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Oct 2025 13:51:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1761252716; x=1761857516; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4UlHNTGv7yFHhaTac79ENYscEry1rz6cX/llqQj2Xi4=;
 b=Wkjkww1UxhS30n2haOpGjns/zW0hiNgbmiGv9KA4xiMT1wfE3WoAIyIbPxEcx918yB
 lKXjWnZyq4ByJR9jEADClBRdV6GXY7R8Cb8lmTo/+nAPHkJoDzKeu1g+6kql+gzwBRnb
 XOBFXr0anmEewdQBD4gEnsuduD9mbwtMEkkGVyx1FMS2x8hLQMaqnwAD4uM6KCgMRpjW
 2mOiIAOWPaYfUPMVPcuqmuBstV25CHtj8G4UJnav4UY9eKnT5WU9RLMcRi9ZljqtSzQm
 rKEi8CDOiGzD8BcH7rarTwh/uvseu6sLNiuM/BX4PND8C9JAgL6doADfqr+ZAp3iox3I
 2Pvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761252716; x=1761857516;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4UlHNTGv7yFHhaTac79ENYscEry1rz6cX/llqQj2Xi4=;
 b=D3sjhn/IrYWHkPAmYETB/jKVcfKO43GvRApnqsh3vPM62iUt2JjPkEN7AbJkY3fDuu
 FSBo0NFhxC0GitQhn+0iKAaVJDHVmeaSegvHCekoC8Fya7lGvvmDHpewPpn+eJ/43xwP
 Xdw9p1dx7VoEtesERLN8h2qQRQoP+o9eOdA/AIM62Z8I4Xiu/GyioribKCXY7C0gOdpl
 BSSGlf8iBL92sv3fm3/sTnxbuUIT2ihNwiBejaX+4+SaY2NI86vE9mpqJLNBoc4zkkGc
 ydxhie42iFBP+supBEqllN6Jy2iVoqFhOVVgzRDeD9bPaBnpyy4BQrJdq301N8/tJFbm
 vrRQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVvxDzfO0qznqeosf+dZl/xEfaOTi4kK/rpRMyOvJDaHAVryMH5/c5p8TrqXAcyn1SRt28ndbANc0c=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw8zoyFwy3euoqImG2hQc+QTt04yzqXeLZnm5NqZ5aAlU/vINMZ
 nMLghgKB0iCDRxE6xd9pFg3sWO/uQ3MIM4yEmkoKXfIILYHKue7g7c/o
X-Gm-Gg: ASbGnct5iiIONlOFIuCdvrHjL5KRyvjZZdi/UpRbTm3pzV77bjBxLVjwbrrSpMfNe5t
 EYm96yFsUBRftrpD+2IeHctN0KATTknlJd/rWP3KqIZ01D5zrB6c67dpLIrMGk1yWoyRN1StO/t
 4RhvsASkcIaqppVNPXbQo1mS2OJS2/E8sMxNxkCTQ0+GUushdqEnyPNT7IEyVJofRcbqQPXG7EB
 KZg/rqGoo/gOodZTAoaTdPpmCvatPPGCCoUjlto2PX8A2jUwuywQdRbzDg4fgNOuOeBFSHNUcKF
 ndyLmzdo1y200eX9/RU2ILre4fGEa7wJrXjcd6vKWIVhln067sNEv8iAZ24zClFFh7yUwQio3FC
 2gphcR9897aaLrWVxsLMIzVtHwQ2uLxdL/TqGLOvwRW0nMNfqVbmqWJ1CCP8QIDv9rYqrDV0af6
 EkX2f037urjnbZDYj70g==
X-Google-Smtp-Source: AGHT+IFX0S8naZatH+IeZ+gFwMfUpBUu0mzJ5xLs/IvrcDwpmdXZobGQxw0XYiP34F1iyLjV8n51aQ==
X-Received: by 2002:a05:6402:50cb:b0:63b:ef0e:dfa7 with SMTP id
 4fb4d7f45d1cf-63c1f62ccccmr27493360a12.6.1761252716410; 
 Thu, 23 Oct 2025 13:51:56 -0700 (PDT)
Received: from archito ([2a01:e0a:acc:bb60:756b:64e3:20ef:1d08])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-63e3ebb3299sm2564120a12.2.2025.10.23.13.51.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Oct 2025 13:51:56 -0700 (PDT)
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
Subject: [PATCH v2 2/3] nova-core: Simplify `DmaObject::from_data` in
 nova-core/dma.rs
Date: Thu, 23 Oct 2025 22:51:36 +0200
Message-ID: <20251023205146.196042-2-delcastillodelarosadaniel@gmail.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251023205146.196042-1-delcastillodelarosadaniel@gmail.com>
References: <20251023205146.196042-1-delcastillodelarosadaniel@gmail.com>
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
---
 drivers/gpu/nova-core/dma.rs | 15 +++------------
 1 file changed, 3 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/nova-core/dma.rs b/drivers/gpu/nova-core/dma.rs
index 94f44bcfd748..620d31078858 100644
--- a/drivers/gpu/nova-core/dma.rs
+++ b/drivers/gpu/nova-core/dma.rs
@@ -26,18 +26,9 @@ pub(crate) fn new(dev: &device::Device<device::Bound>, len: usize) -> Result<Sel
 
     pub(crate) fn from_data(dev: &device::Device<device::Bound>, data: &[u8]) -> Result<Self> {
         Self::new(dev, data.len()).map(|mut dma_obj| {
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
+            // SAFETY: We have just allocated the DMA memory, we are the only users and
+            // we haven't made the device aware of the handle yet.
+            unsafe { dma_obj.write(data, 0)? }
             dma_obj
         })
     }
-- 
2.51.1

