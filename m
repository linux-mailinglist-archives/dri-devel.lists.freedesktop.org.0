Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 385736B2E99
	for <lists+dri-devel@lfdr.de>; Thu,  9 Mar 2023 21:24:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B38C510E2AE;
	Thu,  9 Mar 2023 20:24:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE7B610E2A7
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Mar 2023 20:23:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678393437;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yka9ogM9j+y0YojMQ9bMUprAq2Q3vHqsfyNZIxtsDLY=;
 b=IaxcK9Ok/mkzU9bIbOVtqmaRlmV7IjejCK9am613g4j29/4+gBizVCic3PjuKj3LyBOJJL
 mubQZfoBYdACx+EOfWvBV96OlFPyfaXTgy91hQISOtlhubcAVDug1OZ8brw+KNyzzKrx2H
 5fg9xBFruitKBne64XMj8mWvSycIfOs=
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com
 [209.85.208.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-300-SBZyEOTYOl2stzWUzfNNsQ-1; Thu, 09 Mar 2023 15:23:56 -0500
X-MC-Unique: SBZyEOTYOl2stzWUzfNNsQ-1
Received: by mail-lj1-f197.google.com with SMTP id
 be36-20020a05651c172400b00295aa1d0db6so979138ljb.21
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Mar 2023 12:23:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678393435;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yka9ogM9j+y0YojMQ9bMUprAq2Q3vHqsfyNZIxtsDLY=;
 b=qk7PJRymjzj2+5OnnpZZHRa6+juNLHG5PYcy6X+RzAJxoXIauBW0zKJ8KEwx2RbKsP
 FbwSM7rhYiRWqDwkCLUuO+kuWL7xXCLFDEfCzSY6EJlwEAei/bo2pa3Boz3WglCGZH+i
 vYjCvjvL9xn7zwITOdLZ7JPyLY1Ud+hpHSeDk/JZFcxm6Soxfy0Fh4e9jdwrBk7kKavy
 20ugng2rljYtvTuEUG99OB4ZMrgU7IEwl3vU8y87LUSDuB9Fbb+ZiUqoU7eJBr8TJVA6
 pH+R18kJh+nBucl+r+KNwMb5kIyrf8aZZnz/opczHIEh2MIsnohZb7V0WCLf942hDB/W
 302Q==
X-Gm-Message-State: AO0yUKWsaXg2+uVaqdqAG1hvJnE+rGcA3F5KELJwh/8xJ1kRGoOk7+UV
 hfvdmsLmAMw1S+vq7H2B/oY6TucEFxzRwS292dpAFshRWYppGoYkapjAq1zSP8hhU4jf/FLf3ql
 Zw8G3gIbgERVVa69fx+S/QiQ4WIwzBZDgEH5gwtCU7Cgm
X-Received: by 2002:a2e:b988:0:b0:295:a699:8cef with SMTP id
 p8-20020a2eb988000000b00295a6998cefmr7097353ljp.1.1678393435357; 
 Thu, 09 Mar 2023 12:23:55 -0800 (PST)
X-Google-Smtp-Source: AK7set8weloI7aqyecmRQvtH4MtYMUWjylrGrxAFXgaTvGQmfF3OtgrdYrPNX6jAmG20we/nB8ZdplCyCbKx/y6ybKo=
X-Received: by 2002:a2e:b988:0:b0:295:a699:8cef with SMTP id
 p8-20020a2eb988000000b00295a6998cefmr7097345ljp.1.1678393435043; Thu, 09 Mar
 2023 12:23:55 -0800 (PST)
MIME-Version: 1.0
References: <20230307151107.49649-1-harry.wentland@amd.com>
 <20230307151107.49649-3-harry.wentland@amd.com>
 <20230308105944.05fb9377@eldfell>
 <CA+hFU4zt4ykkHpB2NyY7Eu2SnMKnMB_b+sUh7NfTTzNyZ3A4mQ@mail.gmail.com>
 <20230309120342.6260cf94@eldfell>
In-Reply-To: <20230309120342.6260cf94@eldfell>
From: Sebastian Wick <sebastian.wick@redhat.com>
Date: Thu, 9 Mar 2023 21:23:43 +0100
Message-ID: <CA+hFU4wT75Lcyi6ZAaU1AeZBmFPD+8Yu86cZ0n2HSPbLxV7Gwg@mail.gmail.com>
Subject: Re: [PATCH v3 02/17] drm/connector: Add enum documentation to
 drm_colorspace
To: Pekka Paalanen <ppaalanen@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: dri-devel@lists.freedesktop.org, Uma Shankar <uma.shankar@intel.com>,
 amd-gfx@lists.freedesktop.org, Joshua Ashton <joshua@froggi.es>,
 Vitaly.Prosyak@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Mar 9, 2023 at 11:03=E2=80=AFAM Pekka Paalanen <ppaalanen@gmail.com=
> wrote:
>
> On Thu, 9 Mar 2023 01:56:11 +0100
> Sebastian Wick <sebastian.wick@redhat.com> wrote:
>
> > On Wed, Mar 8, 2023 at 9:59=E2=80=AFAM Pekka Paalanen <ppaalanen@gmail.=
com> wrote:
> > >
> > > On Tue, 7 Mar 2023 10:10:52 -0500
> > > Harry Wentland <harry.wentland@amd.com> wrote:
> > >
> > > > From: Joshua Ashton <joshua@froggi.es>
> > > >
> > > > To match the other enums, and add more information about these valu=
es.
> > > >
> > > > v2:
> > > >  - Specify where an enum entry comes from
> > > >  - Clarify DEFAULT and NO_DATA behavior
> > > >  - BT.2020 CYCC is "constant luminance"
> > > >  - correct type for BT.601
> > > >
> > > > Signed-off-by: Joshua Ashton <joshua@froggi.es>
> > > > Signed-off-by: Harry Wentland <harry.wentland@amd.com>
> > > > Reviewed-by: Harry Wentland <harry.wentland@amd.com>
> > >
> > > Hi,
> > >
> > > this effort is really good, but of course I still find things to
> > > nitpick about. If there is no answer to my questions, then I would
> > > prefer the documentation to spell out the unknowns and ambiguities.
> > >
> > > > Cc: Pekka Paalanen <ppaalanen@gmail.com>
> > > > Cc: Sebastian Wick <sebastian.wick@redhat.com>
> > > > Cc: Vitaly.Prosyak@amd.com
> > > > Cc: Uma Shankar <uma.shankar@intel.com>
> > > > Cc: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> > > > Cc: Joshua Ashton <joshua@froggi.es>
> > > > Cc: dri-devel@lists.freedesktop.org
> > > > Cc: amd-gfx@lists.freedesktop.org
> > > > ---
> > > >  include/drm/drm_connector.h | 67 +++++++++++++++++++++++++++++++++=
++--
> > > >  1 file changed, 65 insertions(+), 2 deletions(-)
> > > >
> > > > diff --git a/include/drm/drm_connector.h b/include/drm/drm_connecto=
r.h
> > > > index 6d6a53a6b010..bb078666dc34 100644
> > > > --- a/include/drm/drm_connector.h
> > > > +++ b/include/drm/drm_connector.h
> > > > @@ -363,13 +363,76 @@ enum drm_privacy_screen_status {
> > > >       PRIVACY_SCREEN_ENABLED_LOCKED,
> > > >  };
> > > >
> > > > -/*
> > > > - * This is a consolidated colorimetry list supported by HDMI and
> > > > +/**
> > > > + * enum drm_colorspace - color space
> > > > + *
> > > > + * This enum is a consolidated colorimetry list supported by HDMI =
and
> > > >   * DP protocol standard. The respective connectors will register
> > > >   * a property with the subset of this list (supported by that
> > > >   * respective protocol). Userspace will set the colorspace through
> > > >   * a colorspace property which will be created and exposed to
> > > >   * userspace.
> > > > + *
> > > > + * DP definitions come from the DP v2.0 spec
> > > > + * HDMI definitions come from the CTA-861-H spec
> > > > + *
> > > > + * @DRM_MODE_COLORIMETRY_DEFAULT:
> > > > + *   Driver specific behavior.
> > > > + *   For DP:
> > > > + *           RGB encoded: sRGB (IEC 61966-2-1)
> > > > + *           YCbCr encoded: ITU-R BT.601 colorimetry format
> > >
> > > Does this mean that HDMI behavior is driver-specific while DP behavio=
r
> > > is as defined?
> > >
> > > Is it intentional that YCbCr encoding also uses different RGB-primari=
es
> > > than RGB-encoded signal? (BT.601 vs. BT.709/sRGB)
> > >
> > > Or do you need to be more explicit on which parts of each spec apply
> > > (ColourPrimaries vs. TransferCharacteristics vs. MatrixCoefficients i=
n
> > > CICP parlance)?
> > >
> > > E.g. BT.709/sRGB ColourPrimaries with BT.601 MatrixCoefficients.
> >
> > Yeah, just adding to this: The Default Colorspace is something well
> > defined. CTA-861 says:
> >
> > "If bits C0 and C1 are zero, the colorimetry shall correspond to the
> > default colorimetry defined in Section 5.1"
> >
> > and in Section 5.1
> >
> > "In all cases described above, the RGB color space used should be the
> > RGB color space the Sink declares in the Basic Display Parameters and
> > Feature Block of its EDID."
> >
> > If I set DRM_MODE_COLORIMETRY_DEFAULT, I expect the Colorimetry the
> > EDID reports to be in effect and not some driver specific nonsense.
>
> Does that also define the MatrixCoefficients for YCbCr signal with
> DRM_MODE_COLORIMETRY_DEFAULT?

Good question. It doesn't seem like it does, which would make
supporting YCC with the default color space impossible.

> Not that userspace would even care, since RGB-to-YCbCr is all
> driver-internal.
>
> It is interesting you point that out. I guess it means that the basic
> colorimetry from EDID is supposed to be really only the default
> colorimetry and might not have anything to do with the actual panel
> primaries.
>
>
> Thanks,
> pq

