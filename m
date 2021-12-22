Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AB3147CA1B
	for <lists+dri-devel@lfdr.de>; Wed, 22 Dec 2021 01:11:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DEBE10E132;
	Wed, 22 Dec 2021 00:11:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com
 [IPv6:2607:f8b0:4864:20::b4a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C8EC88E6B
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Dec 2021 00:11:32 +0000 (UTC)
Received: by mail-yb1-xb4a.google.com with SMTP id
 v20-20020a25fc14000000b005c2109e5ad1so911042ybd.9
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Dec 2021 16:11:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=Zf1L40lovHUL9SJ/tEH+usL7zMPf50vfNUe2p7oE4n0=;
 b=cHD/hvO2XV4Ap+xwuZlnMwVgBK9f70YzvuReNTOUFc8qxoRwyuow2t4NfjtCNNSyN1
 +SMvCAzozxHFM/4X4WIIAXZRVK3l7UTdOvLi/h3e+2nJWjJI+dNAQNuUvPKv5KhJEr6O
 tqhpNyhaOKVnrXlDsZDj33W5nyi2i3z/yGNtLfkl5xH7z9/4lQdu0ES29RjCcgsQyuHW
 M6Fds1uF3xg7UuagjFX6YvoWPxhC/QSyxHOAEdaBHeRyViN+ljsXP3HgNKO4zsvU/Evb
 uxfpO83dEywhC/oTPRductb6X+CTVEyFdX8vd0bjqXpmiK3D0sYVGAypLn3B9aa4+d4B
 cDXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=Zf1L40lovHUL9SJ/tEH+usL7zMPf50vfNUe2p7oE4n0=;
 b=MtIrujv9JD/jnbyGyA1+nYOYnwwv0Hg/e4iXZvq6KMm1lfSw28kn8YNJvyXBLst+Lu
 jDUfra+lgcpjJEctnMedqQkYVYVhp1BLC04DBEzrrLezeakSY/UxPytxPnpflbEtWmB/
 aNpqWBsrn6rLFGIF2aE1BbzrqvmAFWjLAyEhkBYl3Bj0Vckj+XfWnn5HaW7Jb17umldy
 QdQ46t+3of08gl6NPj+JtdtWR8tklLKTTv+w0jC2I9IcVLl78hB1VtbkAnIrVfGDccrG
 5rWQNvYu+qE3Tqg9mRxSMZQvT5iH30V9USX23kbI7SuVccObZVtox1h65h6LD3OZqNb3
 REew==
X-Gm-Message-State: AOAM532SLcaqLbMUbbOfQXItKUCUcIPE6lH8EriqN+msmBnFsmaT/kkT
 eEXLLsdcSxgx4x6202n+IvlEwAIqNQnV
X-Google-Smtp-Source: ABdhPJwnjW+UUDsxuYI0HjgRll7hXtnZtZAaPGK6D3q+0RJP2LzLOaJxw3AMeO9DTk5tn2PH/oMWU+XYQwCs
X-Received: from rajat2.mtv.corp.google.com
 ([2620:15c:202:201:8d27:feea:1b0b:3782])
 (user=rajatja job=sendgmr) by 2002:a25:a449:: with SMTP id
 f67mr1063772ybi.368.1640131891238; Tue, 21 Dec 2021 16:11:31 -0800 (PST)
Date: Tue, 21 Dec 2021 16:11:25 -0800
Message-Id: <20211222001127.3337471-1-rajatja@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.34.1.307.g9b7440fafd-goog
Subject: [PATCH v4 1/3] drm/privacy_screen: Add drvdata in drm_privacy_screen
From: Rajat Jain <rajatja@google.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Hans de Goede <hdegoede@redhat.com>, 
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Benson Leung <bleung@chromium.org>, 
 Henrique de Moraes Holschuh <hmh@hmh.eng.br>, Mark Gross <markgross@kernel.org>,
 linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, ibm-acpi-devel@lists.sourceforge.net, 
 platform-driver-x86@vger.kernel.org, gwendal@google.com, seanpaul@google.com, 
 marcheu@google.com, dtor@google.com
Content-Type: text/plain; charset="UTF-8"
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
Cc: Rajat Jain <rajatja@google.com>, rajatxjain@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Allow a privacy screen provider to stash its private data pointer in the
drm_privacy_screen, and update the drm_privacy_screen_register() call to
accept that. Also introduce a *_get_drvdata() so that it can retrieved
back when needed.

This also touches the IBM Thinkpad platform driver, the only user of
privacy screen today, to pass NULL for now to the updated API.

Signed-off-by: Rajat Jain <rajatja@google.com>
Reviewed-by: Hans de Goede <hdegoede@redhat.com>
---
v4: Added "Reviewed-by" from Hans
v3: Initial version. Came up due to review comments on v2 of other patches.
v2: No v2
v1: No v1

 drivers/gpu/drm/drm_privacy_screen.c    |  5 ++++-
 drivers/platform/x86/thinkpad_acpi.c    |  2 +-
 include/drm/drm_privacy_screen_driver.h | 13 ++++++++++++-
 3 files changed, 17 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_privacy_screen.c b/drivers/gpu/drm/drm_privacy_screen.c
index beaf99e9120a..03b149cc455b 100644
--- a/drivers/gpu/drm/drm_privacy_screen.c
+++ b/drivers/gpu/drm/drm_privacy_screen.c
@@ -387,7 +387,8 @@ static void drm_privacy_screen_device_release(struct device *dev)
  * * An ERR_PTR(errno) on failure.
  */
 struct drm_privacy_screen *drm_privacy_screen_register(
-	struct device *parent, const struct drm_privacy_screen_ops *ops)
+	struct device *parent, const struct drm_privacy_screen_ops *ops,
+	void *data)
 {
 	struct drm_privacy_screen *priv;
 	int ret;
@@ -404,6 +405,7 @@ struct drm_privacy_screen *drm_privacy_screen_register(
 	priv->dev.parent = parent;
 	priv->dev.release = drm_privacy_screen_device_release;
 	dev_set_name(&priv->dev, "privacy_screen-%s", dev_name(parent));
+	priv->drvdata = data;
 	priv->ops = ops;
 
 	priv->ops->get_hw_state(priv);
@@ -439,6 +441,7 @@ void drm_privacy_screen_unregister(struct drm_privacy_screen *priv)
 	mutex_unlock(&drm_privacy_screen_devs_lock);
 
 	mutex_lock(&priv->lock);
+	priv->drvdata = NULL;
 	priv->ops = NULL;
 	mutex_unlock(&priv->lock);
 
diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
index 341655d711ce..ccbfda2b0095 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -9782,7 +9782,7 @@ static int tpacpi_lcdshadow_init(struct ibm_init_struct *iibm)
 		return 0;
 
 	lcdshadow_dev = drm_privacy_screen_register(&tpacpi_pdev->dev,
-						    &lcdshadow_ops);
+						    &lcdshadow_ops, NULL);
 	if (IS_ERR(lcdshadow_dev))
 		return PTR_ERR(lcdshadow_dev);
 
diff --git a/include/drm/drm_privacy_screen_driver.h b/include/drm/drm_privacy_screen_driver.h
index 24591b607675..4ef246d5706f 100644
--- a/include/drm/drm_privacy_screen_driver.h
+++ b/include/drm/drm_privacy_screen_driver.h
@@ -73,10 +73,21 @@ struct drm_privacy_screen {
 	 * for more info.
 	 */
 	enum drm_privacy_screen_status hw_state;
+	/**
+	 * @drvdata: Private data owned by the privacy screen provider
+	 */
+	void *drvdata;
 };
 
+static inline
+void *drm_privacy_screen_get_drvdata(struct drm_privacy_screen *priv)
+{
+	return priv->drvdata;
+}
+
 struct drm_privacy_screen *drm_privacy_screen_register(
-	struct device *parent, const struct drm_privacy_screen_ops *ops);
+	struct device *parent, const struct drm_privacy_screen_ops *ops,
+	void *data);
 void drm_privacy_screen_unregister(struct drm_privacy_screen *priv);
 
 void drm_privacy_screen_call_notifier_chain(struct drm_privacy_screen *priv);
-- 
2.34.1.307.g9b7440fafd-goog

