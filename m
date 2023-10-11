Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B8E37C472F
	for <lists+dri-devel@lfdr.de>; Wed, 11 Oct 2023 03:22:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4013A10E407;
	Wed, 11 Oct 2023 01:22:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m15.mail.163.com (m15.mail.163.com [45.254.50.220])
 by gabe.freedesktop.org (Postfix) with ESMTP id 410D410E414
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Oct 2023 01:22:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=Vr7Bs
 tkKmldss60EUl/n4EYbPgUE5JxJ5+BpG7bzkYQ=; b=AkSI/sGdPGFgpvQqRApYk
 DgNxb1fFcsvtgE0LcqGEn/AZs5OcgDhYyWCTyL4BOpUZvH2QgNicuZm0FdPNuFfS
 myzuCrppFgQiVngRc3p3b18bsUoa+53PmtDeQk6wGREuxjJKlEnNM9s4OfLyTojG
 MKBl4Cstx1ai+A4iEGXieg=
Received: from icess-ProLiant-DL380-Gen10.. (unknown [183.174.60.14])
 by zwqz-smtp-mta-g2-4 (Coremail) with SMTP id _____wBHZiep+CVluP_jAA--.11044S4;
 Wed, 11 Oct 2023 09:21:54 +0800 (CST)
From: Ma Ke <make_ruc2021@163.com>
To: alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@gmail.com, daniel@ffwll.ch
Subject: [PATCH] drm/radeon: fix a possible null pointer dereference
Date: Wed, 11 Oct 2023 09:21:43 +0800
Message-Id: <20231011012143.4091532-1-make_ruc2021@163.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wBHZiep+CVluP_jAA--.11044S4
X-Coremail-Antispam: 1Uf129KBjvdXoWruryxAF1xKr4fJr13WFW7Arb_yoWDWrg_WF
 ykXa9rXa90vas5AF1UZFn7Jr9F9rW8ZFWkJw1fta4S9397tF1xCFW3GFWYv3y3Xay5AF98
 Aw4rKr13CF4xKjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7xRKpBTDUUUUU==
X-Originating-IP: [183.174.60.14]
X-CM-SenderInfo: 5pdnvshuxfjiisr6il2tof0z/xtbBFQUFC2B9odECqQABsZ
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
Cc: Ma Ke <make_ruc2021@163.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In radeon_tv_get_modes(), the return value of drm_cvt_mode()
is assigned to mode, which will lead to a NULL pointer
dereference on failure of drm_cvt_mode(). Add a check to
avoid null point dereference.

Signed-off-by: Ma Ke <make_ruc2021@163.com>
---
 drivers/gpu/drm/radeon/radeon_connectors.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/radeon/radeon_connectors.c b/drivers/gpu/drm/radeon/radeon_connectors.c
index d2f02c3dfce2..b84b58926106 100644
--- a/drivers/gpu/drm/radeon/radeon_connectors.c
+++ b/drivers/gpu/drm/radeon/radeon_connectors.c
@@ -1119,6 +1119,8 @@ static int radeon_tv_get_modes(struct drm_connector *connector)
 	else {
 		/* only 800x600 is supported right now on pre-avivo chips */
 		tv_mode = drm_cvt_mode(dev, 800, 600, 60, false, false, false);
+		if (!tv_mode)
+			return 0;
 		tv_mode->type = DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED;
 		drm_mode_probed_add(connector, tv_mode);
 	}
-- 
2.37.2

