Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C5CB350D44
	for <lists+dri-devel@lfdr.de>; Thu,  1 Apr 2021 05:51:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 616E16EC15;
	Thu,  1 Apr 2021 03:51:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78C006EC15
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Apr 2021 03:51:08 +0000 (UTC)
IronPort-SDR: MoRZ87iDzGoInJUlOuS3l0ZrrrEe0DEL3wmwQ4fUe70ooNb7+Y/NRd7jFJiJfM2S2d7TwjCele
 11NSYWqn9YIw==
X-IronPort-AV: E=McAfee;i="6000,8403,9940"; a="188887602"
X-IronPort-AV: E=Sophos;i="5.81,295,1610438400"; d="scan'208";a="188887602"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2021 20:51:07 -0700
IronPort-SDR: XIdO2dXlaVlaNXEgdTB016bGD2SNLIbsThNlDvXs5G0jifH8XNcQHjew4SKExWlhFZnm+T6bUu
 FX9DFJIax/FQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,295,1610438400"; d="scan'208";a="455794990"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga001.jf.intel.com with ESMTP; 31 Mar 2021 20:51:07 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Wed, 31 Mar 2021 20:51:07 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Wed, 31 Mar 2021 20:51:06 -0700
Received: from orsmsx611.amr.corp.intel.com ([10.22.229.24]) by
 ORSMSX611.amr.corp.intel.com ([10.22.229.24]) with mapi id 15.01.2106.013;
 Wed, 31 Mar 2021 20:51:06 -0700
From: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: RE: [PATCH 1/2] drm/virtio: Create Dumb BOs as guest Blobs
Thread-Topic: [PATCH 1/2] drm/virtio: Create Dumb BOs as guest Blobs
Thread-Index: AQHXJdwdN9e4U3aiKUqpE1hHIgQuZqqeLD6AgAC5eGA=
Date: Thu, 1 Apr 2021 03:51:06 +0000
Message-ID: <db7373214e15407fa0203cf10dc996e7@intel.com>
References: <20210331030439.1564032-1-vivek.kasireddy@intel.com>
 <20210331074149.jdvbdbvyilzfk6ua@sirius.home.kraxel.org>
In-Reply-To: <20210331074149.jdvbdbvyilzfk6ua@sirius.home.kraxel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.5.1.3
dlp-reaction: no-action
x-originating-ip: [10.1.200.100]
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Gerd,

> > If support for Blob resources is available, then dumb BOs created by
> > the driver can be considered as guest Blobs. And, for guest Blobs,
> > there is no need to do any transfers or flushes
> 
> No.  VIRTGPU_BLOB_FLAG_USE_SHAREABLE means the host (aka device in virtio
> terms) *can* create a shared mapping.  So, the guest sends still needs to send transfer
> commands, and then the device can shortcut the transfer commands on the host side in
> case a shared mapping exists.
[Kasireddy, Vivek] Ok. IIUC, are you saying that the device may or may not create a shared
mapping (meaning res->image) and that the driver should not make any assumptions about
that and thus still do the transfers and flushes?

Also, could you please briefly explain what does VIRTIO_GPU_BLOB_FLAG_USE_MAPPABLE
mean given that the spec does not describe these blob_flags clearly? This is what the spec says:

"The driver MUST inform the device if the blob resource is used for
memory access, sharing between driver instances and/or sharing with
other devices. This is done via the \field{blob_flags} field."

And, what should be the default blob_flags value for a dumb bo if the userspace does not
specify them?

> 
> flush commands are still needed for dirty tracking.
> 
> > but we do need to do set_scanout even if the FB has not changed as
> > part of plane updates.
> 
> Sounds like you workaround host bugs.  This should not be needed with properly
> implemented flush.
[Kasireddy, Vivek] With the patches I tested with:
https://lists.nongnu.org/archive/html/qemu-devel/2021-03/msg09786.html

I noticed that if we do not have res->image and only have res->blob, we have to 
re-submit the blob/dmabuf and update the displaysurface if guest made updates to it 
(in this case same FB) which can only happen if we call set_scanout_blob. IIUC, flush
only marks the area as dirty but does not re-submit the updated buffer/blob and I see
a flicker if I let it do dpy_gfx_update().

Thanks,
Vivek

> 
> take care,
>   Gerd

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
