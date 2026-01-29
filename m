Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GK83H+Qoe2nRBwIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jan 2026 10:31:16 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 04E88AE2A4
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jan 2026 10:31:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F01910E83E;
	Thu, 29 Jan 2026 09:31:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="eY5dKRT0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8F4610E83E
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jan 2026 09:31:13 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 0447A1A2AF3;
 Thu, 29 Jan 2026 09:31:12 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id C6AC2606B6;
 Thu, 29 Jan 2026 09:31:11 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 68F0F119A884E; Thu, 29 Jan 2026 10:31:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1769679070; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding; bh=zk2OpegAMJiCNxvll5oNlkpQYOrJ2hMu552NiCOVNiI=;
 b=eY5dKRT0hRIq9ipGZUYAMiEZsHlKTidPAQEW6RaQ7xf3SuStvuMFa11gcUOa2wKHCijZdi
 6DNWPzK2JBvxPCxj1y0e6jB2DCdczafOjoUAo4pe06hHmgbUcQxrh1nAKKbN851CAWN8xU
 N8e1IqsAFV8LcqBoLqY5ouP3tt1fQFeHYgZ140SvxV02ckprHjAFpimGNFR0SxqFtzJFZ/
 m47Xly+7lNxmdI8ByFF/37q3eB3xtagjkW0P+JyW9yyWrdUb3vsnwaDS7m+MU/EgNd/ZKF
 sFAwcdbkOBClERvlfvZF2LTj4qTUAB4rn1Z2kd/njMg+8xpZghW89hJLWI5dVQ==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Thu, 29 Jan 2026 10:30:52 +0100
Subject: [PATCH] drm/bridge: drm_bridge_get/put(): document NULL pointer
 behaviour
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260129-drm-bridge-alloc-getput-document-null-check-v1-1-2e5334b9e78e@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAMsoe2kC/x2NQQqDMBAAvyJ77oIJVdp+pfQQN6sujYlsklIQ/
 97Q4zAwc0BmFc7w6A5Q/kiWFBuYSwe0urgwim8Mtrdjb+wdvW44qfhmXAiJcOGy14I+Ud04Fow
 1BKSV6Y1uGAyP1+k2k4FW3JVn+f5vz9d5/gAZN6w+fQAAAA==
X-Change-ID: 20260129-drm-bridge-alloc-getput-document-null-check-a551e64b8fc1
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Liu Ying <victor.liu@nxp.com>, Hui Pu <Hui.Pu@gehealthcare.com>, 
 Ian Ray <ian.ray@gehealthcare.com>, 
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
	RCPT_COUNT_TWELVE(0.00)[18];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:Laurent.pinchart@ideasonboard.com,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:victor.liu@nxp.com,m:Hui.Pu@gehealthcare.com,m:ian.ray@gehealthcare.com,m:thomas.petazzoni@bootlin.com,m:linux-kernel@vger.kernel.org,m:luca.ceresoli@bootlin.com,m:jernejskrabec@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[intel.com,linaro.org,kernel.org,ideasonboard.com,kwiboo.se,gmail.com,linux.intel.com,suse.de,ffwll.ch];
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
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:email,bootlin.com:dkim,bootlin.com:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 04E88AE2A4
X-Rspamd-Action: no action

drm_bridge_get and drm_bridge_put() do nothing when they are passed a NULL
pointer, and they do so since their initial addition in commit 30d1b37d4c02
("drm/bridge: add support for refcounting").

This allows simpler code in various places when using these
functions. However it's not documented, so it's not clear whether it is
part of the API "contract" or just a current implementation detail that
might change in the future.

There is no visible reason to remove this NULL check, so document it,
making it part of the contract, letting users count on it.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
Historical note: I thought this was documented from the beginning and
realized it's not the case when someone proposed adding a 'if (bridge)
drm_bridge_put(bridge)' to a driver [0]. Let's fix it now.

[0] https://lore.kernel.org/lkml/DG0CHD0TAH9A.27UW4KKY2O9V7@bootlin.com/
---
 drivers/gpu/drm/drm_bridge.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
index 3b165a0d1e77..3108249a63cd 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -282,7 +282,7 @@ static void __drm_bridge_free(struct kref *kref)
 
 /**
  * drm_bridge_get - Acquire a bridge reference
- * @bridge: DRM bridge
+ * @bridge: DRM bridge; if NULL this function does nothing
  *
  * This function increments the bridge's refcount.
  *
@@ -300,7 +300,7 @@ EXPORT_SYMBOL(drm_bridge_get);
 
 /**
  * drm_bridge_put - Release a bridge reference
- * @bridge: DRM bridge
+ * @bridge: DRM bridge; if NULL this function does nothing
  *
  * This function decrements the bridge's reference count and frees the
  * object if the reference count drops to zero.

---
base-commit: a50007089e078a1b7a826559a02277b1601ee189
change-id: 20260129-drm-bridge-alloc-getput-document-null-check-a551e64b8fc1

Best regards,
-- 
Luca Ceresoli <luca.ceresoli@bootlin.com>

