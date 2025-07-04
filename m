Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F62EAF9B8C
	for <lists+dri-devel@lfdr.de>; Fri,  4 Jul 2025 22:16:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 650E210EA72;
	Fri,  4 Jul 2025 20:16:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="fC/Vll56";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com
 [209.85.222.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4481810EA72;
 Fri,  4 Jul 2025 20:16:06 +0000 (UTC)
Received: by mail-qk1-f171.google.com with SMTP id
 af79cd13be357-7d5d3f3f710so119118385a.2; 
 Fri, 04 Jul 2025 13:16:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1751660165; x=1752264965; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=a8gKMhK1P8kYlXeRydF9g6Ir5n6qoRzHtME7/jbZwh8=;
 b=fC/Vll56AjZQgcVNk8RcBYMge5QncFiMER/p/pqGV+lbH9ykutc5Fda0qsbt35Mavx
 ly5DEgYzbIsl3s3uhhjTbBvuP87VfyCwA/xG1RqsUFYLKbWqghweHcipbtnlJzMM9RK+
 hPqOpbrrHRUJUxrMGuAkCx5acE2GCETiZ1Q1F+RM/IrcyszZXjYiFM3dfOWlfVN8kWAy
 JyDIzUFAVxt7qqqaRgjriE+D7Xf26VxMVyD9UrDaNgiRKLaWLvLgHtQwymVLBUhVXtrq
 h1FvMY/xf5tkzVg66k9fu+SifjywHJnhDWBOFHlqPYuE1zThswyeZzwuHgRc4VzwkaYE
 jHXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751660165; x=1752264965;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=a8gKMhK1P8kYlXeRydF9g6Ir5n6qoRzHtME7/jbZwh8=;
 b=gwyZw4ra/yjgV3n/W5EHETtevmGVLcir0oZcxMXG3ZhhTaYsWiBwJMaXIODsdRuGlR
 BCEPb5HWvtpsCoAVaz+VHk0oeG3tn60aqa9kvv2oRz00QGuIdHPyD8DhiLuHkZOXXmbw
 spIoFgKesl5meBkk+Joypl5Bx2/Y0fqbeVFF7tANDcMeqhdZGLOSmZbYGxwCaMdwAzmD
 0VCigOUY5KQmMDE3M0AT4BZX0QlS/Gf0ctIjFbkzi/2ZgSmnRmhtHgEJMZKc9AV2rD5x
 ujHKH3EFPUxzL14mkoxsw88j6dl6wM6A5Yi/xs/wyu+zvc5P5KML1Ap/JG2dt+KVXwcz
 aOkA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV1SH8Q2XeRv1bLTLU7ZB6Lbbs+MQfT7Yq3Jvmtv1PPvQz73+tBXKzu8s6kKYYX+SJ8TPlsvPjWEA==@lists.freedesktop.org,
 AJvYcCX3RBQGzLb5PQznu8hhyFJ+Xff7uk49ZlgDnmQzmNByB5pfhiQLD27HsLNDQ4UctVvJvg/2qTGedeY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwEeal3LKdjSnkbkQZkfUK5a1JZaa86988EHvNFIVFpg1aQQtKd
 8dzJiT8awEcMUdtSNT3XCX4cPV0lDiapr/oTablTimeONtvYNd1Y7XBh
X-Gm-Gg: ASbGncugbw8YeuuL/ElVhBURxcqqoQma91+QyL28jVdQCEWlS3+u98X9OkoMUUA058r
 IPAzTloq7Xe7u6VMSXqv16wetKuOLIIgSNpKYLjcCRqgbXAQMCXG4J5+/aeb1LxiUWV4jfZRnN4
 esz5/JI4i9fzvxMPlQUlCxONtItcxjY3zdOX24AuD8DNRlLwGXPJlEOz4l3fSkoSwTNrDRIUA8G
 QH0IMqUT0cyhw5/B+qEc9yaDYDIQ2fuhQ5KqfVqVBM8tPttr1mzn64CDltg2MFeWjxVQC4xnniI
 n4WUG+msyNDiCPkGyZUtlVWeW/tjOi+/G+roaUg82yKmzsZGUOYKkgp8F0HdCHmRDsQ0V0GQEN2
 jrad5Bgk=
X-Google-Smtp-Source: AGHT+IF8p2jozIXmEQ2f+bxDZzizA3OOtjH7naor9ZhxgadHOKRJrT3ao5tXDNlKY8MPWMKo8J986Q==
X-Received: by 2002:a05:620a:370f:b0:7c5:4278:d15e with SMTP id
 af79cd13be357-7d5dcd0b203mr506984385a.33.1751660165283; 
 Fri, 04 Jul 2025 13:16:05 -0700 (PDT)
Received: from 156.1.168.192.in-addr.arpa
 ([2600:4041:5c29:e400:94f3:d2bb:5ace:77a1])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4a9949e5221sm19772941cf.2.2025.07.04.13.16.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jul 2025 13:16:04 -0700 (PDT)
From: Tamir Duberstein <tamird@gmail.com>
Date: Fri, 04 Jul 2025 16:14:53 -0400
Subject: [PATCH 2/6] rust: kernel: add `fmt` module
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250704-core-cstr-prepare-v1-2-a91524037783@gmail.com>
References: <20250704-core-cstr-prepare-v1-0-a91524037783@gmail.com>
In-Reply-To: <20250704-core-cstr-prepare-v1-0-a91524037783@gmail.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>, Danilo Krummrich <dakr@kernel.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Nishanth Menon <nm@ti.com>, Stephen Boyd <sboyd@kernel.org>, 
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 rust-for-linux@vger.kernel.org, Tamir Duberstein <tamird@gmail.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openssh-sha256; t=1751660160; l=1102;
 i=tamird@gmail.com; h=from:subject:message-id;
 bh=mJsS2vyiaMWiPQwd7tQN5gQccE2lmw3c6g9maEbaKdQ=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgtYz36g7iDMSkY5K7Ab51ksGX7hJgs
 MRt+XVZTrIzMVIAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QG3gvXbICtoQcnka1UGwT4DQfnT07Ks8Lh3dK1e4qeI8hb+rSV4UlssrsjJhEtHgZyeSB31xbBA
 926txUPuxKgU=
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

`kernel::fmt` is a facade over `core::fmt` that can be used downstream,
allowing future changes to the formatting machinery to be contained
within the kernel crate without downstream code needing to be modified.

Signed-off-by: Tamir Duberstein <tamird@gmail.com>
---
 rust/kernel/fmt.rs | 7 +++++++
 rust/kernel/lib.rs | 1 +
 2 files changed, 8 insertions(+)

diff --git a/rust/kernel/fmt.rs b/rust/kernel/fmt.rs
new file mode 100644
index 000000000000..0306e8388968
--- /dev/null
+++ b/rust/kernel/fmt.rs
@@ -0,0 +1,7 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Formatting utilities.
+//!
+//! This module is intended to be used in place of `core::fmt` in kernel code.
+
+pub use core::fmt::{Arguments, Debug, Display, Error, Formatter, Result, Write};
diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index 6b4774b2b1c3..aadcfaa5c759 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -77,6 +77,7 @@
 pub mod faux;
 #[cfg(CONFIG_RUST_FW_LOADER_ABSTRACTIONS)]
 pub mod firmware;
+pub mod fmt;
 pub mod fs;
 pub mod init;
 pub mod io;

-- 
2.50.0

