Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4720955B071
	for <lists+dri-devel@lfdr.de>; Sun, 26 Jun 2022 10:56:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7E0714ADA1;
	Sun, 26 Jun 2022 08:56:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4BF514ADA9
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Jun 2022 08:56:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1656233776;
 bh=tRqvkgP3s46IORRaOk1LZP5YQEeJ21rrrTXuUbKXSvE=;
 h=X-UI-Sender-Class:From:To:Subject:Date:In-Reply-To:References;
 b=U59A+IlQq9Ty2vLJ/t0baMBfoAbH0Aw6B73DmM0bpc00v/3DEX+XtgPUaJ70pgGoD
 ++kQQ9/7ftC4DTGLMHuoo0T13IJgBEcc4b+xQYiGtn+dSvqUvpy/i8NKOWF5IuTXt/
 Fzd+F4UhmCtlKvF7o+tnh1sytaWxHdsXxvufsYeg=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from p100.fritz.box ([92.116.135.166]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MA7GS-1nuxfG1bNC-00BbjA; Sun, 26
 Jun 2022 10:56:16 +0200
From: Helge Deller <deller@gmx.de>
To: dri-devel@lists.freedesktop.org, daniel.vetter@ffwll.ch,
 linux-fbdev@vger.kernel.org
Subject: [PATCH v5 1/4] fbcon: Disallow setting font bigger than screen size
Date: Sun, 26 Jun 2022 10:56:12 +0200
Message-Id: <20220626085615.53728-2-deller@gmx.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220626085615.53728-1-deller@gmx.de>
References: <20220626085615.53728-1-deller@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:XxMXRHHOIZppOQ33AhPRekjS6DT7v6+OWNQhGg85ofI81pYJvJo
 oARhDCTnuKL+YZBg7K2qs/zaZo8md8P0mag1Um870odqh/X2cvpKiEJxhRCE+3JmDhpCiAW
 bM7sTM6JuxBd3ox7kIvcLQPXJDI62DzufROcOCoD8eJyZrw2eLkRiE3TvG0V27A3z6uMB05
 vECu29z/HYu0PuKiELnRA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:MVbxWrWMr1Q=:a9GT5HLKJt1tVYwVdhg7+5
 6A31l7lbfFfa83E6L6h8KdKAX9IriKPW/qQL+jw5wCVh0hGKUuxAcA0B2/FSBcbaM8rQl7Gwt
 He+6esglESWmP0zQWntoTlIZaqFd0xUxHAusBAq4lPMujXgMUDAO/TzueO8nNHo/6VvXTGBf5
 pYFJJV7OYiRK6jgANJlJUO18a1PAmyu70gKU37PqaCcInxVE9DJhSx9poqVOX8tTqBfMowisN
 26yprWYGZGNyRnwfk4+WEKbLTZB6ZUDkeTZy2XcaM7Y5F2473uuVlGegLLv72wQXav3vggZtp
 sh1w8DJATihkjiNGBPHv6Ixn0b8L+vkk78Jpzy4fLsw4Yy5nOsYthb2xXkNbLMR6+q2l3ZLBs
 8Lwi8BT/lzXNwrNUmEqZxZqIThUEfG7GbGVERjiF7EB0WMU/avv0kkyRckDgOv5bhS3+RGgEk
 vmBvebykFjbVwPaTBTGpZgG2wTVfMde5/Z56W4wL4gN3gqK+nSiQ8vEeD1BPy3gtfSJE445Zt
 GTe3u1ArTStYtf2x9jWna5wZ3MuGy7xuPqXWI1xGh779w0bPr/8nB+79yMu2n8oPXNdbVGTPM
 krT0DxSarSIb7lU6+U1ioYt3JYXx1i5T3wNsIAaxNei8Z9GP+dX1Hx3TewDhMdoMGWo/mHwL7
 Vc7aOQd6BxyVC1D09URHRBzvTtyEZxQPmNnjfeNlDpcZHPPDQdZ1ZVElC2KsEF6arda0AALSj
 FkrvO0yuVCItM+Y/gdi1y03dLrWdsKgUzAoVmgZRW2ZFYWORPFlvrpdEcTBu0GSGPgEuboa0K
 Rwf2lOWE+ycR3Zr1AlsI/mlvueqBzga409sOz/FZMkJqZagHb0XKJr4qum5U6ZvlaJiLwgk55
 8OzgtbMTpY9IS4JHqq8Ezajua6qSq+GjK8wq9dj2WK5akmix8lthwwKhKSFBB0xZxTdXPUKsp
 0iTHrZdwmK+q6R7MVvuwHHEwATynty962r8pxbAu10bvhzdVUw+wUhQ7KhkpbpUMkR0zb4VJ4
 3pnHG0vwAFI2qRw6bJiTtKekycW1eNvwrLTAQfbC5Eqz7/qYTkW2rItDJ1JOpSz0U43IpfTcs
 sdys7rCr9sVc7PiWXM9aXlPaaak9viJ6Stf4LSjY5n+ahm+NyNnHXh5fw==
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

