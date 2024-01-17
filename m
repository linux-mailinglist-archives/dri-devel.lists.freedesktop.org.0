Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E0D328307F6
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jan 2024 15:24:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E7E210E6B9;
	Wed, 17 Jan 2024 14:24:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93A7610E6B9
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jan 2024 14:24:17 +0000 (UTC)
Received: from pendragon.ideasonboard.com (89-27-53-110.bb.dnainternet.fi
 [89.27.53.110])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id DF5547EC;
 Wed, 17 Jan 2024 15:23:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1705501387;
 bh=Mp3GlUUoo01KnvzhVZ4uGnXB45N7hYQAgn8WLuIHFWg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ZAvP4NrgylHtA2g5djrWcEdwtXZB1cAqCj2R2E7ke3jj3Dlehc6XREpG7y/5a8tt1
 Lm6f64tQwV6VvzBEbU4yLB918ZJ5ZMDLJZWF6s8R47G9/eht7tNlOhCP4d8Cz4Qmua
 XuKtSf7xgV1mM+h2vZG345z8Yy80X9J20pTZGLx4=
Date: Wed, 17 Jan 2024 16:24:20 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [PATCH 1/4] drm: xlnx: zynqmp_dpsub: Make drm bridge discoverable
Message-ID: <20240117142420.GE17920@pendragon.ideasonboard.com>
References: <20240112234222.913138-1-anatoliy.klymenko@amd.com>
 <20240112234222.913138-2-anatoliy.klymenko@amd.com>
 <98a9f4f1-dd55-47c3-bb1b-07e201b299cd@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <98a9f4f1-dd55-47c3-bb1b-07e201b299cd@ideasonboard.com>
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
Cc: tzimmermann@suse.de, michal.simek@amd.com, linux-kernel@vger.kernel.org,
 mripard@kernel.org, Anatoliy Klymenko <anatoliy.klymenko@amd.com>,
 dri-devel@lists.freedesktop.org, daniel@ffwll.ch, airlied@gmail.com,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jan 17, 2024 at 04:06:31PM +0200, Tomi Valkeinen wrote:
> On 13/01/2024 01:42, Anatoliy Klymenko wrote:
> > Assign device of node to bridge prior registering it. This will
> > make said bridge discoverable by separate crtc driver.
> 
> I think a few words on why this is needed (and why it wasn't needed 
> before) would be nice.
> 
> Other than that:
> 
> Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

Agreed. With a better commit message,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> > Signed-off-by: Anatoliy Klymenko <anatoliy.klymenko@amd.com>
> > ---
> >   drivers/gpu/drm/xlnx/zynqmp_dp.c | 1 +
> >   1 file changed, 1 insertion(+)
> > 
> > diff --git a/drivers/gpu/drm/xlnx/zynqmp_dp.c b/drivers/gpu/drm/xlnx/zynqmp_dp.c
> > index a0606fab0e22..d60b7431603f 100644
> > --- a/drivers/gpu/drm/xlnx/zynqmp_dp.c
> > +++ b/drivers/gpu/drm/xlnx/zynqmp_dp.c
> > @@ -1721,6 +1721,7 @@ int zynqmp_dp_probe(struct zynqmp_dpsub *dpsub)
> >   	bridge->ops = DRM_BRIDGE_OP_DETECT | DRM_BRIDGE_OP_EDID
> >   		    | DRM_BRIDGE_OP_HPD;
> >   	bridge->type = DRM_MODE_CONNECTOR_DisplayPort;
> > +	bridge->of_node = dp->dev->of_node;
> >   	dpsub->bridge = bridge;
> >   
> >   	/*

-- 
Regards,

Laurent Pinchart
