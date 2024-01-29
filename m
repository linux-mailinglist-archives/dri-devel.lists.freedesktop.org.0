Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8928840065
	for <lists+dri-devel@lfdr.de>; Mon, 29 Jan 2024 09:38:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08FD911261E;
	Mon, 29 Jan 2024 08:37:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1930 seconds by postgrey-1.36 at gabe;
 Mon, 29 Jan 2024 05:43:18 UTC
Received: from xmbgsz5.mail.qq.com (xmbgsz5.mail.qq.com [113.108.92.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0112112494;
 Mon, 29 Jan 2024 05:43:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
 t=1706506989; bh=mpL8+nFkezATyzBL5kRrpBwyKRjrAHUwlFGptvLOxxI=;
 h=From:To:Cc:Subject:Date;
 b=G56vzYM4rQzMAlVHt2dWIO6PsK7L0x1onPyfVokFCc911a63Ti0Zdada59rd11i44
 mS/Pi8CR7hjrjkKtpv/zDHtuUUrLBd6jC4x0Wjhw/TOsE+0IulvFp1HOXX1LUer0jY
 qkj9lDo2x/B2j0DQO57yR+qzCrMu9vuVrxYVxSRo=
Received: from localhost.localdomain ([1.87.190.45])
 by newxmesmtplogicsvrszb9-1.qq.com (NewEsmtp) with SMTP
 id 8950DA59; Mon, 29 Jan 2024 12:34:21 +0800
X-QQ-mid: xmsmtpt1706502861trjcgmzsz
Message-ID: <tencent_1A51A82501181FD23618C68685EBC405990A@qq.com>
X-QQ-XMAILINFO: NNgSqAauJRa7zkt6EEdo2mOdEpfT2Fko1dAJfkovmiEl1ZUhWXaUs8BiQbFrCw
 QK+KphZqcLbyYKKM3Cpbi/I1IyWh1bhJF11Cxpt8mUTqBnfGByXXZFi6QZ5aVBZtk/sIWNsrnIlC
 CoD15X5VlEtGF1pWg4ouFYMFYpcJAeuojrLEecJkBY69Z1M61MTe6+v06ncKyHLUXdYO5hETj77v
 VpWcSLV+OS4IsKUxrCm1LihpbA+NvQog1+wNBCR21oHtyQIdeZWG/7znnkjdYyx1P/PyQ5e/SwnY
 6D6h4R5PJRsFt3cdMos+zfuvKWdZ70Gy7XTghE4IWdFfpsyp4WyDqJDnO5VD0K2XLZyFhi/qeciw
 hq7XbzLcfK4ow3fsFJbCu8Qu+lMEpjqKttXNI+KdoH/R2zBbURMDp8CcFLeusxLi8aULxFe7l/Zk
 RazFdbcoYockldHTp4qQ9q+HEcldzTfqFW5ltHRTRhO9akvXKaV9XVCCEz4qQWQVLIeQ/pE2Pu4X
 A0+K0sJnhk1OPr7PZ0XOarGAdmPKR2hVYioF3kvKm00PywTI9yCfNq41Gqms1fnCM8HLMH+p3lsV
 5z9p4jvrf5ts7hz6vq/k0VvQqecFfZlsJT0p/QCwlsdkWHNoxDiJwcEQ1Dm+pReRud01n2m+6tgf
 KWs+UocPH1qkPnVFEaBhpSfLmJ++FG22byQLpraj+YCDp6a2GSSwBoaVHgN7MT7KZjA/SoYr2Z6u
 i1ntwlOhU9+8HA+W1UR8i8CJOVCJ15g4vtyKJbwn2XhGHBA7lwin46/38KppvQKA/F6zMkWkBLrU
 +uCQm3VkoHgHDk1ZkC8sKjqcvlD1Lh4h3RFt/H0c7Qpg/zHTDJ5evPSqmRySMFeyE7AlcbxAtZCR
 dWvi9bXgsM9BaZrggIEBUl9nvHq5IqaecIkQHWmZG8dVrQxHuzN/45EC5iv+4DLMhnnPDZ5DRxi/
 lDl+sQh5/IQVx/W28M8CCdvs6kfJ5Tk29lgX5gOtV9/Hbj3hkok238OX2KzbF5
X-QQ-XMRINFO: MSVp+SPm3vtS1Vd6Y4Mggwc=
From: linke li <lilinke99@qq.com>
To: airlied@gmail.com,
	daniel@ffwll.ch
Subject: [PATCH] drm/i915: use READ_ONCE() to read vma->iomap in concurrent
 environment
Date: Mon, 29 Jan 2024 12:34:10 +0800
X-OQ-MSGID: <20240129043410.60361-1-lilinke99@qq.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-145)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 29 Jan 2024 08:37:49 +0000
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linke li <lilinke99@qq.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In function i915_vma_pin_iomap(), vma->iomap is read using READ_ONCE()
in line 562

562    ptr = READ_ONCE(vma->iomap);

while read directly in line 597

592    if (unlikely(cmpxchg(&vma->iomap, NULL, ptr))) {
593        if (page_unmask_bits(ptr))
594            __i915_gem_object_release_map(vma->obj);
595        else
596            io_mapping_unmap(ptr);
597        ptr = vma->iomap;

There is patch similar to this. https://github.com/torvalds/linux/commit/c1c0ce31b2420d5c173228a2132a492ede03d81f
This patch find two read of same variable while one is protected, another
is not. And READ_ONCE() is added to protect.

Signed-off-by: linke li <lilinke99@qq.com>
---
 drivers/gpu/drm/i915/i915_vma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/i915_vma.c b/drivers/gpu/drm/i915/i915_vma.c
index d09aad34ba37..9fcc11db0505 100644
--- a/drivers/gpu/drm/i915/i915_vma.c
+++ b/drivers/gpu/drm/i915/i915_vma.c
@@ -594,7 +594,7 @@ void __iomem *i915_vma_pin_iomap(struct i915_vma *vma)
 				__i915_gem_object_release_map(vma->obj);
 			else
 				io_mapping_unmap(ptr);
-			ptr = vma->iomap;
+			ptr = READ_ONCE(vma->iomap);
 		}
 	}
 
-- 
2.39.3 (Apple Git-145)

