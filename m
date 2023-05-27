Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4360871339A
	for <lists+dri-devel@lfdr.de>; Sat, 27 May 2023 11:19:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9920510E1AF;
	Sat, 27 May 2023 09:19:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F49910E1AF
 for <dri-devel@lists.freedesktop.org>; Sat, 27 May 2023 09:19:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
 t=1685179143; i=deller@gmx.de;
 bh=Xk8e0o79rU5qYQZ41Nvm9kC6xi+2UGglRFIowace/L4=;
 h=X-UI-Sender-Class:Date:From:To:Subject;
 b=eb/6Mrz8yN0LZrWkBdEQ80ElnlY7V0v3Jz7nAkMow5DkAgYEkfBXeBCPhOSVGhS4I
 wcSjlkijoNUVkCHZ9xf1hLvRa6W5x+V1jN1uRo7APnqywWm4BtD3AkD3oi2ZZP+Z/j
 /Y2w2YsDRXN6/ymEEu+x8EzxWoD3IsPDdyXKi5xWjtXnT32whE/kMO5Z5R0APRaWy3
 m93vPf7AwgJfDvH5I+jPq18HBZ8d77IzHCxjrUMdkru79Ok7r4vrnpOWsKLKkMc8ke
 hfcmSOzbZnaxgYxG3p5wNtAEicfIAYs4kTiWhuAkSuyecWs0NvSUwxxQANU9Aey0cJ
 EIqeKcG7efz1A==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from ls3530 ([94.134.159.182]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N0G1d-1qHE482EB5-00xHIq; Sat, 27
 May 2023 11:19:03 +0200
Date: Sat, 27 May 2023 11:19:02 +0200
From: Helge Deller <deller@gmx.de>
To: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: [PATCH] fbcon: Avoid showing softcursor if font not available
Message-ID: <ZHHLBpGkHBmIpGT9@ls3530>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Provags-ID: V03:K1:Hy1M/kWlW75ynhsKITDLJX25gY+535q2YlSnrIgMgWXEZZ7WGcF
 c4OZxQkf16ySpObXzo1ssgyAO/+xiRSk5ieCTAzduAZPP3PuR+OWuM1Hq8uIct0EF9SfODj
 NVtI4AP6yVqBIfFhOH9yDQMl3K349YhKl1b4N6ZrBuau2fSvrxVSmZ3ZWYuMubc8PRHre1N
 NmrwdRQqq2KcpbQ2AixTg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:WSUFyarqV14=;LjvD7toyDOCzg5nhm73lXV+k5D/
 6rZE5ixcjOpNn+V1sgTIdUUheydzn+C6NSDP3zGDisCD2bkdqRGGTNnXM1CuS1ZmXMXFLqCKj
 fqa09ZWigxq1M7iz/clUx5dq19sLSf2Cdg6WVI165x6GEo8dbOF/7jeAJmUh41uhSLUXgL7PF
 j24qegluTo5UR2PhE7eN7cAQ2HRdfbtldkr5NzKHxd6GaF/+6gPZn4s426GAfgE6clVsQ/Hxs
 UaIkTvqULS+ktgXd9Jqu8bw/HuDhSzMRKrjafdg6t5NVVeSWt/uOhQ4hVY4dHzXDfxKiXeONj
 uplKp3qbwJ26J5EiZ9F2RkrVVhZfPMKW0fQrLHyCeiDrbuZpEc6hkW8IuOtJrg5dzwFxtumX+
 iS7spwv2u8qpqsrY1VFfdRkwUNjDL3TwVlr9xGdhI1UFfXF5j/wdyFlj78cfZ/1QelhSlXJ94
 VFxG0eOX5LMfZYLtQHLAMcfjWSHZhU9Pg5rWDw435Klap41iEztzt1/U7TJqGP/LBY/YsW2+d
 jmoL58KJnsyMh2EN0ddFqEQdQtj74Y183xYbzSDmbJrL7d6XUIUxL10w+H4fshocrO6CGQrfV
 fogK9LWYaMaW2hhe9ZIgIop9t6HdvGQ/E8cKqCOGVuIr2XKPIzLzRT03mWGX7e99P2muKujLO
 KqGMSgA2/EthfN1b5/HZ5Fc6iGdWzDQsDyqpHFHD/xNSXrWMZbshou/dkqIqxhscBHKJHNRzP
 +V7DzuSPu1V1kuvsAeLr3o4VO5yNzUKghF1enJwitZIH2g8NiB7KQkhEg/WgCoZGlpr0AlHhG
 KqNOHBhaM2TrI/3g0UuJYJabHgvlS0dGbATRLyUw7CNZJwXelNT8gFkuEt+YNCxr3cAL905vK
 nO2YXzy/ZAl4gx4PenlrthYc5uRf6Sa5LWO562r8oXkTL+2CIBjEFoynYPuCVXR5jnDKNmYaX
 soFpxKzpxF7+13bk9oBSQhvxiZg=
Content-Transfer-Encoding: quoted-printable
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

syzbot repored this bug in the softcursor code:

BUG: KASAN: null-ptr-deref in soft_cursor+0x384/0x6b4 drivers/video/fbdev/=
core/softcursor.c:70
Read of size 16 at addr 0000000000000200 by task kworker/u4:1/12

CPU: 0 PID: 12 Comm: kworker/u4:1 Not tainted 6.4.0-rc3-syzkaller-geb0f169=
7d729 #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Go=
ogle 04/28/2023
Workqueue: events_power_efficient fb_flashcursor
Call trace:
 dump_backtrace+0x1b8/0x1e4 arch/arm64/kernel/stacktrace.c:233
 show_stack+0x2c/0x44 arch/arm64/kernel/stacktrace.c:240
 __dump_stack lib/dump_stack.c:88 [inline]
 dump_stack_lvl+0xd0/0x124 lib/dump_stack.c:106
 print_report+0xe4/0x514 mm/kasan/report.c:465
 kasan_report+0xd4/0x130 mm/kasan/report.c:572
 kasan_check_range+0x264/0x2a4 mm/kasan/generic.c:187
 __asan_memcpy+0x3c/0x84 mm/kasan/shadow.c:105
 soft_cursor+0x384/0x6b4 drivers/video/fbdev/core/softcursor.c:70
 bit_cursor+0x113c/0x1a64 drivers/video/fbdev/core/bitblit.c:377
 fb_flashcursor+0x35c/0x54c drivers/video/fbdev/core/fbcon.c:380
 process_one_work+0x788/0x12d4 kernel/workqueue.c:2405
 worker_thread+0x8e0/0xfe8 kernel/workqueue.c:2552
 kthread+0x288/0x310 kernel/kthread.c:379
 ret_from_fork+0x10/0x20 arch/arm64/kernel/entry.S:853

This fix let bit_cursor() bail out early when a font bitmap
isn't available yet.

Signed-off-by: Helge Deller <deller@gmx.de>
Cc: stable@kernel.org
Reported-by: syzbot+d910bd780e6efac35869@syzkaller.appspotmail.com
=2D--
 drivers/video/fbdev/core/bitblit.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/video/fbdev/core/bitblit.c b/drivers/video/fbdev/core=
/bitblit.c
index f98e8f298bc1..8587c9da0670 100644
=2D-- a/drivers/video/fbdev/core/bitblit.c
+++ b/drivers/video/fbdev/core/bitblit.c
@@ -247,6 +247,9 @@ static void bit_cursor(struct vc_data *vc, struct fb_i=
nfo *info, int mode,

 	cursor.set =3D 0;

+	if (!vc->vc_font.data)
+		return;
+
  	c =3D scr_readw((u16 *) vc->vc_pos);
 	attribute =3D get_attribute(info, c);
 	src =3D vc->vc_font.data + ((c & charmask) * (w * vc->vc_font.height));
=2D-
2.40.1

