Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6951F87E4D1
	for <lists+dri-devel@lfdr.de>; Mon, 18 Mar 2024 09:11:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB6B510F489;
	Mon, 18 Mar 2024 08:11:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx01.omp.ru (mx01.omp.ru [90.154.21.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBDC910F46F
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Mar 2024 08:11:53 +0000 (UTC)
Received: from msexch01.omp.ru (10.188.4.12) by msexch01.omp.ru (10.188.4.12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.1258.12; Mon, 18 Mar
 2024 11:11:48 +0300
Received: from msexch01.omp.ru ([fe80::485b:1c4a:fb7f:c753]) by
 msexch01.omp.ru ([fe80::485b:1c4a:fb7f:c753%5]) with mapi id 15.02.1258.012;
 Mon, 18 Mar 2024 11:11:48 +0300
From: Roman Smirnov <r.smirnov@omp.ru>
To: Helge Deller <deller@gmx.de>, Daniel Vetter <daniel@ffwll.ch>
CC: Thomas Zimmermann <tzimmermann@suse.de>, Sergey Shtylyov
 <s.shtylyov@omp.ru>, Karina Yankevich <k.yankevich@omp.ru>,
 "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "lvc-project@linuxtesting.org" <lvc-project@linuxtesting.org>
Subject: Re: [PATCH v2] fbmon: prevent division by zero in
 fb_videomode_from_videomode()
Thread-Topic: [PATCH v2] fbmon: prevent division by zero in
 fb_videomode_from_videomode()
Thread-Index: AQHabwRs4YTUR6hF/0+sHxdCA/um27E4WY8AgATgDMM=
Date: Mon, 18 Mar 2024 08:11:48 +0000
Message-ID: <9688d1d453b0472cb90f5e2151cbd2f8@omp.ru>
References: <20240305135150.23240-1-r.smirnov@omp.ru>,
 <64bbc4dd-b617-4f3d-809e-763bedf37fb7@gmx.de>
In-Reply-To: <64bbc4dd-b617-4f3d-809e-763bedf37fb7@gmx.de>
Accept-Language: ru-RU, en-US
Content-Language: ru-RU
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.188.4.41]
x-kse-serverinfo: msexch01.omp.ru, 9
x-kse-antivirus-interceptor-info: scan successful
x-kse-antivirus-info: Clean, bases: 3/18/2024 7:14:00 AM
x-kse-attachment-filter-triggered-rules: Clean
x-kse-attachment-filter-triggered-filters: Clean
x-kse-bulkmessagesfiltering-scan-result: InTheLimit
Content-Type: text/plain; charset="koi8-r"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
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

On Fri, 15 Mar 2024 09:44:08 +0100 Helge Deller wrote:
> On 3/5/24 14:51, Roman Smirnov wrote:
> > The expression htotal * vtotal can have a zero value on
> > overflow.
>=20
> I'm not sure if thos always results in zero in kernel on overflow.
> Might be architecture-depended too, but let's assume it
> can become zero, ....
>=20
> > It is necessary to prevent division by zero like in
> > fb_var_to_videomode().
> >
> > Found by Linux Verification Center (linuxtesting.org) with Svace.
> >
> > Signed-off-by: Roman Smirnov <r.smirnov@omp.ru>
> > Reviewed-by: Sergey Shtylyov <s.shtylyov@omp.ru>
> > ---
> >   V1 -> V2: Replaced the code of the first version with a check.
> >
> >   drivers/video/fbdev/core/fbmon.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/video/fbdev/core/fbmon.c b/drivers/video/fbdev/cor=
e/fbmon.c
> > index 79e5bfbdd34c..b137590386da 100644
> > --- a/drivers/video/fbdev/core/fbmon.c
> > +++ b/drivers/video/fbdev/core/fbmon.c
> > @@ -1344,7 +1344,7 @@ int fb_videomode_from_videomode(const struct vide=
omode *vm,
> >        vtotal =3D vm->vactive + vm->vfront_porch + vm->vback_porch +
> >                 vm->vsync_len;
> >        /* prevent division by zero */
> > -     if (htotal && vtotal) {
> > +     if (htotal && vtotal && (vm->pixelclock / htotal >=3D vtotal)) {
>=20
> why don't you then simply check for
>         if .. ((htotal * vtotal) =3D=3D 0) ...
> instead?
>=20
> Helge

Thomas Zimmermann from the previous discussion said:

On Tue, 5 Mar 2024 11:18:05 +0100 Thomas Zimmerman wrote:
> Maybe use
>
>    if (htotal && vtotal && (vm->pixelclock / htotal >=3D vtotal))
>
> for the test. That rules out overflowing multiplication and sets
> refresh to 0 in such cases.

This prevents overflow, which is also a problematic case.=
