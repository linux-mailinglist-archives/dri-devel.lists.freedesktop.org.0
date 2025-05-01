Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43DB5AA62ED
	for <lists+dri-devel@lfdr.de>; Thu,  1 May 2025 20:37:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C412010E87E;
	Thu,  1 May 2025 18:37:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="RiM6WGCm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17ABB10E87E
 for <dri-devel@lists.freedesktop.org>; Thu,  1 May 2025 18:37:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1746124654;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=zY/y5cuq+QzWFVJKdbHLdKnpZh6l9uuVIW68BDziQX4=;
 b=RiM6WGCm5OSB/X2I/zBZFOqpSJ9CNt+ZUxiig4S2HQRe7zBQleTME5uldN9jwu20RKOeUs
 doLZSnRLPOcPScgNvOTAL2xCKXm60wPCIrXeG7pfqQBOO91vaC62AVYkdhFwXVmgAh4Fex
 djAMqCVZJUIZ7nIoITy1fYvdAj8XkPY=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-395-kR0NwullNzy9ZxuJq6cPiw-1; Thu,
 01 May 2025 14:37:28 -0400
X-MC-Unique: kR0NwullNzy9ZxuJq6cPiw-1
X-Mimecast-MFC-AGG-ID: kR0NwullNzy9ZxuJq6cPiw_1746124646
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 0724C19560BC; Thu,  1 May 2025 18:37:26 +0000 (UTC)
Received: from chopper.redhat.com (unknown [10.22.88.132])
 by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 903C21800115; Thu,  1 May 2025 18:37:22 +0000 (UTC)
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
Subject: [PATCH 0/4] drm: Rust GEM bindings cleanup
Date: Thu,  1 May 2025 14:33:15 -0400
Message-ID: <20250501183717.2058109-1-lyude@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
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
  rust: drm: gem: s/into_gem_obj()/as_gem_obj()/
  rust: drm: gem: Implement AlwaysRefCounted for all gem objects
    automatically

 rust/kernel/drm/gem/mod.rs | 141 ++++++++++++++++++++-----------------
 1 file changed, 76 insertions(+), 65 deletions(-)


base-commit: 3be746ebc1e6e32f499a65afe405df9030153a63
-- 
2.48.1

