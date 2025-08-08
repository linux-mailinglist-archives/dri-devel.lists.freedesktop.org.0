Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C3153B20013
	for <lists+dri-devel@lfdr.de>; Mon, 11 Aug 2025 09:13:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E174410E2F6;
	Mon, 11 Aug 2025 07:12:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=listout.xyz header.i=@listout.xyz header.b="uPEC8Jde";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C275010E1FC;
 Fri,  8 Aug 2025 22:59:59 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4bzK7844GJz9t1G;
 Sat,  9 Aug 2025 00:52:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=listout.xyz; s=MBO0001;
 t=1754693572;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AoCzKBpu2Jxv88ZyAsLhizqpgOm2OwFBGMZsZf5hDwE=;
 b=uPEC8JdeN0SNqQ3gpVTiIErKBXBs2SmifNB8pZGIWWaf3ergxltAGu6QKwJeVgNwgl/3LE
 X+RMZ7IQdJ50YPHqkOUefJvFYjx4nK7Kv7VLr3mq/zU2h8WPXmSTb6xhPqHDilajC6Fjrk
 LUOgJdP/KC+0eXW9zMwHC0S1eyAK8L8khaPSGTKSpYWJ6xVYm31bvv3XeweHhJAWCa3/bU
 64JXOLFUlpbiaQ1UJ9XG2lpo9RqPg8WvqJ7xbgD5xcwuDmIf27iY8T8/AuFpcy/3LUuMby
 RZo553NmIGIGJ3MJZHQT47b6y20CsxCyjPPle645Ab1IyU/SZjkacyy9J71Kjw==
From: Brahmajit Das <listout@listout.xyz>
To: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-next@vger.kernel.org
Cc: jani.nikula@linux.intel.com, rodrigo.vivi@intel.com,
 joonas.lahtinen@linux.intel.com, tursulin@ursulin.net, simona@ffwll.ch
Subject: [RFC PATCH 2/2] drm/i915: use new debugfs device-centered functions
Date: Sat,  9 Aug 2025 04:22:26 +0530
Message-ID: <20250808225226.30465-3-listout@listout.xyz>
In-Reply-To: <20250808225226.30465-1-listout@listout.xyz>
References: <20250808225226.30465-1-listout@listout.xyz>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 11 Aug 2025 07:12:55 +0000
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

Replace the use of drm_debugfs_create_files() with the new
drm_debugfs_add_files() function, which centers the debugfs files
management on the drm_device instead of drm_minor.

Signed-off-by: Brahmajit Das <listout@listout.xyz>
---
 drivers/gpu/drm/i915/display/intel_display_debugfs.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_debugfs.c b/drivers/gpu/drm/i915/display/intel_display_debugfs.c
index ce3f9810c42d..92db369f1b94 100644
--- a/drivers/gpu/drm/i915/display/intel_display_debugfs.c
+++ b/drivers/gpu/drm/i915/display/intel_display_debugfs.c
@@ -805,7 +805,7 @@ static const struct file_operations i915_fifo_underrun_reset_ops = {
 	.llseek = default_llseek,
 };
 
-static const struct drm_info_list intel_display_debugfs_list[] = {
+static const struct drm_debugfs_info intel_display_debugfs_list[] = {
 	{"intel_display_caps", intel_display_caps, 0},
 	{"i915_frontbuffer_tracking", i915_frontbuffer_tracking, 0},
 	{"i915_sr_status", i915_sr_status, 0},
@@ -825,9 +825,8 @@ void intel_display_debugfs_register(struct intel_display *display)
 	debugfs_create_file("i915_fifo_underrun_reset", 0644, minor->debugfs_root,
 			    display, &i915_fifo_underrun_reset_ops);
 
-	drm_debugfs_create_files(intel_display_debugfs_list,
-				 ARRAY_SIZE(intel_display_debugfs_list),
-				 minor->debugfs_root, minor);
+	drm_debugfs_add_files(minor->dev, intel_display_debugfs_list,
+			      ARRAY_SIZE(intel_display_debugfs_list));
 
 	intel_bios_debugfs_register(display);
 	intel_cdclk_debugfs_register(display);
-- 
2.50.1

