Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A71086D03B
	for <lists+dri-devel@lfdr.de>; Thu, 29 Feb 2024 18:12:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 093C910E24F;
	Thu, 29 Feb 2024 17:12:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="jPb7cDDI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com
 [209.85.208.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28CEB10E4C7
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Feb 2024 17:12:02 +0000 (UTC)
Received: by mail-ed1-f42.google.com with SMTP id
 4fb4d7f45d1cf-564647bcdbfso1600082a12.2
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Feb 2024 09:12:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1709226717; x=1709831517;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NxpSjfrVdVSOexvPvV+MdNfT9diBzg4rPMFPF1MyWmU=;
 b=jPb7cDDIZykOt3hsq11n6fqBEfDdaJaZhRF0HgX2WQkMmabTMSWQSeOKmo5JFCZ1Ix
 cDixOZCAPJveuyTSstFrIN760OvNBn2hkBA7MP7mYh/0EwgS70gBScXNI8edtOwtIgb1
 DDHmiNg/VNyXV+gVELCTRHWGRJVsDrGD6JzEo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709226717; x=1709831517;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NxpSjfrVdVSOexvPvV+MdNfT9diBzg4rPMFPF1MyWmU=;
 b=hCgj9xqpZSur/M2hp76hCcfNwQj7gozB4hOFO8R5xcJ/cGkq1qczAolwt7osf99SAn
 zFTVMMcUnG6j6dNRlzNxl6I43AMO3rCM7GFAQMqGGPMetGx/YNthIEsJm+ZVpMymfYG+
 eokK3im8oh+N14ef68RggzCn4UWcYRsdlErI4YLDQ2ms1PFrP7wUbpN2T6wBbo1kQIZ1
 rYhleK4m2mtuMnpK4/H8jyF5AxW78lrrcDFzx1eETpWAYdGLUEJPodqvYmhDYWK7qG3Q
 7kD4C2Ypv+NBVDsgxG7VrfgvpvFPCr0hzb2tM+EvCQvtKXRW2g71RARfgjdEyd5JeKwo
 lJVw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVOB9wxJf9tWexYniGZDLXD07lKZpheUR+038A4+LKG1bd9iJHt8KgLWhB/MLrbS2nD6FhhKHGAhRut4FWMdxfj+YftKS+mPBHzQ3w2hAfV
X-Gm-Message-State: AOJu0YxpCgoUHaiJDy5RSI5ybRkrUQWNOLtXLD7fsbJ4scXMTbj9JC1A
 5bXMNO9igBvih55h2oCZunYZFLM2zrSbGRTZwW/Qer6KO6uotdmDVMP/qrQDG+QR//FqyjbI03f
 7/m07
X-Google-Smtp-Source: AGHT+IEx1fLeMjDIJMf+pjakZo4c9bmOukVD6c6m9C1FM9N9Uhs8X2wH5r6ikZvlQNXcVmLJ1B2Qeg==
X-Received: by 2002:a17:906:aad3:b0:a3f:db30:872a with SMTP id
 kt19-20020a170906aad300b00a3fdb30872amr1844463ejb.66.1709226716941; 
 Thu, 29 Feb 2024 09:11:56 -0800 (PST)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com.
 [209.85.128.44]) by smtp.gmail.com with ESMTPSA id
 vb7-20020a170907d04700b00a444567fbbfsm769588ejc.53.2024.02.29.09.11.55
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Feb 2024 09:11:56 -0800 (PST)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-4129a5f7b54so82985e9.1
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Feb 2024 09:11:55 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCWeyBXce/mrNWUw0GXWsWwQRajsegTnOSLSBBw4KtW4iLlmbgbkmz/UvOAHSeyUFCAe6wm2TAJE7n5LHzpLry/mSg1FLuQccsaI6Le6ofcm
X-Received: by 2002:a05:600c:5194:b0:412:c353:cefc with SMTP id
 fa20-20020a05600c519400b00412c353cefcmr45032wmb.0.1709226714821; Thu, 29 Feb
 2024 09:11:54 -0800 (PST)
MIME-Version: 1.0
References: <20240223223958.3887423-1-hsinyi@chromium.org>
 <20240223223958.3887423-2-hsinyi@chromium.org>
 <87wmqqjmt9.fsf@intel.com>
 <CAJMQK-jSPg6vU3SLmRy7zwNHJ4yqO2hT6RaiYxA4ifZ7CzwD9Q@mail.gmail.com>
 <CAD=FV=WU-2yystd40e+g9VNDNTiv5c=nP0uQg-AR03o7UGMTdA@mail.gmail.com>
 <87bk7z6x1w.fsf@intel.com>
In-Reply-To: <87bk7z6x1w.fsf@intel.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 29 Feb 2024 09:11:39 -0800
X-Gmail-Original-Message-ID: <CAD=FV=Wzm9Y7m9Q6KqO7yWdnc1xToaRMb2f1s2TQMJqpqVYLOg@mail.gmail.com>
Message-ID: <CAD=FV=Wzm9Y7m9Q6KqO7yWdnc1xToaRMb2f1s2TQMJqpqVYLOg@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm_edid: Add a function to get EDID base block
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Hsin-Yi Wang <hsinyi@chromium.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
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

On Thu, Feb 29, 2024 at 8:43=E2=80=AFAM Jani Nikula <jani.nikula@linux.inte=
l.com> wrote:
>
> On Wed, 28 Feb 2024, Doug Anderson <dianders@chromium.org> wrote:
> > Hi,
> >
> > On Tue, Feb 27, 2024 at 5:27=E2=80=AFPM Hsin-Yi Wang <hsinyi@chromium.o=
rg> wrote:
> >>
> >> On Tue, Feb 27, 2024 at 1:09=E2=80=AFAM Jani Nikula <jani.nikula@linux=
.intel.com> wrote:
> >> >
> >> > On Fri, 23 Feb 2024, Hsin-Yi Wang <hsinyi@chromium.org> wrote:
> >> > > It's found that some panels have variants that they share the same=
 panel id
> >> > > although their EDID and names are different. Besides panel id, now=
 we need
> >> > > the hash of entire EDID base block to distinguish these panel vari=
ants.
> >> > >
> >> > > Add drm_edid_get_base_block to returns the EDID base block, so cal=
ler can
> >> > > further use it to get panel id and/or the hash.
> >> >
> >> > Please reconsider the whole approach here.
> >> >
> >> > Please let's not add single-use special case functions to read an ED=
ID
> >> > base block.
> >> >
> >> > Please consider reading the whole EDID, using the regular EDID readi=
ng
> >> > functions, and use that instead.
> >> >
> >> > Most likely you'll only have 1-2 blocks anyway. And you might consid=
er
> >> > caching the EDID in struct panel_edp if reading the entire EDID is t=
oo
> >> > slow. (And if it is, this is probably sensible even if the EDID only
> >> > consists of one block.)
> >> >
> >> > Anyway, please do *not* merge this as-is.
> >> >
> >>
> >> hi Jani,
> >>
> >> I sent a v2 here implementing this method:
> >> https://lore.kernel.org/lkml/20240228011133.1238439-2-hsinyi@chromium.=
org/
> >>
> >> We still have to read edid twice due to:
> >> 1. The first caller is in panel probe, at that time, connector is
> >> still unknown, so we can't update connector status (eg. update
> >> edid_corrupt).
> >> 2. It's possible that the connector can have some override
> >> (drm_edid_override_get) to EDID, that is still unknown during the
> >> first read.
> >
> > I'll also comment in Hsin-Yi's v2, but given Hsin-Yi's digging and the
> > fact that we can't cache the EDID (because we don't yet have a
> > "drm_connector"), I'd much prefer Hsin-Yi's solution here from v1 that
> > allows reading just the first block. If we try to boot a device with a
> > multi-block EDID we're now wastefully reading all the blocks of the
> > EDID twice at bootup which will slow boot time.
> >
> > If you can see a good solution to avoid reading the EDID twice then
> > that would be amazing, but if not it seems like we should go back to
> > what's here in v1. What do you think? Anyone else have any opinions?
>
> I haven't replied so far, because I've been going back and forth with
> this. I'm afraid I don't really like either approach now. Handling the
> no connector case in v2 is a bit ugly too. :(
>
> Seems like you only need this to extend the panel ID with a hash. And
> panel-edp.c is the only user of drm_edid_get_panel_id(). And EDID quirks
> in drm_edid.c could theoretically hit the same problem you're solving.

Good point. That would imply that more of the logic could go into
"drm_edid.c" in case the EDID quirks code eventually needs it.


> So maybe something like:
>
>         u32 drm_edid_get_panel_id(struct i2c_adapter *adapter, u32 *hash)=
;
>
> or if you want to be fancy add a struct capturing both id and hash:
>
>         bool drm_edid_get_panel_id(struct i2c_adapter *adapter, struct dr=
m_edid_panel_id *id);
>
> And put the hash (or whatever mechanism you have) computation in
> drm_edid.c. Just hide it all in drm_edid.c, and keep the EDID interfaces
> neat.
>
> How would that work for you?

The problem is that Dmitry didn't like the idea of using a hash and in
v2 Hsin-Yi has moved to using the name of the display. ...except of
course that eDP panels don't always properly specify
"EDID_DETAIL_MONITOR_NAME". See the discussion [1]. If you want to see
some of the EDIDs involved, you can see Hsin-Yi's post [2]. The panels
included stuff like this:

    Alphanumeric Data String: 'AUO'
    Alphanumeric Data String: 'B116XAN04.0 '

The fact that there is more than one string in there makes it hard to
just "return" the display name in a generic way. The way Hsin-Yi's
code was doing it was that it would consider it a match if the panel
name was in any of the strings...

How about this as a solution: we change drm_edid_get_panel_id() to
return an opaque type (struct drm_edid_panel_id_blob) that's really
just the first block of the EDID but we can all pretend that it isn't.
Then we can add a function in drm_edid.c that takes this opaque blob,
a 32-bit integer (as per drm_edid_encode_panel_id()), and a string
name and it can tell us if the blob matches?


[1] https://lore.kernel.org/r/CAD=3DFV=3DVMVr+eJ7eyuLGa671fMgH6ZX9zPOkbKzYJ=
0H79MZ2k9A@mail.gmail.com
[2] https://lore.kernel.org/r/CAJMQK-gfKbdPhYJeCJ5UX0dNrx3y-EmLsTiv9nj+U3Rm=
ej38pw@mail.gmail.com
