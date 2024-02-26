Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 407BC8683C1
	for <lists+dri-devel@lfdr.de>; Mon, 26 Feb 2024 23:29:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4F9910E516;
	Mon, 26 Feb 2024 22:29:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="aIGp5dRd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com
 [209.85.218.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 943E710E516
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Feb 2024 22:29:35 +0000 (UTC)
Received: by mail-ej1-f52.google.com with SMTP id
 a640c23a62f3a-a28a6cef709so556487566b.1
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Feb 2024 14:29:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1708986572; x=1709591372;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vuIzu435dlmGo3lOGVsPepILsYzogjK0C5/lBC0KUtk=;
 b=aIGp5dRdbskqoPFZFPezWpXjKLIpJNpiEBiNmBXr9tqBAJFi4n0PXfq75a8Vy/X/Bk
 SM1TodKznuP4VCV06JoDTeOfsPTWLErhEy7z2x/C7g3jm3zJrItxSTo+OgI+xNMtZfd2
 7K6NjR5fzyhUX+IYjtDRPn/HdiXmAWR9GbRqM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708986572; x=1709591372;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vuIzu435dlmGo3lOGVsPepILsYzogjK0C5/lBC0KUtk=;
 b=T5VtiTVKeDPhdCVJ8n4UzEhVDrGJIgptYG/7i+hwgDJr/fYKXGGTKdrLHDRUgVknQx
 T4bO+3/m21sPvwSbQ3MuIwTWDeX0z1SWZbYswELOl1t7HV/HVubna/CcNYmlJimGoZ62
 OqIQ0788HSlrnaAHfe7nEYmW3gU7NNP79WCM6KqwDSs9ERStaMvNUV96dPP7f4/1QlOi
 jnEoo0eaqfNxGycbf0Bmcgi9gjz2G+iFJBf2902mmBdDcWKYBBjQ981L8hKEURqyYAm2
 PAuSmUhmIjRmPv7XDBwf1OORR3j19EWPaSZj/TO/TfItkSC8TTEdC+jEUWldELIF1o9O
 /m+Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWSvoea0ZtaV6B2zGt8pU0vh9eKaSFvLsuk/HaHJSqaKdy9EOl9RyGOff1BXJf6MEC5AxXBwnop/c2+S9YjbecUaXZyO0hxpn52DMBgMAAv
X-Gm-Message-State: AOJu0YwLOHfuvs6av4/+JtuJUTur5tJEfUv+kwTU+NfXiobF6exu7Hf4
 aqAwCTRpD5NQqQoO2+oscXxSzq2mFOoNsqvMR/9gBUIuPquJCWLTVRd3kYRAHdm4z0uL8nbXkBl
 pgSif
X-Google-Smtp-Source: AGHT+IFdPyEUuo50UufCZNrvmP+NROLP/Xpsw4woj0X4EBIV0AG3dOFPOde0ZCo9p5Mt4+gJBE/Vcg==
X-Received: by 2002:a17:906:f899:b0:a3f:804f:c1a4 with SMTP id
 lg25-20020a170906f89900b00a3f804fc1a4mr5757023ejb.74.1708986572393; 
 Mon, 26 Feb 2024 14:29:32 -0800 (PST)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com.
 [209.85.128.46]) by smtp.gmail.com with ESMTPSA id
 jx11-20020a170906ca4b00b00a3f480154a3sm155568ejb.65.2024.02.26.14.29.31
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Feb 2024 14:29:31 -0800 (PST)
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-412a2c2ce88so4465e9.1
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Feb 2024 14:29:31 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCXF7zzrl6SAsKajHlRif0xFe9jmtCDbSQfNLpZdwiH1JE3OKHmvzJCNAxOIdw5ZA5chUkZrpki1k52R/LCBnmVx00zW1pZqZDu1MGY0Byhs
X-Received: by 2002:a05:600c:1d8b:b0:412:a80e:a5cc with SMTP id
 p11-20020a05600c1d8b00b00412a80ea5ccmr28353wms.1.1708986571269; Mon, 26 Feb
 2024 14:29:31 -0800 (PST)
MIME-Version: 1.0
References: <20240223223958.3887423-1-hsinyi@chromium.org>
 <20240223223958.3887423-3-hsinyi@chromium.org>
In-Reply-To: <20240223223958.3887423-3-hsinyi@chromium.org>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 26 Feb 2024 14:29:17 -0800
X-Gmail-Original-Message-ID: <CAD=FV=Xs4V7ei4NW0T0x0Bq6_dQF6sZKvFSy2WGQFQsHae=61Q@mail.gmail.com>
Message-ID: <CAD=FV=Xs4V7ei4NW0T0x0Bq6_dQF6sZKvFSy2WGQFQsHae=61Q@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/panel: panel-edp: Match with panel hash for
 overridden modes
To: Hsin-Yi Wang <hsinyi@chromium.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Sam Ravnborg <sam@ravnborg.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
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

Hi,

On Fri, Feb 23, 2024 at 2:40=E2=80=AFPM Hsin-Yi Wang <hsinyi@chromium.org> =
wrote:
>
> It's found that some panels have variants that they share the same panel =
id
> although their EDID and names are different. One of the variants requires
> using overridden modes to resolve glitching issue as described in commit
> 70e0d5550f5c ("drm/panel-edp: Add auo_b116xa3_mode"). Other variants shou=
ld
> use the modes parsed from EDID.
>
> For example, AUO 0x405c B116XAK01.0, it has at least 2 different variants
> that EDID and panel name are different, but using the same panel id. One =
of
> the variants require using overridden mode. Same case for AUO 0x615c
> B116XAN06.1.
>
> Add such entries and use the hash of the EDID to match the panel needs th=
e
> overridden modes.

As pointed out in an offline discussion, it's possible that we might
want to "ignore" some of these bytes for the purpose of the CRC.
Specifically, we might want to ignore:
* byte 16 - Week of manufacture
* byte 17 - Year of manufacture
* byte 127 - Checksum

That way if a manufacturer actually is updating those numbers in
production we can still have one hash that captures all the panels. I
have no idea if manufacturers actually are, but IMO the hash of the
rest of the base block should be sufficient to differentiate between
different panels anyway. It would be easy to just zero out those 3
bytes before computing the CRC.

What do you think?


> @@ -758,13 +762,13 @@ static void panel_edp_parse_panel_timing_node(struc=
t device *dev,
>                 dev_err(dev, "Reject override mode: No display_timing fou=
nd\n");
>  }
>
> -static const struct edp_panel_entry *find_edp_panel(u32 panel_id);
> +static const struct edp_panel_entry *find_edp_panel(u32 panel_id, u32 pa=
nel_hash);
>
>  static int generic_edp_panel_probe(struct device *dev, struct panel_edp =
*panel)
>  {
>         struct panel_desc *desc;
>         void *base_block;
> -       u32 panel_id;
> +       u32 panel_id, panel_hash;
>         char vend[4];
>         u16 product_id;
>         u32 reliable_ms =3D 0;
> @@ -796,15 +800,17 @@ static int generic_edp_panel_probe(struct device *d=
ev, struct panel_edp *panel)
>         base_block =3D drm_edid_get_base_block(panel->ddc);
>         if (base_block) {
>                 panel_id =3D drm_edid_get_panel_id(base_block);
> +               panel_hash =3D crc32_le(~0, base_block, EDID_LENGTH) ^ 0x=
ffffffff;

Any reason you need to XOR with 0xffffffff?


> @@ -2077,13 +2098,32 @@ static const struct edp_panel_entry edp_panels[] =
=3D {
>         { /* sentinal */ }
>  };
>
> -static const struct edp_panel_entry *find_edp_panel(u32 panel_id)
> +/*
> + * Similar to edp_panels, this table lists panel variants that require u=
sing
> + * overridden modes but have the same panel id as one of the entries in =
edp_panels.
> + *
> + * Sort first by vendor, then by product ID.

Add ", then by hash" just in case we need it.


> +static const struct edp_panel_entry *find_edp_panel(u32 panel_id, u32 pa=
nel_hash)
>  {
>         const struct edp_panel_entry *panel;
>
> -       if (!panel_id)
> +       if (!panel_id || !panel_hash)
>                 return NULL;

IMO just remove the check above. Not sure why it was there in the
first place. Maybe I had it from some older version of the code?
Callers shouldn't be calling us with a panel ID / hash of 0 anyway,
and if they do they'll go through the loop and return NULL anyway.



-Doug
