Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0856E55B12B
	for <lists+dri-devel@lfdr.de>; Sun, 26 Jun 2022 12:29:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 247B311B17D;
	Sun, 26 Jun 2022 10:29:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7255E12A067
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Jun 2022 10:28:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1656239334;
 bh=tRqvkgP3s46IORRaOk1LZP5YQEeJ21rrrTXuUbKXSvE=;
 h=X-UI-Sender-Class:From:To:Subject:Date:In-Reply-To:References;
 b=Ra4rSnpZuBPKt0T+7+ep/XhqMxDoRbM4V/Fg2Hk9Hb+pCwm8P1wuKLop5B+hs5M8N
 sqYgms3IQreRxyTEcwFugI3pi5D/woXoxW0S37/fv6KmTW2k+14l933+3XQEZG+0kV
 txVMvo2EnD+7iOCuJiox9D9I6cH8WBuUiFbAxA5Q=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from p100.fritz.box ([92.116.135.166]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N7i8Y-1nbJnY1P2Q-014iK5; Sun, 26
 Jun 2022 12:28:54 +0200
From: Helge Deller <deller@gmx.de>
To: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 daniel.vetter@ffwll.ch
Subject: [PATCH v6 1/4] fbcon: Disallow setting font bigger than screen size
Date: Sun, 26 Jun 2022 12:28:50 +0200
Message-Id: <20220626102853.124108-2-deller@gmx.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220626102853.124108-1-deller@gmx.de>
References: <20220626102853.124108-1-deller@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:YXfT7zBTXoZauOHSIJJTtz7WrDgEiNujTauyUxlFXnplbel6KY9
 qYSqgWRSCpaiSZYIKE0Srf7hWVaUmMcKPPzmZgWL6UAR9v08TBXUVvrlSbVjYUuRx4kMORx
 K1oNsa8HaAwRuSmnyTnK1ozRnDlioAFxB+benIFiFaDtrjQMGevrBoWbN4bpC3I4gySLlSC
 IieF65HOrcXL/9fD8ewzg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:Fx/Iaz5Kofw=:K+AO7X+mA3SPcSwVthCBkV
 bx4etJAUsgLfxTe4eiO6ST5BA/DXYwyKoCSY2GfLpcPfhIvkZpBCt9pduPWLlTiND/yC/O2gp
 FzzFAjBuX/rUggohoWiq+LlmngSbg6k30HpaocrItsj+V0C2ZQX7huB+LkQwpld9mKNITrn1V
 l13yyTPLoib02OOOVvR5LfeanFP3svyQ7w3skAOBlckW28YcIgNBeKdOmD0QWQH4mtcLzx+3r
 m6Zb1AtG6fVMAbYGPRV+ktPEUnAnZBymLUSpBaYU+2k0y9v0hZ9OAD55KlzYRPuEhbRkV83ni
 fbVYb1c4dKNdIcE9stOg+QRNwRdeq9uag2JJc1+gS5I68ykYylOdyaos2ytVUqKPMQ+hMcPg5
 6itZMi8iCK4H0MKc0Q6UWU2Br6rgjkGj7n2VlYiaZc5bTiwndKIWD1WlvaFSqyHmTJPtBdiUV
 FYsl73+FRVVgHWgW5MsVlaZtRXhDMycL7Idlak4x0GdZ7w4fyqPMYbeumKL78eRSFga8HeXHv
 Wf/xCluhU5KNSaMaexj1fjbJMCpBcRkM6jdpiDFJ5z4F7my/jBRF9IKQ20rF0D2AjbbKyG70n
 W5yfnV3fE9dyI0XPmW/b8hUS5x4mphHcUdkjYoICCHe/J0Jk/Ytv6ffetFwt6vNkkgtA2ED97
 pMvstDWNMpWy2V/halSMhUatgEPA5GaMIKfJsYJf6HSTtY08mqfPPavfeWMswf4Sk/52MAg1N
 1p6qsXNxzqWj+egeawklnA6vv9GplGEpkp2+EpmZV0QH9nv+6dT/AbS0ygqgjQUpWlTOuJTAr
 vO30CtvgwJsId5lWJzP8Uym/Toc7A0O9nNlVPdxu39xVDAxPrTV8RoWuEVRtk1DZxyekQlA1Q
 pjHRhIW+O9SOaqeG3tjyTko4y1UWlBdaheZoXB01sUj0lNxmDmADnLQzOGfm5rxFvTtQF1R4d
 fNxozEMFx99Z1X+w0TBOsuEvLJIt6LtOAB+ssM2tW7Y9HUiPbUL1mlq5O073GuDYjKTzOH1im
 MhXeeyLLu0OYsvl65gWe95lL/LPL9ZgA/FXZo5l9ewNHM28ERiY/S4NXEu8BigTtLNj6B0O8T
 stvhqMYzLKp1AHtSJT0V3BJMjDmt+ZUD/oIrdLS4azuvfMX2eiQqgCt8A==
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

Prevent that users set a font size which is bigger than the physical scree=
n.
It's unlikely this may happen (because screens are usually much larger tha=
n the
fonts and each font char is limited to 32x32 pixels), but it may happen on
smaller screens/LCD displays.

Signed-off-by: Helge Deller <deller@gmx.de>
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: stable@vger.kernel.org # v4.14+
=2D--
 drivers/video/fbdev/core/fbcon.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/core/f=
bcon.c
index c4e91715ef00..e162d5e753e5 100644
=2D-- a/drivers/video/fbdev/core/fbcon.c
+++ b/drivers/video/fbdev/core/fbcon.c
@@ -2469,6 +2469,11 @@ static int fbcon_set_font(struct vc_data *vc, struc=
t console_font *font,
 	if (charcount !=3D 256 && charcount !=3D 512)
 		return -EINVAL;

+	/* font bigger than screen resolution ? */
+	if (font->width  > FBCON_SWAP(info->var.rotate, info->var.xres, info->va=
r.yres) ||
+	    font->height > FBCON_SWAP(info->var.rotate, info->var.yres, info->va=
r.xres))
+		return -EINVAL;
+
 	/* Make sure drawing engine can handle the font */
 	if (!(info->pixmap.blit_x & (1 << (font->width - 1))) ||
 	    !(info->pixmap.blit_y & (1 << (font->height - 1))))
=2D-
2.35.3

