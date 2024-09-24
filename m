Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 806A2984954
	for <lists+dri-devel@lfdr.de>; Tue, 24 Sep 2024 18:13:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E605A10E71C;
	Tue, 24 Sep 2024 16:13:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.b="LH/wwFNF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.2])
 by gabe.freedesktop.org (Postfix) with ESMTP id 9D47310E71C
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Sep 2024 16:13:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
 Content-Type; bh=BrH8uwAPz6dm19tTD8qJUI3oNOdqcPltQmXlOJbEMcY=;
 b=LH/wwFNFtFU31UGknMkYN0PYfJIIIGyhE6xwTbQJiAjs0oksSJ5pzsXd3Sgwdr
 zYcuBWGSr73C/EAXKc0NxGHeVxtBQJGD78twN4jvSYkMfxNEX+Q7sgCDfA7auhYL
 PDpDTG6n223mS9RI6d8Vj/aOcZK6xNkTXkr6IvjrWupa8=
Received: from localhost (unknown [60.168.209.67])
 by gzga-smtp-mta-g2-4 (Coremail) with SMTP id _____wA3P38S5fJmrprUDA--.36212S2;
 Wed, 25 Sep 2024 00:13:07 +0800 (CST)
Date: Wed, 25 Sep 2024 00:13:06 +0800
From: Qianqiang Liu <qianqiang.liu@163.com>
To: Helge Deller <deller@gmx.de>
Cc: linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 syzbot+3d613ae53c031502687a@syzkaller.appspotmail.com
Subject: [PATCH v2] fbcon: Fix a NULL pointer dereference issue in fbcon_putcs
Message-ID: <ZvLlEpIMQnJcJsla@thinkpad>
References: <20240916011027.303875-1-qianqiang.liu@163.com>
 <a57734e8-ffb9-4af1-be02-eb0c99507048@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a57734e8-ffb9-4af1-be02-eb0c99507048@gmx.de>
X-CM-TRANSID: _____wA3P38S5fJmrprUDA--.36212S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrtrWkCrWUZr1fAF4kCw4kWFg_yoWDuFg_CF
 95ZF95X34qkF17KrnYyF13Jr90y34xur1S9a4qyFW3Cry3Ar1rXr4DZw1rWryfGFn7ZF97
 J3sF9r40v3yfCjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUexpnPUUUUU==
X-Originating-IP: [60.168.209.67]
X-CM-SenderInfo: xtld01pldqwhxolxqiywtou0bp/1tbiLwdkamby4gU23AAAs-
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

syzbot has found a NULL pointer dereference bug in fbcon.

This issue is caused by ops->putcs being a NULL pointer.
We need to ensure it is initialized properly.

Reported-by: syzbot+3d613ae53c031502687a@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=3d613ae53c031502687a
Tested-by: syzbot+3d613ae53c031502687a@syzkaller.appspotmail.com
Signed-off-by: Qianqiang Liu <qianqiang.liu@163.com>
---
 Changes since v1:
 - Initialize ops->putcs by calling set_blitting_type()
---
 drivers/video/fbdev/core/fbcon.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/core/fbcon.c
index 2e093535884b..d9abae2516d8 100644
--- a/drivers/video/fbdev/core/fbcon.c
+++ b/drivers/video/fbdev/core/fbcon.c
@@ -861,6 +861,8 @@ static int set_con2fb_map(int unit, int newidx, int user)
 			return err;
 
 		fbcon_add_cursor_work(info);
+	} else if (vc) {
+		set_blitting_type(vc, info);
 	}
 
 	con2fb_map[unit] = newidx;
-- 
2.34.1

