Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 53B8135F70F
	for <lists+dri-devel@lfdr.de>; Wed, 14 Apr 2021 17:11:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 545886E93A;
	Wed, 14 Apr 2021 15:11:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26CD66E93A
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Apr 2021 15:11:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618413079;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2rCvR3udWAuN8iEY7ESeyVC+bz59iWOoCws88KJ9dTE=;
 b=NRclXnhOQ38EDMkTSg7xd11eJd4Y6T3re9Gl3nbgyDx37DcFusF2Qh7W29cHlm70/tWaJV
 gS7N6inW8jIyzQsAWKXsAwYh5D1mWlnaECujTfQ40nW53BoFx5wNo9jnqdkVFSlmK3idIR
 JdkmtNkfHuVtFNPnC81DF3tqN3ceedg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-227-olHOEYDtMPi3DF4VL6Es_g-1; Wed, 14 Apr 2021 11:11:13 -0400
X-MC-Unique: olHOEYDtMPi3DF4VL6Es_g-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D547A107ACCA;
 Wed, 14 Apr 2021 15:11:10 +0000 (UTC)
Received: from x1.localdomain (ovpn-112-168.ams2.redhat.com [10.36.112.168])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2514C5D6BA;
 Wed, 14 Apr 2021 15:11:07 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>, Rajat Jain <rajatja@google.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Mark Gross <mgross@linux.intel.com>,
 Andy Shevchenko <andy@infradead.org>
Subject: [PATCH resend 4/9] drm/privacy-screen: Add notifier support
Date: Wed, 14 Apr 2021 17:10:44 +0200
Message-Id: <20210414151049.95828-5-hdegoede@redhat.com>
In-Reply-To: <20210414151049.95828-1-hdegoede@redhat.com>
References: <20210414151049.95828-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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
Cc: Marco Trevisan <marco.trevisan@canonical.com>,
 Pekka Paalanen <pekka.paalanen@collabora.com>,
 Sebastien Bacher <seb128@ubuntu.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>, dri-devel@lists.freedesktop.org,
 platform-driver-x86@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>,
 Mark Pearson <markpearson@lenovo.com>,
 Mario Limonciello <mario.limonciello@outlook.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add support for privacy-screen consumers to register a notifier to
be notified of external (e.g. done by the hw itself on a hotkey press)
state changes.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/gpu/drm/drm_privacy_screen.c      | 67 +++++++++++++++++++++++
 include/drm/drm_privacy_screen_consumer.h |  5 ++
 include/drm/drm_privacy_screen_driver.h   |  4 ++
 3 files changed, 76 insertions(+)

diff --git a/drivers/gpu/drm/drm_privacy_screen.c b/drivers/gpu/drm/drm_privacy_screen.c
index 6296fd46156c..7e78b4068e8f 100644
--- a/drivers/gpu/drm/drm_privacy_screen.c
+++ b/drivers/gpu/drm/drm_privacy_screen.c
@@ -254,6 +254,49 @@ void drm_privacy_screen_get_state(struct drm_privacy_screen *priv,
 }
 EXPORT_SYMBOL(drm_privacy_screen_get_state);
 
+/**
+ * drm_privacy_screen_register_notifier - register a notifier
+ * @priv: Privacy screen to register the notifier with
+ * @nb: Notifier-block for the notifier to register
+ *
+ * Register a notifier with the privacy-screen to be notified of changes made
+ * to the privacy-screen state from outside of the privacy-screen class.
+ * E.g. the state may be changed by the hardware itself in response to a
+ * hotkey press.
+ *
+ * The notifier is called with no locks held. The new hw_state and sw_state
+ * can be retrieved using the drm_privacy_screen_get_state() function.
+ * A pointer to the drm_privacy_screen's struct is passed as the void *data
+ * argument of the notifier_block's notifier_call.
+ *
+ * The notifier will NOT be called when changes are made through
+ * drm_privacy_screen_set_sw_state(). It is only called for external changes.
+ *
+ * Return: 0 on success, negative error code on failure.
+ */
+int drm_privacy_screen_register_notifier(struct drm_privacy_screen *priv,
+					 struct notifier_block *nb)
+{
+	return blocking_notifier_chain_register(&priv->notifier_head, nb);
+}
+EXPORT_SYMBOL(drm_privacy_screen_register_notifier);
+
+/**
+ * drm_privacy_screen_unregister_notifier - unregister a notifier
+ * @priv: Privacy screen to register the notifier with
+ * @nb: Notifier-block for the notifier to register
+ *
+ * Unregister a notifier registered with drm_privacy_screen_register_notifier().
+ *
+ * Return: 0 on success, negative error code on failure.
+ */
+int drm_privacy_screen_unregister_notifier(struct drm_privacy_screen *priv,
+					   struct notifier_block *nb)
+{
+	return blocking_notifier_chain_unregister(&priv->notifier_head, nb);
+}
+EXPORT_SYMBOL(drm_privacy_screen_unregister_notifier);
+
 /*** drm_privacy_screen_driver.h functions ***/
 
 static ssize_t sw_state_show(struct device *dev,
@@ -352,6 +395,7 @@ struct drm_privacy_screen *drm_privacy_screen_register(
 		return ERR_PTR(-ENOMEM);
 
 	mutex_init(&priv->lock);
+	BLOCKING_INIT_NOTIFIER_HEAD(&priv->notifier_head);
 
 	priv->dev.class = &drm_privacy_screen_class;
 	priv->dev.parent = parent;
@@ -399,6 +443,29 @@ void drm_privacy_screen_unregister(struct drm_privacy_screen *priv)
 }
 EXPORT_SYMBOL(drm_privacy_screen_unregister);
 
+/**
+ * drm_privacy_screen_call_notifier_chain - notify consumers of state change
+ * @priv: Privacy screen to register the notifier with
+ *
+ * A privacy-screen provider driver can call this functions upon external
+ * changes to the privacy-screen state. E.g. the state may be changed by the
+ * hardware itself in response to a hotkey press.
+ * This function must be called without holding the privacy-screen lock.
+ * the driver must update sw_state and hw_state to reflect the new state before
+ * calling this function.
+ * The expected behavior from the driver upon receiving an external state
+ * change event is: 1. Take the lock; 2. Update sw_state and hw_state;
+ * 3. Release the lock. 4. Call drm_privacy_screen_call_notifier_chain().
+ */
+void drm_privacy_screen_call_notifier_chain(struct drm_privacy_screen *priv)
+{
+	if (WARN_ON(mutex_is_locked(&priv->lock)))
+		return;
+
+	blocking_notifier_call_chain(&priv->notifier_head, 0, priv);
+}
+EXPORT_SYMBOL(drm_privacy_screen_call_notifier_chain);
+
 static int __init drm_privacy_screen_init(void)
 {
 	int ret;
diff --git a/include/drm/drm_privacy_screen_consumer.h b/include/drm/drm_privacy_screen_consumer.h
index 169ba72bd60d..1f33dc1457ff 100644
--- a/include/drm/drm_privacy_screen_consumer.h
+++ b/include/drm/drm_privacy_screen_consumer.h
@@ -24,4 +24,9 @@ void drm_privacy_screen_get_state(struct drm_privacy_screen *priv,
 				  enum drm_privacy_screen_status *sw_state_ret,
 				  enum drm_privacy_screen_status *hw_state_ret);
 
+int drm_privacy_screen_register_notifier(struct drm_privacy_screen *priv,
+					 struct notifier_block *nb);
+int drm_privacy_screen_unregister_notifier(struct drm_privacy_screen *priv,
+					   struct notifier_block *nb);
+
 #endif
diff --git a/include/drm/drm_privacy_screen_driver.h b/include/drm/drm_privacy_screen_driver.h
index 5187ae52eb03..24591b607675 100644
--- a/include/drm/drm_privacy_screen_driver.h
+++ b/include/drm/drm_privacy_screen_driver.h
@@ -54,6 +54,8 @@ struct drm_privacy_screen {
 	struct mutex lock;
 	/** @list: privacy-screen devices list list-entry. */
 	struct list_head list;
+	/** @notifier_head: privacy-screen notifier head. */
+	struct blocking_notifier_head notifier_head;
 	/**
 	 * @ops: &struct drm_privacy_screen_ops for this privacy-screen.
 	 * This is NULL if the driver has unregistered the privacy-screen.
@@ -77,4 +79,6 @@ struct drm_privacy_screen *drm_privacy_screen_register(
 	struct device *parent, const struct drm_privacy_screen_ops *ops);
 void drm_privacy_screen_unregister(struct drm_privacy_screen *priv);
 
+void drm_privacy_screen_call_notifier_chain(struct drm_privacy_screen *priv);
+
 #endif
-- 
2.31.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
