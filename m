Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F2C5B24DAA
	for <lists+dri-devel@lfdr.de>; Wed, 13 Aug 2025 17:40:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8784010E74F;
	Wed, 13 Aug 2025 15:40:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="NTMI7e0j";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com
 [209.85.222.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB4F710E753;
 Wed, 13 Aug 2025 15:40:04 +0000 (UTC)
Received: by mail-qk1-f182.google.com with SMTP id
 af79cd13be357-7e864a60b26so118929285a.0; 
 Wed, 13 Aug 2025 08:40:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1755099604; x=1755704404; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=/qpsl+4vBrJRbJlqVCZp4ufITcVO/mct/gLsPqZyfMc=;
 b=NTMI7e0jz9iCH2bnAAFIgO93SxsEu0H+yO17bqovwV0GNXssR1p4QXKG1nawMiE7WW
 V/j3zL8Q995m6CBITGo64BOLDu7Cu8CCz1koYDJqypmujHCdjR7iPfv7scDu93Dg47s4
 0GRgCTRAEFwLVuVS6AxO0cc/ck24mvy5mZM7+BsEqTcjWp/D3lh3sEYa1VSUNl/aygYA
 LsgsmOKnMqJhJHQmJ0uRgq9xiYdut1vyjTz4kPM0hRqlX1cssB5zwGvMHvfkQn1BCd7X
 SL0OrdTZIInj/Wl/BZZ/qKS6ac3iff7Mj2C24s6qWkb2WQCEErFfM/5EO6UtyaLEyV+l
 9tPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755099604; x=1755704404;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/qpsl+4vBrJRbJlqVCZp4ufITcVO/mct/gLsPqZyfMc=;
 b=YMIfAuk2/UeHilFONFaIoYq8MQaFm+kTSsH/hv5/sMFtpELFm3b9/EuPjVfo9lsVGZ
 ajB9XEeM4QJsfp9DF+/fvoOLTpVcxGQZZ9QfExcXzZEjSoPNE23lfyHQmYj3Oob0dgL6
 af9Wghreb6Z2LJplSZ28jfaG9KsBO3oilLQ3dpJEM2KUm0ZBhpy03QmniMzs7ptOZi/q
 yVI3TAKNV2EcFppQVUB9GnzjCRugkl7U77l038c2a+auUq/C63bE8ni+PMU9qMTeWfiq
 wKuspMz5XxxJtUCYWtC9Gw18ebpPSE0WU5q8Injf3wv3h8YHDNitIs41BDV6b2U1V9uT
 ds0A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUYdF/iAkcmeAy8uVkl9ThGyWXw+Zg/C/6nO/BZjcJUdcDgDvLlDm/GFWqayU5PkNEpm/w7zSzAKFk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwWVl3XEpVu5USqjaKSNtcpXAK8D/98k+hVHDziwU5z2wk+j9yk
 yJ+ISJNIyZiTnG/phQn3ngJIXrqQ29O8StPNHueUouBB2Xd6qVn2jmTM
X-Gm-Gg: ASbGncuunS5zOBUHFyBWoQenxT15BOL05/hjdfTzkDxm5mnqbr/6XXV91uCvUHvhjuk
 Me8WDO2zH/Rv49N7OXgyucBwbvim+fzr2dRvuP49uKEh9Vl6kP9O5tFZSgmJtVqwwj4DrR325na
 jxqyyOsKQetP1R1CGVv0B36m2nB8WvZdPA+PVHsQoFPF4f9VuQRQJ5zDbQjGMdgJBxFMmqox1F6
 1jeEoktnuM57O1luBQPyBk2gKHVVpcMLne5RVBmT4WeQh78/5O3cHzWDCqwsXNHbE/kUEEkYXX3
 QcGOMfllovXHuN0NQYB2IqUtDQe0DQirYYba3/GpC9CndU9+QEed6VW0KpzNnTWarEwSlhsm7Ah
 nI124Ttlzl4FdEhY8X7+MbEfFuxmkTUQeSvjeFnj60uh0sPLFrh/qK4JFsjKk+m8C16xr3zbXVD
 NeKM98vdSyAnNXU6Yd1IXWPewdiSG8qMkBcA==
X-Google-Smtp-Source: AGHT+IEuXl9nU8BxNMaZcf00fEBMhN8CPnsH2MX5pRIR595Bg9FirSB63Hs35j+kk9MEGbhoVixU0w==
X-Received: by 2002:a05:620a:450c:b0:7e6:92a4:3f03 with SMTP id
 af79cd13be357-7e86fc24707mr5121985a.8.1755099603612; 
 Wed, 13 Aug 2025 08:40:03 -0700 (PDT)
Received: from
 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa
 ([2600:4808:6353:5c00:d445:7694:2051:518c])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7e67f728a6asm1976119385a.64.2025.08.13.08.40.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Aug 2025 08:40:03 -0700 (PDT)
From: Tamir Duberstein <tamird@gmail.com>
Date: Wed, 13 Aug 2025 11:39:50 -0400
Subject: [PATCH v3 5/9] rust: file: use `kernel::{fmt,prelude::fmt!}`
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250813-core-cstr-fanout-1-v3-5-a15eca059c51@gmail.com>
References: <20250813-core-cstr-fanout-1-v3-0-a15eca059c51@gmail.com>
In-Reply-To: <20250813-core-cstr-fanout-1-v3-0-a15eca059c51@gmail.com>
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
 David Gow <davidgow@google.com>, Rae Moar <rmoar@google.com>, 
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
 Vlastimil Babka <vbabka@suse.cz>, 
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Uladzislau Rezki <urezki@gmail.com>, 
 Alexandre Courbot <acourbot@nvidia.com>, 
 Alexander Viro <viro@zeniv.linux.org.uk>, 
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 linux-block@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 kunit-dev@googlegroups.com, linux-fsdevel@vger.kernel.org, 
 Tamir Duberstein <tamird@gmail.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openssh-sha256; t=1755099590; l=1134;
 i=tamird@gmail.com; h=from:subject:message-id;
 bh=RP9BgmTgGLsZJlnOuBKxXo7vRURZVQnq5fRAl43lnxk=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgtYz36g7iDMSkY5K7Ab51ksGX7hJgs
 MRt+XVZTrIzMVIAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QKl+lYEvf8gi26tp1qsgbmNj69ikU6KcIBZ+ES5GC7bQ34Bf2HyuMiq2uxB6M1hJNeJt7F1p9V5
 +oP2Eqk03xw8=
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
Reviewed-by: Benno Lossin <lossin@kernel.org>
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
2.50.1

