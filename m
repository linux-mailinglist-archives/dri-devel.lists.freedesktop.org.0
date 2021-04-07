Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EC2B43563DD
	for <lists+dri-devel@lfdr.de>; Wed,  7 Apr 2021 08:23:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8434E6E8D0;
	Wed,  7 Apr 2021 06:23:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1993 seconds by postgrey-1.36 at gabe;
 Wed, 07 Apr 2021 03:46:40 UTC
Received: from m15113.mail.126.com (m15113.mail.126.com [220.181.15.113])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A38536E03F;
 Wed,  7 Apr 2021 03:46:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
 s=s110527; h=From:Subject:Date:Message-Id; bh=EYLDIVy5Lq+tCCcmxS
 9wSWSpPH1DV1dAdlXfneGhR7w=; b=SPFZZtkE7t/KQmLEIBEGSzC7QSWAYnUt+q
 dJXipiD05wCV/Jdog3/D7te4YJs/PTjZ2b/vSlR1jfNvYM/ZA4+TimnfMyt7r+vk
 WDXFuIsVLbs7t0W9EpZ1q+ARzkteO2adkMHyoKBG0rEtkFP2Qw23TgxBlWJukXoi
 UfJY08/2U=
Received: from localhost.localdomain (unknown [106.16.165.72])
 by smtp3 (Coremail) with SMTP id DcmowAAHDeGnIm1gdK2IQA--.41702S2;
 Wed, 07 Apr 2021 11:10:44 +0800 (CST)
From: wangyingjie55@126.com
To: alexander.deucher@amd.com, christian.koenig@amd.com, airlied@linux.ie,
 daniel@ffwll.ch, airlied@redhat.com
Subject: [PATCH v1] drm/radeon: Fix a missing check bug in
 radeon_dp_mst_detect()
Date: Tue,  6 Apr 2021 20:10:04 -0700
Message-Id: <1617765004-5308-1-git-send-email-wangyingjie55@126.com>
X-Mailer: git-send-email 2.7.4
X-CM-TRANSID: DcmowAAHDeGnIm1gdK2IQA--.41702S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrurW8KF4kZrWftr1xKrW3ZFb_yoWkGwbE9r
 n7Wa4rJayDKryIq3W7Z3WxX3sFgw4j9F1UWr1ftryIqry8Jr1fuF15t3WFyan8Xay7Jrn8
 K3WrKFy3Ars3KjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUU9XoDUUUUU==
X-Originating-IP: [106.16.165.72]
X-CM-SenderInfo: 5zdqw5xlqjyxrhvvqiyswou0bp/1tbiVxRtp1pEDOzDMAAAsE
X-Mailman-Approved-At: Wed, 07 Apr 2021 06:23:45 +0000
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
Cc: dri-devel@lists.freedesktop.org, wangyingjie55@126.com,
 amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Yingjie Wang <wangyingjie55@126.com>

In radeon_dp_mst_detect(), We should check whether or not @connector
has been unregistered from userspace. If the connector is unregistered,
we should return disconnected status.

Fixes: 9843ead08f18 ("drm/radeon: add DisplayPort MST support (v2)")
Signed-off-by: Yingjie Wang <wangyingjie55@126.com>
---
 drivers/gpu/drm/radeon/radeon_dp_mst.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/radeon/radeon_dp_mst.c b/drivers/gpu/drm/radeon/radeon_dp_mst.c
index 2c32186c4acd..4e4c937c36c6 100644
--- a/drivers/gpu/drm/radeon/radeon_dp_mst.c
+++ b/drivers/gpu/drm/radeon/radeon_dp_mst.c
@@ -242,6 +242,9 @@ radeon_dp_mst_detect(struct drm_connector *connector,
 		to_radeon_connector(connector);
 	struct radeon_connector *master = radeon_connector->mst_port;
 
+	if (drm_connector_is_unregistered(connector))
+		return connector_status_disconnected;
+
 	return drm_dp_mst_detect_port(connector, ctx, &master->mst_mgr,
 				      radeon_connector->port);
 }
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
