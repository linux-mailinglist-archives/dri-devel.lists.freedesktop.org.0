Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B71967843C0
	for <lists+dri-devel@lfdr.de>; Tue, 22 Aug 2023 16:17:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01D6D10E37A;
	Tue, 22 Aug 2023 14:17:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 874C710E378;
 Tue, 22 Aug 2023 14:17:30 +0000 (UTC)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi
 [213.243.189.158])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id A7C4D899;
 Tue, 22 Aug 2023 16:16:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1692713770;
 bh=JokuvgauE1ZyOLZxdG9lq+SVJD++g9Zc0UG2ZKuWWuI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=buQkUcEs8c+3FJhV+eb9Lhi62eDMO1RVIMFv+rrHKeU7oQccHqF4+2MiTy07Mu62M
 pCOcxlpRSwDXyjCBcGMKw3NNe8CoDcFspG2VTciWhjEusvS4ARisl28OQMEG2Cudjo
 5m1aQfiGDMyMxy4KO818M9D3RPbJVT/45q1ue37Y=
Date: Tue, 22 Aug 2023 17:17:35 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v4 0/3] drm: simplify support for transparent DRM bridges
Message-ID: <20230822141735.GA14396@pendragon.ideasonboard.com>
References: <20230817145516.5924-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230817145516.5924-1-dmitry.baryshkov@linaro.org>
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
Cc: Kishon Vijay Abraham I <kishon@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Bjorn Andersson <andersson@kernel.org>, linux-usb@vger.kernel.org,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Vinod Koul <vkoul@kernel.org>,
 Andy Gross <agross@kernel.org>, dri-devel@lists.freedesktop.org,
 Andrzej Hajda <andrzej.hajda@intel.com>, linux-arm-msm@vger.kernel.org,
 linux-phy@lists.infradead.org, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dmitry,

Thank you for the patches.

On Thu, Aug 17, 2023 at 05:55:13PM +0300, Dmitry Baryshkov wrote:
> Supporting DP/USB-C can result in a chain of several transparent
> bridges (PHY, redrivers, mux, etc). This results in drivers having
> similar boilerplate code for such bridges.

What do you mean by transparent bridge here ? Bridges are a DRM concept,
and as far as I can tell, a PHY isn't a bridge. Why does it need to be
handled as one, especially if it's completely transparent ?

> Next, these drivers are susceptible to -EPROBE_DEFER loops: the next
> bridge can either be probed from the bridge->attach callback, when it is
> too late to return -EPROBE_DEFER, or from the probe() callback, when the
> next bridge might not yet be available, because it depends on the
> resources provided by the probing device.

Can't device links help avoiding defer probing in those cases ?

> Last, but not least, this results in the the internal knowledge of DRM
> subsystem slowly diffusing into other subsystems, like PHY or USB/TYPEC.

Why so ? The PHY subsystem should provide a PHY, without considering
what subsystem it will be used by. This patch series seems to me to
actually create this DRM dependency in other subsystems, which I don't
think is a very good idea. Resources should be registered in their own
subsystem with the appropriate API, not in a way that is tied to a
particular consumer.

> To solve all these issues, define a separate DRM helper, which creates
> separate aux device just for the bridge. During probe such aux device
> doesn't result in the EPROBE_DEFER loops. Instead it allows the device
> drivers to probe properly, according to the actual resource
> dependencies. The bridge auxdevs are then probed when the next bridge
> becomes available, sparing drivers from drm_bridge_attach() returning
> -EPROBE_DEFER.

I'm not thrilled :-( Let's discuss the questions above first.

> Proposed merge strategy: immutable branch with the drm commit, which is
> then merged into PHY and USB subsystems together with the corresponding
> patch.
> 
> Changes since v3:
>  - Moved bridge driver to gpu/drm/bridge (Neil Armstrong)
>  - Renamed it to aux-bridge (since there is already a simple_bridge driver)
>  - Made CONFIG_OF mandatory for this driver (Neil Armstrong)
>  - Added missing kfree and ida_free (Dan Carpenter)
> 
> Changes since v2:
>  - ifdef'ed bridge->of_node access (LKP)
> 
> Changes since v1:
>  - Added EXPORT_SYMBOL_GPL / MODULE_LICENSE / etc. to drm_simple_bridge
> 
> Dmitry Baryshkov (3):
>   drm/bridge: add transparent bridge helper
>   phy: qcom: qmp-combo: switch to DRM_AUX_BRIDGE
>   usb: typec: nb7vpq904m: switch to DRM_AUX_BRIDGE
> 
>  drivers/gpu/drm/bridge/Kconfig            |   9 ++
>  drivers/gpu/drm/bridge/Makefile           |   1 +
>  drivers/gpu/drm/bridge/aux-bridge.c       | 132 ++++++++++++++++++++++
>  drivers/phy/qualcomm/Kconfig              |   2 +-
>  drivers/phy/qualcomm/phy-qcom-qmp-combo.c |  44 +-------
>  drivers/usb/typec/mux/Kconfig             |   2 +-
>  drivers/usb/typec/mux/nb7vpq904m.c        |  44 +-------
>  include/drm/bridge/aux-bridge.h           |  19 ++++
>  8 files changed, 167 insertions(+), 86 deletions(-)
>  create mode 100644 drivers/gpu/drm/bridge/aux-bridge.c
>  create mode 100644 include/drm/bridge/aux-bridge.h

-- 
Regards,

Laurent Pinchart
