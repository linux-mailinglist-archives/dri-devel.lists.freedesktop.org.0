Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4876A7C7B7B
	for <lists+dri-devel@lfdr.de>; Fri, 13 Oct 2023 04:04:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAABB10E583;
	Fri, 13 Oct 2023 02:04:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m15.mail.163.com (m15.mail.163.com [45.254.50.220])
 by gabe.freedesktop.org (Postfix) with ESMTP id ACFDC10E583
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Oct 2023 02:04:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=9r32H
 Jr+aZCW8hq5PA5ylkFRQQicXVfPBRAd4cEZX70=; b=OOdAW49H3evvBjINGia5r
 GEGSXFjjNA//Gb8AlS1uaq85j2IUVn9DoWGOcCqND6S9Bdu6akoOyYqw+e+GqxCm
 pKucz41MI9rGpPJqewSw5nsLP5S5/BCSs2wnMw8BXqidefqNUCof9IxguuEcvQ4C
 QNgAbm/xF1j770l2oE0QtU=
Received: from icess-ProLiant-DL380-Gen10.. (unknown [183.174.60.14])
 by zwqz-smtp-mta-g1-4 (Coremail) with SMTP id _____wDn74yHpShl9zKfAQ--.16988S4;
 Fri, 13 Oct 2023 10:04:00 +0800 (CST)
From: Ma Ke <make_ruc2021@163.com>
To: airlied@redhat.com, kraxel@redhat.com, airlied@gmail.com, daniel@ffwll.ch
Subject: [PATCH] drm/qxl: fix a possible null pointer dereference
Date: Fri, 13 Oct 2023 10:03:50 +0800
Message-Id: <20231013020350.344576-1-make_ruc2021@163.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wDn74yHpShl9zKfAQ--.16988S4
X-Coremail-Antispam: 1Uf129KBjvdXoWruF13Kr4Uur47Xw43AFW8JFb_yoW3KFg_WF
 y8ZwsrXryDu3Wvkr47Z34fZr1SvF1kZFWxZr1xt34Sqr48W3Z8Xry7Zwn5Z3y7Z340yFyD
 Aw4UGFnxAFs7GjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7xRKfOzJUUUUU==
X-Originating-IP: [183.174.60.14]
X-CM-SenderInfo: 5pdnvshuxfjiisr6il2tof0z/1tbivg4IC1ZcjGVeaQABsm
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
Cc: spice-devel@lists.freedesktop.org, Ma Ke <make_ruc2021@163.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In qxl_add_mode(), the return value of drm_cvt_mode() is assigned
to mode, which will lead to a NULL pointer dereference on failure
of drm_cvt_mode(). Add a check to avoid null pointer dereference.

Signed-off-by: Ma Ke <make_ruc2021@163.com>
---
 drivers/gpu/drm/qxl/qxl_display.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/qxl/qxl_display.c b/drivers/gpu/drm/qxl/qxl_display.c
index 6492a70e3c39..8a14edaa4aa3 100644
--- a/drivers/gpu/drm/qxl/qxl_display.c
+++ b/drivers/gpu/drm/qxl/qxl_display.c
@@ -236,6 +236,8 @@ static int qxl_add_mode(struct drm_connector *connector,
 		return 0;
 
 	mode = drm_cvt_mode(dev, width, height, 60, false, false, false);
+	if (!mode)
+		return 0;
 	if (preferred)
 		mode->type |= DRM_MODE_TYPE_PREFERRED;
 	mode->hdisplay = width;
-- 
2.37.2

