Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C93D7C1C97D
	for <lists+dri-devel@lfdr.de>; Wed, 29 Oct 2025 18:52:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DB3310E802;
	Wed, 29 Oct 2025 17:52:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="tr8RjkwN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2812610E802
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Oct 2025 17:52:37 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 3C73960503;
 Wed, 29 Oct 2025 17:52:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3EBE6C4CEF7;
 Wed, 29 Oct 2025 17:52:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1761760355;
 bh=0YBScoJ8j4SEyGyzFWW4kdvZXQlp+HgJ7s1KzaPXNDA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=tr8RjkwNuP9TI9R6Dv4328MqMFROy/G1RzcO3D+YUqrzInGDBmSUn6dWtqJl4ViHD
 RwWjAcNHTuYjNFImMaLZE7bHMtLXm+2kE+086j9yN/NONlyNv8JHtglIkMWnZIsvXf
 FalyX9cBXS4k8sNIlnmP0ADnY+1FeeIECSsC9cBHU2OQvxRs1n47fq4Aw5G/1L3/mk
 tOweAgQRN+NTuyN2RWGuAyvQ1ujoSuPFwZRXNjuISPfWGGRGS+lo+DIcswLY7fy9u1
 4HxpKFB38E/VhrBd9r1GMZiiVY4DtPSzzpBeG4xRujhI9bX9uKWVgVyO3cFABWRley
 WU+A6rf3lbhTg==
Date: Wed, 29 Oct 2025 17:53:31 +0000
From: Daniel Thompson <danielt@kernel.org>
To: Junjie Cao <caojunjie650@gmail.com>
Cc: Lee Jones <lee@kernel.org>, Jingoo Han <jingoohan1@gmail.com>,
 Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Helge Deller <deller@gmx.de>,
 dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-fbdev@vger.kernel.org, Pengyu Luo <mitltlatltl@gmail.com>
Subject: Re: [PATCH 2/2] backlight: aw99706: Add support for Awinic AW99706
 backlight
Message-ID: <aQJUmx5elYOW2TvO@aspen.lan>
References: <20251026123923.1531727-1-caojunjie650@gmail.com>
 <20251026123923.1531727-3-caojunjie650@gmail.com>
 <aQDDjzl65dMZEnwM@aspen.lan>
 <CAK6c68h3Mc0=JbbbVAmo_cYeOR_T-_rRy5EacgYQh7HgQZOPBg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAK6c68h3Mc0=JbbbVAmo_cYeOR_T-_rRy5EacgYQh7HgQZOPBg@mail.gmail.com>
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

On Wed, Oct 29, 2025 at 07:49:35PM +0800, Junjie Cao wrote:
> On Tue, Oct 28, 2025 at 9:21 PM Daniel Thompson <danielt@kernel.org> wrote:
> >
> > On Sun, Oct 26, 2025 at 08:39:23PM +0800, Junjie Cao wrote:
> > > Add support for Awinic AW99706 backlight, which can be found in
> > > tablet and notebook backlight, one case is the Lenovo Legion Y700
> > > Gen4. This driver refers to the official datasheets and android
> > > driver, they can be found in [1].
> > >
> > > [1] https://www.awinic.com/en/productDetail/AW99706QNR
> > >
> > > Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
> > > Signed-off-by: Junjie Cao <caojunjie650@gmail.com>
> > > ---
> > > diff --git a/drivers/video/backlight/aw99706.c b/drivers/video/backlight/aw99706.c
> > > <snip>
> > > +static void aw99706_dt_parse(struct aw99706_device *aw)
> > > +{
> > > +     struct aw99706_dt_prop *prop;
> > > +     int ret, i;
> > > +
> > > +     for (i = 0; i < ARRAY_SIZE(aw99706_dt_props); i++) {
> > > +             prop = &aw99706_dt_props[i];
> > > +             ret = device_property_read_u32(aw->dev, prop->name,
> > > +                                            &prop->raw_val);
> > > +             if (ret < 0) {
> > > +                     dev_warn(aw->dev, "Missing property %s: %d\n",
> > > +                              prop->name, ret);
> >
> > Why is there a warning when an optional property is not present. A DT
> > not including an optional property needs no message at all.
> >
>
> They are mandatory in the downstream, and providing all properties is
> difficult sometimes, so I set a default value if one is missing. But
> one device may use a configuration different from the component
> vendor's. These default values may be not optimal, so I issue a
> warning for property missing. (I forgot to address it)

All sensible but to be clear...

From my point-of-view the driver should match the upstream bindings.
Either the properties are required (in which case missing them can be
dev_err() and/or fail to probe) or they are optional (in which case
there should be no warnings).

Similarly if missing values is likely to lead to very sub-optimal
behavior (or something that has a risk of over-current or component
failure) then consider making the options mandatory.


Daniel.
