Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 15C7E178BCD
	for <lists+dri-devel@lfdr.de>; Wed,  4 Mar 2020 08:48:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 615456EAE5;
	Wed,  4 Mar 2020 07:47:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mo6-p02-ob.smtp.rzone.de (mo6-p02-ob.smtp.rzone.de
 [IPv6:2a01:238:20a:202:5302::6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79CAB895F5
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Mar 2020 15:49:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1583250567;
 s=strato-dkim-0002; d=goldelico.com;
 h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=6tCoOyoCEMAe0xvuKwk2JcCMh80WaP9gthC1gTS+IzI=;
 b=atihIDF9mkG+VNVgg6dHajgvXJ+uB4ylj42UUb/wQYbwBjAAR1ouo7hiX1fZVAd2cU
 2a+WK3ulDsJqGEvgHDb0uLgw7Vyh8b5hqYkJidLxnpOaan00zxgOrs/oQ8qiZWds69CY
 zH9r/GkKjCg1+nqJ4U/ESjt3r8RYhrAOgRKoLPJC6QYFUApaE2A5ka2OG1Qf4R5qSsZb
 oFp5vs4vH5VGkei8IFnUWvXcepYXrgZlYMS7OV1Ns9VonMmMnzY1ARHWl72pzGfXWIge
 WxhWHuxh7BHHNVHGPmmBPWBdO0mEXpp73+WU6CFPKcWf+zzQnpaFf7phfydCnt8TQB81
 CD5w==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj7wpz8NMGHPrpwDGvxw=="
X-RZG-CLASS-ID: mo00
Received: from mbp-13-nikolaus.fritz.box
 by smtp.strato.de (RZmta 46.2.0 DYNA|AUTH)
 with ESMTPSA id y0a02cw23FnLK5L
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve X9_62_prime256v1 with 256
 ECDH bits, eq. 3072 bits RSA))
 (Client did not present a certificate);
 Tue, 3 Mar 2020 16:49:21 +0100 (CET)
Subject: Re: [PATCH 24/33] drm/panel-simple: Fix dotclock for Ortustech
 COM37H3M
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
From: "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <20200303150336.GZ13686@intel.com>
Date: Tue, 3 Mar 2020 16:49:21 +0100
Message-Id: <CDD5B6AE-6711-4B81-87F9-8DBD067E33BD@goldelico.com>
References: <20200302203452.17977-1-ville.syrjala@linux.intel.com>
 <20200302203452.17977-25-ville.syrjala@linux.intel.com>
 <4320E187-FAA1-4033-A02C-7DA1F9B68A52@goldelico.com>
 <20200303150336.GZ13686@intel.com>
To: =?iso-8859-1?Q?Ville_Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
X-Mailer: Apple Mail (2.3124)
X-Mailman-Approved-At: Wed, 04 Mar 2020 07:47:28 +0000
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

Hi,

> Am 03.03.2020 um 16:03 schrieb Ville Syrj=E4l=E4 <ville.syrjala@linux.int=
el.com>:
> =

>> I haven't looked into the driver code, but would it be
>> possible to specify .clock =3D 0 (or leave it out) to
>> calculate it bottom up? This would avoid such inconsistencies.
> =

> I'm going to remove .vrefresh entirely from the struct.
> It'll just be calculated from the other timings as needed.

Ok!

Anyways we should fix the panel timings so that it is compatible to .vrefre=
sh =3D 60.

I'll give it a try and let you know.

BR and thanks,
Nikolaus

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
