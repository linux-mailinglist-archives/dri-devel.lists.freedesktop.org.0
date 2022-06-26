Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6202955B12A
	for <lists+dri-devel@lfdr.de>; Sun, 26 Jun 2022 12:29:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3913610F728;
	Sun, 26 Jun 2022 10:29:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A49D212A046
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Jun 2022 10:28:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1656239334;
 bh=j6RW8ENNf5nsY/5nr46mKXkS2nQvtyKcQa5Jw27h/EY=;
 h=X-UI-Sender-Class:From:To:Subject:Date:In-Reply-To:References;
 b=gdC7CsUxlJWA4JVIObkzh6DyRIu4/gbv2MvLkvMnECxKyCnDYF8tVcurK4Auh1gbF
 SuYYPM/jiOet8g8AQbRdcDlCHkFCnw3kj28NLuZpivwnqeFpDuYfvIWm2dqgXretAS
 K1e0jlJnSvaatGdPzoYe2eISxeB01ExcKJcXCsMc=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from p100.fritz.box ([92.116.135.166]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MhU9j-1nSlF71viF-00egyi; Sun, 26
 Jun 2022 12:28:54 +0200
From: Helge Deller <deller@gmx.de>
To: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 daniel.vetter@ffwll.ch
Subject: [PATCH v6 2/4] fbmem: Prevent invalid virtual screen sizes
Date: Sun, 26 Jun 2022 12:28:51 +0200
Message-Id: <20220626102853.124108-3-deller@gmx.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220626102853.124108-1-deller@gmx.de>
References: <20220626102853.124108-1-deller@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:n5URlIHOFY7d2NEdKov4I9Kd6OV7R+J8BJVzbPUlME0OTNKYRH4
 hPNdYn0EIERu7zSTAcno9eGSCqHmuqG+/JLi/EXlz9MVMMALyEQWQUtDvoLvKZsgROLPqui
 XEFmS6ggtGqtGm/0Bayfed06WVuGk7mzz6LDwUighkkzKClseUlBmB+ksQv7wHTblUMRvcj
 WY7r3t9WBpy1EQntiGERg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:OwgMb80HTNE=:rc4lA6kA80/hFrHtJAKOfq
 Erbotzd+0RQd6nqYPIFm6ize8Hv/9tiz/PtKgxDdnQjfb8w2jDK3ty2WoSJqIHgyTeSeh1JKM
 AHGj6ZdXUtrAUEybqwiBaxB2iVsIduSL0cLDPsXkbg9O7zReQ8bl3KU/MfDEdiVWY3gaMVw5k
 T5XAhFRCZD7C+QhdRrceXbF5jh0KlAarT53NmyhSW1MKOTRRTeYRw0012LpZrAmKxm2yy2uNn
 jAJYPKCh7Ub7RE2ETfOnUdME7RYGE+oycjDRbWxsPIms7BhnX3DAOBENsm6zu2JPQLK7haxo1
 oIbdh8pUN60k5ps27PmKSio7DCKEJnbEE3MIlaXMk8R1nQUJZ3KbSm6pHkPh18lyoThadGpep
 xPjYFlnXf6dHH05+GdWusJQscOCriZuUnFrQc+Cb5ahJFNAZwoAm/86Qa8GNEiHqz/xU66k2w
 DpqDF1PI4KEjMY74fdcgwHvfKfFoMc+U4EmXKbrma3NzNi11Zj97i/cYUq4Hcxrgc/GcQvwE/
 iqvlUt4P61PxLyb5PQ+wGRA+z+WX2WsU5LWrwEQahIOqZcmTzk5oid7jHy8ca3TxVWxlYa9B7
 9fK6NtceCdHYVrWuyKmwYVbc47u6riH8FZw9IG52s1Ect14ygDVb8Rl1uReNtvsihs7xGWaQL
 MNGi091doEresePyXhze5XNmZyLBsYWXs1NN5TCTSrBVxPr4nbfQhfvX4Jn15H+18CEDjsYvn
 KGDzu63UWFMObkCaLHFY3JaEjl5nZ4LnYfdsqHrGTNMpyV8pmn5KiRZD8FHDm2xws3VO7ezNa
 W0XLaUmlKl5WiSIDXFPl9InK6UeZY0xPF10Wl4KPsDg3z63v+BtfGiQwbBTNpyu3fuOQQOaNa
 1L2BBprqEEQy4qXy8oAhF144BNNCVgO01Wl2JINAmFLrSwgnHEjhNhGKPe1sYXQW4mFXxID1g
 WkowOwWb/uVLZRZqYQd7D4HHOOfs5dKt5qxGap30EjqsNZHMQqjTr0FuPAIlWbJbyuAHRAXRN
 /MZ1ZASikZueVEDj0RnbxD02EZ1fANoFLk2WjIb/RPA9WjerV2A2Io9xviPbuZMA9lps4uX1n
 Gso+mo4ogrm9B4vANqNPnLuloiMhLC/VTCJWqdHm2+VHWd9dLd+noQ72Q==
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

Prevent that drivers or the user sets the virtual screen resolution
smaller than the physical screen resolution.  This is important, because
otherwise we may access memory outside of the graphics memory area.

Signed-off-by: Helge Deller <deller@gmx.de>
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: stable@vger.kernel.org # v5.4+
=2D--
 drivers/video/fbdev/core/fbmem.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/video/fbdev/core/fbmem.c b/drivers/video/fbdev/core/f=
bmem.c
index afa2863670f3..5dfa4bbee642 100644
=2D-- a/drivers/video/fbdev/core/fbmem.c
+++ b/drivers/video/fbdev/core/fbmem.c
@@ -1006,6 +1006,12 @@ fb_set_var(struct fb_info *info, struct fb_var_scre=
eninfo *var)
 	if (var->xres < 8 || var->yres < 8)
 		return -EINVAL;

+	/* make sure virtual resolution >=3D physical resolution */
+	if (var->xres_virtual < var->xres)
+		return -EINVAL;
+	if (var->yres_virtual < var->yres)
+		return -EINVAL;
+
 	/* Too huge resolution causes multiplication overflow. */
 	if (check_mul_overflow(var->xres, var->yres, &unused) ||
 	    check_mul_overflow(var->xres_virtual, var->yres_virtual, &unused))
=2D-
2.35.3

