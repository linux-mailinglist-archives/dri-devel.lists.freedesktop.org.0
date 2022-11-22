Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E0D46348CE
	for <lists+dri-devel@lfdr.de>; Tue, 22 Nov 2022 21:59:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 524F0888D9;
	Tue, 22 Nov 2022 20:59:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA85010E47B
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Nov 2022 20:59:06 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 49069618E8;
 Tue, 22 Nov 2022 20:59:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 203CEC4347C;
 Tue, 22 Nov 2022 20:59:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1669150745;
 bh=Zt/kpD0aXY1A90uSkAgBG4f7gdBrg4x2aVoHFeGMLbE=;
 h=From:Date:Subject:References:In-Reply-To:To:Reply-To:From;
 b=aqTGcRfw4GFG6BokaNmc817XBJVkNL/GCIlS5KhLNYdEZ31vI0iDQxK9p/ShSMjCn
 sSbjHpLebeP+xzPWYoSsamdwgICrox5LWf6O1wGdOgz8XOgu0mGkR1kPK8+QKbECKz
 9rqP50fns3fSjtg0LXKAeuf/Cb0wuqVcOHQK0AuJwsfscjcqqqHnvoxTS19zCxZcxk
 AAUMF6jvYa3DP6/NbnNUM2ssbZ+eeaowkLGc9DoN+4WVL2Kh5xKHqXAchlmvPodm5+
 aITHUNCM7HuftpZjsckEuNET0fl6CNtreZumwhuOW+DPNo+t1uhebswdQyF6VfGEgx
 KoDSJ0vTst6Ag==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id 03F32C43217;
 Tue, 22 Nov 2022 20:59:05 +0000 (UTC)
From: Noralf Trønnes via B4 Submission Endpoint <devnull@kernel.org>
Date: Tue, 22 Nov 2022 21:58:41 +0100
Subject: [PATCH 3/6] drm/gud: Don't retry a failed framebuffer flush
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <20221122-gud-shadow-plane-v1-3-9de3afa3383e@tronnes.org>
References: <20221122-gud-shadow-plane-v1-0-9de3afa3383e@tronnes.org>
In-Reply-To: <20221122-gud-shadow-plane-v1-0-9de3afa3383e@tronnes.org>
To: Thomas Zimmermann <tzimmermann@suse.de>, stable@kernel.org,
	Dave Airlie <airlied@redhat.com>, dri-devel@lists.freedesktop.org,
	Hans de Goede <hdegoede@redhat.com>,
	Noralf Trønnes <noralf@tronnes.org>,
	Maxime Ripard <mripard@kernel.org>,
	Javier Martinez Canillas <javierm@redhat.com>
X-Mailer: b4 0.10.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1669150743; l=3318;
 i=noralf@tronnes.org; s=20221122; h=from:subject:message-id;
 bh=WoqUfaV4qOjeTTioJmv/b108ZXmqpkiwyL9e90U7xn4=;
 b=nYE9PBMqUPKK8i4e9wDK0dwNQT6OCA8Sf4UlCzZhgOzAxpNIT8ralswP032gdY4PPrR628/q4uaX
 vbrD/g1RBsedTSdG6V89BgUtNt2krQ+W1DgjCtzRUwQ0ECQFDfYa
X-Developer-Key: i=noralf@tronnes.org; a=ed25519;
 pk=0o9is4iddvvlrY3yON5SVtAbgPnVs0LfQsjfqR2Hvz8=
X-Endpoint-Received: by B4 Submission Endpoint for noralf@tronnes.org/20221122
 with auth_id=8
X-Original-From: Noralf Trønnes <noralf@tronnes.org>
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
Reply-To: noralf@tronnes.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Noralf Trønnes <noralf@tronnes.org>

If a framebuffer flush fails the driver will do one retry by requeing the
worker. Currently the worker is used even for synchronous flushing, but a
later patch will inline it, so this needs to change. Thinking about how to
solve this I came to the conclusion that this retry mechanism was a fix
for a problem that was only in the mind of the developer (me) and not
something that solved a real problem.

So let's remove this for now and revisit later should it become necessary.
gud_add_damage() has now only one caller so it can be inlined.

Signed-off-by: Noralf Trønnes <noralf@tronnes.org>
---
 drivers/gpu/drm/gud/gud_pipe.c | 48 +++++++-----------------------------------
 1 file changed, 8 insertions(+), 40 deletions(-)

diff --git a/drivers/gpu/drm/gud/gud_pipe.c b/drivers/gpu/drm/gud/gud_pipe.c
index 61f4abaf1811..ff1358815af5 100644
--- a/drivers/gpu/drm/gud/gud_pipe.c
+++ b/drivers/gpu/drm/gud/gud_pipe.c
@@ -333,37 +333,6 @@ void gud_clear_damage(struct gud_device *gdrm)
 	gdrm->damage.y2 = 0;
 }
 
-static void gud_add_damage(struct gud_device *gdrm, struct drm_rect *damage)
-{
-	gdrm->damage.x1 = min(gdrm->damage.x1, damage->x1);
-	gdrm->damage.y1 = min(gdrm->damage.y1, damage->y1);
-	gdrm->damage.x2 = max(gdrm->damage.x2, damage->x2);
-	gdrm->damage.y2 = max(gdrm->damage.y2, damage->y2);
-}
-
-static void gud_retry_failed_flush(struct gud_device *gdrm, struct drm_framebuffer *fb,
-				   struct drm_rect *damage)
-{
-	/*
-	 * pipe_update waits for the worker when the display mode is going to change.
-	 * This ensures that the width and height is still the same making it safe to
-	 * add back the damage.
-	 */
-
-	mutex_lock(&gdrm->damage_lock);
-	if (!gdrm->fb) {
-		drm_framebuffer_get(fb);
-		gdrm->fb = fb;
-	}
-	gud_add_damage(gdrm, damage);
-	mutex_unlock(&gdrm->damage_lock);
-
-	/* Retry only once to avoid a possible storm in case of continues errors. */
-	if (!gdrm->prev_flush_failed)
-		queue_work(system_long_wq, &gdrm->work);
-	gdrm->prev_flush_failed = true;
-}
-
 void gud_flush_work(struct work_struct *work)
 {
 	struct gud_device *gdrm = container_of(work, struct gud_device, work);
@@ -407,14 +376,10 @@ void gud_flush_work(struct work_struct *work)
 		ret = gud_flush_rect(gdrm, fb, format, &rect);
 		if (ret) {
 			if (ret != -ENODEV && ret != -ECONNRESET &&
-			    ret != -ESHUTDOWN && ret != -EPROTO) {
-				bool prev_flush_failed = gdrm->prev_flush_failed;
-
-				gud_retry_failed_flush(gdrm, fb, &damage);
-				if (!prev_flush_failed)
-					dev_err_ratelimited(fb->dev->dev,
-							    "Failed to flush framebuffer: error=%d\n", ret);
-			}
+			    ret != -ESHUTDOWN && ret != -EPROTO)
+				dev_err_ratelimited(fb->dev->dev,
+						    "Failed to flush framebuffer: error=%d\n", ret);
+			gdrm->prev_flush_failed = true;
 			break;
 		}
 
@@ -439,7 +404,10 @@ static void gud_fb_queue_damage(struct gud_device *gdrm, struct drm_framebuffer
 		gdrm->fb = fb;
 	}
 
-	gud_add_damage(gdrm, damage);
+	gdrm->damage.x1 = min(gdrm->damage.x1, damage->x1);
+	gdrm->damage.y1 = min(gdrm->damage.y1, damage->y1);
+	gdrm->damage.x2 = max(gdrm->damage.x2, damage->x2);
+	gdrm->damage.y2 = max(gdrm->damage.y2, damage->y2);
 
 	mutex_unlock(&gdrm->damage_lock);
 

-- 
b4 0.10.1

