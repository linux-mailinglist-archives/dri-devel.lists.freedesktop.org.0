Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AF94F585BA7
	for <lists+dri-devel@lfdr.de>; Sat, 30 Jul 2022 20:49:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 701B410FB1E;
	Sat, 30 Jul 2022 18:49:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA23210F349
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Jul 2022 18:49:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1659206976;
 bh=tzpuq9WlpLWCJEtviNi1Uat9UZ6Xt70/8x9Fk89rkQI=;
 h=X-UI-Sender-Class:Date:From:To:Subject:References:In-Reply-To;
 b=Z7LG35tJxwkQ3BgKgcp7zo21le33aNsP6OEVrhp7263Riqe0OUfUCfP53iVx9nM1t
 uS1O+cH8tjt9MFqd/ZPMFk84LPOq28I1Z6Moam208QtsYy8WtQO+9a2i/g/EHT0X8S
 eN+Ng5yKMbVoJLrRU76MxS8O9qRW9j4ze1v2Y7/8=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from p100 ([92.116.141.10]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Mkpav-1nbKed2Kxb-00mGpR; Sat, 30
 Jul 2022 20:49:36 +0200
Date: Sat, 30 Jul 2022 20:49:35 +0200
From: Helge Deller <deller@gmx.de>
To: Khalid Masum <khalid.masum.92@gmail.com>,
 syzbot <syzbot+14b0e8f3fd1612e35350@syzkaller.appspotmail.com>,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>
Subject: [PATCH] tty: vt: selection: Add check for valid tiocl_selection values
Message-ID: <YuV9PybMPgc83Jis@p100>
References: <000000000000bbdd0405d120c155@google.com>
 <20220729065139.6529-1-khalid.masum.92@gmail.com>
 <eb4a26aa-da30-ceee-7d27-c1e902dd4218@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <eb4a26aa-da30-ceee-7d27-c1e902dd4218@gmx.de>
X-Provags-ID: V03:K1:ToEKFG7q8TqzWkKiUkgmSqOQzPl1CLwKRLoO7HO9nMZDveCnd3E
 ZCrrvyAiL47IG8ccPvy1YF8o6nma4f3RCYro88uhfqrOK9valmhagjkrBHZwcQHffntu60u
 OTtXGGByC8CpWRM+jLgBvhgLY8Ih1ubehsACmXGKiZFDPm9h3kxYsziGHZ/7APJOG+5fc4C
 9ogYGTt+u/tILdMa9/R3w==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:2gR9PQI4N7k=:TJBDvRUHky6mj8cMXAoQK7
 7AdrXDcfxuD4U3Oi64GVAGSOA01a6M+L8yawRDJeHCtChIlYAwLLzuJ6bOa7TrPXdvb2bhl9u
 E4ENbkvmMinwfw5K6MAxGdHEpkuUeq3VlH6ghedN8qms5r3aCo4K7rujaPth0q56pjK2xRdaC
 bViq28xmkRT1GJ2SCg/By9SM/M25T+R5YLaJ7qHA9iAvLEManBb+EVPc9Hza/F1apMo+r+cqS
 VMcfX2TfjCpvEUf6VUtRFmDle2PSbibP+xLjZ9hEKP8Fd4vv178Vu90cNudVv05tLqmhrXDY6
 SVI+MfwJJNElpQtTtchYrZ8iyl2e9R8B4sGkQ30X+iHUdWsTFwjFvu/Y3wUkuTWlrUqnqy/qp
 ddSwPjorRBpw7HmCe8h9/fucA2Rmr0NC9a5vJknnhMKQpciP0GIKou3MxxdW/HhXgI71kvHCJ
 QYEZZ805VLf2vQv7vmbUkigSloKx23xHY+vnasw/Af3rhxwQ+zC7uAgNww0ZocnL3ni4/mlVn
 QD8qGfIb1hYjGYrDrQ67rBKoT3G5FpcOWRpYtZOwCtTL4UzJX8xLXdTgzKDrxYMXccBUCv1Hs
 hXij+JVMf1wKsYYH22eL7oBX99UDqEfZPtijGI0uerVroDPQOdWXdqhdd2MzJ9qM1QZYeh6XN
 taDpQ2qcS+pzb910f3ZBWN1VRft7koGixtUdpAE00RQDq6Zb4f2jEOyYxRHO2ctQMh8u1RjwT
 A3JsrpFbZdtfwGRAxb/o5fso5ylCDfBWp6H92ZMwceaWaew2IFDnzp2fX3byc98OydiQ+PEfF
 /vawlJiaa+3fVX7ebRg7yMnFQ+64Rh3F0orzhjCnBgURI5UNUNq21fcpI4p4kUYiU8tp1ok4e
 FOdWUtgYGRIblUQ5/R+PSo5C0qa2PoF0Wpi2LGuuFaRDb0aiCRRpchwp2zLzR0SHiVgkt+BLI
 6q0W9yrJbI3KXWV+2Qb0CppOybuBFAl1e2TxpAawoa30kUWnsFcJ3lNlD+SWs7IO7t+5Rx3Qe
 SJhn23opLWDrq8iO5lzxriaat5Y7wVK01IJdRd6gjM9UcLg/6bwEJhrKG8cL/9PC1T1veFHEF
 tBzT5g2z9emAwuXG4gCCUmX8+GIfIfjL39mv8gVNmRAf1f/azH7OB4Szw==
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

The line and column numbers for the selection need to start at 1.
Add the checks to prevent invalid input.

Signed-off-by: Helge Deller <deller@gmx.de>
Reported-by: syzbot+14b0e8f3fd1612e35350@syzkaller.appspotmail.com

diff --git a/drivers/tty/vt/selection.c b/drivers/tty/vt/selection.c
index f7755e73696e..58692a9b4097 100644
=2D-- a/drivers/tty/vt/selection.c
+++ b/drivers/tty/vt/selection.c
@@ -326,6 +326,9 @@ static int vc_selection(struct vc_data *vc, struct tio=
cl_selection *v,
 		return 0;
 	}

+	if (!v->xs || !v->ys || !v->xe || !v->ye)
+		return -EINVAL;
+
 	v->xs =3D min_t(u16, v->xs - 1, vc->vc_cols - 1);
 	v->ys =3D min_t(u16, v->ys - 1, vc->vc_rows - 1);
 	v->xe =3D min_t(u16, v->xe - 1, vc->vc_cols - 1);
