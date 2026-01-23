Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8M8tA+TPc2kCywAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jan 2026 20:45:40 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B06137A435
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jan 2026 20:45:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C1F310EBD3;
	Fri, 23 Jan 2026 19:45:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="OfGUP//K";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-e108.zoho.com (sender4-pp-e108.zoho.com
 [136.143.188.108])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8540B10EBD2
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jan 2026 19:45:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1769197522; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=hNNULrcj1AJr1RkfjHxHuEZO+QQYS7r6AkFM3UjljZPaucLq5uTp/M+JnESLRFRE+3A0wJePmL9VXUgfSuH3ub9MIoZQllQso8Woamr+ST9ooCUksjxoLAkrMItR8f/u7mqp630K+91J+Jz/Avm9exD+Y89n0EHNXXiXO8pAPHU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1769197522;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=1PEjpErw/3Petkysh+3xd0dhTHn6vG457g9XrkwCPew=; 
 b=JBwcFI8PuYt+KT8Z/e/pRubo1Bt0cYCNKJSfk61Lpqolw2pJF3WfnM3DfP7DiehjIGXWUwVKYBEFTRER441VZ6zevvybwEjIayNsJqzGyIBv8RErWpkh4YZYqtO7QBQBvPY64UJbS7GNLbxlNzJdenQZCz4XI05svl6o/QnZZqo=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
 dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1769197522; 
 s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
 h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
 bh=1PEjpErw/3Petkysh+3xd0dhTHn6vG457g9XrkwCPew=;
 b=OfGUP//KU3b0QostuWYDjb8zGjWV6FbzR+OPUIrtomQoOpsDbJPkgmx5u+4XEym7
 NSE/29W14x7DmjhuEaMvLVHNePUBrPHdjXwnIu/iV49USdNCcUPaovsy7tua5b5htDU
 4RkPNP3W2J1ULzTMd3AK8Gzu47IDqflZebFCxepg=
Received: by mx.zohomail.com with SMTPS id 1769197520992670.7017319382686;
 Fri, 23 Jan 2026 11:45:20 -0800 (PST)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Fri, 23 Jan 2026 20:44:05 +0100
Subject: [PATCH v6 4/4] vkms: Pass the vkms connector as opposed to the
 device on hotplug
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260123-hot-plug-passup-v6-4-aaaf61d960bb@collabora.com>
References: <20260123-hot-plug-passup-v6-0-aaaf61d960bb@collabora.com>
In-Reply-To: <20260123-hot-plug-passup-v6-0-aaaf61d960bb@collabora.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=zohomail];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:ville.syrjala@linux.intel.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:louis.chauvet@bootlin.com,m:hamohammed.sa@gmail.com,m:melissa.srw@gmail.com,m:daniel.stone@collabora.com,m:ian.forbes@broadcom.com,m:dmitry.baryshkov@oss.qualcomm.com,m:linux-kernel@vger.kernel.org,m:kernel@collabora.com,m:nicolas.frattaroli@collabora.com,m:marius.vlad@collabora.com,m:hamohammedsa@gmail.com,m:melissasrw@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,bootlin.com,collabora.com,broadcom.com,oss.qualcomm.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER(0.00)[nicolas.frattaroli@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nicolas.frattaroli@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.701];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,collabora.com:email,collabora.com:dkim,collabora.com:mid]
X-Rspamd-Queue-Id: B06137A435
X-Rspamd-Action: no action

From: Marius Vlad <marius.vlad@collabora.com>

By passing the connector rather than the device to
vkms_trigger_connector_hotplug, vkms can trigger connector hotplugging
events that contain the connector ID.

Signed-off-by: Marius Vlad <marius.vlad@collabora.com>
Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 drivers/gpu/drm/vkms/vkms_configfs.c  | 2 +-
 drivers/gpu/drm/vkms/vkms_connector.c | 6 +++---
 drivers/gpu/drm/vkms/vkms_connector.h | 4 ++--
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_configfs.c b/drivers/gpu/drm/vkms/vkms_configfs.c
index d6e203d59b45..63a27f671e6a 100644
--- a/drivers/gpu/drm/vkms/vkms_configfs.c
+++ b/drivers/gpu/drm/vkms/vkms_configfs.c
@@ -554,7 +554,7 @@ static ssize_t connector_status_store(struct config_item *item,
 		vkms_config_connector_set_status(connector->config, status);
 
 		if (connector->dev->enabled && old_status != status)
-			vkms_trigger_connector_hotplug(connector->dev->config->dev);
+			vkms_trigger_connector_hotplug(connector->config->connector);
 	}
 
 	return (ssize_t)count;
diff --git a/drivers/gpu/drm/vkms/vkms_connector.c b/drivers/gpu/drm/vkms/vkms_connector.c
index b0a6b212d3f4..cad64eff72ea 100644
--- a/drivers/gpu/drm/vkms/vkms_connector.c
+++ b/drivers/gpu/drm/vkms/vkms_connector.c
@@ -88,9 +88,9 @@ struct vkms_connector *vkms_connector_init(struct vkms_device *vkmsdev)
 	return connector;
 }
 
-void vkms_trigger_connector_hotplug(struct vkms_device *vkmsdev)
+void vkms_trigger_connector_hotplug(struct vkms_connector *vkms_connector)
 {
-	struct drm_device *dev = &vkmsdev->drm;
+	struct drm_connector *connector = &vkms_connector->base;
 
-	drm_kms_helper_hotplug_event(dev);
+	drm_kms_helper_connector_hotplug_event(connector);
 }
diff --git a/drivers/gpu/drm/vkms/vkms_connector.h b/drivers/gpu/drm/vkms/vkms_connector.h
index ed312f4eff3a..7cd76d01b10b 100644
--- a/drivers/gpu/drm/vkms/vkms_connector.h
+++ b/drivers/gpu/drm/vkms/vkms_connector.h
@@ -28,8 +28,8 @@ struct vkms_connector *vkms_connector_init(struct vkms_device *vkmsdev);
 
 /**
  * vkms_trigger_connector_hotplug() - Update the device's connectors status
- * @vkmsdev: VKMS device to update
+ * @vkms_connector: VKMS connector to update
  */
-void vkms_trigger_connector_hotplug(struct vkms_device *vkmsdev);
+void vkms_trigger_connector_hotplug(struct vkms_connector *vkms_connector);
 
 #endif /* _VKMS_CONNECTOR_H_ */

-- 
2.52.0

