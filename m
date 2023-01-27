Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C0C167EFF5
	for <lists+dri-devel@lfdr.de>; Fri, 27 Jan 2023 21:51:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 665A410E2C6;
	Fri, 27 Jan 2023 20:51:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from msg-4.mailo.com (msg-4.mailo.com [213.182.54.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05F4B10E2C6
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Jan 2023 20:51:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailo.com; s=mailo;
 t=1674852690; bh=r9cSBMJn3mflOnLsA3kDjd8yrjkKnm2dAF4ZyKs29kM=;
 h=X-EA-Auth:Date:From:To:Cc:Subject:Message-ID:MIME-Version:
 Content-Type;
 b=MHMtbPasMSOeq8cITgqud6o5CzxVy9BQenqnHND+tbn1l1lhHFXaytnKCwUaujVEi
 pWeVwN542Eg2KjKx1CmJpbBTLH1BMZR6In8uYl9WXpzNmHECRP2pdGNrrBJB954+Px
 h2fwo65Bglntb2HoG65hrBhTZW7Y+M48jf/rAngw=
Received: by b-3.in.mailobj.net [192.168.90.13] with ESMTP
 via ip-206.mailobj.net [213.182.55.206]
 Fri, 27 Jan 2023 21:51:30 +0100 (CET)
X-EA-Auth: 1zJc8Axf3sxItJw3RXYEjDVc497uFzsAFgO+gLFtm8VMZrSooyg8jW3dWmc5Q86OzEgdtkYdkiEUW3tRKFAqdHgMkJfmXOHT
Date: Sat, 28 Jan 2023 02:21:26 +0530
From: Deepak R Varma <drv@mailo.com>
To: Liviu Dudau <liviu.dudau@arm.com>, Brian Starkey <brian.starkey@arm.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH] drm/arm/malidp: use sysfs_emit in show function callback
Message-ID: <Y9Q5Tt8c9WBDxeyV@ubun2204.myguest.virtualbox.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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
Cc: Praveen Kumar <kumarpraveen@linux.microsoft.com>,
 Deepak R Varma <drv@mailo.com>, Saurabh Singh Sengar <ssengar@microsoft.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

According to Documentation/filesystems/sysfs.rst, the show() callback
function of kobject attributes should strictly use sysfs_emit() instead
of sprintf() family functions.
Issue identified using the device_attr_show.cocci Coccinelle script.

Signed-off-by: Deepak R Varma <drv@mailo.com>
---
 drivers/gpu/drm/arm/malidp_drv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/arm/malidp_drv.c b/drivers/gpu/drm/arm/malidp_drv.c
index 589c1c66a6dc..cf040e2e9efe 100644
--- a/drivers/gpu/drm/arm/malidp_drv.c
+++ b/drivers/gpu/drm/arm/malidp_drv.c
@@ -649,7 +649,7 @@ static ssize_t core_id_show(struct device *dev, struct device_attribute *attr,
 	struct drm_device *drm = dev_get_drvdata(dev);
 	struct malidp_drm *malidp = drm_to_malidp(drm);
 
-	return snprintf(buf, PAGE_SIZE, "%08x\n", malidp->core_id);
+	return sysfs_emit(buf, "%08x\n", malidp->core_id);
 }
 
 static DEVICE_ATTR_RO(core_id);
-- 
2.34.1



