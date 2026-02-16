Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4N8CGs1Jk2kT3QEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 16 Feb 2026 17:46:05 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A7851465D3
	for <lists+dri-devel@lfdr.de>; Mon, 16 Feb 2026 17:46:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01F6D10E3C6;
	Mon, 16 Feb 2026 16:46:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Tc3dAaiq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com
 [209.85.208.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD85010E3D3
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Feb 2026 16:45:52 +0000 (UTC)
Received: by mail-ed1-f66.google.com with SMTP id
 4fb4d7f45d1cf-65c1d6c2459so156919a12.0
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Feb 2026 08:45:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1771260351; x=1771865151; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=il27DEcymwLna7hK1ELrrYkujYqTcKdi5syqhicz4KY=;
 b=Tc3dAaiqWgeKvv8pCgS46fZaR4wfdqo1XGla/h/GxPMPmUJqknncrGstljWsZBuHri
 DIvgKCkCeyErHWn0VL5/cJRu5Re+B9Fj8SN0Uh16U9qYcabcgCyFfNa5y56pwu3amy0E
 m6sdQ8oBIUIZSE62uDeT2KCVOX25SFrAvELwI46Lvc4Bc16+WOi7mYWKrcuGC8XI85Ie
 dX6yDwlAMJJ/D2TxKA4/RFw8uJumDu4sy9KO1VPOGFKtd3S1Pr/QGObzXp/Brke5PZbg
 SUOmC9r/xF/XFMRvDqi0i+TK2nSK/aSvr9P/IPU5uSdW4wQuY98RX9BjiXg2IVTiUEL5
 aq9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771260351; x=1771865151;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=il27DEcymwLna7hK1ELrrYkujYqTcKdi5syqhicz4KY=;
 b=n32GD50tJs+3LCva9HbwvQ5SydSc3bjkzwi2MiQNgu83InFr37bNQB8Wlkr8MfduuW
 kxBJLHj1xa9H5sKGEzDHQXnTtL7BdFsc7SwIeyAozi7Pu9zi1sWxyjBVFWi3jpO1ZZOM
 VNIZHrWTwmQEkGvHbQoXGzvoPb44nGJQQz9xn387ndfve+ZwutjVWHrN29xOsSiDpXt7
 BbdKTe8nUcogkNsTJJ10FZ99yttSA76wyb3QGy6yO24VeY/Uj5Uuewgk4kNoSrsg+v9f
 HW/fambNS+G5eztCebyEztdMXykKraCBQZ+gNt8l4L30Lg8CXOap/xIC3gOm8HobtlEj
 BG7A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXwFwZaJ33TDr/J/Vy7lgQhrzy50uY1UoB7Ye35aJ/jnHBqFn+fxW6nY+JESA5g3w4dywtgp5bZY3s=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyTmSB6B6koQZZQvsgfBfSjhx4noz38KROjgIZR4ic+Pms4TKWb
 wffxDoPq0OffcI8Niy6grPGCYKG8lSMcP6N9u+sistZTn4xKIxSUzICK
X-Gm-Gg: AZuq6aKds874dAYgBzgxo9/+nXsPM5SkdkToQolCBH8InPfU4Xgzoo6kL6wICQIxdRI
 H3MVFZMBlqf4CpN5AEIEIWfStS+pJpM5eG9tYgzZTMUY6JFhN8bbOFJS4mmmpQIH0Q2suehbhFZ
 rKFrn608HiWwhnZFJV0/WrgHXGcwgfTw7m1yakh23P+bgYF/9T8jTutWlNnE6/hTnWUlf0LtCJW
 ZsnijnprQZt2Gy2add/Za5ov0uuGS9iWtqtAqrVa7cD8V8TW0iI0XeFLieqPtEyQDdrSMaamng3
 wOz3ZQGyWDGBDOVNZnwVlsQh2nq76p3aiPBVhv/lZcpUSqGDoRm4o9aq9YIOP2t8sDAYDlDd5ls
 oF+sm1zKxeIw67O8l8jS6pCdB/mTyf4T4o+RSoe4JOYXASMOMHh7FWVRonl8sJ3UI4Mram7dklI
 Vy+i6Gaugrhxbza4vHqP866kX4SxbOIwN6NG7o4uWGAPNCb9pKm5Y0nZlQ0k5TkVNSNEaVt6gbA
 QTa
X-Received: by 2002:a17:906:6a24:b0:b87:3c3a:cb7e with SMTP id
 a640c23a62f3a-b8face00ea5mr368595266b.6.1771260351124; 
 Mon, 16 Feb 2026 08:45:51 -0800 (PST)
Received: from laptok.lan (87-205-5-123.static.ip.netia.com.pl. [87.205.5.123])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8fc735d185sm264683866b.14.2026.02.16.08.45.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Feb 2026 08:45:50 -0800 (PST)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: alexander.deucher@amd.com,
	harry.wentland@amd.com,
	sunpeng.li@amd.com
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, siqueira@igalia.com,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, tomasz.pakula.oficjalny@gmail.com,
 bernhard.berger@gmail.com, michel.daenzer@mailbox.org, daniel@fooishbar.org
Subject: [PATCH v4 24/27] drm: Add passive_vrr_capable property to connector
Date: Mon, 16 Feb 2026 17:45:13 +0100
Message-ID: <20260216164516.36803-25-tomasz.pakula.oficjalny@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260216164516.36803-1-tomasz.pakula.oficjalny@gmail.com>
References: <20260216164516.36803-1-tomasz.pakula.oficjalny@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:alexander.deucher@amd.com,m:harry.wentland@amd.com,m:sunpeng.li@amd.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:siqueira@igalia.com,m:amd-gfx@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:tomasz.pakula.oficjalny@gmail.com,m:bernhard.berger@gmail.com,m:michel.daenzer@mailbox.org,m:daniel@fooishbar.org,m:tomaszpakulaoficjalny@gmail.com,m:bernhardberger@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[16];
	ARC_NA(0.00)[];
	TAGGED_FROM(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER(0.00)[tomaszpakulaoficjalny@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tomaszpakulaoficjalny@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FREEMAIL_CC(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,igalia.com,lists.freedesktop.org,vger.kernel.org,mailbox.org,fooishbar.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 1A7851465D3
X-Rspamd-Action: no action

Supplement to the passive_vrr_disabled crtc property

Drivers can add the property to a connector with
drm_connector_attach_passive_vrr_capable_property().
The value should be updated based on driver and hardware capability
by using drm_connector_set_passive_vrr_capable_property().

Signed-off-by: Tomasz Pakuła <tomasz.pakula.oficjalny@gmail.com>
---
 drivers/gpu/drm/drm_connector.c | 73 +++++++++++++++++++++++++++++++++
 include/drm/drm_connector.h     | 15 +++++++
 2 files changed, 88 insertions(+)

diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index 272d6254ea47..5bb38b80e214 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -2346,6 +2346,16 @@ EXPORT_SYMBOL(drm_mode_create_scaling_mode_property);
  *
  *	Absence of the property should indicate absence of support.
  *
+ * "passive_vrr_capable":
+ *	Optional &drm_connector boolean property that drivers should attach
+ *	with drm_connector_attach_passive_vrr_capable_property() on
+ *	connectors that could support keeping variable refresh rate signalling
+ *	in fixed-refresh rate scenarios like desktop work. Drivers should update
+ *	the property value by calling
+ *	drm_connector_set_passive_vrr_capable_property().
+ *
+ *	Absence of the property should indicate absence of support.
+ *
  * "VRR_ENABLED":
  *	Default &drm_crtc boolean property that notifies the driver that the
  *	content on the CRTC is suitable for variable refresh rate presentation.
@@ -2364,6 +2374,17 @@ EXPORT_SYMBOL(drm_mode_create_scaling_mode_property);
  *
  *	The driver may place further restrictions within these minimum
  *	and maximum bounds.
+ *
+ * "PASSIVE_VRR_DISABLED":
+ *	Default &drm_crtc boolean property that notifies the driver that the
+ *	VRR singalling should be disabled in fixed refresh rate scenarios.
+ *	Functionally, psssive vrr works the same as VRR_ENABLED == false
+ *	but works around displays blanking (mainly HDMI) that do not support
+ *	seamless VRR transitions. Also helps with brightness flickering during
+ *	VRR transitions.
+ *
+ *	Passive VRR mode is not that useful for DP/eDP sinks where seamless VRR
+ *	transitions are enforced by the standard.
  */
 
 /**
@@ -2397,6 +2418,37 @@ int drm_connector_attach_vrr_capable_property(
 }
 EXPORT_SYMBOL(drm_connector_attach_vrr_capable_property);
 
+/**
+ * drm_connector_attach_passive_vrr_capable_property - creates the
+ * passive_vrr_capable property
+ * @connector: connector to create the passive_vrr_capable property on.
+ *
+ * This is used by atomic drivers to add support for querying
+ * variable refresh rate on desktop capability for a connector.
+ *
+ * Returns:
+ * Zero on success, negative errno on failure.
+ */
+int drm_connector_attach_passive_vrr_capable_property(
+	struct drm_connector *connector)
+{
+	struct drm_device *dev = connector->dev;
+	struct drm_property *prop;
+
+	if (!connector->passive_vrr_capable_property) {
+		prop = drm_property_create_bool(dev, DRM_MODE_PROP_IMMUTABLE,
+			"passive_vrr_capable");
+		if (!prop)
+			return -ENOMEM;
+
+		connector->passive_vrr_capable_property = prop;
+		drm_object_attach_property(&connector->base, prop, 0);
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL(drm_connector_attach_passive_vrr_capable_property);
+
 /**
  * drm_connector_attach_scaling_mode_property - attach atomic scaling mode property
  * @connector: connector to attach scaling mode property on.
@@ -2968,6 +3020,27 @@ void drm_connector_set_vrr_capable_property(
 }
 EXPORT_SYMBOL(drm_connector_set_vrr_capable_property);
 
+/**
+ * drm_connector_set_passive_vrr_disabled_capable_property - sets the variable refresh
+ * rate on desktop capable property for a connector
+ * @connector: drm connector
+ * @capable: True if the connector is variable refresh rate on desktop capable
+ *
+ * Should be used by atomic drivers to update the indicated support for
+ * variable refresh rate on desktop over a connector.
+ */
+void drm_connector_set_passive_vrr_capable_property(
+		struct drm_connector *connector, bool capable)
+{
+	if (!connector->passive_vrr_capable_property)
+		return;
+
+	drm_object_property_set_value(&connector->base,
+				      connector->passive_vrr_capable_property,
+				      capable);
+}
+EXPORT_SYMBOL(drm_connector_set_passive_vrr_capable_property);
+
 /**
  * drm_connector_set_panel_orientation - sets the connector's panel_orientation
  * @connector: connector for which to set the panel-orientation property.
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index dab9d5521f41..30dd9737bfe0 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -2101,6 +2101,17 @@ struct drm_connector {
 	 */
 	struct drm_property *vrr_capable_property;
 
+	/**
+	 * @passive_vrr_capable_property: Optional property to help userspace
+	 * query hardware support for passive variable refresh rate on a
+	 * connector. Drivers can add the property to a connector by
+	 * calling drm_connector_attach_passive_vrr_capable_property().
+	 *
+	 * This should be updated only by calling
+	 * drm_connector_set_passive_vrr_capable_property().
+	 */
+	struct drm_property *passive_vrr_capable_property;
+
 	/**
 	 * @colorspace_property: Connector property to set the suitable
 	 * colorspace supported by the sink.
@@ -2495,6 +2506,8 @@ int drm_connector_attach_scaling_mode_property(struct drm_connector *connector,
 					       u32 scaling_mode_mask);
 int drm_connector_attach_vrr_capable_property(
 		struct drm_connector *connector);
+int drm_connector_attach_passive_vrr_capable_property(
+		struct drm_connector *connector);
 int drm_connector_attach_broadcast_rgb_property(struct drm_connector *connector);
 int drm_connector_attach_colorspace_property(struct drm_connector *connector);
 int drm_connector_attach_hdr_output_metadata_property(struct drm_connector *connector);
@@ -2517,6 +2530,8 @@ void drm_connector_set_link_status_property(struct drm_connector *connector,
 					    uint64_t link_status);
 void drm_connector_set_vrr_capable_property(
 		struct drm_connector *connector, bool capable);
+void drm_connector_set_passive_vrr_capable_property(
+		struct drm_connector *connector, bool capable);
 int drm_connector_set_panel_orientation(
 	struct drm_connector *connector,
 	enum drm_panel_orientation panel_orientation);
-- 
2.53.0

