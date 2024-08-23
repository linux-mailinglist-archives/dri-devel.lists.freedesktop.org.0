Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91A6D95D096
	for <lists+dri-devel@lfdr.de>; Fri, 23 Aug 2024 17:01:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1423010EBA8;
	Fri, 23 Aug 2024 15:00:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="JtCOLmxP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDD5910EBA8
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Aug 2024 15:00:57 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi
 [81.175.209.231])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 86400497;
 Fri, 23 Aug 2024 16:59:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1724425192;
 bh=Ci0FUoZVqpuzfnCSAxxyhv4Is6mVnbOTGRED7EYQL2M=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=JtCOLmxPrcL7nD3TLfIIA3nPba6zmxpCzbu8tNvAPXob+5FbhIZIXVqvMAByXWYGK
 eY9nsL+X20KX9n2MN+s4rP63PrloNdI4rUQU3fZ5ztbDimNZOfe6zFZD74zids1kO7
 CYn3u+aDieWAPkFqv2h1atloO09/G5tYs5lHWKUc=
Date: Fri, 23 Aug 2024 18:00:54 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Biju Das <biju.das.jz@bp.renesas.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [PATCH] drm: renesas: Move RZ/G2L MIPI DSI driver to rz-du
Message-ID: <20240823150054.GP26098@pendragon.ideasonboard.com>
References: <20240625123244.200533-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20240626055108.GA10453@pendragon.ideasonboard.com>
 <CA+V-a8tcWVTzDgBMhn8aQaX934MKwOePp3PhMF4TcXqBK2nhAA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CA+V-a8tcWVTzDgBMhn8aQaX934MKwOePp3PhMF4TcXqBK2nhAA@mail.gmail.com>
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

On Fri, Aug 23, 2024 at 02:33:49PM +0100, Lad, Prabhakar wrote:
> On Wed, Jun 26, 2024 at 6:51 AM Laurent Pinchart wrote:
> > On Tue, Jun 25, 2024 at 01:32:44PM +0100, Prabhakar wrote:
> > > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > >
> > > All the RZ/G2L DU specific components are located under the rz-du folder,
> > > so it makes sense to move the RZ/G2L MIPI DSI driver there instead of
> > > keeping it in the rcar-du folder. This change improves the organization
> > > and modularity of the driver configuration by grouping related settings together.
> >
> > I was thinking the same the other day. Thanks for beating me at sending
> > a patch :-)
> >
> > Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> >
> > Do you or Biju has committer rights to drm-misc to push this patch ?
>
> We dont, can you please queue this patch via your tree?

I don't have other pending patches for DRM at the moment. Tomi, could
you push this to drm-misc ?

-- 
Regards,

Laurent Pinchart
