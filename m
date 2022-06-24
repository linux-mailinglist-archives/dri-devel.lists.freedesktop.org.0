Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5339555A1D0
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jun 2022 21:31:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 728BC10E8A3;
	Fri, 24 Jun 2022 19:31:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay3-1.pub.mailoutpod1-cph3.one.com
 (mailrelay3-1.pub.mailoutpod1-cph3.one.com [46.30.210.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0764D10E8A3
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jun 2022 19:31:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=26XWS+BEZUsFc8T30VkpLbQL6gEJiwlj5b4vdncRS8Y=;
 b=ZEukHQ3tuiFF+EBG7LkTd4qC6EysCqwtM66oDzvuGejlDWNixHrMbK3prG8n3XWwQQM3G5A2I7pmD
 yCdTKueSssHYujc9vJLXwfxdgXGICHYu/2RLNuLp9MsHDepK9jAltTVnAOSPYXy3QIwtpLCxQGXFbV
 EghdrFu9LH9KQ1TFRWnsa6OOKm9EAbkKTc/LO3e4G9RUfzIh9UTSsycEVME3DvBspDijpVvreN1L5t
 t57VkBG42LPMzVB9MUDqHkkKnzGEJIWw7qZy+UoAGutcO6AUoBglFvzJoCZd7apfoJrDdpoxx8HOqf
 nepAWvnLO4BBf7UBSqgOX/ARzLzdjyw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=26XWS+BEZUsFc8T30VkpLbQL6gEJiwlj5b4vdncRS8Y=;
 b=eU4b5OXEjUlOoTSdJZEx0KcibQucfISn9gf01FNJ4+rOBCiEVLZKdKFXLLvFWWFJXiBIRhWEdQXig
 v5FnxsHDg==
X-HalOne-Cookie: 81746b3ad002315a1fe5b0f1589620bc9445f895
X-HalOne-ID: 3a5b23f1-f3f4-11ec-be7c-d0431ea8bb03
Received: from mailproxy1.cst.dirpod3-cph3.one.com
 (80-162-45-141-cable.dk.customer.tdc.net [80.162.45.141])
 by mailrelay3.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
 id 3a5b23f1-f3f4-11ec-be7c-d0431ea8bb03;
 Fri, 24 Jun 2022 19:31:22 +0000 (UTC)
Date: Fri, 24 Jun 2022 21:31:20 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Maxime Ripard <maxime@cerno.tech>
Subject: Re: [PATCH v2 10/68] drm/bridge: panel: Introduce drmm_of_get_bridge
Message-ID: <YrYRCN9LO+dnpNFo@ravnborg.org>
References: <20220622143209.600298-1-maxime@cerno.tech>
 <20220622143209.600298-11-maxime@cerno.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220622143209.600298-11-maxime@cerno.tech>
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@intel.com>,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jun 22, 2022 at 04:31:11PM +0200, Maxime Ripard wrote:
> Unlike what can be found for other DRM entities, we don't have a
> DRM-managed function equivalent to devm_drm_of_get_bridge().
> 
> Let's create it.
> 
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---
>  drivers/gpu/drm/bridge/panel.c | 35 ++++++++++++++++++++++++++++++++++
>  include/drm/drm_bridge.h       |  2 ++
>  2 files changed, 37 insertions(+)
> 
> diff --git a/drivers/gpu/drm/bridge/panel.c b/drivers/gpu/drm/bridge/panel.c
> index 07d720aa38c6..0bf824ca1f25 100644
> --- a/drivers/gpu/drm/bridge/panel.c
> +++ b/drivers/gpu/drm/bridge/panel.c
> @@ -425,4 +425,39 @@ struct drm_bridge *devm_drm_of_get_bridge(struct device *dev,
>  	return bridge;
>  }
>  EXPORT_SYMBOL(devm_drm_of_get_bridge);
> +
> +/**
> + * drmm_of_get_bridge - Return next bridge in the chain
> + * @dev: device to tie the bridge lifetime to
> + * @np: device tree node containing encoder output ports
> + * @port: port in the device tree node
> + * @endpoint: endpoint in the device tree node
> + *
> + * Given a DT node's port and endpoint number, finds the connected node
> + * and returns the associated bridge if any, or creates and returns a
> + * drm panel bridge instance if a panel is connected.
> + *
> + * Returns a pointer to the bridge if successful, or an error pointer
> + * otherwise.
Maybe extend this text to:

	Returns a drmm managed pointer to the bridge if successful, or an error
	pointer otherwise.

To tell the reader that there is no need for any cleanup.

With this or something similar added:
Acked-by: Sam Ravnborg <sam@ravnborg.org>

	Sam
