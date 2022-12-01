Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7974363E7CE
	for <lists+dri-devel@lfdr.de>; Thu,  1 Dec 2022 03:24:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F079110E525;
	Thu,  1 Dec 2022 02:24:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mxhk.zte.com.cn (mxhk.zte.com.cn [63.216.63.35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D77D610E525
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Dec 2022 02:24:34 +0000 (UTC)
Received: from mse-fl2.zte.com.cn (unknown [10.5.228.133])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mxhk.zte.com.cn (FangMail) with ESMTPS id 4NN0JZ3zMJz4xVnR;
 Thu,  1 Dec 2022 10:24:30 +0800 (CST)
Received: from xaxapp01.zte.com.cn ([10.88.40.50])
 by mse-fl2.zte.com.cn with SMTP id 2B12OKOH091870;
 Thu, 1 Dec 2022 10:24:20 +0800 (+08)
 (envelope-from ye.xingchen@zte.com.cn)
Received: from mapi (xaxapp01[null]) by mapi (Zmail) with MAPI id mid31;
 Thu, 1 Dec 2022 10:24:21 +0800 (CST)
Date: Thu, 1 Dec 2022 10:24:21 +0800 (CST)
X-Zmail-TransId: 2af963881055fffffffff8fd5203
X-Mailer: Zmail v1.0
Message-ID: <202212011024212258022@zte.com.cn>
Mime-Version: 1.0
From: <ye.xingchen@zte.com.cn>
To: <alexander.deucher@amd.com>
Subject: =?UTF-8?B?W1BBVENIXSBkcm0vYW1kZ3B1OiB1c2Ugc3lzZnNfZW1pdCgpIHRvIGluc3RlYWQgb2Ygc2NucHJpbnRmKCk=?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL: mse-fl2.zte.com.cn 2B12OKOH091870
X-Fangmail-Gw-Spam-Type: 0
X-FangMail-Miltered: at cgslv5.04-192.168.250.138.novalocal with ID
 6388105E.001 by FangMail milter!
X-FangMail-Envelope: 1669861470/4NN0JZ3zMJz4xVnR/6388105E.001/10.5.228.133/[10.5.228.133]/mse-fl2.zte.com.cn/<ye.xingchen@zte.com.cn>
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6388105E.001/4NN0JZ3zMJz4xVnR
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
Cc: xinhui.pan@amd.com, john.clements@amd.com, tao.zhou1@amd.com,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 yipeng.chai@amd.com, stanley.yang@amd.com, dri-devel@lists.freedesktop.org,
 christian.koenig@amd.com, hawking.zhang@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: ye xingchen <ye.xingchen@zte.com.cn>

Replace the open-code with sysfs_emit() to simplify the code.

Signed-off-by: ye xingchen <ye.xingchen@zte.com.cn>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
index 077404a9c935..ad490c1e2f57 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
@@ -1267,7 +1267,7 @@ static ssize_t amdgpu_ras_sysfs_features_read(struct device *dev,
 	struct amdgpu_ras *con =
 		container_of(attr, struct amdgpu_ras, features_attr);

-	return scnprintf(buf, PAGE_SIZE, "feature mask: 0x%x\n", con->features);
+	return sysfs_emit(buf, "feature mask: 0x%x\n", con->features);
 }

 static void amdgpu_ras_sysfs_remove_bad_page_node(struct amdgpu_device *adev)
-- 
2.25.1
