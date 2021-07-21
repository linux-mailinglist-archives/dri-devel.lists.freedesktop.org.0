Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B0D923D0C62
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jul 2021 12:26:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63AEF6E8CD;
	Wed, 21 Jul 2021 10:26:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-relay-canonical-1.canonical.com
 (smtp-relay-canonical-1.canonical.com [185.125.188.121])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB4106E8CD
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jul 2021 10:26:09 +0000 (UTC)
Received: from localhost (1.general.cking.uk.vpn [10.172.193.212])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPSA id 69AD13F227; 
 Wed, 21 Jul 2021 10:26:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1626863168;
 bh=zZPrblOdlGr4apLUsC5WZiWZpIfxrwea/Xu2+T9Z6Cg=;
 h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type;
 b=AAwxA67lC0LtBTzqHe8QGxeEHc1zvXp5tbpA5diArC9pNsw7yid5qZnnZhp24YQpl
 4gaSve7Oanm03ahuGnDFnIZ78UETA/XPQZ49G1f9bzbMyweW9ART0K++1E7tla0eBW
 oeP1lq74eQVv1U+M6Cbtiq3HsJhsDBNuvj6Kp+0y8n7LHo/Ugi76GzM+2IFCtg2lKs
 PsMijxnD1IpWU9+fhEGs6LL62QNUhbhTLtmBbcZs+yT57dHPG95hY9xSQlCqO1R/sJ
 JyQUIC4TOfYkyfTIBTd0RJUWAZFh0Ra7vF+6DcWvw1sNv9w9jNwkiJVMiLyBpdk/uz
 LSO7ofi0g3dkg==
From: Colin King <colin.king@canonical.com>
To: dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org
Subject: [PATCH] video: fbdev: arcfb: remove redundant initialization of
 variable err
Date: Wed, 21 Jul 2021 11:26:08 +0100
Message-Id: <20210721102608.42694-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Colin Ian King <colin.king@canonical.com>

The variable err is being initialized with a value that is never
read, the assignment is redundant and can be removed.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/video/fbdev/arcfb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/video/fbdev/arcfb.c b/drivers/video/fbdev/arcfb.c
index 1447324ed0b6..45e64016db32 100644
--- a/drivers/video/fbdev/arcfb.c
+++ b/drivers/video/fbdev/arcfb.c
@@ -446,7 +446,7 @@ static ssize_t arcfb_write(struct fb_info *info, const char __user *buf,
 	/* modded from epson 1355 */
 
 	unsigned long p;
-	int err=-EINVAL;
+	int err;
 	unsigned int fbmemlength,x,y,w,h, bitppos, startpos, endpos, bitcount;
 	struct arcfb_par *par;
 	unsigned int xres;
-- 
2.31.1

