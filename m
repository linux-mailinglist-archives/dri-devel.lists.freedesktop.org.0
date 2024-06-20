Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 318DA91062C
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jun 2024 15:35:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D6D610E9E3;
	Thu, 20 Jun 2024 13:35:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="s0QPHnFs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BEA610E9E3
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jun 2024 13:35:45 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 39AA7CE2647;
 Thu, 20 Jun 2024 13:35:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3AD8DC2BD10;
 Thu, 20 Jun 2024 13:35:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1718890540;
 bh=TcCdFXNutd9vkhZivMLUt3IerlG76eCFBxi4Ss2LB/k=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=s0QPHnFs4+6HMUO/Uo1yZ9tZxMr6n9iZyoUwI70++eCYUpildMPNuWExEAFoAPKSg
 7Uu8ZV1APaIYLHdcivEzue5p/+p6tiisYbzfUf2F/AC46MH3CHroObeUcxbOl5cwsr
 Ka67P15Wu/oJWxkgdgQfnYORURs3VJzXnE6BkAng3y6Uup8CjQNCTQAm6RFVBmpf9I
 yyKoQ+C+RfU6FoxsMZJK6Zrc19OaP8oSaFL5hYatywitCuCB0LxCN3sFmWO0Nbi3Av
 qPqIu0Vqox5pBYVUGeMKV7ZqB3xjvZ+ODA43W15hL1ZdiqytrYoLZqX07gcXRrIQer
 QniA2f0m2vV0A==
From: Maxime Ripard <mripard@kernel.org>
To: dri-devel@lists.freedesktop.org
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Maxime Ripard <mripard@kernel.org>,
 Javier Martinez Canillas <javierm@redhat.com>
Subject: [PATCH v2 3/3] drm/todo: Add TODO entry for "lints"
Date: Thu, 20 Jun 2024 15:35:31 +0200
Message-ID: <20240620133531.3954622-3-mripard@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240620133531.3954622-1-mripard@kernel.org>
References: <20240620133531.3954622-1-mripard@kernel.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Having lints would prove beneficial to prevent the same dark patterns
from reoccuring over and over again in drivers.

Add a TODO entry for that.

Signed-off-by: Maxime Ripard <mripard@kernel.org>

---

Changes from v1:
 - Add allow_modeset and cec phys address handling
---
 Documentation/gpu/todo.rst | 34 ++++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
index 030ef6bec82a..9e0e2df3a59a 100644
--- a/Documentation/gpu/todo.rst
+++ b/Documentation/gpu/todo.rst
@@ -724,10 +724,44 @@ doesn't or document it if it does would be of great help.
 
 Contact: Maxime Ripard <mripard@kernel.org>
 
 Level: Intermediate
 
+Create lints for KMS drivers
+----------------------------
+
+Over time, we've accumulated a list of dark patterns in KMS drivers that
+should be avoided. However, none of them are published anywhere, and not
+all reviewers are aware of them. It creates a situation where we have
+more drivers with problematic / deprecated code, even though we know
+that they shouldn't.
+
+We should create a set of coccinelle scripts that match these patterns,
+and make new drivers run that list. And possibly integrate them in CI.
+
+These patterns include:
+
+  - Drivers using kzalloc() or devm_kzalloc() to allocate their memory,
+    instead of drmm_kzalloc().
+
+  - Drivers not protecting their device resources (MMIO, clocks,
+    regulators, etc.) by drm_dev_enter() and drm_dev_exit().
+
+  - Drivers using drm_dev_unregister() instead of drm_dev_unplug().
+
+  - Drivers not calling drm_atomic_helper_shutdown() at shutdown
+
+  - Drivers using drm_dp_cec_set_edid(), cec_get_edid_phys_addr(), or
+    cec_s_phys_addr_from_edid() instead of drm_dp_cec_attach() or
+    cec_s_phys_addr().
+
+  - Drivers setting drm_atomic_state->allow_modeset manually.
+
+Contact: Maxime Ripard <mripard@kernel.org>
+
+Level: Intermediate
+
 Enable trinity for DRM
 ----------------------
 
 And fix up the fallout. Should be really interesting ...
 
-- 
2.45.2

