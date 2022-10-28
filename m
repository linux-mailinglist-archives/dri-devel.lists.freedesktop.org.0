Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D4073611967
	for <lists+dri-devel@lfdr.de>; Fri, 28 Oct 2022 19:39:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF4C210E88A;
	Fri, 28 Oct 2022 17:39:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1543 seconds by postgrey-1.36 at gabe;
 Fri, 28 Oct 2022 13:56:04 UTC
Received: from msg-2.mailo.com (msg-2.mailo.com [213.182.54.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76C1610E83D
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Oct 2022 13:56:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailo.com; s=mailo;
 t=1666963811; bh=yl2gtCFcrA+y8ipJCReQCBstnVYp6kw9Oo6TOGLDu48=;
 h=X-EA-Auth:Date:From:To:Subject:Message-ID:MIME-Version:
 Content-Type;
 b=naGIr9mbGwyhwpjYrv2t87fqffgj1mwZ+5/C4r80b/7MimJ/diBBIj6EkUnpiJmEJ
 SqFheASo9qXA6Udz4amUxh6XyhqOT0H4SoiBLAbW+ORLUkVGTuQqpHpcnLaVc1hHx8
 6huRGOoIvDEfZVfgB1N24jlGlvzir8u96F1Kjaf0=
Received: by b-6.in.mailobj.net [192.168.90.16] with ESMTP via [213.182.55.206]
 Fri, 28 Oct 2022 15:30:11 +0200 (CEST)
X-EA-Auth: DIZOiORP0IjVZ8/XwaxKMK586tsbAVcXFYeycjJhdSHO7JpUY2oJpHSxW2jTyOzoxV7UlsyKto2JDACDDTO8hWRBMP/V0mK3
Date: Fri, 28 Oct 2022 19:00:05 +0530
From: Deepak R Varma <drv@mailo.com>
To: outreachy@lists.linux.dev, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH] staging: fbtft: Use ARRAY_SIZE() to get argument count
Message-ID: <Y1vZXUi0Bjiub8HZ@ubunlion>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailman-Approved-At: Fri, 28 Oct 2022 17:39:13 +0000
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

The ARRAY_SIZE(foo) macro should be preferred over sizeof operator
based computation such as sizeof(foo)/sizeof(foo[0]) for finding
number of elements in an array. Issue identified using coccicheck.

Signed-off-by: Deepak R Varma <drv@mailo.com>
---
 drivers/staging/fbtft/fbtft.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/fbtft/fbtft.h b/drivers/staging/fbtft/fbtft.h
index 2c2b5f1c1df3..5506a473be91 100644
--- a/drivers/staging/fbtft/fbtft.h
+++ b/drivers/staging/fbtft/fbtft.h
@@ -231,7 +231,7 @@ struct fbtft_par {
 	bool polarity;
 };

-#define NUMARGS(...)  (sizeof((int[]){__VA_ARGS__}) / sizeof(int))
+#define NUMARGS(...)  ARRAY_SIZE(((int[]){ __VA_ARGS__ }))

 #define write_reg(par, ...)                                            \
 	((par)->fbtftops.write_register(par, NUMARGS(__VA_ARGS__), __VA_ARGS__))
--
2.34.1



