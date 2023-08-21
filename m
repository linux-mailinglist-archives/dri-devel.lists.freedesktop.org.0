Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A91C7823A4
	for <lists+dri-devel@lfdr.de>; Mon, 21 Aug 2023 08:22:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAE0810E1D9;
	Mon, 21 Aug 2023 06:22:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.nfschina.com (unknown [42.101.60.195])
 by gabe.freedesktop.org (Postfix) with SMTP id 697DE10E1D9
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Aug 2023 06:22:10 +0000 (UTC)
Received: from localhost.localdomain (unknown [180.167.10.98])
 by mail.nfschina.com (Maildata Gateway V2.8.8) with ESMTPA id 7DC1B6061F466;
 Mon, 21 Aug 2023 14:22:06 +0800 (CST)
X-MD-Sfrom: suhui@nfschina.com
X-MD-SrcIP: 180.167.10.98
From: Su Hui <suhui@nfschina.com>
To: airlied@redhat.com, tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch
Subject: [PATCH] drm/ast: Avoid possible NULL dereference
Date: Mon, 21 Aug 2023 14:22:00 +0800
Message-Id: <20230821062159.198691-1-suhui@nfschina.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
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
Cc: eich@suse.de, Su Hui <suhui@nfschina.com>, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

smatch error:
drivers/gpu/drm/ast/ast_dp501.c:227 ast_launch_m68k() error:
we previously assumed 'ast->dp501_fw' could be null (see line 223)

when "!ast->dp501_fw" and "ast_load_dp501_microcode(dev) >= 0" is true,
there will be a NULL dereference of 'ast->dp501_fw'.

Fixes: 12f8030e05c6 ("drm/ast: Actually load DP501 firmware when required")
Signed-off-by: Su Hui <suhui@nfschina.com>
---
 drivers/gpu/drm/ast/ast_dp501.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_dp501.c b/drivers/gpu/drm/ast/ast_dp501.c
index 1bc35a992369..d9f3a0786a6f 100644
--- a/drivers/gpu/drm/ast/ast_dp501.c
+++ b/drivers/gpu/drm/ast/ast_dp501.c
@@ -224,8 +224,10 @@ static bool ast_launch_m68k(struct drm_device *dev)
 			    ast_load_dp501_microcode(dev) < 0)
 				return false;
 
-			fw_addr = (u8 *)ast->dp501_fw->data;
-			len = ast->dp501_fw->size;
+			if (ast->dp501_fw) {
+				fw_addr = (u8 *)ast->dp501_fw->data;
+				len = ast->dp501_fw->size;
+			}
 		}
 		/* Get BootAddress */
 		ast_moutdwm(ast, 0x1e6e2000, 0x1688a8a8);
-- 
2.30.2

