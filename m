Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A3D8A6761E
	for <lists+dri-devel@lfdr.de>; Tue, 18 Mar 2025 15:17:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2245410E48B;
	Tue, 18 Mar 2025 14:17:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ifRv6Di8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DA0010E48B
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Mar 2025 14:17:43 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 209E25C4DB7;
 Tue, 18 Mar 2025 14:15:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D22CC4CEDD;
 Tue, 18 Mar 2025 14:17:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1742307462;
 bh=9GhsrLULgaBmV5CiLPjez8oF/aN0WlSsAJSDEcI+Qb0=;
 h=From:Subject:Date:To:Cc:From;
 b=ifRv6Di8nFchAv5fgaTdDdZ4iUL5/v+aUlnZIuwRFUD4Kgk5SW8Up1fLwG5/e25jW
 fQROWA3attN9A3xpL1kxMJeLdurh/begJoVzEx2jR+3Qvykx5JMfUzc+cQLT9/uIQ0
 WDzYZMHG3tbdlLuACkjUZnUuooj8yuNg7S8hRrHiXygOzFAjT1UpnFnmuKX8V8coii
 uAoIFnfA1k8QvoiERmxvzkP+2er3HazJV7DlHz0VNMmHrXKcfd3dge+5I332tYsieb
 tvQIC8MF00pf1ne1/yPVNTcqb+6TKraLkPNFOunV5RPtpyKGpi16T4R7Uk5Wl6RNp5
 C7PjTgCddWhHA==
From: Maxime Ripard <mripard@kernel.org>
Subject: [PATCH 0/4] drm/vc4: tests: Fix locking failures
Date: Tue, 18 Mar 2025 15:17:36 +0100
Message-Id: <20250318-drm-vc4-kunit-failures-v1-0-779864d9ab37@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAICA2WcC/x3MQQ5AMBBA0avIrE2iWiGuIhZVgwlKpohE3F1j+
 Rb/PxBImALUyQNCFwfefIRKE3CT9SMh99GQZ3mRaVVhLytezuB8ej5wsLycQgG10p0py8IZXUG
 Md6GB73/ctO/7Ad/d6ENoAAAA
X-Change-ID: 20250318-drm-vc4-kunit-failures-313b4775c438
To: Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Maxime Ripard <mripard@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=865; i=mripard@kernel.org;
 h=from:subject:message-id; bh=9GhsrLULgaBmV5CiLPjez8oF/aN0WlSsAJSDEcI+Qb0=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDOk3GxpLOz7dK7aNv72Nvb/71QvZb6+8U70uZ8lPMWiMP
 LN+ZcS7jqksDMKcDLJiiixPZMJOL29fXOVgv/IHzBxWJpAhDFycAjAR462MDXN2Lp95f/45rjml
 PS/4nv89c/x74ItrTwo5wt2i+gp+OzOdbP6XpNnC9padp/gve3GaJmOd3YXzwfPfMVmvfVgrJOA
 fdz98q9TBHTwbEo52yE5X9lnV0hq22f/6/f6THSLeFqZCTxYAAA==
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

This series deals with (lack of) EDEADLK handling in vc4 PV muxing
tests.

This was leading to failures with CONFIG_DEBUG_WW_MUTEX_SLOWPATH
enabled.

Maxime

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
Maxime Ripard (4):
      drm/vc4: tests: Use return instead of assert
      drm/vc4: tests: Document output handling functions
      drm/vc4: tests: Stop allocating the state in test init
      drm/vc4: tests: Retry pv-muxing tests when EDEADLK

 drivers/gpu/drm/vc4/tests/vc4_mock_output.c    | 62 +++++++++++++++----
 drivers/gpu/drm/vc4/tests/vc4_test_pv_muxing.c | 85 +++++++++++++++++++++-----
 2 files changed, 121 insertions(+), 26 deletions(-)
---
base-commit: c0988d693eb10e115d95747f8a0cccc83babb3fc
change-id: 20250318-drm-vc4-kunit-failures-313b4775c438

Best regards,
-- 
Maxime Ripard <mripard@kernel.org>

