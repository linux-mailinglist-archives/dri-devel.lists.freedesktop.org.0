Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A36227863D
	for <lists+dri-devel@lfdr.de>; Fri, 25 Sep 2020 13:47:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35EC46EC9A;
	Fri, 25 Sep 2020 11:47:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 683576EC9A
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Sep 2020 11:47:32 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id x14so3223137wrl.12
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Sep 2020 04:47:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zPb7jtZE0stRH6b28UQT8hG77F4MGezdhJ0kKzxG8tM=;
 b=ffjRA4zuZJFBDqPWzBfAFz0uG97qqd+3pcD2R4C/nDqFwXJyWqdsQ2ujc0sF8LNPc3
 IXibe0GXwX0qqZIg6t6JWOcb4fmZ3Ch3ydaniXFcFOrF1EED5Wu991Rp7Rz6gmOUSWHO
 QwOpqTflXex6izlACaB8YRx0+FNtFANtJMJ/nlTkhds5+zyaHjGMiusEf2RiHBnXUC8c
 IX8i7Ez1deOBVXdEbLJ04D1CXSjPB+Zt9PFOtXJBMAmrqlYNJ/JmGoPQEGOG9dbNUggp
 6qSU6fg67m3D2O3GGcclVoaTnJb4d6HdWaXpohhEzPXs12Tk7OF/k2TBy6GmoRhB0jgT
 Oe8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zPb7jtZE0stRH6b28UQT8hG77F4MGezdhJ0kKzxG8tM=;
 b=h8SlYDe39w0ok34Gzocl1nyCF4no0dfcgTBXm4YrLAcUCp35Nd2YjKSpZuuii8Zi53
 A5OpuinY0qKgy4cOg7uuMtQ5Ea3S/0OIemnC6MFY67Ql0jN9ha86Hau23TMtSAbxVBJm
 NYOHzf33NLYuW5gJ4mFXVX2Osr/fl52096/IWDaXZSqKfTGkAUbn8gBl6swUKBEvxxpb
 pPQnt4QMyoniTj7WSq4UCx0o89rWxQBzKkALPwyVSeLntMMhzw8J+N6fe1no7NBhbPdV
 1/0IKDVHnuXC7c9Vd0Yl2x3TPamiPop9FnPrdM9dLZfImNKi3JWag5cR0jhW/eSfwHCE
 GG1w==
X-Gm-Message-State: AOAM5316X1j1nyQB+5tdNuEjQvocG6PqehiiyOtIKxr1Qfqe/mWKXF/O
 CNLQQc0r2dHshFIVQMrgLLmJ8/EoXoiYcqtC3wcORg==
X-Google-Smtp-Source: ABdhPJyNriywyz0aaB3asBRaJLAQSNaXLsDZkwY3zo+CggyhzyPvhy5NRjPW0Oy4XUktzChe7N+70cb11fVidMrngVk=
X-Received: by 2002:adf:dd10:: with SMTP id a16mr2051589wrm.42.1601034450969; 
 Fri, 25 Sep 2020 04:47:30 -0700 (PDT)
MIME-Version: 1.0
References: <20200923084032.218619-1-maxime@cerno.tech>
 <CAPY8ntAjiBeAoB=PZzNWW_5Vi3ZstXnD59GSkPXoeBj4XbGt0Q@mail.gmail.com>
 <20200925113840.nemma2q7stujf57f@gilmour.lan>
In-Reply-To: <20200925113840.nemma2q7stujf57f@gilmour.lan>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Fri, 25 Sep 2020 12:47:13 +0100
Message-ID: <CAPY8ntBk=ZqN6NSVg0zXa4=8jjQ3ZJ6aYMX+3AF_Tzdgj4e-gw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] drm/vc4: crtc: Rework a bit the CRTC state code
To: Maxime Ripard <maxime@cerno.tech>
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
Cc: Tim Gover <tim.gover@raspberrypi.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org,
 Phil Elwell <phil@raspberrypi.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 25 Sep 2020 at 12:38, Maxime Ripard <maxime@cerno.tech> wrote:
>
> Hi Dave,
>
> On Wed, Sep 23, 2020 at 03:59:04PM +0100, Dave Stevenson wrote:
> > Hi Maxime
> >
> > On Wed, 23 Sep 2020 at 09:40, Maxime Ripard <maxime@cerno.tech> wrote:
> > >
> > > The current CRTC state reset hook in vc4 allocates a vc4_crtc_state
> > > structure as a drm_crtc_state, and relies on the fact that vc4_crtc_state
> > > embeds drm_crtc_state as its first member, and therefore can be safely
> > > casted.
> >
> > s/casted/cast
> >
> > > However, this is pretty fragile especially since there's no check for this
> > > in place, and we're going to need to access vc4_crtc_state member at reset
> > > so this looks like a good occasion to make it more robust.
> > >
> > > Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> > > Tested-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> >
> > Based on the issue I perceived with the previous patch, I'm happy. I
> > haven't thought about how the framework handles losing the state, but
> > that's not the driver's problem.
> >
> > There is still an implicit assumption that drm_crtc_state is the first
> > member from the implementation of to_vc4_crtc_state in vc4_drv.h. To
> > make it even more robust that could be a container_of instead. I
> > haven't checked for any other places that make the assumption though.
>
> Good catch, I'll send another patch to fix it
>
> > Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
>
> Does it apply to the second patch as well?

No. I got another interrupt before I'd refreshed my memory over what
the second patch was doing and responding to it. I'll do that now (I
don't think it changed much from v1)

  Dave.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
