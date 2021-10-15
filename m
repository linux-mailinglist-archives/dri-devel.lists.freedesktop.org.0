Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EB6142EA3B
	for <lists+dri-devel@lfdr.de>; Fri, 15 Oct 2021 09:33:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 327E96ECCA;
	Fri, 15 Oct 2021 07:33:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from honk.sigxcpu.org (honk.sigxcpu.org [24.134.29.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A4436ECCA
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Oct 2021 07:33:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by honk.sigxcpu.org (Postfix) with ESMTP id AF786FB03;
 Fri, 15 Oct 2021 09:33:10 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at honk.sigxcpu.org
Received: from honk.sigxcpu.org ([127.0.0.1])
 by localhost (honk.sigxcpu.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ednuw0b_LAvH; Fri, 15 Oct 2021 09:33:09 +0200 (CEST)
Date: Fri, 15 Oct 2021 09:33:08 +0200
From: Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Jyri Sarha <jyri.sarha@iki.fi>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/bridge: Ignore -EPROBE_DEFER when bridge attach fails
Message-ID: <YWkutByrZSLAhVH8@qwark.sigxcpu.org>
References: <00493cc61d1443dab1c131c46c5890f95f6f9b25.1634068657.git.agx@sigxcpu.org>
 <YWXrPE/G6gaXA6o3@ravnborg.org>
 <YWXyUHAeoWUeyMY4@qwark.sigxcpu.org>
 <YWiGeAaHoAL6Qga2@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YWiGeAaHoAL6Qga2@ravnborg.org>
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

Hi Sam,
On Thu, Oct 14, 2021 at 09:35:20PM +0200, Sam Ravnborg wrote:
> Hi Guido,
> 
> > > >  
> > > > +	if (ret != -EPROBE_DEFER) {
> > > >  #ifdef CONFIG_OF
> > > > -	DRM_ERROR("failed to attach bridge %pOF to encoder %s: %d\n",
> > > > -		  bridge->of_node, encoder->name, ret);
> > > > +		DRM_ERROR("failed to attach bridge %pOF to encoder %s: %d\n",
> > > > +			  bridge->of_node, encoder->name, ret);
> > > 
> > > It would be better to use drm_probe_err().
> > 
> > That's what i thought initially but since the rest here uses DRM_*
> > logging i stuck with it. Happy to change that though.
> 
> If we continue to use the deprecated DRM_ logging functions then we will
> never get rid of them. And then I like the simplicity of
> drm_probe_err().

I wasn't aware those are deprecated. I'll fix that up in case this patch
is needed, which

https://lore.kernel.org/dri-devel/CAMty3ZAsn4K0WFRC_FNN2Mina0gSu4Nc1y1zVsoZ8GuSqcQFsA@mail.gmail.com/

makes it a bit look like it.
Cheers,
  -- Guido

> 
> In the end it is up to you.
> 
> 	Sam
> 
