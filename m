Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7A283DE69F
	for <lists+dri-devel@lfdr.de>; Tue,  3 Aug 2021 08:18:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AA306E416;
	Tue,  3 Aug 2021 06:18:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 525506E416
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Aug 2021 06:18:51 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10064"; a="213632413"
X-IronPort-AV: E=Sophos;i="5.84,291,1620716400"; d="scan'208";a="213632413"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Aug 2021 23:18:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,291,1620716400"; d="scan'208";a="669836826"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga005.fm.intel.com with ESMTP; 02 Aug 2021 23:18:50 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Mon, 2 Aug 2021 23:18:49 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Mon, 2 Aug 2021 23:18:48 -0700
Received: from orsmsx611.amr.corp.intel.com ([10.22.229.24]) by
 ORSMSX611.amr.corp.intel.com ([10.22.229.24]) with mapi id 15.01.2242.010;
 Mon, 2 Aug 2021 23:18:48 -0700
From: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
To: Gerd Hoffmann <kraxel@redhat.com>, Daniel Vetter <daniel@ffwll.ch>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Pekka
 Paalanen <ppaalanen@gmail.com>, Simon Ser <contact@emersion.fr>,
 =?iso-8859-1?Q?Michel_D=E4nzer?= <michel@daenzer.net>, "Zhang, Tina"
 <tina.zhang@intel.com>, "Kim, Dongwon" <dongwon.kim@intel.com>
Subject: RE: [RFC v1 0/4] drm: Add support for DRM_CAP_DEFERRED_OUT_FENCE
 capability
Thread-Topic: [RFC v1 0/4] drm: Add support for DRM_CAP_DEFERRED_OUT_FENCE
 capability
Thread-Index: AQHXhFPnN1B4zkQxMkK/V9zRY5/TqKtbxyyAgAA1+gCABGu4gIAAPeQAgAASv4A=
Date: Tue, 3 Aug 2021 06:18:48 +0000
Message-ID: <bede286bbe80421585cc9b9dd798bfe6@intel.com>
References: <20210729081659.2255499-1-vivek.kasireddy@intel.com>
 <YQPTo0D5SZfX44dn@phenom.ffwll.local>
 <20210730133850.bbje7uxvrvsmuopt@sirius.home.kraxel.org>
 <YQe2RfK0wCY6Q2y/@phenom.ffwll.local>
 <20210802125056.pdcfle4aziyjh32r@sirius.home.kraxel.org>
In-Reply-To: <20210802125056.pdcfle4aziyjh32r@sirius.home.kraxel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.5.1.3
dlp-reaction: no-action
x-originating-ip: [10.1.200.100]
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
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

Hi Gerd,

>=20
>   Hi,
>=20
> > > That sounds sensible to me.  Fence the virtio commands, make sure (on
> > > the host side) the command completes only when the work is actually d=
one
> > > not only submitted.  Has recently been added to qemu for RESOURCE_FLU=
SH
> > > (aka frontbuffer rendering) and doing the same for SET_SCANOUT (aka
> > > pageflipping), then send vblank events to userspace on command
> > > completion certainly makes sense.
> >
> > Hm how does this all work? At least drm/virtio uses
> > drm_atomic_helper_dirtyfb, so both DIRTYFB ioctl and atomic flips all e=
nd
> > up in the same driver path for everything. Or do you just combine the
> > resource_flush with the flip as needed and let the host side figure it =
all
> > out? From a quick read of virtgpu_plane.c that seems to be the case ...
>=20
> virtio_gpu_primary_plane_update() will send RESOURCE_FLUSH only for
> DIRTYFB and both SET_SCANOUT + RESOURCE_FLUSH for page-flip, and I
> think for the page-flip case the host (aka qemu) doesn't get the
> "wait until old framebuffer is not in use any more" right yet.
[Kasireddy, Vivek] As you know, with the GTK UI backend and this patch seri=
es:=20
https://lists.nongnu.org/archive/html/qemu-devel/2021-06/msg06745.html
we do create a sync file fd -- after the Blit -- and wait (adding it to Qem=
u's main
event loop) for it to ensure that the Guest scanout FB is longer in use on =
the Host.
This mechanism works in a similarly way for both frontbuffer DIRTYFB case a=
nd
also the double-buffer case.=20

The out_fence work is only relevant for the future Wayland UI backend thoug=
h.

>=20
> So we'll need a host-side fix for that and a guest-side fix to switch
> from a blocking wait on the fence to vblank events.
[Kasireddy, Vivek] Do you see any concerns with the blocking wait? And, are=
 you
suggesting that we use a vblank timer? Not sure if that would be needed bec=
ause it
would not align with the render/draw signals used with GTK. And, the DRM co=
re
does send out an event -- immediately after the blocking wait -- to Guest c=
ompositor
as no_vblank=3Dtrue.

>=20
> > Also to make this work we don't just need the fence, we need the timest=
amp
> > (in a clock domain the guest can correct for ofc) of the host side kms
> > driver flip completion. If you just have the fence then the jitter from
> > going through all the layers will most likely make it unusable.
>=20
> Well, there are no timestamps in the virtio-gpu protocol ...
>=20
> Also I'm not sure they would be that helpful, any timing is *much* less
> predictable in a virtual machine, especially in case the host machine is
> loaded.
[Kasireddy, Vivek] I agree; I think sharing the Host timestamps with the Gu=
est or=20
vice-versa may not be useful. We have not run into any problems without the=
se so far.

Thanks,
Vivek

>=20
> take care,
>   Gerd

