Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 96911B57D51
	for <lists+dri-devel@lfdr.de>; Mon, 15 Sep 2025 15:34:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF96D10E4C0;
	Mon, 15 Sep 2025 13:34:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="fyI3FnhQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 824CD10E4BF
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Sep 2025 13:34:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1757943260; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=bhJcqyqaJf6fbb3wRy49gzrnP/jNHvzkV3C6IbBWWbpj76HcJ30Im2V6QFjc3xr8WihnltlgvHoicCrcqFkBqpTCy5WD4+CpXQNwi1S4IOUbDievVhxqcDIpbv+xwM30SUDbjjGcN6tEltRyzMjGr4sGdnoD5UxkLMBIpbrMqug=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1757943260;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=FmQQaI5thj9GN9UIWV3zSwQzaVhJ4atEslX7ELWl7hI=; 
 b=JTjpnyG0DIu0VCtIBYr4vNMuWUKVfHYXvlgjK3f8XTqynZDRpLrFVLGYARLrx9S8omXl7IeL7LZj/rQTlKz/S+um16FWoqldrGJdl7l77ZDWBCA6mWDamfXGXcsYGr5wdCswbeN1xSB4VzYUHsc3UNOxpZrp0qcXIrzXdYO4gZs=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
 dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1757943260; 
 s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
 bh=FmQQaI5thj9GN9UIWV3zSwQzaVhJ4atEslX7ELWl7hI=;
 b=fyI3FnhQR5rKmaNNyvARvYaV2U4W3knN1mJ3Ej13dXI2ltCUB68fTvtj3BWR9hci
 2o9rwMOsfvsJFJgASAIkOA7DivNiyrvpwvJ0yPD7txUGWv2nm508GLYKT0TGnWRLtPL
 VCVR+V3Gxpa9bxqHObC70rrpPZHcl8XmPLygJypk=
Received: by mx.zohomail.com with SMTPS id 1757943257975999.7821234845057;
 Mon, 15 Sep 2025 06:34:17 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
To: Chia-I Wu <olvaffe@gmail.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, Jassi Brar <jassisinghbrar@gmail.com>,
 Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Chen-Yu Tsai <wenst@chromium.org>, kernel@collabora.com,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-pm@vger.kernel.org,
 linux-hardening@vger.kernel.org
Subject: Re: [PATCH v2 09/10] drm/panthor: devfreq: add pluggable devfreq
 providers
Date: Mon, 15 Sep 2025 15:09:38 +0200
Message-ID: <24083992.6Emhk5qWAg@workhorse>
In-Reply-To: <CAPaKu7TEN++z8r68k_4-iCyMLMthqJBUX35pgXupAHPdfttrYg@mail.gmail.com>
References: <20250912-mt8196-gpufreq-v2-0-779a8a3729d9@collabora.com>
 <20250912-mt8196-gpufreq-v2-9-779a8a3729d9@collabora.com>
 <CAPaKu7TEN++z8r68k_4-iCyMLMthqJBUX35pgXupAHPdfttrYg@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
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

On Saturday, 13 September 2025 00:53:50 Central European Summer Time Chia-I=
 Wu wrote:
> On Fri, Sep 12, 2025 at 11:38=E2=80=AFAM Nicolas Frattaroli
> <nicolas.frattaroli@collabora.com> wrote:
> <snipped>
> > diff --git a/drivers/gpu/drm/panthor/panthor_devfreq.h b/drivers/gpu/dr=
m/panthor/panthor_devfreq.h
> > index a891cb5fdc34636444f141e10f5d45828fc35b51..94c9768d5d038c4ba851692=
9edb565a1f13443fb 100644
> > --- a/drivers/gpu/drm/panthor/panthor_devfreq.h
> > +++ b/drivers/gpu/drm/panthor/panthor_devfreq.h
> > @@ -8,6 +8,7 @@
> >
> >  struct devfreq;
> >  struct thermal_cooling_device;
> > +struct platform_device;
> >
> >  struct panthor_device;
> >
> > @@ -43,6 +44,19 @@ struct panthor_devfreq {
> >         spinlock_t lock;
> >  };
> >
> > +struct panthor_devfreq_provider {
> > +       /** @dev: device pointer to the provider device */
> > +       struct device *dev;
> > +       /**
> > +        * @init: the provider's init callback that allocates a
> > +        * &struct panthor_devfreq, adds it to panthor, and adds a devf=
req
> > +        * device to panthor. Will be called during panthor's probe.
> > +        */
> > +       int (*init)(struct panthor_device *ptdev, struct device *dev);
> > +
> > +       struct list_head node;
> > +};
> On mt8196, we have performance-domains to replace several other
> properties: clocks, *-supply, power-domains, operating-points-v2.
> There are also quirks, such as GPU_SHADER_PRESENT should be masked by
> GF_REG_SHADER_PRESENT. It feels like that the scope of
> panthor_devfreq_provider is more broader, and at least the naming is
> not right.

True, though I'm still not entirely sure whether mtk_mfg needs to do
the GF_REG_SHADER_PRESENT thing. It's entirely possible this is just
an efuse value the GPUEB reads and then puts in SRAM for us, and we
could simply read this efuse cell ourselves. Among a list of questions
about the hardware we're sending to MediaTek, whether this is an efuse
cell and where it is placed is one of them.

If it turns out to be the case that we can simply read an efuse in
panthor in the other mt8196 integration code, then we can keep
mtk_mfg basically entirely focused on the devfreq-y part. I'd really
prefer this solution.

However, assuming we can't go down this path either because this is
not how the hardware works, or because MediaTek never replies, or
because someone doesn't like reading efuses in panthor, I think
generalising "devfreq_provider" to "performance_controller" or
something like that would be a good move.

In a way, the fused off core mask is part of the vague domain of
"performance", and it'll also allow us to extend it with other
things relevant to performance control in different vendor integration
logic designs. I'm thinking memory bandwidth control and job scheduling
preferences. E.g. if the interconnect tells us one core is spending a
lot of time waiting on the interconnect, maybe because a different
piece of the SoC that's active shares the same path on the
interconnect, we could then communicate a scheduling preference for
the other cores that have bandwidth headroom even if they are busier
in compute. Maybe this doesn't make sense though because interconnect
designs are fully switched these days or panthor's scheduler will
already figure this out from job completion times.

If any other SoC vendor or people working on hardware of those vendors
want to chime in and say whether they've got any other uses for
communicating more than just devfreq from glue logic to panthor, then
this would be a great time to do it, so that we can get this interface
right from the beginning.

> Another issue is I am not sure if we need to expose panthor_device
> internals to the provider. mtk_mfg accesses very few fields of
> panthor_device. It seems we can make the two less coupled.
>=20
> I might change my view as mtk_mfg evolves and requires tigher
> integration with panthor. But as is, I might prefer for mtk_mfg to
> live under drivers/soc/mediatek and provide a header for panthor to
> use in soc-specific path.

I'm not very confident it's possible to cleanly decouple them without
inventing a bunch of very panthor-and-mfg specific interfaces that
masquerade as general solutions in the process. It'd also mean I'd
have to duplicate all of `panthor_devfreq_get_dev_status` instead of
just being able to reuse it, unless that is also exposed in said
header file, which would need a better justification than "well there
is one other user of it and we're trying to couple it more loosely".

I know that it's almost independent, but unfortunately, even a tiny
dependency between the two will mean that mediatek_mfg will need to
know about panthor.

Other things needed from panthor are the pdevfreq->gov_data, and
the panthor struct device* itself, as well as stuff like "fast_rate"
in the panthor_device struct.

In the future, we may want to expand this driver with governors
beyond SIMPLE_ONDEMAND, based on the job completion duration targets
we can communicate to the GPUEB. That may either make the driver
more tightly coupled or more loosely coupled, I don't really know
yet.

One advantage of looking to completely decouple them (though again,
I doubt that's possible at the moment without questionable refactors)
could be that we could also support panfrost devices that need this.

>=20
>=20
> > +
> >
> >  int panthor_devfreq_init(struct panthor_device *ptdev);
> >
> > @@ -57,4 +71,6 @@ int panthor_devfreq_get_dev_status(struct device *dev,
> >
> >  unsigned long panthor_devfreq_get_freq(struct panthor_device *ptdev);
> >
> > +int panthor_devfreq_register_provider(struct panthor_devfreq_provider =
*prov);
> > +
> >  #endif /* __PANTHOR_DEVFREQ_H__ */
> >
> > --
> > 2.51.0
> >
>=20




