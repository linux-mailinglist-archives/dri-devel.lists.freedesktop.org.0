Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 381935BA251
	for <lists+dri-devel@lfdr.de>; Thu, 15 Sep 2022 23:26:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6215110E2C4;
	Thu, 15 Sep 2022 21:25:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CC0510E2C4
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Sep 2022 21:25:52 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id E03B4B8226E;
 Thu, 15 Sep 2022 21:25:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4C0EC433C1;
 Thu, 15 Sep 2022 21:25:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1663277148;
 bh=H2ls57PFfBqVntzlewdbjz+tZyYLdyUvuWWhbZDYtOo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NWLeHKx+ZR674A4He77HHQapvQQd1EWssJGSFx+ANscW+bvIqbyClN1PzpL9GNXn8
 WoMsz6Qg7SNQLKKzd9zBE7Za+cDL/yfzN7zJORJTeF+boYajcanat7ty3syOFcqHwj
 FcCrZi5I10HixJVRP5MVm19EPbIKFjuowLzakB+O/U0wBlchc58Gd7oUbCuxcadaD/
 hVUAzwgcwgUVWEWm/UCALSKvZc9KNBvmsxT8R+3alY6G4pk+XOtBNO1wHvk5RUN+ro
 1xCy2fzdLAUP3iNMgHiGCplB9f6Ii/qMYTuA3IfCYGdOTsay2gGVYnpCG2f4UQp0fb
 umd2XqfIX01UA==
Date: Thu, 15 Sep 2022 16:25:45 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: Re: [PATCH 2/2] power: supply: Add Lenovo Yoga C630 EC driver
Message-ID: <20220915212545.q6vxcnrffwr3buq2@builder.lan>
References: <20220810030500.2793882-1-bjorn.andersson@linaro.org>
 <20220810030500.2793882-3-bjorn.andersson@linaro.org>
 <20220913104545.2u6mcyy3bg4dp6ly@mercury.elektranox.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220913104545.2u6mcyy3bg4dp6ly@mercury.elektranox.org>
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
Cc: devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, Lee Jones <lee@kernel.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Sep 13, 2022 at 12:45:45PM +0200, Sebastian Reichel wrote:
> Hi,
> 
> [+Cc Lee Jones, DRI devel]
> 
> On Tue, Aug 09, 2022 at 10:05:00PM -0500, Bjorn Andersson wrote:
> > The Qualcomm Snapdragon-based Lenovo Yoga C630 has some sort of EC
> > providing AC-adapter and battery status, as well as USB Type-C altmode
> > notifications for Displayport operation.
> > 
> > The Yoga C630 ships with Windows, where these operations primarily are
> > implemented in ACPI, but due to various issues with the hardware
> > representation therein it's not possible to run Linux on this
> > information. As such this is a best-effort re-implementation of these
> > operations, based on the register map expressed in ACPI and a fair
> > amount of trial and error.
> > 
> > Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> > ---
> > [...]
> > +	val = yoga_c630_ec_read8(ec, LENOVO_EC_BAT_ATTRIBUTES);
> > +	if (val < 0)
> > +		goto out_unlock;
> > +	ec->unit_ma = val & LENOVO_EC_BAT_ATTR_UNIT_IS_MA;
> > +	if (!ec->unit_ma)
> > +		ec->scale = 1000;
> > +	else
> > +		ec->scale = 1;
> 
> Since I'm not sure how much of information was gained by reverse
> engineering: Is this really milliamps vs microamps and not milliamps
> vs milliwatt? SBS batteries usually report either mA or mW.
> 

Unfortunately I don't know the answer to this.

> > [...]
> > +	case POWER_SUPPLY_PROP_SERIAL_NUMBER:
> > +		val->strval = "05072018";
> > +		break;
> 
> why is this hardcoded? :)
> 

I don't know, but as Daniel suggests, it would make sense to just drop
it.

> > [...]
> > +	device_for_each_child_node(dev, fwnode) {
> > +		ret = fwnode_property_read_u32(fwnode, "reg", &port);
> > +		if (ret < 0)
> > +			continue;
> > +
> > +		/* Got multiple ports, but altmode is only possible on port 1 */
> > +		if (port != 1)
> > +			continue;
> > +
> > +		ec->bridge.funcs = &yoga_c630_ec_bridge_funcs;
> > +		ec->bridge.of_node = to_of_node(fwnode);
> > +		ec->bridge.ops = DRM_BRIDGE_OP_HPD;
> > +		ec->bridge.type = DRM_MODE_CONNECTOR_USB;
> > +
> > +		ret = devm_drm_bridge_add(dev, &ec->bridge);
> > +		if (ret) {
> > +			dev_err(dev, "failed to register drm bridge\n");
> > +			fwnode_handle_put(fwnode);
> > +			return ret;
> > +		}
> 
> I wonder if DRM people want to see this in drivers/gpu/drm/bridge.
> Maybe it's better to make this a MFD driver?
> 

I did consider it, but it adds a whole bunch of boiler plate code
without a lot of benefit.

There are a few other cases where I think it would make sense to have
drm bridges outside of drivers/gpu/drm, such as
drivers/usb/typec/altmodes/ and drivers/platform/chrome/...

> > [...]
> 
> -- Sebastian

Thanks,
Bjorn

