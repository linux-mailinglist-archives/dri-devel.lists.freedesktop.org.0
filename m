Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 596E8452C9D
	for <lists+dri-devel@lfdr.de>; Tue, 16 Nov 2021 09:22:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDA086EE1C;
	Tue, 16 Nov 2021 08:22:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 455 seconds by postgrey-1.36 at gabe;
 Mon, 15 Nov 2021 16:09:37 UTC
Received: from node.akkea.ca (li1434-30.members.linode.com [45.33.107.30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AE976E0A6
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Nov 2021 16:09:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by node.akkea.ca (Postfix) with ESMTP id 9719B5DE02F;
 Mon, 15 Nov 2021 16:02:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=akkea.ca; s=mail;
 t=1636992121; bh=9HCm74kmLej6uZvnc+Jiw+vlQTg3fDIin0BTbXZI4JE=;
 h=From:To:Cc:Subject:Date;
 b=UrsM7o0LNweHYdsuci+94sY6mmLbd4D1j+oxptcPAKDJC09Flz8NBsEPwegN1jie7
 C1zvmsF5Is2zwZdDJFdKBn/djRwUGYt8qQAD0+fAG1/SDnh8jsbKqJEd26nCiTnUKk
 zcts+xprIiV+a0Zeg5R1UTpsAynKOzwm+fk3C5w4=
X-Virus-Scanned: Debian amavisd-new at mail.akkea.ca
Received: from node.akkea.ca ([127.0.0.1])
 by localhost (mail.akkea.ca [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Si97c3LbDJVX; Mon, 15 Nov 2021 16:02:00 +0000 (UTC)
Received: from midas.localdomain (S0106788a2041785e.gv.shawcable.net
 [70.66.86.75])
 by node.akkea.ca (Postfix) with ESMTPSA id 7F8385DE01D;
 Mon, 15 Nov 2021 16:02:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=akkea.ca; s=mail;
 t=1636992120; bh=9HCm74kmLej6uZvnc+Jiw+vlQTg3fDIin0BTbXZI4JE=;
 h=From:To:Cc:Subject:Date;
 b=GtXvJDtgW7fqQ9ZaIQ7Xljs23Hs8Yvops0NMI7kZuwTFwKV/rwlenobDPBygAaJa/
 /0YG1AEseqfuOuf3InjmRKNCus1RouuLv4l0/FXfiKc/xCQDdNXWp6QxUzlQtyxj8B
 u7jNfpfpRFIFHX+b9NSwsITUwIODDeC5VbnF2Ie4=
From: Angus Ainslie <angus@akkea.ca>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH] drm: drm_probe_helper: add modes upto 1920x1080
Date: Mon, 15 Nov 2021 08:01:35 -0800
Message-Id: <20211115160135.25451-1-angus@akkea.ca>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 16 Nov 2021 08:22:24 +0000
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
Cc: kernel@puri.sm, David Airlie <airlied@linux.ie>,
 Angus Ainslie <angus@akkea.ca>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Lots of monitors nowdays support more than 1024x768 so if the EDID is
unknown then add resolutions upto 1920x1080.

Signed-off-by: Angus Ainslie <angus@akkea.ca>
---
 drivers/gpu/drm/drm_probe_helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_probe_helper.c b/drivers/gpu/drm/drm_probe_helper.c
index e7e1ee2aa352..5ad66ae9916e 100644
--- a/drivers/gpu/drm/drm_probe_helper.c
+++ b/drivers/gpu/drm/drm_probe_helper.c
@@ -517,7 +517,7 @@ int drm_helper_probe_single_connector_modes(struct drm_connector *connector,
 
 	if (count == 0 && (connector->status == connector_status_connected ||
 			   connector->status == connector_status_unknown))
-		count = drm_add_modes_noedid(connector, 1024, 768);
+		count = drm_add_modes_noedid(connector, 1920, 1080);
 	count += drm_helper_probe_add_cmdline_mode(connector);
 	if (count == 0)
 		goto prune;
-- 
2.25.1

