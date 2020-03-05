Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DACFB17B803
	for <lists+dri-devel@lfdr.de>; Fri,  6 Mar 2020 09:04:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E47A66EC9A;
	Fri,  6 Mar 2020 08:03:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mo6-p00-ob.smtp.rzone.de (mo6-p00-ob.smtp.rzone.de
 [IPv6:2a01:238:20a:202:5300::11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C48EC6E39C
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Mar 2020 19:41:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1583437312;
 s=strato-dkim-0002; d=goldelico.com;
 h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=OZ5oxnYpzuUaR1GazaWO7w0lUaH0jA1Tfl/eGpTMdzU=;
 b=b2Quhyv5AbNLJ4Y5WYFnwSAckwEf7pftMhbABa4xtJKZQXN4r5rP6n+OMmQenubU0T
 /FIFJvJM7LzdEjMKW+EJ4shEfWka424+mVdTdeRoEz0lcoC+sKRc4Rj1t6Ye0oM7obCQ
 n/lbvyVdG6X3VoerBGPUc35yGYdKHunMiJNpNuPZjwE+QwJvUMhUHIY1KfBLd3Ta7CWB
 pm9x33S70VU3TkrXF5fkm9+HKBDxr+YzVoqsxC0/GJ0l34qqnHoVPDsVW3eikoKopBUi
 Hr0vHRu1JKqW6hdCCQhBGOhAaXMDoHaUeDrvK8A3OMCVCAhuriEVbFnQSDM52fVe6prT
 knEA==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj4Qpw9iZeHmMlw43rkA=="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box by smtp.strato.de (RZmta 46.2.0 DYNA|AUTH)
 with ESMTPSA id y0a02cw25JfiVL3
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve X9_62_prime256v1 with 256
 ECDH bits, eq. 3072 bits RSA))
 (Client did not present a certificate);
 Thu, 5 Mar 2020 20:41:44 +0100 (CET)
Subject: Re: [PATCH 24/33] drm/panel-simple: Fix dotclock for Ortustech
 COM37H3M
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
From: H. Nikolaus Schaller <hns@goldelico.com>
In-Reply-To: <CDD5B6AE-6711-4B81-87F9-8DBD067E33BD@goldelico.com>
Date: Thu, 5 Mar 2020 20:41:43 +0100
Message-Id: <C1BE9158-7D08-44D0-9699-4029806ABDE7@goldelico.com>
References: <20200302203452.17977-1-ville.syrjala@linux.intel.com>
 <20200302203452.17977-25-ville.syrjala@linux.intel.com>
 <4320E187-FAA1-4033-A02C-7DA1F9B68A52@goldelico.com>
 <20200303150336.GZ13686@intel.com>
 <CDD5B6AE-6711-4B81-87F9-8DBD067E33BD@goldelico.com>
To: =?iso-8859-1?Q?Ville_Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
X-Mailer: Apple Mail (2.3124)
X-Mailman-Approved-At: Fri, 06 Mar 2020 08:03:01 +0000
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
Cc: Discussions about the Letux Kernel <letux-kernel@openphoenux.org>,
 Sam Ravnborg <sam@ravnborg.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


> Am 03.03.2020 um 16:49 schrieb H. Nikolaus Schaller <hns@goldelico.com>:
> =

> Hi,
> =

>> Am 03.03.2020 um 16:03 schrieb Ville Syrj=E4l=E4 <ville.syrjala@linux.in=
tel.com>:
>> =

>>> I haven't looked into the driver code, but would it be
>>> possible to specify .clock =3D 0 (or leave it out) to
>>> calculate it bottom up? This would avoid such inconsistencies.
>> =

>> I'm going to remove .vrefresh entirely from the struct.
>> It'll just be calculated from the other timings as needed.
> =

> Ok!
> =

> Anyways we should fix the panel timings so that it is compatible to .vref=
resh =3D 60.
> =

> I'll give it a try and let you know.

Ok, here is a new parameter set within data sheet limits for both
panel variants:

static const struct drm_display_mode ortustech_com37h3m_mode  =3D {
	.clock =3D 22153,
	.hdisplay =3D 480,
	.hsync_start =3D 480 + 40,
	.hsync_end =3D 480 + 40 + 10,
	.htotal =3D 480 + 40 + 10 + 40,
	.vdisplay =3D 640,
	.vsync_start =3D 640 + 4,
	.vsync_end =3D 640 + 4 + 2,
	.vtotal =3D 640 + 4 + 2 + 4,
	.vrefresh =3D 60,
	.flags =3D DRM_MODE_FLAG_NVSYNC | DRM_MODE_FLAG_NHSYNC,
};

I have tested on our omap3 based board and didn't find an issue
so you can insert into your patch.

BR and thanks,
Nikolaus
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
