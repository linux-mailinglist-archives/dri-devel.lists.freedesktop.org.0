Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FC4282F4A0
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jan 2024 19:51:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5F4B10E0EB;
	Tue, 16 Jan 2024 18:51:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 40627 seconds by postgrey-1.36 at gabe;
 Tue, 16 Jan 2024 18:51:06 UTC
Received: from out162-62-58-211.mail.qq.com (out162-62-58-211.mail.qq.com
 [162.62.58.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB89810E0EB
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jan 2024 18:51:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
 t=1705431056; bh=eU+5dXg85Q+B81rY0M0vNH6+0V5kiwkRjQQOQ1SSHXM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=ZN++Wb/tuhXAudweMdOt1irBfzKE/ddb16suOi0SnP47r/KsjpNjOjkNDZMrg633P
 8F7nzl64wpHOfb/4xsE2Hp+Zb6UHYrUn8GXtOZaBbTyhnxrC1pMADQCdjNsFuO55po
 qm6s9lDKXb6tU50AJj8wtvqXpEwp7YTgyyo/pbyQ=
Received: from cyy-pc.lan ([218.70.255.58])
 by newxmesmtplogicsvrszc5-0.qq.com (NewEsmtp) with SMTP
 id CB393AE5; Wed, 17 Jan 2024 02:50:51 +0800
X-QQ-mid: xmsmtpt1705431051t62kvvjaw
Message-ID: <tencent_8637383EE0A2C7CC870036AAF01909B26A0A@qq.com>
X-QQ-XMAILINFO: OXUTDCKaRCI/pPaxgHCPsD+M4r1SEnCJrBxnBy7Ka/EB+lId5sgWUrLuwKK82z
 /DpM7g9jLXDIjKq4ic6w2U8cnSgaZgQgrYb+9su1bhY+dbfzG0zYXESNcnTxko0ApvwdfRG1pcjf
 +hvgdXiwdZtqNOYNSqPkexn4cIR81SX/ApJ/48521J7hjEDdtKfF4lkmSxSR+Gq3hiNxOsOoZBT8
 nIWsYd2E2F/1s1vooCMFYkt96jL1WB3tU6LKmu5Z5LTTTLAC6OSPzZ0Y4WpbYxnAIvQIAqoiyOct
 I4H/t6hiSolUPfnJUsPc8sG+ER9DptBzHe/2rhDdqzLkAtaoqy7POSaxaiK5NoRNChMpzXqAXU1r
 u6tmaxQxMI+ZRFoINfnp/hITYqMYlLib9LsKrXd2BFl8RnpOBG7/RT4XNnHDE5k4KjhRyujVTMz+
 i/4txcNwwEIXau5hg/XMa+bcZZskdMGHhGPB6Zd2d3HwXcqmZbz8ygtNwdf020KkAVeOlHUpvGgM
 rVpX0LAC49wdYnaLwyOwpT1cscby9faywQkKF+O4ymZiIoUVICqsb0LEKEXrps1ZsuJIbHBPbUac
 dcP5YNl1ed+pdbZx/gRWmlAGTfTaIvxgiI719hQs0UkFileTmc21cyjjNysxShQbulWEX0Xq+tDM
 auxhwKDVuelidp1XwYt3obbD06gnQidmxBIyYvcNZgeYh+OWphcGJeC7SgVtUkxKj5Qw0kW9+XfO
 axSKgpE7swGSaDKt93e2qCrXQ56GMlERPbbYnqI3wPxp8QhuUAQ5t75ik0dODp68ReRaC9tOchqr
 BOZqKhy11+QlAHWHL7f6CUSTOCxbVhqYlTPj2OxXadCaVfvjow/vnptWHfKEdjsfDF4DE4SY3Jfx
 Q/fSGLf0pVG4fzfWTkl0DxAxr7EMjF3ubCW2wKqOmG0vW43tQOtZDk85vUhJOafjCrtZWwfWZ7az
 /UjHugQO3+2o8Vg4TsIeaZoRU+7TrFEAVyrkQNbXPhS00PgfK7P1k58cqqKGegZcIrhsgLM4Q=
X-QQ-XMRINFO: Nq+8W0+stu50PRdwbJxPCL0=
From: Yangyu Chen <cyy@cyyself.name>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 1/1] drm/ttm: allocate dummy_read_page without DMA32 on fail
Date: Wed, 17 Jan 2024 02:50:34 +0800
X-OQ-MSGID: <20240116185034.175354-1-cyy@cyyself.name>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <tencent_53C5DA6E8E55B80731AE21328D037C908208@qq.com>
References: <tencent_53C5DA6E8E55B80731AE21328D037C908208@qq.com>
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
Cc: Daniel Vetter <daniel@ffwll.ch>, Jiuyang Liu <liu@jiuyang.me>,
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 Yangyu Chen <cyy@cyyself.name>, Huang Rui <ray.huang@amd.com>,
 Icenowy Zheng <uwu@icenowy.me>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Christian Koenig <christian.koenig@amd.com>,
 Yichuan Gao <i@gycis.me>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Some platforms may not have any memory in ZONE_DMA32 and use IOMMU to allow
32-bit-DMA-only device to work. Forcing GFP_DMA32 on dummy_read_page will
fail on such platforms. Retry after fail will get this works on such
platforms.

Signed-off-by: Yangyu Chen <cyy@cyyself.name>
---
 drivers/gpu/drm/ttm/ttm_device.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_device.c b/drivers/gpu/drm/ttm/ttm_device.c
index d48b39132b32..c9fa8561f71f 100644
--- a/drivers/gpu/drm/ttm/ttm_device.c
+++ b/drivers/gpu/drm/ttm/ttm_device.c
@@ -95,11 +95,17 @@ static int ttm_global_init(void)
 	ttm_pool_mgr_init(num_pages);
 	ttm_tt_mgr_init(num_pages, num_dma32);
 
-	glob->dummy_read_page = alloc_page(__GFP_ZERO | GFP_DMA32);
+	glob->dummy_read_page = alloc_page(__GFP_ZERO | GFP_DMA32 |
+					   __GFP_NOWARN);
 
+	/* Retry without GFP_DMA32 for platforms DMA32 is not available */
 	if (unlikely(glob->dummy_read_page == NULL)) {
-		ret = -ENOMEM;
-		goto out;
+		glob->dummy_read_page = alloc_page(__GFP_ZERO);
+		if (unlikely(glob->dummy_read_page == NULL)) {
+			ret = -ENOMEM;
+			goto out;
+		}
+		pr_warn("Using GFP_DMA32 fallback for dummy_read_page\n");
 	}
 
 	INIT_LIST_HEAD(&glob->device_list);
-- 
2.43.0

