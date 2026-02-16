Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uC1lCkeEk2k46AEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 16 Feb 2026 21:55:35 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BDF79147997
	for <lists+dri-devel@lfdr.de>; Mon, 16 Feb 2026 21:55:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC9A210E3DF;
	Mon, 16 Feb 2026 20:55:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=antheas.dev header.i=@antheas.dev header.b="BdbusWAd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 572 seconds by postgrey-1.36 at gabe;
 Mon, 16 Feb 2026 20:55:31 UTC
Received: from relay14.grserver.gr (relay14.grserver.gr [157.180.73.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74B6810E1D3
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Feb 2026 20:55:31 +0000 (UTC)
Received: from relay14 (localhost [127.0.0.1])
 by relay14.grserver.gr (Proxmox) with ESMTP id E5693408A1;
 Mon, 16 Feb 2026 20:45:57 +0000 (UTC)
Received: from linux3247.grserver.gr (linux3247.grserver.gr [213.158.90.240])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by relay14.grserver.gr (Proxmox) with ESMTPS id B2B43407C8;
 Mon, 16 Feb 2026 20:45:56 +0000 (UTC)
Received: from antheas-z13 (unknown
 [IPv6:2a05:f6c5:43c3:0:378a:d3f6:f8b0:bed1])
 by linux3247.grserver.gr (Postfix) with ESMTPSA id C677A1FE763;
 Mon, 16 Feb 2026 22:45:55 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
 s=default; t=1771274756;
 bh=iu4eyKR8jURUOXWaTazTCUC09//HNOl71Atbpbe08kU=; h=From:To:Subject;
 b=BdbusWAdYKBhcQb5aW/e3u5QjF6sDvbRrZxiWGs+r3YC2yp5EJpkKZRR8hMLHYon6
 qUQlgU60l8HmWMRDDRKrn6zbpl/6L5CSqFfguMipYGv1ydkxZAFLjPGras3kd4rbhV
 IeZRdoCpWFJKgz0yBxHFi+LUlV6M5KjcpcWeaxGkEpneAGhwVEgnadzE247kVFU9xI
 cOGzO+yah8McMlJJ9hZvUIwR6krKpZjptx+wSBmD7NAr3c/1z8KFFhlyDjlxwU/zsP
 CdMoUx5TsNoE95en8dabwKCknB6Sy+xonVWj8JUv3Ujw7Be+0LWcM6165gqEMMtsRb
 anTTBvO5cG94w==
Authentication-Results: linux3247.grserver.gr;
 spf=pass (sender IP is 2a05:f6c5:43c3:0:378a:d3f6:f8b0:bed1)
 smtp.mailfrom=lkml@antheas.dev smtp.helo=antheas-z13
Received-SPF: pass (linux3247.grserver.gr: connection is authenticated)
From: Antheas Kapenekakis <lkml@antheas.dev>
To: dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, philm@manjaro.org,
 Antheas Kapenekakis <lkml@antheas.dev>
Subject: [PATCH v2 03/14] drm: panel-orientation-quirks: Add Ayaneo 3
Date: Mon, 16 Feb 2026 21:45:36 +0100
Message-ID: <20260216204547.293291-4-lkml@antheas.dev>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260216204547.293291-1-lkml@antheas.dev>
References: <20260216204547.293291-1-lkml@antheas.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-PPP-Message-ID: <177127475628.3070272.346082725582217185@linux3247.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 1.4.3 at linux3247.grserver.gr
X-Virus-Status: Clean
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
	MID_CONTAINS_FROM(1.00)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[antheas.dev:s=default];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,manjaro.org,antheas.dev];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	DMARC_NA(0.00)[antheas.dev];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[antheas.dev:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[lkml@antheas.dev,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Queue-Id: BDF79147997
X-Rspamd-Action: no action

The Ayaneo 3 comes with two panels, an OLED right side up 1080p panel
and an IPS landscape 1080p panel. However, both have the same DMI data.
This quirk adds support for the portrait OLED panel.

As the landscape panel is 1920x1080 and the right side up panel is
1080x1920, the width and height arguments are used to differentiate
the panels.

Reviewed-by: Philip Müller <philm@manjaro.org>
Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
---
 drivers/gpu/drm/drm_panel_orientation_quirks.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/drm_panel_orientation_quirks.c b/drivers/gpu/drm/drm_panel_orientation_quirks.c
index 23e736469aab..f745db95c394 100644
--- a/drivers/gpu/drm/drm_panel_orientation_quirks.c
+++ b/drivers/gpu/drm/drm_panel_orientation_quirks.c
@@ -209,6 +209,12 @@ static const struct dmi_system_id orientation_data[] = {
 		  DMI_MATCH(DMI_PRODUCT_NAME, "AYANEO 2"),
 		},
 		.driver_data = (void *)&lcd1200x1920_rightside_up,
+	}, {	/* AYANEO 3 */
+		.matches = {
+		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "AYANEO"),
+		  DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "AYANEO 3"),
+		},
+		.driver_data = (void *)&lcd1080x1920_rightside_up,
 	}, {	/* AYA NEO 2021 */
 		.matches = {
 		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "AYADEVICE"),
-- 
2.52.0


