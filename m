Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 324077D7F71
	for <lists+dri-devel@lfdr.de>; Thu, 26 Oct 2023 11:18:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A84010E10F;
	Thu, 26 Oct 2023 09:18:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.nfschina.com (unknown [42.101.60.195])
 by gabe.freedesktop.org (Postfix) with SMTP id 60CDF10E10F
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Oct 2023 09:18:21 +0000 (UTC)
Received: from localhost.localdomain (unknown [180.167.10.98])
 by mail.nfschina.com (Maildata Gateway V2.8.8) with ESMTPA id 5036A608E52BE;
 Thu, 26 Oct 2023 17:18:17 +0800 (CST)
X-MD-Sfrom: suhui@nfschina.com
X-MD-SrcIP: 180.167.10.98
From: Su Hui <suhui@nfschina.com>
To: dan.carpenter@linaro.org, lukas@wunner.de,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, daniel@ffwll.ch
Subject: [PATCH v2] vga_switcheroo: Fix impossible judgment condition
Date: Thu, 26 Oct 2023 17:18:04 +0800
Message-Id: <20231026091804.967960-1-suhui@nfschina.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Su Hui <suhui@nfschina.com>, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Jim.Qu@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

'id' is enum type like unsigned int, so it will never be less than zero.
It's better to check VGA_SWITCHEROO_UNKNOWN_ID too.

Fixes: 4aaf448fa975 ("vga_switcheroo: set audio client id according to bound GPU id")
Signed-off-by: Su Hui <suhui@nfschina.com>
---
v2:
 - add check of VGA_SWITCHEROO_UNKNOWN_ID(Dan's suggestion). 

By the way, all functions of 'get_client_id' will never return error code
or VGA_SWITCHEROO_UNKNOWN_ID，should we remove this check or keep it for
future.

 drivers/gpu/vga/vga_switcheroo.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/vga/vga_switcheroo.c b/drivers/gpu/vga/vga_switcheroo.c
index 365e6ddbe90f..cf530094f929 100644
--- a/drivers/gpu/vga/vga_switcheroo.c
+++ b/drivers/gpu/vga/vga_switcheroo.c
@@ -375,7 +375,7 @@ int vga_switcheroo_register_audio_client(struct pci_dev *pdev,
 	mutex_lock(&vgasr_mutex);
 	if (vgasr_priv.active) {
 		id = vgasr_priv.handler->get_client_id(vga_dev);
-		if (id < 0) {
+		if ((int)id < 0 || id == VGA_SWITCHEROO_UNKNOWN_ID) {
 			mutex_unlock(&vgasr_mutex);
 			return -EINVAL;
 		}
-- 
2.30.2

