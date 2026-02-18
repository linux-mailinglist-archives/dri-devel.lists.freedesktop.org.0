Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iKEvECb+lWkDYAIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 18 Feb 2026 19:00:06 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CA30158745
	for <lists+dri-devel@lfdr.de>; Wed, 18 Feb 2026 19:00:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9EF710E28A;
	Wed, 18 Feb 2026 18:00:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=puri.sm header.i=@puri.sm header.b="EuP5iims";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ms.puri.sm (ms.puri.sm [135.181.196.210])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3388C10E28A
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Feb 2026 18:00:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=puri.sm; s=smtp2;
 t=1771437598; bh=hK2Hidrn3JSH5YVVXdg/+CyVKuFR4gUJBJGeUCnYDyI=;
 h=From:Date:Subject:To:Cc;
 b=EuP5iimsREVbP5XWCShyq1NHeEuDTDka9netTMiBfUKAqdb7cDVnWki1Y13Qa4pY7
 XHwmwXomtLWegk91eeJvDSLfrPcKvwf9Rl2wu1m9wk1lPnUTc2Z4kGfywwGYwkeN0c
 5OttrOO8GVY9Y1ENiurO4Stov0cib1qhVYdAuP3QW2PQEW2QhSui1YKCndXT+fKpln
 20Vtka23bsEufXuoNb7ScB0EJ0AbseVlfXBRVkQQTEaPGSUdlZuTvjEpZwgL0dfR/2
 mre+ZWB9+XbxL1vPRj9DHUdxvhR3PeWzObIyqy4G0ACJ5tvhmAQZ9hBw1q+wCGou7C
 SrEWMhDMjnrww==
Received: from pliszka.localdomain (79.184.40.11.ipv4.supernova.orange.pl
 [79.184.40.11]) by ms.puri.sm (Postfix) with ESMTPSA id D5F9C1F6B7;
 Wed, 18 Feb 2026 09:59:56 -0800 (PST)
From: Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>
Date: Wed, 18 Feb 2026 18:59:15 +0100
Subject: [PATCH] drm/bridge: nwl-dsi: Choose burst mode over non-burst with
 sync pulse
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260218-nwl-dsi-burst-v1-1-6c30cb0585e4@puri.sm>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MQQrCQAxA0auUrA3OTKWoV5EuMtNoAzVK0qpQe
 ndHl2/x/wrOJuxwblYwfonLQyviroEykt4YZaiGFFIXUjyiviccXDAv5jPGtiuH0hKfKEBtnsZ
 X+fx/l746kzNmIy3j7zKJLr6/k89ssG1fkAFXHn4AAAA=
X-Change-ID: 20260218-nwl-dsi-burst-136c4c3ae9a0
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: kernel@puri.sm, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, 
 Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2761;
 i=sebastian.krzyszkowiak@puri.sm; h=from:subject:message-id;
 bh=hK2Hidrn3JSH5YVVXdg/+CyVKuFR4gUJBJGeUCnYDyI=;
 b=owEBbQKS/ZANAwAKAejyNc8728P/AcsmYgBplf4cfRJECZIx5VKH+/F/6EnsNrisv3xn5faXT
 NKckJo0nA+JAjMEAAEKAB0WIQQi3Z+uAGoRQ1g2YXzo8jXPO9vD/wUCaZX+HAAKCRDo8jXPO9vD
 /4EjEAC/18/7T0lkTFdCXpxU26T/HH7MGlq5mPhSP0WJi9ERl+/vbHalI53kHtF5OYPAtZ5bs65
 OFJkKoNkUEuD9r/+rrZ4g9FwLmb41AVmejhXChwB7FZldK7idvPtL8w01MTSrz8Dk6Ingln2XK5
 lDC7MSPTB+AxxYECCWQmxILvr2P6ryrTUQoT5d+egtSlIduKDTB7s6WPZHyTnMlvRd1RaD+BViu
 tRriQtAG4aB0KMiXTTHkPdaGy0VUqtXZ9OwGWbtGMrRs/YPmSLaZbV0P4LLUEJ2Vq8YvYcdWCbH
 AD53lxr49IuQOv3nxs7O+pkcdB2jItNUnzlaXFRD99Ecqp20wQF/7IfjCfGUcfAQFDPD+HsTJJH
 kKPdCzge9+oWJTGAUZ9oy8eEsnYxtYN98Dm3LjKxNFjrGM+BDTtaqkzcvMklDo3A/6pK+I764HR
 8zZkBh/6xmtQijHEKZj/9Uatr493ixxFhjuHCAz5Nh8WtZNlfA44eknXIpYKY6LXrv3gkeuxzwC
 b+jBf6odaSBBM7h0KKYpnDEeDmlcU7SeMcjBoSZYQCGzACycMW37LS9aTXm/JSir0pc7IYCgwME
 dju/SHrVWn9agBNbmzwJxBu702iKhL9vqyI4MX7bgYLlUEZuPES809tTaGFNWLmtA81YZ7NGtGh
 z+notORTObOiwYg==
X-Developer-Key: i=sebastian.krzyszkowiak@puri.sm; a=openpgp;
 fpr=22DD9FAE006A11435836617CE8F235CF3BDBC3FF
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
	DMARC_POLICY_ALLOW(-0.50)[puri.sm,reject];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[puri.sm:s=smtp2];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:Laurent.pinchart@ideasonboard.com,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:kernel@puri.sm,m:linux-kernel@vger.kernel.org,m:sebastian.krzyszkowiak@puri.sm,m:jernejskrabec@gmail.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[sebastian.krzyszkowiak@puri.sm,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	FREEMAIL_TO(0.00)[intel.com,linaro.org,kernel.org,ideasonboard.com,kwiboo.se,gmail.com,linux.intel.com,suse.de,ffwll.ch];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[sebastian.krzyszkowiak@puri.sm,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[puri.sm:+];
	NEURAL_HAM(-0.00)[-0.997];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,puri.sm:mid,puri.sm:dkim,puri.sm:email]
X-Rspamd-Queue-Id: 9CA30158745
X-Rspamd-Action: no action

The driver refers to "burst mode with sync pulse" and seems to be coded
in a way that assumes it's a thing. However, I couldn't find any source
that would confirm its existence (aside of very eager to make it up LLMs).
The datasheet allows to choose between three modes:

 - burst mode
 - non-burst mode with sync pulses
 - non-burst mode with sync events

These three modes are also referenced across all sorts of MIPI DSI-related
documentation over the Internet.

Rename the define and default to burst mode, like other bridges tend to do.

Signed-off-by: Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>
---
 drivers/gpu/drm/bridge/nwl-dsi.c | 8 ++------
 drivers/gpu/drm/bridge/nwl-dsi.h | 2 +-
 2 files changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/bridge/nwl-dsi.c b/drivers/gpu/drm/bridge/nwl-dsi.c
index 2f7429b24fc2..c1859a04db97 100644
--- a/drivers/gpu/drm/bridge/nwl-dsi.c
+++ b/drivers/gpu/drm/bridge/nwl-dsi.c
@@ -257,7 +257,6 @@ static int nwl_dsi_config_dpi(struct nwl_dsi *dsi)
 {
 	u32 mode;
 	int color_format;
-	bool burst_mode;
 	int hfront_porch, hback_porch, vfront_porch, vback_porch;
 	int hsync_len, vsync_len;
 
@@ -298,15 +297,12 @@ static int nwl_dsi_config_dpi(struct nwl_dsi *dsi)
 		      NWL_DSI_HSYNC_POLARITY_ACTIVE_HIGH :
 		      NWL_DSI_HSYNC_POLARITY_ACTIVE_LOW);
 
-	burst_mode = (dsi->dsi_mode_flags & MIPI_DSI_MODE_VIDEO_BURST) &&
-		     !(dsi->dsi_mode_flags & MIPI_DSI_MODE_VIDEO_SYNC_PULSE);
-
-	if (burst_mode) {
+	if (dsi->dsi_mode_flags & MIPI_DSI_MODE_VIDEO_BURST) {
 		nwl_dsi_write(dsi, NWL_DSI_VIDEO_MODE, NWL_DSI_VM_BURST_MODE);
 		nwl_dsi_write(dsi, NWL_DSI_PIXEL_FIFO_SEND_LEVEL, 256);
 	} else {
 		mode = ((dsi->dsi_mode_flags & MIPI_DSI_MODE_VIDEO_SYNC_PULSE) ?
-				NWL_DSI_VM_BURST_MODE_WITH_SYNC_PULSES :
+				NWL_DSI_VM_NON_BURST_MODE_WITH_SYNC_PULSES :
 				NWL_DSI_VM_NON_BURST_MODE_WITH_SYNC_EVENTS);
 		nwl_dsi_write(dsi, NWL_DSI_VIDEO_MODE, mode);
 		nwl_dsi_write(dsi, NWL_DSI_PIXEL_FIFO_SEND_LEVEL,
diff --git a/drivers/gpu/drm/bridge/nwl-dsi.h b/drivers/gpu/drm/bridge/nwl-dsi.h
index 61e7d65cb1eb..c81edc58647b 100644
--- a/drivers/gpu/drm/bridge/nwl-dsi.h
+++ b/drivers/gpu/drm/bridge/nwl-dsi.h
@@ -123,7 +123,7 @@
 #define NWL_DSI_RX_VC(x)	FIELD_GET(GENMASK(23, 22), (x))
 
 /* DSI Video mode */
-#define NWL_DSI_VM_BURST_MODE_WITH_SYNC_PULSES		0
+#define NWL_DSI_VM_NON_BURST_MODE_WITH_SYNC_PULSES	0
 #define NWL_DSI_VM_NON_BURST_MODE_WITH_SYNC_EVENTS	BIT(0)
 #define NWL_DSI_VM_BURST_MODE				BIT(1)
 

---
base-commit: 2961f841b025fb234860bac26dfb7fa7cb0fb122
change-id: 20260218-nwl-dsi-burst-136c4c3ae9a0

Best regards,
-- 
Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>

