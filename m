Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UIC4Ojr3jGk1wQAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 11 Feb 2026 22:40:10 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48EDE127CC7
	for <lists+dri-devel@lfdr.de>; Wed, 11 Feb 2026 22:40:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 031C310E0F7;
	Wed, 11 Feb 2026 21:40:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="aynKc+zN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77F0310E0F7
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Feb 2026 21:40:05 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 0BB081A0DFD;
 Wed, 11 Feb 2026 21:40:04 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id BFBF3606B1;
 Wed, 11 Feb 2026 21:40:03 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 949121194951E; Wed, 11 Feb 2026 22:39:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1770846002; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding; bh=xWUptSvaSl9Gd+mXq9sxs0oK+GZBMAdKWZMR06WIqBA=;
 b=aynKc+zNq92FiU+gMdddol4/+QQczV5N7r6n1/qZpIFF/8W9MgDkYMuUzpIuflVVPHk9V/
 m2aTYavh4hmU1RhE5yencp+qCdLBpMHB4dwIBX04rjJDUXh2SYkFh2O5x8XaLThVyMTOBu
 o+8pL/R3Mi2kcop/8VjglktEUxyC7hHlSuPpl0P6SowLWWNutCLWO5uOK3woLNQQSDVvCi
 r21MYuUoKukQhYmY85YA7XxoLKVCaJlD8JYJPf89zhFFSnqA0gqixe84bt8kr5K6iZwsqC
 6AR/UDeSVo+X47FWmtD8sTcgFdkWgscj0bb2DvCPfCFAjVJqjSa+GJs/1/4Ltw==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Subject: [PATCH v6] drm/bridge: add of_drm_find_and_get_bridge() and a
 managed *next_bridge, deprecate of_drm_find_bridge()
Date: Wed, 11 Feb 2026 22:39:48 +0100
Message-Id: <20260211-drm-bridge-alloc-getput-drm_of_find_bridge-v6-0-651ddfd13bdb@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIACT3jGkC/5XQTWrDMBAF4KsEraui35GUVe9RipEsKRE4VpBd0
 xJ898qhIaVeaflm4HvD3NAUSgoTOh5uqIQlTSmPNcDLAfVnO54CTr5mxAiTlFKFfblgV5KvGzs
 MucenMF8/523e5djFNPrud6+EIZyDEkJ7VMFrCTF93cveP2o+p2nO5fvevdBt+qgxLTULxQQT7
 4y2KgahxJvLeR7S+NrnC9qKFvYHZ7oJZxXXOmpLiQq9ZXucP3FGoQnnFXeSgozWaSL1HhcPHEg
 9oAkXFbfAnODGWHBxj8snzghvwmXFAZy32gNV7t/P13X9AVQehdVaAgAA
X-Change-ID: 20251117-drm-bridge-alloc-getput-drm_of_find_bridge-74903367448d
To: Liu Ying <victor.liu@nxp.com>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: Hui Pu <Hui.Pu@gehealthcare.com>, Ian Ray <ian.ray@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.15-dev-5464f
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
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:victor.liu@nxp.com,m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:Laurent.pinchart@ideasonboard.com,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:shawnguo@kernel.org,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:Hui.Pu@gehealthcare.com,m:ian.ray@gehealthcare.com,m:thomas.petazzoni@bootlin.com,m:imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:luca.ceresoli@bootlin.com,m:jernejskrabec@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[nxp.com,intel.com,linaro.org,kernel.org,ideasonboard.com,kwiboo.se,gmail.com,linux.intel.com,suse.de,ffwll.ch,pengutronix.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[luca.ceresoli@bootlin.com,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[luca.ceresoli@bootlin.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[bootlin.com:+];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[msgid.link:url,bootlin.com:mid,bootlin.com:dkim,bootlin.com:email]
X-Rspamd-Queue-Id: 48EDE127CC7
X-Rspamd-Action: no action

This is the leftover of the series that deprecated of_drm_find_bridge(),
added a replacement which handles bridge refcounting, and converted some of
the direct users. All patches have been applied except this.

This is part of the work to support hotplug of DRM bridges. The grand plan
was discussed in [0].

Here's the work breakdown (➜ marks the current series):

 1. ➜ add refcounting to DRM bridges struct drm_bridge,
      based on devm_drm_bridge_alloc()
    A. ✔ add new alloc API and refcounting (v6.16)
    B. ✔ convert all bridge drivers to new API (v6.17)
    C. ✔ kunit tests (v6.17)
    D. ✔ add get/put to drm_bridge_add/remove() + attach/detach()
         and warn on old allocation pattern (v6.17)
    E. ➜ add get/put on drm_bridge accessors
       1. ✔ drm_bridge_chain_get_first_bridge(), add cleanup action (v6.18)
       2. ✔ drm_bridge_get_prev_bridge() (v6.18)
       3. ✔ drm_bridge_get_next_bridge() (v6.19)
       4. ✔ drm_for_each_bridge_in_chain() (v6.19)
       5. ✔ drm_bridge_connector_init (v6.19)
       6. … protect encoder bridge chain with a mutex
       7. ➜ of_drm_find_bridge()
          a. ✔… add of_drm_get_bridge(), convert basic direct users
	        (v6.20?, one driver still pending)
	  b. ✔ convert direct of_drm_get_bridge() users, part 2 (v6.20?)
	  c. ✔ convert direct of_drm_get_bridge() users, part 3 (v6.20?)
	  d. … convert direct of_drm_get_bridge() users, part 4
	  e.   convert bridge-only drm_of_find_panel_or_bridge() users
       8. drm_of_find_panel_or_bridge, *_of_get_bridge
       9. ✔ enforce drm_bridge_add before drm_bridge_attach (v6.19)
    F. ✔ debugfs improvements
       1. ✔ add top-level 'bridges' file (v6.16)
       2. ✔ show refcount and list lingering bridges (v6.19)
 2. … handle gracefully atomic updates during bridge removal
    A. ✔ Add drm_dev_enter/exit() to protect device resources (v6.20?)
    B. … protect private_obj removal from list
    C. … Add drm_bridge_clear_and_put()
 3. … DSI host-device driver interaction
 4. ✔ removing the need for the "always-disconnected" connector
 5.   DRM bridge hotplug
    A.   Bridge hotplug management in the DRM core
    B.   Device tree description

[0] https://lore.kernel.org/lkml/20250206-hotplug-drm-bridge-v6-0-9d6f2c9c3058@bootlin.com/#t

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
Changes in v6:
- reworked for simplicity as discussed with Liu
- Link to v5: https://patch.msgid.link/20260203-drm-bridge-alloc-getput-drm_of_find_bridge-v5-0-66bda8d617b4@bootlin.com

Changes in v5:
- Changed the only remaining patch after Liu Ying's requests for code
  readability
- Link to v4: https://lore.kernel.org/r/20260107-drm-bridge-alloc-getput-drm_of_find_bridge-v4-0-a62b4399a6bf@bootlin.com

Changes in v4:
- Added review trailers
- Link to v3: https://lore.kernel.org/r/20251216-drm-bridge-alloc-getput-drm_of_find_bridge-v3-0-b5165fab8058@bootlin.com

Changes in v3:
- Completely rewrote using the __drm_bridge_free() idea to prevent
  use-after-free of the next_bridge for the common cases
- Added needed cleanups to the imx8qxp-pixel-link and imx8qxp-pxl2dpi
  drivers
- Removed various patches converting simple cases, to reduce the number of
  e-mails sent; will be moved to the follow-up series
- Link to v2: https://lore.kernel.org/r/20251128-drm-bridge-alloc-getput-drm_of_find_bridge-v2-0-88f8a107eca2@bootlin.com

Changes in v2:
- All patches: renamed drm_of_find_bridge() -> of_drm_get_bridge()
- Various fixes and improvements to patches 1-6, see individual patches
  changelog
- Removed bouncing recipient: Edmund Dea <edmund.j.dea@intel.com>
- Link to v1: https://lore.kernel.org/r/20251119-drm-bridge-alloc-getput-drm_of_find_bridge-v1-0-0db98a7fe474@bootlin.com

---
Luca Ceresoli (1):
      drm/bridge: imx8qxp-pixel-link: get/put the next bridge

 drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c | 27 ++++++++++++-------------
 1 file changed, 13 insertions(+), 14 deletions(-)
---
base-commit: 4a0f7d0f51c0965a8a394a8c5d65be2d24e362df
change-id: 20251117-drm-bridge-alloc-getput-drm_of_find_bridge-74903367448d

Best regards,
--  
Luca Ceresoli <luca.ceresoli@bootlin.com>

