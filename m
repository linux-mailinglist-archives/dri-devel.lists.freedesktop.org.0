Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CA939B3D9F
	for <lists+dri-devel@lfdr.de>; Mon, 28 Oct 2024 23:19:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62D3A10E081;
	Mon, 28 Oct 2024 22:19:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=scrumplex.net header.i=@scrumplex.net header.b="HjSsNePa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 422 seconds by postgrey-1.36 at gabe;
 Mon, 28 Oct 2024 22:19:20 UTC
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E65210E081
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Oct 2024 22:19:20 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org
 [IPv6:2001:67c:2050:b231:465::102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4XcngL6bZFz9sqs;
 Mon, 28 Oct 2024 23:12:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=scrumplex.net;
 s=MBO0001; t=1730153535;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=+CDSt8NvW3X63fnOCp45oAeFQC879DnOtBvwF4miD74=;
 b=HjSsNePa1WxywLh3TOUxMYv0u3wbm0O6afDAELh16y98W7mMT1zLJvpQin/qOki723hgf2
 mu7ytheyFmq+FwQm2LnNVbmK1/l7fT/XbnOcGWYaXBZ4gCf1f4BYa7VczkaF/gfZOdebyp
 5qLLWh8yd/Yq6iZshNyb7Pr7TdZg0tjGazGBR+BKEw2LsUNqKIEFVmzTirRUpjdt0y9ogm
 2e0Q6belPb5S+QHkbsP/pmVlt6jrtjcbbasqAD+QhkHH8etqcIgaSySmahUJ5CaM8hPySL
 WmRT3/0jFYtj8iDSEP3c7YEL26ZAVlGEY3pL2x/JylcOSRWPnTLeVO7rzZR4Aw==
From: Sefa Eyeoglu <contact@scrumplex.net>
To: dri-devel@lists.freedesktop.org
Cc: Sefa Eyeoglu <contact@scrumplex.net>
Subject: [PATCH] drm/edid: add non-desktop quirk to XREAL Air/Air 2 Pro
Date: Mon, 28 Oct 2024 23:10:50 +0100
Message-ID: <20241028221055.778851-1-contact@scrumplex.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 4XcngL6bZFz9sqs
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

Both devices lack a DisplayID 2.0 block and therefore do not advertise
themselves as HMDs.

See https://gitlab.freedesktop.org/drm/misc/kernel/-/issues/53

Signed-off-by: Sefa Eyeoglu <contact@scrumplex.net>
---
 drivers/gpu/drm/drm_edid.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 855beafb76ff..bc13f6ef2c5d 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -219,6 +219,10 @@ static const struct edid_quirk {
 	EDID_QUIRK('V', 'L', 'V', 0x91be, EDID_QUIRK_NON_DESKTOP),
 	EDID_QUIRK('V', 'L', 'V', 0x91bf, EDID_QUIRK_NON_DESKTOP),
 
+	/* XREAL Air series AR glasses */
+	EDID_QUIRK('M', 'R', 'G', 0x3132, EDID_QUIRK_NON_DESKTOP),
+	EDID_QUIRK('M', 'R', 'G', 0x3135, EDID_QUIRK_NON_DESKTOP),
+
 	/* HTC Vive and Vive Pro VR Headsets */
 	EDID_QUIRK('H', 'V', 'R', 0xaa01, EDID_QUIRK_NON_DESKTOP),
 	EDID_QUIRK('H', 'V', 'R', 0xaa02, EDID_QUIRK_NON_DESKTOP),
-- 
2.46.1

