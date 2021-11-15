Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 06D1B4511DD
	for <lists+dri-devel@lfdr.de>; Mon, 15 Nov 2021 20:26:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11C146E5B2;
	Mon, 15 Nov 2021 19:26:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B52BE6E5B2
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Nov 2021 19:26:16 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10169"; a="296940751"
X-IronPort-AV: E=Sophos;i="5.87,237,1631602800"; d="scan'208";a="296940751"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2021 11:26:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,237,1631602800"; d="scan'208";a="548118443"
Received: from orsmsx605.amr.corp.intel.com ([10.22.229.18])
 by fmsmga008.fm.intel.com with ESMTP; 15 Nov 2021 11:26:15 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX605.amr.corp.intel.com (10.22.229.18) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Mon, 15 Nov 2021 11:26:15 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Mon, 15 Nov 2021 11:26:14 -0800
Received: from orsmsx611.amr.corp.intel.com ([10.22.229.24]) by
 ORSMSX611.amr.corp.intel.com ([10.22.229.24]) with mapi id 15.01.2242.012;
 Mon, 15 Nov 2021 11:26:14 -0800
From: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
To: Daniel Vetter <daniel@ffwll.ch>, Greg KH <gregkh@linuxfoundation.org>
Subject: RE: [PATCH v3 11/12] drm/virtio: implement context init: add
 virtio_gpu_fence_event
Thread-Topic: [PATCH v3 11/12] drm/virtio: implement context init: add
 virtio_gpu_fence_event
Thread-Index: AQHXrz9Yg+UI5ggJdE60dChBp1kcN6wCY5UAgAMayAD//869gA==
Date: Mon, 15 Nov 2021 19:26:14 +0000
Message-ID: <bc799da264c045fb9ad9ccad5dfba631@intel.com>
References: <20210921232024.817-1-gurchetansingh@chromium.org>
 <20210921232024.817-12-gurchetansingh@chromium.org>
 <YY/RBOdU6+SgbRrq@kroah.com> <YZJrutLaiwozLfSw@phenom.ffwll.local>
In-Reply-To: <YZJrutLaiwozLfSw@phenom.ffwll.local>
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
Cc: "virtio-dev@lists.oasis-open.org" <virtio-dev@lists.oasis-open.org>,
 "kraxel@redhat.com" <kraxel@redhat.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Gurchetan Singh <gurchetansingh@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Daniel, Greg,

If it is the same or a similar crash reported here:
https://lists.freedesktop.org/archives/dri-devel/2021-November/330018.html
and here: https://lists.freedesktop.org/archives/dri-devel/2021-November/33=
0212.html
then the fix is already merged:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?=
id=3Dd89c0c8322ecdc9a2ec84b959b6f766be082da76

Thanks,
Vivek

> On Sat, Nov 13, 2021 at 03:51:48PM +0100, Greg KH wrote:
> > On Tue, Sep 21, 2021 at 04:20:23PM -0700, Gurchetan Singh wrote:
> > > Similar to DRM_VMW_EVENT_FENCE_SIGNALED.  Sends a pollable event
> > > to the DRM file descriptor when a fence on a specific ring is
> > > signaled.
> > >
> > > One difference is the event is not exposed via the UAPI -- this is
> > > because host responses are on a shared memory buffer of type
> > > BLOB_MEM_GUEST [this is the common way to receive responses with
> > > virtgpu].  As such, there is no context specific read(..)
> > > implementation either -- just a poll(..) implementation.
> > >
> > > Signed-off-by: Gurchetan Singh <gurchetansingh@chromium.org>
> > > Acked-by: Nicholas Verne <nverne@chromium.org>
> > > ---
> > >  drivers/gpu/drm/virtio/virtgpu_drv.c   | 43 ++++++++++++++++++++++++=
+-
> > >  drivers/gpu/drm/virtio/virtgpu_drv.h   |  7 +++++
> > >  drivers/gpu/drm/virtio/virtgpu_fence.c | 10 ++++++
> > >  drivers/gpu/drm/virtio/virtgpu_ioctl.c | 34 ++++++++++++++++++++
> > >  4 files changed, 93 insertions(+), 1 deletion(-)
> >
> > This commit seems to cause a crash in a virtual drm gpu driver for
> > Android.  I have reverted this, and the next commit in the series from
> > Linus's tree and all is good again.
> >
> > Any ideas?
>=20
> Well no, but also this patch looks very questionable of hand-rolling
> drm_poll. Yes you can do driver private events like
> DRM_VMW_EVENT_FENCE_SIGNALED, that's fine. But you really should not need
> to hand-roll the poll callback. vmwgfx (which generally is a very old
> driver which has lots of custom stuff, so not a great example) doesn't do
> that either.
>=20
> So that part should go no matter what I think.
> -Daniel
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
