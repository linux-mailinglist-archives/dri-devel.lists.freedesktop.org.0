Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15649934DEC
	for <lists+dri-devel@lfdr.de>; Thu, 18 Jul 2024 15:20:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C55A610E834;
	Thu, 18 Jul 2024 13:20:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74C0310E834;
 Thu, 18 Jul 2024 13:20:05 +0000 (UTC)
Received: from icess-ProLiant-DL380-Gen10.. (unknown [183.174.60.14])
 by APP-01 (Coremail) with SMTP id qwCowABXXMh1Fplm_aoRBA--.954S2;
 Thu, 18 Jul 2024 21:19:59 +0800 (CST)
From: Ma Ke <make24@iscas.ac.cn>
To: airlied@redhat.com, kraxel@redhat.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 daniel@ffwll.ch, noralf@tronnes.org
Cc: virtualization@lists.linux.dev, spice-devel@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Ma Ke <make24@iscas.ac.cn>, stable@vger.kernel.org
Subject: [PATCH v2] drm/qxl: fix null pointer dereference in qxl_add_mode
Date: Thu, 18 Jul 2024 21:19:46 +0800
Message-Id: <20240718131946.769560-1-make24@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: qwCowABXXMh1Fplm_aoRBA--.954S2
X-Coremail-Antispam: 1UD129KBjvdXoWruF13Kr4UuryDuw4kurW3Wrg_yoWDXrb_ur
 18Zrn7WryDuF1v9r47ZryfuF4SvFykZFWxXr1xta4Sq3y8G3ZrXr43Z3Z5Z3y7Z348CFnr
 Aw4UG3Z5Aan7GjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUIcSsGvfJTRUUUb3xFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
 6r1S6rWUM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
 A2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_
 Cr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
 0DM2vYz4IE04k24VAvwVAKI4IrM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI
 64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1Y6r17McIj6I8E87Iv67AKxVWUJVW8Jw
 Am72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAG
 YxC7M4IIrI8v6xkF7I0E8cxan2IY04v7MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4
 AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE
 17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMI
 IF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4l
 IxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvf
 C2KfnxnUUI43ZEXa7VUbZmitUUUUU==
X-Originating-IP: [183.174.60.14]
X-CM-SenderInfo: ppdnvj2u6l2u1dvotugofq/
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

In qxl_add_mode(), the return value of drm_cvt_mode() is assigned to mode,
which will lead to a possible NULL pointer dereference on failure of
drm_cvt_mode(). Add a check to avoid npd.

Cc: stable@vger.kernel.org
Fixes: 1b043677d4be ("drm/qxl: add qxl_add_mode helper function")
Signed-off-by: Ma Ke <make24@iscas.ac.cn>
---
Changes in v2:
- added a blank line;
- added Cc line.
---
 drivers/gpu/drm/qxl/qxl_display.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/qxl/qxl_display.c b/drivers/gpu/drm/qxl/qxl_display.c
index c6d35c33d5d6..c371ee59ab07 100644
--- a/drivers/gpu/drm/qxl/qxl_display.c
+++ b/drivers/gpu/drm/qxl/qxl_display.c
@@ -236,6 +236,9 @@ static int qxl_add_mode(struct drm_connector *connector,
 		return 0;
 
 	mode = drm_cvt_mode(dev, width, height, 60, false, false, false);
+	if (!mode)
+		return -ENOMEM;
+
 	if (preferred)
 		mode->type |= DRM_MODE_TYPE_PREFERRED;
 	mode->hdisplay = width;
-- 
2.25.1

