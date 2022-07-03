Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA980565B35
	for <lists+dri-devel@lfdr.de>; Mon,  4 Jul 2022 18:18:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D52DD10E4FC;
	Mon,  4 Jul 2022 16:14:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D100C10E04F
 for <dri-devel@lists.freedesktop.org>; Sun,  3 Jul 2022 13:54:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1656856438;
 bh=Q1r/EGrmwtKUHjgmpgr4aZKvbKZIT8jWTfsTYDq7PcY=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:References:In-Reply-To;
 b=MLy++WXNhWKATbU+Fj+q+Vf2osZzgbFPWnYprruOABHsMY/zd5VlYIORnZMpn0Iae
 xVD+1nTHhYaK/b7adPaUEylwosaio4jLYpxURkgcCr7tCKDzp46vHJ4XHsXEzCThlu
 /ZRX83ladPQXEvj4tJter3fPB7ccl/qBJRXywdSs=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from p100 ([92.116.162.245]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MWRRZ-1o69Gw3yAt-00Xr7q; Sun, 03
 Jul 2022 15:53:58 +0200
Date: Sun, 3 Jul 2022 15:53:56 +0200
From: Helge Deller <deller@gmx.de>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v2 3/4] fbmem: Prevent invalid virtual screen sizes in
 fb_set_var()
Message-ID: <YsGfdEO4lU+y2004@p100>
References: <20220701202352.559808-1-deller@gmx.de>
 <20220701202352.559808-4-deller@gmx.de>
 <CAMuHMdUTwM+y+yi5ASY9hQLgJD-4pjtStGA9m82853LmbdywOA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdUTwM+y+yi5ASY9hQLgJD-4pjtStGA9m82853LmbdywOA@mail.gmail.com>
X-Provags-ID: V03:K1:PaVwAzPnrut5i0MGXscUdxOBcoMYLSHRkoku29snSk22PmHcYcB
 JFvpTPvbLgJpxlNHdGRS0A/hT23FDqh6AQp++hdlC9rBMyqnseff6SXjGZE7aKZuKnM/ryG
 Nnc6E/zPEezRHJE5qi4uhBBKLQP6D0IIva9Cqw0mjqpeasy8p968iUm3QVwW4NzE/PCAVU1
 BpvLob/7qqtwkYk/ES+6A==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:NWCxymVssF4=:lcFUNau3Ogws1++iJq3ccr
 thY9lVejOqojiyLc7o2r114Aao2GCUus+LT8qR0pkkCqi7oCCEsw5QT6p2LOwWf2U5ZIxdwcU
 HapI8ul0RNE07KpJ/HhndoY7MDSuhwX3P0XSsuksX12HB3hMb79BMEtqpWxJK3Wbg7ggouIXI
 1tWMwcv60VIg6Tcg8klv5iPtKfjxBwXOSdNRo0pP2lQgGqfgUNYDqAjIRXP2iqzRjqshbKTR9
 Se73mVrkOldBC/8uVdwCC9XCbgacQ2RuZLG6ynBslF6aDM/HdSbr5seDycohikYfVR7PejWM+
 kZthXu7ys++FMIJnhQe1Hae8sa197CdNH3jKQ/NUlIC+hDnUAWa+rNnxJ+WmV8EpOQ/jgNth0
 VAEH35HRMlcQlrF5dJROOXR6ZJrQHaRMDa494XQXGgdR1PjSgkFNw4QUFH7A+AiK6+SEvUEL3
 O7faxkD/argP8F7+0fiNVss95v63w2qBmvbkOnv5VzndPpDQEjjZwVBZcGEeBvB5QJd3YPZLI
 6bS9C21u6K444xulQEvLAs4ipIehBwpGdx5hZy/bFIjUwlRfm/UMOL83ETgkwpgooUhcRCSKH
 ermQD2UYvZYPZBQk8X8HNZKLUL9GJe+9dpC0pmuF/c9v5LPu1elkErHxF66q/upIS+uQJSylV
 r4GKxcxcnvIhWx7trh7E7KZWtA1r3d1kg5kAFGPaW+rwsCVKEp0mcTSYad7VwHRkBe9Q3emhW
 U7386YsW9vtkMG3Af+ZvRiqPc3p31f5poRcvpW3YQrdr5VNhEQ5Rk/i3IZa6Dn1Zp5ylRVQgx
 zUdvJ+bPqJEx6jyfaR/udjFxDydmRnIxFUZ5pLpBLVwrckRV4TSZh7arGyAHqChArCctP5EPa
 HuTu8eXho2j9RzXD3FGH7vk+B11cFdlQmLJn0W9jpJxlmDoeL2jx/WAhkXXEak5IOWMCWSqSw
 4DyiEilR/24nUzPaAJJVg8/mV3JttYWOss2HcmO9+vz0x36fMsTr4gDmOLaKZUP4/BigIBWIX
 oWGuSiZ0CWXBE7qqH7krmufJqw9ITZjEphBwO6W/1F0MZWK3BY6wUiz6GxYOl86IEp71NcyN3
 F4Vsn+0nneodhUq9E2j/N5iZYtd1p4ZI4+isf+JkKn8guP0FtQIK7Nwjg==
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, Helge Deller <deller@gmx.de>,
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

* Geert Uytterhoeven <geert@linux-m68k.org>:
> > --- a/drivers/video/fbdev/core/fbmem.c
> > +++ b/drivers/video/fbdev/core/fbmem.c
> > @@ -1016,6 +1016,18 @@ fb_set_var(struct fb_info *info, struct fb_var_=
screeninfo *var)
> >         if (ret)
> >                 return ret;
> >
> > +       /* make sure virtual resolution >=3D physical resolution */
> > +       if (WARN_ON(var->xres_virtual < var->xres)) {
>
> WARN_ON_ONCE()?
> This does mean we would miss two or more buggy drivers in a single syste=
m.
>
> > +               pr_warn("fbcon: Fix up invalid xres %d for %s\n",
>
> xres_virtual?
>
> > +                       var->xres_virtual, info->fix.id);
> > +               var->xres_virtual =3D var->xres;
>
> I think it's better to not fix this up, but return -EINVAL instead.
> After all if we get here, we have a buggy driver that needs to be fixed.
>
> > +       }
> > +       if (WARN_ON(var->yres_virtual < var->yres)) {
> > +               pr_warn("fbcon: Fix up invalid yres %d for %s\n",
> > +                       var->yres_virtual, info->fix.id);
> > +               var->yres_virtual =3D var->yres;
> > +       }
>
> Same for yres.

Geert, thanks for your valuable feedback!

In general I don't like for this case any of the WARN_ON* functions.
They don't provide any useful info for us, dumps unneccessarily the
stack backtrace and would annoy existing users.

We know, that DRM drivers can't change the resolution. If we would leave
in any kind of warning, all DRM users will ask back - and we don't have
a solution for them. It's also no regression, because it didn't worked
before either.

But we want to detect fbdev drivers which behave badly - so we should
print that info with the driver name.

Below is a new patch which addresses this. The search for drm drivers
looks somewhat hackish - maybe someone can propose a better approach?

Thoughts?

Helge


=46rom 0f33e2a3730342ab85df372f80b4f61762fb1130 Mon Sep 17 00:00:00 2001
From: Helge Deller <deller@gmx.de>
Date: Wed, 29 Jun 2022 15:53:55 +0200
Subject: [PATCH] fbmem: Check virtual screen sizes in fb_set_var()

Verify that the fbdev or drm driver correctly adjusted the virtual screen
sizes. On failure report (in case of fbdev drivers) the failing driver.

Signed-off-by: Helge Deller <deller@gmx.de>
Cc: stable@vger.kernel.org # v5.4+

diff --git a/drivers/video/fbdev/core/fbmem.c b/drivers/video/fbdev/core/f=
bmem.c
index 160389365a36..9b75aa4405ee 100644
=2D-- a/drivers/video/fbdev/core/fbmem.c
+++ b/drivers/video/fbdev/core/fbmem.c
@@ -1016,6 +1016,21 @@ fb_set_var(struct fb_info *info, struct fb_var_scre=
eninfo *var)
 	if (ret)
 		return ret;

+	/* verify that virtual resolution >=3D physical resolution */
+	if (var->xres_virtual < var->xres ||
+	    var->yres_virtual < var->yres) {
+		/* drm drivers don't support mode changes yet. Do not report. */
+		if (strstr(info->fix.id, "drm"))
+			return -ENOTSUPP;
+
+		pr_warn("WARNING: fbcon: Driver %s missed to adjust virtual"
+			" screen size (%dx%d vs. %dx%d)\n",
+			info->fix.id,
+			var->xres_virtual, var->yres_virtual,
+			var->xres, var->yres);
+		return -EINVAL;
+	}
+
 	if ((var->activate & FB_ACTIVATE_MASK) !=3D FB_ACTIVATE_NOW)
 		return 0;

