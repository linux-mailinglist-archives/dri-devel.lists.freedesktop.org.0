Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 40F2840D1B3
	for <lists+dri-devel@lfdr.de>; Thu, 16 Sep 2021 04:33:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B31616E9DB;
	Thu, 16 Sep 2021 02:33:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 178F56E9DB
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Sep 2021 02:33:33 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10108"; a="219285313"
X-IronPort-AV: E=Sophos;i="5.85,297,1624345200"; d="scan'208";a="219285313"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2021 19:33:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,297,1624345200"; d="scan'208";a="553636030"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga002.fm.intel.com with ESMTP; 15 Sep 2021 19:33:31 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Wed, 15 Sep 2021 19:33:30 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Wed, 15 Sep 2021 19:33:30 -0700
Received: from orsmsx611.amr.corp.intel.com ([10.22.229.24]) by
 ORSMSX611.amr.corp.intel.com ([10.22.229.24]) with mapi id 15.01.2242.012;
 Wed, 15 Sep 2021 19:33:30 -0700
From: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
To: Gerd Hoffmann <kraxel@redhat.com>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: RE: [RFC v1 4/6] drm/virtio: Probe and implement
 VIRTIO_GPU_F_RELEASE_FENCE feature
Thread-Topic: [RFC v1 4/6] drm/virtio: Probe and implement
 VIRTIO_GPU_F_RELEASE_FENCE feature
Thread-Index: AQHXqPngfbE2Y7A8AU2aCmCx54ngjaulBQAAgADtJtA=
Date: Thu, 16 Sep 2021 02:33:30 +0000
Message-ID: <4bc93b23444b4b95b000e1bb3c177555@intel.com>
References: <20210913233529.3194401-1-vivek.kasireddy@intel.com>
 <20210913233529.3194401-5-vivek.kasireddy@intel.com>
 <20210915051614.wgdk2su5p6k2pb3b@sirius.home.kraxel.org>
In-Reply-To: <20210915051614.wgdk2su5p6k2pb3b@sirius.home.kraxel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.6.200.16
dlp-reaction: no-action
x-originating-ip: [10.1.200.100]
Content-Type: text/plain; charset="us-ascii"
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

>   Hi,
>=20
> > --- a/include/uapi/linux/virtio_gpu.h
> > +++ b/include/uapi/linux/virtio_gpu.h
> > @@ -60,6 +60,8 @@
> >   */
> >  #define VIRTIO_GPU_F_RESOURCE_BLOB       3
> >
> > +#define VIRTIO_GPU_F_RELEASE_FENCE	 4
> > +
> >  enum virtio_gpu_ctrl_type {
> >  	VIRTIO_GPU_UNDEFINED =3D 0,
>=20
> Where is the virtio-spec update for that?
[Kasireddy, Vivek] I was going to do that if there'd a consensus over DRM_C=
AP_RELEASE_FENCE.
Otherwise, I don't think VIRTIO_GPU_F_RELEASE_FENCE is needed.

Thanks,
Vivek

>=20
> thanks,
>   Gerd

