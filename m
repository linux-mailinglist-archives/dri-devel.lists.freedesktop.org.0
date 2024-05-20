Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4D0F8CA134
	for <lists+dri-devel@lfdr.de>; Mon, 20 May 2024 19:21:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C373C10E5CE;
	Mon, 20 May 2024 17:21:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="hGp8eIZB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E61810E524
 for <dri-devel@lists.freedesktop.org>; Mon, 20 May 2024 17:21:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1716225683;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kKS6qhSk55pRZeAXjj0u08eGqfwnnqmzVscIpFm2Jrw=;
 b=hGp8eIZBxdmOFZ4oNKZKyzAbyWdxX6g/gDIPh0xZAEbDSyJoNwTdOdxcYjYxEJkdIJMzTZ
 myKbWhFy6DqZLm2wsLdqwILiW4Bs1Igl48nz1UvxJwdlkwlgPgAChKUg+2WofDEsCTzliF
 ysO8W+tPxnb6E3syhb7H9vpW4tQCeow=
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com
 [209.85.208.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-266-HBKo7QVxNym9hCwUUkPQwQ-1; Mon, 20 May 2024 13:21:22 -0400
X-MC-Unique: HBKo7QVxNym9hCwUUkPQwQ-1
Received: by mail-lj1-f198.google.com with SMTP id
 38308e7fff4ca-2e2ec0c8807so85737901fa.1
 for <dri-devel@lists.freedesktop.org>; Mon, 20 May 2024 10:21:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716225680; x=1716830480;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kKS6qhSk55pRZeAXjj0u08eGqfwnnqmzVscIpFm2Jrw=;
 b=CaFUrJFnNvdocECQC48hqFjPw0whI5lnU8F4ESPlwBYbGwWemKS3Xvb8uj/nShoIpf
 FzuxLJEig+6rtpStKLgpJfShZLUAfUu/hn48NzGPruvGwegVIuKThAYCuK2TNP2ad7bg
 lz5Wbbg9H4DfgO1Cy6OqHYYnan00TIX/LiPfZVgq4gAtBl255p6eDsbJ33Lj29UuG+Ye
 twXxetUKnVN55FRIZ1F5V2Cbg2mCrcOPcS8qTWVySJIu+iDn5FFPEj7LH5Nd7NLKpkSH
 nxaSKiDaU7l/rnRm+om0k+KOuik9WCWaEIylBqqaR5GPDdcpS+zrJ01PTAqsDpg4mxCE
 JZbQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVwFXWQbPUdfe1UKA6OaCWXpTCzU5aWGGOQEfztHMcwzleYu5o+X/XrO88wCU/erJ0CXDzViEwNkwCd+0q8nl+oIDh/vEHV6NLKMDEHVoJS
X-Gm-Message-State: AOJu0Yx2cBcjG+fYcbgFoSyiMpCRjf2XGUpDrI0BOlqY2tMiENA+cOTe
 pZCjVgTSjER1l0n49YxVybWM8DqUuBohMQTlArH2Uv3OJ+ThyCiq6lDgR7RcTUzYgqkzXjNw9Lo
 HAR9FJcC1MJNAX4qRzz0Ebw0sGn+j8YYFLYbvGtR2nTL2q2hrB7zbawzXVpYudTHq5w==
X-Received: by 2002:a2e:8794:0:b0:2d8:34ec:54e6 with SMTP id
 38308e7fff4ca-2e5204ccd8fmr175153711fa.33.1716225680738; 
 Mon, 20 May 2024 10:21:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IErF7q9FqAV3RyM+4sRTgS+83yJJodVaf9ir9uNQdpIiZzoq5t+t64rFKzgExXy9aAhHq+sdw==
X-Received: by 2002:a2e:8794:0:b0:2d8:34ec:54e6 with SMTP id
 38308e7fff4ca-2e5204ccd8fmr175153391fa.33.1716225680279; 
 Mon, 20 May 2024 10:21:20 -0700 (PDT)
Received: from cassiopeiae.. ([2a02:810d:4b3f:ee94:642:1aff:fe31:a19f])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42014c21260sm315868065e9.3.2024.05.20.10.21.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 May 2024 10:21:18 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, daniel@ffwll.ch, ojeda@kernel.org,
 alex.gaynor@gmail.com, wedsonaf@gmail.com, boqun.feng@gmail.com,
 gary@garyguo.net, bjorn3_gh@protonmail.com, benno.lossin@proton.me,
 a.hindborg@samsung.com, aliceryhl@google.com, fujita.tomonori@gmail.com,
 lina@asahilina.net, pstanner@redhat.com, ajanulgu@redhat.com,
 lyude@redhat.com, gregkh@linuxfoundation.org
Cc: rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, Danilo Krummrich <dakr@redhat.com>
Subject: [RFC PATCH 2/8] rust: Add a Sealed trait
Date: Mon, 20 May 2024 19:20:49 +0200
Message-ID: <20240520172059.181256-3-dakr@redhat.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240520172059.181256-1-dakr@redhat.com>
References: <20240520172059.181256-1-dakr@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
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

From: Asahi Lina <lina@asahilina.net>

Some traits exposed by the kernel crate may not be intended to be
implemented by downstream modules. Add a Sealed trait to allow avoiding
this using the sealed trait pattern.

Signed-off-by: Asahi Lina <lina@asahilina.net>
Signed-off-by: Danilo Krummrich <dakr@redhat.com>
---
 rust/kernel/lib.rs | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index cb0dd3d76729..6415968ee3b8 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -65,6 +65,11 @@
 #[doc(hidden)]
 pub use build_error::build_error;
 
+pub(crate) mod private {
+    #[allow(unreachable_pub)]
+    pub trait Sealed {}
+}
+
 /// Prefix to appear before log messages printed from within the `kernel` crate.
 const __LOG_PREFIX: &[u8] = b"rust_kernel\0";
 
-- 
2.45.1

