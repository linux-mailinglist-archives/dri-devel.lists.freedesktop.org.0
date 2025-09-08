Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DB20B49CB1
	for <lists+dri-devel@lfdr.de>; Tue,  9 Sep 2025 00:07:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 908E210E296;
	Mon,  8 Sep 2025 22:07:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="dej9KWEk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B578310E296
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Sep 2025 22:07:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1757369228;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=JkoTyeNf/GPBdyB+JgS1FXgnD5G8Br7KbPR2/Egwx+w=;
 b=dej9KWEk/WAAi9wj+fi5OgTdb5OQMReZOKuYzhy/l93rcinxoqQ3zWDOQ8MyHcsxkLXBHC
 MFGSYxokIlgRZVqu7k8wMDLDrFP3IjsxT6H3L4PSHzinMlHOCsLea3nLVei/LI7m25tsPA
 AB1XiCQhwbaV8rrZD0Wsg9XXOqhe/uw=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-195-Mvf5fWX7O8KXB7tTI2FKdQ-1; Mon,
 08 Sep 2025 18:07:05 -0400
X-MC-Unique: Mvf5fWX7O8KXB7tTI2FKdQ-1
X-Mimecast-MFC-AGG-ID: Mvf5fWX7O8KXB7tTI2FKdQ_1757369223
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id C8702195608C; Mon,  8 Sep 2025 22:07:02 +0000 (UTC)
Received: from chopper.redhat.com (unknown [10.22.64.41])
 by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 80E871800452; Mon,  8 Sep 2025 22:06:59 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH 0/2] rust/drm: Remove blanket AlwaysRefCounted impl for gem
Date: Mon,  8 Sep 2025 18:04:43 -0400
Message-ID: <20250908220657.165715-1-lyude@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
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

This patch series simply drops an blanket implementation of
AlwaysRefCounted for gem objects, which would cause issues if any other
additional blanket implementations of AlwaysRefCounted were present
within the same rust crate. While we're at it, we also introduce a macro
in lieu of being able to use a blanket implementation.

Lyude Paul (2):
  Partially revert "rust: drm: gem: Implement AlwaysRefCounted for all
    gem objects automatically"
  rust/drm: Add gem::impl_aref_for_gem_obj!

 rust/kernel/drm/gem/mod.rs | 59 +++++++++++++++++++++++++-------------
 1 file changed, 39 insertions(+), 20 deletions(-)


base-commit: 6b35936f058d0cb9171c7be1424b62017b874913
-- 
2.51.0

