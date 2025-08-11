Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB7F1B21F97
	for <lists+dri-devel@lfdr.de>; Tue, 12 Aug 2025 09:33:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F80810E5AA;
	Tue, 12 Aug 2025 07:33:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=listout.xyz header.i=@listout.xyz header.b="sUyyJZ4z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35CF710E10E;
 Mon, 11 Aug 2025 13:17:27 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4c0wCm0ncgz9sWL;
 Mon, 11 Aug 2025 15:17:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=listout.xyz; s=MBO0001;
 t=1754918244;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+H2ZqlQ2Jh2MhyNBjLJU7iks+MBvU2kShwz8Ja2mpHA=;
 b=sUyyJZ4zN8QxD6X8CE/vc4qfamgzyTC4fJiw4cavytHI3tk3WUffDhDIe2FKjxwesb/dyk
 jExnCbtx8axb6WXMZvddeF56/g8IA7oTSUqal65N9ixTsgB8oVw8k1c7/+fl+5hTE4vVv+
 43Cqguirl6cjDdNxh+n+SPypfNaSO8DCgTJ/xaR14YhCTeNAfMeZu2theLDMhZsrp0JSOR
 cP6iLDkBPOJErFrWVeEw0P9OcNfL0/w+gTUOrbfoxTIAn7ge9WIlsU/d70th/kCWEtYV/K
 Ws6eGjhpBr+u5G3e6e/o1h8g46Vbcgdy825xS5vwvJuP6SEcXHBy5w/gSYcctg==
From: Brahmajit Das <listout@listout.xyz>
To: jani.nikula@linux.intel.com
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, joonas.lahtinen@linux.intel.com,
 linux-next@vger.kernel.org, listout@listout.xyz, rodrigo.vivi@intel.com,
 simona@ffwll.ch, tursulin@ursulin.net
Subject: [RFC PATCH v2 1/2] drm/i915/debugfs: use new debugfs device-centered
 functions
Date: Mon, 11 Aug 2025 18:47:07 +0530
Message-ID: <20250811131708.82865-2-listout@listout.xyz>
In-Reply-To: <20250811131708.82865-1-listout@listout.xyz>
References: <32c55ab0b1452a1fd8ef49e8a1ca640ad5bd9d76@intel.com>
 <20250811131708.82865-1-listout@listout.xyz>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 12 Aug 2025 07:33:33 +0000
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
 drivers/gpu/drm/i915/i915_debugfs.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_debugfs.c b/drivers/gpu/drm/i915/i915_debugfs.c
index 23fa098c4479..e411ff3ac1fd 100644
--- a/drivers/gpu/drm/i915/i915_debugfs.c
+++ b/drivers/gpu/drm/i915/i915_debugfs.c
@@ -699,7 +699,7 @@ static const struct file_operations i915_forcewake_fops = {
 	.release = i915_forcewake_release,
 };
 
-static const struct drm_info_list i915_debugfs_list[] = {
+static const struct drm_debugfs_info i915_debugfs_list[] = {
 	{"i915_capabilities", i915_capabilities, 0},
 	{"i915_gem_objects", i915_gem_object_info, 0},
 	{"i915_frequency_info", i915_frequency_info, 0},
@@ -735,9 +735,8 @@ void i915_debugfs_register(struct drm_i915_private *i915)
 				    i915_debugfs_files[i].fops);
 	}
 
-	drm_debugfs_create_files(i915_debugfs_list,
-				 ARRAY_SIZE(i915_debugfs_list),
-				 debugfs_root, i915->drm.primary);
+	drm_debugfs_add_files(&i915->drm, i915_debugfs_list,
+			      ARRAY_SIZE(i915_debugfs_list));
 
 	i915_gpu_error_debugfs_register(i915);
 }
-- 
2.50.1

