Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 74D31ADE622
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jun 2025 10:56:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 576E110E0E9;
	Wed, 18 Jun 2025 08:56:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ci+LKuB9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2503C10E0E9
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Jun 2025 08:56:07 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi
 [81.175.209.231])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id A1012593;
 Wed, 18 Jun 2025 10:55:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1750236950;
 bh=6BYDznB4RlQc+mhxufVxTPJ5Wx3KeL1CGpPkr2rksDM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ci+LKuB9+BLJf8defbnolBzBEb49WwnAsDr/a1CEepJks+H5U9q5NGNBjPdobiYfQ
 AOYXT54RwVxYlkqrjhJ5MpsqZaVLT+tRdS1f3xSDEc9Xek0YZhDzu3CzB4XlgCNUrc
 9w7gyBDLTtUn/G9oLjUvR9JeOT+C871+ubH2ZBL4=
Date: Wed, 18 Jun 2025 11:55:45 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Dharma.B@microchip.com
Cc: asrivats@redhat.com, dri-devel@lists.freedesktop.org,
 Manikandan.M@microchip.com, neil.armstrong@linaro.org,
 rfoss@kernel.org, jonas@kwiboo.se, jernej.skrabec@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 linux-kernel@vger.kernel.org
Subject: Re: bridge/microchip_lvds panel usage
Message-ID: <20250618085545.GC28826@pendragon.ideasonboard.com>
References: <CAN9Xe3RV9aZLJ3zV3zip5MQweGbBghdOFGohd6Qg-XjvFoGing@mail.gmail.com>
 <20250617233623.GB22102@pendragon.ideasonboard.com>
 <f10ee1ce-5362-4dc9-8e61-726db9c27d64@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <f10ee1ce-5362-4dc9-8e61-726db9c27d64@microchip.com>
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

On Wed, Jun 18, 2025 at 03:50:11AM +0000, Dharma.B@microchip.com wrote:
> On 18/06/25 5:06 am, Laurent Pinchart wrote:
> > On Tue, Jun 17, 2025 at 10:36:34AM -0500, Anusha Srivatsa wrote:
> >> Hey folks,
> >>
> >> Can someone please explain why the driver looks for a panel here:
> >> https://elixir.bootlin.com/linux/v6.14.11/source/drivers/gpu/drm/bridge/
> >> microchip-lvds.c#L182 and doesnt use it or set it up anywhere?
> >>
> >> I bumped into this while working on converting of_drm_find_panel() callers and
> >> the lvds->panel usage in this driver felt off. Am I missing something?
> > 
> > That doesn't seem needed.
> 
> Currently the LVDS controller driver is hardcoded to map LVDS lanes to 
> the JEIDA format.
> 
> In order to support the other format "VESA", we need this to query the 
> panel driver and set the appropriate format accordingly.
> 
> "drm_panel_get_modes(lvds->panel, connector)"

It would be nice if this could be done using the bridge API instead. An
LVDS sink does not necessarily need to be a panel.

> We'll be submitting the patch upstream shortly.
> 
> > By the way, please use plain text when posting to kernel mailing lists.

-- 
Regards,

Laurent Pinchart
