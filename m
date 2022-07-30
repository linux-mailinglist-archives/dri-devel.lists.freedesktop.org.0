Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 53B92585BAB
	for <lists+dri-devel@lfdr.de>; Sat, 30 Jul 2022 20:51:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E74010E1E6;
	Sat, 30 Jul 2022 18:50:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66C2A10E1E6
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Jul 2022 18:50:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1659207020;
 bh=lb1Lf8t4xaY9Y+QKg74YnMmqnO8vj3n92i+vvXEUpGA=;
 h=X-UI-Sender-Class:Date:From:To:Subject:References:In-Reply-To;
 b=OqCn9F5VJ0ZzU4RrAfP9GQO5F0OrM8Tr8bjpKCvVtP4itsId9U2SMQTbAmFlDCSv4
 uAr6BOqixGqUSFPLDv2CuOERLaIas5fIpEkntGPTE1xhbdvZj76ECEb3UHT9MGE46I
 apaqNGOPUz59Wbcxkkb6AAwzGUOK0dmgGB9//wMw=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from p100 ([92.116.141.10]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MWics-1nxw0K0OL2-00X1Ln; Sat, 30
 Jul 2022 20:50:20 +0200
Date: Sat, 30 Jul 2022 20:50:18 +0200
From: Helge Deller <deller@gmx.de>
To: Khalid Masum <khalid.masum.92@gmail.com>,
 syzbot <syzbot+14b0e8f3fd1612e35350@syzkaller.appspotmail.com>,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>
Subject: [PATCH] vt: Clear selection before changing the font
Message-ID: <YuV9apZGNmGfjcor@p100>
References: <000000000000bbdd0405d120c155@google.com>
 <20220729065139.6529-1-khalid.masum.92@gmail.com>
 <eb4a26aa-da30-ceee-7d27-c1e902dd4218@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <eb4a26aa-da30-ceee-7d27-c1e902dd4218@gmx.de>
X-Provags-ID: V03:K1:aOJ76y6sEpgwGrwvfAja8bpGQzr5GQjvWnu3S4B6ULoT14KB9IS
 1kW0r3aNgXnf0ZQAjCzdN524HpXX3bNj2x5ReEp6m58tt6DPYuZvv4Mp4cBAdqNzbOs2q0Y
 4sFI7UcoIuDhGgXx46OTbL1STGIB/oqgyMpvnc2y9xNP/swxVQGZC9k0l9ByEZ7RDiDO1o3
 BDKWJaS7E2t4JTbcihZHw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:9vIoM7sHZEo=:mhN90fgXNBTJz11SQ1Z03B
 z9UUnW1mIkP+eG+jQmGYjaUMTW+e5dZIhqh/PcpFoLYPlzvIRxzA7+Pc75i3B1LmzH9VtspTI
 L2GBlFOqO1W9/nMxSAWx7FGKK3SYhi5MVcl0H126RzTS9CV1B53DdTrnTAEbBioJbBU2bnsBb
 97R6CYHmoJ7Dz9hBSAJOXOTqmokl7mjlWkGKycnh5IHOH+hVOsgzMFCOuwKIMVt/iWLn7nQi1
 m7GA9K8Kw9syj3giA0mpUUj+ic7+SwiAjuTkpWlUtnxp1J4lF2IZio6sEN1lgwXOXDeTHz0Zl
 idOGLyQqUAHvulM+OZxQMFxJtZ7CDGkAeb/SQZvUMWo1PAEv978gVgg8eMYdSHj/ZCAYZdNnL
 DToKoVs8FyB09ef4fjor7QaQpzyr238k375dJ6rv1+baBpxfcN3UoDjUxj7ArRVPRErozqRet
 Q3wJKaWMOdqLGbNdWkIVqLSQ8H4uRPgwq4+bndJk0llcC1Ien7t2YQJIcm4yDtI4d1S4+2fQt
 GXkWdAr2UcFQjGXuaYGrAyuGlxyi1oN2lDHapPqaZgMw8OEVeDZ19f9O//284hgFEvr3cOiMQ
 Xj+sx9MGaQuRQcW51nsh1aiadcdaKM/vHQ/PTaUGJREcHQFXpd4Ntp8P7vtPDpYamTsKPaHxW
 Zk8c7yC+EW6vV/YVhSjc3kUf3MOoiEnKBufYdQRLIxT7F7MLeY/c8BNHg5XU3vHsf6FmlJvry
 /gFK5wS87pIUbZu4ghDU1QNGCgo5CtqKpZ1z80RET5PalQ9qdNUEGOtasDqiERCqFXGl/Pbbi
 iS8+6E7SjdpmJ03oSorBn/xKLRflAiECYR5RJvyy8AAtHdpr8wKIWj03xk+LIkJrLShMil9QZ
 cGSJO27M/Lij8ESuFLDvKKt2pGJbGgVhIKDJoshGQeMayZPYgHVzemRLveevxGEHJKXbE2ouU
 AnGcOF2pywFkLCBOV5aP0WcnL7va4j7J/sBBzX9l4OPMgSoKvqPnTSjkComoTYGiCu8gj66MA
 xU5IOAWEmMLaOZcjleaAcy3nT7qHLYov3PD3UC3SPUQnAeaoVeSo8lnrySfI437iIODjGWX+l
 TkWWSghXt223mfkkGMZEQRnnYPZexGk0RZnhcQSHEXqjPAp8BSffj5e9Q==
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

When changing the console font with ioctl(KDFONTOP) the new font size
can be bigger than the previous font. A previous selection may thus now
be outside of the new screen size and thus trigger out-of-bounds
accesses to graphics memory if the selection is removed in
vc_do_resize().

Prevent such out-of-memory accesses by dropping the selection before the
various con_font_set() console handlers are called.

Signed-off-by: Helge Deller <deller@gmx.de>
Reported-by: syzbot+14b0e8f3fd1612e35350@syzkaller.appspotmail.com

diff --git a/drivers/tty/vt/vt.c b/drivers/tty/vt/vt.c
index dfc1f4b445f3..3f09205185a4 100644
--- a/drivers/tty/vt/vt.c
+++ b/drivers/tty/vt/vt.c
@@ -4662,9 +4662,11 @@ static int con_font_set(struct vc_data *vc, struct console_font_op *op)
 	console_lock();
 	if (vc->vc_mode != KD_TEXT)
 		rc = -EINVAL;
-	else if (vc->vc_sw->con_font_set)
+	else if (vc->vc_sw->con_font_set) {
+		if (vc_is_sel(vc))
+			clear_selection();
 		rc = vc->vc_sw->con_font_set(vc, &font, op->flags);
-	else
+	} else
 		rc = -ENOSYS;
 	console_unlock();
 	kfree(font.data);
@@ -4691,9 +4693,11 @@ static int con_font_default(struct vc_data *vc, struct console_font_op *op)
 		console_unlock();
 		return -EINVAL;
 	}
-	if (vc->vc_sw->con_font_default)
+	if (vc->vc_sw->con_font_default) {
+		if (vc_is_sel(vc))
+			clear_selection();
 		rc = vc->vc_sw->con_font_default(vc, &font, s);
-	else
+	} else
 		rc = -ENOSYS;
 	console_unlock();
 	if (!rc) {
