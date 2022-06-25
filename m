Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C60755ACD0
	for <lists+dri-devel@lfdr.de>; Sun, 26 Jun 2022 00:06:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D62810E4B0;
	Sat, 25 Jun 2022 22:06:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CB4D10E52F
 for <dri-devel@lists.freedesktop.org>; Sat, 25 Jun 2022 22:06:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1656194792;
 bh=tRqvkgP3s46IORRaOk1LZP5YQEeJ21rrrTXuUbKXSvE=;
 h=X-UI-Sender-Class:From:To:Subject:Date:In-Reply-To:References;
 b=gVrFVJYj453sz98YflohNPOOQQZbth+K4YFhG9lefmk3XNgvdwmbNO/qJOp/qshBy
 kKrZkP+3H/DHYdhbbt3W5Aq3QGYdGYjO8kHn9HCVPHInPZL5BUwZgtHbe7OVImVsP3
 LwCHAYn2QW5Y8wrvSY472rwPWkRUmSJ5HPL0Oa6c=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from p100.fritz.box ([92.116.162.44]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MrhUK-1nHdUB3Cdg-00nhHD; Sun, 26
 Jun 2022 00:06:31 +0200
From: Helge Deller <deller@gmx.de>
To: dri-devel@lists.freedesktop.org, daniel.vetter@ffwll.ch,
 linux-fbdev@vger.kernel.org
Subject: [PATCH v3 1/4] fbcon: Disallow setting font bigger than screen size
Date: Sun, 26 Jun 2022 00:06:27 +0200
Message-Id: <20220625220630.333705-2-deller@gmx.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220625220630.333705-1-deller@gmx.de>
References: <20220625220630.333705-1-deller@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:FGIQ5xSaIVRGo4hp8yfX3n+NH29eA3bhr7z5zE4g+f3T5zRqYbJ
 zfitv+gynLV+29UqzuD1omCeWLTjBxw3URRCUruG5beTTpJwXPSVyPGU9rl9k3f2v72L3YI
 ryOvAP3NCpjrN2RbMJt1xe+4aqFrnRycUYXdJ1KpiKh4qTzCO0WNokFjJKttABzePmx0kau
 cYv3wRkBoZHFh0ifKVO5g==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:w5twWS2oZ94=:TVJNx05VlhXQr756TbEvcH
 pouTt5mAlmU6YoVEz8v+dt1aKBllFcVDxvL2FoCtP4AgZlSn+SBDAKdmm90iKmZC7YwxWJav/
 ga0hpPkd4loszDLRNTpUV1Q44Sr2Oe6Nn6LVs5E8qgLqIojTL/a1ZwA/kuJtUsypavAZgDFSH
 Hb6uo+Oj+chyHpfFJsyfTwoJ9K8ILT01UDcYxgtn1HYpfIIu2lA2qzyJkxBklplLlTc5O9li2
 +uj6OELsF4RsoefT5FA4tUGuohvzEghHNTm8Eq7TldqacUUYTZDNg000EvPj7Khihi9QQ/UsR
 3qhqqWRYxtp8whXauCQxsN6uUIghz+Ay5V9vlaXFJI+vbQ0s8q3Ht77kIWqamkr58e3RA5qVQ
 xTdEEiyFF5yqGvjREyJH4BLdDVkZw29TlNlMzmkHQk8P9E3DhLmAtIU38NM78V4bMagB2DU0y
 oEELu9hg8IopMVF/s9MPWnUJImwfCbHfvBUqsNvc4Q0Zta7xtvIlKIxKmZpPZTmD+NhMCDbRa
 7MOnV0RQT642bmCJziLpWnEIbG2UDrkghWKQ/MhM18PJYriT7Q416Mi05khoi8WGoJe1XyfmQ
 zYK+aVAJDUuhDbaBU0kjy7/4FBoJEHgw6aT5/9VI/BiX0nSRxyEVMo87IgasA56agYJps+JXb
 yqXZVm6KAz0iOBjdYfqLHb+PGIuXcA8IKMaZ8YxLsN62FWr4QA29LfY9Nh9fcVJKySsDz5iw4
 bTJ/8meRbQmO/FBmDYCcwhgxLEmoML8mmuekDSFiqki++zYxvDC/XUOld6A7A5aF4jjWATPoi
 OsrxpdFOOdwhugxigOE8rki1lZr1l7mBtZhQ+lufAApndehjsMgrHVv97vLyqjs9FCKmOo6YI
 W2wk+BMRagJM3BHLtUWcDs42Q3X5joVm1KQB/tO4zrSJdujk1DuJf0Gv0cq6qsTtbOF/m5Z67
 bX7o8O2pgAfPcMNRU6r1l3We/nIgQ6YkRK6v8vc+UTaQhrY0GaFJjprfpLke7uqn4mIJ+JCPq
 JErl0QabZmvWlApkRbWBU2vkvc79uq8snDb1GUULgToAh1m8jJ/K/MauJLFCwNT+q7W+F08hc
 f0Cep3ceI5X6zfcHS6z3YDia0IrsruF4SFxQgpBcXA4CaSHwQfKCDkyyQ==
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

