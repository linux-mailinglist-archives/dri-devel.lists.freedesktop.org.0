Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 369AACAD2A4
	for <lists+dri-devel@lfdr.de>; Mon, 08 Dec 2025 13:39:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F181B10E052;
	Mon,  8 Dec 2025 12:39:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=exactco.de header.i=@exactco.de header.b="w4WcB2CM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from exactco.de (exactco.de [176.9.10.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90E9210E052
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Dec 2025 12:39:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=exactco.de; 
 s=x;
 h=Content-Transfer-Encoding:Content-Type:Mime-Version:References:
 In-Reply-To:From:Subject:Cc:To:Message-Id:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=KeWPPRKX3dy9WYAgmoF0Qn0CC0ZYMTr706y5fVbn0yc=; b=w4WcB2CMW1/VpePXlxBVU1oNIR
 Et/M8MsrhKWbx9/UYUUJ5774RUomudph8j6y2+YpbmWH2WcPFnMyRNqNsHyahSbplctsoKViraTz3
 K3Lknjq2opRAmetPUKxT8M+W9EnCan/vwKClsp0L8GcFYQCq5m88rpHCYIkmmfXqj2kWfbmtIKg0v
 hr7rxFD7sOzerg8ipuN74FjQGa+mndBGLpYr4r6tHuqvAy85EYdvgT92i1/e0FOBsXIfAW3Bk1anh
 bRJsK/kVM4eQWELsSFS3E1szB/d1Wni1kMhYRO5rP8+JVpjzutgmXPALlBrgCPtPkamQNd0eN+ZZP
 mNadcVTw==;
Date: Mon, 08 Dec 2025 13:39:50 +0100 (CET)
Message-Id: <20251208.133950.469837482614896193.rene@exactco.de>
To: tzimmermann@suse.de
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 airlied@redhat.com
Subject: Re: [PATCH V2] drm/mgag200: Fix big-endian support
From: =?iso-8859-1?Q?Ren=E9?= Rebe <rene@exactco.de>
In-Reply-To: <816e40d2-e451-4d70-bc44-e07562138b1b@suse.de>
References: <20251205.182405.876575799174263183.rene@exactco.de>
 <816e40d2-e451-4d70-bc44-e07562138b1b@suse.de>
X-Mailer: Mew version 6.10 on Emacs 30.2
Mime-Version: 1.0
Content-Type: Text/Plain; charset=utf-8
Content-Transfer-Encoding: 8bit
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

Moin Thomas,

On Mon, 8 Dec 2025 09:29:53 +0100, Thomas Zimmermann <tzimmermann@suse.de> wrote:

> Hi,
> 
> thanks for the update.

of course!

> Am 05.12.25 um 18:24 schrieb René Rebe:
> > Unlike the original, deleted Matrox mga driver, the new mgag200 driver
> > has the XRGB frame-buffer byte swapped on big-endian "RISC"
> > systems. Fix by enabling byte swapping "PowerPC" OPMODE for any
> > __BIG_ENDIAN config.
> >
> > Fixes: 414c45310625 ("mgag200: initial g200se driver (v2)")
> > Signed-off-by: René Rebe <rene@exactco.de>
> > Cc: stable@kernel.org
> > ---
> > V2: move to atomic_update
> > Tested on IBM 43p Model 150 (7043-150) running T2/Linux.
> > ---
> >   drivers/gpu/drm/mgag200/mgag200_mode.c | 14 ++++++++++++++
> >   1 file changed, 14 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/mgag200/mgag200_mode.c
> > b/drivers/gpu/drm/mgag200/mgag200_mode.c
> > index 951d715dea30..d40434ec68ab 100644
> > --- a/drivers/gpu/drm/mgag200/mgag200_mode.c
> > +++ b/drivers/gpu/drm/mgag200/mgag200_mode.c
> > @@ -496,6 +496,20 @@ void
> > mgag200_primary_plane_helper_atomic_update(struct drm_plane *plane,
> >   	struct drm_atomic_helper_damage_iter iter;
> >   	struct drm_rect damage;
> >   +#ifdef __BIG_ENDIAN
> > +	/* Big-endian byte-swapping */
> > +	switch (fb->format->format) {
> > +	case DRM_FORMAT_RGB565:
> > +		WREG32(MGAREG_OPMODE, 0x10100);
> > +		break;
> > +	case DRM_FORMAT_XRGB8888:
> > +		WREG32(MGAREG_OPMODE, 0x20200);
> > +		break;
> > +	default:
> > +		break;
> 
> No need for a default branch IIRC.

Hm, it was a preventitive measure to avoid compiler warnings, but I'll
check if we don't get one for unhandled format cases, ...

> > +	}
> 
> This is the right place to set up the write mode.
> 
> But looking at the G200 docs, I found that the reset value for OPMODE
> has bit 18 set to 1. These writes clear the value. If that
> intentional?

Well the same doc says: "Reserved <1:0> <7:4> <15:10> <31:18>
Reserved. When writing to this register, the bits in these fields must
be set to ‘0’.  Reading will return ‘0’s"

So I would guess the reset value is a typo. But I'll adjust the code
nontheless.

> For better style and compatibility, I suggest to first read the value
> and keep the reserved bit as-is.
> 
> u32 opmode
> 
> opmode = RREG32(MGAREG_OPMODE)
> opmode &= ~GENMASK(17, 16)
> opmode &= ~GENMASK(9, 8)
> opmode &= ~GENMASK(3, 2)

I'll merge that in one line of GENMASK, hope that's acceptable.

> switch (format) {
>         opmode |= ...;
> }
> 
> WREG32(OPMODE, opmode);
> 
> You can put that in a helper near set_startadd [1]
> 
> void mgag200_set_datasiz(struct mga_device *mdev, u32 format)
> {
> #if __BIG_ENDIAN
> ...
> #endif
> }
> 
> Then call that from atomic_update and it should be fine.

I'll make it a function that if that is what is preferred.

     René

> [1]
> https://elixir.bootlin.com/linux/v6.18/source/drivers/gpu/drm/mgag200/mgag200_mode.c#L117

-- 
René Rebe, ExactCODE GmbH, Berlin, Germany
https://exactco.de • https://t2linux.com • https://patreon.com/renerebe
