Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73687A63547
	for <lists+dri-devel@lfdr.de>; Sun, 16 Mar 2025 12:17:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB07E10E12F;
	Sun, 16 Mar 2025 11:17:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="NvWncY/u";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com
 [209.85.167.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EEA310E12F;
 Sun, 16 Mar 2025 11:17:25 +0000 (UTC)
Received: by mail-oi1-f170.google.com with SMTP id
 5614622812f47-3fa6c54cdb2so2631453b6e.3; 
 Sun, 16 Mar 2025 04:17:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742123844; x=1742728644; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=ekjsEa3df+HXolOxxQjVErHPPoRYP8orqeSGkgsPOaQ=;
 b=NvWncY/ulN7lK+9CNf28mzQQ+y75JgbPmt77Y5CG/Qd6Dt2PuJk9fbTvnZD+awSGx5
 cVw9ZANnHjAR37e1BS/JQRYUmKFxwwCHnDTmTkrNiebM1qdhAHsw+SzL6PRdXa4BKENK
 TTXkO/DQPsKKf2ZkJH0AL4o8xp71B4rz/vcLkXknKepkUZ4M+D4OHJcKdkhLxPl/IeLL
 2z1m30xdmAmhkhYkGmDtbQ7EArjBvgSUOVFP7abWTkewJwEJc1rJgpoXmoERzjKYiQVU
 Xf20mENyHsl193E5aZepagz+ECrxE2r/r0TAqS+jKT5G6BGJzNT6EpD0/vJYn1zvv3An
 S6kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742123845; x=1742728645;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ekjsEa3df+HXolOxxQjVErHPPoRYP8orqeSGkgsPOaQ=;
 b=QK5EeuwUsYZh8JOEIGxxfYtWLl6D73cC9Ddaa/RmqQhuS6JSEgVvyy1vXlVKnWrsBS
 Awig+aYaGjB/5SIvA4w+2SRtKwEf1WWCNYLQku8KY6UHoPsQz51YTlOVR9sk5MZ5FrDq
 Ac7wwjz51Uqoe5KfJ13BxYnBn16AfLVjjJNOASQlzOcfTwH2QIy+QTaRX9QNmzO4kbgv
 tN/rAR834hXMFa/qOD1RtfEXFJH4Lu/AUBG9N8xiW1zjydwGBDxchRG+D2ElPHJ3zb5u
 J9mZJxIQpx/iqF5FcXsUdpHO53svcenwAm+eDyzofrut9TWCGitPyBG51gvHg1keAn3E
 yxOw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUvp5eeuNf4c1RyW6LaAgKIDlaoDGWBTdLqtYKpPNxkfXF3XXUVM9o390fXVFt0RPN4PTFMZUs+Uw==@lists.freedesktop.org,
 AJvYcCVObAjdwyu8Y4zoFYUQ99JgM3xGO4lsEyhtYWO/L6OP/MpMrrBxT2VNaaH2yuaaOOcywHTWOnupJWU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz/QHRnYprNc0jaWie64ujgdJ/X/mH2KqGFF29Wzj0GzBiiU1nQ
 UU9MLdxUz9lSw1EdREzSgegNALCIZsCvamFm/2PBEhtwCHYgPfPC
X-Gm-Gg: ASbGncsxH6DkLJRuatFYBl2umVW2s3JDRAGAtm0d6s3uSs2hUjKnQHIHeb5OPPnHiiX
 2/91YREmb5xbV39ulbP/+KoSlnN2I4ZORIZZnpW9+F0+DT4BHmvo/XRfrwc1Ur1lZbT35lvig6l
 NcImq36oCs6EsbWGTFblamvL1bM+eDVOQLiIvPbsUEbAZQdozVtY36eCf8jHomXikq0YlRAVocN
 vFjzdyyyvNccToxMsmMNclYEOZFT38LeK68spsk/y/YYS+ARXOPTQQOp9yOvk4pNxRdasnq0UCw
 Nt3qugkOEou0MQCbggQTK/89AS/GGVfwTHtW/kXLqE32CSShp+Wk6+lz39qFi70MR/7NCtJAbWn
 RjBLBvKbvq4p/dL1EPwuXvm61cKU=
X-Google-Smtp-Source: AGHT+IEjg2xfhvPfXaY/5Cp/9QgKkPC0d1FC1flzt29b+ldjcXyycYr78QYS2iUROkMc5ivHSaEeaw==
X-Received: by 2002:a05:6808:23c3:b0:3fa:f848:8dfa with SMTP id
 5614622812f47-3fdf026db54mr5046847b6e.30.1742123844546; 
 Sun, 16 Mar 2025 04:17:24 -0700 (PDT)
Received: from my-computer.lan (c-73-76-29-249.hsd1.tx.comcast.net.
 [73.76.29.249]) by smtp.googlemail.com with ESMTPSA id
 5614622812f47-3fe832ce015sm715978b6e.7.2025.03.16.04.17.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 Mar 2025 04:17:23 -0700 (PDT)
From: Andrew Ballance <andrewjballance@gmail.com>
To: dakr@kernel.org, airlied@gmail.com, simona@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 corbet@lwn.net, ojeda@kernel.org, alex.gaynor@gmail.com,
 boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com,
 benno.lossin@proton.me, a.hindborg@kernel.org, aliceryhl@google.com,
 tmgross@umich.edu, andrewjballance@gmail.com, acourbot@nvidia.com,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org
Subject: [PATCH v2 2/3] rust: alloc: add Vec::resize method
Date: Sun, 16 Mar 2025 06:16:43 -0500
Message-ID: <20250316111644.154602-3-andrewjballance@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250316111644.154602-1-andrewjballance@gmail.com>
References: <20250316111644.154602-1-andrewjballance@gmail.com>
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

implement the equivalent of the rust std's Vec::resize
on the kernel's Vec type.

Signed-off-by: Andrew Ballance <andrewjballance@gmail.com>
---
 rust/kernel/alloc/kvec.rs | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/rust/kernel/alloc/kvec.rs b/rust/kernel/alloc/kvec.rs
index 18bcc59f0b38..eb6d40a1bf8b 100644
--- a/rust/kernel/alloc/kvec.rs
+++ b/rust/kernel/alloc/kvec.rs
@@ -554,6 +554,32 @@ pub fn from_elem(value: T, n: usize, flags: Flags) -> Result<Self, AllocError> {
 
         Ok(v)
     }
+
+    /// Resizes the [`Vec`] so that `len` is equal to `new_len`.
+    ///
+    /// If `new_len` is smaller than `len`, the `Vec` is [`Vec::truncate`]d.
+    /// If `new_len` is larger, each new slot is filled with clones of `value`.
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// let mut v = kernel::kvec![1, 2, 3]?;
+    /// v.resize(1, 42, GFP_KERNEL)?;
+    /// assert_eq!(&v, &[1]);
+    ///
+    /// v.resize(3, 42, GFP_KERNEL)?;
+    /// assert_eq!(&v, &[1, 42, 42]);
+    ///
+    /// # Ok::<(), Error>(())
+    /// ```
+    pub fn resize(&mut self, new_len: usize, value: T, flags: Flags) -> Result<(), AllocError> {
+        if new_len > self.len() {
+            self.extend_with(new_len - self.len(), value, flags)
+        } else {
+            self.truncate(new_len);
+            Ok(())
+        }
+    }
 }
 
 impl<T, A> Drop for Vec<T, A>
-- 
2.48.1

