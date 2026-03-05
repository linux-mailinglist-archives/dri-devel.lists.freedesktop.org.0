Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qJJBGrqxqWnNCgEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 17:39:22 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DBA4B2157B4
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 17:39:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F0D010EC53;
	Thu,  5 Mar 2026 16:39:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="0dEcCp9A";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19635886A4
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Mar 2026 16:39:17 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 62F82C4041E;
 Thu,  5 Mar 2026 16:39:33 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id BA20E5FF89;
 Thu,  5 Mar 2026 16:39:14 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 4E112103697E2; Thu,  5 Mar 2026 17:39:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1772728753; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding; bh=nM8o+z1UN4hmilTN3aYBSUDk+EvUr86ZkveF9gKBlnk=;
 b=0dEcCp9Adyd+2ab44/pW7jrhhc8ExRLdnuoWK4weOSe6SjXTMzYL54Np4V1+uoxCIIGr+N
 SWClAli6APqnGzysw/M1IL25h0NkKJb7t8q5DHOBCptOgoRZBMKZSabL4pjwrtdzLE9kDx
 JMEHCTT8YzHmITGjmoqYzObqN44im9lPW49rO6dLoIlMvfbEUdqwKAMKO9gLctiPQT1Bx5
 FE7t3kygRWwtH20oHiWttgCqd/8Qm2aqY7NRXGfY3uuXfqu2y//51FdwAmeHQNRLPqednM
 MxLwFiDOpjOH9KqQaY4XoIXP5pGV8onM0SLe2vSDylZ5RtjSj7WSlE6AjE5VZA==
From: Kory Maincent <kory.maincent@bootlin.com>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Herve Codina <herve.codina@bootlin.com>,
 "Kory Maincent (TI.com)" <kory.maincent@bootlin.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: Bajjuri Praneeth <praneeth@ti.com>, kernel test robot <lkp@intel.com>,
 thomas.petazzoni@bootlin.com, Jyri Sarha <jyri.sarha@iki.fi>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Subject: [PATCH] drm/tilcdc: Fix type mismatch
Date: Thu,  5 Mar 2026 17:39:06 +0100
Message-ID: <20260305163907.717719-1-kory.maincent@bootlin.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
X-Rspamd-Queue-Id: DBA4B2157B4
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[ti.com,intel.com,bootlin.com,iki.fi,ideasonboard.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:luca.ceresoli@bootlin.com,m:herve.codina@bootlin.com,m:kory.maincent@bootlin.com,m:linux-kernel@vger.kernel.org,m:praneeth@ti.com,m:lkp@intel.com,m:thomas.petazzoni@bootlin.com,m:jyri.sarha@iki.fi,m:tomi.valkeinen@ideasonboard.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[kory.maincent@bootlin.com,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kory.maincent@bootlin.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[bootlin.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,bootlin.com:dkim,bootlin.com:email,bootlin.com:mid]
X-Rspamd-Action: no action

From: "Kory Maincent (TI)" <kory.maincent@bootlin.com>

cpu_to_be32() returns a __be32 big-endian value, but the compound literals
passed to tilcdc_panel_update_prop() were typed as u32. This causes a
sparse type mismatch warning. Fix it by using __be32 as the compound
literal type to match the return type of cpu_to_be32().

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202602200130.LjofC7YE-lkp@intel.com/
Fixes: 0ff223d991477 ("drm/tilcdc: Convert legacy panel binding via DT overlay at boot time")
Signed-off-by: Kory Maincent (TI) <kory.maincent@bootlin.com>
---
 drivers/gpu/drm/tilcdc/tilcdc_panel_legacy.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/tilcdc/tilcdc_panel_legacy.c b/drivers/gpu/drm/tilcdc/tilcdc_panel_legacy.c
index 37a69b3cf04b2..2e7b3e87fea18 100644
--- a/drivers/gpu/drm/tilcdc/tilcdc_panel_legacy.c
+++ b/drivers/gpu/drm/tilcdc/tilcdc_panel_legacy.c
@@ -105,14 +105,14 @@ static int __init tilcdc_panel_copy_props(struct device_node *old_panel,
 
 	if (!invert_pxl_clk) {
 		ret = tilcdc_panel_update_prop(&ocs, new_timing, "pixelclk-active",
-					       &(u32){cpu_to_be32(1)}, sizeof(u32));
+					       &(__be32){cpu_to_be32(1)}, sizeof(__be32));
 		if (ret)
 			goto destroy_ocs;
 	}
 
 	if (!sync_edge) {
 		ret = tilcdc_panel_update_prop(&ocs, new_timing, "syncclk-active",
-					       &(u32){cpu_to_be32(1)}, sizeof(u32));
+					       &(__be32){cpu_to_be32(1)}, sizeof(__be32));
 		if (ret)
 			goto destroy_ocs;
 	}
-- 
2.43.0

