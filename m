Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F12E7A0B42D
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jan 2025 11:11:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 743A410E629;
	Mon, 13 Jan 2025 10:11:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="IGSsjyCH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C381610E629
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jan 2025 10:11:04 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 22E715C5254;
 Mon, 13 Jan 2025 10:10:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6022EC4CED6;
 Mon, 13 Jan 2025 10:11:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1736763063;
 bh=eLrlhbK5HqNb/pVfWsYAiOxGarpBfT8fG64k5WpMnrw=;
 h=From:To:Cc:Subject:Date:From;
 b=IGSsjyCHgD4JpMprmECGyG4y7fjVlt5+Apgprfai4TNav51Juzw5zfJ7m/Y0sh2Dh
 QSA3leGpD3fzEdAPaA0+28dRQ8i/W0j2BsyiyaOcycugO6S8d2wm8tQXgKgN5TqfC2
 jv4xI4vHpSijZwb+USxrvZAjVXytL/MYEVXioJRj34l/gYXMG5GmoKvALV/+HjOIBK
 Z6FiEBh9MpnboV939jlSgFx9aZFcq336tLPh60LvmlwTPuNehmg7HGdOCZH30j0D3l
 C4TG909JW5iOf3z9+AzfkjveNIITButPzjtAXWfFXhdPmbyQah87wU2JAiQLa+8dmq
 CeJPVsAHy8w7g==
From: Maxime Ripard <mripard@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>, Simona Vetter <simona.vetter@ffwll.ch>,
 David Airlie <airlied@gmail.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org,
 Jani Nikula <jani.nikula@intel.com>
Subject: [PATCH] drm/doc: Document KUnit expectations
Date: Mon, 13 Jan 2025 11:11:00 +0100
Message-ID: <20250113101100.1373856-1-mripard@kernel.org>
X-Mailer: git-send-email 2.47.1
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

The DRM and KMS frameworks and helpers gain more and more kunit
coverage, so let's document what our expectations are.

Suggested-by: Jani Nikula <jani.nikula@intel.com>
Signed-off-by: Maxime Ripard <mripard@kernel.org>

---

I'm not too sure where those guidelines should be placed. Is it the best
place?
---
 Documentation/gpu/drm-internals.rst | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/gpu/drm-internals.rst b/Documentation/gpu/drm-internals.rst
index cb9ae282771c..94f93fd3b8a0 100644
--- a/Documentation/gpu/drm-internals.rst
+++ b/Documentation/gpu/drm-internals.rst
@@ -206,10 +206,17 @@ follows:
 	The configuration included in ``.kunitconfig`` should be as generic as
 	possible.
 	``CONFIG_VIRTIO_UML`` and ``CONFIG_UML_PCI_OVER_VIRTIO`` are not
 	included in it because they are only required for User Mode Linux.
 
+KUnit Coverage Rules
+~~~~~~~~~~~~~~~~~~~~
+
+KUnit support is gradually added to the DRM framework and helpers. There's no
+general requirement for the framework and helpers to have KUnit tests at the
+moment. However, patches that are affecting a function or helper already
+covered by KUnit tests must provide tests if the change calls for one.
 
 Legacy Support Code
 ===================
 
 The section very briefly covers some of the old legacy support code
-- 
2.47.1

