Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 207AC7D6E9D
	for <lists+dri-devel@lfdr.de>; Wed, 25 Oct 2023 16:24:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96DE010E673;
	Wed, 25 Oct 2023 14:24:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81AAC10E67A
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Oct 2023 14:24:48 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 4FCA8CE0FA7;
 Wed, 25 Oct 2023 14:24:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28C44C433C8;
 Wed, 25 Oct 2023 14:24:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1698243885;
 bh=k4qfWmoSlQtmGzw1dNMXq2Z6+HR3qSHig+0Qow3Wq5E=;
 h=From:To:Cc:Subject:Date:From;
 b=sfUFZC1METOB0WMrjsp+ioDq4fLDozNK0Yy2y1LCz244aWMV0n0UOeXBfkKGUArDi
 Hl9B2Sm8ch/It5fz/+LggRVgtrzF1s/LZSXBHgd4mAzd83yaPVBGr/McUJ+ERupHP/
 r495p7M+oy/jUqmuIqtZUe3eZ4WWXUVRYYArirRwvq88UoVf2BvXHxAdr85zKO704+
 c7pwMe84VcBXZNBA/sLmQHi6ML5IjTIGJu41xfLeRfK47yjECCzOCrahiXKA9wfXZI
 Vg/R2vte4rPVdYxS/ogZmyZfOf9TxdFcXM0o5/zv8Ur94ehQ/V6FM3d3asxx5SvznA
 btPElCjkoKIbg==
From: Maxime Ripard <mripard@kernel.org>
To: Daniel Vetter <daniel.vetter@intel.com>,
	David Airlie <airlied@linux.ie>
Subject: [PATCH v2] drm/doc: ci: Require more context for flaky tests
Date: Wed, 25 Oct 2023 16:24:41 +0200
Message-ID: <20231025142441.745947-1-mripard@kernel.org>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Helen Koike <helen.koike@collabora.com>, Maxime Ripard <mripard@kernel.org>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Flaky tests can be very difficult to reproduce after the facts, which
will make it even harder to ever fix.

Let's document the metadata we agreed on to provide more context to
anyone trying to address these fixes.

Link: https://lore.kernel.org/dri-devel/CAPj87rPbJ1V1-R7WMTHkDat2A4nwSd61Df9mdGH2PR=ZzxaU=Q@mail.gmail.com/
Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Signed-off-by: Maxime Ripard <mripard@kernel.org>

---
Cc: Helen Koike <helen.koike@collabora.com>

Changes from v1:
- Rephrase the sentence a bit to make it clearer we expect a bug report
  by mail
---
 Documentation/gpu/automated_testing.rst | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/Documentation/gpu/automated_testing.rst b/Documentation/gpu/automated_testing.rst
index 469b6fb65c30..792428a2bfdc 100644
--- a/Documentation/gpu/automated_testing.rst
+++ b/Documentation/gpu/automated_testing.rst
@@ -67,6 +67,19 @@ Lists the tests that for a given driver on a specific hardware revision are
 known to behave unreliably. These tests won't cause a job to fail regardless of
 the result. They will still be run.
 
+Each new flake entry must be associated with a link to the email reporting the
+bug to the author of the affected driver, the board name or Device Tree name of
+the board, the first kernel version affected, and an approximation of the
+failure rate.
+
+They should be provided under the following format::
+
+  # Bug Report: $LORE_OR_PATCHWORK_URL
+  # Board Name: broken-board.dtb
+  # Version: 6.6-rc1
+  # Failure Rate: 100
+  flaky-test
+
 drivers/gpu/drm/ci/${DRIVER_NAME}-${HW_REVISION}-skips.txt
 -----------------------------------------------------------
 
-- 
2.41.0

