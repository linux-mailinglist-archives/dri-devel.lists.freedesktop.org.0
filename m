Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 928A7563AE4
	for <lists+dri-devel@lfdr.de>; Fri,  1 Jul 2022 22:24:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1306D18B2F4;
	Fri,  1 Jul 2022 20:24:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C254F18B2F3
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Jul 2022 20:23:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1656707034;
 bh=dEefPiI9Wq3+N76bPKdFvUHz0EeUTEIRh3WCR7KXkgA=;
 h=X-UI-Sender-Class:From:To:Subject:Date:In-Reply-To:References;
 b=HEFt5iZDmNZf66zk+qkPjL3tW/l2Fg/mj39IwVLc9Udj7wk4mo3GOy8hvIzKNSMjZ
 1gIakjLvxkq8vz/kDjPdv/khMXrT2wdDiBLpUteax/9On9UcojFbz6WKfb3RJBtpFX
 zKPl6vMnyG8dRvOH6jql54+NqKx8HkZPl5XNYvoU=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from p100.fritz.box ([92.116.182.192]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MsHnm-1nn6Ad44zK-00ticg; Fri, 01
 Jul 2022 22:23:54 +0200
From: Helge Deller <deller@gmx.de>
To: geert@linux-m68k.org, dri-devel@lists.freedesktop.org,
 daniel.vetter@ffwll.ch, linux-fbdev@vger.kernel.org
Subject: [PATCH v2 3/4] fbmem: Prevent invalid virtual screen sizes in
 fb_set_var()
Date: Fri,  1 Jul 2022 22:23:51 +0200
Message-Id: <20220701202352.559808-4-deller@gmx.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220701202352.559808-1-deller@gmx.de>
References: <20220701202352.559808-1-deller@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Bf8VXfaa577fpq4acsmdWzYRjRzn9t3d4jS+k3688Br3xPNGmzP
 p53HnFCs0503W6wMD/41hpxfgpasIAVFfi+0BsK0Vaca5CnYMrAq92Vt4Tv+y1NmmzQs91o
 sVc5gGs3GeWTC2v0TTBIXaXv/f8fpwtPuDlMwKHBivevR9eRdM3KlUOT4Ma599iz18mKGA0
 zulyQJ8I7gZN6XhQyLMUw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:Vw9SFYftwds=:rr4MBShpbjEyzFIUlufOTC
 c/MzOQWgDKdqqI6ErlQQSs7fvS6fRhtrRcuAtfnXFGwMl3llbzURBcbqajh2yuL4CnGqOY/im
 qxSAxrVThZlQNTnuErbRtOS5D1Ib4TobV9FaN8k2wSqNskvY/JdatfT9PwqyaCQbZ4JQ4y8u8
 KNiSxIpYQ0qvVGYzwUG2PtUGoHYc9PAa7tBFoScRv9AuLwykZ2SUwCALRysMGJHo8RAMbojOw
 HCL6o+uJQd+sHpSCC9SnXktaDTJPklX8cJE67vWppHC40YA84O4GDdrcJUEhmxyTeGsmGJhbk
 9OAd2RlR3kvKZSu7mPe+QPIoFj/v8MS2XaohZ+hQiR+GS7MhauN7cCcFRd+pM0baSQnnstYSC
 TRqfUD/QZ0xh8exiFubK/APbIr7nxJRxfPQxlI5NQctBPP/YJZlQuIeUN4Cozr2+0lnxs4Dsa
 oP1RdkF5V5RVEP1wpg56ZIpoJvA/LoiV5+HQ7Htn2r+0biNhPWEEyJ/hbhmhZTQcU3GhVPsJL
 jR+5Iujjv2NYaR17ipV61J7X+4yJPOUVvANCSvtbkcE+MRW/wqlUfYcWkxdBykhumrzqeqbQf
 YIt+mJS/8l5f6jZ+LzOuZ2gRoLQm2yfqyaFXQN0quCzF2l+OQErY7ZKU6HbfbIHey8vNqG1AX
 75EpJwWfycUEiHmRrP9mkETt/kPVECtqnJJjNn32GXg4TRN6fAAfMRAOxJavcluEUuyal7EJz
 CJbnLMsB1UiwBif7hdyZ4+ttwl+EWWS59Uq0JFduXObZ0VAMthoMccSdRlYiT/vL6bTZjSNHy
 TEW34N4LBqpeXkMDScqnsQarwjqDFV60vsxC1FNemFWYS4FYHziLU4er5jAt+eyu6/zzbMlNG
 w8/ukmPmX4bUizk4xvTy7j60pICkSFog6EK5AYmaS51zyWZCU8ccJT6v4txKvxkLhx2z3A2s+
 MYpXwZrMRyh+0uZWAbTHWv+wwT8dCmsclOjVRO6Y5aQlT7s14YkMvHsItJGuITDMtdKNvrF8o
 OMrCmoMZ6LK0Wh4HJUj6EB0qnDehIoyzoJJF4BNJEn64pDQP/A/73hTjkQmTRNcltxtbhPkIU
 1M0pF0YtNlgIBkko68snz3nUE5vQLlK1s6jcdZZCFGh99qG760rPGZy/Q==
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

Prevent that drivers configure a virtual screen resolution smaller than
the physical screen resolution.  This is important, because otherwise we
may access memory outside of the graphics memory area.

Give a kernel WARNing and show the driver name to help locating the buggy
driver.

Signed-off-by: Helge Deller <deller@gmx.de>
Cc: stable@vger.kernel.org # v5.4+
=2D--
 drivers/video/fbdev/core/fbmem.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/video/fbdev/core/fbmem.c b/drivers/video/fbdev/core/f=
bmem.c
index 160389365a36..e8f06d26803c 100644
=2D-- a/drivers/video/fbdev/core/fbmem.c
+++ b/drivers/video/fbdev/core/fbmem.c
@@ -1016,6 +1016,18 @@ fb_set_var(struct fb_info *info, struct fb_var_scre=
eninfo *var)
 	if (ret)
 		return ret;

+	/* make sure virtual resolution >=3D physical resolution */
+	if (WARN_ON(var->xres_virtual < var->xres)) {
+		pr_warn("fbcon: Fix up invalid xres %d for %s\n",
+			var->xres_virtual, info->fix.id);
+		var->xres_virtual =3D var->xres;
+	}
+	if (WARN_ON(var->yres_virtual < var->yres)) {
+		pr_warn("fbcon: Fix up invalid yres %d for %s\n",
+			var->yres_virtual, info->fix.id);
+		var->yres_virtual =3D var->yres;
+	}
+
 	if ((var->activate & FB_ACTIVATE_MASK) !=3D FB_ACTIVATE_NOW)
 		return 0;

=2D-
2.35.3

