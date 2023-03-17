Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CB6E26BEFF1
	for <lists+dri-devel@lfdr.de>; Fri, 17 Mar 2023 18:41:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93DC610E3F3;
	Fri, 17 Mar 2023 17:41:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EF7010E3F3
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Mar 2023 17:41:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679074867;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ItmeR0RTv58gOh+Xko2p2/U7VcRkR51FcotE6EHxMWk=;
 b=eKUfS/ypg+0b0J4ZUgNpP7xGSvhbtEhMTDb23zj5l1pls+b5uUOOkrA3d/HunTN5gmu6Cm
 TAoh94J4S/1i1rsL/S/1GhWIfhoy5Tp8mAbU3o1W7S14OOXQK5hbVZdTHz+89XTswPXXVa
 XfTQ0M3btodDyIWeOJEjHKK7tnibuBI=
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com
 [209.85.208.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-279-e0hrVvr6NWWUfxnh-ib3gQ-1; Fri, 17 Mar 2023 13:41:06 -0400
X-MC-Unique: e0hrVvr6NWWUfxnh-ib3gQ-1
Received: by mail-lj1-f197.google.com with SMTP id
 i14-20020a2e864e000000b00298ab0c9877so1641370ljj.19
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Mar 2023 10:41:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679074865;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ItmeR0RTv58gOh+Xko2p2/U7VcRkR51FcotE6EHxMWk=;
 b=jnv1L+RWMNlkwuAlWbvt5VRZVRQF79fc6Brm/HMVOwqjFOOnoR2/v7y72hMLGyS5oW
 7G+iuPZ0F9IB6PsdsDtbSlu4qbypGLF0/ApugyNI3+rLA/VXGHUOWTANMEcYcFkIYfKc
 hseEkJP82qj7KB4RT1oerRIfSMnk8FhvCH4ND8TNqUBWAR5Ibh0wZiKpFwsuFfJIbHSW
 S6vsBJdjsa9UlgDfS/XVmMssANqMcu2zDDBbTUI0p8FF1raFGFR3WiRUbetu9P/W74d5
 Kvz/XWGZ6QEgHhUyu5xRuq0LmAHYPTuI/6O9XVdhl3vw9UCGnSksjBbfHkshin2w2Sys
 kqeQ==
X-Gm-Message-State: AO0yUKX4THjPerDRASHz96P8+O+NHPe3mS7k26FQM6SjHtD2W4YX7wwh
 /MO2IYQlLbTCn5JbrK5tuCAkiAMApcHnXn1ZxDZbePAwFaJj73JaJeqE3vygXDCLVTAOzmmdnB0
 ypKkyVq4MCUVIMwPrHqzs5SJTK7D3F3lOtf8FTABtrH6o
X-Received: by 2002:ac2:4a65:0:b0:4e2:337d:65d6 with SMTP id
 q5-20020ac24a65000000b004e2337d65d6mr4549541lfp.7.1679074864688; 
 Fri, 17 Mar 2023 10:41:04 -0700 (PDT)
X-Google-Smtp-Source: AK7set9CdcyJu3oMjS1dZleIBsSImjdRjsAwf0u1ImRH1GwD+jksre8wIHEgvYX5+jGDc3UA8hxuW0PrFQPygWsbpcM=
X-Received: by 2002:ac2:4a65:0:b0:4e2:337d:65d6 with SMTP id
 q5-20020ac24a65000000b004e2337d65d6mr4549529lfp.7.1679074864284; Fri, 17 Mar
 2023 10:41:04 -0700 (PDT)
MIME-Version: 1.0
References: <ZBLz17f8YFmNEJlY@intel.com> <20230316133449.26b62760@eldfell>
 <ZBMNEdYWsyfVq46p@intel.com>
 <CA+hFU4zWvm3-SSjtF17zjRnshEDw27gkQDLGZRk2AbnWN8+1Vg@mail.gmail.com>
 <ZBOf0m6W3ZWPy7nc@intel.com> <20230317105335.45d6a629@eldfell>
 <ZBRiIG+TEft19Kum@intel.com> <20230317153553.5b8eb460@eldfell>
 <ZBR1zs4/L+9thOEe@intel.com> <20230317173751.49c45929@eldfell>
 <ZBSWU5MK3rO6C4si@intel.com>
In-Reply-To: <ZBSWU5MK3rO6C4si@intel.com>
From: Sebastian Wick <sebastian.wick@redhat.com>
Date: Fri, 17 Mar 2023 18:40:53 +0100
Message-ID: <CA+hFU4yqUg6md+RByd6T+teyYqdkkNXS5Hm8uNtdpUw834aXkg@mail.gmail.com>
Subject: Re: [PATCH v3 09/17] drm/amd/display: Register Colorspace property
 for DP and HDMI
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
Cc: amd-gfx@lists.freedesktop.org, Pekka Paalanen <ppaalanen@gmail.com>,
 dri-devel@lists.freedesktop.org, Joshua Ashton <joshua@froggi.es>,
 Vitaly.Prosyak@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Mar 17, 2023 at 5:34=E2=80=AFPM Ville Syrj=C3=A4l=C3=A4
<ville.syrjala@linux.intel.com> wrote:
>
> On Fri, Mar 17, 2023 at 05:37:51PM +0200, Pekka Paalanen wrote:
> > On Fri, 17 Mar 2023 16:14:38 +0200
> > Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com> wrote:
> >
> > > On Fri, Mar 17, 2023 at 03:35:53PM +0200, Pekka Paalanen wrote:
> > > > On Fri, 17 Mar 2023 14:50:40 +0200
> > > > Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com> wrote:
> > > >
> > > > > On Fri, Mar 17, 2023 at 10:53:35AM +0200, Pekka Paalanen wrote:
> > > > > > On Fri, 17 Mar 2023 01:01:38 +0200
> > > > > > Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com> wrote:
> > > > > >
> > > > > > > On Thu, Mar 16, 2023 at 10:13:54PM +0100, Sebastian Wick wrot=
e:
> > > > > > > > On Thu, Mar 16, 2023 at 1:35=E2=80=AFPM Ville Syrj=C3=A4l=
=C3=A4
> > > > > > > > <ville.syrjala@linux.intel.com> wrote:
> > > > > > > > >
> > > > > > > > > On Thu, Mar 16, 2023 at 01:34:49PM +0200, Pekka Paalanen =
wrote:
> > > > > > > > > > On Thu, 16 Mar 2023 12:47:51 +0200
> > > > > > > > > > Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>=
 wrote:
> > > > > > > > > >
> > > > > > > > > > > On Thu, Mar 16, 2023 at 12:07:01PM +0200, Pekka Paala=
nen wrote:
> > > > > > > > > > > > On Thu, 16 Mar 2023 11:50:27 +0200
> > > > > > > > > > > > Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.=
com> wrote:
> > > > > > > > > > > >
> > > > > > > > > > > > > On Thu, Mar 16, 2023 at 01:37:24AM +0100, Sebasti=
an Wick wrote:
> > > > > > > > > > > > > > On Tue, Mar 7, 2023 at 4:12=E2=80=AFPM Harry We=
ntland <harry.wentland@amd.com> wrote:
> > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > We want compositors to be able to set the out=
put
> > > > > > > > > > > > > > > colorspace on DP and HDMI outputs, based on t=
he
> > > > > > > > > > > > > > > caps reported from the receiver via EDID.
> > > > > > > > > > > > > >
> > > > > > > > > > > > > > About that... The documentation says that user =
space has to check the
> > > > > > > > > > > > > > EDID for what the sink actually supports. So wh=
atever is in
> > > > > > > > > > > > > > supported_colorspaces is just what the driver/h=
ardware is able to set
> > > > > > > > > > > > > > but doesn't actually indicate that the sink sup=
ports it.
> > > > > > > > > > > > > >
> > > > > > > > > > > > > > So the only way to enable bt2020 is by checking=
 if the sink supports
> > > > > > > > > > > > > > both RGB and YUV variants because both could be=
 used by the driver.
> > > > > > > > > > > > > > Not great at all. Something to remember for the=
 new property.
> > > > > > > > > > > > >
> > > > > > > > > > > > > Hmm. I wonder if that's even legal... Looks like =
maybe it
> > > > > > > > > > > > > is since I can't immediately spot anything in CTA=
-861 to
> > > > > > > > > > > > > forbid it :/
> > > > > > > > > > > >
> > > > > > > > > > > > Wouldn't the driver do the same EDID check before c=
hoosing whether it
> > > > > > > > > > > > uses RGB or YCbCr signalling?
> > > > > > > > > > >
> > > > > > > > > > > I suppose it could. The modeset would then fail, whic=
h is perhaps
> > > > > > > > > >
> > > > > > > > > > Could? What are they missing?
> > > > > > > > >
> > > > > > > > > The fact that the new property that also affects the rgb-=
>ycbcr matrix
> > > > > > > > > doesn't even exist?
> > > > > > > >
> > > > > > > > I think the question was about the current Colorspace prope=
rty.
> > > > > >
> > > > > > Yes.
> > > > > >
> > > > > > We need to be able to set ColourPrimaries infoframe field for t=
he sink.
> > > > > > Only userspace knows what ColourPrimaries it uses, and the driv=
er has
> > > > > > no need to care at all, other than tell the sink what we have.
> > > > > >
> > > > > > When a driver chooses to use YCbCr, it needs to use the
> > > > > > MatrixCoefficients the sink expects.
> > > > > >
> > > > > > If we send the infoframe to the sink telling the signal uses BT=
.2020
> > > > > > ColourPrimaries, does that same bit pattern also tell the sink =
we are
> > > > > > using the BT.2020 NCL MatrixCoefficients if the driver chooses =
YCbCr?
> > > > > >
> > > > > > Do drivers actually use BT.2020 NCL MatrixCoefficients in that =
case?
> > > > >
> > > > > No. I think I've repeated this same line a thousand times already=
:
> > > > > The current colorspace property *only* affects the infoframe/msa/=
sdp,
> > > > > nothing else.
> > > >
> > > > That's the problem. I don't know what that means.
> > > >
> > > > Does it mean that the sink expects BT.2020 NCL MatrixCoefficients t=
o
> > > > have been used?
> > >
> > > Yes, assuming that is the colorspace property value you picked.
> > >
> > > >
> > > > And the driver will never use BT.2020 NCL MatrixCoefficients in any
> > > > circumstances?
> > >
> > > Correct.
> > >
> > > >
> > > > See the conflict? The sink will be decoding the signal incorrectly,
> > > > because we are encoding it with the wrong MatrixCoefficients if the
> > > > driver happens to silently choose YCbCr and userspace wants to send
> > > > BT2020 ColourPrimaries indicated in the infoframe.
> > >
> > > Yes. And hence I thought pretty much everyone already
> > > agreed that a new property is needed.
> >
> > I think I was confused as well with the re-posting of this series,
> > thinking it could be salvageable somehow and tried to understand how.
> > Up to Harry, I think I've left enough annoying questions by now. :-)
> >
> > > To make sure we actually understand what we're implementing
> > > I think it should start out very minimal. Eg just three values:
> > > - unspecified RGB + BT.601 YCbCr
> > > - unspecified RGB + BT.709 YCbCr
> > > - BT.2020 RGB + BT.2020 YCbCr NCL

It would be best to describe for every case both what the display and
what the driver expects as input.

> >
> > ColourPrimaries + MatrixCoefficients, respectively. Sounds fine.
> >
> > I recall hearing that DP spec actually has something like "unspecified"
> > while HDMI has only "default colorimetry" which is specified, but I'm
> > guessing that many monitors and TVs just don't implement it like they
> > should, so it's effectively unspecified.
>
> DP in theory might have default RGB (whatever that might mean) vs.
> sRGB, although at some point I think it was just vague RGB vs. CEA RGB,
> which I think in i915 we might be using to indicate limited vs. full
> quantization range instead. I think that somehow fixed some monitors
> (while many others still get the quantization range horrible wrong of
> course).
>
> HDMI/CTA-861-? IIRC didn't have anything but just "RGB", and in some
> footnote CTA-861-? then goes on to talk about the sRGB bit in the EDID.
> In the end it didn't seem to say anything definitive what the RGB
> colorimetry really means.

DP has "RGB unspecified color space (Legacy RGB mode)" without more explana=
tion.

CTA-861 has, as I said in a previous mail on this series:

"If bits C0 and C1 are zero, the colorimetry shall correspond to the
default colorimetry defined in Section 5.1"

and in Section 5.1

"In all cases described above, the RGB color space used should be the
RGB color space the Sink declares in the Basic Display Parameters and
Feature Block of its EDID."

> >
> > "unspecified" in UAPI is ok as long as there will be another distinct
> > value for "HDMI default colorimetry" or such.
> >
> > I'm not sure why anyone would want to use "unspecified" but I guess
> > it's necessary for UAPI backward compatibility.
>
> Just because the specs don't really seem to specify anything
> sensible. We could just call it "RGB" and leave it at that of
> course.

I think unspecified and default RGB are both good enough. The spec
doesn't give us much better guarantees anyway. Unspecified might even
be better because we could then add a default RGB case if we ever get
a mode which guarantees us that the colorimetry of the EDID is in
effect.

> >
> > >
> > > And that would control:
> > > - basic colorimetry metadata transmitted to the sink
> > > - MatrixCoefficients used for the potential RGB->YCbCr conversion
> > >
> > > Transfer funcs, primaries, etc. would be left out (apart from
> > > the potential metadata aspect).
> >
> > Primaries left out? What are your "unspecified RGB" and "BT.2020 RGB"
> > above then?
>
> It all seems too open to interpretation to make it anything
> but "undefined".
>
> >
> > Asking from another angle, using infoframes, is it possible to tell the
> > sink to use BT.2020 YCbCr NCL without *also* implying BT.2020
> > ColourPrimaries? Joshua seemed to be saying "no".
>
> I don't think so. The BT.2020 cases seems to be more strictrly
> defined.

The Colorimetry gives us the primaries, white point, transfer
characteristics and conversion matrix if it is for YCC. The HDR
metadata can override the transfer characteristics.

Anyways, CTA-861 is still confusing me a lot.

It has "No Data" Colorimetry but is that the same as not sending the
InfoFrame at all? Either way, the colorimetry should be the one from
the EDID.

But the transfer characteristics change with the selected Colorimetry.
In the table is "RGB" the same as "No Data" and the same as sending no
InfoFrame? But then when is the transfer characteristics of the EDID
in effect and when bt.709 from the table?

There doesn't appear to be a default colorimetry for YCC. So how would
you even automatically fall back from RGB to YCC with the same
colorimetry?

I only see the colorimetry BT.709 and not BT.601. Some other
colorimetry uses the BT.601 conversion matrix so how would
"unspecified RGB + BT.709 YCbCr" even work?

> >
> >
> > > > > >
> > > > > > If they don't, then YCbCr BT.2020 has never worked, which is an=
other
> > > > > > nail in the coffin for "Colorspace" property.
> > > > >
> > > > > That is the same nail we've been talking about all along I though=
t.
> > > > >
> > > > > > But it still means that
> > > > > > RGB BT.2020 may have worked correctly, and then drivers would r=
egress
> > > > > > if they started picking YCbCr for any reason where they previou=
sly used
> > > > > > RGB.
> > > > >
> > > > > The policy has been to use RGB if at all possible. Only falling b=
ack
> > > > > to YCbCr 4:2:0 if absolutely necessary (eg. EDID says 4:2:0 must
> > > > > be used, or there's not enough bandwidth for 4:4:4, etc.). If the
> > > > > behaviour suddenly changes then it probably means the driver was
> > > > > doing something illegal before by using RGB 4:4:4.
> > > >
> > > > Ok.
> > > >
> > > > > > > > > >
> > > > > > > > > > I mean, drivers are already automatically choosing betw=
een RGB and YCbCr
> > > > > > > > > > signalling based on e.g. available bandwidth. Surely th=
ey already will
> > > > > > > > > > not attempt to send a signal format to a monitor that d=
oes not say it
> > > > > > > > > > supports that?
> > > > > > > >
> > > > > > > > That's exactly what they do. The drivers don't check the ED=
ID for the
> > > > > > > > colorimetry the sink supports and the responsibility is pun=
ted off to
> > > > > > > > user space.
> > > > > >
> > > > > > I suspect there are two different things:
> > > > > >
> > > > > > - which of RGB, YCbCr 4:4:4, YCbCr 4:2:0 can the sink take
> > > > > > - the supported MatrixCoefficients for each of the YCbCr
> > > > > >
> > > > > > Surely drivers are already checking the former point?
> > > > >
> > > > > Yes.
> > > > >
> > > > > >
> > > > > > I'm not surprised if they are not checking the latter point, bu=
t they
> > > > > > do need to, because it is the driver making the choice between =
RGB and
> > > > > > some YCbCr.
> > > > >
> > > > > This point has been irrelevant since we always select BT.709
> > > > > and there is no optional feature bit in EDID to check for that.
> > > > > Presumaly it is mandatory for sinks to support both BT.601 and
> > > > > BT.709 whenever they support YCbCr in general.
> > > >
> > > > Ok, so BT.601 and BT.709 MatrixCoefficients are cool. How do you te=
ll
> > > > the sink which one you used, btw?
> > >
> > > Through the same infoframe/msa/sdp stuff. But that only works
> > > correctly if the colorspace property is left at the default value.
> > >
> > > >
> > > > What about BT.2020 MatrixCoefficients?
> > >
> > > It would have to work the same way, if we actually ever used
> > > this.
> >
> > Good.
> >
> >
> > Thanks,
> > pq
>
>
>
> --
> Ville Syrj=C3=A4l=C3=A4
> Intel
>

