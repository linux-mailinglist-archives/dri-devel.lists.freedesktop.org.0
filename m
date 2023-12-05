Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B0AF8804BB5
	for <lists+dri-devel@lfdr.de>; Tue,  5 Dec 2023 09:04:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A41410E0D2;
	Tue,  5 Dec 2023 08:04:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B850A10E0D2
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Dec 2023 08:04:13 +0000 (UTC)
Received: from localhost (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 8D37F6602023;
 Tue,  5 Dec 2023 08:04:11 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1701763452;
 bh=wodPwamTt7vh8OYCaH3FU0Ns9UuCngJJgidb7pUtdck=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=jlFYdzyTPDQveCvOnCRU+ybS9ofvPDqbY1GqlUrETup3ntb+1m9VkKqUzSHPBDR5D
 FQPxfwk4vc13bGiCOldbGcuaZg0EtO1DlkAycXgAiUAYHFTxRA/88weO6JCTSr1bju
 DtZAg9V86v5brQ59KbbC5r6YUvj+deROOXkP4T77xECeRE79B8++1Y+LMAetLrDmLe
 LMeJPdtlKhg5sFJ3nFWUr76vZnusXdlvW7zg4mzfhaOWTT3CvRsjnEyuKz1uMcxFJo
 VhpNLMw3Tb8M/CuzizI4tl4UVroUCjcbIkupP5K1/BsYM7BqnOevbNq5UkJuLVHulL
 pSEN4abtbSC9g==
Date: Tue, 5 Dec 2023 09:04:08 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Subject: Re: [PATCH v3 00/14] drm: Add a driver for CSF-based Mali GPUs
Message-ID: <20231205090408.201ee092@collabora.com>
In-Reply-To: <CAJiuCcfMCd4s0XjngrEfy84Ybff7T7bYVHVNhNHYu-bSHcfGiQ@mail.gmail.com>
References: <20231204173313.2098733-1-boris.brezillon@collabora.com>
 <CAJiuCcfMCd4s0XjngrEfy84Ybff7T7bYVHVNhNHYu-bSHcfGiQ@mail.gmail.com>
Organization: Collabora
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Nicolas Boichat <drinkcat@chromium.org>, kernel@collabora.com,
 Daniel Stone <daniels@collabora.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Liviu Dudau <Liviu.Dudau@arm.com>,
 dri-devel@lists.freedesktop.org, Steven Price <steven.price@arm.com>,
 "Marty E . Plummer" <hanetzer@startmail.com>,
 Robin Murphy <robin.murphy@arm.com>,
 Faith Ekstrand <faith.ekstrand@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Cl=C3=A9ment,

On Mon, 4 Dec 2023 19:09:54 +0100
Cl=C3=A9ment P=C3=A9ron <peron.clem@gmail.com> wrote:

> Hi Boris,
>=20
> On Mon, 4 Dec 2023 at 18:33, Boris Brezillon
> <boris.brezillon@collabora.com> wrote:
> >
> > Hello,
> >
> > This is the 3rd version of the kernel driver for Mali CSF-based GPUs.
> >
> > With all the DRM dependencies being merged (drm-sched single entity and
> > drm_gpuvm), I thought now was a good time to post a new version. Note
> > that the iommu series we depend on [1] has been merged recently. The
> > only remaining dependency that hasn't been merged yet is this rather
> > trival drm_gpuvm [2] patch.
> >
> > As for v2, I pushed a branch based on drm-misc-next and containing
> > all the dependencies that are not yet available in drm-misc-next
> > here[3], and another [4] containing extra patches to have things
> > working on rk3588. The CSF firmware binary can be found here[5], and
> > should be placed under /lib/firmware/arm/mali/arch10.8/mali_csffw.bin.
> >
> > The mesa MR adding v10 support on top of panthor is available here [6].
> >
> > Regarding the GPL2+MIT relicensing, Liviu did an audit and found two
> > more people that I didn't spot initially: Cl=C3=A9ment P=C3=A9ron for t=
he devfreq
> > code, and Alexey Sheplyakov for some bits in panthor_gpu.c. Both are
> > Cc-ed on the relevant patches. The rest of the code is either new, or
> > covered by the Linaro, Arm and Collabora acks. =20
>=20
> I only did some trivial cleaning, the relicensing is fine for me.
> Do you need me to ack some patches?

Yes, please. We identified that most of your contributions were related
to the devfreq logic ("drm/panthor: Add the devfreq logical block" in
this series), but if you remember contributing to other files in
panfrost, feel free to give a general ack on all your panfrost
contributions.

Thanks,

Boris
