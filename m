Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CB80C7E1777
	for <lists+dri-devel@lfdr.de>; Sun,  5 Nov 2023 23:54:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F092910E012;
	Sun,  5 Nov 2023 22:54:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAAFE10E012
 for <dri-devel@lists.freedesktop.org>; Sun,  5 Nov 2023 22:54:32 +0000 (UTC)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi
 [213.243.189.158])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id CC1785AA;
 Sun,  5 Nov 2023 23:54:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1699224852;
 bh=pcacsgb3OWxdK2khmiavqPxLlnW99wbidArlPanL5Q4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Ufh7ZOGijsOwjyrtF/B1P4um8Wdp7NK3TFok4eiqodaZzQO/FKij2OFCUmYNMgiM7
 ClkfagKSsDhWIdblmbV0CIBM3cfr4+XFXE/aq2uDFd5VkisHHkcDpJ5vhlNo8rSetm
 Uk01uTd1vMlrYw0kM3/DxrFA0NH+qTIXBCL4rRT0=
Date: Mon, 6 Nov 2023 00:54:38 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [PATCH 04/10] drm/tidss: Move reset to the end of dispc_init()
Message-ID: <20231105225438.GB15635@pendragon.ideasonboard.com>
References: <20231101-tidss-probe-v1-0-45149e0f9415@ideasonboard.com>
 <20231101-tidss-probe-v1-4-45149e0f9415@ideasonboard.com>
 <20231101135749.GT12764@pendragon.ideasonboard.com>
 <71056358-f91e-4a88-a979-33bfe157289a@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <71056358-f91e-4a88-a979-33bfe157289a@ideasonboard.com>
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
Cc: Aradhya Bhatia <a-bhatia1@ti.com>, Devarsh Thakkar <devarsht@ti.com>,
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Jyri Sarha <jyri.sarha@iki.fi>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Nov 02, 2023 at 08:40:10AM +0200, Tomi Valkeinen wrote:
> On 01/11/2023 15:57, Laurent Pinchart wrote:
> > On Wed, Nov 01, 2023 at 11:17:41AM +0200, Tomi Valkeinen wrote:
> >> We do a DSS reset in the middle of the dispc_init(). While that happens
> >> to work now, we should really make sure that e..g the fclk, which is
> >> acquired only later in the function, is enabled when doing a reset. This
> >> will be handled in a later patch, but for now, let's move the
> >> dispc_softreset() call to the end of dispc_init(), which is a sensible
> >> place for it anyway.
> >>
> >> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> > 
> > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > 
> > But do I understand correctly that the device isn't powered up at this
> > point ? That seems problematic.
> 
> Indeed. It's fixed later in this series.
> 
> > I'm also not sure why we need to reset the device at probe time.
> 
> That's the usual place to do a reset, to make sure the HW is in a known 
> state, is it not? Where would you place it?

The first time the device is used, or possibly every time it is resumed
? It seems that you're resuming it at probe time for the only reason
that you want to then reset it. Resuming it at probe could get entirely
skipped.

-- 
Regards,

Laurent Pinchart
