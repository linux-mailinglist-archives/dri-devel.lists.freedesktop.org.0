Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A1D554C19C
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jun 2022 08:09:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AC6D10E8D5;
	Wed, 15 Jun 2022 06:09:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E10EC10E121
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jun 2022 06:09:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655273348; x=1686809348;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=PH/WVNYLT6WSsb9bqNJrJWnHGldACAmV5dvaR59WseE=;
 b=D0zoJjLZ9pZyMHEgYKNtdLfLLY2n9EjIpwPveQBmxHCcBCtuB2dDlPhx
 IzAaJrY5KWyV3tCHTBXHDzcehjUVl+0nVM/uzWZazyaG0YwzsX+UA2PpS
 A4snmTT1wa5VOV6lplZwO8rfrDsPgIhNEAdP6CZZh2bqf50jYV8BUJ+q2
 scbQKMXcK2VLwLsgt9wLXcE9n6p38LfN8lXrgsxwPf6QRSvQVxIGXfsmu
 yzbL+v4zmNy5CXFebcqNHmB+va8DLTBm6ifB4fhmYC/749H5SDI2FxYtd
 wgVOtxhMOwg4ulw1o9l5kf4JQs4oRpTKWycWKggX7CxYQHYrwN5XbYjAW w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10378"; a="267538356"
X-IronPort-AV: E=Sophos;i="5.91,300,1647327600"; d="scan'208";a="267538356"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2022 23:09:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,300,1647327600"; d="scan'208";a="618315307"
Received: from orsmsx604.amr.corp.intel.com ([10.22.229.17])
 by orsmga001.jf.intel.com with ESMTP; 14 Jun 2022 23:09:08 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX604.amr.corp.intel.com (10.22.229.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Tue, 14 Jun 2022 23:09:08 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Tue, 14 Jun 2022 23:09:07 -0700
Received: from orsmsx611.amr.corp.intel.com ([10.22.229.24]) by
 ORSMSX611.amr.corp.intel.com ([10.22.229.24]) with mapi id 15.01.2308.027;
 Tue, 14 Jun 2022 23:09:07 -0700
From: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
To: "Kim, Dongwon" <dongwon.kim@intel.com>, Gerd Hoffmann <kraxel@redhat.com>
Subject: RE: [PATCH v2 2/2] drm/virtio: fence created per cursor/plane update
Thread-Topic: [PATCH v2 2/2] drm/virtio: fence created per cursor/plane update
Thread-Index: AQHYd5A99Vlo+z5m0E6T4dlFRryAuq1G9+eAgAjVIYCAADuMwA==
Date: Wed, 15 Jun 2022 06:09:07 +0000
Message-ID: <2132139f4e104a018ca929d3f39a5503@intel.com>
References: <20220603211849.27703-1-dongwon.kim@intel.com>
 <20220603211849.27703-3-dongwon.kim@intel.com>
 <20220609042443.giva3mt773fteaio@sirius.home.kraxel.org>
 <20220614191737.GA67@dongwonk-MOBL.amr.corp.intel.com>
In-Reply-To: <20220614191737.GA67@dongwonk-MOBL.amr.corp.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.6.500.17
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
Cc: Dan Carpenter <dan.carpenter@oracle.com>, lkp <lkp@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Gurchetan Singh <gurchetansingh@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi DW,

>=20
> On Thu, Jun 09, 2022 at 06:24:43AM +0200, Gerd Hoffmann wrote:
> > On Fri, Jun 03, 2022 at 02:18:49PM -0700, Dongwon Kim wrote:
> > > Having one fence for a vgfb would cause conflict in case there are
> > > multiple planes referencing the same vgfb (e.g. Xorg screen covering
> > > two displays in extended mode) being flushed simultaneously. So it ma=
kes
> > > sence to use a separated fence for each plane update to prevent this.
> > >
> > > vgfb->fence is not required anymore with the suggested code change so
> > > both prepare_fb and cleanup_fb are removed since only fence creation/
> > > freeing are done in there.
> >
> > The fences are allocated and released in prepare_fb + cleanup_fb for a
> > reason: atomic_update must not fail.
>=20
> In case fence allocation fails, it falls back to non-fence path so it
> won't fail for primary-plane-update.
>=20
> For cursor plane update, it returns if fence is NULL but we could change
> it to just proceed and just make it skip waiting like,
[Kasireddy, Vivek] But cursor plane update is always tied to a fence based =
on the
way it works now and we have to fail if there is no fence.

>=20
> if (fence) {
>     dma_fence_wait(&fence->f, true);
>     dma_fence_put(&fence->f);
> }
>=20
> Or maybe I can limit my suggested changes to primary-plane-update only.
>=20
> What do you think about these?
>=20
> >
> > I guess virtio-gpu must be fixed to use drm_plane_state->fence
> > correctly ...
>=20
> I was thinking about this too but current functions (e.g.
> virtio_gpu_cmd_transfer_to_host_2d) takes "struct virtio_gpu_fence".
> Not sure what is the best way to connect drm_plane_state->fence to
> virtio_gpu_fence without changing major function interfaces.
[Kasireddy, Vivek] FWIU, we cannot use drm_plane_state->fence as it is used
by drm core to handle explicit fences. So, I think a cleaner way is to subc=
lass
base drm_plane_state and move the fence from virtio_gpu_framebuffer to a
new struct virtio_gpu_plane_state. This way, we can create the fence in
prepare_fb() and use it for synchronization in resource_flush.

Thanks,
Vivek

>=20
> >
> > take care,
> >   Gerd
> >
