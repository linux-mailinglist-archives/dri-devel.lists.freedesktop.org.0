Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3A2991062B
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jun 2024 15:35:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC75810E9E2;
	Thu, 20 Jun 2024 13:35:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="V/7JrKn3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 697AD10E9E2
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jun 2024 13:35:38 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id E0C4162158;
 Thu, 20 Jun 2024 13:35:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FEFFC32786;
 Thu, 20 Jun 2024 13:35:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1718890537;
 bh=+UjIaT0G77GuW93//+8Wq+imdQChxkcK9dBuNQJjFB8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=V/7JrKn3fuCIe+/ukc1k6Wu4v9cD6YBUqkU6ce+PD7TQxh9aAtBERAqrO5V7rB2+r
 EPPcJrS0Gt0orp2Mr0VX77wmg++j7ZV9NqagVmIUImiBki0jR5QhzOnCWHlu0ywNZU
 Cmz5BYUsH/usonN1KxRhgPQ66UP5u6jLMkh8GtYvumfUGi6sJPZIEQx1IHjVDdjJ7D
 AoI0JZaMUDZvOft2ltm6WsBvD763Q3mYWtxIWzzH7coH080WL6zAEsxN4x2j1KQRij
 t4jqKddN6ugCD59Eag9CnXK5kCfCBVZMOMqXihnzvnqTUV+b3RnUA+ZyM8z1IHgnXH
 4kzGDpc9aneVA==
From: Maxime Ripard <mripard@kernel.org>
To: dri-devel@lists.freedesktop.org
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Maxime Ripard <mripard@kernel.org>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v2 2/3] drm/todo: Create a TODO item for MIPI-DSI rework
Date: Thu, 20 Jun 2024 15:35:30 +0200
Message-ID: <20240620133531.3954622-2-mripard@kernel.org>
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

The MIPI-DSI infrastructure and setup we have so far is limited and
doesn't provide a good way to address some corner-cases.

Add a TODO entry to document what is needed.

Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 Documentation/gpu/todo.rst | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
index 3104ffbd6295..030ef6bec82a 100644
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

