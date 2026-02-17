Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SG5DKcFclGm3DAIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 17 Feb 2026 13:19:13 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F38BE14BDD2
	for <lists+dri-devel@lfdr.de>; Tue, 17 Feb 2026 13:19:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 044AB10E249;
	Tue, 17 Feb 2026 12:19:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="J+0JS3bT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60B8410E250
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Feb 2026 12:19:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329; h=Cc:To:In-Reply-To:References:Message-Id:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4i24J01WSrTGFXgUWBWrpPuRCwSwcV1qotLmUQ3EK9Y=; b=J+0JS3bTAA2dKpd6bltVevh+7O
 n6eQ/lPgC8C6bmC+mgMrVDAx2XquknXXVArwva9FqOQoVX7ih2jdnK6WS00quH2twVemljrbsZ4rM
 UZGMbiiFiyUUijKJ46c0R1sIVilDcU1GxwfaVvI7eSufgDmJ0bPSt6hldATSEerkMpRxC0i9tepo2
 EnXhFGRpj5iqiMTP4CD5aQZ2TvxhZOJIGEVhv8sn0N7EjRAtmZaC5hplm5kLx2iKe5ajD5tfIIZM1
 74ASLu+i9WQua1keXsfMPP8LOccyddgPVMzC3ANBnw771hduBGd3TwpSp/7G3JP8Md/18BJJapjlk
 5wcZLw9g==;
Received: from [187.36.210.68] (helo=janis.local)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1vsK2i-001eTt-5m; Tue, 17 Feb 2026 13:19:04 +0100
From: =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
Date: Tue, 17 Feb 2026 09:18:49 -0300
Subject: [PATCH 1/6] drm/v3d: Handle error from drm_sched_entity_init()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260217-v3d-reset-locking-improv-v1-1-0db848016869@igalia.com>
References: <20260217-v3d-reset-locking-improv-v1-0-0db848016869@igalia.com>
In-Reply-To: <20260217-v3d-reset-locking-improv-v1-0-0db848016869@igalia.com>
To: Melissa Wen <mwen@igalia.com>, 
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, 
 Maxime Ripard <mripard@kernel.org>
Cc: kernel-dev@igalia.com, dri-devel@lists.freedesktop.org, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1846; i=mcanal@igalia.com;
 h=from:subject:message-id; bh=pY6XLbJElNzC+SjJVZuCUq7Odirb1owp1CQc7x7/BlE=;
 b=owGbwMvMwMFo/5mvq6zj1yrG02pJDJlTYjY7vbXhd9Ru/K152eqptqTWfPUnDx7fCam0KU1rr
 Nh0ouN0J6MxCwMjB4OsmCLLjyextYxi5eyay8ovwgxiZQKZwsDFKQAT4dPiYFg7mfHIIZfWo5VB
 dz+6aDta2q7klQ+r7OXQeFlzcKKtxUEf0UlROcaudzY9ZDl0a37BxFezc5YpJ8z7X+H0cpJQtrV
 AqZvy03nGf7X8D0xt/DfH0Nx29TQe0/mKzi0eN/qqttnPbTnLtTRF2Eg7wGbWzlKfxcqBPk4TVJ
 0N5p0XYgpjmc6Y//S4RG4Yy6ZjjXIynqfNJHTmc1tpn+yR2LmVU17zOHPbnPUz2rRPF8pcFbZQt
 NnPLvNPLkhQ63b90urjB0yWRnvbneWYEsAVtES078mkL+v/ORuUz1ZZebvHOqEhLuFBZdueBzVK
 6w25+Dt6Fpo/kLD52SBUeMNo1eHuNS+uKq1cuklOkm07AA==
X-Developer-Key: i=mcanal@igalia.com; a=openpgp;
 fpr=F8E45D7D0116770729A677D13FF30E8A7688FAAA
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
X-Spamd-Result: default: False [0.49 / 15.00];
	R_DKIM_REJECT(1.00)[igalia.com:s=20170329];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	DMARC_POLICY_SOFTFAIL(0.10)[igalia.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:mwen@igalia.com,m:tvrtko.ursulin@igalia.com,m:mripard@kernel.org,m:kernel-dev@igalia.com,m:mcanal@igalia.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[mcanal@igalia.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mcanal@igalia.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[igalia.com:-];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6]
X-Rspamd-Queue-Id: F38BE14BDD2
X-Rspamd-Action: no action

drm_sched_entity_init() can fail but its return value is currently being
ignored in v3d_open(). Check the return value and properly unwind
on failure by destroying any already-initialized scheduler entities.

Fixes: 57692c94dcbe ("drm/v3d: Introduce a new DRM driver for Broadcom V3D V3.x+")
Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
 drivers/gpu/drm/v3d/v3d_drv.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/v3d/v3d_drv.c b/drivers/gpu/drm/v3d/v3d_drv.c
index 8de4f151a5c02cbf970e72933d1a275968088357..acdfd43af9ee4b66bf7c39ba8160106e4726738a 100644
--- a/drivers/gpu/drm/v3d/v3d_drv.c
+++ b/drivers/gpu/drm/v3d/v3d_drv.c
@@ -131,7 +131,7 @@ v3d_open(struct drm_device *dev, struct drm_file *file)
 	struct v3d_dev *v3d = to_v3d_dev(dev);
 	struct v3d_file_priv *v3d_priv;
 	struct drm_gpu_scheduler *sched;
-	int i;
+	int i, ret;
 
 	v3d_priv = kzalloc(sizeof(*v3d_priv), GFP_KERNEL);
 	if (!v3d_priv)
@@ -141,9 +141,11 @@ v3d_open(struct drm_device *dev, struct drm_file *file)
 
 	for (i = 0; i < V3D_MAX_QUEUES; i++) {
 		sched = &v3d->queue[i].sched;
-		drm_sched_entity_init(&v3d_priv->sched_entity[i],
-				      DRM_SCHED_PRIORITY_NORMAL, &sched,
-				      1, NULL);
+		ret = drm_sched_entity_init(&v3d_priv->sched_entity[i],
+					    DRM_SCHED_PRIORITY_NORMAL, &sched,
+					    1, NULL);
+		if (ret)
+			goto err_sched;
 
 		memset(&v3d_priv->stats[i], 0, sizeof(v3d_priv->stats[i]));
 		seqcount_init(&v3d_priv->stats[i].lock);
@@ -153,6 +155,12 @@ v3d_open(struct drm_device *dev, struct drm_file *file)
 	file->driver_priv = v3d_priv;
 
 	return 0;
+
+err_sched:
+	for (i--; i >= 0; i--)
+		drm_sched_entity_destroy(&v3d_priv->sched_entity[i]);
+	kfree(v3d_priv);
+	return ret;
 }
 
 static void

-- 
2.52.0

