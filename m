Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A59A08C852F
	for <lists+dri-devel@lfdr.de>; Fri, 17 May 2024 13:05:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 605C910EE74;
	Fri, 17 May 2024 11:05:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=scrumplex.net header.i=@scrumplex.net header.b="WUAumY6x";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 536 seconds by postgrey-1.36 at gabe;
 Fri, 17 May 2024 11:05:14 UTC
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62DFE10EE81
 for <dri-devel@lists.freedesktop.org>; Fri, 17 May 2024 11:05:14 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4VgkR051QHz9sTC;
 Fri, 17 May 2024 12:56:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=scrumplex.net;
 s=MBO0001; t=1715943372;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=DdMWwG6j62IRBB1fMNrJlk9T11KJMtxwqBfupt0W4GU=;
 b=WUAumY6xFiDV+6EOQdXxung2RZ/GSObXcodokN4AoEWvBu8OPKXWgQilVoTQvBNZ+sfRJc
 MWMPYF4QwgeazDMLY2CrpE6uuFttwKE8/I/4pZW085Sh6zWQ3pOyE3cC7VbEyIZbXdpsHv
 SoT9TvP0Y6jsJbm9G/FqcmxA+SfIrLh/3CJ7kpl1MMG60VZwzGXxpEFah1eyRiBnMNMzN4
 J1s8+N7uVsa8a5hhRjxn1awSR8EmKEWDKQvJSfBDWRcN1SwbToeZ/mtb2oliKI2vICLiJ9
 JpbrwNIBcTSz64XxBfVKsaqi39ExpBzuiAZZtQN4kTVDTe8fyqOBUJlp/0bJAQ==
From: Sefa Eyeoglu <contact@scrumplex.net>
To: dri-devel@lists.freedesktop.org
Cc: Sefa Eyeoglu <contact@scrumplex.net>
Subject: [PATCH] drm/edid: add non-desktop quirk to Bigscreen Beyond HMD
Date: Fri, 17 May 2024 12:55:41 +0200
Message-ID: <20240517105555.654262-1-contact@scrumplex.net>
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

The Bigscreen Beyond VR headset is a non-desktop output and should be
marked as such using an EDID quirk.

Signed-off-by: Sefa Eyeoglu <contact@scrumplex.net>
---
 drivers/gpu/drm/drm_edid.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 4f54c91b31b2..d407efc0fb55 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -200,6 +200,9 @@ static const struct edid_quirk {
 	/* Rotel RSX-1058 forwards sink's EDID but only does HDMI 1.1*/
 	EDID_QUIRK('E', 'T', 'R', 13896, EDID_QUIRK_FORCE_8BPC),
 
+	/* Bigscreen Beyond Headset */
+	EDID_QUIRK('B', 'I', 'G', 0x1234, EDID_QUIRK_NON_DESKTOP),
+
 	/* Valve Index Headset */
 	EDID_QUIRK('V', 'L', 'V', 0x91a8, EDID_QUIRK_NON_DESKTOP),
 	EDID_QUIRK('V', 'L', 'V', 0x91b0, EDID_QUIRK_NON_DESKTOP),
-- 
2.44.0

