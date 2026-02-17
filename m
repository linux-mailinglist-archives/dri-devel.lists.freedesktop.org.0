Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YD2DKvi6lGmKHQIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 17 Feb 2026 20:01:12 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 25BAB14F6D8
	for <lists+dri-devel@lfdr.de>; Tue, 17 Feb 2026 20:01:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E2A910E1D6;
	Tue, 17 Feb 2026 19:01:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="fsZfTCEN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7659910E4E5
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Feb 2026 19:01:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1771354856; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=l3ZHZSLmx6nemgYDe4yIG3Tk0f2od/tGCpeMB0z7+mdY4GpTRrvxNBl+rJ6lroBEvYIrcEy9+VknHumQ8qO/Yv9aoD7cPavDEB/tBKd/2SeEpz67wtl3qF2zvyzw5d1KwpL487U68sUIqtHPV8A08k0B0vI9iNQryXu0vqf95I8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1771354856;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=/d0BRo433OI/KcFL3NEdQN9ck7d6byNdXS2fhxmuxJ8=; 
 b=M+zjik/w47L1RCqsGSUwD7P/XEHF+CaRtRTC1xM3gxeIb71OPW+TQIEfm6zakB1gIyovybBI8pDDHueLL0xVxk8NRW3tFzV1Q2s8TqA91hIHltNaJ4a13aDi+CeM0ZLhV4D0S7rapVk+uPMU+D1iEaZdCrBoDmAO0EYGZkOR+Sk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
 dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1771354856; 
 s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
 h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
 bh=/d0BRo433OI/KcFL3NEdQN9ck7d6byNdXS2fhxmuxJ8=;
 b=fsZfTCENji5PFVGwv4xZTsaklIYXRoxSuY94vf+twCICwbUDiESFmAsiyLokO/Av
 tYmCEunrLe0V1IlhlT/D3i+oDRv1QGfpMoKN060vtYZdhQ3vyCztoL3TKk/4oaSWkZq
 LXk2IlF2u2+DqxtPrmR8KtbSetc8cKkmWNV6SDHE=
Received: by mx.zohomail.com with SMTPS id 1771354854023702.6782797187954;
 Tue, 17 Feb 2026 11:00:54 -0800 (PST)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Tue, 17 Feb 2026 20:00:23 +0100
Subject: [PATCH v7 1/2] drm: Introduce pending_hp to drm_connector
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260217-hot-plug-passup-v7-1-f8221b2aab51@collabora.com>
References: <20260217-hot-plug-passup-v7-0-f8221b2aab51@collabora.com>
In-Reply-To: <20260217-hot-plug-passup-v7-0-f8221b2aab51@collabora.com>
To: =?utf-8?q?Ville_Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Louis Chauvet <louis.chauvet@bootlin.com>, 
 Haneen Mohammed <hamohammed.sa@gmail.com>, 
 Melissa Wen <melissa.srw@gmail.com>, 
 Daniel Stone <daniel.stone@collabora.com>, 
 Ian Forbes <ian.forbes@broadcom.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 kernel@collabora.com, Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, 
 Marius Vlad <marius.vlad@collabora.com>
X-Mailer: b4 0.14.3
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
X-Spamd-Result: default: False [-0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[zohomail.com:s=zohoarc:i=1];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=zohomail];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:ville.syrjala@linux.intel.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:louis.chauvet@bootlin.com,m:hamohammed.sa@gmail.com,m:melissa.srw@gmail.com,m:daniel.stone@collabora.com,m:ian.forbes@broadcom.com,m:dmitry.baryshkov@oss.qualcomm.com,m:linux-kernel@vger.kernel.org,m:kernel@collabora.com,m:nicolas.frattaroli@collabora.com,m:marius.vlad@collabora.com,m:hamohammedsa@gmail.com,m:melissasrw@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER(0.00)[nicolas.frattaroli@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FREEMAIL_TO(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,bootlin.com,collabora.com,broadcom.com,oss.qualcomm.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nicolas.frattaroli@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 25BAB14F6D8
X-Rspamd-Action: no action

From: Marius Vlad <marius.vlad@collabora.com>

Introduce a new boolean variable used to track whether a connector has
changed its status since the last hotplug event for it was sent to
userspace. It is used by both the polling and HPD path.

A subsequent change will make use of this new member to propagate
per-connector udev hotplug events to userspace, rather than sending a
global hotplug event.

Signed-off-by: Marius Vlad <marius.vlad@collabora.com>
Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 drivers/gpu/drm/drm_connector.c    |  1 +
 drivers/gpu/drm/drm_probe_helper.c | 17 +++++++++++++++++
 drivers/gpu/drm/drm_sysfs.c        |  2 ++
 include/drm/drm_connector.h        |  3 +++
 4 files changed, 23 insertions(+)

diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index aec05adbc889..67497d0e41f1 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -274,6 +274,7 @@ static int drm_connector_init_only(struct drm_device *dev,
 
 	/* provide ddc symlink in sysfs */
 	connector->ddc = ddc;
+	connector->pending_hp = false;
 
 	INIT_LIST_HEAD(&connector->head);
 	INIT_LIST_HEAD(&connector->global_connector_list_entry);
diff --git a/drivers/gpu/drm/drm_probe_helper.c b/drivers/gpu/drm/drm_probe_helper.c
index d4dc8cb45bce..f8cbd6713960 100644
--- a/drivers/gpu/drm/drm_probe_helper.c
+++ b/drivers/gpu/drm/drm_probe_helper.c
@@ -732,6 +732,17 @@ EXPORT_SYMBOL(drm_helper_probe_single_connector_modes);
  */
 void drm_kms_helper_hotplug_event(struct drm_device *dev)
 {
+	struct drm_connector *connector;
+	struct drm_connector_list_iter conn_iter;
+
+	mutex_lock(&dev->mode_config.mutex);
+	drm_connector_list_iter_begin(dev, &conn_iter);
+	drm_for_each_connector_iter(connector, &conn_iter) {
+		connector->pending_hp = false;
+	}
+	drm_connector_list_iter_end(&conn_iter);
+	mutex_unlock(&dev->mode_config.mutex);
+
 	drm_sysfs_hotplug_event(dev);
 	drm_client_dev_hotplug(dev);
 }
@@ -748,6 +759,10 @@ void drm_kms_helper_connector_hotplug_event(struct drm_connector *connector)
 {
 	struct drm_device *dev = connector->dev;
 
+	mutex_lock(&dev->mode_config.mutex);
+	connector->pending_hp = false;
+	mutex_unlock(&dev->mode_config.mutex);
+
 	drm_sysfs_connector_hotplug_event(connector);
 	drm_client_dev_hotplug(dev);
 }
@@ -837,6 +852,7 @@ static void output_poll_execute(struct work_struct *work)
 				    old_epoch_counter, connector->epoch_counter);
 
 			changed = true;
+			connector->pending_hp = true;
 		}
 	}
 	drm_connector_list_iter_end(&conn_iter);
@@ -1101,6 +1117,7 @@ bool drm_helper_hpd_irq_event(struct drm_device *dev)
 				first_changed_connector = connector;
 			}
 
+			connector->pending_hp = true;
 			changed++;
 		}
 	}
diff --git a/drivers/gpu/drm/drm_sysfs.c b/drivers/gpu/drm/drm_sysfs.c
index b01ffa4d6509..53076c2afd12 100644
--- a/drivers/gpu/drm/drm_sysfs.c
+++ b/drivers/gpu/drm/drm_sysfs.c
@@ -216,6 +216,8 @@ static ssize_t status_store(struct device *device,
 			    connector->base.id, connector->name,
 			    old_force, connector->force);
 
+		connector->pending_hp = true;
+
 		connector->funcs->fill_modes(connector,
 					     dev->mode_config.max_width,
 					     dev->mode_config.max_height);
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index c18be8c19de0..cd9787c54425 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -2191,6 +2191,9 @@ struct drm_connector {
 	/** @force: a DRM_FORCE_<foo> state for forced mode sets */
 	enum drm_connector_force force;
 
+	/** @pending_hp: true if connector changed since last hotplug event */
+	bool pending_hp;
+
 	/**
 	 * @edid_override: Override EDID set via debugfs.
 	 *

-- 
2.53.0

