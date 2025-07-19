Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8973B0B249
	for <lists+dri-devel@lfdr.de>; Sun, 20 Jul 2025 00:42:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8851F10E365;
	Sat, 19 Jul 2025 22:42:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="XD+snZgQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com
 [209.85.222.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 050D110E35D;
 Sat, 19 Jul 2025 22:42:17 +0000 (UTC)
Received: by mail-qk1-f182.google.com with SMTP id
 af79cd13be357-7e34607e575so571389285a.2; 
 Sat, 19 Jul 2025 15:42:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752964936; x=1753569736; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=cMiFmax83DBHXL/VqrofbEg17y34QjNQwBZrlkLA1Pc=;
 b=XD+snZgQyoYB5yBWhaVbLXcKv6yLC87lJVP2nb0FO7G5ogn9LT2rFVtKafPjJHGOjs
 jcc8m+4uiqGoUOsas5xdZ/oBD0OdzwCrSiVHrtvaTQqU0c+ckALrT7wlUYWqPS9fCnEl
 /CdfqMI5nzR3moA+6gxuy+zjNdx+vULWox2o+b7whl7htXrdtwhj2eFu80rrPvUInX0b
 rxMPQMhvDu3IKqA/bRlFUUjrXYUFH7dgMIj4WMmcTpZUb2hS9wFvkdI6KEV9sCZupbTQ
 vJTyFDVcnvpzjLoRWJu55mISyb8hFa5eRmMEifmB4huMtZtyzDwap0roQ8d0qa9AFhMe
 M64g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752964936; x=1753569736;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cMiFmax83DBHXL/VqrofbEg17y34QjNQwBZrlkLA1Pc=;
 b=WY5aazRVlPdzuSnEDPBoynwDXXiZ/DZo2/YxcrwhRCoSa38vcA3+dPMizyTPR1Lb6z
 KR4TDSYVogRKJkpCH/CcPIq9wymEzGbs2zTcoKgJ9JLX/lg7Zp4v1VMqx2t7oFpPseLH
 gos9RZsOFJ+5X1wMb1+JeP/rG/BMQpqvr07iGdJ3oWms1IGSzrAvgRqLhoX4OYFR1YUE
 BLqWT06Dq9WYydNRATvhKiSAuwsObWOaUUgPfe1CIOQC0jYRCh8Z30gt5HSZX1pgp7iA
 4kCRoOSm6JkGoWQIi/uppZggU9DfR/PF1sAeGimnZmDL278I76f+9swAyHwQ0lnCXFel
 PLTA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUOE+Xl45sIMReWmgrJXOKsh6tEEOOUBnCRmqYARiqy/GWJadF0gy1SO94Goq+CxqP/ruNI/4zD3zo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzOZJFLBrbRbkd4O9KMXFizHF1T9A8XO/M6su+Molf8rSay3CnZ
 SFVVWi18rp3g+++IP3sTKFomZwO81ieBl9UUpq3/WoyKzNUFkFjOUbPP
X-Gm-Gg: ASbGncuyhKJcB80w3x1hGz6u6X4gjIM8Qmdo/xHFFPein21+Obj5UT2xbe40Q/gcVPb
 0b9ZyXKc7vuyEwlDl6Dz3cHu+a1EfC47nfEWmHqUrseJ7IethCWKUi+9olmBxR4IOLcNQnp+YKr
 IhGohrbHUozST7HJKLNVGAan+Jek3nN2HHy+noPkwvVBMIqcovCfP73LWOZFjc63s7Oe03RJfTI
 R416XDqayBo3y+cAaZdizbJtpxMNpMA3s6CIwJhX9XthX43lhm6Vfpm2LJQ41FgTPnZ8aYDpl0S
 JEgKc7JgSq2k92uAUDOU64a8YNv4rYdKyWumHOBXIOfvql4bu5LMm4YrQpu1EIPDQpkY6sRgTzc
 OF8fP9ll+/VkiCZPXO455OSZnRN1kRt6HXbkChHGeVQS19E87UY0PwqOO8uw3f+U5XdEfdtPWcf
 wXGbSMr0Wdvw9MMid7esRUxA7+m0KD
X-Google-Smtp-Source: AGHT+IGVo1i2TaQIfqAE4SlKOOW0XT2MULeIOXkGaUKBOzQ48pQ7CM6UfPlu3A7MsQxB2vk/ikPF8g==
X-Received: by 2002:a05:620a:4095:b0:7e3:3da8:1d06 with SMTP id
 af79cd13be357-7e356b282efmr1102367685a.54.1752964936028; 
 Sat, 19 Jul 2025 15:42:16 -0700 (PDT)
Received: from
 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa
 ([2600:4041:5c29:e400:78d6:5625:d350:50d1])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7e356c75cf5sm251550785a.84.2025.07.19.15.42.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 19 Jul 2025 15:42:15 -0700 (PDT)
From: Tamir Duberstein <tamird@gmail.com>
Date: Sat, 19 Jul 2025 18:41:54 -0400
Subject: [PATCH v2 5/8] rust: file: use `kernel::{fmt,prelude::fmt!}`
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250719-core-cstr-fanout-1-v2-5-1ab5ba189c6e@gmail.com>
References: <20250719-core-cstr-fanout-1-v2-0-1ab5ba189c6e@gmail.com>
In-Reply-To: <20250719-core-cstr-fanout-1-v2-0-1ab5ba189c6e@gmail.com>
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
 Uladzislau Rezki <urezki@gmail.com>
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 linux-block@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 kunit-dev@googlegroups.com, Tamir Duberstein <tamird@gmail.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openssh-sha256; t=1752964924; l=1180;
 i=tamird@gmail.com; h=from:subject:message-id;
 bh=pXR+pneQEkVan1ORZtdC4QLLw1pF+V8ExOh8drAAHsM=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgtYz36g7iDMSkY5K7Ab51ksGX7hJgs
 MRt+XVZTrIzMVIAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QDn9tcAkIdM1tWcaE/g1fRFUadSDfcLW0qfYjUzPTHiL3CXZbnVUx7cxTfPOCZum2i3seyeZdwF
 2Wk7ChT8O9A8=
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
Acked-by: Danilo Krummrich <dakr@kernel.org>
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

