Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7635282EF4E
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jan 2024 14:02:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E945F10E4CA;
	Tue, 16 Jan 2024 13:02:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out203-205-221-190.mail.qq.com (out203-205-221-190.mail.qq.com
 [203.205.221.190])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9EEC10E4CA
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jan 2024 13:02:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
 t=1705410140; bh=pxcyGJeLrdotw9GYTqLreGiV8r21vRQ/d1wzlmuZ/So=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=onoQ4pOHQYwwt1CcSYYG5hzdFK9OPjn8rshusZyTc2+rgUxkap4bgHGuRC8PaM2pG
 1KS1k62Nl+b1FKwtkDpSzBv1pkMhwxRlcO97CrqsSx1LZpCCgJGSPdWipYbtmkIR3x
 QthIujS5iGQ99LSZBeSU04IzInlQodx5oZG/vk2g=
Received: from cyy-pc.lan ([2001:da8:c800:d084:c65a:644a:13d7:e72c])
 by newxmesmtplogicsvrszb9-0.qq.com (NewEsmtp) with SMTP
 id 880E6D7; Tue, 16 Jan 2024 21:02:08 +0800
X-QQ-mid: xmsmtpt1705410128tzozwsdnv
Message-ID: <tencent_7D66A3085F83608576A8E309EE714C5CC806@qq.com>
X-QQ-XMAILINFO: OVFdYp27KdlJUb+gPn8mDFbwcFcUtRNz/Q2Z7eArW6SD5oISlxsWi3jjtYgj8m
 /t/Iq7DXN9342MVGfgi66yJcBdIUSRK5gLDF4Zg6ciFh8riHfuRKiu8xnDrmRuQsCXn7LKhcjDEC
 oohPcP+uGHORgqGtfy+w7o6ki23FgwpXYHOYrubHrcs/UTt2Je2YySpF52T1KF/ywflT6YDtxJ96
 jEMmBj5RKwfSHKVISNoiIcf6aOqJ4FxQtVm88wbRIKnNRtNDap9ii8dgUARiRykdTnynb547XVxm
 bnH7T6uUJ++aVEwjYBBzcLKZwDgEB93tLwHzjZfSxz/VOPKsZMJ6vDiJwPfglzyZ82GwYYChSLDQ
 DTZypplGiT2Huk42S9zLHVuYCoMM7XarZXHr+7blrwtYidglawixYsz+RSbSZjbndTMwolX3zKr7
 UiIIu2mcSDlnBQ3vMGzfIEAb5VvICBt0XBibNRur8Rd1dvROh3OGJUtnPNN2zHR/ZcG9hpx5iAxm
 d8SjsNROjaY5O0vKOOI9Hi48CQrlc4hZBCnvF3Gu3NoM69zEhUKNfBWsPLb7rCWA7Y6vt+UwBkQ2
 npoWkDjGyZGsy7FOPupR2leiOB0SEpoeRycWVv6QhuY0hjgTeKRaL73pHcvZx9X7hr6M9fJGWX03
 zu8pWabLdg4CqaV5dlveGuHByP3d0w4JAaqkXKo7+HMTXc1BBgBoqFfp4DLzYmzOBsC3RdOsdhHX
 TurQYav8W5U6Q3nHVxtSWNo5SPixeETGPALVj7rBf3cSHHd4FeB2UcDHfLQDgUtnIH7um7PuYAC0
 3WZ8XV3Y9Tj3JFQZ9xHHYMIbVxPDNnyVO9RKkidxojjeDcP4Jqu4D/Jux30eRjdjABMudwGjlfEX
 IoL48bWLOaZ69ravZpepVmUnkEm8tN62YSiwaD687ydbUId1nnAPqyEzwJFKs3jntDMrbVXhD1vN
 xPBpQ7cGK4BpWBxPX8XEkgs7dI2RU3krv2vyj5R2UXGEO/2bKDEjrmURs/s0uqIridolYLMNwduP
 mxVUJ3zrfW2vamL6PU
X-QQ-XMRINFO: NS+P29fieYNw95Bth2bWPxk=
From: Yangyu Chen <cyy@cyyself.name>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/1] drm/ttm: allocate dummy_read_page without DMA32 on fail
Date: Tue, 16 Jan 2024 21:02:03 +0800
X-OQ-MSGID: <20240116130203.149635-1-cyy@cyyself.name>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <tencent_40DF99E09A3681E339EE570C430878232106@qq.com>
References: <tencent_40DF99E09A3681E339EE570C430878232106@qq.com>
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
 drivers/gpu/drm/ttm/ttm_device.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_device.c b/drivers/gpu/drm/ttm/ttm_device.c
index d48b39132b32..a07d9ea919b6 100644
--- a/drivers/gpu/drm/ttm/ttm_device.c
+++ b/drivers/gpu/drm/ttm/ttm_device.c
@@ -98,8 +98,13 @@ static int ttm_global_init(void)
 	glob->dummy_read_page = alloc_page(__GFP_ZERO | GFP_DMA32);
 
 	if (unlikely(glob->dummy_read_page == NULL)) {
-		ret = -ENOMEM;
-		goto out;
+		/* Retry without GFP_DMA32 */
+		glob->dummy_read_page = alloc_page(__GFP_ZERO);
+		if (unlikely(glob->dummy_read_page == NULL)) {
+			ret = -ENOMEM;
+			goto out;
+		}
+		pr_warn("Failed to allocate dummy_read_page with GFP_DMA32, some old graphics card only has 32bit DMA may not work properly.\n");
 	}
 
 	INIT_LIST_HEAD(&glob->device_list);
-- 
2.43.0

