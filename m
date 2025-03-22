Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB53CA6CA59
	for <lists+dri-devel@lfdr.de>; Sat, 22 Mar 2025 14:36:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C54410E068;
	Sat, 22 Mar 2025 13:35:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=protonmail.com header.i=@protonmail.com header.b="xGbjvq9C";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 565 seconds by postgrey-1.36 at gabe;
 Sat, 22 Mar 2025 12:30:46 UTC
Received: from mail-4327.protonmail.ch (mail-4327.protonmail.ch [185.70.43.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 079DB10E0A6
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Mar 2025 12:30:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
 s=protonmail3; t=1742646068; x=1742905268;
 bh=d4zCb2nPi+92PBYP4GVS0j3wv4Cc6an97P+w1Dov31E=;
 h=Date:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector:
 List-Unsubscribe:List-Unsubscribe-Post;
 b=xGbjvq9CgZpMLuI1PQaBeKcE0yAcavsPvTdw/PPcZAmnCTDSFn9FRO0SoTgoCeLAr
 adAcJ6yJHKjjhgkCRPgNoCIBAupkBAPOJJ7pDdyWDPYzZysCCgNxRN/FmN8jJcE6Lg
 wjH/gL/UBjmWqN+i7QKGycYDSBQpFWe1GULlTW6GWp2hCJh/XLhhOnLQdsIHZ86gHd
 0D9jE0pzrub0FXUpsf28rH1vJi24m1QY/910knN1UF3kiRf7e/utMStDPiYKaplIMB
 xcCAIm9LG8oh4yrxeVddnTEV/XF1QFjEVwRm0N9oI4uJAu8Ta6ZRUwxbD4paaX5tbD
 MRmge930WiqaQ==
Date: Sat, 22 Mar 2025 12:21:00 +0000
From: devbrones <jonas.cronholm@protonmail.com>
Cc: maarten.lankhorst@linux.intel.com,
 devbrones <jonas.cronholm@protonmail.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] drm/edid: Add non-desktop quirk for Playstation VR Headsets
 with Product ID 0xB403
Message-ID: <20250322122048.28677-1-jonas.cronholm@protonmail.com>
Feedback-ID: 34760268:user:proton
X-Pm-Message-ID: b5ee08acc308f1f101224bd5e7be7549405e0561
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Sat, 22 Mar 2025 13:35:56 +0000
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

This fixes a bug where some Playstation VR Headsets would not be assigned
the EDID_QUIRK_NON_DESKTOP quirk, causing them to be inaccessible by
certain software under Wayland.

Signed-off-by: devbrones <jonas.cronholm@protonmail.com>
---
 drivers/gpu/drm/drm_edid.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 13bc4c290b17..51b4d7a02c02 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -239,6 +239,7 @@ static const struct edid_quirk {
=20
 =09/* Sony PlayStation VR Headset */
 =09EDID_QUIRK('S', 'N', 'Y', 0x0704, EDID_QUIRK_NON_DESKTOP),
+=09EDID_QUIRK('S', 'N', 'Y', 0xB403, EDID_QUIRK_NON_DESKTOP),
=20
 =09/* Sensics VR Headsets */
 =09EDID_QUIRK('S', 'E', 'N', 0x1019, EDID_QUIRK_NON_DESKTOP),
--=20
2.45.2


