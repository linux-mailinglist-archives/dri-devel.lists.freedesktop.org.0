Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC82986BCB1
	for <lists+dri-devel@lfdr.de>; Thu, 29 Feb 2024 01:20:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F03DF10E00E;
	Thu, 29 Feb 2024 00:20:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="jLpmNmzj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com
 [209.85.208.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A00410E00E
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Feb 2024 00:20:53 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id
 4fb4d7f45d1cf-5656e5754ccso526890a12.0
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Feb 2024 16:20:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1709166048; x=1709770848;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vHrCJ54ZMhXBbaJsSkVO4G57dmkhBIGT/ize3+TH55Y=;
 b=jLpmNmzjzt/cSF325wLK4bSh7dYEG2Xk23H+kVJcrdVR2n+YgBFjiYadIsSl6jrVXI
 vzVB4WSXNZ+sKRkNovuoUIxhPUd6/D3dzQkMtyhzlKn+1/U4NyjuYp9PZq8c1bI3jStk
 e9j70TDngME5X3frUgZta6gmTt4i8e7P9lT3s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709166048; x=1709770848;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vHrCJ54ZMhXBbaJsSkVO4G57dmkhBIGT/ize3+TH55Y=;
 b=HtKoP05ExmmRsvs2iwftpiv76/Hr/UlF9PL4PRaPisOO2a4sAR3w7qelmDk8Pt4lpI
 b/xJNba2ZyTmRZfcyKLm2qzMvs+jJFjAdPulB3czeJ3EeVQ1moT1OqjMtn6iCJZ6pLWG
 evoYiAcfaMAe4z0oYC8IYCgJwCPHC6exiOIYWGv+jRD3U09NSegCYyh6LU88iZ8jwS8z
 g304x6Ez/tt3CY4feq9K1zPIVo08EYiJ/laQ+Jpo0UDZKMG3zYK/VTPsRUqswjuKnyTo
 PVtYw4FnPPHrHA9Cznyh5Hm4/EZROIwl6bTGb3Sk7AVCCw8Xl7SAgYGOTWxFkfwdacPo
 zgvQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWo0HOOmnr1c80tny96nJ14KCGWtxxuTdiRCxtnBToPgkx3p1v8zxC11uMPhluAg+MiJhqBa9bD3y7+TwB4oeAlMzZvfkp2gKqtcE55LZeU
X-Gm-Message-State: AOJu0YyKIrFiNeTqEdtJx1n7Wg+0y82hEnuxnwGt1y/uf7+F9Z9RnPHu
 pmdWELJBoV0OzsEcYlJ/l8dMnkwXG5epyUcRmRj7dYWySs4wkvBY4k3ZTozuJj8dAE92rZ0VRbs
 uMPxv
X-Google-Smtp-Source: AGHT+IHZ8BJwZlcOtgk8Zhjx8XGwiloQsUhxFFWr45FNNa1OvnvUnSyNaEqlonuPUvVhEA2XpbtqXw==
X-Received: by 2002:a05:6402:2689:b0:565:dfac:a686 with SMTP id
 w9-20020a056402268900b00565dfaca686mr423906edd.38.1709166048298; 
 Wed, 28 Feb 2024 16:20:48 -0800 (PST)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com.
 [209.85.128.41]) by smtp.gmail.com with ESMTPSA id
 h26-20020aa7c95a000000b005663b0d7243sm56650edt.83.2024.02.28.16.20.47
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Feb 2024 16:20:47 -0800 (PST)
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-4129a748420so34365e9.0
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Feb 2024 16:20:47 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCW4CUT4IYA1VC5KQkzqB0rEZuGavw4D3QhktP+LHhxQQHImYqzuRGyOJxLSbZCIrtrss22gxnOM2FNweeYLlhf85Ols6Ict0I/r5S5tpXHq
X-Received: by 2002:a05:600c:3d90:b0:412:ba6c:8067 with SMTP id
 bi16-20020a05600c3d9000b00412ba6c8067mr1256wmb.5.1709166047079; Wed, 28 Feb
 2024 16:20:47 -0800 (PST)
MIME-Version: 1.0
References: <20240223223958.3887423-1-hsinyi@chromium.org>
 <20240223223958.3887423-2-hsinyi@chromium.org>
 <87wmqqjmt9.fsf@intel.com>
 <CAJMQK-jSPg6vU3SLmRy7zwNHJ4yqO2hT6RaiYxA4ifZ7CzwD9Q@mail.gmail.com>
In-Reply-To: <CAJMQK-jSPg6vU3SLmRy7zwNHJ4yqO2hT6RaiYxA4ifZ7CzwD9Q@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 28 Feb 2024 16:20:31 -0800
X-Gmail-Original-Message-ID: <CAD=FV=WU-2yystd40e+g9VNDNTiv5c=nP0uQg-AR03o7UGMTdA@mail.gmail.com>
Message-ID: <CAD=FV=WU-2yystd40e+g9VNDNTiv5c=nP0uQg-AR03o7UGMTdA@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm_edid: Add a function to get EDID base block
To: Hsin-Yi Wang <hsinyi@chromium.org>
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
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

On Tue, Feb 27, 2024 at 5:27=E2=80=AFPM Hsin-Yi Wang <hsinyi@chromium.org> =
wrote:
>
> On Tue, Feb 27, 2024 at 1:09=E2=80=AFAM Jani Nikula <jani.nikula@linux.in=
tel.com> wrote:
> >
> > On Fri, 23 Feb 2024, Hsin-Yi Wang <hsinyi@chromium.org> wrote:
> > > It's found that some panels have variants that they share the same pa=
nel id
> > > although their EDID and names are different. Besides panel id, now we=
 need
> > > the hash of entire EDID base block to distinguish these panel variant=
s.
> > >
> > > Add drm_edid_get_base_block to returns the EDID base block, so caller=
 can
> > > further use it to get panel id and/or the hash.
> >
> > Please reconsider the whole approach here.
> >
> > Please let's not add single-use special case functions to read an EDID
> > base block.
> >
> > Please consider reading the whole EDID, using the regular EDID reading
> > functions, and use that instead.
> >
> > Most likely you'll only have 1-2 blocks anyway. And you might consider
> > caching the EDID in struct panel_edp if reading the entire EDID is too
> > slow. (And if it is, this is probably sensible even if the EDID only
> > consists of one block.)
> >
> > Anyway, please do *not* merge this as-is.
> >
>
> hi Jani,
>
> I sent a v2 here implementing this method:
> https://lore.kernel.org/lkml/20240228011133.1238439-2-hsinyi@chromium.org=
/
>
> We still have to read edid twice due to:
> 1. The first caller is in panel probe, at that time, connector is
> still unknown, so we can't update connector status (eg. update
> edid_corrupt).
> 2. It's possible that the connector can have some override
> (drm_edid_override_get) to EDID, that is still unknown during the
> first read.

I'll also comment in Hsin-Yi's v2, but given Hsin-Yi's digging and the
fact that we can't cache the EDID (because we don't yet have a
"drm_connector"), I'd much prefer Hsin-Yi's solution here from v1 that
allows reading just the first block. If we try to boot a device with a
multi-block EDID we're now wastefully reading all the blocks of the
EDID twice at bootup which will slow boot time.

If you can see a good solution to avoid reading the EDID twice then
that would be amazing, but if not it seems like we should go back to
what's here in v1. What do you think? Anyone else have any opinions?



-Doug
