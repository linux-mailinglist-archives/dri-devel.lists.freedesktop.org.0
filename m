Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 17783675064
	for <lists+dri-devel@lfdr.de>; Fri, 20 Jan 2023 10:13:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9002310E27D;
	Fri, 20 Jan 2023 09:13:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 574 seconds by postgrey-1.36 at gabe;
 Fri, 20 Jan 2023 09:13:33 UTC
Received: from hi1smtp01.de.adit-jv.com (smtp1.de.adit-jv.com [93.241.18.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C9BC10E27D
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Jan 2023 09:13:33 +0000 (UTC)
Received: from hi2exch02.adit-jv.com (hi2exch02.adit-jv.com [10.72.92.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by hi1smtp01.de.adit-jv.com (Postfix) with ESMTPS id D74EB520251;
 Fri, 20 Jan 2023 10:03:56 +0100 (CET)
Received: from vmlxhi-182 (10.72.94.8) by hi2exch02.adit-jv.com (10.72.92.28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.17; Fri, 20 Jan
 2023 10:03:56 +0100
Date: Fri, 20 Jan 2023 10:03:48 +0100
From: Michael Rodin <mrodin@de.adit-jv.com>
To: Maxime Ripard <maxime@cerno.tech>
Subject: Re: [PATCH] drm: override detected status for connectors which are
 forced on
Message-ID: <20230120090348.GA860002@vmlxhi-182>
References: <20221107123657.24vbgep3jqeklb2s@houat>
 <20221215170359.92422-1-mrodin@de.adit-jv.com>
 <20221222174054.tsj4rfzejrl3cc7g@penduick>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20221222174054.tsj4rfzejrl3cc7g@penduick>
X-Originating-IP: [10.72.94.8]
X-ClientProxiedBy: hi2exch02.adit-jv.com (10.72.92.28) To
 hi2exch02.adit-jv.com (10.72.92.28)
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, michael@rodin.online,
 Michael Rodin <mrodin@de.adit-jv.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, laurent.pinchart@ideasonboard.com,
 Alex Deucher <alexander.deucher@amd.com>, Dave Airlie <airlied@redhat.com>,
 erosca@de.adit-jv.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Maxime,

thank you for your feedback!
On Thu, Dec 22, 2022 at 06:40:54PM +0100, Maxime Ripard wrote:
> Hi,
> 
> On Thu, Dec 15, 2022 at 06:03:59PM +0100, Michael Rodin wrote:
> > The detected status of a connector should be ignored when a connector is
> > forced as hinted in the commit d50ba256b5f1 ("drm/kms: start
> > adding command line interface using fb."). One negative side effect of
> > not ignoring this is observed on the RCar3 SoCs which use the dw-hdmi
> > driver. It continues executing drm_helper_hpd_irq_event even if its
> > connector is forced to ON. As consequence drm_helper_hpd_irq_event calls
> > "detect" so the connector status is updated to "disconnected":
> > 
> > [  420.201527] [drm:drm_helper_hpd_irq_event] [CONNECTOR:76:HDMI-A-1] status updated from connected to disconnected
> > 
> > This status is corrected by drm_helper_probe_single_connector_modes shortly
> > after this because this function checks if a connector is forced:
> > 
> > [  420.218703] [drm:drm_helper_probe_single_connector_modes] [CONNECTOR:76:HDMI-A-1] status updated from disconnected to connected
> > 
> > To avoid similar issues this commit adapts functions which call "detect"
> > so they check additionally if a connector is forced and override the status
> > returned by "detect".
> > 
> > Fixes: 816da85a0990 ("drm: handle HPD and polled connectors separately")
> > Signed-off-by: Michael Rodin <mrodin@de.adit-jv.com>
> 
> As reported here, this breaks vc4, and probably i915:
> https://lore.kernel.org/dri-devel/20221107123657.24vbgep3jqeklb2s@houat/
> 
> Maxime

My understanding from [1,2] was that the way to avoid such regressions is
to make sure that the "detect" callbacks of connector drivers are always
called even if a connector is forced. This is what I have implemented in my
second patch where "detect" is called first and then the return value is
adjusted based on the "force" status. If my understanding was wrong, I
would very much appreciate if you could give me some hints for the
implementation of an acceptable solution. Maybe it would be safer to simply
avoid calling drm_helper_hpd_irq_event in the dw-hdmi driver when the
connector is forced like mentioned by Laurent [3]? Although this would fix
this global problem only for one particular driver.

[1] https://lore.kernel.org/dri-devel/20221107123657.24vbgep3jqeklb2s@houat/
[2] https://lore.kernel.org/dri-devel/20221107122504.tejlb24bjbaxw5t6@houat/
[3] https://lore.kernel.org/dri-devel/YzYrNJbfGcch1UtX@pendragon.ideasonboard.com/

-- 
Best Regards,
Michael
