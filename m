Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aDHhFkKXrmnRGQIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 09 Mar 2026 10:47:46 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CEA21236784
	for <lists+dri-devel@lfdr.de>; Mon, 09 Mar 2026 10:47:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D96210E1BF;
	Mon,  9 Mar 2026 09:47:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="lbjhWPUC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26C3210E1BF
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Mar 2026 09:47:42 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 65E40600AE;
 Mon,  9 Mar 2026 09:47:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 123A5C4CEF7;
 Mon,  9 Mar 2026 09:47:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1773049661;
 bh=T+6DAB5U+aymplM4EogtY9wqWk51pwq6UxFmNbuENE0=;
 h=From:Date:Subject:To:Cc:Reply-To:From;
 b=lbjhWPUCJHSftes96NCMGpzHXebi+S3dLYUq+GKngP44ztQHizROeBCrX7da4wJBa
 5aJZSZrjA3ntbmkAQou/Fxw5RhYxO1jPXdibD4+wIVPxiGWbG4f+Y0u2VOTxkfXtph
 svW3+hyrk6rx8CGRhY0bX6r08oLNb+7gfFnn41mLwYwNnyQvh1PGJ8+dOBwOQu/0Vx
 QU80YyfjDn3xfnARqnEeEe1h4oZpbMGXniN8w8Mp13ewg//vp9Ole7pxyggBlxtNjw
 yC6CSugJNW3m5lbfleFJwjcYyjWj2DssWu6lwJ4L3X3EI2WWKHsH/bMCX63yXtwXQI
 aPiVwvSTCJXEA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id EF910EFCD73;
 Mon,  9 Mar 2026 09:47:40 +0000 (UTC)
From: Hermes Wu via B4 Relay <devnull+Hermes.wu.ite.com.tw@kernel.org>
Date: Mon, 09 Mar 2026 17:47:39 +0800
Subject: [PATCH RESEND] drm/bridge: it6505: disable HDCP retry when KSV
 list timeout
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260309-disable-hdcp-auto-retry-v1-1-591a1d75a3a6@ite.com.tw>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Pet.Weng@ite.com.tw, Kenneth.Hung@ite.com.tw, treapking@chromium.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Hermes Wu <Hermes.wu@ite.com.tw>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773049659; l=1553;
 i=Hermes.wu@ite.com.tw; s=20241230; h=from:subject:message-id;
 bh=rCW3jddM8TQgyxZZEpHfDk8/Yn8r6UZLGkwB+J85M8A=;
 b=hTiNcbyw5vGsK42HIOpO38f6dTT8V3VldbcsXm+A0NycewASP4KkonH6md1vRsVg0EaOga/3Q
 pu5bVBYQ1WUCLkpwY1YsonU7Jl3/m8F2iNVAfDpbYP8MX+tIcwZhpE+
X-Developer-Key: i=Hermes.wu@ite.com.tw; a=ed25519;
 pk=qho5Dawp2WWj9CGyjtJ6/Y10xH8odjRdS6SXDaDAerU=
X-Endpoint-Received: by B4 Relay for Hermes.wu@ite.com.tw/20241230 with
 auth_id=310
X-Original-From: Hermes Wu <Hermes.wu@ite.com.tw>
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
Reply-To: Hermes.wu@ite.com.tw
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
X-Rspamd-Queue-Id: CEA21236784
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:Laurent.pinchart@ideasonboard.com,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:Pet.Weng@ite.com.tw,m:Kenneth.Hung@ite.com.tw,m:treapking@chromium.org,m:linux-kernel@vger.kernel.org,m:Hermes.wu@ite.com.tw,m:jernejskrabec@gmail.com,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[Hermes.wu.ite.com.tw];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[devnull@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[intel.com,linaro.org,kernel.org,ideasonboard.com,kwiboo.se,gmail.com,linux.intel.com,suse.de,ffwll.ch];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	HAS_REPLYTO(0.00)[Hermes.wu@ite.com.tw];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	NEURAL_HAM(-0.00)[-0.994];
	TAGGED_RCPT(0.00)[dri-devel];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ite.com.tw:replyto,ite.com.tw:email,ite.com.tw:mid,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

From: Hermes Wu <Hermes.wu@ite.com.tw>

Some DP to HDMI converters fail to report KSV list within the 6-second
HDCP window, causing the IT6505 to repeatedly restart authentication.
This results in continuous flickering on the connected HDMI monitor.

Disable automatic HDCP retry when KSV list timeout. This breaks the
re-auth loop and significantly improves stability/user experience with
problematic converters.

Signed-off-by: Hermes Wu <Hermes.wu@ite.com.tw>
---
 drivers/gpu/drm/bridge/ite-it6505.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ite-it6505.c b/drivers/gpu/drm/bridge/ite-it6505.c
index a094803ba7aa4e12165fcde432d4e6417fbf3676..1c1e6b78fadbf29da00a68e26671ce5b54ee1557 100644
--- a/drivers/gpu/drm/bridge/ite-it6505.c
+++ b/drivers/gpu/drm/bridge/ite-it6505.c
@@ -2238,7 +2238,7 @@ static void it6505_hdcp_wait_ksv_list(struct work_struct *work)
 		return;
 
 timeout:
-	it6505_start_hdcp(it6505);
+	it6505_stop_hdcp(it6505);
 }
 
 static void it6505_hdcp_work(struct work_struct *work)
@@ -2596,7 +2596,7 @@ static void it6505_irq_hdcp_fail(struct it6505 *it6505)
 	DRM_DEV_DEBUG_DRIVER(dev, "hdcp fail interrupt");
 	it6505->hdcp_status = HDCP_AUTH_IDLE;
 	it6505_show_hdcp_info(it6505);
-	it6505_start_hdcp(it6505);
+	it6505_stop_hdcp(it6505);
 }
 
 static void it6505_irq_aux_cmd_fail(struct it6505 *it6505)

---
base-commit: 38feb171b3f92d77e8061fafb5ddfffc2c13b672
change-id: 20260112-disable-hdcp-auto-retry-6a8d00f6ba29

Best regards,
-- 
Hermes Wu <Hermes.wu@ite.com.tw>


