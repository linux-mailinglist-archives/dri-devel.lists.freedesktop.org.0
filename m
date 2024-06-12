Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DE9A905541
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jun 2024 16:36:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C42C10E87F;
	Wed, 12 Jun 2024 14:36:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="unZ9u/A2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C1AC10E87F
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2024 14:36:01 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 41FDB6149A;
 Wed, 12 Jun 2024 14:36:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92AABC116B1;
 Wed, 12 Jun 2024 14:36:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1718202961;
 bh=E+6iiKAAyXlMtZ6T33s52aNTX7qMp5w1njSRTRjCFRY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=unZ9u/A2gAPxyG2gYGd5SCKrwH5hRc+cB66rkoGdLp+mScStcXUGd8PDCjtD+ef9P
 3314N1SX9tEKZU5rfIp03z2ZYUiIB20r2Dk+IAZ1aqFhEAoQirdk4uJX6ob0QQVTfO
 qiK6ehXaZ3LMVjxqGq9T+COzX5HSyg0/6FW1daPG+nrhLUYpXYPcOLjABwJDylj7YP
 M/t1xOdqiTSwsIwDfdXBxMbO48HYGJykWCob6b0+Aoc0JUvgluGBlTKO9P3ma1t2mp
 ntbcBRYqIbvUGcQGK7Q3kG+2A4iTt464YO+NUbzM0yeO+OTNi/7oMBn1ToUglM5yL+
 V7u5A/ObjgK6w==
From: Maxime Ripard <mripard@kernel.org>
To: dri-devel@lists.freedesktop.org
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Maxime Ripard <mripard@kernel.org>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH 2/3] drm/todo: Create a TODO item for MIPI-DSI rework
Date: Wed, 12 Jun 2024 16:35:52 +0200
Message-ID: <20240612143553.915966-2-mripard@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240612143553.915966-1-mripard@kernel.org>
References: <20240612143553.915966-1-mripard@kernel.org>
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

The MIPI-DSI infrastructure and setup we have so far is limited and
doesn't provide a good way to address some corner-cases.

Add a TODO entry to document what is needed.

Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 Documentation/gpu/todo.rst | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
index 52fd8672fb6d..94139c652663 100644
--- a/Documentation/gpu/todo.rst
+++ b/Documentation/gpu/todo.rst
@@ -633,10 +633,30 @@ long as that supports DMA. Otherwise importing can still needlessly fail.
 
 Contact: Thomas Zimmermann <tzimmermann@suse.de>, Daniel Vetter
 
 Level: Advanced
 
+Improve MIPI-DSI infrastructure
+-------------------------------
+
+The MIPI-DSI infrastructure in KMS supports MIPI-DSI devices in part
+through a dedicated bus (`drm_mipi_dsi.c`) and in part through ad-hoc
+calls in drivers, especially to handle the power state of the bus.
+
+This is an oddity as far as the device model is concerned, but is also
+an issue when multiple devices are chained (like bridges) and have
+different requirements.
+
+It would be a good idea to move all the power state handling out of KMS
+and into the bus support itself.
+
+See `[RFC PATCH 03/10] drm/mipi-dsi: add API for manual control over the DSI link power state <https://lore.kernel.org/dri-devel/20231016165355.1327217-4-dmitry.baryshkov@linaro.org/>`_
+
+Contact: Maxime Ripard <mripard@kernel.org>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
+
+Level: Advanced
+
 Improve HDMI Infrastructure
 ---------------------------
 
 We have a bunch of helpers to handle HDMI and reduce the boilerplate in
 drivers. Support so far includes HDMI 1.4 support, but we need to extend
-- 
2.45.2

