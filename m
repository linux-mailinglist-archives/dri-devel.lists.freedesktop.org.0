Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B16567A0FFC
	for <lists+dri-devel@lfdr.de>; Thu, 14 Sep 2023 23:44:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D51AE10E2B7;
	Thu, 14 Sep 2023 21:44:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49F0D10E2B7;
 Thu, 14 Sep 2023 21:44:04 +0000 (UTC)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi
 [213.243.189.158])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1B570DE5;
 Thu, 14 Sep 2023 23:42:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1694727750;
 bh=Ls6Iqpj4d+iGrGYu3xYKdLqh+5iuBjo1ZErfbO+0uUc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=vrlss3I858TYlhOLMdeM85lhnvtnyVS7sPPwsOqa+Kb8N/JxxiCff0loPMEIDgw62
 1nM6YuwsRts4UkZ0MZkjY9DqerhRGs9JvBtp8J29XNHGIc7EiIjUD3PuM5c33b6E9m
 R1gnv8htcFXotv/S0J6hCiF2TNumyyDdc7wZeUsw=
Date: Fri, 15 Sep 2023 00:44:16 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v4 0/3] drm: simplify support for transparent DRM bridges
Message-ID: <20230914214416.GB11890@pendragon.ideasonboard.com>
References: <20230817145516.5924-1-dmitry.baryshkov@linaro.org>
 <20230822141735.GA14396@pendragon.ideasonboard.com>
 <CAA8EJpp_FYOKHziHOWF6E1RTkHEJ8oXXH90EDmJbLG1UDO1ofA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAA8EJpp_FYOKHziHOWF6E1RTkHEJ8oXXH90EDmJbLG1UDO1ofA@mail.gmail.com>
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

On Mon, Sep 04, 2023 at 12:02:18AM +0300, Dmitry Baryshkov wrote:
> On Tue, 22 Aug 2023 at 17:17, Laurent Pinchart wrote:
> > On Thu, Aug 17, 2023 at 05:55:13PM +0300, Dmitry Baryshkov wrote:
> > > Supporting DP/USB-C can result in a chain of several transparent
> > > bridges (PHY, redrivers, mux, etc). This results in drivers having
> > > similar boilerplate code for such bridges.
> >
> > What do you mean by transparent bridge here ? Bridges are a DRM concept,
> > and as far as I can tell, a PHY isn't a bridge. Why does it need to be
> > handled as one, especially if it's completely transparent ?
> >
> > > Next, these drivers are susceptible to -EPROBE_DEFER loops: the next
> > > bridge can either be probed from the bridge->attach callback, when it is
> > > too late to return -EPROBE_DEFER, or from the probe() callback, when the
> > > next bridge might not yet be available, because it depends on the
> > > resources provided by the probing device.
> >
> > Can't device links help avoiding defer probing in those cases ?
> 
> It looks like both Neil and I missed this question.

And I missed this reply before replying to Neil and pointing to device
links again :-)

> Two items wrt devlinks. First, I view them as a helper. So if one
> disables the devlinks enforcement, he'd still get a deferral loop.

That may be true, but I don't think that's a compelling argument. If one
disables components meant to avoid probe deferral, they should expect
probe deferral :-)

> Second, in this case we can not enforce devlinks (or return
> -EPROBE_DEFER from the probe() function) because the next bridge is
> not yet available when the main driver probes. Unfortunately bridges
> are allocated in the opposite order. So, using AUX devices helps us to
> break it. Because first typec mux/retimer/switch/etc devices probe (in
> the direction from the typec source to the typec port). Then DRM
> bridge devices are probed starting from the end of the chain
> (connector) to the DP source (root DP bridge/controller).

I'm not too familiar with the drivers involved in the typec chain. Do
you mean that the sink driver needs to get hold of the source device at
probe time, deferring probe if the source is not available ? Does the
driver handler the USB connector need to do the same ? I'm looking at
the qcom_pmic_typec driver and I don't immediately see where it would
defer probing if its source isn't available, but I may well be missing
something.

> > > Last, but not least, this results in the the internal knowledge of DRM
> > > subsystem slowly diffusing into other subsystems, like PHY or USB/TYPEC.
> >
> > Why so ? The PHY subsystem should provide a PHY, without considering
> > what subsystem it will be used by. This patch series seems to me to
> > actually create this DRM dependency in other subsystems, which I don't
> > think is a very good idea. Resources should be registered in their own
> > subsystem with the appropriate API, not in a way that is tied to a
> > particular consumer.
> >
> > > To solve all these issues, define a separate DRM helper, which creates
> > > separate aux device just for the bridge. During probe such aux device
> > > doesn't result in the EPROBE_DEFER loops. Instead it allows the device
> > > drivers to probe properly, according to the actual resource
> > > dependencies. The bridge auxdevs are then probed when the next bridge
> > > becomes available, sparing drivers from drm_bridge_attach() returning
> > > -EPROBE_DEFER.
> >
> > I'm not thrilled :-( Let's discuss the questions above first.
> 
> Laurent, please excuse me for the ping. Any further response from your side?
> I'd like to send the next iteration of this patchset.
> 
> > > Proposed merge strategy: immutable branch with the drm commit, which is
> > > then merged into PHY and USB subsystems together with the corresponding
> > > patch.

-- 
Regards,

Laurent Pinchart
