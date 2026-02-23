Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id JvjTAfz+m2mh+wMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 08:17:16 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 811E0172985
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 08:17:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C7F510E24F;
	Mon, 23 Feb 2026 07:17:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.b="eBzo7868";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="lsbbhVAg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 614DD10E24F;
 Mon, 23 Feb 2026 07:17:11 +0000 (UTC)
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1771831026;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=vex6uUERTZKOlhlGWb5TA6tfr5M9Yt1JYhVsOWZcm6Q=;
 b=eBzo78686n9u2ZnIhKPYOgLMLM467PT96gtjVJ9Hn5E3cuh0O+P37zvX76JnRz2V4bqrbp
 453EdjLTWU4FjIfZ0kia01c8vCfkictLxc0gko7Qj/PkhEkY3eUsOnV8T3xK/EGJm2NEkA
 JgIealSemfCJyoZnSvwLS99EsJLEdMhgOl1BlFJvIBa3g71tDd7+jI28zogYUlXDL+w43s
 mzVYfR0yss3HjinOXjds+fBsGJVpBdbNlblc1Iyeojbl92TpF+2a/cUiuHb061hm6+tt3z
 waug2fFkKh1xHsqWxpDzvoVJEeZF8cgQAeOvtljAZXnXs995Hbg6y/A00fmlzg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1771831026;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=vex6uUERTZKOlhlGWb5TA6tfr5M9Yt1JYhVsOWZcm6Q=;
 b=lsbbhVAg2mt2OZvqKr5tfwVfNcBouubtHJAyzCgO6wOAjENeEi2Cmuxic1MOOcvPUH9RrD
 Hjh3PgKB0yFW2KBA==
Date: Mon, 23 Feb 2026 08:16:55 +0100
Subject: [PATCH] drm/msm/dpu: Don't use %pK through printk (again)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260223-restricted-pointers-msm-v1-1-14c0b451e372@linutronix.de>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MMQqAMAxA0atIZgNapYNXEQdtU83QKkkRoXh3i
 +Mb/i+gJEwKU1NA6GblM1X0bQPuWNNOyL4aTGdsZ8yAQpqFXSaP18kpkyhGjejtGga/hX7cLNT
 6Egr8/Od5ed8Po4sXGmkAAAA=
X-Change-ID: 20260223-restricted-pointers-msm-d6af3dbf14b6
To: Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1771831020; l=1609;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=ydC9ZYn9dv7geOT9yMIAu01E9Fk5oooAlrjdOpuCrdo=;
 b=0rtDYIrbE3QcIjVM9CfBHXFdO6mMJZ3hPT7DjgMCnacaElPeXOJwuFNxlIrqqpnVhSPmbmJxL
 FM7L3GgwfP7BTGB+wK8dkbe5izwjDLEDYuGysiZRa75StTBbbh8fSVC
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
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
	DMARC_POLICY_ALLOW(-0.50)[linutronix.de,none];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[linutronix.de:s=2020,linutronix.de:s=2020e];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linutronix.de:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_NEQ_ENVFROM(0.00)[thomas.weissschuh@linutronix.de,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,linutronix.de:mid,linutronix.de:dkim,linutronix.de:email]
X-Rspamd-Queue-Id: 811E0172985
X-Rspamd-Action: no action

In the past %pK was preferable to %p as it would not leak raw pointer
values into the kernel log.
Since commit ad67b74d2469 ("printk: hash addresses printed with %p")
the regular %p has been improved to avoid this issue.
Furthermore, restricted pointers ("%pK") were never meant to be used
through printk(). They can still unintentionally leak raw pointers or
acquire sleeping locks in atomic contexts.

Switch to the regular pointer formatting which is safer and
easier to reason about.

This was previously fixed in this driver in commit 1ba9fbe40337
("drm/msm: Don't use %pK through printk") but an additional usage
was reintroduced in commit 39a750ff5fc9 ("drm/msm/dpu: Add DSPP GC
driver to provide GAMMA_LUT DRM property")

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c
index 188ee0af2c90..23dcbe1ce1b8 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c
@@ -89,7 +89,7 @@ static void dpu_setup_dspp_gc(struct dpu_hw_dspp *ctx,
 	base = ctx->cap->sblk->gc.base;
 
 	if (!base) {
-		DRM_ERROR("invalid ctx %pK gc base\n", ctx);
+		DRM_ERROR("invalid ctx %p gc base\n", ctx);
 		return;
 	}
 

---
base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
change-id: 20260223-restricted-pointers-msm-d6af3dbf14b6

Best regards,
-- 
Thomas Weißschuh <thomas.weissschuh@linutronix.de>

