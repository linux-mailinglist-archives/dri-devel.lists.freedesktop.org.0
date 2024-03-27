Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A53588DF01
	for <lists+dri-devel@lfdr.de>; Wed, 27 Mar 2024 13:20:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FAD910FBF9;
	Wed, 27 Mar 2024 12:20:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="gL8mULRS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 261CA10FBF6
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Mar 2024 12:20:43 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 9D01A614E2;
 Wed, 27 Mar 2024 12:20:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8745C433F1;
 Wed, 27 Mar 2024 12:20:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1711542042;
 bh=uc+f3GiJhYQkEll3dp8W8GhBIaEupet6T1k8W0PbeSc=;
 h=From:To:Cc:Subject:Date:From;
 b=gL8mULRS18/szi9iTIbfFs+iKRN1TV5+Rno3bilp3CAp/csxOVWzEtvhQ75bGCUhi
 uPPF/Ym436jE0vMLP/Biolnn0ghWgm/aevKRfXBaTFIbcYuTavMSHn0gX9nJTanqqb
 HZIVdInAx3z2PT6OwUyMCCQsoKbaNOMJeuFv3SuufYBcFnxdqp5d1H2etND+fsZco+
 yIYnQxSBwyz9Q1Db7IES3Ag8eBnyRl5wp2nkSZV3QBjD9XUFFsMK6TVamk7MqkL/f+
 BpJ/DD+pDRRLzSykjbEzf10cYv9HXfmlLb9VYAsbJewHlRK3rTxY84z8BvPg37DXza
 bkRZpqvYGqVxw==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org,
	jani.nikula@intel.com
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: FAILED: Patch "drm/probe-helper: warn about negative .get_modes()"
 failed to apply to 5.10-stable tree
Date: Wed, 27 Mar 2024 08:20:40 -0400
Message-ID: <20240327122040.2836229-1-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Patchwork-Hint: ignore
X-stable: review
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

The patch below does not apply to the 5.10-stable tree.
If someone wants it applied there, or to any other stable or longterm
tree, then please email the backport, including the original git commit
id to <stable@vger.kernel.org>.

Thanks,
Sasha

------------------ original commit in Linus's tree ------------------

From 7af03e688792293ba33149fb8df619a8dff90e80 Mon Sep 17 00:00:00 2001
From: Jani Nikula <jani.nikula@intel.com>
Date: Fri, 8 Mar 2024 18:03:39 +0200
Subject: [PATCH] drm/probe-helper: warn about negative .get_modes()

The .get_modes() callback is supposed to return the number of modes,
never a negative error code. If a negative value is returned, it'll just
be interpreted as a negative count, and added to previous calculations.

Document the rules, but handle the negative values gracefully with an
error message.

Cc: stable@vger.kernel.org
Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
Link: https://patchwork.freedesktop.org/patch/msgid/50208c866facc33226a3c77b82bb96aeef8ef310.1709913674.git.jani.nikula@intel.com
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_probe_helper.c       | 7 +++++++
 include/drm/drm_modeset_helper_vtables.h | 3 ++-
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_probe_helper.c b/drivers/gpu/drm/drm_probe_helper.c
index 19ecb749704be..75f84753f6ee3 100644
--- a/drivers/gpu/drm/drm_probe_helper.c
+++ b/drivers/gpu/drm/drm_probe_helper.c
@@ -422,6 +422,13 @@ static int drm_helper_probe_get_modes(struct drm_connector *connector)
 
 	count = connector_funcs->get_modes(connector);
 
+	/* The .get_modes() callback should not return negative values. */
+	if (count < 0) {
+		drm_err(connector->dev, ".get_modes() returned %pe\n",
+			ERR_PTR(count));
+		count = 0;
+	}
+
 	/*
 	 * Fallback for when DDC probe failed in drm_get_edid() and thus skipped
 	 * override/firmware EDID.
diff --git a/include/drm/drm_modeset_helper_vtables.h b/include/drm/drm_modeset_helper_vtables.h
index 881b03e4dc288..9ed42469540eb 100644
--- a/include/drm/drm_modeset_helper_vtables.h
+++ b/include/drm/drm_modeset_helper_vtables.h
@@ -898,7 +898,8 @@ struct drm_connector_helper_funcs {
 	 *
 	 * RETURNS:
 	 *
-	 * The number of modes added by calling drm_mode_probed_add().
+	 * The number of modes added by calling drm_mode_probed_add(). Return 0
+	 * on failures (no modes) instead of negative error codes.
 	 */
 	int (*get_modes)(struct drm_connector *connector);
 
-- 
2.43.0




