Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C041DA7F65F
	for <lists+dri-devel@lfdr.de>; Tue,  8 Apr 2025 09:34:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EA0F10E5ED;
	Tue,  8 Apr 2025 07:34:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="l32bkCa5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AB2410E5ED
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Apr 2025 07:34:25 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id F2174614B5;
 Tue,  8 Apr 2025 07:34:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15A4CC4CEE5;
 Tue,  8 Apr 2025 07:34:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1744097661;
 bh=Zl3LPcELDG4OvrmoqTxX2SKQlTw564P2q2lDBK8RW8g=;
 h=From:Subject:Date:To:Cc:From;
 b=l32bkCa5TKp1zZpVmNzD1mn6Lm9n7ZosdIf/cj4bUa6i9uaZEzd+fzLvgBgrQpGZu
 WQoy4vKnzFUrp4jab8EC/cb+9uQj8Xcr+ry8g9HZR/L2isCBwBdtPUILVa8QBtyFbw
 lNeescCzjDDWxg4TfdtU3qB29rXF7oeuAw9fgDRMFPqSBQWFAe4lbi5IwRGGEoGVEd
 WolnpNuSLG/7+8lnS1daVoVCRY+QUkWAN3zM8OcftoPGqCzdvrvD2DhBWlDZ2mkl5w
 oi0x60FCWVA8tY6dFbn+dx06q+ktQj/LDFY9sZNv0ccGlZEgGP3CSHYNDCHlBEo+Lk
 feW2pxZUH7Q7w==
From: Maxime Ripard <mripard@kernel.org>
Subject: [PATCH 0/7] drm/tests: Fix drm_display_mode memory leaks
Date: Tue, 08 Apr 2025 09:34:06 +0200
Message-Id: <20250408-drm-kunit-drm-display-mode-memleak-v1-0-996305a2e75a@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAG7R9GcC/x2NwQqDMBAFf0X23IWoUWx/pfQQ3FddNFGStijiv
 zd4m7nMHJQQFYkexUERP026hCzlraB+dGEAq2SnylSNsaZjiZ6nb9DPRaJpnd3OfhGwh5/hJrZ
 3MU1d275sQTm0Rrx1uybP13n+AZi0/Nl0AAAA
X-Change-ID: 20250408-drm-kunit-drm-display-mode-memleak-49d05334c16e
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: Philipp Stanner <phasta@mailbox.org>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1319; i=mripard@kernel.org;
 h=from:subject:message-id; bh=Zl3LPcELDG4OvrmoqTxX2SKQlTw564P2q2lDBK8RW8g=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDOlfLpaez3DceSxnymWu1d+73+37m/XtdeGrCarNc8JMT
 8g/NFNz6ihlYRDjYpAVU2SJETZfEndq1utONr55MHNYmUCGMHBxCsBEghwY/orkG8QWmfNoMUib
 ezDz5ugo3DzUoDDxhMqiok+9b+bKbmT4H3fkbffljewPJlpyLMnu8Jt0c9GZkq6+VT5XbJcsla0
 uYQYA
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
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

Hi,

Here's a series that fixes some memory leaks in our kunit tests that
eventually show up in kmemleak.

Let me know what you think,
Maxime

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
Maxime Ripard (7):
      drm/tests: helpers: Create kunit helper to destroy a drm_display_mode
      drm/tests: modeset: Fix drm_display_mode memory leak
      drm/tests: modeset: Fix drm_display_mode memory leak
      drm/tests: cmdline: Fix drm_display_mode memory leak
      drm/tests: modes: Fix drm_display_mode memory leak
      drm/tests: modes: Fix drm_display_mode memory leak
      drm/tests: probe-helper: Fix drm_display_mode memory leak

 drivers/gpu/drm/tests/drm_client_modeset_test.c |  9 ++++++++-
 drivers/gpu/drm/tests/drm_cmdline_parser_test.c | 10 +++++++++-
 drivers/gpu/drm/tests/drm_kunit_helpers.c       | 23 ++++++++++++++++++++++
 drivers/gpu/drm/tests/drm_modes_test.c          | 26 +++++++++++++++++++++++++
 drivers/gpu/drm/tests/drm_probe_helper_test.c   |  8 +++++++-
 include/drm/drm_kunit_helpers.h                 |  3 +++
 6 files changed, 76 insertions(+), 3 deletions(-)
---
base-commit: 0af2f6be1b4281385b618cb86ad946eded089ac8
change-id: 20250408-drm-kunit-drm-display-mode-memleak-49d05334c16e

Best regards,
-- 
Maxime Ripard <mripard@kernel.org>

