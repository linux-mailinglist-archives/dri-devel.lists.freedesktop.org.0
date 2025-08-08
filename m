Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA495B20016
	for <lists+dri-devel@lfdr.de>; Mon, 11 Aug 2025 09:13:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77DD910E37E;
	Mon, 11 Aug 2025 07:13:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=listout.xyz header.i=@listout.xyz header.b="Qs87wH+A";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 311 seconds by postgrey-1.36 at gabe;
 Fri, 08 Aug 2025 22:58:00 UTC
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BC3010E1FC;
 Fri,  8 Aug 2025 22:58:00 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4bzK751CWfz9tDm;
 Sat,  9 Aug 2025 00:52:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=listout.xyz; s=MBO0001;
 t=1754693569;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qy2xkOx1pF+KCsu31r2SgnpiXqbIlszxJiNS9iCMRLU=;
 b=Qs87wH+ADdgKoypR078nUSzxeUC3WthsQ1R9XWnCJAIXXXIRrZb/dZIPG/AWAH6rVhsHmq
 cID652KCebhZ0lIadSx755TCdr/l/Ybbl/LTpiC+odMJbYSPMN03v71Izw7sW4G9ErisCE
 LBDoKzIIWk+kcU+JCL8Zv9dFUaCW6alCCTjF6qNqn8ukLsWb85PS2RFC0Pj8clrVvv0C8s
 xNLeL/WcQMvEclfPBpQ6T/l1PT+dbJ1dhd6zw6h0MBfZzugIrz2cnGM4BtpR+DaFG+H2Kp
 zdQSb9GBJKeemr2wylrIdlR6zaTxbkRQ3bEBrLfoQEaXJH4e2IGPuHGoDo76Dg==
From: Brahmajit Das <listout@listout.xyz>
To: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-next@vger.kernel.org
Cc: jani.nikula@linux.intel.com, rodrigo.vivi@intel.com,
 joonas.lahtinen@linux.intel.com, tursulin@ursulin.net, simona@ffwll.ch
Subject: [RFC PATCH 1/2] drm/i915/debugfs: use new debugfs device-centered
 functions
Date: Sat,  9 Aug 2025 04:22:25 +0530
Message-ID: <20250808225226.30465-2-listout@listout.xyz>
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
 drivers/gpu/drm/i915/i915_debugfs.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_debugfs.c b/drivers/gpu/drm/i915/i915_debugfs.c
index 967c0501e91e..4c3065d3aca3 100644
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
@@ -737,9 +737,8 @@ void i915_debugfs_register(struct drm_i915_private *dev_priv)
 				    i915_debugfs_files[i].fops);
 	}
 
-	drm_debugfs_create_files(i915_debugfs_list,
-				 ARRAY_SIZE(i915_debugfs_list),
-				 minor->debugfs_root, minor);
+	drm_debugfs_add_files(minor->dev, i915_debugfs_list,
+			      ARRAY_SIZE(i915_debugfs_list));
 
 	i915_gpu_error_debugfs_register(dev_priv);
 }
-- 
2.50.1

