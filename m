Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E077563AE0
	for <lists+dri-devel@lfdr.de>; Fri,  1 Jul 2022 22:22:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AED8B18B2A2;
	Fri,  1 Jul 2022 20:22:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94F1B18B2A2
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Jul 2022 20:22:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1656706928;
 bh=dEefPiI9Wq3+N76bPKdFvUHz0EeUTEIRh3WCR7KXkgA=;
 h=X-UI-Sender-Class:From:To:Subject:Date:In-Reply-To:References;
 b=OACZYikvy+/y21lPyc5myqfIifobXgs+rdBoYNeTCNyyCVp5HdTbcs9RNTycvqLkD
 k44nzweEViwLawfjGMepNzCMBAgTGVIomPHjR/TzyDHSt/HcP+UoDs5kIxHSeinSeb
 sZ31QulA5hmpnl6qAiOPs67kZfgNhbqwmdVjd5Ho=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from p100.fritz.box ([92.116.182.192]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MIwz4-1oM9us0AH4-00KPWt; Fri, 01
 Jul 2022 22:22:08 +0200
From: Helge Deller <deller@gmx.de>
To: daniel.vetter@ffwll.ch, linux-fbdev@vger.kernel.org, geert@linux-m68k.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH v2 3/4] fbmem: Prevent invalid virtual screen sizes in
 fb_set_var()
Date: Fri,  1 Jul 2022 22:22:05 +0200
Message-Id: <20220701202206.559518-4-deller@gmx.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220701202206.559518-1-deller@gmx.de>
References: <20220701202206.559518-1-deller@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:2Pema6bQD8hlqggTqzvIu9nIR9AjW15U3UF/mSjiWLLg5CVmqoI
 seppCR45WB7QBgxFfuaPbpf0bOxnP9/pENovo51jYwvBJ2P7qqCTTLTjYP1Sur0eyX2/o8+
 zk1SVGkAarypSOoEGzkCwd1LZuaUAKSWOoVjxjtmdlpbazSvOGDjWAqdL59kV/Kpudrjpzv
 qHxmq48QgT6U+aRh2jLjg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:ZHqwHxMtiAA=:DGKBW9shxJwivEm6Hf33Yn
 VXdHUzTvVHQqJcxK2DO0D02MRy3TiIHEmXltoxvDEjBUz6pflPD90rfGkQmwpcjcbSU+AsX/B
 0h2PJDQLE48ox9dZU6mdwS6auZ9mFZsixXAaxqCu8x88zTBOao3PLbQj1kbWZqMafEtRF//ze
 cD6TU+kJ4N8QfjAYyggn6vV0XJFFXaO0gEiBfnomC0R3NySCVKu+5jbdehIX/MdyupMCjKjrZ
 0hvBIwYlVEIV5N81BZyOSBdNpTxIWZrc1OmR4VdnZoY+993IJe/5cjp1UZeX7cfGL5azBpMgY
 a8A0mwNX6WaVDGsJga3h8H9Q1XG/Hmbj91V8ht+TctbkY+dK6IQqe3fIgel4ndrTNmtO5lA5Z
 vYC0im1fPBNGxYZbLFnx2sE27QiQjU/MbA/2uhRlyu/X5gTe0VXPnSKsSydVOH6YkbB4L+TZy
 pP4K8KYs9Tf8KvzLOtkS/XCUjHfFxQ7jKew0bROViMaNzQBmGDXIJnM76wd9eodqDyBfmQoXo
 BpI260wPKh8NY/aOs+VvS7MslV0oTHY3ObQsENsWcZTH8PW9KfIGe6SH59gYTWlQNGZgW186V
 Kva9UXmN6IYs+pkWvhhyeVFOHjeJzQRV5CG6Wnj6PG+MrTZfwHcKQnFjaxH6I8jA9hxd1J0b8
 C8cZolz32zFR4trrfKA57Ae0UiBos0ciOXUM+6VucLXV9ITxDH+pTiIwtp3KmJER3af1s4OH8
 hlK8nFl3y8H/7n3iJpQuwh53fWvl5QC6Fn6+DT+q4eBbbDANBgGgwdib9d7pjeNtR8/pB72ib
 qD9P3aqBDubXEFwYAj96epkA4aO1KRh7Jppsj1Zf4BdrQiSMa/psoGERGEh4vpEPvcfyyj735
 0HlI3BBgWOEtk3yPGpntQI/RZjv46awTROQRcTFI1/hjekjBQ6qfiYmM/ALV4FS49D0C3cmUW
 j6shuBbN2STQ/EYRem8BZYd7zaQQzuhBioBdPDht3H/7dP1AQGXw2UicHupxK2xVmj7gDPx93
 GN12HrDvlV1ROGBGUx/8QBVoaQ633zc9dgwjNBM/qP8WXLqHtnBeAbQIVDX5KXEk7ojmsTSVP
 GmaJusnRG99SRXPe/Ni6GQQDE5rOWrCQqCIy1OwiJ9sMQGJpWAqn0Rmtg==
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

Prevent that drivers configure a virtual screen resolution smaller than
the physical screen resolution.  This is important, because otherwise we
may access memory outside of the graphics memory area.

Give a kernel WARNing and show the driver name to help locating the buggy
driver.

Signed-off-by: Helge Deller <deller@gmx.de>
Cc: stable@vger.kernel.org # v5.4+
=2D--
 drivers/video/fbdev/core/fbmem.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/video/fbdev/core/fbmem.c b/drivers/video/fbdev/core/f=
bmem.c
index 160389365a36..e8f06d26803c 100644
=2D-- a/drivers/video/fbdev/core/fbmem.c
+++ b/drivers/video/fbdev/core/fbmem.c
@@ -1016,6 +1016,18 @@ fb_set_var(struct fb_info *info, struct fb_var_scre=
eninfo *var)
 	if (ret)
 		return ret;

+	/* make sure virtual resolution >=3D physical resolution */
+	if (WARN_ON(var->xres_virtual < var->xres)) {
+		pr_warn("fbcon: Fix up invalid xres %d for %s\n",
+			var->xres_virtual, info->fix.id);
+		var->xres_virtual =3D var->xres;
+	}
+	if (WARN_ON(var->yres_virtual < var->yres)) {
+		pr_warn("fbcon: Fix up invalid yres %d for %s\n",
+			var->yres_virtual, info->fix.id);
+		var->yres_virtual =3D var->yres;
+	}
+
 	if ((var->activate & FB_ACTIVATE_MASK) !=3D FB_ACTIVATE_NOW)
 		return 0;

=2D-
2.35.3

