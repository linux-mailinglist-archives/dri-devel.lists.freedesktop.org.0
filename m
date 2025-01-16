Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A653A135A4
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jan 2025 09:43:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 812F710E8FD;
	Thu, 16 Jan 2025 08:43:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="LEeZiJfR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E00710E8FC;
 Thu, 16 Jan 2025 08:43:47 +0000 (UTC)
Received: from pendragon.ideasonboard.com (unknown [193.209.96.36])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1CDD7169;
 Thu, 16 Jan 2025 09:42:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1737016967;
 bh=YBJYqGqQ2U3g/glMhqBtVA7c9PNcNKm2bF2hwWN3X/8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=LEeZiJfRiaftp5JL3OuhSGJ31fbSk67YMrTfIULuryGPguJN8dhwOq+oPh23KD4oZ
 oDgG9Q7qiklC025s5e31jn5W8DZrWY3XLnKdac3TlZaKlReDu0jJF+McdlL4rZbfey
 vio2zbz4p7HYes9E+SH0Bj1kP+VRYA2cki8/bjIo=
Date: Thu, 16 Jan 2025 10:43:40 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Daniel Stone <daniel@fooishbar.org>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 airlied@gmail.com, simona@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, freedreno@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, imx@lists.linux.dev,
 linux-samsung-soc@vger.kernel.org, nouveau@lists.freedesktop.org,
 virtualization@lists.linux.dev, spice-devel@lists.freedesktop.org,
 linux-renesas-soc@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-tegra@vger.kernel.org,
 intel-xe@lists.freedesktop.org, xen-devel@lists.xenproject.org,
 Andy Yan <andyshrk@163.com>
Subject: Re: [PATCH v2 25/25] drm/xlnx: Compute dumb-buffer sizes with
 drm_mode_size_dumb()
Message-ID: <20250116084340.GF6754@pendragon.ideasonboard.com>
References: <cdbe483d-0895-47aa-8c83-1c28220f4a02@ideasonboard.com>
 <bc97b92e-7f8a-4b92-af8a-20fa165ead55@suse.de>
 <f3ba05c7-6e49-4641-a3f9-ba418ebdb7c3@ideasonboard.com>
 <c6735280-7c32-4319-8ca9-a7305d8117c3@suse.de>
 <d67adb03-5cd0-4ac9-af58-cf4446dacee3@ideasonboard.com>
 <0ea6be58-0e04-4172-87cd-064a3e4a43bc@suse.de>
 <f35cb350-6be9-48ca-ad7e-e9dd418281d5@ideasonboard.com>
 <4af0b6a7-c16a-4187-bbf5-365a9c86de21@suse.de>
 <e327ad84-b5c9-4480-b873-dc3aca605538@ideasonboard.com>
 <CAPj87rOn=RQ615zyaEdFT2ADfPztU7+heVi0G34Rdg-=QO1cCw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAPj87rOn=RQ615zyaEdFT2ADfPztU7+heVi0G34Rdg-=QO1cCw@mail.gmail.com>
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

On Wed, Jan 15, 2025 at 02:34:26PM +0000, Daniel Stone wrote:
> On Wed, 15 Jan 2025 at 14:20, Tomi Valkeinen wrote:
> > No disagreement there, we need CREATE_DUMB2.
> >
> > My point is that we have the current UAPI, and we have userspace using
> > it, but we don't have clear rules what the ioctl does with specific
> > parameters, and we don't document how it has to be used.
> >
> > Perhaps the situation is bad, and all we can really say is that
> > CREATE_DUMB only works for use with simple RGB formats, and the behavior
> > for all other formats is platform specific. But I think even that would
> > be valuable in the UAPI docs.
> 
> Yeah, CREATE_DUMB only works for use with simple RGB formats in a
> linear layout. Not monochrome or YUV or tiled or displayed rotated or
> whatever.
> 
> If it happens to accidentally work for other uses, that's fine, but
> it's not generically reliable for anything other than simple linear
> RGB. It's intended to let you do splash screens, consoles, recovery
> password entries, and software-rendered compositors if you really
> want. Anything more than that isn't 'dumb'.

We have lots of software out there that rely on CREATE_DUMB supporting
YUV linear formats, and lots of drivers (mostly on Arm I suppose) that
implement YUV support in CREATE_DUMB. I'm fine replacing it with
something better, but I think we need a standard ioctl that can create
linear YUV buffers. I've been told many times that DRM doesn't want to
standardize buffer allocation further than what CREATE_DUMB is made for.
Can we reconsider this rule then ?

-- 
Regards,

Laurent Pinchart
