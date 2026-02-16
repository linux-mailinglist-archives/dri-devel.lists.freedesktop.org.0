Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0KgvDOmDk2k46AEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 16 Feb 2026 21:54:01 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0523414795E
	for <lists+dri-devel@lfdr.de>; Mon, 16 Feb 2026 21:54:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9871210E3F5;
	Mon, 16 Feb 2026 20:53:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=antheas.dev header.i=@antheas.dev header.b="DxYnkqTA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay12.grserver.gr (relay12.grserver.gr [88.99.38.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28CE910E3EC
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Feb 2026 20:53:53 +0000 (UTC)
Received: from relay12 (localhost [127.0.0.1])
 by relay12.grserver.gr (Proxmox) with ESMTP id A4B7EBC0A8;
 Mon, 16 Feb 2026 22:46:04 +0200 (EET)
Received: from linux3247.grserver.gr (linux3247.grserver.gr [213.158.90.240])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by relay12.grserver.gr (Proxmox) with ESMTPS id 352CCBC017;
 Mon, 16 Feb 2026 22:46:04 +0200 (EET)
Received: from antheas-z13 (unknown
 [IPv6:2a05:f6c5:43c3:0:378a:d3f6:f8b0:bed1])
 by linux3247.grserver.gr (Postfix) with ESMTPSA id 5BFEB1FE5E3;
 Mon, 16 Feb 2026 22:46:03 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
 s=default; t=1771274763;
 bh=Dg6FG07MbV/4Z2IIGzNt1dQrBQjP/ORAHba7fSX/nlE=; h=From:To:Subject;
 b=DxYnkqTAJc/gl9CBxlp5iVA2wY/iok4txleMFRE1gEaIBNCISKjE87gSQZrSHr5bf
 /TE+99kpIsheOwHC5PZ4MSEhyJjbXy5XcRuO39aLHZFYm3yzPEX2NdWkoPslT7P0Ym
 R+/hosyYsp9GZvSEQQOnIJXyA/YM1MSrzogo5ym8DcwbeDfd5T/6/dmJ57UEekSTIM
 pHfDo9UIAkYlOFJ3xKl++lP2x7wECoOt762A9PwbmYY4FuI/q5TlGIW4xOuQqyTz6Z
 iQUYaSEHC40rf3rzS65QlIKGfVq3uOt+DwDhWB7z+t6g9GAWQ4zqhzeMko9NorxIeR
 Uco+qpPabWRuA==
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
Subject: [PATCH v2 12/14] drm: panel-orientation-quirks: Add OneXPlayer X1z
Date: Mon, 16 Feb 2026 21:45:45 +0100
Message-ID: <20260216204547.293291-13-lkml@antheas.dev>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260216204547.293291-1-lkml@antheas.dev>
References: <20260216204547.293291-1-lkml@antheas.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-PPP-Message-ID: <177127476386.3072692.9569462041644848936@linux3247.grserver.gr>
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
X-Spamd-Result: default: False [0.69 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[antheas.dev:s=default];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,manjaro.org,antheas.dev];
	TO_DN_SOME(0.00)[];
	DMARC_NA(0.00)[antheas.dev];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[lkml@antheas.dev,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[antheas.dev:+];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 0523414795E
X-Rspamd-Action: no action

Different variant of the OneXPlayer X1 AMD edition with an 8840U.

Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
---
 drivers/gpu/drm/drm_panel_orientation_quirks.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/drm_panel_orientation_quirks.c b/drivers/gpu/drm/drm_panel_orientation_quirks.c
index 857fbc1ba4dc..96c910d4524e 100644
--- a/drivers/gpu/drm/drm_panel_orientation_quirks.c
+++ b/drivers/gpu/drm/drm_panel_orientation_quirks.c
@@ -546,6 +546,12 @@ static const struct dmi_system_id orientation_data[] = {
 		  DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "ONEXPLAYER X1Mini Pro"),
 		},
 		.driver_data = (void *)&lcd1600x2560_leftside_up,
+	}, {	/* OneXPlayer X1 AMD second variant */
+		.matches = {
+		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "ONE-NETBOOK"),
+		  DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "ONEXPLAYER X1z"),
+		},
+		.driver_data = (void *)&lcd1600x2560_leftside_up,
 	}, {	/* OneXPlayer X1 AMD Strix Point */
 		.matches = {
 		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "ONE-NETBOOK"),
-- 
2.52.0


