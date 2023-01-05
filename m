Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EAF965E80C
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jan 2023 10:40:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15C7C10E6D0;
	Thu,  5 Jan 2023 09:40:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw.kylinos.cn (unknown [124.126.103.232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7224E10E6D0
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Jan 2023 09:40:40 +0000 (UTC)
X-UUID: 947685667712421c9d4cfc3f7c906f29-20230105
X-CPASD-INFO: 94df836ab5fe4ed7a27774bb7dd53dca@goSehmVlZJGOVaixg6ivcYFjZ2dnYIK
 xeZ6EZWGUj4GVhH5xTV5nX1V9gnNXZF5dXFV3dnBQYmBhXVJ3i3-XblBgXoZgUZB3iHaehmhhZg==
X-CLOUD-ID: 94df836ab5fe4ed7a27774bb7dd53dca
X-CPASD-SUMMARY: SIP:-1, APTIP:-2.0, KEY:0.0, FROMBLOCK:1, OB:0.0, URL:-5,
 TVAL:173.
 0, ESV:0.0, ECOM:-5.0, ML:0.0, FD:0.0, CUTS:73.0, IP:-2.0, MAL:-5.0, PHF:-5.0,
 PHC:-5.
 0, SPF:4.0, EDMS:-5, IPLABEL:4480.0, FROMTO:0, AD:0, FFOB:0.0, CFOB:0.0, SPC:0,
 SIG:-5
 , AUF:6, DUF:11701, ACD:193, DCD:193, SL:0, EISP:0, AG:0, CFC:0.373, CFSR:0.127,
 UAT:0, 
 RAF:0, IMG:-5.0, DFA:0, DTA:0, IBL:-2.0, ADI:-5, SBL:0, REDM:0, REIP:0, ESB:0,
 ATTNUM:0 ,EAF:0,CID:-5.0,VERSION:2.3.17
X-CPASD-ID: 947685667712421c9d4cfc3f7c906f29-20230105
X-CPASD-BLOCK: 1000
X-CPASD-STAGE: 1
X-UUID: 947685667712421c9d4cfc3f7c906f29-20230105
X-User: xurui@kylinos.cn
Received: from localhost.localdomain [(116.128.244.169)] by mailgw
 (envelope-from <xurui@kylinos.cn>) (Generic MTA)
 with ESMTP id 1746260541; Thu, 05 Jan 2023 17:40:38 +0800
From: xurui <xurui@kylinos.cn>
To: deller@gmx.de
Subject: [PATCH] fbdev/g364fb: Fix a compilation issue
Date: Thu,  5 Jan 2023 17:40:39 +0800
Message-Id: <20230105094039.1474255-1-xurui@kylinos.cn>
X-Mailer: git-send-email 2.25.1
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
Cc: xurui <xurui@kylinos.cn>, linux-fbdev@vger.kernel.org, trivial@kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

drivers/video/fbdev/g364fb.c:202:4: error: cast to pointer from integer of different size [-Werror=int-to-pointer-cast]

Signed-off-by: xurui <xurui@kylinos.cn>
---
 drivers/video/fbdev/g364fb.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/video/fbdev/g364fb.c b/drivers/video/fbdev/g364fb.c
index 05837a3b985c..beef4bcec3c5 100644
--- a/drivers/video/fbdev/g364fb.c
+++ b/drivers/video/fbdev/g364fb.c
@@ -175,7 +175,8 @@ int __init g364fb_init(void)
 {
 	volatile unsigned int *curs_pal_ptr =
 	    (volatile unsigned int *) CURS_PAL_REG;
-	int mem, i;
+	int mem;
+	uintptr_t i;
 
 	if (fb_get_options("g364fb", NULL))
 		return -ENODEV;
-- 
2.25.1

