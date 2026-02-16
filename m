Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MD5fCvamk2ln7QEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 17 Feb 2026 00:23:34 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 951ED1480B6
	for <lists+dri-devel@lfdr.de>; Tue, 17 Feb 2026 00:23:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50D7C10E09A;
	Mon, 16 Feb 2026 23:23:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=puri.sm header.i=@puri.sm header.b="QLS2Glcc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ms.puri.sm (ms.puri.sm [135.181.196.210])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D329510E3DE
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Feb 2026 17:57:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=puri.sm; s=smtp2;
 t=1771264234; bh=HnHaDWwxSsNFIgUV3gQpgfEHIoHHNzLGF6Lw0uNaT3M=;
 h=From:Date:Subject:To:Cc;
 b=QLS2GlccCMOKnUVUrsjTxDomCQxN2jkH5eqGPLtTVruagEDoBmJRL7lb4o3hqJxxf
 6u1TeB/hWtXCZHJHljJb1kaZZT1+f2YQrhyX51bD25lRZjAToW9Xc1R8hcu3qrNOYF
 XeH72H8MqOasrmYUrtrykF2gAe9tdoSqMoSRH1CKgdpkIYkEPow3Vauoj5+RHQZTRC
 ejs5BoxBemEzPLIONvC/FkSNoyiDlnMJhSKSt+nEDXKkCeb/7IFLc5V35wnUbNG5NZ
 v+zHH77muP+rPx6W1VJSwV0XAku34MRRamecisDMSzP6bRGwq/fjDxqFVuNCwD0sUZ
 lKyXCTfyrV9jg==
Received: from pliszka.localdomain (83.24.23.188.ipv4.supernova.orange.pl
 [83.24.23.188]) by ms.puri.sm (Postfix) with ESMTPSA id A78691FEF5;
 Mon, 16 Feb 2026 09:50:32 -0800 (PST)
From: Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>
Date: Mon, 16 Feb 2026 18:50:18 +0100
Subject: [PATCH] drm/panel: mantix: Drop the shutdown callback
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260216-mantix-shutdown-v1-1-d2e93a8ccc4c@puri.sm>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MQQrCMBBA0auUWRtMg6biVcTFJJmaATuVTKqF0
 rsbXb7F/xsoFSaFa7dBoTcrz9LQHzqIGeVBhlMzOOu8db03E0rl1Wheapo/YsJ4SRb96TzEAVr
 1KjTy+j/e7s0BlUwoKDH/Pk+WRY8TaqUC+/4FCNp0VoAAAAA=
X-Change-ID: 20260216-mantix-shutdown-bf8d0a6457c7
To: =?utf-8?q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: kernel@puri.sm, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, 
 Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1547;
 i=sebastian.krzyszkowiak@puri.sm; h=from:subject:message-id;
 bh=HnHaDWwxSsNFIgUV3gQpgfEHIoHHNzLGF6Lw0uNaT3M=;
 b=owEBbQKS/ZANAwAKAejyNc8728P/AcsmYgBpk1joioZ/xkT3H/3IGRBl/cX625+ZlDuZ0ETBg
 hKAqupwNLeJAjMEAAEKAB0WIQQi3Z+uAGoRQ1g2YXzo8jXPO9vD/wUCaZNY6AAKCRDo8jXPO9vD
 /yT3EACs77yLSH7VECur5mYvX99OnWU778dtF1Sqw/P2VUATEZKvKp13+qFRqlApvHQ+KqM6bmz
 IXhe22mYRek212UG7063FxB6Ocpti0xrxuX7rTCxBsFLXaefgTDrdPRSfpB4vloJE9N53/GJmzR
 RAt7P7InPsy9sPTRdcz28yH4FXFXqH/jxpk+cGmPXLuRcQSCgmYT7X+RwDliPCwKgmq8JxMaAiX
 DTQXgXjdWgTgcIuE3oJDhUH1lQC7SGOwDPvecQ2GlIbVxQCCSQwTFi7/WIGXFl7AX/z1r/80apV
 YXAtWC4iz2qIyftyZpdz0jORxgXr2A0v9QgdWC8s7S2RguJL4mouljUxy8iOcN5bMBWHi3lFQRP
 CNW6UcnpaWiHl7xprizq96A8uFpw1ipxObMXX08bX8HRO7hVSC+7SeyiTkgCY74Op4oBPzvW/cR
 gEKBEpHLmmSLyBUk15trpEjwxJiJ07Cuqc3YW3Dw9yC7uD/jB8UWcw7y5AF5v9FnGnIfXRKMQ2/
 2mZQw+98EIbIc2eHu4c0wQU+U59/9yy7RQJkNj3z5wHtx/4TXKl+6m7NDP2ycJCHBUrPylurBRX
 E1geQ6HAOR4Y2+x7w+E5DO80oHCJbVGCLKNlI4Pu7szFoRQEDON6Y4dTQ8YFseZdBHRoBwxzE9R
 GVcQUfs01ZYs+Ug==
X-Developer-Key: i=sebastian.krzyszkowiak@puri.sm; a=openpgp;
 fpr=22DD9FAE006A11435836617CE8F235CF3BDBC3FF
X-Mailman-Approved-At: Mon, 16 Feb 2026 23:23:19 +0000
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
X-Spamd-Result: default: False [-0.61 / 15.00];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:agx@sigxcpu.org,m:neil.armstrong@linaro.org,m:jesszhan0024@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:kernel@puri.sm,m:linux-kernel@vger.kernel.org,m:sebastian.krzyszkowiak@puri.sm,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FREEMAIL_TO(0.00)[sigxcpu.org,linaro.org,gmail.com,linux.intel.com,kernel.org,suse.de,ffwll.ch];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[sebastian.krzyszkowiak@puri.sm,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	DKIM_TRACE(0.00)[puri.sm:?];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[sebastian.krzyszkowiak@puri.sm,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DMARC_DNSFAIL(0.00)[puri.sm : SPF/DKIM temp error,reject];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	R_DKIM_TEMPFAIL(0.00)[puri.sm:s=smtp2];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 951ED1480B6
X-Rspamd-Action: no action

It's the responsibility of the DRM modeset driver to unprepare
and disable the panel. Doing so here leads to regulator underflows.

Signed-off-by: Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>
---
 drivers/gpu/drm/panel/panel-mantix-mlaf057we51.c | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-mantix-mlaf057we51.c b/drivers/gpu/drm/panel/panel-mantix-mlaf057we51.c
index 13352cb4ad77..02e203e9f41a 100644
--- a/drivers/gpu/drm/panel/panel-mantix-mlaf057we51.c
+++ b/drivers/gpu/drm/panel/panel-mantix-mlaf057we51.c
@@ -295,20 +295,10 @@ static int mantix_probe(struct mipi_dsi_device *dsi)
 	return 0;
 }
 
-static void mantix_shutdown(struct mipi_dsi_device *dsi)
-{
-	struct mantix *ctx = mipi_dsi_get_drvdata(dsi);
-
-	drm_panel_unprepare(&ctx->panel);
-	drm_panel_disable(&ctx->panel);
-}
-
 static void mantix_remove(struct mipi_dsi_device *dsi)
 {
 	struct mantix *ctx = mipi_dsi_get_drvdata(dsi);
 
-	mantix_shutdown(dsi);
-
 	mipi_dsi_detach(dsi);
 	drm_panel_remove(&ctx->panel);
 }
@@ -323,7 +313,6 @@ MODULE_DEVICE_TABLE(of, mantix_of_match);
 static struct mipi_dsi_driver mantix_driver = {
 	.probe	= mantix_probe,
 	.remove = mantix_remove,
-	.shutdown = mantix_shutdown,
 	.driver = {
 		.name = DRV_NAME,
 		.of_match_table = mantix_of_match,

---
base-commit: 0f2acd3148e0ef42bdacbd477f90e8533f96b2ac
change-id: 20260216-mantix-shutdown-bf8d0a6457c7

Best regards,
-- 
Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>

