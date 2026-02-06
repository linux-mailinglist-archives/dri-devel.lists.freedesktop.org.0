Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6F9tDof6hWmjIwQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 15:28:23 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C90AEFEE9F
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 15:28:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E67C810E7EF;
	Fri,  6 Feb 2026 14:28:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="aEKApwaa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8867C10E7EF
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Feb 2026 14:28:19 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id AA630C24F81;
 Fri,  6 Feb 2026 14:28:24 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 1B8F660729;
 Fri,  6 Feb 2026 14:28:18 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 2AFAC119D1D44; Fri,  6 Feb 2026 15:28:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1770388096; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=Hb2S8TQQB5gVXQwoVTh7MH3rQHkTeCE5saOiNRJ026c=;
 b=aEKApwaa3rfnyRoDePayUOjxFm93dNDId2WTHesdT0Asp4eyrnkRf+MOIF87hM0gX0x6+n
 HCoGwOXixx0ay4b01cYaI2jFJZclo9YL6Ea3xI1SI06nFbaB1Kk6ND0rEEcHC7OBhHxK7k
 3H45OEY/4sRABEK8KMT7DRscnd4an1aKrjHvNnXyQ6OIx5LYJcu3B+5fuLnQrQAq5fVcqG
 wlj+npwjg0cS9ypkguIseZ8Bzm+ybm3oZHxbe3LB6OJZpJuQEVl3B3qsvKgmpOFBZx1hze
 EnE6KbZNLV9bjcmJS/siUSiuq2gHcA0ldNeEJ0VKKIaiXG35rq+zUHX6sIM9iw==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Fri, 06 Feb 2026 15:27:55 +0100
Subject: [PATCH 1/2] drm/bridge: add drm_bridge_clear_and_put()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260206-drm-bridge-atomic-vs-remove-clear_and_put-v1-1-6f1a7d03c45f@bootlin.com>
References: <20260206-drm-bridge-atomic-vs-remove-clear_and_put-v1-0-6f1a7d03c45f@bootlin.com>
In-Reply-To: <20260206-drm-bridge-atomic-vs-remove-clear_and_put-v1-0-6f1a7d03c45f@bootlin.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Inki Dae <inki.dae@samsung.com>, Jagan Teki <jagan@amarulasolutions.com>, 
 Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Hui Pu <Hui.Pu@gehealthcare.com>, Ian Ray <ian.ray@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[20];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:Laurent.pinchart@ideasonboard.com,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:inki.dae@samsung.com,m:jagan@amarulasolutions.com,m:m.szyprowski@samsung.com,m:Hui.Pu@gehealthcare.com,m:ian.ray@gehealthcare.com,m:thomas.petazzoni@bootlin.com,m:linux-kernel@vger.kernel.org,m:luca.ceresoli@bootlin.com,m:jernejskrabec@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[intel.com,linaro.org,kernel.org,ideasonboard.com,kwiboo.se,gmail.com,linux.intel.com,suse.de,ffwll.ch,samsung.com,amarulasolutions.com];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[luca.ceresoli@bootlin.com,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[luca.ceresoli@bootlin.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[bootlin.com:+];
	NEURAL_HAM(-0.00)[-0.992];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:email,bootlin.com:dkim,bootlin.com:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: C90AEFEE9F
X-Rspamd-Action: no action

Drivers having a struct drm_bridge pointer pointing to a bridge in many
cases hold that reference until the owning device is removed. In those
cases the reference to the bridge can be put in the .remove callback
(possibly using devm actions) or in the .destroy func (possibly with the
help of struct drm_bridge::next_bridge). At those moments the driver should
not be operating anymore and won't dereference the bridge pointer after it
is put.

However there are cases when drivers need to stop holding a reference to a
bridge even when their device is not being removed. This is the case for
bridge hot-unplug, when a bridge is removed but the previous entity (bridge
or encoder) is staying. In such case the "previous entity" needs to put it
but cannot do it via devm or .destroy, because it is not being removed.

The easy way to dispose of such pointer is:

  drm_bridge_put(my_priv->some_bridge);
  my_priv->some_bridge = NULL;

However this is risky because there is a time window between the two lines
where the reference is put, and thus the bridge could be deallocated, but
the pointer is still assigned. If other functions of the same driver were
invoked concurrently they might dereference my_priv->some_bridge during
that window, resulting in use-after-free.

A correct solution is to clear the pointer before putting the reference,
but that needs a temporary variable:

  struct drm_bridge *temp = my_priv->some_bridge;
  my_priv->some_bridge = NULL;
  drm_bridge_put(temp);

This solution is however annoying to write, so the incorrect version might
still sneak in.

Add a simple, easy to use function to put a bridge after setting its
pointer to NULL in the correct way.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

---

This is a renamed version of drm_bridge_put_and_clear() which was sent as
part of a larger patch [0] but with largely rewritten documentation and a
detailed commit message.

[0] https://lore.kernel.org/lkml/20250206-hotplug-drm-bridge-v6-14-9d6f2c9c3058@bootlin.com/
---
 drivers/gpu/drm/drm_bridge.c | 34 ++++++++++++++++++++++++++++++++++
 include/drm/drm_bridge.h     |  1 +
 2 files changed, 35 insertions(+)

diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
index 3b165a0d1e77..cbe9f17c3690 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -304,6 +304,9 @@ EXPORT_SYMBOL(drm_bridge_get);
  *
  * This function decrements the bridge's reference count and frees the
  * object if the reference count drops to zero.
+ *
+ * See also drm_bridge_clear_and_put() if you also need to set the pointer
+ * to NULL
  */
 void drm_bridge_put(struct drm_bridge *bridge)
 {
@@ -312,6 +315,37 @@ void drm_bridge_put(struct drm_bridge *bridge)
 }
 EXPORT_SYMBOL(drm_bridge_put);
 
+/**
+ * drm_bridge_clear_and_put - Given a bridge pointer, clear the pointer
+ *                            then put the bridge
+ * @bridge_pp: pointer to pointer to a struct drm_bridge; ``bridge_pp``
+ *             must be non-NULL; if ``*bridge_pp`` is NULL this function
+ *             does nothing
+ *
+ * Helper to put a DRM bridge, but only after setting its pointer to
+ * NULL. Useful when a struct drm_bridge reference must be dropped without
+ * leaving a use-after-free window where the pointed bridge might have been
+ * freed while still holding a pointer to it.
+ *
+ * For struct ``drm_bridge *some_bridge``, this code::
+ *
+ *     drm_bridge_clear_and_put(&some_bridge);
+ *
+ * is equivalent to the more complex::
+ *
+ *     struct drm_bridge *temp = some_bridge;
+ *     some_bridge = NULL;
+ *     drm_bridge_put(temp);
+ */
+void drm_bridge_clear_and_put(struct drm_bridge **bridge_pp)
+{
+	struct drm_bridge *bridge = *bridge_pp;
+
+	*bridge_pp = NULL;
+	drm_bridge_put(bridge);
+}
+EXPORT_SYMBOL(drm_bridge_clear_and_put);
+
 /**
  * drm_bridge_put_void - wrapper to drm_bridge_put() taking a void pointer
  *
diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index 4f19f7064ee3..66ab89cf48aa 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -1290,6 +1290,7 @@ void drm_bridge_unplug(struct drm_bridge *bridge);
 
 struct drm_bridge *drm_bridge_get(struct drm_bridge *bridge);
 void drm_bridge_put(struct drm_bridge *bridge);
+void drm_bridge_clear_and_put(struct drm_bridge **bridge_pp);
 
 /* Cleanup action for use with __free() */
 DEFINE_FREE(drm_bridge_put, struct drm_bridge *, if (_T) drm_bridge_put(_T))

-- 
2.52.0

