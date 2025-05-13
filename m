Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6D14AB5F16
	for <lists+dri-devel@lfdr.de>; Wed, 14 May 2025 00:11:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FC4E10E21D;
	Tue, 13 May 2025 22:11:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="BreR2zRy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B60310E21D
 for <dri-devel@lists.freedesktop.org>; Tue, 13 May 2025 22:10:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1747174257;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=krgNrZ/Wy74kF8svV+fyng82D9y6ygP3k3iqkRT5JuU=;
 b=BreR2zRy9hoGz1yuFiYxLuHPHeWbgYM+0jn7fCrTPK2+cSsGz/8D68yPvB7RAsmjWFSMh3
 bhtiQJRVRrfm8zoMhr20pne4ze2+ZrAk99q6jjv97LsFasV6AdhDRuATOGP9E+nz3j5jL2
 XPvgyfof3x0EOetkqUCSqTyzVe3WMBA=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-561-Qm-M3LRqOT2H8n12mOcH0Q-1; Tue,
 13 May 2025 18:10:54 -0400
X-MC-Unique: Qm-M3LRqOT2H8n12mOcH0Q-1
X-Mimecast-MFC-AGG-ID: Qm-M3LRqOT2H8n12mOcH0Q_1747174252
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 3D72C19560AE; Tue, 13 May 2025 22:10:52 +0000 (UTC)
Received: from chopper.lyude.net (unknown [10.22.64.99])
 by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 2E14F1944A82; Tue, 13 May 2025 22:10:48 +0000 (UTC)
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
Subject: [PATCH v2 0/4] drm: Rust GEM bindings cleanup
Date: Tue, 13 May 2025 18:09:53 -0400
Message-ID: <20250513221046.903358-1-lyude@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
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

Just some patches to fix a handful of minor issues, some of which were already
mentioned on the mailing list. Some of these patches also make it just a
little bit easier to add the shmem bindings from Asahi in the future.

This patch series applies on top of dakr's nova-next branch:
  https://gitlab.freedesktop.org/drm/nova/-/tree/nova-next

Lyude Paul (4):
  rust: drm: gem: Use NonNull for Object::dev
  rust: drm: gem: Refactor IntoGEMObject::from_gem_obj() to as_ref()
  rust: drm: gem: s/into_gem_obj()/as_raw()/
  rust: drm: gem: Implement AlwaysRefCounted for all gem objects
    automatically

 rust/kernel/drm/gem/mod.rs | 147 ++++++++++++++++++++-----------------
 1 file changed, 78 insertions(+), 69 deletions(-)


base-commit: 61479ae38cb7bf6083de302598b7d491ec54168a
-- 
2.49.0

