Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A03E417F1C7
	for <lists+dri-devel@lfdr.de>; Tue, 10 Mar 2020 09:20:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CDF66E819;
	Tue, 10 Mar 2020 08:20:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mo6-p00-ob.smtp.rzone.de (mo6-p00-ob.smtp.rzone.de
 [IPv6:2a01:238:20a:202:5300::2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CAE989E26
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Mar 2020 13:04:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1583759039;
 s=strato-dkim-0002; d=goldelico.com;
 h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=N4kCbzLl0p2KhUN9IvoB6N4hWjyqEkU7njQAFmi2EJY=;
 b=HhkD6CYbplTxNlOZ2S7QSIU/yKjcQ4wD9aCyUEGcnQhNtAweFh3O3xi88kxEr7QfQY
 MgiKmLlejbDiZOh/SGga7IhWmz6WnCt1cMoTkn1IHDbKG8VuIf4BokiI2CSA1vlmIejN
 DiyFxGd8mE1WASnW20yOlMw+ISKloGtoWqfTopvJ9qSAUOLp3iOGskDzcvXREO25G/C+
 s4I41jv5n6hWIGQSBzkLfYQv8hrI4AVULbHZfLPO1rP4POZroozM6JF7cS/hJ4phv8Od
 nWK0l8RlcAqmaizcmhv93xLLqTPihvVAHL+TiJwRdurC0bt4/3a6/vnBGe77sZuryZjI
 rZJA==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBp5hRw/qOxWRk4dCyhrHdH4Oo6ddLfFTaYHsPrZrAc1bul7yqA54k="
X-RZG-CLASS-ID: mo00
Received: from [IPv6:2001:16b8:2643:2800:f942:4962:80bb:709]
 by smtp.strato.de (RZmta 46.2.0 AUTH) with ESMTPSA id y0a02cw29D3lh8k
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve X9_62_prime256v1 with 256
 ECDH bits, eq. 3072 bits RSA))
 (Client did not present a certificate);
 Mon, 9 Mar 2020 14:03:47 +0100 (CET)
Subject: Re: [PATCH 24/33] drm/panel-simple: Fix dotclock for Ortustech
 COM37H3M
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
From: "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <20200309130035.GV13686@intel.com>
Date: Mon, 9 Mar 2020 14:03:57 +0100
Message-Id: <EC094BF3-C112-4D6E-AC2B-D10327CE6C0A@goldelico.com>
References: <20200302203452.17977-1-ville.syrjala@linux.intel.com>
 <20200302203452.17977-25-ville.syrjala@linux.intel.com>
 <4320E187-FAA1-4033-A02C-7DA1F9B68A52@goldelico.com>
 <20200303150336.GZ13686@intel.com>
 <CDD5B6AE-6711-4B81-87F9-8DBD067E33BD@goldelico.com>
 <C1BE9158-7D08-44D0-9699-4029806ABDE7@goldelico.com>
 <20200309130035.GV13686@intel.com>
To: =?iso-8859-1?Q?Ville_Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
X-Mailer: Apple Mail (2.3124)
X-Mailman-Approved-At: Tue, 10 Mar 2020 08:19:05 +0000
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


> Am 09.03.2020 um 14:00 schrieb Ville Syrj=E4l=E4 <ville.syrjala@linux.int=
el.com>:
> =

> On Thu, Mar 05, 2020 at 08:41:43PM +0100, H. Nikolaus Schaller wrote:
>> =

>>> Am 03.03.2020 um 16:49 schrieb H. Nikolaus Schaller <hns@goldelico.com>:
>>> =

>>> Hi,
>>> =

>>>> Am 03.03.2020 um 16:03 schrieb Ville Syrj=E4l=E4 <ville.syrjala@linux.=
intel.com>:
>>>> =

>>>>> I haven't looked into the driver code, but would it be
>>>>> possible to specify .clock =3D 0 (or leave it out) to
>>>>> calculate it bottom up? This would avoid such inconsistencies.
>>>> =

>>>> I'm going to remove .vrefresh entirely from the struct.
>>>> It'll just be calculated from the other timings as needed.
>>> =

>>> Ok!
>>> =

>>> Anyways we should fix the panel timings so that it is compatible to .vr=
efresh =3D 60.
>>> =

>>> I'll give it a try and let you know.
>> =

>> Ok, here is a new parameter set within data sheet limits for both
>> panel variants:
>> =

>> static const struct drm_display_mode ortustech_com37h3m_mode  =3D {
>> 	.clock =3D 22153,
>> 	.hdisplay =3D 480,
>> 	.hsync_start =3D 480 + 40,
>> 	.hsync_end =3D 480 + 40 + 10,
>> 	.htotal =3D 480 + 40 + 10 + 40,
>> 	.vdisplay =3D 640,
>> 	.vsync_start =3D 640 + 4,
>> 	.vsync_end =3D 640 + 4 + 2,
>> 	.vtotal =3D 640 + 4 + 2 + 4,
>> 	.vrefresh =3D 60,
>> 	.flags =3D DRM_MODE_FLAG_NVSYNC | DRM_MODE_FLAG_NHSYNC,
>> };
>> =

>> I have tested on our omap3 based board and didn't find an issue
>> so you can insert into your patch.
> =

> Migth be better if you send that so we get proper attribution and
> you can explain the change properly in the commit message.

Ok, will do asap.

BR and thanks,
Nikolaus

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
