Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E4D7696877
	for <lists+dri-devel@lfdr.de>; Tue, 14 Feb 2023 16:49:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13DDB10E900;
	Tue, 14 Feb 2023 15:49:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0543E10E900
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Feb 2023 15:49:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676389775;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MR8cRaV4hzh8Hs+6FhOVU0l7I7C0xQGATnrWDzUluwU=;
 b=aoL0tQtEqQy3BQ7SUUu4ZOSdsPWrtIYOBTl0EW/1ckF1kOgGZCwaRNsgq1js7mo3YqlSi/
 kVZ82V/bN96o9Zi8+Ooi1ALxnI8SbbuVuvqelsOG5+YuaN5gQoV9V//AdLIfaD+FqCNhGU
 627oPXLyBcmsqVF/HvedD79kJK0oang=
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com
 [209.85.215.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-45-L84IkNFCNq2qeFaOaCpaBg-1; Tue, 14 Feb 2023 10:49:33 -0500
X-MC-Unique: L84IkNFCNq2qeFaOaCpaBg-1
Received: by mail-pg1-f200.google.com with SMTP id
 c8-20020a630d08000000b004fb299589a2so6047881pgl.15
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Feb 2023 07:49:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MR8cRaV4hzh8Hs+6FhOVU0l7I7C0xQGATnrWDzUluwU=;
 b=nbbWvJ4r6h564/kPLx3vCaCzJ/XAsQJL/KGaRSgaN/Z5reeCYC5tKFSVUOiT0xkSlq
 uKcFAXPlk7M+BTvC9bVe/BWsRl6sqvAV89GGWc2LUAQxyuJ3ssLSSaNT04YtxEDwNjHG
 yb9W5Zh9k1JY459UmvhqfDrCO3uZDZWed2moF1h+bXBBtCp+bY5z8B5xbx7FeMuJFNJJ
 H3FVsl9qWBQIEkAAhDpJ/9cE4bam10+fqeJVeJCQ410tmms/i//O73SK4DrKDHQzFGl0
 /pfuD/xvzgUfH/+EZL/pwQMCkPR+KpQMnMUxyr50cpHIJ5THYJopS0OAeqlpdKgVCgIx
 1pXQ==
X-Gm-Message-State: AO0yUKWzUxpJWLrVjgJA4YVgpvrsIgHhDbRJP0RpUS9I+kQNLtct5KCK
 pXYn53fhah56rEk7xEfWdq/S2RIWMn3McWUolB6Q17gzZzxD3Q6CWY7S6QmfxLamrW4bY1unqmi
 JKjrdhxULnsMDIejZ1yDFLzZk23iD/gI6ZinIK2ZOU+e7
X-Received: by 2002:a17:903:2695:b0:199:2b80:4d3c with SMTP id
 jf21-20020a170903269500b001992b804d3cmr853689plb.31.1676389772768; 
 Tue, 14 Feb 2023 07:49:32 -0800 (PST)
X-Google-Smtp-Source: AK7set/aTyTqpV20bIc7D+CbXkg1ahwPVjcSzTH2lC73cxC8F8fuLEyJvlPZLr2up+FSVbOGM7j8OeUjaIHT2jfymjg=
X-Received: by 2002:a17:903:2695:b0:199:2b80:4d3c with SMTP id
 jf21-20020a170903269500b001992b804d3cmr853682plb.31.1676389772437; Tue, 14
 Feb 2023 07:49:32 -0800 (PST)
MIME-Version: 1.0
References: <20230203020744.30745-1-joshua@froggi.es>
 <20230203020744.30745-3-joshua@froggi.es>
 <Y9zkef5FjtZ7guVS@intel.com>
 <CA+hFU4ymiOg06MQeKLcn5MSrR=BZnOLODdZCFvGUdWqt_ha61A@mail.gmail.com>
 <0fc18aec-0703-55f4-f635-d09d345e8dc0@amd.com> <Y90l+DY0rSaMvN1U@intel.com>
 <758e5cf6-53e0-567c-c760-5b773bc7a11c@amd.com> <Y90vrEa3/1RbaGOV@intel.com>
In-Reply-To: <Y90vrEa3/1RbaGOV@intel.com>
From: Sebastian Wick <sebastian.wick@redhat.com>
Date: Tue, 14 Feb 2023 16:49:18 +0100
Message-ID: <CA+hFU4wuM_xHniFyRT+jouQ3k_S3UJsRpAtd1Lgx9UVLtrqZrQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] drm/connector: Deprecate split for BT.2020 in
 drm_colorspace enum
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
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
Cc: dri-devel@lists.freedesktop.org, Pekka Paalanen <ppaalanen@gmail.com>,
 Uma Shankar <uma.shankar@intel.com>, amd-gfx@lists.freedesktop.org,
 Joshua Ashton <joshua@froggi.es>, Vitaly.Prosyak@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Feb 3, 2023 at 5:00 PM Ville Syrj=C3=A4l=C3=A4
<ville.syrjala@linux.intel.com> wrote:
>
> On Fri, Feb 03, 2023 at 10:24:52AM -0500, Harry Wentland wrote:
> >
> >
> > On 2/3/23 10:19, Ville Syrj=C3=A4l=C3=A4 wrote:
> > > On Fri, Feb 03, 2023 at 09:39:42AM -0500, Harry Wentland wrote:
> > >>
> > >>
> > >> On 2/3/23 07:59, Sebastian Wick wrote:
> > >>> On Fri, Feb 3, 2023 at 11:40 AM Ville Syrj=C3=A4l=C3=A4
> > >>> <ville.syrjala@linux.intel.com> wrote:
> > >>>>
> > >>>> On Fri, Feb 03, 2023 at 02:07:44AM +0000, Joshua Ashton wrote:
> > >>>>> Userspace has no way of controlling or knowing the pixel encoding
> > >>>>> currently, so there is no way for it to ever get the right values=
 here.
> > >>>>
> > >>>> That applies to a lot of the other values as well (they are
> > >>>> explicitly RGB or YCC). The idea was that this property sets the
> > >>>> infoframe/MSA/SDP value exactly, and other properties should be
> > >>>> added to for use userspace to control the pixel encoding/colorspac=
e
> > >>>> conversion(if desired, or userspace just makes sure to
> > >>>> directly feed in correct kind of data).
> > >>>
> > >>> I'm all for getting userspace control over pixel encoding but even
> > >>> then the kernel always knows which pixel encoding is selected and
> > >>> which InfoFrame has to be sent. Is there a reason why userspace wou=
ld
> > >>> want to control the variant explicitly to the wrong value?
> > >>>
> > >>
> > >> I've asked this before but haven't seen an answer: Is there an exist=
ing
> > >> upstream userspace project that makes use of this property (other th=
an
> > >> what Joshua is working on in gamescope right now)? That would help u=
s
> > >> understand the intent better.
> > >
> > > The intent was to control the infoframe colorimetry bits,
> > > nothing more. No idea what real userspace there was, if any.
> > >
> > >>
> > >> I don't think giving userspace explicit control over the exact infof=
rame
> > >> values is the right thing to do.
> > >
> > > Only userspace knows what kind of data it's stuffing into
> > > the pixels (and/or how it configures the csc units/etc.) to
> > > generate them.
> > >
> >
> > Yes, but userspace doesn't control or know whether we drive
> > RGB or YCbCr on the wire. In fact, in some cases our driver
> > needs to fallback to YCbCr420 for bandwidth reasons. There
> > is currently no way for userspace to know that and I don't
> > think it makes sense.
>
> People want that control as well for whatever reason. We've
> been asked to allow YCbCr 4:4:4 output many times.

I don't really think it's a question of if we want it but rather how
we get there. Harry is completely right that if we would make the
subsampling controllable by user space instead of the kernel handling
it magically, user space which does not adapt to the new control won't
be able to light up some modes which worked before.

This is obviously a problem and not one we can easily fix. We would
need a new cap for user space to signal "I know that I can control
bpc, subsampling and compression to lower the bandwidth and light up
modes which otherwise fail". That cap would also remove all the
properties which require kernel magic to work (that's also what I
proposed for my KMS color pipeline API).

We all want to expose more of the scanout capability and give user
space more control but I don't think an incremental approach works
here and we would all do better if we accept that the current API
requires kernel magic to work and has a few implicit assumptions baked
in.

With all that being said, I think the right decision here is to

1. Ignore subsampling for now
2. Let the kernel select YCC or RGB on the cable
3. Let the kernel figure out the conversion between RGB and YCC based
on the color space selected
4. Let the kernel send the correct infoframe based on the selected
color space and cable encoding
5. Only expose color spaces for which the kernel can do the conversion
and send the infoframe
6. Work on the new API which is hidden behind a cap

> The automagic 4:2:0 fallback I think is rather fundementally
> incompatible with fancy color management. How would we even
> know whether to use eg. BT.2020 vs. BT.709 matrix? In i915
> that stuff is just always BT.709 limited range, no questions
> asked.
>
> So I think if userspace wants real color management it's
> going to have to set up the whole pipeline. And for that
> we need at least one new property to control the RGB->YCbCr
> conversion (or to explicitly avoid it).
>
> And given that the proposed patch just swept all the
> non-BT.2020 issues under the rug makes me think no
> one has actually come up with any kind of consistent
> plan for anything else really.
>
> >
> > Userspace needs full control of framebuffer pixel formats,
> > as well as control over DEGAMMA, GAMMA, CTM color operations.
> > It also needs to be able to select whether to drive the panel
> > as sRGB or BT.2020/PQ but it doesn't make sense for it to
> > control the pixel encoding on the wire (RGB vs YCbCr).
> >
> > > I really don't want a repeat of the disaster of the
> > > 'Broadcast RGB' which has coupled together the infoframe
> > > and automagic conversion stuff. And I think this one would
> > > be about 100x worse given this property has something
> > > to do with actual colorspaces as well.
> > >
> >
> > I'm unaware of this disaster. Could you elaborate?
>
> The property now controls both the infoframe stuff (and
> whatever super vague stuff DP has for it in MSA) and
> full->limited range compression in the display pipeline.
> And as a result  there is no way to eg. allow already
> limited range input, which is what some people wanted.
>
> And naturally it's all made a lot more terrible by all
> the displays that fail to implement the spec correctly,
> but that's another topic.
>
> --
> Ville Syrj=C3=A4l=C3=A4
> Intel
>

