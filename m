Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C6B4D63E80D
	for <lists+dri-devel@lfdr.de>; Thu,  1 Dec 2022 03:53:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46C3410E52A;
	Thu,  1 Dec 2022 02:53:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mxhk.zte.com.cn (mxhk.zte.com.cn [63.216.63.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC7B210E52A
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Dec 2022 02:53:37 +0000 (UTC)
Received: from mse-fl2.zte.com.cn (unknown [10.5.228.133])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mxhk.zte.com.cn (FangMail) with ESMTPS id 4NN0y76GV1z8QrkZ;
 Thu,  1 Dec 2022 10:53:35 +0800 (CST)
Received: from xaxapp01.zte.com.cn ([10.88.40.50])
 by mse-fl2.zte.com.cn with SMTP id 2B12rP0R030683;
 Thu, 1 Dec 2022 10:53:25 +0800 (+08)
 (envelope-from ye.xingchen@zte.com.cn)
Received: from mapi (xaxapp01[null]) by mapi (Zmail) with MAPI id mid31;
 Thu, 1 Dec 2022 10:53:26 +0800 (CST)
Date: Thu, 1 Dec 2022 10:53:26 +0800 (CST)
X-Zmail-TransId: 2af9638817266e81791a
X-Mailer: Zmail v1.0
Message-ID: <202212011053265568903@zte.com.cn>
Mime-Version: 1.0
From: <ye.xingchen@zte.com.cn>
To: <joonas.lahtinen@linux.intel.com>
Subject: =?UTF-8?B?W1BBVENIXSBkcm0vaTkxNTogdXNlIHN5c2ZzX2VtaXQoKSB0byBpbnN0ZWFkIG9mIHNjbnByaW50Zigp?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL: mse-fl2.zte.com.cn 2B12rP0R030683
X-Fangmail-Gw-Spam-Type: 0
X-FangMail-Miltered: at cgslv5.04-192.168.250.137.novalocal with ID
 6388172F.000 by FangMail milter!
X-FangMail-Envelope: 1669863215/4NN0y76GV1z8QrkZ/6388172F.000/10.5.228.133/[10.5.228.133]/mse-fl2.zte.com.cn/<ye.xingchen@zte.com.cn>
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6388172F.000/4NN0y76GV1z8QrkZ
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
Cc: tvrtko.ursulin@linux.intel.com, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 rodrigo.vivi@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: ye xingchen <ye.xingchen@zte.com.cn>

Replace the open-code with sysfs_emit() to simplify the code.

Signed-off-by: ye xingchen <ye.xingchen@zte.com.cn>
---
 drivers/gpu/drm/i915/i915_mitigations.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_mitigations.c b/drivers/gpu/drm/i915/i915_mitigations.c
index def7302ef7fe..2b7aaaefb3a9 100644
--- a/drivers/gpu/drm/i915/i915_mitigations.c
+++ b/drivers/gpu/drm/i915/i915_mitigations.c
@@ -102,10 +102,10 @@ static int mitigations_get(char *buffer, const struct kernel_param *kp)
 	bool enable;

 	if (!local)
-		return scnprintf(buffer, PAGE_SIZE, "%s\n", "off");
+		return sysfs_emit(buffer, "%s\n", "off");

 	if (local & BIT(BITS_PER_LONG - 1)) {
-		count = scnprintf(buffer, PAGE_SIZE, "%s,", "auto");
+		count = sysfs_emit(buffer, "%s,", "auto");
 		enable = false;
 	} else {
 		enable = true;
-- 
2.25.1
