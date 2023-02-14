Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C7E85696F20
	for <lists+dri-devel@lfdr.de>; Tue, 14 Feb 2023 22:19:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 801A210E999;
	Tue, 14 Feb 2023 21:19:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CBE710E99F
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Feb 2023 21:19:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676409544;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ak6FYuLkU6McvMWOWC5NMO3y86dz2256ZedizP3VSIA=;
 b=TT5CkeSTSoKZ/SLCFnJtzeNBsChSPe8O5boZYBGcwbdV0ERcoWEicwau9cDUDPN4PBbI0X
 Qg/f60T9FlJlFi/58ZQ5vxhxM9lHbCnKPjf3c+heDailstpvDv+pYIbLML8hYA1CtBa138
 TfNIIU24al6FHYWRvCzfpjOfnyNv95k=
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com
 [209.85.208.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-35-yZWa3GPgNZC1fZndrhH8qQ-1; Tue, 14 Feb 2023 16:19:03 -0500
X-MC-Unique: yZWa3GPgNZC1fZndrhH8qQ-1
Received: by mail-lj1-f197.google.com with SMTP id
 r12-20020a2e994c000000b002934d445d6aso2128639ljj.21
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Feb 2023 13:19:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ak6FYuLkU6McvMWOWC5NMO3y86dz2256ZedizP3VSIA=;
 b=a6PkqHlsNK++DoT9L94xWLBoKywaWnLC+YmMOp3b6uDksHGCsFrC2Q9X69HGDJPUYr
 QljMEEka5IIEx0uXUrLCr5fKKZtiQPJYgpHegMwn0eNm0a6ZMr02dzahAbJgvDfRqWu9
 lBcccI2SUZAsmDhNrgeFgtqgi4rYrVu8qlN/LUx9O6PddiI4un1ddf3TfbWuMPPsFy/S
 Cv3x+DN1tPjGWqZ6pRB/S0bYG74zel/+x6DCzmtqbTC9LzHOz/TwZLpz1rfBiAxDoDjR
 81b4uhuVfDJ0VmN4e3vfEqY1EQ1ZjD9tyv40JIZyxG9o1G7MmtdVYmQdSwkwLo0QuKEr
 U2kg==
X-Gm-Message-State: AO0yUKVEKrBKria5+dJY6fBGKoGKIjmuP8lYDwfSRmu36UNfPrqBZ20f
 LbX8w3fWGeINMKQXKWKa+EGLc1fsWnCdGZAsWWaJNtV4CZXmWTnNU2aQW0vluaOF8p+ml2BLEzC
 3WP5OJp9E6diSRa20P0eZq6U6jVzdf/K212nroeMCmu0L
X-Received: by 2002:a19:504c:0:b0:4db:1b01:f06b with SMTP id
 z12-20020a19504c000000b004db1b01f06bmr716669lfj.10.1676409541714; 
 Tue, 14 Feb 2023 13:19:01 -0800 (PST)
X-Google-Smtp-Source: AK7set9YN4CG2FN48M+m4j94AfSdNprbj9mvLpIw9PWUrmCdWTZeZISNqVSJj2HGoR+7sRMbjcb1yh9usmgS2kAlTgE=
X-Received: by 2002:a19:504c:0:b0:4db:1b01:f06b with SMTP id
 z12-20020a19504c000000b004db1b01f06bmr716656lfj.10.1676409541314; Tue, 14 Feb
 2023 13:19:01 -0800 (PST)
MIME-Version: 1.0
References: <20230203020744.30745-3-joshua@froggi.es>
 <Y9zkef5FjtZ7guVS@intel.com>
 <CA+hFU4ymiOg06MQeKLcn5MSrR=BZnOLODdZCFvGUdWqt_ha61A@mail.gmail.com>
 <0fc18aec-0703-55f4-f635-d09d345e8dc0@amd.com> <Y90l+DY0rSaMvN1U@intel.com>
 <758e5cf6-53e0-567c-c760-5b773bc7a11c@amd.com> <Y90vrEa3/1RbaGOV@intel.com>
 <CA+hFU4wuM_xHniFyRT+jouQ3k_S3UJsRpAtd1Lgx9UVLtrqZrQ@mail.gmail.com>
 <98d1d22a-1c29-5271-1eaf-89c962eb9678@amd.com>
 <CA+hFU4y=N3bR-vXXeLP0xTe0-HJPgF_GTbKrb3A9St-z2LignQ@mail.gmail.com>
 <Y+vqu3qGUQayTjd+@intel.com>
In-Reply-To: <Y+vqu3qGUQayTjd+@intel.com>
From: Sebastian Wick <sebastian.wick@redhat.com>
Date: Tue, 14 Feb 2023 22:18:49 +0100
Message-ID: <CA+hFU4wpXfvCsiHrz=f8VCg3x9Ve--4OujwLq5jmGyAGwZy+jQ@mail.gmail.com>
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

On Tue, Feb 14, 2023 at 9:10 PM Ville Syrj=C3=A4l=C3=A4
<ville.syrjala@linux.intel.com> wrote:
>
> On Tue, Feb 14, 2023 at 08:45:00PM +0100, Sebastian Wick wrote:
> > On Tue, Feb 14, 2023 at 5:57 PM Harry Wentland <harry.wentland@amd.com>=
 wrote:
> > >
> > >
> > >
> > > On 2/14/23 10:49, Sebastian Wick wrote:
> > > > On Fri, Feb 3, 2023 at 5:00 PM Ville Syrj=C3=A4l=C3=A4
> > > > <ville.syrjala@linux.intel.com> wrote:
> > > >>
> > > >> On Fri, Feb 03, 2023 at 10:24:52AM -0500, Harry Wentland wrote:
> > > >>>
> > > >>>
> > > >>> On 2/3/23 10:19, Ville Syrj=C3=A4l=C3=A4 wrote:
> > > >>>> On Fri, Feb 03, 2023 at 09:39:42AM -0500, Harry Wentland wrote:
> > > >>>>>
> > > >>>>>
> > > >>>>> On 2/3/23 07:59, Sebastian Wick wrote:
> > > >>>>>> On Fri, Feb 3, 2023 at 11:40 AM Ville Syrj=C3=A4l=C3=A4
> > > >>>>>> <ville.syrjala@linux.intel.com> wrote:
> > > >>>>>>>
> > > >>>>>>> On Fri, Feb 03, 2023 at 02:07:44AM +0000, Joshua Ashton wrote=
:
> > > >>>>>>>> Userspace has no way of controlling or knowing the pixel enc=
oding
> > > >>>>>>>> currently, so there is no way for it to ever get the right v=
alues here.
> > > >>>>>>>
> > > >>>>>>> That applies to a lot of the other values as well (they are
> > > >>>>>>> explicitly RGB or YCC). The idea was that this property sets =
the
> > > >>>>>>> infoframe/MSA/SDP value exactly, and other properties should =
be
> > > >>>>>>> added to for use userspace to control the pixel encoding/colo=
rspace
> > > >>>>>>> conversion(if desired, or userspace just makes sure to
> > > >>>>>>> directly feed in correct kind of data).
> > > >>>>>>
> > > >>>>>> I'm all for getting userspace control over pixel encoding but =
even
> > > >>>>>> then the kernel always knows which pixel encoding is selected =
and
> > > >>>>>> which InfoFrame has to be sent. Is there a reason why userspac=
e would
> > > >>>>>> want to control the variant explicitly to the wrong value?
> > > >>>>>>
> > > >>>>>
> > > >>>>> I've asked this before but haven't seen an answer: Is there an =
existing
> > > >>>>> upstream userspace project that makes use of this property (oth=
er than
> > > >>>>> what Joshua is working on in gamescope right now)? That would h=
elp us
> > > >>>>> understand the intent better.
> > > >>>>
> > > >>>> The intent was to control the infoframe colorimetry bits,
> > > >>>> nothing more. No idea what real userspace there was, if any.
> > > >>>>
> > > >>>>>
> > > >>>>> I don't think giving userspace explicit control over the exact =
infoframe
> > > >>>>> values is the right thing to do.
> > > >>>>
> > > >>>> Only userspace knows what kind of data it's stuffing into
> > > >>>> the pixels (and/or how it configures the csc units/etc.) to
> > > >>>> generate them.
> > > >>>>
> > > >>>
> > > >>> Yes, but userspace doesn't control or know whether we drive
> > > >>> RGB or YCbCr on the wire. In fact, in some cases our driver
> > > >>> needs to fallback to YCbCr420 for bandwidth reasons. There
> > > >>> is currently no way for userspace to know that and I don't
> > > >>> think it makes sense.
> > > >>
> > > >> People want that control as well for whatever reason. We've
> > > >> been asked to allow YCbCr 4:4:4 output many times.
> > > >
> > > > I don't really think it's a question of if we want it but rather ho=
w
> > > > we get there. Harry is completely right that if we would make the
> > > > subsampling controllable by user space instead of the kernel handli=
ng
> > > > it magically, user space which does not adapt to the new control wo=
n't
> > > > be able to light up some modes which worked before.
> > > >
> > >
> > > Thanks for continuing this discussion and touching on the model of ho=
w
> > > we get to where we want to go.
> > >
> > > > This is obviously a problem and not one we can easily fix. We would
> > > > need a new cap for user space to signal "I know that I can control
> > > > bpc, subsampling and compression to lower the bandwidth and light u=
p
> > > > modes which otherwise fail". That cap would also remove all the
> > > > properties which require kernel magic to work (that's also what I
> > > > proposed for my KMS color pipeline API).
> > > >
> > > > We all want to expose more of the scanout capability and give user
> > > > space more control but I don't think an incremental approach works
> > > > here and we would all do better if we accept that the current API
> > > > requires kernel magic to work and has a few implicit assumptions ba=
ked
> > > > in.
> > > >
> > > > With all that being said, I think the right decision here is to
> > > >
> > > > 1. Ignore subsampling for now
> > > > 2. Let the kernel select YCC or RGB on the cable
> > > > 3. Let the kernel figure out the conversion between RGB and YCC bas=
ed
> > > > on the color space selected
> > > > 4. Let the kernel send the correct infoframe based on the selected
> > > > color space and cable encoding
> > > > 5. Only expose color spaces for which the kernel can do the convers=
ion
> > > > and send the infoframe
> > >
> > > I agree. We don't want to break or change existing behavior (that is
> > > used by userspace) and this will get us far without breaking things.
> > >
> > > > 6. Work on the new API which is hidden behind a cap
> > > >
> > >
> > > I assume you mean something like
> > > https://gitlab.freedesktop.org/pq/color-and-hdr/-/issues/11
> >
> > Something like that, yes. The main point being a cap which removes a
> > lot of properties and sets new expectations between user space and
> > kernel. The actual API is not that important.
> >
> > > Above you say that you don't think an incremental approach works
> > > here. Can you elaborate?
> >
> > Backwards compatibility is really hard. If we add another property to
> > control e.g. the color range infoframe which doesn't magically convert
> > colors, we now have to define how it interacts with the existing
> > property.
>
> I think that's easy. The old prop simply override the
> infoframe/etc. stuff. Pretty sure that's how we have it
> implemented in i915 since the start.
>
> And if you set it wrong it's you own fault.

We need the "old" property to control both the conversion and the
infoframe and we need the "new" property to control only the
infoframe. So if we don't want to old property to to any conversion we
now also need a new value for the old property which disables the
property. So why not just go for a cap and remove the property
altogether?

And again, as long as user space doesn't have complete control over
the entire pipeline we can't use the property which only sets the
infoframe anyway so you can't even have an incremental approach here.

Let's turn the question around: what do we gain by keeping all the
properties and implicit assumptions in the current API around? They
make everything more complex so what's the benefit?

I also want to be able to clearly document all the requirements of
user space and the guarantees from the kernel in the new API which we
can't do when we just incrementally change some properties here and
there. The documentation right now is basically a joke and almost
nothing has been defined properly and when things work, they work by
accident. Purely from a documentation and usability POV the
incremental approach is already going to be horrible IMO.

>
> > We also have to figure out how a user space which doesn't
> > know about the new property behaves when another client has set that
> > property. If any property which currently might change the pixel
> > values is used, we can't expose the entire color pipeline because the
> > kernel might have to use some element in it to achieve its magic
> > conversion. So essentially you already have this hard device between
> > "old" and "new" and you can't use the new stuff incrementally.
>
> That problem exists with any new property. Old userspace and new
> userspace may interact badly enought that nothing works right.
> In that sense I think these props might even be pretty mundane
> as the worst you might get from setting the infoframe wrong is
> perhaps wrong colors on your display.
>
> To solve that particular problem there has been talk (for years)
> about some kind of "reset all" knob to make sure everything is
> at a safe default value. I have a feeling there was even some
> kind of semi-real proposal in recent times, but maybe I imgained
> it?

I'm one of the people who argued for this but met only resistance. It
sure would be nice to have but also doesn't help with a lot of the
issues.

> Right now I guess what you do is either just reboot, or muck
> around with modetest to manually reset properties.
>
> I have occasionally abused this btw, to set some prop with
> modetest and then run some real userspace that doesn't even
> know about said property. Easy way to test stuff :P
>
> --
> Ville Syrj=C3=A4l=C3=A4
> Intel
>

