Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B119219963
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jul 2020 09:08:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFB8B6EA3C;
	Thu,  9 Jul 2020 07:05:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from script.cs.helsinki.fi (script.cs.helsinki.fi [128.214.11.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D97DD6E11E
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jul 2020 13:46:20 +0000 (UTC)
X-DKIM: Courier DKIM Filter v0.50+pk-2017-10-25 mail.cs.helsinki.fi Wed,
 08 Jul 2020 16:46:18 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cs.helsinki.fi;
 h=date:from:to:cc:subject:in-reply-to:message-id:references
 :mime-version:content-type:content-id; s=dkim20130528; bh=awTCU/
 E1F8AYEGzQtyDg5Z6lb8ussm3bjtld0DbVbaM=; b=HMfi5i0P1A4Az0bU/zikuo
 3nENrfgCYzx7MuVAPvS81ZESs5qRWT1zA3PeFJs8THMUDFOkurnZ4HC1e20GhP9X
 Hd2l6y4qUHncwrRWH+XF+diRjJ5rGKpWOve+Qg07RLV++S7vS1u+LKzw+ZJhRhaM
 poZrhNrH/KJhaRRsXWV88=
Received: from whs-18.cs.helsinki.fi (whs-18.cs.helsinki.fi [128.214.166.46])
 (TLS: TLSv1/SSLv3,256bits,AES256-GCM-SHA384)
 by mail.cs.helsinki.fi with ESMTPS; Wed, 08 Jul 2020 16:46:18 +0300
 id 00000000005A014E.000000005F05CE2A.00002DD1
Date: Wed, 8 Jul 2020 16:46:18 +0300 (EEST)
From: "=?ISO-8859-15?Q?Ilpo_J=E4rvinen?=" <ilpo.jarvinen@cs.helsinki.fi>
X-X-Sender: ijjarvin@whs-18.cs.helsinki.fi
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: drm/ast something ate high-res modes (5.3->5.6 regression)
In-Reply-To: <f2b36a2e-baf7-ea23-fdb5-bfb7c54c0f4f@suse.de>
Message-ID: <alpine.DEB.2.20.2007081638020.12041@whs-18.cs.helsinki.fi>
References: <alpine.DEB.2.20.2007081246050.12041@whs-18.cs.helsinki.fi>
 <f2b36a2e-baf7-ea23-fdb5-bfb7c54c0f4f@suse.de>
User-Agent: Alpine 2.20 (DEB 67 2015-01-07)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="=_script-11752-1594215978-0001-2"
Content-ID: <alpine.DEB.2.20.2007081644390.12041@whs-18.cs.helsinki.fi>
X-Mailman-Approved-At: Thu, 09 Jul 2020 07:05:03 +0000
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is a MIME-formatted message.  If you see this text it means that your
E-mail software does not support MIME-formatted messages.

--=_script-11752-1594215978-0001-2
Content-Type: text/plain; charset="iso-8859-15"
Content-Transfer-Encoding: quoted-printable
Content-ID: <alpine.DEB.2.20.2007081644391.12041@whs-18.cs.helsinki.fi>

On Wed, 8 Jul 2020, Thomas Zimmermann wrote:

> Hi
>=20
> Am 08.07.20 um 12:05 schrieb Ilpo J=E4rvinen:
> > Hi,
> >=20
> > After upgrading kernel from 5.3 series to 5.6.16 something seems to=20
> > prevent me from achieving high resolutions with the ast driver.
>=20
> Thanks for reporting. It's not a bug, but a side effect of atomic
> modesetting.
>=20
> During pageflips, the old code used to kick out the currently displayed
> framebuffer and then load in the new one. If that failed, the display
> went garbage.
>=20
> In v5.6-rc1, we merged atomic modesetting for ast. This means that
> screen updates are more reliable, but we have to over-commit resources.
> Specifically, we have to reserve space for two buffers in video memory
> while a pageflip happens. 1920x1200@32 are ~9MiB of framebuffer memory.
> If your device has 16 MiB of VRAM, there's no space left for the second
> framebuffer. Hence, the resolution is no longer supported.
>=20
> On the positive side, you can now use Wayland compositors with ast.
> Atomic modesetting adds the necessary interfaces.

Ok, thanks for the info although it's quite disappointing (not the first=20
time to lose features with kms, migrating to it made me to lose dpms) ;-)=
.

As it's quite annoying to lose a high resolution mode (or be stuck in=20
some old kernel), would it be technically feasible to make the framebuffe=
r=20
allocation asymmetrical? That is, the switch to high-res mode would get
rejected when it would be into the smaller of the two buffers but not whe=
n=20
the arrangement is the other way around?


--=20
 i.
--=_script-11752-1594215978-0001-2
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--=_script-11752-1594215978-0001-2--
