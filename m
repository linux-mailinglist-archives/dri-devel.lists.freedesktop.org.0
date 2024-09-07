Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D407970083
	for <lists+dri-devel@lfdr.de>; Sat,  7 Sep 2024 09:01:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA8E910E817;
	Sat,  7 Sep 2024 07:01:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=uniontech.com header.i=@uniontech.com header.b="baigTiG0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 89631 seconds by postgrey-1.36 at gabe;
 Sat, 07 Sep 2024 07:01:08 UTC
Received: from smtpbgbr2.qq.com (smtpbgbr2.qq.com [54.207.22.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5462B10E817
 for <dri-devel@lists.freedesktop.org>; Sat,  7 Sep 2024 07:01:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
 s=onoh2408; t=1725692420;
 bh=Zlnter0CIEiqLPIY1ZRE/Q76uzwHmueWTv3hL1cG8Ys=;
 h=From:To:Subject:Date:Message-ID:MIME-Version;
 b=baigTiG0FgVHKeN+5lRD1uRLViePBRTkkwFGWN9u0e7ZNbwt6j6uubHELEoKeOKrg
 rkqkCmm+mPqB0Wr40M2G++/AtCHWrTxT7wnJXKtHZD9zWmNNmB9lrWzpKVxeRrAs4l
 rfYwfoXpxF+dCHN8Vw6LhMYVMuWdLM40JpnDz6q8=
X-QQ-mid: bizesmtp79t1725692417t9pbm363
X-QQ-Originating-IP: RQQ3ZYuKn4lfMA+MstH4V8ZD/hhuIFWX5OniXe0luCY=
Received: from localhost.localdomain ( [221.226.144.218])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Sat, 07 Sep 2024 15:00:12 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 14737816979990664650
From: He Lugang <helugang@uniontech.com>
To: noralf@tronnes.org, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org,
	He Lugang <helugang@uniontech.com>
Subject: [PATCH 2/3] drm/gud: use devm_add_action_or_reset() helper
Date: Sat,  7 Sep 2024 15:00:10 +0800
Message-ID: <FD5792B37EAB593D+20240907070010.1661756-1-helugang@uniontech.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:uniontech.com:qybglogicsvrgz:qybglogicsvrgz7a-0
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

Use devm_add_action_or_reset() to release resources in case of failure,
because the cleanup function will be automatically called.

Signed-off-by: He Lugang <helugang@uniontech.com>
---
 drivers/gpu/drm/gud/gud_drv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/gud/gud_drv.c b/drivers/gpu/drm/gud/gud_drv.c
index ac6bbf920c72..f121f6deb268 100644
--- a/drivers/gpu/drm/gud/gud_drv.c
+++ b/drivers/gpu/drm/gud/gud_drv.c
@@ -473,7 +473,7 @@ static int gud_probe(struct usb_interface *intf, const struct usb_device_id *id)
 	INIT_WORK(&gdrm->work, gud_flush_work);
 	gud_clear_damage(gdrm);
 
-	ret = devm_add_action(dev, gud_free_buffers_and_mutex, gdrm);
+	ret = devm_add_action_or_reset(dev, gud_free_buffers_and_mutex, gdrm);
 	if (ret)
 		return ret;
 
-- 
2.45.2

