Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ADE99C95C0B
	for <lists+dri-devel@lfdr.de>; Mon, 01 Dec 2025 07:10:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBD5B10E0DE;
	Mon,  1 Dec 2025 06:09:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Nv0k29J/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C799010E0DE
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Dec 2025 06:09:55 +0000 (UTC)
Received: from pendragon.ideasonboard.com (fp76f193f3.tkyc206.ap.nuro.jp
 [118.241.147.243])
 by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id E1561446;
 Mon,  1 Dec 2025 07:07:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1764569260;
 bh=tjaOB2zntMkOgrhr6M6GcEQvaqEpyZrZPfYY/dgIjJU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Nv0k29J/Z6Z60sCaAlL1Q4HbgsoA7ekeL+efE4eGXe88/bxFRd0qdXUZYR0wK35f4
 ViHrSrzUmjIuF1GHQjs38odh3e7f9wsMRghUx5q3BTpKljBSCu6aP3aU9crtwDayDU
 h6uVZDiz/q2SamKDr9M75CIPG/0KYg5Hz00AZ0qw=
Date: Mon, 1 Dec 2025 15:09:31 +0900
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: dri-devel@lists.freedesktop.org, David Airlie <airlied@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Magnus Damm <magnus.damm@gmail.com>,
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] drm/rcar-du: dsi: Handle both DRM_MODE_FLAG_N.SYNC and
 !DRM_MODE_FLAG_P.SYNC
Message-ID: <20251201060931.GC21943@pendragon.ideasonboard.com>
References: <20251107230419.471866-1-marek.vasut+renesas@mailbox.org>
 <20251107232329.GI5558@pendragon.ideasonboard.com>
 <f92e90f1-2bc3-49c2-a6e4-40dcf63cb0e1@mailbox.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <f92e90f1-2bc3-49c2-a6e4-40dcf63cb0e1@mailbox.org>
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

Hi Marek,

On Tue, Nov 25, 2025 at 09:13:02PM +0100, Marek Vasut wrote:
> On 11/8/25 12:23 AM, Laurent Pinchart wrote:
> > On Sat, Nov 08, 2025 at 12:04:10AM +0100, Marek Vasut wrote:
> >> Since commit 94fe479fae96 ("drm/rcar-du: dsi: Clean up handling of DRM mode flags")
> >> the driver does not set TXVMVPRMSET0R_VSPOL_LOW and TXVMVPRMSET0R_HSPOL_LOW
> >> for modes which set neither DRM_MODE_FLAG_[PN].SYNC.
> > 
> > Could you please explain what broke ?

Sorry, I wasn't clear. I meant could you summarize the explanation in
the commit message ?

> Consider mode->flags, V-ones for simplicity:
> 
> Before 94fe479fae96 :
> 
> DRM_MODE_FLAG_PVSYNC => vprmset0r |= 0
> DRM_MODE_FLAG_NVSYNC => vprmset0r |= TXVMVPRMSET0R_VSPOL_LOW
> Neither DRM_MODE_FLAG_[PN]VSYNC => vprmset0r |= TXVMVPRMSET0R_VSPOL_LOW
> 
> After 94fe479fae96 :
> 
> DRM_MODE_FLAG_PVSYNC => vprmset0r |= 0
> DRM_MODE_FLAG_NVSYNC => vprmset0r |= TXVMVPRMSET0R_VSPOL_LOW
> Neither DRM_MODE_FLAG_[PN]VSYNC => vprmset0r |= 0 <---------- This broke
> 
> The "Neither" case behavior is different. I did not realize that:
> 
> DRM_MODE_FLAG_N[HV]SYNC is not equivalent !DRM_MODE_FLAG_P[HV]SYNC
> 
> They really are not equivalent .
> 
> [...]
> 
> >>   	/* Configuration for Video Parameters, input is always RGB888 */
> >>   	vprmset0r = TXVMVPRMSET0R_BPP_24;
> >> -	if (mode->flags & DRM_MODE_FLAG_NVSYNC)
> >> +	if ((mode->flags & DRM_MODE_FLAG_NVSYNC) ||
> >> +	    !(mode->flags & DRM_MODE_FLAG_PVSYNC))
> >>   		vprmset0r |= TXVMVPRMSET0R_VSPOL_LOW;
> > 
> > I don't think this restores the previous behaviour. You would need to
> > write
> > 
> > 	if (!(mode->flags & DRM_MODE_FLAG_PVSYNC))
> > 		vprmset0r |= TXVMVPRMSET0R_VSPOL_LOW;
>
> This patch covers both the N[HV]SYNC and !P[HV]SYNC , so that should 
> restore the behavior to "Before" and explicitly be clear that N[HV]SYNC 
> and !P[HV]SYNC are not the same thing.

Before commit 94fe479fae96 we had

	vprmset0r = (mode->flags & DRM_MODE_FLAG_PVSYNC ?
		     TXVMVPRMSET0R_VSPOL_HIG : TXVMVPRMSET0R_VSPOL_LOW)
		  | (mode->flags & DRM_MODE_FLAG_PHSYNC ?
		     TXVMVPRMSET0R_HSPOL_HIG : TXVMVPRMSET0R_HSPOL_LOW)
		  | TXVMVPRMSET0R_CSPC_RGB | TXVMVPRMSET0R_BPP_24;

Considering the vertical sync for simplicity, this gives us

NVSYNC \ PVSYNC		0		1
 0			VSPOL_LOW	VSPOL_HIG
 1			VSPOL_LOW	VSPOL_HIG

With this patch, the code becomes

	/* Configuration for Video Parameters, input is always RGB888 */
	vprmset0r = TXVMVPRMSET0R_BPP_24;
	if ((mode->flags & DRM_MODE_FLAG_NVSYNC) ||
	    !(mode->flags & DRM_MODE_FLAG_PVSYNC))
		vprmset0r |= TXVMVPRMSET0R_VSPOL_LOW;
	if ((mode->flags & DRM_MODE_FLAG_NHSYNC) ||
	    !(mode->flags & DRM_MODE_FLAG_PHSYNC))
		vprmset0r |= TXVMVPRMSET0R_HSPOL_LOW;

which gives us

NVSYNC \ PVSYNC		0		1
 0			VSPOL_LOW	VSPOL_HIG
 1			VSPOL_LOW	VSPOL_LOW

This is a different behaviour. Granted, we should never have both NVSYNC
and PVSYNC set together (unless I'm missing something), so the
difference in behaviour shouldn't matter. I'm fine with that if you
explain it in the commit message, however I think that writing

 	if (!(mode->flags & DRM_MODE_FLAG_PVSYNC))
 		vprmset0r |= TXVMVPRMSET0R_VSPOL_LOW;
 	if (!(mode->flags & DRM_MODE_FLAG_PHSYNC))
 		vprmset0r |= TXVMVPRMSET0R_HSPOL_LOW;

would both restore the previous behaviour in all cases, and be simpler.

-- 
Regards,

Laurent Pinchart
