Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 05CF14EEF5A
	for <lists+dri-devel@lfdr.de>; Fri,  1 Apr 2022 16:26:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D893A10E3E6;
	Fri,  1 Apr 2022 14:26:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C43F10E3E6
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Apr 2022 14:26:00 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0956B61BD1;
 Fri,  1 Apr 2022 14:25:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82C7AC2BBE4;
 Fri,  1 Apr 2022 14:25:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1648823157;
 bh=ojpEPaBK/DLYVyDyPMobAMFGBNIOOTKPinVwitXCphk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Drq+KQBzB3PreA+LTXa/9+dXoYvJ4zlqeVznjESbHh7CV9RhY2Hop41Z1WmQzvxGX
 /BpJ1nK942LZJ17psdOz3s3osZqhTLmm2Z2GhOSCeINet2iyGcS+VLvU6IRrKsOuV+
 7APSMW9JHTpI9F/Wh9yWTLYP6c0jzlYS5dJ8P3h8t8ttF3F8/w+6rYWGQUmMoDzuHf
 cl184hY7MG7U60Da2KwlRgXSQamOmflPxHXMAcwbzECJ1yUo4W7Zz4LI7JlBavj4jC
 HHg8Qe0MTp94acI8W07FaFYTRuFzKK2fXBNV4a6RoYVOICpiPvwKj6Ljjg/FSWrgT+
 ++0E6h39efWPg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.17 007/149] drm/edid: remove non_desktop quirk for
 HPN-3515 and LEN-B800.
Date: Fri,  1 Apr 2022 10:23:14 -0400
Message-Id: <20220401142536.1948161-7-sashal@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220401142536.1948161-1-sashal@kernel.org>
References: <20220401142536.1948161-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Sasha Levin <sashal@kernel.org>, tzimmermann@suse.de,
 Jani Nikula <jani.nikula@intel.com>, airlied@linux.ie,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Philipp Zabel <philipp.zabel@gmail.com>

[ Upstream commit 50dc95d561a2552b0d76a9f91b38005195bf2974 ]

Now that there is support for the Microsoft VSDB for HMDs, remove the
non-desktop quirk for two devices that are verified to contain it in
their EDID: HPN-3515 and LEN-B800.
Presumably most of the other Windows Mixed Reality headsets contain it
as well, but there are ACR-7FCE and SEC-5194 devices without it.

Tested with LEN-B800.

Signed-off-by: Philipp Zabel <philipp.zabel@gmail.com>
Reviewed-by: Jani Nikula <jani.nikula@intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20220123101653.147333-2-philipp.zabel@gmail.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/drm_edid.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index f5f5de362ff2..e8adfa90807c 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -212,9 +212,7 @@ static const struct edid_quirk {
 
 	/* Windows Mixed Reality Headsets */
 	EDID_QUIRK('A', 'C', 'R', 0x7fce, EDID_QUIRK_NON_DESKTOP),
-	EDID_QUIRK('H', 'P', 'N', 0x3515, EDID_QUIRK_NON_DESKTOP),
 	EDID_QUIRK('L', 'E', 'N', 0x0408, EDID_QUIRK_NON_DESKTOP),
-	EDID_QUIRK('L', 'E', 'N', 0xb800, EDID_QUIRK_NON_DESKTOP),
 	EDID_QUIRK('F', 'U', 'J', 0x1970, EDID_QUIRK_NON_DESKTOP),
 	EDID_QUIRK('D', 'E', 'L', 0x7fce, EDID_QUIRK_NON_DESKTOP),
 	EDID_QUIRK('S', 'E', 'C', 0x144a, EDID_QUIRK_NON_DESKTOP),
-- 
2.34.1

