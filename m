Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3141161EEAB
	for <lists+dri-devel@lfdr.de>; Mon,  7 Nov 2022 10:20:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8343E10E251;
	Mon,  7 Nov 2022 09:20:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 918 seconds by postgrey-1.36 at gabe;
 Mon, 07 Nov 2022 07:51:19 UTC
Received: from mail-m973.mail.163.com (mail-m973.mail.163.com [123.126.97.3])
 by gabe.freedesktop.org (Postfix) with ESMTP id 58AFF10E0CD;
 Mon,  7 Nov 2022 07:51:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=oWlV1
 /PN2hdeIdlOnNLd5vGcmonaDcfm0d75QqcwyFU=; b=NKa+faHeYwcWjVSNlwyB0
 TxTui03HF63KnO91Vd8w9GhnNEChGuluWbEK7CTOLcUnxUHA3dm4i+I6RXDPgwQJ
 1H9h+ZF+upcmlOPEzdQU8aFHz/v4HqjOld+QqEQ5fMJDYYpRMRZIZFT4dK1dHgi+
 pbFEGjPuGWKaOtzC/ZIpNM=
Received: from localhost.localdomain (unknown [111.197.233.249])
 by smtp3 (Coremail) with SMTP id G9xpCgDn+FxEtWhjNUPBrA--.11221S2;
 Mon, 07 Nov 2022 15:35:33 +0800 (CST)
From: SPeak Shen <speakshen@163.com>
To: Xinhui.Pan@amd.com,
	airlied@gmail.com,
	daniel@ffwll.ch
Subject: [PATCH] driver: gpu: add failure check for ftell
Date: Mon,  7 Nov 2022 15:33:23 +0800
Message-Id: <20221107073323.1283046-1-speakshen@163.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: G9xpCgDn+FxEtWhjNUPBrA--.11221S2
X-Coremail-Antispam: 1Uf129KBjvJXoWrKry3Cr18Gr1fWr1DGFyfZwb_yoW8Jr17pF
 4fG3sYvryrXwnrKr1DAFWkZrySya97tFyF9FWxuwn3uw15Jry2kryak340qryDJr47Aw1a
 9r1vgrySvF4xZrJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0ziIPfdUUUUU=
X-Originating-IP: [111.197.233.249]
X-CM-SenderInfo: 5vshtyhvkh0qqrwthudrp/1tbiWQWyPFWBwwL5lQAAsr
X-Mailman-Approved-At: Mon, 07 Nov 2022 09:20:34 +0000
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
Cc: SPeak <speakshen@163.com>, shenyanfeng <shenyanfeng@xiaomi.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: shenyanfeng <shenyanfeng@xiaomi.com>

add return-value check of ftell to improve robustness(and avoid abnormal behavior)

Signed-off-by: SPeak <speakshen@163.com>
Signed-off-by: shenyanfeng <shenyanfeng@xiaomi.com>
---


Receive "Undelivered Mail Returned to Sender", so send again


 drivers/gpu/drm/radeon/mkregtable.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/radeon/mkregtable.c b/drivers/gpu/drm/radeon/mkregtable.c
index 52a7246fe..c31c58e5f 100644
--- a/drivers/gpu/drm/radeon/mkregtable.c
+++ b/drivers/gpu/drm/radeon/mkregtable.c
@@ -193,6 +193,7 @@ static int parser_auth(struct table *t, const char *filename)
 	regmatch_t match[4];
 	char buf[1024];
 	size_t end;
+	long pos;
 	int len;
 	int done = 0;
 	int r;
@@ -228,12 +229,12 @@ static int parser_auth(struct table *t, const char *filename)
 	last_reg = strtol(last_reg_s, NULL, 16);
 
 	do {
-		if (fgets(buf, 1024, file) == NULL) {
+		if ((fgets(buf, 1024, file) == NULL) || (pos = ftell(file)) < 0) {
 			fclose(file);
 			return -1;
 		}
 		len = strlen(buf);
-		if (ftell(file) == end)
+		if (pos == end)
 			done = 1;
 		if (len) {
 			r = regexec(&mask_rex, buf, 4, match, 0);
-- 
2.25.1

