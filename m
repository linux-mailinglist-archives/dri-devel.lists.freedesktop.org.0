Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DC0647A102
	for <lists+dri-devel@lfdr.de>; Sun, 19 Dec 2021 15:38:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AE8C12B4BA;
	Sun, 19 Dec 2021 14:38:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [IPv6:2607:f8b0:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FE0D10E33F
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Dec 2021 01:57:11 +0000 (UTC)
Received: by mail-pl1-x636.google.com with SMTP id z6so3312111plk.6
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Dec 2021 17:57:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FWqKFfL0KnIRZ7fFC42ZHJVI9If0P8ietPAL2PVfcNk=;
 b=iiObPEgrWKUc39gyldEFVpjAyEhD6GkJAxtS2exyvywdMY4A846TPrlUZ8VepXlTX8
 NDOGavwbnTJ2S7RBImH3zv/+PVOjR8zr3Z+BTy/QPnev8Csp6WfrQkKZ2EyjIFZyeoKB
 nxHMfcaCFTrBxMjbY5OYJKSAsVC2mIKAD3zjBjZ20SX7yNG4gP8jlUxs8O4aHkGzJCUP
 rxcC1fPYkyiluPqaHgyCv2KMe2ScC/hxADyr7WAORa42Dbfo+Zo0RT1LdeUMHussiHbJ
 8qGSQjB2ju57tvkUOibqoY/Bgpq5XjSg3UCpYVlTgHiI2BnaPqoHX67at1/8vebAqaok
 PxrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FWqKFfL0KnIRZ7fFC42ZHJVI9If0P8ietPAL2PVfcNk=;
 b=fCtoZJwYsTXdr5aYOoiXBIXk/v1lbsosyFdbqIzxD7EOO8QyB53u+G2qTIy4kuPxl2
 6T4xj1tV2rJQl8ROrLUeqfB/aMfBLP6JfQGCAyOaHZBfU52V1Pi2CzfuWIXqxCojeHQR
 3AadyVAAZlIq+wSOMWSktSjK5zsFdbuXgOh6TNnA6s245taIsZ5zdexZcIzVUDpalClS
 MYSc6NQtQPR/DKVCfSR1HZJCt4Qa5xkh2b6gXCzLedD64fCeiSz6Bk7Pq/2Ix6bvlMBL
 UF07J19rVZ7pkQ5NVOaxFd8/Tjvk5rWKqI7myqGhL3BdU/Fgqq5IzKVJrSG8SlXxHZvn
 VxWg==
X-Gm-Message-State: AOAM533q6B3JD97n8jCfZqdA8jV/Y23/duNhna6Q+6RuWPeKb5gx+CX+
 VwvnpUG8Z75s+As11xMsMw4=
X-Google-Smtp-Source: ABdhPJxp0drx+e0V2hp8dhYxC09S94TpbG+m+EAN7fjKrBkCzuJ20GTwyN6MAdNpAiCrpKPmptN1kA==
X-Received: by 2002:a17:902:bcc4:b0:141:bfc4:ada with SMTP id
 o4-20020a170902bcc400b00141bfc40adamr5847673pls.20.1639792630688; 
 Fri, 17 Dec 2021 17:57:10 -0800 (PST)
Received: from debian11-dev-61.localdomain (192.243.120.180.16clouds.com.
 [192.243.120.180])
 by smtp.gmail.com with ESMTPSA id v63sm9434593pgv.71.2021.12.17.17.57.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Dec 2021 17:57:10 -0800 (PST)
From: davidcomponentone@gmail.com
To: thomas@winischhofer.net
Subject: [PATCH] video: fbdev: use swap() to make code cleaner
Date: Sat, 18 Dec 2021 09:56:59 +0800
Message-Id: <81d101e615dcd8cc661272965a6a3a51d77aa491.1639791676.git.yang.guang5@zte.com.cn>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sun, 19 Dec 2021 14:38:10 +0000
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
Cc: linux-fbdev@vger.kernel.org, Zeal Robot <zealci@zte.com.cn>,
 davidcomponentone@gmail.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Yang Guang <yang.guang5@zte.com.cn>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Yang Guang <yang.guang5@zte.com.cn>

Use the macro 'swap()' defined in 'include/linux/minmax.h' to avoid
opencoding it.

Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: David Yang <davidcomponentone@gmail.com>
Signed-off-by: Yang Guang <yang.guang5@zte.com.cn>
---
 drivers/video/fbdev/sis/sis_main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/video/fbdev/sis/sis_main.c b/drivers/video/fbdev/sis/sis_main.c
index 266a5582f94d..742f62986b80 100644
--- a/drivers/video/fbdev/sis/sis_main.c
+++ b/drivers/video/fbdev/sis/sis_main.c
@@ -213,7 +213,7 @@ static void sisfb_search_mode(char *name, bool quiet)
 		/* This does some fuzzy mode naming detection */
 		if(sscanf(strbuf1, "%u %u %u %u", &xres, &yres, &depth, &rate) == 4) {
 			if((rate <= 32) || (depth > 32)) {
-				j = rate; rate = depth; depth = j;
+				swap(rate, depth);
 			}
 			sprintf(strbuf, "%ux%ux%u", xres, yres, depth);
 			nameptr = strbuf;
-- 
2.30.2

