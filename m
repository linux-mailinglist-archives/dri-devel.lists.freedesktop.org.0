Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 67D9B55A9E6
	for <lists+dri-devel@lfdr.de>; Sat, 25 Jun 2022 14:25:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECD2010E311;
	Sat, 25 Jun 2022 12:25:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B3C6112066
 for <dri-devel@lists.freedesktop.org>; Sat, 25 Jun 2022 12:25:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1656159904;
 bh=XzWlqKg0tZRmkyyhAvOskP/AntTF8gQ4y3i07JTitN0=;
 h=X-UI-Sender-Class:From:To:Subject:Date:In-Reply-To:References;
 b=Wr7PGcBvGrftl27TdTYgD4sB1GXS4scvf+MKOVNTny3VJP0xPekV3HiEmKec73DOV
 9Lo+3M8ABdGrds+AohjfpeuNyixW+hNhxVmbTa+JS0zgOJ0UNcu6GuIN43EW7GLjBV
 4ADJOk0ByrfAaPNFZyxqVCx6IfT5BAv3htk7G4Qc=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from p100.fritz.box ([92.116.162.44]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MnakR-1nM4za3cCz-00ja5s; Sat, 25
 Jun 2022 14:25:03 +0200
From: Helge Deller <deller@gmx.de>
To: linux-fbdev@vger.kernel.org, daniel.vetter@ffwll.ch,
 dri-devel@lists.freedesktop.org, deller@gmx.de
Subject: [PATCH v2 4/4] fbmem: Catch possible driver bugs regarding too small
 virtual screen size
Date: Sat, 25 Jun 2022 14:25:02 +0200
Message-Id: <20220625122502.68095-5-deller@gmx.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220625122502.68095-1-deller@gmx.de>
References: <20220625122502.68095-1-deller@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:W8cNngBMUBHHJUV7dXjFa42WjdXUhH2wea0EeF11rpP1tPAtcrj
 Vy4tmjTNURbq+eTLhYSJ3RbTSUqWcUOiJh6tMT8hIxIdAt+3g0UBYjPfsRHg+/1Jfvt6uSz
 tkKkaHPi3xNpb4hamxPTSKlGbLRmYfthkj0i72290nt7jfNHaTATIMH4bWHxHhjVPpEvCEP
 AKwv6u3Wv3lMQkKJHJsMA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:j0Cb/1I6yu4=:kKTYRcbYUs3HdoMx5WWEa9
 PWTco1Zyie4e+8SCPHs7CfcbBKjiYeXfSiyuRZwqzSUXYBPKn+P4XMedgrbVbzx5sifvqZ4qT
 zs0guonrV/KGovkhFUlEP+ztrTYlqQODHsLqHImFx/151dDjauIpWizL471bVqUeLW/SnlZh6
 RuFIatAIRoMkKxGEoKICfNV/EUL0P8MEQ7TNDQ1G+dojcBmxUSbWSQFUz+cx0u4ia2DPQRiiW
 02I+/vZZCqmMUkb9i1ueAIY9LjARrAdSwTdyb4W6M8uCtg4CaIQfjtcXV8lx39lez1I2lYq08
 C+KEnB+yk9tUVJ/FSn1ajoVXeJnXswos/BY+mjBdE3CBiZmPjb75NLbYWSu/0XeTiAz2tv8vS
 xm6l28aj0WyDSIhMcb+d6n6pWCq73CwATDnpq+FUS+X+8IJLSuRxSK5skIB3Dz3bIzRT7Q0sA
 /nlsd7a0XHhFOYglzzQ8fO7aRHftjDojl8HOKNFpyd99YGibUdYbogYkGejd7P/6PHaglxyCd
 g6N4AARSvp6lDOdH8nZTf1vkmhjU6SDeq2E2g+Mq4oNH02GzeBGyXXg1TbVZG1cNds54xoTtg
 J9P5HAOgSi5HQbP86inBoEfhHWhAP38R9uKHcroXAc63W1EdM8cPn7dN04WWyfR+P6yfE2yPX
 0qdDK1FS+KcLlVeznK0LkpnzFltXUSz6E8tsMnLTQcbUCIXM3XX1vmE2q5mti26kn6u4oyL/n
 5OaB4zD97mr7GuzJoWQAKSac/7cn6NFxaxAxMd0QMs+YyQxI8nNd1LwZD5bV7zYLjzbEFPrRe
 YHFffqT+1AxFrNWYeRXPpVO0lH8W/NTTUSdJPye5nUpyQY245VXYCmT7HIH07U7STPeJS6NJf
 dE4LdiB74KhARZVo9Nv1LIC7P8/MNV0QcZcNIFfEVzM7QNKpu/A5/xsJbURiWfjZqRY7Fl/1G
 h2+wn+frd5qJIaDnJDC/yGTljlPtPfKWT+LYqqyrNMsu6k8lIaF2EAFtn7Xt6yJ+ITK4TSd8Q
 8V7RzQzK2is6145W5N7eA7Opk0Tab0mVS83NXmLep6rrHxHYqs99X4SdRURfnqUbfzSfpcM6S
 F5MV6LrRZH1GiVa9O/njI+G76d03bIV+fwNLv4ha9TZTusRXjlP2TwmCQ==
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

Make sure that we catch, report and fix up fbdev and drm graphic drivers w=
hich
got the virtual screen resolution smaller than the physical screen resolut=
ion.

Signed-off-by: Helge Deller <deller@gmx.de>
Cc: stable@vger.kernel.org # v5.4+
=2D--
 drivers/video/fbdev/core/fbmem.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/video/fbdev/core/fbmem.c b/drivers/video/fbdev/core/f=
bmem.c
index 50fb66b954d6..6d262e341023 100644
=2D-- a/drivers/video/fbdev/core/fbmem.c
+++ b/drivers/video/fbdev/core/fbmem.c
@@ -1006,6 +1006,12 @@ fb_set_var(struct fb_info *info, struct fb_var_scre=
eninfo *var)
 	if (var->xres < 8 || var->yres < 8)
 		return -EINVAL;

+	/* make sure virtual resolution >=3D physical resolution */
+	if (WARN_ON(var->xres_virtual < var->xres))
+		var->xres_virtual =3D var->xres;
+	if (WARN_ON(var->yres_virtual < var->yres))
+		var->yres_virtual =3D var->yres;
+
 	/* Too huge resolution causes multiplication overflow. */
 	if (check_mul_overflow(var->xres, var->yres, &unused) ||
 	    check_mul_overflow(var->xres_virtual, var->yres_virtual, &unused))
=2D-
2.35.3

