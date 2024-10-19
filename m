Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E55C9A4E0E
	for <lists+dri-devel@lfdr.de>; Sat, 19 Oct 2024 15:04:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90F2C10E1C6;
	Sat, 19 Oct 2024 13:04:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=wiredspace.de header.i=@wiredspace.de header.b="Vy+O6DGU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-179.mta1.migadu.com (out-179.mta1.migadu.com
 [95.215.58.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E40110E0FA
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Oct 2024 08:41:13 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiredspace.de;
 s=key1; t=1729327271;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=bbAs0TRfliKVT6GU9TEAPy0g/6tMD6uUNyQ5bBgcgz4=;
 b=Vy+O6DGU3TETIO1c+DK7b3WRhznZrucfviXFE9izV77hP7ZEQYbf3TTLkcEVCd6F3DGPGc
 mfr7VPWpXMJPVaTqQeEyE5nwUrMsz6dYL8KdA4DhibIf7rxcb06qYG0KXLZ38SV3cICsGr
 lVTz2nWa99Ao/ogvJqsQNk7VE9YZSH4=
From: =?UTF-8?q?Thomas=20B=C3=B6hler?= <witcher@wiredspace.de>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Jocelyn Falempe <jfalempe@redhat.com>
Cc: Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 rust-for-linux@vger.kernel.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 =?UTF-8?q?Thomas=20B=C3=B6hler?= <witcher@wiredspace.de>
Subject: [PATCH v2 0/7] Cleanup Clippy issues in drm_panic_qr.rs
Date: Sat, 19 Oct 2024 10:22:45 +0200
Message-ID: <20241019084048.22336-1-witcher@wiredspace.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Mailman-Approved-At: Sat, 19 Oct 2024 13:04:47 +0000
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

The file drivers/gpu/drm/drm_panic_qr.rs has some lints that Clippy
complains about. This series cleans them up by either allowing what is
written or conforming to what Clippy expects where it makes sense.

All explicitly allowed lints are marked with `#[expect(...)]`.

v1 -> v2:
- Add "Fixes" trailers and rename "Closes" to "Link" trailers as
  the patches all fix part of the issue.
- Replace `#[allow(...)]` with `#[expect(...)]`. Support for `expect` is
  already in rust-next, which is where this series will be merged into.

Thomas Böhler (7):
  drm/panic: avoid reimplementing Iterator::find
  drm/panic: remove unnecessary borrow in alignment_pattern
  drm/panic: prefer eliding lifetimes
  drm/panic: remove redundant field when assigning value
  drm/panic: correctly indent continuation of line in list item
  drm/panic: allow verbose boolean for clarity
  drm/panic: allow verbose version check

 drivers/gpu/drm/drm_panic_qr.rs | 23 ++++++++++++-----------
 1 file changed, 12 insertions(+), 11 deletions(-)

-- 
2.46.2

