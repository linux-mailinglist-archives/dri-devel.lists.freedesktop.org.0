Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +NkrL6A0lGlAAgIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 17 Feb 2026 10:28:00 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6800514A5EF
	for <lists+dri-devel@lfdr.de>; Tue, 17 Feb 2026 10:27:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77C9410E12E;
	Tue, 17 Feb 2026 09:27:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="BNxc2S46";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEA7B10E10A
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Feb 2026 09:27:52 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 2502E60130;
 Tue, 17 Feb 2026 09:27:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE8B4C4CEF7;
 Tue, 17 Feb 2026 09:27:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1771320471;
 bh=uGjzkrhdhXqwSIJbMckxgT5nNy3d6MsSF3Jryrexppc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=BNxc2S46X9YlRIjj8PaWuj5CWyzTLESuP33i3mE8orNt0R+b5ZOBXjsScD8tBb77v
 iIZPaZ1m+II5eVo6mn4mw0z6VhnIgWupnEQUzvyPnUTxNabUUVS3OVtfpCixOfwky5
 QUYfVfgOGIC4wCvwK5DlJoXsJeWB+N/1EIrneg40PNbu6oiuxIk8TomIk8zQYqK036
 16MsqPOYyDo+8fxlpUw9F7lq4cEHUBtMVpm93qBabUgSmOsvXezKoUfuDqpWQIBvIf
 g6/R8lF+LnjixCIrdCaCaWm2qjYbsvmpd9EAerdmx281hsI/bLFvmQgCVjtyO6AU6H
 chnrY2iCDfWOg==
Received: by wens.tw (Postfix, from userid 1000)
 id 8BF955F755; Tue, 17 Feb 2026 17:27:49 +0800 (CST)
From: Chen-Yu Tsai <wens@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: Sebastian Reichel <sebastian.reichel@collabora.com>,
 Gerald Loacker <gerald.loacker@wolfvision.net>,
 Michael Riesch <michael.riesch@collabora.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Chen-Yu Tsai <wens@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Archit Anant <architanant5@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [RFT PATCH v2 1/2] drm/mipi-dbi: Provide option to invert reset GPIO
 logic
Date: Tue, 17 Feb 2026 17:27:36 +0800
Message-ID: <20260217092738.3238016-2-wens@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260217092738.3238016-1-wens@kernel.org>
References: <20260217092738.3238016-1-wens@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[collabora.com,wolfvision.net,bootlin.com,kernel.org,gmail.com,ffwll.ch,lists.freedesktop.org,vger.kernel.org];
	FORGED_SENDER(0.00)[wens@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:neil.armstrong@linaro.org,m:jesszhan0024@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:sebastian.reichel@collabora.com,m:gerald.loacker@wolfvision.net,m:michael.riesch@collabora.com,m:miquel.raynal@bootlin.com,m:wens@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:architanant5@gmail.com,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[linaro.org,gmail.com,linux.intel.com,kernel.org,suse.de];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[wens@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	TAGGED_RCPT(0.00)[dri-devel];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 6800514A5EF
X-Rspamd-Action: no action

When mipi_dbi (tinydrm) was added, the reset handling assumed that
"logic high" or "active" was out of reset, while "logic low" or
"inactive" was in reset. This is the opposite of how many reset
bindings are written, wherein "active" means the reset is active, i.e
the device is put or held in reset.

Provide an option to invert the logic so that drivers for bindings with
"active is in reset" using mipi_dbi can use the common reset handling.

Signed-off-by: Chen-Yu Tsai <wens@kernel.org>
---
 drivers/gpu/drm/drm_mipi_dbi.c | 4 ++--
 include/drm/drm_mipi_dbi.h     | 9 +++++++++
 2 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_mipi_dbi.c b/drivers/gpu/drm/drm_mipi_dbi.c
index 00482227a9cd..7fa1f73a38a4 100644
--- a/drivers/gpu/drm/drm_mipi_dbi.c
+++ b/drivers/gpu/drm/drm_mipi_dbi.c
@@ -713,9 +713,9 @@ void mipi_dbi_hw_reset(struct mipi_dbi *dbi)
 	if (!dbi->reset)
 		return;
 
-	gpiod_set_value_cansleep(dbi->reset, 0);
+	gpiod_set_value_cansleep(dbi->reset, dbi->invert_reset ? 1 : 0);
 	usleep_range(20, 1000);
-	gpiod_set_value_cansleep(dbi->reset, 1);
+	gpiod_set_value_cansleep(dbi->reset, dbi->invert_reset ? 0 : 1);
 	msleep(120);
 }
 EXPORT_SYMBOL(mipi_dbi_hw_reset);
diff --git a/include/drm/drm_mipi_dbi.h b/include/drm/drm_mipi_dbi.h
index f45f9612c0bc..6cebf74bcecc 100644
--- a/include/drm/drm_mipi_dbi.h
+++ b/include/drm/drm_mipi_dbi.h
@@ -44,6 +44,15 @@ struct mipi_dbi {
 	 */
 	bool swap_bytes;
 
+	/**
+	 * @invert_reset: Invert reset logic level.
+	 *
+	 * This is needed as drm_mipi_dbi (formerly tinydrm) introduced reset
+	 * GPIO controls with "logic high" being "out of reset", while other
+	 * bindings typically have "logic high" as "in reset".
+	 */
+	bool invert_reset;
+
 	/**
 	 * @reset: Optional reset gpio
 	 */
-- 
2.47.3

