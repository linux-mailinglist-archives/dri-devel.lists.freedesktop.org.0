Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3063C919F4E
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jun 2024 08:32:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D06DD10E0EF;
	Thu, 27 Jun 2024 06:32:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5FE510E0EF
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jun 2024 06:32:45 +0000 (UTC)
Received: from icess-ProLiant-DL380-Gen10.. (unknown [183.174.60.14])
 by APP-01 (Coremail) with SMTP id qwCowACXClV8B31mtQcpAA--.9186S2;
 Thu, 27 Jun 2024 14:32:31 +0800 (CST)
From: Ma Ke <make24@iscas.ac.cn>
To: patrik.r.jakobsson@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 daniel@ffwll.ch, alan@linux.intel.com, airlied@redhat.com
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Ma Ke <make24@iscas.ac.cn>, stable@vger.kernel.org
Subject: [PATCH v2] drm/gma500: fix null pointer dereference in
 cdv_intel_lvds_get_modes
Date: Thu, 27 Jun 2024 14:32:20 +0800
Message-Id: <20240627063220.3013568-1-make24@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: qwCowACXClV8B31mtQcpAA--.9186S2
X-Coremail-Antispam: 1UD129KBjvJXoWrtF1rCw4fWFWDtFWkWr13XFb_yoW8Jryfpr
 47GFyjyr4FqFZFgFW8C3WvgF4Yqa43KFn7KryDZws3uFn0yF1UXryru3yfWrW3CFZxGrZY
 yrnxtay5Ga10kF7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUU9F14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWUWVWUuwAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
 6F4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Cr
 1j6rxdM2vYz4IE04k24VAvwVAKI4IrM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVAC
 Y4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJV
 W8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI2
 0VAGYxC7M4IIrI8v6xkF7I0E8cxan2IY04v7MxAIw28IcxkI7VAKI48JMxC20s026xCaFV
 Cjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWl
 x4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r
 1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_
 JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcS
 sGvfC2KfnxnUUI43ZEXa7VUbHa0DUUUUU==
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

In cdv_intel_lvds_get_modes(), the return value of drm_mode_duplicate()
is assigned to mode, which will lead to a NULL pointer dereference on
failure of drm_mode_duplicate(). Add a check to avoid npd.

Cc: stable@vger.kernel.org
Fixes: 6a227d5fd6c4 ("gma500: Add support for Cedarview")
Signed-off-by: Ma Ke <make24@iscas.ac.cn>
---
Changes in v2:
- modified the patch according to suggestions from other patchs;
- added Fixes line;
- added Cc stable;
- Link: https://lore.kernel.org/lkml/20240622072514.1867582-1-make24@iscas.ac.cn/T/
---
 drivers/gpu/drm/gma500/cdv_intel_lvds.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/gma500/cdv_intel_lvds.c b/drivers/gpu/drm/gma500/cdv_intel_lvds.c
index f08a6803dc18..3adc2c9ab72d 100644
--- a/drivers/gpu/drm/gma500/cdv_intel_lvds.c
+++ b/drivers/gpu/drm/gma500/cdv_intel_lvds.c
@@ -311,6 +311,9 @@ static int cdv_intel_lvds_get_modes(struct drm_connector *connector)
 	if (mode_dev->panel_fixed_mode != NULL) {
 		struct drm_display_mode *mode =
 		    drm_mode_duplicate(dev, mode_dev->panel_fixed_mode);
+		if (!mode)
+			return 0;
+
 		drm_mode_probed_add(connector, mode);
 		return 1;
 	}
-- 
2.25.1

