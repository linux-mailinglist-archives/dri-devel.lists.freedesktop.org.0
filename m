Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2F9F7133B6
	for <lists+dri-devel@lfdr.de>; Sat, 27 May 2023 11:30:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D17B10E0FF;
	Sat, 27 May 2023 09:30:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7676210E21F
 for <dri-devel@lists.freedesktop.org>; Sat, 27 May 2023 09:30:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
 t=1685179817; i=deller@gmx.de;
 bh=Ub76/RFJwYAmxJ7Nq0hhmU3imJIdF21c1d+mNwim1x8=;
 h=X-UI-Sender-Class:From:To:Subject:Date;
 b=pMXEbaFZSqr/+zSIiEknbPnOFJWhZ1hAYazjY/n1bYkIIS89xgnW4wRMLXQNdrdVm
 G9otVmZTpix2AP4Ljq4LNz6baLqB3W9+bJG1JXPdMt8wQkTnDn9YoR3L2ZFgrplSSa
 P5O8GTHedxHMHNGKicp6foyNxEQP2+pcYIocAoYZn8wDEbitMvMlHMu1pB0nKodSBh
 G84nodCSIwLMzVgnfG/lunZ0nW+4fJs48WEpI5Lmff+2nzazrkyxzyOst9dFEqmLFT
 OjSeYdnFCVMXjA2O4H0l1bHYA4KoZnLymQpIbEG4IIMJefyxkC9FMD2qkFVvGxNMx4
 1HU7pIY/OBosQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from ls3530.fritz.box ([94.134.159.182]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M4s0j-1q4DIU0ywB-0022tT; Sat, 27
 May 2023 11:30:17 +0200
From: Helge Deller <deller@gmx.de>
To: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 stern@rowland.harvard.edu
Subject: [PATCH] fbdev: imsttfb: Release framebuffer and dealloc cmap on error
 path
Date: Sat, 27 May 2023 11:30:16 +0200
Message-Id: <20230527093016.486521-1-deller@gmx.de>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:crPjy995UI032iOiIkfi5gEfMIlSMKKlohpDau3afmh4df3Fn9E
 oSt7ZD7qHAZEr/EhB1LD84WClrDiOVMg9JKDd3uN+pOhshpLALavswdCXrLPaVzkUyNaNt8
 YAUkD5a+38hYArXlS4OkntYP8QF6GPKQ8dHr4AnJyXdQCMffopKyI6PO0qiWqopb9bJj020
 IrI0TIy38WXUzp8NKkqvQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:LpNxU+h9oSw=;YhxuploVOUWI+mqDdmayKYTor/0
 ek4TyS1NF4n8gPB0cuIDnACs0HjXZqtU0Yq7c8Wszx/tQJ++8mRuhNV0AeAhbd43bUWRBN8LQ
 Nzv7E+qNU53LfcrEv5HN1ZjJZxAlqjxkLp0Qc62qiZLdkmI4+xkLz8bY6XVJrBul4U8pANUXx
 IKBHFjIG/o1KmpKR2/KZB3C6AULMc+DxmQNCpChX8pT3bJfvEP0ZDKzRRh7veKyH1BSFxzCga
 yOPiJ70n1MFlNKGGQqOlJgLR0BwsFKiqmSrO31JfmjQeUrGdcDwYkgCm2DWufWo+HKZVOMrC1
 lMeN1UKPyYsl1r4VwlzdvTeNGM99s3MLynbg+2EpPvf86LFXqxExfKqs46J6EKTKNUxNR1oiz
 CTuVo+WkYxXgUCducBPCcj3WD+2+I+rZEUb2ud6o9e8+d5TFJaB2G5XSTaiffh1pxaMmhgSY5
 K0fBq7N7Xios0bK002zrEkEV0jPtPJOgK7MhFyMx3PPHxRZxPFTvvln9gn+q31F1R9grOnowC
 f9WHXtA971pGQLlTZoTJ23idL3N8FOEHOtLGKHeo9kUfb6dzb81jztVuCYNQBC29TBf/P3r7S
 o9o8n9KMfY84Xjtb4GauR/nQ8Ri3fdb905Feql1N5Lv+9asZ7odHrwSycNwi8D513kUGT7V6d
 VRuumys1JdBYBiddRcdE4ij6FM1gB/PErZeSnJsYlW06Az/OgPDmPER78IXSDTgg7XkGoMxN9
 FKRyQDV+xCPPPD9/lG1pIVNz/8fOsXB2nh/Yfzmm6X+koC4uaEwl3Zpf2k6GzSI4ouziTGEWq
 yve2+Raca4spkiqikzAjJ8rXYYxR1al4rWsYIPnlRHZ7s3SPF+PJSi+fgzW4onSYRExmVs9l9
 yT7wGxNMAfKi0zMq5A7316jb5b9wOI2GiB5l3nRrxaG55xySsdaCkLMdYzbKg5ogZsT5vo+IG
 beQOAw==
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

Add missing cleanups in error path.

Signed-off-by: Helge Deller <deller@gmx.de>
=2D--
 drivers/video/fbdev/imsttfb.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/video/fbdev/imsttfb.c b/drivers/video/fbdev/imsttfb.c
index 975dd682fae4..075f11991281 100644
=2D-- a/drivers/video/fbdev/imsttfb.c
+++ b/drivers/video/fbdev/imsttfb.c
@@ -1452,9 +1452,13 @@ static int init_imstt(struct fb_info *info)
 	              FBINFO_HWACCEL_FILLRECT |
 	              FBINFO_HWACCEL_YPAN;

-	fb_alloc_cmap(&info->cmap, 0, 0);
+	if (fb_alloc_cmap(&info->cmap, 0, 0)) {
+		framebuffer_release(info);
+		return -ENODEV;
+	}

 	if (register_framebuffer(info) < 0) {
+		fb_dealloc_cmap(&info->cmap);
 		framebuffer_release(info);
 		return -ENODEV;
 	}
=2D-
2.40.1

