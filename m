Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GDMFD2/hcWk+MgAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jan 2026 09:35:59 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E09F632B0
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jan 2026 09:35:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2432210E909;
	Thu, 22 Jan 2026 08:35:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.b="T3eJwNJX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 630 seconds by postgrey-1.36 at gabe;
 Thu, 22 Jan 2026 02:42:31 UTC
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 396BD10E836
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jan 2026 02:42:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:To:Subject:Date:Message-Id; bh=HckW+XcKUr0A8G+
 DPWEvpd+s3/zfSfvl1KJHrkT99QM=; b=T3eJwNJXXYrtytKuPWicYC62ioHxOGF
 UUfTu9tZyYttN2JHvPjPzvZL5HQOvW7KzleS0bIuh4ygo2g5hhmlrkc8NfG49MyB
 vuJlpr3sG4qjdOz9xu8VM1sC8eDnuR3EHOr4f6SURejvAOjyKSRdvoNw7J9iXbVt
 iGH1OoYSVye8=
Received: from 163.com (unknown [])
 by gzga-smtp-mtada-g0-3 (Coremail) with SMTP id
 _____wCHn_5Xi3FpkZzXHg--.1775S2; 
 Thu, 22 Jan 2026 10:28:40 +0800 (CST)
From: shu.sansan@163.com
To: andrzej.hajda@intel.com,
	neil.armstrong@linaro.org,
	rfoss@kernel.org
Cc: laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, guofu wan <lizwan0412@gmail.com>,
 guofu wan <shu.sansan@163.com>
Subject: [PATCH] drm:dw-mipi-dsi: avoid invalidating config by removing
 dw_mipi_dsi_set_mode
Date: Wed, 21 Jan 2026 18:28:03 -0800
Message-Id: <20260122022803.6963-1-shu.sansan@163.com>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: _____wCHn_5Xi3FpkZzXHg--.1775S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7Kr4UtryDJw1UJw45Zr4xZwb_yoW8GF45pF
 WUGw18Kry8tFsFqa4xCFW8ZF98Ja9xJayrCrWUG34xZ3Wq9F1jyr1qkFW3Gr9YgFW8Zr1S
 v393XryfXFn7uF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pizRRtUUUUU=
X-Originating-IP: [117.147.31.120]
X-CM-SenderInfo: xvkxh2pdqvt0i6rwjhhfrp/xtbC2xivy2lxi1jIzwAA3r
X-Mailman-Approved-At: Thu, 22 Jan 2026 08:35:53 +0000
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
X-Spamd-Result: default: False [1.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[163.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[163.com:s=s110527];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[163.com];
	FORGED_RECIPIENTS(0.00)[m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:laurent.pinchart@ideasonboard.com,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-kernel@vger.kernel.org,m:lizwan0412@gmail.com,m:shu.sansan@163.com,m:jernejskrabec@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[shu.sansan@163.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[ideasonboard.com,kwiboo.se,gmail.com,linux.intel.com,kernel.org,suse.de,ffwll.ch,lists.freedesktop.org,vger.kernel.org,163.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	HAS_XOIP(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[shu.sansan@163.com,dri-devel-bounces@lists.freedesktop.org];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NO_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[163.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 5E09F632B0
X-Rspamd-Action: no action

From: guofu wan <lizwan0412@gmail.com>

The dw_mipi_dsi_set_mode() function performs a DSI power-off operation via
dsi_write(dsi, DSI_PWR_UP, RESET), which invalidates all previously
applied configurations.

Since the original code already handles the command mode configuration
within dw_mipi_dsi_command_mode_config(), re-invoking the set_mode
function is redundant and counterproductive. Removing this call ensures
that the driver directly executes dsi_write(dsi, DSI_PWR_UP, POWERUP),
preserving the existing settings.

Signed-off-by: guofu wan <shu.sansan@163.com>
---
 drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
index 8fc2e282ff11..b02373f16bed 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
@@ -1015,8 +1015,7 @@ static void dw_mipi_dsi_mode_set(struct dw_mipi_dsi *dsi,
 
 	dw_mipi_dsi_wait_for_two_frames(adjusted_mode);
 
-	/* Switch to cmd mode for panel-bridge pre_enable & panel prepare */
-	dw_mipi_dsi_set_mode(dsi, 0);
+	dsi_write(dsi, DSI_PWR_UP, POWERUP);
 
 	if (phy_ops->power_on)
 		phy_ops->power_on(dsi->plat_data->priv_data);
-- 
2.17.1

