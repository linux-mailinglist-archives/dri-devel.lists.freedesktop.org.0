Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 329B18C7532
	for <lists+dri-devel@lfdr.de>; Thu, 16 May 2024 13:27:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67AF210EC71;
	Thu, 16 May 2024 11:27:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="DazUIU2R";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD32010EC71
 for <dri-devel@lists.freedesktop.org>; Thu, 16 May 2024 11:27:29 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi
 [81.175.209.231])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2F16227C;
 Thu, 16 May 2024 13:27:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1715858840;
 bh=XWllrDJgXCsAZy9Z5sDYfrb6ed2DyF9I1Pdx9ZRRR5A=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DazUIU2RgiGQFEFJXxUSK4kgQ7916AjDz6UDMMDf0sUg66jj5Ief2/k3l4SiOJY1T
 rnHjgLlRS6wvNnIMFzrdrSkJHjaCdyXVUCwUf8P5s0pkAOp2ewDQr3QjnyAWqL8z+l
 1Zj0EfYQsxWsbAn5eGUALpLIoiKGKibN5/TJpyPQ=
Date: Thu, 16 May 2024 14:27:20 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: nicolas.dufresne@collabora.corp-partner.google.com
Cc: Maxime Ripard <mripard@redhat.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Hans de Goede <hdegoede@redhat.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>,
 "T.J. Mercier" <tjmercier@google.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Lennart Poettering <mzxreary@0pointer.de>,
 Robert Mader <robert.mader@collabora.com>,
 Sebastien Bacher <sebastien.bacher@canonical.com>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 linaro-mm-sig@lists.linaro.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Milan Zamazal <mzamazal@redhat.com>,
 Andrey Konovalov <andrey.konovalov.ynk@gmail.com>
Subject: Re: Safety of opening up /dev/dma_heap/* to physically present users
 (udev uaccess tag) ?
Message-ID: <20240516112720.GA12714@pendragon.ideasonboard.com>
References: <d2a512b2-e6b1-4675-b406-478074bbbe95@linaro.org>
 <Zjpmu_Xj6BPdkDPa@phenom.ffwll.local>
 <20240507183613.GB20390@pendragon.ideasonboard.com>
 <4f59a9d78662831123cc7e560218fa422e1c5eca.camel@collabora.com>
 <Zjs5eM-rRoh6WYYu@phenom.ffwll.local>
 <20240513-heretic-didactic-newt-1d6daf@penduick>
 <20240513083417.GA18630@pendragon.ideasonboard.com>
 <c4db22ad94696ed22282bf8dad15088d94ade5d6.camel@collabora.com>
 <20240514204223.GN32013@pendragon.ideasonboard.com>
 <a3428b0c352c24d43a2d458d41819fbf4b6cce0f.camel@collabora.corp-partner.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a3428b0c352c24d43a2d458d41819fbf4b6cce0f.camel@collabora.corp-partner.google.com>
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

Hi Nicolas,

On Wed, May 15, 2024 at 01:43:58PM -0400, nicolas.dufresne@collabora.corp-partner.google.com wrote:
> Le mardi 14 mai 2024 à 23:42 +0300, Laurent Pinchart a écrit :
> > > You'll hit the same limitation as we hit in GStreamer, which is that KMS driver
> > > only offer allocation for render buffers and most of them are missing allocators
> > > for YUV buffers, even though they can import in these formats. (kms allocators,
> > > except dumb, which has other issues, are format aware).
> > 
> > My experience on Arm platforms is that the KMS drivers offer allocation
> > for scanout buffers, not render buffers, and mostly using the dumb
> > allocator API. If the KMS device can scan out YUV natively, YUV buffer
> > allocation should be supported. Am I missing something here ?
> 
> There is two APIs, Dumb is the legacy allocation API, only used by display

Is it legacy only ? I understand the dumb buffers API to be officially
supported, to allocate scanout buffers suitable for software rendering.

> drivers indeed, and the API does not include a pixel format or a modifier. The
> allocation of YUV buffer has been made through a small hack, 
> 
>   bpp = number of bits per component (of luma plane if multiple planes)
>   width = width
>   height = height * X
> 
> Where X will vary, "3 / 2" is used for 420 subsampling, "2" for 422 and "3" for
> 444. It is far from idea, requires deep knowledge of each formats in the
> application

I'm not sure I see that as an issue, but our experiences and uses cases
may vary :-)

> and cannot allocate each planes seperatly.

For semi-planar or planar formats, unless I'm mistaken, you can either
allocate a single buffer and use it with appropriate offsets when
constructing your framebuffer (with DRM_IOCTL_MODE_ADDFB2), or allocate
one buffer per plane.

> The second is to use the driver specific allocation API. This is then abstracted
> by GBM. This allows allocating render buffers with notably modifiers and/or use
> cases. But no support for YUV formats or multi-planar formats.

GBM is the way to go for render buffers indeed. It has been designed
with only graphics buffer management use cases in mind, so it's
unfortunately not an option as a generic allocator, at least in its
current form.

-- 
Regards,

Laurent Pinchart
