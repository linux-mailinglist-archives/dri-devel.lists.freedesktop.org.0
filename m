Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D6B2CF6045
	for <lists+dri-devel@lfdr.de>; Tue, 06 Jan 2026 00:41:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D716110E10F;
	Mon,  5 Jan 2026 23:41:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 983 seconds by postgrey-1.36 at gabe;
 Mon, 05 Jan 2026 10:24:20 UTC
Received: from dggsgout12.his.huawei.com (dggsgout12.his.huawei.com
 [45.249.212.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2825910E02F
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Jan 2026 10:24:19 +0000 (UTC)
Received: from mail.maildlp.com (unknown [172.19.163.198])
 by dggsgout12.his.huawei.com (SkyGuard) with ESMTPS id 4dl92X28K3zKHMpy
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Jan 2026 18:07:16 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.128])
 by mail.maildlp.com (Postfix) with ESMTP id 59BD040578
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Jan 2026 18:07:54 +0800 (CST)
Received: from huaweicloud.com (unknown [10.67.174.193])
 by APP4 (Coremail) with SMTP id gCh0CgAHaPh2jVtpmezVCg--.49593S4;
 Mon, 05 Jan 2026 18:07:54 +0800 (CST)
From: Luo Gengkun <luogengkun@huaweicloud.com>
To: b.zolnierkie@samsung.com
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 5.10.y] fbcon: Fix the issue of uninitialized charcount in the
 remaining consoles
Date: Mon,  5 Jan 2026 10:28:34 +0000
Message-Id: <20260105102834.359460-1-luogengkun@huaweicloud.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: gCh0CgAHaPh2jVtpmezVCg--.49593S4
X-Coremail-Antispam: 1UD129KBjvdXoW7XryDGw17Xr4ftw43Aw1DKFg_yoWkZwb_CF
 1UZryrZr4kAr97twnYyrs8Cr1rtasFgryrKasFgryjk347WryYqry2vryrW34UK3WjqrZF
 y3Z0qrs29393KjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUIcSsGvfJTRUUUbo8YFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20E
 Y4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwV
 A0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVWDJVCq3wA2z4x0Y4vE2Ix0cI8IcVCY1x02
 67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I
 0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40E
 x7xfMcIj6xIIjxv20xvE14v26r106r15McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x
 0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Y
 z7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zV
 AF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4l
 IxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCw
 CI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVF
 xhVjvjDU0xZFpf9x07UWHqcUUUUU=
X-CM-SenderInfo: 5oxrwvpqjn3046kxt4xhlfz01xgou0bp/
X-Mailman-Approved-At: Mon, 05 Jan 2026 23:41:55 +0000
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

After commit 0998a6cb2326 ("fbdev: bitblit: bound-check glyph index in
bit_putcs*") was merged, using alt+ctrl+f1 to switch the tty from tty0 to
tty1 results in garbled display.

The reason is the vc->vc_font.charcount is 0, it is clearly an
uninitialized value. The mainline is fine because commit a1ac250a82a5
("fbcon: Avoid using FNTCHARCNT() and hard-coded built-in font charcount")
assigns the fvc->vc_font.charcount to vc->vc_font.charcount.

Cc: stable@vger.kernel.org
Signed-off-by: Luo Gengkun <luogengkun@huaweicloud.com>
---
 drivers/video/fbdev/core/fbcon.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/core/fbcon.c
index 3dd03e02bf97..900c1ccef98b 100644
--- a/drivers/video/fbdev/core/fbcon.c
+++ b/drivers/video/fbdev/core/fbcon.c
@@ -1070,6 +1070,7 @@ static void fbcon_init(struct vc_data *vc, int init)
 						    fvc->vc_font.data);
 			vc->vc_font.width = fvc->vc_font.width;
 			vc->vc_font.height = fvc->vc_font.height;
+			vc->vc_font.charcount = fvc->vc_font.charcount;
 			p->userfont = t->userfont;
 
 			if (p->userfont)
-- 
2.34.1

