Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D055618B39
	for <lists+dri-devel@lfdr.de>; Thu,  3 Nov 2022 23:16:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0FE010E035;
	Thu,  3 Nov 2022 22:16:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x72e.google.com (mail-qk1-x72e.google.com
 [IPv6:2607:f8b0:4864:20::72e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B27E210E035
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Nov 2022 22:16:16 +0000 (UTC)
Received: by mail-qk1-x72e.google.com with SMTP id x18so2102758qki.4
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Nov 2022 15:16:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ndufresne-ca.20210112.gappssmtp.com; s=20210112;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
 :date:message-id:reply-to;
 bh=pODj0/yhwr34aGTdCwiObdgtdTlvnUJq2228nYiFL6g=;
 b=LdVvtJYajkOV8zBfmUwBjReAAJQsOHJQ/OCaOJRNR81olJ+XlcS/9EXCD84AGwbEOk
 p3Ksyk8lDXCtYFtDj8OgDND/Nw2S0gnudNmYej/ONzGlKM8CAG9Y/AAR8CVy/dsfj1PY
 q8nCzJRtnfeWPIdDQdG6kymaxWhXhedHSirR632lAw76Y7yDr06N7SbyBNvAEe8tJEBf
 r1igoY2W6W9Ix1dqvSx0SaaQHWwg8qcJ5Ce+NuWIdTqvUfyUxp5C7gsQaBXNA/RH0iNR
 YAebML3EdGkJivf9eV1v/TNMNv34aJcP3mGAGMZKvAF/n6HPb6fEpKfKmcDtFSQnkd91
 rQWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=pODj0/yhwr34aGTdCwiObdgtdTlvnUJq2228nYiFL6g=;
 b=mR5WAwhzxIDsm69zRO+Kchh5C0I2uFsSd7dvbUIaO6KYAnTVuOJrxoe9WHGEBNBYf0
 a+L1z//b0F8FtYk04VISqfSxNtyIGCy5oMF0QlfT/sa0xmRX/nR6kzEJ4Lk79GvLQTrm
 7Pbz8Tt1BRJ75zvpg0LxGz2uSoFSI0KK05I3bO1s1TK1cHPt31h53kaGCEpbshzHY5TJ
 6Bbm7c6ZhPFf7TkYkWDxUZFlb/D+PX2ekduKBC7U9zKlCA7yItnDFZbZzAbkjmSh7meD
 xwJOWBCIC+Lo4RI9drjtBVe1YuWBDUl/kB0rmxYo7zaV4ArOSRfZ60M9JGnHI2UnX1CN
 weuA==
X-Gm-Message-State: ACrzQf1Cw3YtHe5IIWthkJC5oBFD04w9YsOI9wY71m/B27hRVca8sWB/
 hZtvR68ovKHyOuW6HAh+aIiDFw==
X-Google-Smtp-Source: AMsMyM4uaTY2GHWcd0dvxGMAGIJXnuWln4b/4+oGB18CZ2L57bvrG1VBquXjNLw3OMk2uz2dPGDzZg==
X-Received: by 2002:a05:620a:1122:b0:6fa:63a9:e0bc with SMTP id
 p2-20020a05620a112200b006fa63a9e0bcmr7609204qkk.105.1667513775699; 
 Thu, 03 Nov 2022 15:16:15 -0700 (PDT)
Received: from nicolas-tpx395.localdomain (192-222-136-102.qc.cable.ebox.net.
 [192.222.136.102]) by smtp.gmail.com with ESMTPSA id
 bj22-20020a05620a191600b006f956766f76sm1782416qkb.1.2022.11.03.15.16.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Nov 2022 15:16:14 -0700 (PDT)
Message-ID: <90a1fb6101483971ef14d22370aac50d494a4752.camel@ndufresne.ca>
Subject: Re: Try to address the DMA-buf coherency problem
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>, 
 Daniel Stone <daniel@fooishbar.org>
Date: Thu, 03 Nov 2022 18:16:13 -0400
In-Reply-To: <b422be59-4b4b-2d0d-8e8c-b19f27c6832e@gmail.com>
References: <20221020121316.3946-1-christian.koenig@amd.com>
 <3d7353f3fa5905ce18e5b2d92f758f098189bc5a.camel@pengutronix.de>
 <7f5eff36-6886-bb06-061a-dd4263b61605@gmail.com>
 <f5de84cfe81fee828bbe0d47d379028d28ef6ca6.camel@pengutronix.de>
 <e02cedc2-6741-8813-a7a5-f8769e301745@gmail.com>
 <a53e5df51ec0f2f9d4c2d377c0cc5ba85f2e58ff.camel@ndufresne.ca>
 <9d716641-55c6-1590-26c2-1c3b14a28226@gmail.com>
 <CAPj87rMPkmimR_RJHhxYZokH__TVpPArk0h6drOUSx7Z9+oAHA@mail.gmail.com>
 <11a6f97c-e45f-f24b-8a73-48d5a388a2cc@gmail.com>
 <caf4d6b82843788db97555a58bc9e33915e5b50a.camel@ndufresne.ca>
 <b422be59-4b4b-2d0d-8e8c-b19f27c6832e@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4 (3.44.4-2.fc36) 
MIME-Version: 1.0
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
Cc: ppaalanen@gmail.com, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-media@vger.kernel.org,
 sumit.semwal@linaro.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Le mercredi 02 novembre 2022 =C3=A0 12:18 +0100, Christian K=C3=B6nig a =C3=
=A9crit=C2=A0:
> Am 01.11.22 um 22:09 schrieb Nicolas Dufresne:
> > [SNIP]
> > > > But the client is just a video player. It doesn't understand how to
> > > > allocate BOs for Panfrost or AMD or etnaviv. So without a universal
> > > > allocator (again ...), 'just allocate on the GPU' isn't a useful
> > > > response to the client.
> > > Well exactly that's the point I'm raising: The client *must* understa=
nd
> > > that!
> > >=20
> > > See we need to be able to handle all restrictions here, coherency of =
the
> > > data is just one of them.
> > >=20
> > > For example the much more important question is the location of the d=
ata
> > > and for this allocating from the V4L2 device is in most cases just no=
t
> > > going to fly.
> > It feels like this is a generic statement and there is no reason it cou=
ld not be
> > the other way around.
>=20
> And exactly that's my point. You always need to look at both ways to=20
> share the buffer and can't assume that one will always work.
>=20
> As far as I can see it you guys just allocate a buffer from a V4L2=20
> device, fill it with data and send it to Wayland for displaying.

That paragraph is a bit sloppy. By "you guys" you mean what exactly ? Norma=
l
users will let V4L2 device allocate and write into their own memory (the de=
vice
fill it, not "you guys"). This is done like this simply because this is
guarantied to work with the V4L2 device. Most V4L2 device produces known by
userpsace pixel formats and layout, for which userspace know for sure it ca=
n
implement a GPU shader or software fallback for. I'm still to see one of th=
ese
format that cannot be efficiently imported into a modern GPU and converted =
using
shaders. I'm not entirely sure what/which GPU a dGPU is compared to a GPU b=
tw.

In many cases, camera kind of V4L2 devices will have 1 producer for many
consumers. Consider your photo application, the streams will likely be capt=
ure
and displayed while being encoded by one of more CODEC, while being streame=
d to
a Machine Learning model for analyses. The software complexity to communica=
te
back the list of receiver devices and implementing all their non-standard w=
ay to
allocate memory, so all the combination of trial and error is just ridiculo=
usly
high. Remember that each GPU have their own allocation methods and corner c=
ases,
this is simply not manageable by "you guys", which I pretty much assume is
everyone writing software for Generic Linux these days (non-Android/ChromeO=
S).

>=20
> To be honest I'm really surprised that the Wayland guys hasn't pushed=20
> back on this practice already.
>=20
> This only works because the Wayland as well as X display pipeline is=20
> smart enough to insert an extra copy when it find that an imported=20
> buffer can't be used as a framebuffer directly.

This is a bit inaccurate. The compositor I've worked with (Gnome and Weston=
)
will only memcpy SHM. For DMABuf, they will fail importation if its not usa=
ble
either by the display or the GPU. Specially on the GPU side though (which i=
s the
ultimate compositor fallback), there exists efficient HW copy mechanism tha=
t may
be used, and this is fine, since unlike your scannout example, it won't be
uploading over and over, but will do later re-display from a remote copy (o=
r
transformed copy). Or if you prefer, its cached at the cost of higher memor=
y
usage.

I think it would be preferable to speak about device to device sharing, sin=
ce
V4L2 vs GPU is not really representative of the program. I think V4L2 vs GP=
U and
"you guys" simply contribute to the never ending, and needless friction aro=
und
that difficulty that exists with current support for memory sharing in Linu=
x.

>=20
> >   I have colleague who integrated PCIe CODEC (Blaize Xplorer
> > X1600P PCIe Accelerator) hosting their own RAM. There was large amount =
of ways
> > to use it. Of course, in current state of DMABuf, you have to be an exp=
orter to
> > do anything fancy, but it did not have to be like this, its a design ch=
oice. I'm
> > not sure in the end what was the final method used, the driver isn't ye=
t
> > upstream, so maybe that is not even final. What I know is that there is=
 various
> > condition you may use the CODEC for which the optimal location will var=
y. As an
> > example, using the post processor or not, see my next comment for more =
details.
>=20
> Yeah, and stuff like this was already discussed multiple times. Local=20
> memory of devices can only be made available by the exporter, not the=20
> importer.
>=20
> So in the case of separated camera and encoder you run into exactly the=
=20
> same limitation that some device needs the allocation to happen on the=
=20
> camera while others need it on the encoder.
>=20
> > > The more common case is that you need to allocate from the GPU and th=
en
> > > import that into the V4L2 device. The background is that all dGPUs I
> > > know of need the data inside local memory (VRAM) to be able to scan o=
ut
> > > from it.
> > The reality is that what is common to you, might not be to others. In m=
y work,
> > most ARM SoC have display that just handle direct scannout from cameras=
 and
> > codecs.
>=20
> > The only case the commonly fails is whenever we try to display UVC
> > created dmabuf,
>=20
> Well, exactly that's not correct! The whole x86 use cases of direct=20
> display for dGPUs are broken because media players think they can do the=
=20
> simple thing and offload all the problematic cases to the display server.
>=20
> This is absolutely *not* the common use case you describe here, but=20
> rather something completely special to ARM.

sigh .. The UVC failures was first discovered on my Intel PC, and later
reproduced on ARM. Userspace expected driver(s) (V4L2 exports, DRM imports)
should have rejected the DMABuf import (I kind of know, I wrote this part).=
 From
a userspace point of you, unlike what you stipulate here, there was no faul=
t.
You said already that importer / exporter role is to be tried, the order yo=
u try
should not matter. So yes, today's userspace may lack the ability to flip t=
he
roles, but at least it tries, and if the driver does not fail, you can't bl=
ame
userspace for at least trying to achieve decent performance.

I'd like to remind that this is clearly all kernel bugs, and we cannot stat=
e
that kernel drivers "are broken because media player". Just the fact that t=
his
thread starts from a kernel changes kind of prove it. Would be nice also fo=
r you
to understand that I'm not against the method used in this patchset, but I'=
m not
against a bracketing mechanism either, as I think the former can improve, w=
here
the first one only give more "correct" results.

>=20
> >   which have dirty CPU write cache and this is the type of thing
> > we'd like to see solved. I think this series was addressing it in princ=
iple, but
> > failing the import and the raised point is that this wasn't the optimal=
 way.
> >=20
> > There is a community project called LibreELEC, if you aren't aware, the=
y run
> > Khodi with direct scanout of video stream on a wide variety of SoC and =
they use
> > the CODEC as exporter all the time. They simply don't have cases were t=
he
> > opposite is needed (or any kind of remote RAM to deal with). In fact, F=
FMPEG
> > does not really offer you any API to reverse the allocation.
>=20
> Ok, let me try to explain it once more. It sounds like I wasn't able to=
=20
> get my point through.
>=20
> That we haven't heard anybody screaming that x86 doesn't work is just=20
> because we handle the case that a buffer isn't directly displayable in=
=20
> X/Wayland anyway, but this is absolutely not the optimal solution.

Basically, you are complaining that compositor will use GPU shaders to adap=
t the
buffers for the display. Most display don't do or have limited YUV support,
flipping the roles or bracketing won't help that. Using a GPU shader to ada=
pt
it, like compositor and userspace do seems all right. And yes, sometimes th=
e
memory will get imported into the GPU very efficiently, something in the mi=
d-
range, and other times some GPU stack (which is userspace) will memcpy. But
remember that the GPU stack is programmed to work with a specific GPU, not =
the
higher level userland.

>=20
> The argument that you want to keep the allocation on the codec side is=
=20
> completely false as far as I can see.

I haven't made this argument, and don't intend to do so. There is nothing i=
n
this thread that should be interpreted as I want, or not want. I want the s=
ame
thing as everyone on this list, which is both performance and correct resul=
ts.

>=20
> We already had numerous projects where we reported this practice as bugs=
=20
> to the GStreamer and FFMPEG project because it won't work on x86 with dGP=
Us.

Links ? Remember that I do read every single bugs and emails around GStream=
er
project. I do maintain older and newer V4L2 support in there. I also did
contribute a lot to the mechanism GStreamer have in-place to reverse the
allocation. In fact, its implemented, the problem being that on generic Lin=
ux,
the receiver element, like the GL element and the display sink don't have a=
ny
API they can rely on to allocate memory. Thus, they don't implement what we=
 call
the allocation offer in GStreamer term. Very often though, on other modern =
OS,
or APIs like VA, the memory offer is replaced by a context. So the allocati=
on is
done from a "context" which is neither an importer or an exporter. This is
mostly found on MacOS and Windows.

Was there APIs suggested to actually make it manageable by userland to allo=
cate
from the GPU? Yes, this what Linux Device Allocator idea is for. Is that AP=
I
ready, no.

Can we at least implement some DRM memory allocation, yes, but remember tha=
t,
until very recently, the DRM drivers used by the display path was not expos=
ed
through Wayland. This issue has only been resolved recently, it will take s=
ome
time before this propagate through compositors code. And you need composito=
r
implementation to do GL and multimedia stack implementation. Please, keep i=
n
mind before raising bad practice by GStreamer and FFMPEG developers that ge=
tting
all the bit and pieces in place require back and forth, there has been huge=
 gaps
that these devs were not able to overcome yet. Also, remember that these st=
ack
don't have any contract to support Linux. They support it to the best of th=
eir
knowledge and capabilities, along with Windows, MacOS, IOS, Android and mor=
e.
And to my experience, memory sharing have different challenges in all of th=
ese
OS.

>=20
> This is just a software solution which works because of coincident and=
=20
> not because of engineering.

Another argument I can't really agree with, there is a lot of effort put in=
to
fallback (mostly GPU fallback) in various software stack. These fallback ar=
e
engineered to guaranty you can display your frames. That case I've raised s=
hould
have ended well with a GPU/CPU fallback, but a kernel bug broke the ability=
 to
fallback. If the kernel had rejected the import (your series ?), or offered=
 a
bracketing mechanism (for the UVC case, both method would have worked), the=
 end
results would have just worked.

I would not disagree if someone states that DMAbuf in UVC driver is an abus=
e.
The driver simply memcpy chunk of variable size data streamed by the usb ca=
mera
into a normal memory buffer. So why is that exported as a dmabuf ? I don't =
have
an strong opinion on that, but if you think this is wrong, then it proves m=
y
point that this is a kernel bug. The challenge here is to come up with how =
we
will fix this, and sharing a good understanding of what today's userspace d=
o,
and why they do so is key to make proper designs. As I started, writing cod=
e for
DMABuf subsystem is out of reach for me, I can only share what existing sof=
tware
do, and why it does it like this.

Nicolas

>=20
> Regards,
> Christian.
>=20
>=20

