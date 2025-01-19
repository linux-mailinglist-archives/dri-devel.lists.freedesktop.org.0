Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81069A16324
	for <lists+dri-devel@lfdr.de>; Sun, 19 Jan 2025 18:09:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28E8310E14B;
	Sun, 19 Jan 2025 17:09:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="OBw1pvsH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F06A10E010;
 Sun, 19 Jan 2025 17:09:08 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi
 [81.175.209.231])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 89E37A44;
 Sun, 19 Jan 2025 18:08:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1737306485;
 bh=aJRfXAoIvGiK3DbkqnVQeu1PiaXDKaiA9Gr69mpEeis=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=OBw1pvsHcR2BweZX/KU1szcB/w7FtiRtRW7yb+DznyFivWl1EatIqP+ePhHYSjEzj
 woJcak3Nj+IU95kPpPRovUwkyjiuPwG5ekSoIX5uH93MQlfYfUlHPU6r5/ncEIxZV4
 QiCXHGtqYYzymRcOpqSQO1hNMGBl60pFLxpvCuJY=
Date: Sun, 19 Jan 2025 19:08:59 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Daniel Stone <daniel@fooishbar.org>,
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
Message-ID: <20250119170859.GA2467@pendragon.ideasonboard.com>
References: <c6735280-7c32-4319-8ca9-a7305d8117c3@suse.de>
 <d67adb03-5cd0-4ac9-af58-cf4446dacee3@ideasonboard.com>
 <0ea6be58-0e04-4172-87cd-064a3e4a43bc@suse.de>
 <f35cb350-6be9-48ca-ad7e-e9dd418281d5@ideasonboard.com>
 <4af0b6a7-c16a-4187-bbf5-365a9c86de21@suse.de>
 <e327ad84-b5c9-4480-b873-dc3aca605538@ideasonboard.com>
 <CAPj87rOn=RQ615zyaEdFT2ADfPztU7+heVi0G34Rdg-=QO1cCw@mail.gmail.com>
 <20250116084340.GF6754@pendragon.ideasonboard.com>
 <20250116093854.GG6754@pendragon.ideasonboard.com>
 <e8125edc-928a-47b4-80a3-224c945f6d68@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <e8125edc-928a-47b4-80a3-224c945f6d68@ideasonboard.com>
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

On Thu, Jan 16, 2025 at 12:07:49PM +0200, Tomi Valkeinen wrote:
> On 16/01/2025 11:38, Laurent Pinchart wrote:
> > On Thu, Jan 16, 2025 at 10:43:40AM +0200, Laurent Pinchart wrote:
> >> On Wed, Jan 15, 2025 at 02:34:26PM +0000, Daniel Stone wrote:
> >>> On Wed, 15 Jan 2025 at 14:20, Tomi Valkeinen wrote:
> >>>> No disagreement there, we need CREATE_DUMB2.
> >>>>
> >>>> My point is that we have the current UAPI, and we have userspace using
> >>>> it, but we don't have clear rules what the ioctl does with specific
> >>>> parameters, and we don't document how it has to be used.
> >>>>
> >>>> Perhaps the situation is bad, and all we can really say is that
> >>>> CREATE_DUMB only works for use with simple RGB formats, and the behavior
> >>>> for all other formats is platform specific. But I think even that would
> >>>> be valuable in the UAPI docs.
> >>>
> >>> Yeah, CREATE_DUMB only works for use with simple RGB formats in a
> >>> linear layout. Not monochrome or YUV or tiled or displayed rotated or
> >>> whatever.
> >>>
> >>> If it happens to accidentally work for other uses, that's fine, but
> >>> it's not generically reliable for anything other than simple linear
> >>> RGB. It's intended to let you do splash screens, consoles, recovery
> >>> password entries, and software-rendered compositors if you really
> >>> want. Anything more than that isn't 'dumb'.
> >>
> >> We have lots of software out there that rely on CREATE_DUMB supporting
> >> YUV linear formats, and lots of drivers (mostly on Arm I suppose) that
> >> implement YUV support in CREATE_DUMB. I'm fine replacing it with
> >> something better, but I think we need a standard ioctl that can create
> >> linear YUV buffers. I've been told many times that DRM doesn't want to
> >> standardize buffer allocation further than what CREATE_DUMB is made for.
> >> Can we reconsider this rule then ?
> > 
> > Actually... Instead of adding a CREATE_DUMB2, it would be best on trying
> > to leverage DMA heaps and deprecate allocating from the KMS device.
> 
> If we allocate from DMA heaps, I think we then need a DRM ioctl which 
> will tell you how big buffer(s) you need, based on the size and format.

We will at least a kernel API to expose constraints to userspace.
Whether that should calculate the buffer size for a given format, or
expose information to userspace to enable that calculation, I'm not
sure. But regardless of which option we pick, I agree we likely need a
new API to enable usage of DMA heaps as allocators.

-- 
Regards,

Laurent Pinchart
