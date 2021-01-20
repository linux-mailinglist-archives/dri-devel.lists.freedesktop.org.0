Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 57C582FC694
	for <lists+dri-devel@lfdr.de>; Wed, 20 Jan 2021 02:27:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C74B6E141;
	Wed, 20 Jan 2021 01:27:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44F196E203;
 Wed, 20 Jan 2021 01:27:37 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1F9802343E;
 Wed, 20 Jan 2021 01:27:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1611106056;
 bh=MJksqXmuYaGUzjr4jC6xeLEyWJivFShEUeqd9qu+zGo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=n7EYIyi1sXcoQTbbeFW6ROksZRvuFuJ+wtmC5NZLrP3txH2d0FdZ2W3oeWXpOiUpz
 ElfW7UjGh/M/3bK19qgTjmibWwmCBkch/DJRvPm2i0q72lWFXzr9pYb8v3Na0nIEni
 UsMb6V1lylM0ML+zCmhWQz0tdlAbbU8vUWYDolOuVJfuEG9Fq4R3lFe9qEoTNvAl2c
 CXeiJwLljwt5lMK6IbBaboN+JNiuOuFxQq1NLxOmZ1NAirtilLOwo2CamtetxIYDAp
 4QJio1bxeK7A8uCxTwOjQ1Nyay3cHcOZzR/PpW8Yaeo7zGx1hhOJLyXs7HKK16KCYa
 TcEpmlWIQ91KA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 24/26] drm/nouveau/i2c/gm200: increase width of
 aux semaphore owner fields
Date: Tue, 19 Jan 2021 20:27:01 -0500
Message-Id: <20210120012704.770095-24-sashal@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210120012704.770095-1-sashal@kernel.org>
References: <20210120012704.770095-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Sasha Levin <sashal@kernel.org>, nouveau@lists.freedesktop.org,
 Ben Skeggs <bskeggs@redhat.com>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Ben Skeggs <bskeggs@redhat.com>

[ Upstream commit ba6e9ab0fcf3d76e3952deb12b5f993991621d9c ]

Noticed while debugging GA102.

Signed-off-by: Ben Skeggs <bskeggs@redhat.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/i2c/auxgm200.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/auxgm200.c b/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/auxgm200.c
index edb6148cbca04..d0e80ad526845 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/auxgm200.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/auxgm200.c
@@ -33,7 +33,7 @@ static void
 gm200_i2c_aux_fini(struct gm200_i2c_aux *aux)
 {
 	struct nvkm_device *device = aux->base.pad->i2c->subdev.device;
-	nvkm_mask(device, 0x00d954 + (aux->ch * 0x50), 0x00310000, 0x00000000);
+	nvkm_mask(device, 0x00d954 + (aux->ch * 0x50), 0x00710000, 0x00000000);
 }
 
 static int
@@ -54,10 +54,10 @@ gm200_i2c_aux_init(struct gm200_i2c_aux *aux)
 			AUX_ERR(&aux->base, "begin idle timeout %08x", ctrl);
 			return -EBUSY;
 		}
-	} while (ctrl & 0x03010000);
+	} while (ctrl & 0x07010000);
 
 	/* set some magic, and wait up to 1ms for it to appear */
-	nvkm_mask(device, 0x00d954 + (aux->ch * 0x50), 0x00300000, ureq);
+	nvkm_mask(device, 0x00d954 + (aux->ch * 0x50), 0x00700000, ureq);
 	timeout = 1000;
 	do {
 		ctrl = nvkm_rd32(device, 0x00d954 + (aux->ch * 0x50));
@@ -67,7 +67,7 @@ gm200_i2c_aux_init(struct gm200_i2c_aux *aux)
 			gm200_i2c_aux_fini(aux);
 			return -EBUSY;
 		}
-	} while ((ctrl & 0x03000000) != urep);
+	} while ((ctrl & 0x07000000) != urep);
 
 	return 0;
 }
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
