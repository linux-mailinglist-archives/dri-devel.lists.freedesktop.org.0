Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ABD7D6BF0FE
	for <lists+dri-devel@lfdr.de>; Fri, 17 Mar 2023 19:48:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C690A10E0F7;
	Fri, 17 Mar 2023 18:48:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DB8A10E16C
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Mar 2023 18:48:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679078886;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VPmK/yFPYc++Dc+QNcjC5e8WNkGVxwFqWW4ZoZGr3pc=;
 b=ao1s/MsK1eRvKleNwde96bAIRZLGjg6gDgehtcZAKnOFkwkKvqxeZ4ngvOsD3WRwV/8btG
 i1C74K023aBTNNEr68aphEuS+O6daVa8MhGQsClgJ0pF344RiI4+lGFd0G0RngF4vHO8QE
 QAmiocNUvjHLKC1aNYxZTQSOi3pEbvk=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-497-qMGUJbD0PvKkmajvo8001A-1; Fri, 17 Mar 2023 14:48:05 -0400
X-MC-Unique: qMGUJbD0PvKkmajvo8001A-1
Received: by mail-lf1-f71.google.com with SMTP id
 j20-20020a056512345400b004dc807c2948so2311146lfr.8
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Mar 2023 11:48:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679078883;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VPmK/yFPYc++Dc+QNcjC5e8WNkGVxwFqWW4ZoZGr3pc=;
 b=HrONxT70R8IwLgwfN/Re9/whTrue3s2+k4I5VZQGa4WQCcffDEFmAKZOqcB80zi5ho
 RnJt4fts/ta+B5+JJFuLV5eSiEB1JlWnx5uX4kBNkwPhtPLiTeKDGw36Boaj6/qQIGEk
 3auGXXiJFuZ3/G3X0hk5oGNGwfc1MHuAd4Y1sWnJDIykNtK7QdoA55RAFdzUOgfWe7Ub
 kK0+xFNbT1NVWYHaSPzvDBPO/d6sndyGoH/JzpFWTZDBrTU3RdKkA+NdgNWnHrurATuD
 CUuDmrIVP/AP+VojTWpMQmLBy0UN0Nxh2j5n1YtzywW7b1pLNxHiXryz573ESKuCMvUD
 qQtQ==
X-Gm-Message-State: AO0yUKUwe3nQ4A4fUqZn2v2+soqXczsdTfliMH3IYRRV64ioopmY3v+L
 xcJ00H8P6HcuOR0Qd+/bDbxGqJdUiK3dxZBS/zRlJF7KlumGCQ1neTNYymxOZ3KBk4fhMx7tVBW
 sOAn3qQrMEairq7WbXoFZPusLpDTJ4lQLPkiYGevs8VkK
X-Received: by 2002:a2e:7218:0:b0:29a:7cf0:3535 with SMTP id
 n24-20020a2e7218000000b0029a7cf03535mr1044952ljc.4.1679078883690; 
 Fri, 17 Mar 2023 11:48:03 -0700 (PDT)
X-Google-Smtp-Source: AK7set9oX2XCj5mwKKb6dS5YUPIKXha2jloa9jBDSd/GVWqTbkWwaZHF2n7l1jsFqhEhxeF4WLkB1GSQBguZ3FTUcy8=
X-Received: by 2002:a2e:7218:0:b0:29a:7cf0:3535 with SMTP id
 n24-20020a2e7218000000b0029a7cf03535mr1044939ljc.4.1679078883330; Fri, 17 Mar
 2023 11:48:03 -0700 (PDT)
MIME-Version: 1.0
References: <ZBMNEdYWsyfVq46p@intel.com>
 <CA+hFU4zWvm3-SSjtF17zjRnshEDw27gkQDLGZRk2AbnWN8+1Vg@mail.gmail.com>
 <ZBOf0m6W3ZWPy7nc@intel.com> <20230317105335.45d6a629@eldfell>
 <ZBRiIG+TEft19Kum@intel.com> <20230317153553.5b8eb460@eldfell>
 <ZBR1zs4/L+9thOEe@intel.com> <20230317173751.49c45929@eldfell>
 <ZBSWU5MK3rO6C4si@intel.com>
 <CA+hFU4yqUg6md+RByd6T+teyYqdkkNXS5Hm8uNtdpUw834aXkg@mail.gmail.com>
 <ZBSznxjbnREwLj9E@intel.com>
In-Reply-To: <ZBSznxjbnREwLj9E@intel.com>
From: Sebastian Wick <sebastian.wick@redhat.com>
Date: Fri, 17 Mar 2023 19:47:52 +0100
Message-ID: <CA+hFU4zv_FP75zj3PF2bi8MGA6A=vWaF=ObfNjSj1SYrtuwPXg@mail.gmail.com>
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

On Fri, Mar 17, 2023 at 7:38=E2=80=AFPM Ville Syrj=C3=A4l=C3=A4
<ville.syrjala@linux.intel.com> wrote:
>
> On Fri, Mar 17, 2023 at 06:40:53PM +0100, Sebastian Wick wrote:
> > On Fri, Mar 17, 2023 at 5:34=E2=80=AFPM Ville Syrj=C3=A4l=C3=A4
> > <ville.syrjala@linux.intel.com> wrote:
> > >
> > > On Fri, Mar 17, 2023 at 05:37:51PM +0200, Pekka Paalanen wrote:
> > > > On Fri, 17 Mar 2023 16:14:38 +0200
> > > > Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com> wrote:
> > > >
> > > > > On Fri, Mar 17, 2023 at 03:35:53PM +0200, Pekka Paalanen wrote:
> > > > > > On Fri, 17 Mar 2023 14:50:40 +0200
> > > > > > Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com> wrote:
> > > > > >
> > > > > > > On Fri, Mar 17, 2023 at 10:53:35AM +0200, Pekka Paalanen wrot=
e:
> > > > > > > > On Fri, 17 Mar 2023 01:01:38 +0200
> > > > > > > > Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com> wro=
te:
> > > > > > > >
> > > > > > > > > On Thu, Mar 16, 2023 at 10:13:54PM +0100, Sebastian Wick =
wrote:
> > > > > > > > > > On Thu, Mar 16, 2023 at 1:35=E2=80=AFPM Ville Syrj=C3=
=A4l=C3=A4
> > > > > > > > > > <ville.syrjala@linux.intel.com> wrote:
> > > > > > > > > > >
> > > > > > > > > > > On Thu, Mar 16, 2023 at 01:34:49PM +0200, Pekka Paala=
nen wrote:
> > > > > > > > > > > > On Thu, 16 Mar 2023 12:47:51 +0200
> > > > > > > > > > > > Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.=
com> wrote:
> > > > > > > > > > > >
> > > > > > > > > > > > > On Thu, Mar 16, 2023 at 12:07:01PM +0200, Pekka P=
aalanen wrote:
> > > > > > > > > > > > > > On Thu, 16 Mar 2023 11:50:27 +0200
> > > > > > > > > > > > > > Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.in=
tel.com> wrote:
> > > > > > > > > > > > > >
> > > > > > > > > > > > > > > On Thu, Mar 16, 2023 at 01:37:24AM +0100, Seb=
astian Wick wrote:
> > > > > > > > > > > > > > > > On Tue, Mar 7, 2023 at 4:12=E2=80=AFPM Harr=
y Wentland <harry.wentland@amd.com> wrote:
> > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > We want compositors to be able to set the=
 output
> > > > > > > > > > > > > > > > > colorspace on DP and HDMI outputs, based =
on the
> > > > > > > > > > > > > > > > > caps reported from the receiver via EDID.
> > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > About that... The documentation says that u=
ser space has to check the
> > > > > > > > > > > > > > > > EDID for what the sink actually supports. S=
o whatever is in
> > > > > > > > > > > > > > > > supported_colorspaces is just what the driv=
er/hardware is able to set
> > > > > > > > > > > > > > > > but doesn't actually indicate that the sink=
 supports it.
> > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > So the only way to enable bt2020 is by chec=
king if the sink supports
> > > > > > > > > > > > > > > > both RGB and YUV variants because both coul=
d be used by the driver.
> > > > > > > > > > > > > > > > Not great at all. Something to remember for=
 the new property.
> > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > Hmm. I wonder if that's even legal... Looks l=
ike maybe it
> > > > > > > > > > > > > > > is since I can't immediately spot anything in=
 CTA-861 to
> > > > > > > > > > > > > > > forbid it :/
> > > > > > > > > > > > > >
> > > > > > > > > > > > > > Wouldn't the driver do the same EDID check befo=
re choosing whether it
> > > > > > > > > > > > > > uses RGB or YCbCr signalling?
> > > > > > > > > > > > >
> > > > > > > > > > > > > I suppose it could. The modeset would then fail, =
which is perhaps
> > > > > > > > > > > >
> > > > > > > > > > > > Could? What are they missing?
> > > > > > > > > > >
> > > > > > > > > > > The fact that the new property that also affects the =
rgb->ycbcr matrix
> > > > > > > > > > > doesn't even exist?
> > > > > > > > > >
> > > > > > > > > > I think the question was about the current Colorspace p=
roperty.
> > > > > > > >
> > > > > > > > Yes.
> > > > > > > >
> > > > > > > > We need to be able to set ColourPrimaries infoframe field f=
or the sink.
> > > > > > > > Only userspace knows what ColourPrimaries it uses, and the =
driver has
> > > > > > > > no need to care at all, other than tell the sink what we ha=
ve.
> > > > > > > >
> > > > > > > > When a driver chooses to use YCbCr, it needs to use the
> > > > > > > > MatrixCoefficients the sink expects.
> > > > > > > >
> > > > > > > > If we send the infoframe to the sink telling the signal use=
s BT.2020
> > > > > > > > ColourPrimaries, does that same bit pattern also tell the s=
ink we are
> > > > > > > > using the BT.2020 NCL MatrixCoefficients if the driver choo=
ses YCbCr?
> > > > > > > >
> > > > > > > > Do drivers actually use BT.2020 NCL MatrixCoefficients in t=
hat case?
> > > > > > >
> > > > > > > No. I think I've repeated this same line a thousand times alr=
eady:
> > > > > > > The current colorspace property *only* affects the infoframe/=
msa/sdp,
> > > > > > > nothing else.
> > > > > >
> > > > > > That's the problem. I don't know what that means.
> > > > > >
> > > > > > Does it mean that the sink expects BT.2020 NCL MatrixCoefficien=
ts to
> > > > > > have been used?
> > > > >
> > > > > Yes, assuming that is the colorspace property value you picked.
> > > > >
> > > > > >
> > > > > > And the driver will never use BT.2020 NCL MatrixCoefficients in=
 any
> > > > > > circumstances?
> > > > >
> > > > > Correct.
> > > > >
> > > > > >
> > > > > > See the conflict? The sink will be decoding the signal incorrec=
tly,
> > > > > > because we are encoding it with the wrong MatrixCoefficients if=
 the
> > > > > > driver happens to silently choose YCbCr and userspace wants to =
send
> > > > > > BT2020 ColourPrimaries indicated in the infoframe.
> > > > >
> > > > > Yes. And hence I thought pretty much everyone already
> > > > > agreed that a new property is needed.
> > > >
> > > > I think I was confused as well with the re-posting of this series,
> > > > thinking it could be salvageable somehow and tried to understand ho=
w.
> > > > Up to Harry, I think I've left enough annoying questions by now. :-=
)
> > > >
> > > > > To make sure we actually understand what we're implementing
> > > > > I think it should start out very minimal. Eg just three values:
> > > > > - unspecified RGB + BT.601 YCbCr
> > > > > - unspecified RGB + BT.709 YCbCr
> > > > > - BT.2020 RGB + BT.2020 YCbCr NCL
> >
> > It would be best to describe for every case both what the display and
> > what the driver expects as input.
>
> I don't want the uapi to make any claims about the display. Half the
> real world displays are going to interpret it some other way anyway.
>
> So all I think we can promise is:
> - exactly what colorimetry we will indicate to the display in the metadat=
a
> - exactly what MatrixCoefficients we will use for RGB->YCbCr conversion
>
> After that it's between you and your god^W display vendor what happens.

Sure, that's what I meant with "what the display expects" but "what we
indicate to the display" is more accurate indeed.

> >
> > > >
> > > > ColourPrimaries + MatrixCoefficients, respectively. Sounds fine.
> > > >
> > > > I recall hearing that DP spec actually has something like "unspecif=
ied"
> > > > while HDMI has only "default colorimetry" which is specified, but I=
'm
> > > > guessing that many monitors and TVs just don't implement it like th=
ey
> > > > should, so it's effectively unspecified.
> > >
> > > DP in theory might have default RGB (whatever that might mean) vs.
> > > sRGB, although at some point I think it was just vague RGB vs. CEA RG=
B,
> > > which I think in i915 we might be using to indicate limited vs. full
> > > quantization range instead. I think that somehow fixed some monitors
> > > (while many others still get the quantization range horrible wrong of
> > > course).
> > >
> > > HDMI/CTA-861-? IIRC didn't have anything but just "RGB", and in some
> > > footnote CTA-861-? then goes on to talk about the sRGB bit in the EDI=
D.
> > > In the end it didn't seem to say anything definitive what the RGB
> > > colorimetry really means.
> >
> > DP has "RGB unspecified color space (Legacy RGB mode)" without more exp=
lanation.
> >
> > CTA-861 has, as I said in a previous mail on this series:
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
> > > >
> > > > "unspecified" in UAPI is ok as long as there will be another distin=
ct
> > > > value for "HDMI default colorimetry" or such.
> > > >
> > > > I'm not sure why anyone would want to use "unspecified" but I guess
> > > > it's necessary for UAPI backward compatibility.
> > >
> > > Just because the specs don't really seem to specify anything
> > > sensible. We could just call it "RGB" and leave it at that of
> > > course.
> >
> > I think unspecified and default RGB are both good enough. The spec
> > doesn't give us much better guarantees anyway. Unspecified might even
> > be better because we could then add a default RGB case if we ever get
> > a mode which guarantees us that the colorimetry of the EDID is in
> > effect.
> >
> > > >
> > > > >
> > > > > And that would control:
> > > > > - basic colorimetry metadata transmitted to the sink
> > > > > - MatrixCoefficients used for the potential RGB->YCbCr conversion
> > > > >
> > > > > Transfer funcs, primaries, etc. would be left out (apart from
> > > > > the potential metadata aspect).
> > > >
> > > > Primaries left out? What are your "unspecified RGB" and "BT.2020 RG=
B"
> > > > above then?
> > >
> > > It all seems too open to interpretation to make it anything
> > > but "undefined".
> > >
> > > >
> > > > Asking from another angle, using infoframes, is it possible to tell=
 the
> > > > sink to use BT.2020 YCbCr NCL without *also* implying BT.2020
> > > > ColourPrimaries? Joshua seemed to be saying "no".
> > >
> > > I don't think so. The BT.2020 cases seems to be more strictrly
> > > defined.
> >
> > The Colorimetry gives us the primaries, white point, transfer
> > characteristics and conversion matrix if it is for YCC. The HDR
> > metadata can override the transfer characteristics.
> >
> > Anyways, CTA-861 is still confusing me a lot.
> >
> > It has "No Data" Colorimetry but is that the same as not sending the
> > InfoFrame at all? Either way, the colorimetry should be the one from
> > the EDID.
> >
> > But the transfer characteristics change with the selected Colorimetry.
> > In the table is "RGB" the same as "No Data" and the same as sending no
> > InfoFrame? But then when is the transfer characteristics of the EDID
> > in effect and when bt.709 from the table?
> >
> > There doesn't appear to be a default colorimetry for YCC. So how would
> > you even automatically fall back from RGB to YCC with the same
> > colorimetry?
> >
> > I only see the colorimetry BT.709 and not BT.601. Some other
> > colorimetry uses the BT.601 conversion matrix so how would
> > "unspecified RGB + BT.709 YCbCr" even work?
>
> It just means:
> - if we output RGB we the colorimetry signalled will be "no data"
>   value (or whatever the "i don't know what anything means" value)
> - if we output YCbCr the colorimetry signalled will be the BT.709
>   value, and the YCbCr data will be produced using the BT.709
>   MatrixCoefficients
>
> Beyond that absolutely no promises about anything.

Then we have different primary chromaticities depending on if the
kernel chose RGB or YCC.

When you signal the BT.709 colorimetry you're not only signalling the
conversion matrix, you're also signaling the expected primary
chromaticities and transfer characteristics as well and they will not
match the default/no-data/unspecified colorimetry.

> --
> Ville Syrj=C3=A4l=C3=A4
> Intel
>

