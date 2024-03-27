Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9CAE88DFA0
	for <lists+dri-devel@lfdr.de>; Wed, 27 Mar 2024 13:25:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDF6210FC7B;
	Wed, 27 Mar 2024 12:25:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="HvES3qf/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C172710FC7A
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Mar 2024 12:25:22 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id E0C83CE2542;
 Wed, 27 Mar 2024 12:25:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 462C2C433C7;
 Wed, 27 Mar 2024 12:25:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1711542320;
 bh=XcyGAKHhH1BhoHNkqAc3lfQdNvG2pdA5Q2gmHb3khFE=;
 h=From:To:Cc:Subject:Date:From;
 b=HvES3qf/+imzbQjZteoop0Ko0xlm9fSxhfOV7s3Rr519bzK3g/bcuKj5rc77+nEG1
 5yvkYmYAAFgdHX7DsumwsI/XsDdXbcObDTB1MMZY8ZzDOJ+5snELNJcau4nmjpoVZp
 JWzJSLc4FnNDLPsiqIGNSz08q3cCQxbHZsLzwXDuMqCCsdaENyDv1qMEU7Yzz/rah6
 /oS5rW8CPLYJqRt7oYi8959rSlhrnCv53FFtvldNdKt0ZpRXgs0vMTstahHr+Gh/4J
 wc+eKWR+InQ9z13k72+GUtFDrgE+GOV5Zi8TQrMTGVz1j8rVfNrejeZ9WiD+DyUmbv
 eiploLh0YAk3w==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org,
	jani.nikula@intel.com
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: FAILED: Patch "drm/panel: do not return negative error codes from
 drm_panel_get_modes()" failed to apply to 4.19-stable tree
Date: Wed, 27 Mar 2024 08:25:18 -0400
Message-ID: <20240327122518.2840115-1-sashal@kernel.org>
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

The patch below does not apply to the 4.19-stable tree.
If someone wants it applied there, or to any other stable or longterm
tree, then please email the backport, including the original git commit
id to <stable@vger.kernel.org>.

Thanks,
Sasha

------------------ original commit in Linus's tree ------------------

From fc4e97726530241d96dd7db72eb65979217422c9 Mon Sep 17 00:00:00 2001
From: Jani Nikula <jani.nikula@intel.com>
Date: Fri, 8 Mar 2024 18:03:40 +0200
Subject: [PATCH] drm/panel: do not return negative error codes from
 drm_panel_get_modes()

None of the callers of drm_panel_get_modes() expect it to return
negative error codes. Either they propagate the return value in their
struct drm_connector_helper_funcs .get_modes() hook (which is also not
supposed to return negative codes), or add it to other counts leading to
bogus values.

On the other hand, many of the struct drm_panel_funcs .get_modes() hooks
do return negative error codes, so handle them gracefully instead of
propagating further.

Return 0 for no modes, whatever the reason.

Cc: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: stable@vger.kernel.org
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>
Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
Link: https://patchwork.freedesktop.org/patch/msgid/79f559b72d8c493940417304e222a4b04dfa19c4.1709913674.git.jani.nikula@intel.com
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_panel.c | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/drm_panel.c b/drivers/gpu/drm/drm_panel.c
index e814020bbcd3b..cfbe020de54e0 100644
--- a/drivers/gpu/drm/drm_panel.c
+++ b/drivers/gpu/drm/drm_panel.c
@@ -274,19 +274,24 @@ EXPORT_SYMBOL(drm_panel_disable);
  * The modes probed from the panel are automatically added to the connector
  * that the panel is attached to.
  *
- * Return: The number of modes available from the panel on success or a
- * negative error code on failure.
+ * Return: The number of modes available from the panel on success, or 0 on
+ * failure (no modes).
  */
 int drm_panel_get_modes(struct drm_panel *panel,
 			struct drm_connector *connector)
 {
 	if (!panel)
-		return -EINVAL;
+		return 0;
 
-	if (panel->funcs && panel->funcs->get_modes)
-		return panel->funcs->get_modes(panel, connector);
+	if (panel->funcs && panel->funcs->get_modes) {
+		int num;
 
-	return -EOPNOTSUPP;
+		num = panel->funcs->get_modes(panel, connector);
+		if (num > 0)
+			return num;
+	}
+
+	return 0;
 }
 EXPORT_SYMBOL(drm_panel_get_modes);
 
-- 
2.43.0




