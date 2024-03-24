Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2200A887D66
	for <lists+dri-devel@lfdr.de>; Sun, 24 Mar 2024 16:08:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D52910E0EB;
	Sun, 24 Mar 2024 15:08:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="CCaqs4Q0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3D7810E0EB
 for <dri-devel@lists.freedesktop.org>; Sun, 24 Mar 2024 15:08:44 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 8BB8D60BCA;
 Sun, 24 Mar 2024 15:08:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE7ADC433C7;
 Sun, 24 Mar 2024 15:08:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1711292923;
 bh=jbSdBHS0w1eaicjduO3/4ltPjzKnV2+4/Gm18hBir+0=;
 h=Date:From:To:List-Id:Cc:Subject:In-Reply-To:References:From;
 b=CCaqs4Q0v54OS/qibjDzeR5rnTLCeMB5BEWL9FOQOm8nUsrsP4agxz9UeijgZT7BG
 4MKSbYfhrQ29CGt+4vnpliHU74QTU5qGLG+bJ0dnax0OIzumnGe5d79tXGVUDVMCwA
 SUnGl4wT7Kx7SgjiwWQGT8hc1XE8NU7wy5/lvXLsYw1SyVT+Lk0Y7KoBDoIr+Sq5kz
 G3RLG4eMVQAo0e9iXkjKdxwniW2P5X8xhO9Ro3uHGyprv5IKfuJrfyJjlUyZ06toot
 J/zg4uC6SCjy+mHbaghEESneDQeaLg4J7rdI5mJb4e8SPi2cU5WxgujzdHnBylvUEu
 2BTwaVwc1gecg==
Date: Sun, 24 Mar 2024 16:08:28 +0100
From: Marek =?UTF-8?B?QmVow7pu?= <kabel@kernel.org>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Jonathan.Cameron@huawei.com, Laurent.pinchart@ideasonboard.com,
 airlied@gmail.com, andrzej.hajda@intel.com, arm@kernel.org, arnd@arndb.de,
 bamv2005@gmail.com, brgl@bgdev.pl, daniel@ffwll.ch, davem@davemloft.net,
 dianders@chromium.org, dri-devel@lists.freedesktop.org,
 eajames@linux.ibm.com, gaurav.jain@nxp.com, gregory.clement@bootlin.com,
 hdegoede@redhat.com, herbert@gondor.apana.org.au, horia.geanta@nxp.com,
 james.clark@arm.com, james@equiv.tech, jdelvare@suse.com,
 jernej.skrabec@gmail.com, jonas@kwiboo.se, linus.walleij@linaro.org,
 linux-crypto@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux@roeck-us.net, maarten.lankhorst@linux.intel.com,
 mazziesaccount@gmail.com, mripard@kernel.org, naresh.solanki@9elements.com,
 neil.armstrong@linaro.org, pankaj.gupta@nxp.com,
 patrick.rudolph@9elements.com, rfoss@kernel.org, soc@kernel.org,
 tzimmermann@suse.de
Subject: Re: [PATCH v5 08/11] devm-helpers: Add resource managed version of
 debugfs directory create function
Message-ID: <20240324160828.7f873a96@thinkpad>
In-Reply-To: <69264f8a-a113-4d49-b8a6-fb9e858584e4@wanadoo.fr>
References: <20240323164359.21642-1-kabel@kernel.org>
 <20240323164359.21642-9-kabel__6885.49310886941$1711212291$gmane$org@kernel.org>
 <f7c64a5a-2abc-4b7e-95db-7ca57b5427c0@wanadoo.fr>
 <20240323222506.4ffbdd71@thinkpad>
 <69264f8a-a113-4d49-b8a6-fb9e858584e4@wanadoo.fr>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.39; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, 24 Mar 2024 10:21:28 +0100
Christophe JAILLET <christophe.jaillet@wanadoo.fr> wrote:

> Le 23/03/2024 =C3=A0 22:25, Marek Beh=C3=BAn a =C3=A9crit=C2=A0:
> > On Sat, 23 Mar 2024 22:10:40 +0100
> > Christophe JAILLET <christophe.jaillet@wanadoo.fr> wrote:
> >  =20
>=20
> ...
>=20
> >>>    static int pvt_ts_dbgfs_create(struct pvt_device *pvt, struct devi=
ce *dev)
> >>>    {
> >>> -	pvt->dbgfs_dir =3D debugfs_create_dir(dev_name(dev), NULL);
> >>> +	pvt->dbgfs_dir =3D devm_debugfs_create_dir(dev, dev_name(dev), NULL=
);
> >>> +	if (IS_ERR(pvt->dbgfs_dir))
> >>> +		return PTR_ERR(pvt->dbgfs_dir); =20
> >>
> >> Not sure if the test and error handling should be added here.
> >> *If I'm correct*, functions related to debugfs already handle this case
> >> and just do nothing. And failure in debugfs related code is not
> >> considered as something that need to be reported and abort a probe fun=
ction.
> >>
> >> Maybe the same other (already existing) tests in this patch should be
> >> removed as well, in a separated patch. =20
> >=20
> > Functions related to debugfs maybe do, but devm_ resource management
> > functions may fail to allocate release structure, and those errors need
> > to be handled, AFAIK. =20
>=20
> I would say no.
> If this memory allocation fails, then debugfs_create_dir() will not be=20
> called, but that's not a really big deal if the driver itself can still=20
> run normally without it.

debugfs_create_dir() will always be called. Resource allocation is done
afterwards, and if it fails, then the created dir will be removed.

But now I don't know what to do, because yes, it seems that the debugfs
errors are being ignored at many places...

>=20
> Up to you to leave it as-is or remove what I think is a useless error=20
> handling.
> At least, maybe it could be said in the commit log, so that maintainers=20
> can comment on it, if they don't spot the error handling you introduce.
>=20
> CJ
>=20
> >=20
> > Marek
> >  =20
>=20

