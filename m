Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 926E3A70C03
	for <lists+dri-devel@lfdr.de>; Tue, 25 Mar 2025 22:28:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C804F10E2A1;
	Tue, 25 Mar 2025 21:28:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="SuzzHNzM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B648710E2A7
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Mar 2025 21:28:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1742938120;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=MsV2w/Rn5mfBpb+ogTXQ4dOfXGpaAgBdA4ur9xVQST4=;
 b=SuzzHNzM9+d+0aIpw68D8bO4ufIseFP/D/ZV0T5YoKVHNvMBLHsl9alL4+4t1YZwk8zZGj
 vEr9bKu9/qNOJN8AZqxj/JsXWLDfUuUaq7AcXpiCQYNEp8v5zfci27aNvgcDYNptm7ByCR
 4GfxkxQB4lHaGICnRyChWhPrVW7p92E=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-82-1Esz6RrROoSxfU32bi7beA-1; Tue,
 25 Mar 2025 17:28:37 -0400
X-MC-Unique: 1Esz6RrROoSxfU32bi7beA-1
X-Mimecast-MFC-AGG-ID: 1Esz6RrROoSxfU32bi7beA_1742938115
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 1160E19560BB; Tue, 25 Mar 2025 21:28:35 +0000 (UTC)
Received: from chopper.lyude.net (unknown [10.22.80.20])
 by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id C772819541A5; Tue, 25 Mar 2025 21:28:31 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: Maxime Ripard <mripard@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 rust-for-linux@vger.kernel.org (open list:RUST:Keyword:\b(?i:rust)\b)
Subject: [PATCH 0/2] drm: Make some resolution info unsigned
Date: Tue, 25 Mar 2025 17:27:03 -0400
Message-ID: <20250325212823.669459-1-lyude@redhat.com>
MIME-Version: 1.0
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

During the review of some of my patches for KMS bindings in Rust, it was
pointed out we have some areas of DRM that are storing resolutions as
signed integers when it doesn't really make sense. Since there's no real
usecase for this and it's a bit more obvious when writing rust code then
it is in C, let's fix this.

Lyude Paul (2):
  drm/edid: Use unsigned int in drm_add_modes_noedid()
  drm/mode_config: Make drm_mode_config.(max|min)_(width|height) signed

 drivers/gpu/drm/drm_edid.c    | 2 +-
 include/drm/drm_edid.h        | 2 +-
 include/drm/drm_mode_config.h | 4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)


base-commit: 5da39dce1fa3c81dc6552a16a9f748ba2980d630
-- 
2.48.1

