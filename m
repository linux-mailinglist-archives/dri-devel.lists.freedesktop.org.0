Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 834D5A770DB
	for <lists+dri-devel@lfdr.de>; Tue,  1 Apr 2025 00:26:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55B9010E4AE;
	Mon, 31 Mar 2025 22:26:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="gXpGPt0T";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4556910E20F
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Mar 2025 22:26:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1743459969;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=H/jpW2BEwJU2pLfB4Wx9wSH+N5MVmLI78aVsOX9iIlQ=;
 b=gXpGPt0TRtTqG6ffe4llPAUnF5yohX37FoJLNSTU/Rxr012iP+TtDlovPXn8nsyaR01Jqg
 lCdmcVOYqoUiaJEtsWHEgl4yHTad/65EDCH+a96YSyD0p8JfBT8DMM6T4XaIJqaRBH0pnZ
 JiOg3O1nP/ORe+86q0GFSUFhttS2lVY=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-643-4T6zkkQCNK-vzc3FpngeHg-1; Mon,
 31 Mar 2025 18:26:05 -0400
X-MC-Unique: 4T6zkkQCNK-vzc3FpngeHg-1
X-Mimecast-MFC-AGG-ID: 4T6zkkQCNK-vzc3FpngeHg_1743459964
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 8A92819560B7; Mon, 31 Mar 2025 22:26:03 +0000 (UTC)
Received: from chopper.lyude.net (unknown [10.22.80.91])
 by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id A07B31955D81; Mon, 31 Mar 2025 22:25:59 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: Maxime Ripard <mripard@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 rust-for-linux@vger.kernel.org (open list:RUST:Keyword:\b(?i:rust)\b)
Subject: [PATCH v2 0/2] drm: Make some resolution info unsigned
Date: Mon, 31 Mar 2025 18:23:53 -0400
Message-ID: <20250331222556.454334-1-lyude@redhat.com>
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

During the review of some of my patches for KMS bindings in Rust, it was
pointed out we have some areas of DRM that are storing resolutions as
signed integers when it doesn't really make sense. Since Rust has
arithematic overflow checking by default in the kernel, let's change
these to unsigned so that we can take advantage of that.

Lyude Paul (2):
  drm/edid: Use unsigned int in drm_add_modes_noedid()
  drm/mode_config: Make drm_mode_config.(max|min)_(width|height)
    unsigned

 drivers/gpu/drm/drm_edid.c    | 10 ++--------
 include/drm/drm_edid.h        |  2 +-
 include/drm/drm_mode_config.h |  4 ++--
 3 files changed, 5 insertions(+), 11 deletions(-)


base-commit: cf05922d63e2ae6a9b1b52ff5236a44c3b29f78c
-- 
2.48.1

