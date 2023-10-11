Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3813D7C474F
	for <lists+dri-devel@lfdr.de>; Wed, 11 Oct 2023 03:34:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B3B710E0E6;
	Wed, 11 Oct 2023 01:34:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m15.mail.163.com (m15.mail.163.com [45.254.50.219])
 by gabe.freedesktop.org (Postfix) with ESMTP id 58EDA10E0E6
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Oct 2023 01:34:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=WIGsW
 AH/iA3oJPpW3K+uYoJ9SzV46v5QlbmbaUJ1e3A=; b=hpwCytQPT6y4uIuhxlcTO
 GtPuYOYjDD4hpsUMwH76G9WQ0RHFIH55gSiHAaYxgALiZYmgxl7vXuxKeRJVE5VJ
 3P7DcdplD+F9++G75VdRhgIXvmZbtmzV9uP6zEriNnfUNp8LntZLx3xLA6Jn2Wun
 gtcZoaL0/KywX40nw25AEw=
Received: from icess-ProLiant-DL380-Gen10.. (unknown [183.174.60.14])
 by zwqz-smtp-mta-g0-2 (Coremail) with SMTP id _____wDn76Jd+yVlvWboAA--.39607S4;
 Wed, 11 Oct 2023 09:33:24 +0800 (CST)
From: Ma Ke <make_ruc2021@163.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, daniel@ffwll.ch
Subject: [PATCH] drm/edid: fix a possible null pointer dereference
Date: Wed, 11 Oct 2023 09:33:16 +0800
Message-Id: <20231011013316.4091845-1-make_ruc2021@163.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wDn76Jd+yVlvWboAA--.39607S4
X-Coremail-Antispam: 1Uf129KBjvdXoWrurW5Zr1fAry7KF4Uuw48Zwb_yoW3Wwc_uF
 y8X39xGrnrua48ArsrZayfZrySyF1rZFW8Gr1Uta4Sy3yDCF15J347KFnYqryxWa1jyF9r
 Ja4Uua1fCF47GjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7xRKhL07UUUUU==
X-Originating-IP: [183.174.60.14]
X-CM-SenderInfo: 5pdnvshuxfjiisr6il2tof0z/1tbiyAUGC1p7MF401AAAsv
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Ma Ke <make_ruc2021@163.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In drm_mode_std(), the return value of drm_gtf_mode(),
drm_gtf_mode() and drm_cvt_mode() is assigned to mode,
which will lead to a NULL pointer dereference on failure
of drm_gtf_mode(), drm_gtf_mode() and drm_cvt_mode().
Add a check to avoid null point dereference.

Signed-off-by: Ma Ke <make_ruc2021@163.com>
---
 drivers/gpu/drm/drm_edid.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 340da8257b51..e2c154c2b896 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -3381,6 +3381,8 @@ static struct drm_display_mode *drm_mode_std(struct drm_connector *connector,
 				    false);
 		break;
 	}
+	if (!mode)
+		return NULL;
 	return mode;
 }
 
-- 
2.37.2

