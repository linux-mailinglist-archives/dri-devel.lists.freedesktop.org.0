Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F7A455B072
	for <lists+dri-devel@lfdr.de>; Sun, 26 Jun 2022 10:56:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B40214ADAC;
	Sun, 26 Jun 2022 08:56:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC7B714ADA0
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Jun 2022 08:56:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1656233776;
 bh=j6RW8ENNf5nsY/5nr46mKXkS2nQvtyKcQa5Jw27h/EY=;
 h=X-UI-Sender-Class:From:To:Subject:Date:In-Reply-To:References;
 b=Qv7c8d3kZATkUQ2Er68C/c3weIAkVTTJgo9BYhnJvLWpzVx3YQLb84wyoaLoXmvdf
 8tPV7WAYO48qzEkXNm3BqA1KswVpFHHkAr5zv7mFDkDVgAtNsnUXuz5/zivITPQszw
 4qnXWlldtiWesaF3IXNBsH5RSaRGp1ODMlMzzIM8=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from p100.fritz.box ([92.116.135.166]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Md6Qr-1nX9JD23V5-00aBxl; Sun, 26
 Jun 2022 10:56:16 +0200
From: Helge Deller <deller@gmx.de>
To: dri-devel@lists.freedesktop.org, daniel.vetter@ffwll.ch,
 linux-fbdev@vger.kernel.org
Subject: [PATCH v5 2/4] fbmem: Prevent invalid virtual screen sizes
Date: Sun, 26 Jun 2022 10:56:13 +0200
Message-Id: <20220626085615.53728-3-deller@gmx.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220626085615.53728-1-deller@gmx.de>
References: <20220626085615.53728-1-deller@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:0afImqa/Jc6PTM9JOXpG0okYdBYsaUiPojb875b0oOTDasKu+ZN
 5IEU772wAYk/ULH/HJJ4klbQkS/VV2hrc5bRe/wG79HhQsus876OKzyNAJS20Qrq4gCtf2h
 dQlJsctFUKn7K201F2E6ex3+UV2IC1DnnVWevlZSFnHcB4DRK6UNzFrL2dmBq9BJgPNStH2
 x8Wf5zcju0drFfhogc6sg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:iBw6x7+a0jY=:fYNS9WaSraAhdXa8HOV205
 WIDDDeRK9KXquSmQ4mz0F+w/l+TiCw1zI88bSiKh0wizr5bFBcQaAvSW3Qys9ni0jokpTX7Ui
 9z+gFiyGf2U6E+dRYNzA4NAzJ/MdFQvqAyTGiZejZWbYLqroO2lObnt6HE++I2C064UeGp8gF
 gMUMNTk53ahOTFaTfLOs5DDqJC9WLrUTV3gkTLJlOMfeTCHjaG2lqjJ5fPiDxcU5zSyLzm+3m
 IwUfCSNQb9EHTQqVrxuBQ/lIq8qWPHgF4yk8O8ggeChmBksEYOKFycpzO/xSf4wMaFyjLeUBN
 4I8MKeLWUCLzNBqH0PD9KY026YiLF/rDHhchzCuQFVRrnlkZ9UiBfU1RoOYzblIXut3VZPm8b
 wpF74LdDV/pEbG2cYYYSzCorFrDmHgOVVpRLXL0IUm3geRE96QwmsmHLvMi4vyTNBezPK9ucy
 3VAYj1S7LUKjV3CzBKEBTO6AcOukGSDwT/fT3ii6qrdkh2qnoxyUoi14RfcfcGY59teWHR3r1
 L4Ri8Ha9C15B9EubXqrKlGFJdvDEZRdLrGoFuS5v2Dc76cQ/nMcxpj6lYBUezLMcCl8WFD0D2
 lnXkJWYWKhvEj8jZVHY9x+v4zHF3X5XOb13MYdWOVmGopOSNDV/LXJrKiXrX8YvT5KlAGWtmp
 ENLG1vnQCwclt6cW1XLMqUX+7mcQ5i+64bPgDwSiYGDty4vw1puUPSrrFBwW0LZPmN8Mk0TjG
 qaCc+fQ6RblWO4DNgDVhKP5y9V2FjmKDN/yEhrPZ46DjIRBXHSWm8OYs0aUTJdU7Cbps6rrMC
 HEJt2/snaAXuQKpSr7OTqHJXeLZ3V4HvxsIh+usVE1e2I+1uCAxKozwts14C5Z9MvYWZq+SvE
 wA6dWLS5QZOHTr+A32wSiUbbuKrzCMjk39iZ4HyonfUyMNzCASxfD6xVf2IWo9viWO6aDmiJM
 jaEEGO1mmGXVs0VLQ6bjeH3kcbXMqrFZ3FkQ3aE1NYLXrGjA5c7WVk+BBlinKYO5v3bDt0+ar
 C+gwx0UQVwNO6wcv6me7nndI0IK96BlUJaIRaCUcgbULlcZ8310WCHqYZvBrKiyAxrvmSaJ7U
 rD2r1+uCEdBcd0ZIVf1CD6PucULRmpRyslO3ys0KhC41MeqZeWhTt6BFA==
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

