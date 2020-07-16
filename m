Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 865252222F4
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jul 2020 14:54:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D56176EC5A;
	Thu, 16 Jul 2020 12:54:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D71F6EC55
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jul 2020 12:53:57 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 74848AF9C;
 Thu, 16 Jul 2020 12:53:59 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, daniel@ffwll.ch, sam@ravnborg.org, noralf@tronnes.org,
 yc_chen@aspeedtech.com
Subject: [PATCH v2 5/6] drm/ast: Initialize DRAM type before posting GPU
Date: Thu, 16 Jul 2020 14:53:52 +0200
Message-Id: <20200716125353.31512-6-tzimmermann@suse.de>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200716125353.31512-1-tzimmermann@suse.de>
References: <20200716125353.31512-1-tzimmermann@suse.de>
MIME-Version: 1.0
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Emil Velikov <emil.l.velikov@gmail.com>, dri-devel@lists.freedesktop.org,
 Gerd Hoffmann <kraxel@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 stable@vger.kernel.org, Joel Stanley <joel@jms.id.au>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Posting the GPU requires the correct DRAM type to be stored in
struct ast_private. Therefore first initialize the DRAM info and
then post the GPU. This restores the original order of instructions
in this function.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Acked-by: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Fixes: bad09da6deab ("drm/ast: Fixed vram size incorrect issue on POWER")
Cc: Joel Stanley <joel@jms.id.au>
Cc: Y.C. Chen <yc_chen@aspeedtech.com>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Dave Airlie <airlied@redhat.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Gerd Hoffmann <kraxel@redhat.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Emil Velikov <emil.l.velikov@gmail.com>
Cc: "Y.C. Chen" <yc_chen@aspeedtech.com>
Cc: <stable@vger.kernel.org> # v4.11+
---
 drivers/gpu/drm/ast/ast_main.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_main.c b/drivers/gpu/drm/ast/ast_main.c
index b162cc82204d..87e5baded2a7 100644
--- a/drivers/gpu/drm/ast/ast_main.c
+++ b/drivers/gpu/drm/ast/ast_main.c
@@ -418,15 +418,15 @@ int ast_driver_load(struct drm_device *dev, unsigned long flags)
 
 	ast_detect_chip(dev, &need_post);
 
-	if (need_post)
-		ast_post_gpu(dev);
-
 	ret = ast_get_dram_info(dev);
 	if (ret)
 		goto out_free;
 	drm_info(dev, "dram MCLK=%u Mhz type=%d bus_width=%d\n",
 		 ast->mclk, ast->dram_type, ast->dram_bus_width);
 
+	if (need_post)
+		ast_post_gpu(dev);
+
 	ret = ast_mm_init(ast);
 	if (ret)
 		goto out_free;
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
