Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6049E8C43D2
	for <lists+dri-devel@lfdr.de>; Mon, 13 May 2024 17:10:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AAAA10E258;
	Mon, 13 May 2024 15:10:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="20jUb+OB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 109BB10E258
 for <dri-devel@lists.freedesktop.org>; Mon, 13 May 2024 15:10:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1715613008;
 bh=2fye0wHuc/ux/aoME5fdHjKNLhC9VtAEvF2L4dmZ3qY=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=20jUb+OBwb36eRW8hNE0AnCZuWbUe4dpPF+rKvuY3zoHfluKLWVNTK6lqLJx3bjW3
 6h1eLEuWQ0cm7t8iDGra+nc7lrtPSosUIFx1Nfft674aVWIXSwzc7ZzH2Ot/fzekF+
 e+cYPf1HcE4TMsQoDsaDTHgIK/402+702v8RgeBmmOBHxqFhJbDIW5PFdQfdB86/p6
 tcLZ00tj6kJTyOfYJg8kYvr4ljF3iFVZM42iU7ijmcu+uccv6FBT32KH9SNJFRM5ey
 elkaPybAJhJ2I9GPtV/7WZKwlBEQhYfN9i8j1nRIj9dPY41IwXSV/N7k12HrcRz+sx
 RXcyDLhaUoRNA==
Received: from nicolas-tpx395.localdomain (cola.collaboradmins.com
 [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: nicolas)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 06F99378216D;
 Mon, 13 May 2024 15:10:05 +0000 (UTC)
Message-ID: <c4db22ad94696ed22282bf8dad15088d94ade5d6.camel@collabora.com>
Subject: Re: Safety of opening up /dev/dma_heap/* to physically present
 users (udev uaccess tag) ?
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Maxime Ripard
 <mripard@redhat.com>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>, Hans de Goede <hdegoede@redhat.com>, Sumit
 Semwal <sumit.semwal@linaro.org>, Benjamin Gaignard
 <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>,
 John Stultz <jstultz@google.com>, "T.J. Mercier" <tjmercier@google.com>,
 Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, Lennart
 Poettering <mzxreary@0pointer.de>,  Robert Mader
 <robert.mader@collabora.com>, Sebastien Bacher
 <sebastien.bacher@canonical.com>, Linux Media Mailing List
 <linux-media@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>,  linaro-mm-sig@lists.linaro.org, Linux
 Kernel Mailing List <linux-kernel@vger.kernel.org>, Milan Zamazal
 <mzamazal@redhat.com>, Andrey Konovalov <andrey.konovalov.ynk@gmail.com>
Date: Mon, 13 May 2024 11:10:00 -0400
In-Reply-To: <20240513083417.GA18630@pendragon.ideasonboard.com>
References: <bb372250-e8b8-4458-bc99-dd8365b06991@redhat.com>
 <ojduxo54lpcbfg2wfuhqhy7k3phncamtklh65z7gvttcwztmhk@zkifewcy4ovi>
 <3c0c7e7e-1530-411b-b7a4-9f13e0ff1f9e@redhat.com>
 <e7ilwp3vc32xze3iu2ejgqlgz44codsktnvyiufjhuf2zxcnnf@tnwzgzoxvbg2>
 <d2a512b2-e6b1-4675-b406-478074bbbe95@linaro.org>
 <Zjpmu_Xj6BPdkDPa@phenom.ffwll.local>
 <20240507183613.GB20390@pendragon.ideasonboard.com>
 <4f59a9d78662831123cc7e560218fa422e1c5eca.camel@collabora.com>
 <Zjs5eM-rRoh6WYYu@phenom.ffwll.local>
 <20240513-heretic-didactic-newt-1d6daf@penduick>
 <20240513083417.GA18630@pendragon.ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.1 (3.52.1-1.fc40) 
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

Le lundi 13 mai 2024 =C3=A0 11:34 +0300, Laurent Pinchart a =C3=A9crit=C2=
=A0:
> On Mon, May 13, 2024 at 10:29:22AM +0200, Maxime Ripard wrote:
> > On Wed, May 08, 2024 at 10:36:08AM +0200, Daniel Vetter wrote:
> > > On Tue, May 07, 2024 at 04:07:39PM -0400, Nicolas Dufresne wrote:
> > > > Hi,
> > > >=20
> > > > Le mardi 07 mai 2024 =C3=A0 21:36 +0300, Laurent Pinchart a =C3=A9c=
rit=C2=A0:
> > > > > Shorter term, we have a problem to solve, and the best option we =
have
> > > > > found so far is to rely on dma-buf heaps as a backend for the fra=
me
> > > > > buffer allocatro helper in libcamera for the use case described a=
bove.
> > > > > This won't work in 100% of the cases, clearly. It's a stop-gap me=
asure
> > > > > until we can do better.
> > > >=20
> > > > Considering the security concerned raised on this thread with dmabu=
f heap
> > > > allocation not be restricted by quotas, you'd get what you want qui=
ckly with
> > > > memfd + udmabuf instead (which is accounted already).
> > > >=20
> > > > It was raised that distro don't enable udmabuf, but as stated there=
 by Hans, in
> > > > any cases distro needs to take action to make the softISP works. Th=
is
> > > > alternative is easy and does not interfere in anyway with your futu=
re plan or
> > > > the libcamera API. You could even have both dmabuf heap (for Raspbi=
an) and the
> > > > safer memfd+udmabuf for the distro with security concerns.
> > > >=20
> > > > And for the long term plan, we can certainly get closer by fixing t=
hat issue
> > > > with accounting. This issue also applied to v4l2 io-ops, so it woul=
d be nice to
> > > > find common set of helpers to fix these exporters.
> > >=20
> > > Yeah if this is just for softisp, then memfd + udmabuf is also what I=
 was
> > > about to suggest. Not just as a stopgap, but as the real official thi=
ng.
> > >=20
> > > udmabuf does kinda allow you to pin memory, but we can easily fix tha=
t by
> > > adding the right accounting and then either let mlock rlimits or cgro=
ups
> > > kernel memory limits enforce good behavior.
> >=20
> > I think the main drawback with memfd is that it'll be broken for device=
s
> > without an IOMMU, and while you said that it's uncommon for GPUs, it's
> > definitely not for codecs and display engines.
>=20
> If the application wants to share buffers between the camera and a
> display engine or codec, it should arguably not use the libcamera
> FrameBufferAllocator, but allocate the buffers from the display or the
> encoder. memfd wouldn't be used in that case.
>=20
> We need to eat our own dogfood though. If we want to push the
> responsibility for buffer allocation in the buffer sharing case to the
> application, we need to modify the cam application to do so when using
> the KMS backend.
>=20

Agreed, and the new dmabuf feedback on wayland can also be used on top of t=
his.

You'll hit the same limitation as we hit in GStreamer, which is that KMS dr=
iver
only offer allocation for render buffers and most of them are missing alloc=
ators
for YUV buffers, even though they can import in these formats. (kms allocat=
ors,
except dumb, which has other issues, are format aware).

Nicolas
