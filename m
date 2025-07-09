Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E944DAFF244
	for <lists+dri-devel@lfdr.de>; Wed,  9 Jul 2025 22:00:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31BBF10E844;
	Wed,  9 Jul 2025 20:00:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ew1xcmld";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com
 [209.85.160.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9771C10E844;
 Wed,  9 Jul 2025 20:00:19 +0000 (UTC)
Received: by mail-qt1-f182.google.com with SMTP id
 d75a77b69052e-4a98208fa69so13266441cf.1; 
 Wed, 09 Jul 2025 13:00:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752091219; x=1752696019; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=FYbYV/jbSYlUlYZK529EkBoBy94/ve5uHCT0jgrrsEc=;
 b=ew1xcmldRSXZnn+Gqquf288SNSFJuaKEM+q6yGvPmrqNrqnvNNvFq7BCCBLIaBFu8K
 xYspKOT49fd0NNbHJP7IpQp7T4tuvdlmRJf6BeQI+8ea9roaC8MJUvyavcF0agaJbYwq
 oZItd5lUbDOrVYDHfkvvN17pYRVAzC8T4yiHqGdb1/TR9gsssD2iH0zLaZ1FbJ/3TKcR
 SYA0z43E/USjKTc6BB6ukvfaUtz3mtHzOV/ZcG91ZwaAbjVVmwRc5K0IezYS+k/Z3sTq
 ZzMy+1g7tZ7E9ujRlXIx3Id+Cdd9nztBcvcgbS/ulMvvIR3BCGhKjx5Q3KnnVT4GuhpW
 8YHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752091219; x=1752696019;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FYbYV/jbSYlUlYZK529EkBoBy94/ve5uHCT0jgrrsEc=;
 b=RnmZSs9hJ6RKWoLXGeGb11VYh95+mpgDXLzPCdVJE8JOUD48d8mxO9tgUiFQ3WJ/E4
 xON7cGHbp+jVDMzFzVWfgxd96Wkrv0l7KvlkGZ0r5JT7tNjcUFr6tYBRMZZQ/Esal6HT
 meg9/TUKTsgSf1VCwRdH7S/Bua+hS+89L6FSK/C7T28+Z59LxpJUPOa+o3Bj2NPsYYnu
 pBEDZkVACNDFolrC/AOUzeHlS58cxzFTmNJ9TeV1bGKj4H9LZnH9jfYOA6XiWqn9K+XL
 po7nwUa+ln/P/hyRRl7LvktLfWG3cAUbyWgRZrmryDwYRNI5QluMs93hcR25vdr9f0UU
 d6vw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW+WXIbGkakaP//Ym5emt4eKSSejHXfwu1CZeE+xkmLIKO4bP2oikAtIfK34VrNIhmiHEutBDVYfJg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzMSFezqRmeCqRZcXJwzqfi8KM58ydAgBSXXZ8n97Pt4SFXiYyw
 isZaOjfdtteJePneV0joLg8u6YwKgiou5CfQ+TaGIefl4dUUU+I7eVYY
X-Gm-Gg: ASbGnctjHy3XTK2xND0LeE21RNpzGRDNAUMDeA5XLY8nPQeQRI8SZI6hHndej964cG6
 JJCiDOu5haTxydpZB8mvOpq1lI6v+sjov0KYA+BxrdMNa7t5eqqFuxz/xYSaRMfgpdzJtHgjELI
 WD1YLqJhlDjeuJ/kypzHnS3pnnhWnlmF523wvO9AQzVCgQpKp6z+CM9qYpZwnKujTzmtL+B4ftx
 ZK9dIUpeb8RN68e6JeDLkNq0UE+MGerDQt7aNODeHyxR/vfDxyDJtMfmcsDJxS9Uv1miXHMXC8F
 6AHql7InDuh8HYt+xhMAcVjHFZNMVGKcHSxifMtPk83GbDF/JsGHBt9ZiYC5NMbRwEuA7EGY/SQ
 4nomqULJImIBhDwmwXQlsft/wlEMpR/+v7RLUlEOVdGVBL8v6UUi3BvgDzg==
X-Google-Smtp-Source: AGHT+IEWZGAjchfamIdPYEH1FsR0qpTsGWn1OKlq64cGF3DAghxLjgjw20fv5qWhtdp+gL7T1gCPWg==
X-Received: by 2002:a05:622a:1b0a:b0:494:731c:8746 with SMTP id
 d75a77b69052e-4a9e9d39db3mr12683541cf.23.1752091218452; 
 Wed, 09 Jul 2025 13:00:18 -0700 (PDT)
Received: from
 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa
 ([148.76.185.197]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4a9949e4aaasm100432891cf.3.2025.07.09.13.00.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Jul 2025 13:00:17 -0700 (PDT)
From: Tamir Duberstein <tamird@gmail.com>
Date: Wed, 09 Jul 2025 16:00:04 -0400
Subject: [PATCH 5/9] rust: file: use `kernel::{fmt,prelude::fmt!}`
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250709-core-cstr-fanout-1-v1-5-64308e7203fc@gmail.com>
References: <20250709-core-cstr-fanout-1-v1-0-64308e7203fc@gmail.com>
In-Reply-To: <20250709-core-cstr-fanout-1-v1-0-64308e7203fc@gmail.com>
To: Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Jens Axboe <axboe@kernel.dk>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Brendan Higgins <brendan.higgins@linux.dev>, 
 David Gow <davidgow@google.com>, Rae Moar <rmoar@google.com>
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 linux-block@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 kunit-dev@googlegroups.com, Tamir Duberstein <tamird@gmail.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openssh-sha256; t=1752091204; l=1087;
 i=tamird@gmail.com; h=from:subject:message-id;
 bh=5dTiOejZJe8RnjUwx1Mx5Diy0vJJ7o1JB54aVyaQ3/I=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgtYz36g7iDMSkY5K7Ab51ksGX7hJgs
 MRt+XVZTrIzMVIAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QNJZvlrOcKPbSKef6UpG5KCpY0ZVZYeAhWghFLoYOxqZ6pyW3Fg24FvRlC8yX2hCr7ezE9aSuv5
 EjP1ebs7IRQY=
X-Developer-Key: i=tamird@gmail.com; a=openssh;
 fpr=SHA256:264rPmnnrb+ERkS7DDS3tuwqcJss/zevJRzoylqMsbc
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

Reduce coupling to implementation details of the formatting machinery by
avoiding direct use for `core`'s formatting traits and macros.

Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Signed-off-by: Tamir Duberstein <tamird@gmail.com>
---
 rust/kernel/fs/file.rs | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/rust/kernel/fs/file.rs b/rust/kernel/fs/file.rs
index 35fd5db35c46..67a3654f0fd3 100644
--- a/rust/kernel/fs/file.rs
+++ b/rust/kernel/fs/file.rs
@@ -11,6 +11,7 @@
     bindings,
     cred::Credential,
     error::{code::*, Error, Result},
+    fmt,
     types::{ARef, AlwaysRefCounted, NotThreadSafe, Opaque},
 };
 use core::ptr;
@@ -460,8 +461,8 @@ fn from(_: BadFdError) -> Error {
     }
 }
 
-impl core::fmt::Debug for BadFdError {
-    fn fmt(&self, f: &mut core::fmt::Formatter<'_>) -> core::fmt::Result {
+impl fmt::Debug for BadFdError {
+    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
         f.pad("EBADF")
     }
 }

-- 
2.50.0

