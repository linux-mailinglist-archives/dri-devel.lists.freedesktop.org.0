Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C0EA85A490
	for <lists+dri-devel@lfdr.de>; Mon, 19 Feb 2024 14:22:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6856B10E0D3;
	Mon, 19 Feb 2024 13:22:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="FYvatgCR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D54110E0D3
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Feb 2024 13:22:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1708348936;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ad5ZfPvBErD9ed96/01DKqEFwnvkcM3cJBkIKMFR3B0=;
 b=FYvatgCRn5zssH233daez1Q03fC6dhbhVRyU2d9Yb0m37D0Y7cUMmhRKmCIlkdk9kPFbIW
 9il+0gVAMJAFm5yOWYRwluXO/R6CBLlkfUOMFZvaF2EcxqBj/gBbJnyU5bCehUc/vELm5u
 s5xiUA2N5oezPlyqfKg7wLjs1Vi3/iI=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-140-4_CACujINYmGREduYxZX0g-1; Mon, 19 Feb 2024 08:22:15 -0500
X-MC-Unique: 4_CACujINYmGREduYxZX0g-1
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-411dca63c56so16803505e9.1
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Feb 2024 05:22:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708348934; x=1708953734;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Ad5ZfPvBErD9ed96/01DKqEFwnvkcM3cJBkIKMFR3B0=;
 b=WVjQ+t7yyxhRVvmLEiTsg16r/IZvxHbUAD/2iSuaU2BYWvM/DtzTS5hfCs5Ou7kTWf
 eTGFsFgZ8PTWnld1QqthradPtvv8LEcq1noOI82gSY1a9a4gE26t/xTHm14KUEZmcDfA
 LpjF91Pzup4Y2JPlp3xX/PCCY2e6uJI0DocgvfNhtbC2WpgxZrqPBzpb4tOFS6RsJJE/
 i6cHI/YzqXTgVcngF9PfXP7Ltmcl6hlXBPrPQ34EzHQZg0lgjxxumaIX1OHWpV/FPgPl
 REJ76lDAuzML4I4E1XDqS09geBX79HBRQ5tGLW7EsMluAONPrRB/1biXQZZJYWd0U/nD
 Iscg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWD/SqOsPn5gL78fJdfm4Zw0kj0bR9Ubz7gKWsnekyqw7q4p6Yd0zTCdBRymviNCR8BuZ0BSjkROnVjhjidG6juApQAQstfOBPM7/Dk89pb
X-Gm-Message-State: AOJu0Yw63pfKEP/4oLxn8xeefoT9NSVuaOcMe5wdRZSdGbw3oMFCDxCm
 +yDUTCYoTFml1UnL+jhkto4ZXdK7M56O2UetyEdTlWhTvEETefdqq4hUEx5bt9pg7AAOwPKwiul
 Rn0Ztv0phiBvKc4u8QB+oskxL/fNE4aYyl5Un69VG/xnnOb5nTt9Z/EXHTsSF/vRFkg==
X-Received: by 2002:a05:600c:68d0:b0:411:3673:1c6d with SMTP id
 jd16-20020a05600c68d000b0041136731c6dmr10152355wmb.37.1708348933836; 
 Mon, 19 Feb 2024 05:22:13 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFbxznGOkolAFkSkvefxI4RExhG6V9L2ERL+utZw1pz3QBRnJYUKGZE8IdUmziqFulKI6bNig==
X-Received: by 2002:a05:600c:68d0:b0:411:3673:1c6d with SMTP id
 jd16-20020a05600c68d000b0041136731c6dmr10152336wmb.37.1708348933434; 
 Mon, 19 Feb 2024 05:22:13 -0800 (PST)
Received: from toolbox ([2001:9e8:89aa:1800:3845:886a:5f99:bee1])
 by smtp.gmail.com with ESMTPSA id
 v21-20020a05600c445500b0041266f5b041sm2862760wmn.34.2024.02.19.05.22.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Feb 2024 05:22:13 -0800 (PST)
Date: Mon, 19 Feb 2024 14:22:11 +0100
From: Sebastian Wick <sebastian.wick@redhat.com>
To: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Cc: Pekka Paalanen <pekka.paalanen@haloniitty.fi>,
 Xaver Hugl <xaver.hugl@kde.org>, dri-devel@lists.freedesktop.org,
 contact@emersion.fr
Subject: Re: [PATCH] drm: document userspace expectations around the
 Colorspace connector property
Message-ID: <20240219132211.GA1956149@toolbox>
References: <20240209165307.29856-1-xaver.hugl@kde.org>
 <20240212111015.2d22f0fa@eldfell>
 <20240212165036.GA1370407@toolbox> <Zcs11A545tl9rvaN@intel.com>
MIME-Version: 1.0
In-Reply-To: <Zcs11A545tl9rvaN@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
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

On Tue, Feb 13, 2024 at 11:26:44AM +0200, Ville Syrjälä wrote:
> On Mon, Feb 12, 2024 at 05:50:36PM +0100, Sebastian Wick wrote:
> > On Mon, Feb 12, 2024 at 11:10:15AM +0200, Pekka Paalanen wrote:
> > > On Fri,  9 Feb 2024 17:53:07 +0100
> > > Xaver Hugl <xaver.hugl@kde.org> wrote:
> > > 
> > > > Signed-off-by: Xaver Hugl <xaver.hugl@kde.org>
> > > > ---
> > > >  drivers/gpu/drm/drm_connector.c | 8 ++++++++
> > > >  1 file changed, 8 insertions(+)
> > > > 
> > > > diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
> > > > index b0516505f7ae..01e13984629b 100644
> > > > --- a/drivers/gpu/drm/drm_connector.c
> > > > +++ b/drivers/gpu/drm/drm_connector.c
> > > > @@ -2158,6 +2158,14 @@ EXPORT_SYMBOL(drm_mode_create_aspect_ratio_property);
> > > >   *     one supported. Sink supported colorspaces should be retrieved by
> > > >   *     userspace from EDID and driver will not explicitly expose them.
> > > >   *
> > > > + *     As userspace can't currently know whether or not the output is using
> > > > + *     RGB or YCC signalling, the driver must translate properties to their
> > > > + *     relevant RGB or YCC counterparts, depending on the actually used
> > > > + *     signalling. Property values that are only valid for either YCC or RGB
> > > > + *     and have no equivalent for the other signalling type must not be
> > > > + *     exposed as supported, unless the driver can guarantee it never uses
> > > > + *     the signalling that doesn't match the property.
> > > > + *
> > > >   *     Basically the expectation from userspace is:
> > > >   *      - Set up CRTC DEGAMMA/CTM/GAMMA to convert to some sink
> > > >   *        colorspace
> > > 
> > > While this addition is good, I have another question:
> > > 
> > > Does "Colorspace" property choose also the RGB->YCbCr matrix that the
> > > driver will use when it happens to use YCbCr signalling?
> > > 
> > > So far we have only been talking about the primaries and white point.
> > 
> > Uh, yeah, good point. The InfoFrames do affect both the YCbCr conversion
> > and the transfer characteristics that the sink expects. Drivers should
> > do the RGB to YCbCr conversion with the new matrix. I think (and very
> > much hope) that drivers don't rely on the TF for any internal processing
> > but if they did, they also should use the one the sink expects.
> 
> What we need is:
> - list of the property values that are still allowd (the ones that still
>   make sense with the changed semantics)
> - mark all the other ones as deprecated
> - filter/reject the deprecated values when creating the property
> - document each valid enum value fully (for both RGB and YCbCr output):
>   * what exacly is signalled to the sink via infoframe/msa/vsc sdp
>   * what processing is the driver expected to perform on the actual data

I'm starting to agree that this is a better idea than coming up with a
number of rules. We only rely on the default colorimetry as indicated
by EDID and BT.2020.

Xaver, are you going to update the patch accordingly?

> -- 
> Ville Syrjälä
> Intel
> 

