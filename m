Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +LpBBovNnWnfSAQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 17:10:51 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BCA5518995A
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 17:10:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6CD910E5D2;
	Tue, 24 Feb 2026 16:10:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="NF0SFbZj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD2DE10E5D2
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Feb 2026 16:10:44 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 4C46A6111B;
 Tue, 24 Feb 2026 16:10:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CEC2C19422;
 Tue, 24 Feb 2026 16:10:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1771949444;
 bh=h8cVjJ4PhHPG05vRMcMBUdaJ853tii2+rF35JscCHXc=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=NF0SFbZjnt6ZrEZrPMsQZ42B91LO7TFQi+qwEohgjWZCHEDnbHAT28WcPr8zbEhUf
 rOL6eOodNvNs5uSbnN/DwpmUx2Wsijads1LJDueNfwhecb77Smi9uzQqv4Qe1aDrEl
 lNY0LIvYc/nx1zok3TTySfB8o71kBrjPqXelU1dKLalO57CRxcwA+XPPbJ0m17zPOg
 MtRkkri5Eivw7x8g8h3BD6CHzuXKQBfH5XZynZrlG50QBpz6+p3Ni2FDMomEXgO3pN
 ru/FuMqKQ2/FZBbAaBsl5qdEr1DEFvI9YFQBxxQy6jbVTBOo1BT+gmj63Hw2jr/eJU
 pHiRjE+cDHszg==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 24 Feb 2026 17:10:27 +0100
Subject: [PATCH v5 2/4] drm/omapdrm: Switch private_obj initialization to
 atomic_create_state
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260224-drm-private-obj-reset-v5-2-5a72f8ec9934@kernel.org>
References: <20260224-drm-private-obj-reset-v5-0-5a72f8ec9934@kernel.org>
In-Reply-To: <20260224-drm-private-obj-reset-v5-0-5a72f8ec9934@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2099; i=mripard@kernel.org;
 h=from:subject:message-id; bh=h8cVjJ4PhHPG05vRMcMBUdaJ853tii2+rF35JscCHXc=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDJlzz1alz18jspDpt+R0X9MffVblrOZOc08Efj86uyozx
 +Lm/ItmHVNZGIQ5GWTFFFmeyISdXt6+uMrBfuUPmDmsTCBDGLg4BWAihecZG74H7iureuY/L7Xe
 d5XiyvzqHZsqp5tXHKz/5BYaY6K3ZYqJo4fVxmUXppyTXv94RmbJA8aG9nOzq5ltS68XXMvkL5v
 7+fIjvYxTs/3fTRbxkq/Y07DmpcwNLrM+/73pk+fvS58sJ5IGAA==
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
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
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:maarten.lankhorst@linux.intel.com,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:mripard@kernel.org,m:tomi.valkeinen@ideasonboard.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[linux.intel.com,suse.de,gmail.com,ffwll.ch];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[mripard@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mripard@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: BCA5518995A
X-Rspamd-Action: no action

The omapdrm driver relies on a drm_private_obj, that is initialized by
allocating and initializing a state, and then passing it to
drm_private_obj_init.

Since we're gradually moving away from that pattern to the more
established one relying on a atomic_create_state implementation, let's
migrate this instance to the new pattern.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---

Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/gpu/drm/omapdrm/omap_drv.c | 22 ++++++++++++++++------
 1 file changed, 16 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/omap_drv.c b/drivers/gpu/drm/omapdrm/omap_drv.c
index bf0bad8c8cf120baa124b439f3fcbfe36c976d12..90832b4b8c9dd540c8778cb39de7cf80e8796857 100644
--- a/drivers/gpu/drm/omapdrm/omap_drv.c
+++ b/drivers/gpu/drm/omapdrm/omap_drv.c
@@ -273,25 +273,35 @@ static void omap_global_destroy_state(struct drm_private_obj *obj,
 	struct omap_global_state *omap_state = to_omap_global_state(state);
 
 	kfree(omap_state);
 }
 
+static struct drm_private_state *
+omap_global_atomic_create_state(struct drm_private_obj *obj)
+{
+	struct omap_global_state *state;
+
+	state = kzalloc_obj(*state);
+	if (!state)
+		return ERR_PTR(-ENOMEM);
+
+	__drm_atomic_helper_private_obj_create_state(obj, &state->base);
+
+	return &state->base;
+}
+
 static const struct drm_private_state_funcs omap_global_state_funcs = {
+	.atomic_create_state = omap_global_atomic_create_state,
 	.atomic_duplicate_state = omap_global_duplicate_state,
 	.atomic_destroy_state = omap_global_destroy_state,
 };
 
 static int omap_global_obj_init(struct drm_device *dev)
 {
 	struct omap_drm_private *priv = dev->dev_private;
-	struct omap_global_state *state;
 
-	state = kzalloc_obj(*state);
-	if (!state)
-		return -ENOMEM;
-
-	drm_atomic_private_obj_init(dev, &priv->glob_obj, &state->base,
+	drm_atomic_private_obj_init(dev, &priv->glob_obj, NULL,
 				    &omap_global_state_funcs);
 	return 0;
 }
 
 static void omap_global_obj_fini(struct omap_drm_private *priv)

-- 
2.52.0

