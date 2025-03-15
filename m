Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 94854A62C0F
	for <lists+dri-devel@lfdr.de>; Sat, 15 Mar 2025 12:49:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BF5A10E39B;
	Sat, 15 Mar 2025 11:49:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 463 seconds by postgrey-1.36 at gabe;
 Sat, 15 Mar 2025 04:48:10 UTC
Received: from mxhk.zte.com.cn (mxhk.zte.com.cn [63.216.63.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B89110E03F
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Mar 2025 04:48:10 +0000 (UTC)
Received: from mse-fl1.zte.com.cn (unknown [10.5.228.132])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mxhk.zte.com.cn (FangMail) with ESMTPS id 4ZF7yn5sVnz8R03d;
 Sat, 15 Mar 2025 12:48:01 +0800 (CST)
Received: from xaxapp05.zte.com.cn ([10.99.98.109])
 by mse-fl1.zte.com.cn with SMTP id 52F4lul3079032;
 Sat, 15 Mar 2025 12:47:56 +0800 (+08)
 (envelope-from feng.wei8@zte.com.cn)
Received: from mapi (xaxapp05[null]) by mapi (Zmail) with MAPI id mid32;
 Sat, 15 Mar 2025 12:47:56 +0800 (CST)
Date: Sat, 15 Mar 2025 12:47:56 +0800 (CST)
X-Zmail-TransId: 2afc67d5067c64c-14494
X-Mailer: Zmail v1.0
Message-ID: <20250315124756851v6UQVu4NRD-RV62eoG0va@zte.com.cn>
Mime-Version: 1.0
From: <feng.wei8@zte.com.cn>
To: <mripard@kernel.org>
Cc: <maarten.lankhorst@linux.intel.com>, <tzimmermann@suse.de>,
 <airlied@gmail.com>, <simona@ffwll.ch>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: =?UTF-8?B?W1BBVENIXSBkcm06IFJlcGxhY2UgbmVzdGVkIG1heCgpIHdpdGggc2luZ2xlIG1heDMoKQ==?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL: mse-fl1.zte.com.cn 52F4lul3079032
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 67D50681.000/4ZF7yn5sVnz8R03d
X-Mailman-Approved-At: Sat, 15 Mar 2025 11:49:28 +0000
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

From: FengWei <feng.wei8@zte.com.cn>

Use max3() macro instead of nesting max() to simplify the return
statement.

Signed-off-by: FengWei <feng.wei8@zte.com.cn>
---
 drivers/gpu/drm/drm_ioctl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_ioctl.c b/drivers/gpu/drm/drm_ioctl.c
index f593dc569d31..115a8eb0d8a5 100644
--- a/drivers/gpu/drm/drm_ioctl.c
+++ b/drivers/gpu/drm/drm_ioctl.c
@@ -856,7 +856,7 @@ long drm_ioctl(struct file *filp,
 		in_size = 0;
 	if ((cmd & ioctl->cmd & IOC_OUT) == 0)
 		out_size = 0;
-	ksize = max(max(in_size, out_size), drv_size);
+	ksize = max3(in_size, out_size, drv_size);

 	drm_dbg_core(dev, "comm=\"%s\" pid=%d, dev=0x%lx, auth=%d, %s\n",
 		     current->comm, task_pid_nr(current),
-- 
2.25.1
