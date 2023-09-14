Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E00B57A0FC5
	for <lists+dri-devel@lfdr.de>; Thu, 14 Sep 2023 23:23:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AE6F10E58C;
	Thu, 14 Sep 2023 21:23:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08C6810E58B;
 Thu, 14 Sep 2023 21:23:27 +0000 (UTC)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi
 [213.243.189.158])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 73DA0DE5;
 Thu, 14 Sep 2023 23:21:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1694726513;
 bh=8BED75KJ60zUIDoeejYozq3VfmyLGSG2b2VZhDTtZ+M=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=L6s/HrTflDm1RcQByNZ7Ate1n8JnN/TubWF9b4BowBJ1HGya4KBYXbhEM/ObqVk86
 zu/pLtRPRoTyORJkzNJ03mEiww6MdApEjfn0Z7yHoQeDWsvTH0FSP6D3jqzvYLQ7I8
 geGvX5N6gz9LgYB+9Mm9KA5NMkG6D74nz8AtU1Jo=
Date: Fri, 15 Sep 2023 00:23:39 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v4 0/3] drm: simplify support for transparent DRM bridges
Message-ID: <20230914212339.GA11890@pendragon.ideasonboard.com>
References: <20230817145516.5924-1-dmitry.baryshkov@linaro.org>
 <20230822141735.GA14396@pendragon.ideasonboard.com>
 <20230822141918.GB14396@pendragon.ideasonboard.com>
 <c266b761-ddd3-4b29-aeb7-fc40348f0662@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <c266b761-ddd3-4b29-aeb7-fc40348f0662@linaro.org>
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
Cc: Kishon Vijay Abraham I <kishon@kernel.org>, freedreno@lists.freedesktop.org,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Bjorn Andersson <andersson@kernel.org>, linux-usb@vger.kernel.org,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, linux-phy@lists.infradead.org,
 Vinod Koul <vkoul@kernel.org>, Andy Gross <agross@kernel.org>,
 dri-devel@lists.freedesktop.org, Andrzej Hajda <andrzej.hajda@intel.com>,
 linux-arm-msm@vger.kernel.org, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Neil,

Sorry about the delay, the series got burried in my inbox.

On Tue, Aug 22, 2023 at 04:27:37PM +0200, Neil Armstrong wrote:
> On 22/08/2023 16:19, Laurent Pinchart wrote:
> > On Tue, Aug 22, 2023 at 05:17:37PM +0300, Laurent Pinchart wrote:
> >> On Thu, Aug 17, 2023 at 05:55:13PM +0300, Dmitry Baryshkov wrote:
> >>> Supporting DP/USB-C can result in a chain of several transparent
> >>> bridges (PHY, redrivers, mux, etc). This results in drivers having
> >>> similar boilerplate code for such bridges.
> >>
> >> What do you mean by transparent bridge here ? Bridges are a DRM concept,
> >> and as far as I can tell, a PHY isn't a bridge. Why does it need to be
> >> handled as one, especially if it's completely transparent ?
> >>
> >>> Next, these drivers are susceptible to -EPROBE_DEFER loops: the next
> >>> bridge can either be probed from the bridge->attach callback, when it is
> >>> too late to return -EPROBE_DEFER, or from the probe() callback, when the
> >>> next bridge might not yet be available, because it depends on the
> >>> resources provided by the probing device.
> >>
> >> Can't device links help avoiding defer probing in those cases ?
> >>
> >>> Last, but not least, this results in the the internal knowledge of DRM
> >>> subsystem slowly diffusing into other subsystems, like PHY or USB/TYPEC.
> >>
> >> Why so ? The PHY subsystem should provide a PHY, without considering
> >> what subsystem it will be used by. This patch series seems to me to
> >> actually create this DRM dependency in other subsystems,
> > 
> > I was wrong on this one, there are indeed existing drm_bridge instances
> > in drivers/usb/ and drivers/phy/. That's certainly not nice. Why do we
> > even need drm_bridge there, why can't the PHYs be acquired by their
> > consumers in DRM (and anywhere else) using the PHY API ?
> 
> Because with USB-C Altmode/USB4/Thunderbolt, DisplayPort is one of the
> data streams handled by PHYs, USB-C PD manager, re-timers, SBU muxes...
> and all this must be coordinated with the display controller and can
> be considered as bridges between the DP controller and the USB-C connector.
> 
> As of today, it has been handled by OOB events on Intel & AMD, but the entirety
> of USB-C chain is handled in firmare, so this scales.
> When we need to describe the entire USB-C data stream chain as port/endpoint
> in DT, OOB handling doesn't work anymore since we need to sync the entire
> USB-C chain (muxes, switches, retimers, phys...) handled by Linux before
> starting the DP stream.

No disagreement here. Handling the component as part of the bridges
chain certainly helps. Ideally, this should be done without spreading
usage of drm_bridge outside of the DRM subsystem. For instance, we
handle (some) D-PHYs in DRM and V4L2 by exposing them as PHYs, and
acquiring them in DSI or CSI-2 controller drivers.

Do I understand correctly that, in this case, the video stream is fully
handled by the PHY (& related) component, without any other device (in
the OF sense) wrapping the PHY like the DSI and CSI-2 controllers do ?
If so that would indeed make it difficult to create the drm_bridge in a
DRM driver that would acquire the PHY. We could come up with a different
mechanism, but that's likely overkill to solve this particular issue (at
least until other similar use cases create a critical mass that will
call for a major refactoring).

In this specific case, however, I'm a bit puzzled. What coordination is
required between the PHYs and the display controller ? The two drivers
modified in patches 2/3 and 3/3 indeed create bridges, but those bridges
don't implement any operation other than attach. Is this needed only
because the PHY has an OF node that sits between the display controller
and the connector, requiring a drm_bridge to exist to bridge the gap and
create a complete chain of bridges up to the connector ? This would
simplify the use case, but probably still call for creating a
drm_bridge in the PHY driver, as other solutions are likely still too
complex.

It seems to me that this series tries to address two issues. One of them
is minimizing the DRM-specific amount of code needed in the PHY drivers.
The second one is to avoid probe deferrals. For the first issue, I agree
that a helper is currently a good option. For the second issue, however,
couldn't device links help avoiding probe deferral ? If so, the helper
could be simplified, avoiding the need to create an auxiliary device.

> >> which I don't
> >> think is a very good idea. Resources should be registered in their own
> >> subsystem with the appropriate API, not in a way that is tied to a
> >> particular consumer.
> >>
> >>> To solve all these issues, define a separate DRM helper, which creates
> >>> separate aux device just for the bridge. During probe such aux device
> >>> doesn't result in the EPROBE_DEFER loops. Instead it allows the device
> >>> drivers to probe properly, according to the actual resource
> >>> dependencies. The bridge auxdevs are then probed when the next bridge
> >>> becomes available, sparing drivers from drm_bridge_attach() returning
> >>> -EPROBE_DEFER.
> >>
> >> I'm not thrilled :-( Let's discuss the questions above first.
> >>
> >>> Proposed merge strategy: immutable branch with the drm commit, which is
> >>> then merged into PHY and USB subsystems together with the corresponding
> >>> patch.
> >>>
> >>> Changes since v3:
> >>>   - Moved bridge driver to gpu/drm/bridge (Neil Armstrong)
> >>>   - Renamed it to aux-bridge (since there is already a simple_bridge driver)
> >>>   - Made CONFIG_OF mandatory for this driver (Neil Armstrong)
> >>>   - Added missing kfree and ida_free (Dan Carpenter)
> >>>
> >>> Changes since v2:
> >>>   - ifdef'ed bridge->of_node access (LKP)
> >>>
> >>> Changes since v1:
> >>>   - Added EXPORT_SYMBOL_GPL / MODULE_LICENSE / etc. to drm_simple_bridge
> >>>
> >>> Dmitry Baryshkov (3):
> >>>    drm/bridge: add transparent bridge helper
> >>>    phy: qcom: qmp-combo: switch to DRM_AUX_BRIDGE
> >>>    usb: typec: nb7vpq904m: switch to DRM_AUX_BRIDGE
> >>>
> >>>   drivers/gpu/drm/bridge/Kconfig            |   9 ++
> >>>   drivers/gpu/drm/bridge/Makefile           |   1 +
> >>>   drivers/gpu/drm/bridge/aux-bridge.c       | 132 ++++++++++++++++++++++
> >>>   drivers/phy/qualcomm/Kconfig              |   2 +-
> >>>   drivers/phy/qualcomm/phy-qcom-qmp-combo.c |  44 +-------
> >>>   drivers/usb/typec/mux/Kconfig             |   2 +-
> >>>   drivers/usb/typec/mux/nb7vpq904m.c        |  44 +-------
> >>>   include/drm/bridge/aux-bridge.h           |  19 ++++
> >>>   8 files changed, 167 insertions(+), 86 deletions(-)
> >>>   create mode 100644 drivers/gpu/drm/bridge/aux-bridge.c
> >>>   create mode 100644 include/drm/bridge/aux-bridge.h

-- 
Regards,

Laurent Pinchart
