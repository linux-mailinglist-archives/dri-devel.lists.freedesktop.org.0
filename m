Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0180FABE4C8
	for <lists+dri-devel@lfdr.de>; Tue, 20 May 2025 22:36:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BCB910E04A;
	Tue, 20 May 2025 20:35:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="hE9MMpv9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBF0510E04A
 for <dri-devel@lists.freedesktop.org>; Tue, 20 May 2025 20:35:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1747773354;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=NO8oGu6BBzAIRzurOJsErK2DO6TkffZnW5F3dfhXfcg=;
 b=hE9MMpv91BpKyRvQi9T755I9tRcKA46ptDoFG4vLJ1/4S6YZYQHR3JX8yzSxILBk6WJcZ2
 jUYlNy17WULIb4teUeumi3/VdUh7Ow0sNxmHojVcQ0WCATcPMSemQWpPKtkS7ZbxgMU2AL
 eCvNx0xVTkosA+sag7AToo1Gr9c7KSk=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-594-67tb9bU-Mt2jMzkEZR9Xxg-1; Tue,
 20 May 2025 16:35:51 -0400
X-MC-Unique: 67tb9bU-Mt2jMzkEZR9Xxg-1
X-Mimecast-MFC-AGG-ID: 67tb9bU-Mt2jMzkEZR9Xxg_1747773349
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 4B1E1195608A; Tue, 20 May 2025 20:35:49 +0000 (UTC)
Received: from chopper.redhat.com (unknown [10.22.64.128])
 by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 5545C19560AD; Tue, 20 May 2025 20:35:46 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH v4 0/4] rust: drm: gem: More (and final) cleanup
Date: Tue, 20 May 2025 16:35:26 -0400
Message-ID: <20250520203542.1391548-1-lyude@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
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

Look mom, no generic soup!

Anyway - this is just the last of the cleanup stuff I ended up while
working on cleaning up the gem shmem patch series. It:

* Simplifies the use of generics
* Adds a type alias for some very long type names
* Moves stuff around to enable a feature Asahi originally intended to
  support with these bindings - driver private gem objects.

Applies on top of nova/nova-next:
  https://gitlab.freedesktop.org/drm/nova/-/tree/nova-next

Lyude Paul (4):
  rust: drm: gem: Simplify use of generics
  rust: drm: gem: Add DriverFile type alias
  rust: drm: gem: Drop Object::SIZE
  rust: drm: gem: Support driver-private GEM object types

 drivers/gpu/drm/nova/driver.rs |   4 +-
 drivers/gpu/drm/nova/gem.rs    |   9 ++-
 rust/kernel/drm/device.rs      |  17 ++---
 rust/kernel/drm/driver.rs      |   5 +-
 rust/kernel/drm/gem/mod.rs     | 110 ++++++++++++++++-----------------
 5 files changed, 72 insertions(+), 73 deletions(-)


base-commit: 276c53c66e032c8e7cc0da63555f2742eb1afd69
-- 
2.49.0

