Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BF06A67C22
	for <lists+dri-devel@lfdr.de>; Tue, 18 Mar 2025 19:38:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79B1C10E1A9;
	Tue, 18 Mar 2025 18:38:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="r7vx7fp2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com
 [209.85.219.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 305E610E1A9
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Mar 2025 18:38:05 +0000 (UTC)
Received: by mail-qv1-f46.google.com with SMTP id
 6a1803df08f44-6e41e17645dso53302996d6.2
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Mar 2025 11:38:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1742323084; x=1742927884;
 darn=lists.freedesktop.org; 
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
 :date:message-id:reply-to;
 bh=svw9EZxkPMxgX/rKP7N3fQy0RVcn8m9OHxj5oL/d/5g=;
 b=r7vx7fp2p54tosgI+/zQYPlMMajwk1+1wHk5PCW1FZBCq1FaGl4aZvCiRYp2ConofC
 OLoa2SVd9bNh/9e3v/FgbTLstl2DQzB1HepUHFuWdVLnPCFlTazBwzOt1ozIu2p4jIOq
 YcGiHxr2rDbaDBeTmh5l2q2UYZIx6PGaV7xU76s0g6jhd8JhrIvZcI+qc9AySj1vOcvK
 /Ne5wdv/V0as+pawQE1Yf1CnrCV0sy1qILCI/SKCTfEQBJ/02G8dhTT9+gclXqIx9d5j
 fkzX8ZEdRTMWSSk+jQxiBqMWbcFHxDLLpT1xdUnY5QyeLjo6Rm03ZGUzY3L72N2f9qgZ
 ZCcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742323084; x=1742927884;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=svw9EZxkPMxgX/rKP7N3fQy0RVcn8m9OHxj5oL/d/5g=;
 b=Ltxirg7s8fdzCp+S928bptVzvvVvru14/xlUqSWUMvFvUvIdfxALp5pitWiTy7j48b
 hk0FYErCpzlkBrb6DiU0Sml1R2ra3V8f75hQdhl2lMW4XRV9QXIdH8vnSysrw9frUbw+
 q08kd4u5NlHFAETr2NVi5ohrDfBNyNp7NtraheiegNj7dzFAVomF07CTrDEZd/hVFtQO
 33eWPNXEs2Ye3KVaP/vapm7AimQpOBc2GJugV/81gwxiqrL5Vzf90R3pAyHixR2bQwV4
 R3Ofdf2AvNjAAd8CzdqsHlVIWWUXEtYNs67HOp41go+73/q58Y+CmrYDuVajP0Nd8d+8
 MAkw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW1DvbB9T6sHzCvvlhESsFt8ncxT3YywL9mtANIhWWz4XHsQn23fBJFhjev079lUJQvZAPcsmNocMk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywr2haLrujjhrXyPKKGXoZ4e8xUSONP1k4DdQZSyykilG97TxEb
 NJFz/tvL89ZxIGk/7L5eQlQrSuJtScSVREAngZMYxS21okKndFf1p8Kb0o6gkns=
X-Gm-Gg: ASbGncsdXiWRe8N6RUKZrMg0SnmqmHHYFp1A6IVaDHvEt+tQ0riGTsKwUJq9gPKebP2
 XB8bP+GI4OA/WSOumi8dwqwOG5w09eBWwf//R2y3Z/KoQdhFyU8FsC02XZBiZ+49tdC5gis5qY3
 jRO0gyB8HLaJJ//U2kIqnFrjGrKODQJhrlOaEl+U15vuwnlEchXPb2aX4lJFwoDKxoMCx2LrQqV
 LWzPt+kOoqcZeT1sgjM/6E2fUKcY/cbO/f7MZ15yGadk0OrVC0lOBvpRGBp0UINjc9bAvJ45Jhl
 J6Yn1RPCFmi63zvMuGKzKBSui0RKUf9RAxwjPaguIMmuPM0DoyQjrH1ANUWI
X-Google-Smtp-Source: AGHT+IGEXSuirg5IH6jDcnHDxPpOBHvWvzrRtyQxaoORNWdCD434tke/m0zFLpwwUQj2zTPAHnCd5g==
X-Received: by 2002:ad4:5c65:0:b0:6e8:86d3:be73 with SMTP id
 6a1803df08f44-6eaeaaeca0amr319184116d6.37.1742323084401; 
 Tue, 18 Mar 2025 11:38:04 -0700 (PDT)
Received: from ?IPv6:2606:6d00:11:e976::5ac? ([2606:6d00:11:e976::5ac])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6eade334d02sm70379456d6.80.2025.03.18.11.38.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Mar 2025 11:38:03 -0700 (PDT)
Message-ID: <32c29526416c07c37819aedabcbf1e562ee98bf2.camel@ndufresne.ca>
Subject: Re: [PATCH v4 0/6] TEE subsystem for restricted dma-buf allocations
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Sumit Garg <sumit.garg@kernel.org>, Jens Wiklander
 <jens.wiklander@linaro.org>
Cc: Daniel Stone <daniel@fooishbar.org>, Boris Brezillon	
 <boris.brezillon@collabora.com>, Linux Kernel Mailing List	
 <linux-kernel@vger.kernel.org>, Linux Media Mailing List	
 <linux-media@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK"	
 <linaro-mm-sig@lists.linaro.org>, op-tee@lists.trustedfirmware.org, 
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Olivier Masse
 <olivier.masse@nxp.com>, Thierry Reding	 <thierry.reding@gmail.com>, Yong
 Wu <yong.wu@mediatek.com>, Sumit Semwal	 <sumit.semwal@linaro.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,  Brian Starkey
 <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>, "T . J .
 Mercier"	 <tjmercier@google.com>, Christian =?ISO-8859-1?Q?K=F6nig?=	
 <christian.koenig@amd.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 azarrabi@qti.qualcomm.com, Florent Tomasin <florent.tomasin@arm.com>
Date: Tue, 18 Mar 2025 14:38:02 -0400
In-Reply-To: <Z8avsigZJ4vqmiA4@sumit-X1>
References: <CAHUa44G9hw-z6wzxg=HkVAxPKEW1yES5JTEqRWMvJUJAtcUDkQ@mail.gmail.com>
 <CAPj87rPHnME5Osgnf5-FSAu22mDpLj=dzvhi_NqEcOwr1ThgGw@mail.gmail.com>
 <CAHUa44Gs0D1fBD0=+EDgcQUMeDv4knci9trUkYEc1J98qFV7HQ@mail.gmail.com>
 <CAFA6WYOuTwRPEh3L7+hMyARB_E73xmp+OwhKyS-r4+ryS7=9sw@mail.gmail.com>
 <20250214164856.0d2ead8a@collabora.com>
 <CAFA6WYPc6EHQwcPuMZRm4C1P6SoDrCzEPUmju_meupB6NXQ1sg@mail.gmail.com>
 <CAPj87rN-OYTzh5=Gdv619UQD5=x=U6Yt=uV4N1kCs4Zao4RVAg@mail.gmail.com>
 <CAFA6WYMLLLSuz3y5J+DuRFAGrmwpZoWax5sasfAUhXoQXmrNNA@mail.gmail.com>
 <CAPj87rN7J6u9NsviAdw8=OenEYc8t719Lds6u6-BhFKrtkLZ-A@mail.gmail.com>
 <CAHUa44FkG1NAWpoW8UVBywv44XW_mjAJa32PcC9mcmiOLdiRqw@mail.gmail.com>
 <Z8avsigZJ4vqmiA4@sumit-X1>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Le mardi 04 mars 2025 =C3=A0 13:15 +0530, Sumit Garg a =C3=A9crit=C2=A0:
> On Tue, Mar 04, 2025 at 08:17:23AM +0100, Jens Wiklander wrote:
> > Hi Daniel,
> >=20
> > On Fri, Feb 21, 2025 at 3:12=E2=80=AFPM Daniel Stone <daniel@fooishbar.=
org> wrote:
> > >=20
> > > Hi Sumit,
> > >=20
> > > On Fri, 21 Feb 2025 at 11:24, Sumit Garg <sumit.garg@linaro.org> wrot=
e:
> > > > On Tue, 18 Feb 2025 at 21:52, Daniel Stone <daniel@fooishbar.org> w=
rote:
> > > > > dma-heaps was created to solve the problem of having too many
> > > > > 'allocate $n bytes from $specialplace' uAPIs. The proliferation w=
as
> > > > > painful and making it difficult for userspace to do what it neede=
d to
> > > > > do. Userspace doesn't _yet_ make full use of it, but the solution=
 is
> > > > > to make userspace make full use of it, not to go create entirely
> > > > > separate allocation paths for unclear reasons.
> > > > >=20
> > > > > Besides, I'm writing this from a platform that implements SVP not=
 via
> > > > > TEE. I've worked on platforms which implement SVP without any TEE=
,
> > > > > where the TEE implementation would be at best a no-op stub, and a=
t
> > > > > worst flat-out impossible.
> > > >=20
> > > > Can you elaborate the non-TEE use-case for Secure Video Path (SVP) =
a
> > > > bit more? As to how the protected/encrypted media content pipeline
> > > > works? Which architecture support does your use-case require? Is th=
ere
> > > > any higher privileged level firmware interaction required to perfor=
m
> > > > media content decryption into restricted memory? Do you plan to
> > > > upstream corresponding support in near future?
> > >=20
> > > You can see the MTK SVP patches on list which use the MTK SMC to medi=
ate it.
> > >=20
> > > There are TI Jacinto platforms which implement a 'secure' area
> > > configured statically by (IIRC) BL2, with static permissions defined
> > > for each AXI endpoint, e.g. CPU write + codec RW + dispc read. I've
> > > heard of another SoC vendor doing the same, but I don't think I can
> > > share those details. There is no TEE interaction.
> > >=20
> > > I'm writing this message from an AMD laptop which implements
> > > restricted content paths outside of TEE. I don't have the full pictur=
e
> > > of how SVP is implemented on AMD systems, but I do know that I don't
> > > have any TEE devices exposed.
> > >=20
> > > > Let me try to elaborate on the Secure Video Path (SVP) flow requiri=
ng
> > > > a TEE implementation (in general terms a higher privileged firmware
> > > > managing the pipeline as the kernel/user-space has no access
> > > > permissions to the plain text media content):
> > > >=20
> > > > - [...]
> > >=20
> > > Yeah, I totally understand the TEE usecase. I think that TEE is a goo=
d
> > > design to implement this. I think that TEE should be used for SVP
> > > where it makes sense.
> > >=20
> > > Please understand that I am _not_ arguing that no-one should use TEE =
for SVP!
> > >=20
> > > > > So, again, let's
> > > > > please turn this around: _why_ TEE? Who benefits from exposing th=
is as
> > > > > completely separate to the more generic uAPI that we specifically
> > > > > designed to handle things like this?
> > > >=20
> > > > The bridging between DMA heaps and TEE would still require user-spa=
ce
> > > > to perform an IOCTL into TEE to register the DMA-bufs as you can se=
e
> > > > here [1]. Then it will rather be two handles for user-space to mana=
ge.
> > >=20
> > > Yes, the decoder would need to do this. That's common though: if you
> > > want to share a buffer between V4L2 and DRM, you have three handles:
> > > the V4L2 buffer handle, the DRM GEM handle, and the dmabuf you use to
> > > bridge the two.
> > >=20
> > > > Similarly during restricted memory allocation/free we need another
> > > > glue layer under DMA heaps to TEE subsystem.
> > >=20
> > > Yep.
> > >=20
> > > > The reason is simply which has been iterated over many times in the
> > > > past threads that:
> > > >=20
> > > > =C2=A0=C2=A0=C2=A0 "If user-space has to interact with a TEE device=
 for SVP use-case
> > > > then why it's not better to ask TEE to allocate restricted DMA-bufs
> > > > too"
> > >=20
> > > The first word in your proposition is load-bearing.
> > >=20
> > > Build out the usecase a little more here. You have a DRMed video
> > > stream coming in, which you need to decode (involving TEE for this
> > > usecase). You get a dmabuf handle to the decoded frame. You need to
> > > pass the dmabuf across to the Wayland compositor. The compositor need=
s
> > > to pass it to EGL/Vulkan to import and do composition, which in turn
> > > passes it to the GPU DRM driver. The output of the composition is in
> > > turn shared between the GPU DRM driver and the separate KMS DRM
> > > driver, with the involvement of GBM.
> > >=20
> > > For the platforms I'm interested in, the GPU DRM driver needs to
> > > switch into protected mode, which has no involvement at all with TEE =
-
> > > it's architecturally impossible to have TEE involved without moving
> > > most of the GPU driver into TEE and destroying performance. The
> > > display hardware also needs to engage protected mode, which again has
> > > no involvement with TEE and again would need to have half the driver
> > > moved into TEE for no benefit in order to do so. The Wayland
> > > compositor also has no interest in TEE: it tells the GPU DRM driver
> > > about the protected status of its buffers, and that's it.
> > >=20
> > > What these components _are_ opinionated about, is the way buffers are
> > > allocated and managed. We built out dmabuf modifiers for this usecase=
,
> > > and we have a good negotiation protocol around that. We also really
> > > care about buffer placement in some usecases - e.g. some display/code=
c
> > > hardware requires buffers to be sourced from contiguous memory, other
> > > hardware needs to know that when it shares buffers with another
> > > device, it needs to place the buffers outside of inaccessible/slow
> > > local RAM. So we built out dma-heaps, so every part of the component
> > > in the stack can communicate their buffer-placement needs in the same
> > > way as we do modifiers, and negotiate an acceptable allocation.
> > >=20
> > > That's my starting point for this discussion. We have a mechanism to
> > > deal with the fact that buffers need to be shared between different I=
P
> > > blocks which have their own constraints on buffer placement, avoiding
> > > the current problem of having every subsystem reinvent their own
> > > allocation uAPI which was burying us in impedance mismatch and
> > > confusion. That mechanism is dma-heaps. It seems like your starting
> > > point from this discussion is that you've implemented a TEE-centric
> > > design for SVP, and so all of userspace should bypass our existing
> > > cross-subsystem special-purpose allocation mechanism, and write
> > > specifically to one implementation. I believe that is a massive step
> > > backwards and an immediate introduction of technical debt.
> > >=20
> > > Again, having an implementation of SVP via TEE makes a huge amount of
> > > sense. Having _most_ SVP implementations via TEE still makes a lot of
> > > sense. Having _all_ SVP implementations eventually be via TEE would
> > > still make sense. But even if we were at that point - which we aren't
> > > - it still doesn't justify telling userspace 'use the generic dma-hea=
p
> > > uAPI for every device-specific allocation constraint, apart from SVP
> > > which has a completely different way to allocate some bytes'.
> >=20
> > I must admit that I don't see how this makes a significant difference,
> > but then I haven't hacked much in the stacks you're talking about, so
> > I'm going to take your word for it.
> >=20
> > I've experimented with providing a dma-heap replacing the TEE API. The
> > implementation is more complex than I first anticipated, adding about
> > 400 lines to the patch set.
>=20
> I did anticipated this but let's give it a try and see if DMA heaps
> really adds any value from user-space point of view. If it does then it
> will be worth the maintenence overhead.
>=20
> > From user space, it looks like another
> > dma-heap. I'm using the names you gave earlier,
> > protected,secure-video, protected,trusted-ui, and
> > protected,secure-video-record. However, I wonder if we shouldn't use
> > "restricted" instead of "protected" since we had agreed to call it
> > restricted memory earlier.
>=20
> Let's stick with "restricted" memory buffer references only.

Until now, we didn't have a standard to balance our naming choice, we
simply wanted to move away from "secure" which didn't mean much, and
restricted met our needs. I think the discussion is worth having again,
now that there is a standard that decided toward "protected". Matchcing
the Khronos standard means reducing a lot of confusion.

https://docs.vulkan.org/guide/latest/protected.html

regards,
Nicolas
