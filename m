Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA133793D2B
	for <lists+dri-devel@lfdr.de>; Wed,  6 Sep 2023 14:53:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAFF810E652;
	Wed,  6 Sep 2023 12:53:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E90BE10E64D;
 Wed,  6 Sep 2023 12:53:02 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (ftip006315900.acc1.colindale.21cn-nte.bt.net [81.134.214.249])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1141CC67;
 Wed,  6 Sep 2023 14:51:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1694004694;
 bh=CK01IiZiOV1yzBXhaL2G5EakiuDqVpjdqXxmqxECGis=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=kM4/wrxycaptyYTYg2Gwps4Cf8UyilDJHlIBqWZKG1gEB8Sukz+oDH15W8kG2xwd0
 Vl6VELjdsUVr+G3UsUUVbv38p3B7qf2rAvEUfsAqv73CPpllezPNnCFXqIYbGVCSCh
 P6LlGKh1VoDWvo8cEhfLybXlypN/CwQ8DhN5ANaA=
Date: Wed, 6 Sep 2023 15:53:14 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [RFC PATCH v1 01/12] Revert "drm/sysfs: Link DRM connectors to
 corresponding Type-C connectors"
Message-ID: <20230906125314.GI17308@pendragon.ideasonboard.com>
References: <20230903214150.2877023-1-dmitry.baryshkov@linaro.org>
 <20230903214150.2877023-2-dmitry.baryshkov@linaro.org>
 <ZPbrtAlO2Y+bjDhf@kuha.fi.intel.com>
 <CAA8EJpqUg2-k7LLBL38RHU1sThkXB54ca68xEMd1yMnHQcQ++w@mail.gmail.com>
 <ZPh0Ps9UJ3HLzdeR@kuha.fi.intel.com>
 <CAA8EJpratbBybgk8woD3maA=J_HuQis44Unq0n+c_UvaFs__AA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAA8EJpratbBybgk8woD3maA=J_HuQis44Unq0n+c_UvaFs__AA@mail.gmail.com>
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
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 dri-devel@lists.freedesktop.org, Andrzej Hajda <andrzej.hajda@intel.com>,
 Janne Grunau <j@jannau.net>, Robert Foss <rfoss@kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Andy Gross <agross@kernel.org>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Guenter Roeck <linux@roeck-us.net>, Thomas Zimmermann <tzimmermann@suse.de>,
 Jonas Karlman <jonas@kwiboo.se>, linux-arm-msm@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Bjorn Andersson <andersson@kernel.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Won Chung <wonchung@google.com>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Sep 06, 2023 at 03:48:35PM +0300, Dmitry Baryshkov wrote:
> On Wed, 6 Sept 2023 at 15:44, Heikki Krogerus wrote:
> > On Tue, Sep 05, 2023 at 01:56:59PM +0300, Dmitry Baryshkov wrote:
> > > On Tue, 5 Sept 2023 at 11:50, Heikki Krogerus wrote:
> > > > On Mon, Sep 04, 2023 at 12:41:39AM +0300, Dmitry Baryshkov wrote:
> > > > > The kdev->fwnode pointer is never set in drm_sysfs_connector_add(), so
> > > > > dev_fwnode() checks never succeed, making the respective commit NOP.
> > > >
> > > > That's not true. The dev->fwnode is assigned when the device is
> > > > created on ACPI platforms automatically. If the drm_connector fwnode
> > > > member is assigned before the device is registered, then that fwnode
> > > > is assigned also to the device - see drm_connector_acpi_find_companion().
> > > >
> > > > But please note that even if drm_connector does not have anything in
> > > > its fwnode member, the device may still be assigned fwnode, just based
> > > > on some other logic (maybe in drivers/acpi/acpi_video.c?).
> > > >
> > > > > And if drm_sysfs_connector_add() is modified to set kdev->fwnode, it
> > > > > breaks drivers already using components (as it was pointed at [1]),
> > > > > resulting in a deadlock. Lockdep trace is provided below.
> > > > >
> > > > > Granted these two issues, it seems impractical to fix this commit in any
> > > > > sane way. Revert it instead.
> > > >
> > > > I think there is already user space stuff that relies on these links,
> > > > so I'm not sure you can just remove them like that. If the component
> > > > framework is not the correct tool here, then I think you need to
> > > > suggest some other way of creating them.
> > >
> > > The issue (that was pointed out during review) is that having a
> > > component code in the framework code can lead to lockups. With the
> > > patch #2 in place (which is the only logical way to set kdev->fwnode
> > > for non-ACPI systems) probing of drivers which use components and set
> > > drm_connector::fwnode breaks immediately.
> > >
> > > Can we move the component part to the respective drivers? With the
> > > patch 2 in place, connector->fwnode will be copied to the created
> > > kdev's fwnode pointer.
> > >
> > > Another option might be to make this drm_sysfs component registration optional.
> >
> > You don't need to use the component framework at all if there is
> > a better way of determining the connection between the DP and its
> > Type-C connector (I'm assuming that that's what this series is about).
> > You just need the symlinks, not the component.
> 
> The problem is that right now this component registration has become
> mandatory. And if I set the kdev->fwnode manually (like in the patch
> 2), the kernel hangs inside the component code.
> That's why I proposed to move the components to the place where they
> are really necessary, e.g. i915 and amd drivers.

I'm all for keeping the component framework out of common code. I
dislike that framework with passion, and still haven't lost all hopes of
replacing it with something better.

-- 
Regards,

Laurent Pinchart
