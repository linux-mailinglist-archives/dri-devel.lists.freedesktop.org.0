Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E40D9F2BB9
	for <lists+dri-devel@lfdr.de>; Mon, 16 Dec 2024 09:25:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D05DE10E3F5;
	Mon, 16 Dec 2024 08:25:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.nfschina.com (unknown [42.101.60.213])
 by gabe.freedesktop.org (Postfix) with SMTP id EA49010E08B;
 Mon, 16 Dec 2024 01:53:07 +0000 (UTC)
Received: from localhost.localdomain (unknown [103.163.180.3])
 by mail.nfschina.com (MailData Gateway V2.8.8) with ESMTPSA id B1EE860272AA8; 
 Mon, 16 Dec 2024 09:53:02 +0800 (CST)
X-MD-Sfrom: zhanxin@nfschina.com
X-MD-SrcIP: 103.163.180.3
From: Zhanxin Qi <zhanxin@nfschina.com>
To: kherbst@redhat.com, lyude@redhat.com, dakr@redhat.com, airlied@gmail.com,
 simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Zhanxin Qi <zhanxin@nfschina.com>
Subject: [PATCH] drm/nouveau: Fix memory leak in nvbios_iccsense_parse
Date: Mon, 16 Dec 2024 09:52:46 +0800
Message-Id: <20241216015246.141006-1-zhanxin@nfschina.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 16 Dec 2024 08:25:53 +0000
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

The nvbios_iccsense_parse function allocates memory for sensor data
but fails to free it when the function exits, leading to a memory
leak. Add proper cleanup to free the allocated memory.

Signed-off-by: Zhanxin Qi <zhanxin@nfschina.com>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/iccsense/base.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/iccsense/base.c b/drivers/gpu/drm/nouveau/nvkm/subdev/iccsense/base.c
index 8f0ccd3664eb..502608d575f7 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/iccsense/base.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/iccsense/base.c
@@ -291,6 +291,9 @@ nvkm_iccsense_oneinit(struct nvkm_subdev *subdev)
 			list_add_tail(&rail->head, &iccsense->rails);
 		}
 	}
+
+	kfree(stbl.rail);
+
 	return 0;
 }
 
-- 
2.30.2

