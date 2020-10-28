Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B19629CFF0
	for <lists+dri-devel@lfdr.de>; Wed, 28 Oct 2020 13:43:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 709756E512;
	Wed, 28 Oct 2020 12:43:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA2D06E512;
 Wed, 28 Oct 2020 12:43:18 +0000 (UTC)
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
 by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <colin.king@canonical.com>)
 id 1kXknM-0007Ge-DT; Wed, 28 Oct 2020 12:43:16 +0000
From: Colin King <colin.king@canonical.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Hawking Zhang <Hawking.Zhang@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH][next] drm/amd/pm: fix out-of-bound read on
 pptable->SkuReserved
Date: Wed, 28 Oct 2020 12:43:16 +0000
Message-Id: <20201028124316.109886-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.27.0
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Colin Ian King <colin.king@canonical.com>

A recent change added two uint16_t elements to PPTable_t and reduced the
uint32_t array down to 8 elements. This results in the dev_info printing
of pptable->SkuReserved[8] accessing a value that is out-of-range on
array SkuReserved.  The array has been shrunk by 1 element, so remove
this extraneous dev_info message.

Addresses-Coverity: ("Out-of-bounds read")
Fixes: 1dc3c5a95b08 ("drm/amd/pm: update driver if file for sienna cichlid")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/gpu/drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c b/drivers/gpu/drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c
index fa3842f460fc..0600befc6e4c 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c
+++ b/drivers/gpu/drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c
@@ -2279,7 +2279,6 @@ static void sienna_cichlid_dump_pptable(struct smu_context *smu)
 	dev_info(smu->adev->dev, "SkuReserved[5] = 0x%x\n", pptable->SkuReserved[5]);
 	dev_info(smu->adev->dev, "SkuReserved[6] = 0x%x\n", pptable->SkuReserved[6]);
 	dev_info(smu->adev->dev, "SkuReserved[7] = 0x%x\n", pptable->SkuReserved[7]);
-	dev_info(smu->adev->dev, "SkuReserved[8] = 0x%x\n", pptable->SkuReserved[8]);
 
 	dev_info(smu->adev->dev, "GamingClk[0] = 0x%x\n", pptable->GamingClk[0]);
 	dev_info(smu->adev->dev, "GamingClk[1] = 0x%x\n", pptable->GamingClk[1]);
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
