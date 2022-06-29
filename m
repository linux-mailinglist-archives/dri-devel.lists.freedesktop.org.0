Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 86451560ACD
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jun 2022 22:00:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A8FF10F0BA;
	Wed, 29 Jun 2022 20:00:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EE4010F0B4
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jun 2022 20:00:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1656532826;
 bh=SsyOzrNfen9QSl5eCWj5qx7UuBmcX7tHqF8EIXkCPfU=;
 h=X-UI-Sender-Class:From:To:Subject:Date:In-Reply-To:References;
 b=LP7HwpA51b8s2igA9tMKOyKG8KqBnTH0Q7KftF6+TBpjZNmspwqSdJgltRQ0hojSb
 OSfJHX0e5BMMfSJFDJc0CBS9yHy7ly9mW5l1Zpip7Hruxy+yGpvS8K+rfZWdadeJoU
 B5yNNP9ME60L3jtVBfDaiBiIAKHUc3JpAezkr3Pk=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from p100.fritz.box ([92.116.135.51]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M9nxn-1o1Qey3tHp-005tdD; Wed, 29
 Jun 2022 22:00:25 +0200
From: Helge Deller <deller@gmx.de>
To: daniel.vetter@ffwll.ch, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, geert@linux-m68k.org
Subject: [PATCH 5/5] fbcon: Use fbcon_info_from_console() in
 fbcon_modechange_possible()
Date: Wed, 29 Jun 2022 22:00:24 +0200
Message-Id: <20220629200024.187187-6-deller@gmx.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220629200024.187187-1-deller@gmx.de>
References: <20220629200024.187187-1-deller@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:qgR2YkR2U9Hhrf/Lb7ITElH+EopY19iZaEZNkKj6yg28vpgyZcx
 ZhYKieMegQ3Hkll49prgqNn1NspvOL5cUPuEPohg8mSjzXc/VrbhOymGhxjzKZMs2rFcc1U
 Gc3E6usfmCgAArUCYk5N6m5a+HZ3BR8XtZxqhYegY4mxJE5nTpgDcNNnuraDLbdDWf9SeA2
 K2b0Om1l8JENDF0XbyliQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:gwVllAQRozg=:O4QIxmyOqHYKduFMAQwiJL
 fo328kdPr3uZzgORGAMWIqPNE/3yrQwom1yaQ/AkANObRb70Q3+Rhke+H+fPdYKi6gZjSbhcQ
 GihsOUAmAMPUqf8EStIlXc1q9oHkMDo7PT8XyRjQAou2/zOEgpcU0Y88zWXfd/3aA+G+KpT8M
 kPGJX6pzP+ADKroB51givNh+XAWtt9QkGO/FyitngqfJNVZ+YVL4cwJrfldLDUIdspJibzMkg
 oD0hBrWeM0m/rtkyaj46Bic1OrCxdIeaJT0IxqG+v8EZ86BsMz9HsJ0lKbwV4Rfh1j9/fHIU7
 hSgFmn1y+a7f0PMYKKgH9+6TlB36ycqKii+xhXOcbk3XNFmQ1keNAXXwPzh8h/lE+h9moNTG8
 8im/BVkJYwTd8UFvA6CBAMP8o62uv394wkWEuHNv3A1Air4QSXWNi00JEYYI+PMHv3jPjNoG5
 3YuzsOaTqT1NKW77uAzcaxbXO3ML+hbWfiIwNoweLfkGXgSwEnNEMnll9i+XgNSLXeeCuwIqV
 2hg5PPT3RRsWHE11x77ReYEqD6WeP+E3ShFajsj9f4muBg14jytaSmmlLe2x8CYJ2sGIB92cS
 7d+Syz55gcOW1VdN/6ZAMqv6qC60Na04BavlQEIIbenfWyzsJTiVoo+kO0XfynIkuTvtELsZt
 Ypjl366A3IZmZH+YEpqESUlalfOn1RK5n4lZRX8P2nrtuOHq5Da6ApskIJKd2QEFEYO6z69Nv
 +4r+4WkuvcVNdL0F6fEtrl0VqdGlGw/TkCrbPoivrnSaJPQtVPc5CLtuodAlWs6+jGp8gpRTq
 4a8Ya5msCHxo4lzKd8MTTxuwHqw4w1GT5VlvSk4eGrQMHAJhE1SWcXusj/OzLXz0VVj0BVc8b
 S/fJr7acf3rEy54OvXghQxMPWHSVxbdMkOjQapwto7NMxPQSkB5esu39KrgKQY/6dXGvLzJNn
 KrGkXFNnpWUWWO8yDdkcT1ZBwAG9PxarRodh0rLJRA4cFZ6yBYYzlwLHaiyrcB5S4GUPKB779
 E+woaROme9z7Z+X/8UoTHlkJbyM0ZO0QkNZrY05eeBn/onVwQYB3PX/H3ZLoOy1ZjnQqGvyVO
 JL9j7z/nY2c44ntPRET6Rax5iLuc/mK1N1HpQia3bQTqD+n7sDGlkALAw==
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

Use the fbcon_info_from_console() wrapper which was added to kernel
v5.19 with commit 409d6c95f9c6 ("fbcon: Introduce wrapper for console->fb_=
info lookup").

Signed-off-by: Helge Deller <deller@gmx.de>
=2D--
 drivers/video/fbdev/core/fbcon.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/core/f=
bcon.c
index 278c065722b7..ec1cfc6c2451 100644
=2D-- a/drivers/video/fbdev/core/fbcon.c
+++ b/drivers/video/fbdev/core/fbcon.c
@@ -2752,7 +2752,7 @@ int fbcon_modechange_possible(struct fb_info *info, =
struct fb_var_screeninfo *va
 	for (i =3D first_fb_vc; i <=3D last_fb_vc; i++) {
 		vc =3D vc_cons[i].d;
 		if (!vc || vc->vc_mode !=3D KD_TEXT ||
-			   registered_fb[con2fb_map[i]] !=3D info)
+			   fbcon_info_from_console(i) !=3D info)
 			continue;

 		if (vc->vc_font.width  > FBCON_SWAP(var->rotate, var->xres, var->yres) =
||
=2D-
2.35.3

