Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 52F7F4C6444
	for <lists+dri-devel@lfdr.de>; Mon, 28 Feb 2022 09:00:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC20710E231;
	Mon, 28 Feb 2022 08:00:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0C8310E21D;
 Mon, 28 Feb 2022 08:00:31 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id A72FD478;
 Mon, 28 Feb 2022 09:00:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1646035229;
 bh=j1vcAnpCtc7Xgzfg/FlQUTL+S5OgdzbOV88LH3DY05o=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=tud/S9ktlrFwq9eCTml8ahczTAme4n087TzTHJVdwikgx9vcoRo2w4EVgYFUn1NuD
 k+eEtzHfW0mFNUQKitvsq0MnVzfK7XOKkvQaXw41fqrD4F5Ltc4zVu1C47SZm04B+O
 rfCejOne6ecWkF1+E2DO2d1PLp8PQADH0Y+FJ22Q=
Date: Mon, 28 Feb 2022 10:00:18 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: "Kandpal, Suraj" <suraj.kandpal@intel.com>
Subject: Re: [PATCH 5/6] drm/rcar_du: changes to rcar-du driver resulting
 from drm_writeback_connector structure changes
Message-ID: <YhyBEnI/P5KezATw@pendragon.ideasonboard.com>
References: <20220202085429.22261-1-suraj.kandpal@intel.com>
 <20220202085429.22261-6-suraj.kandpal@intel.com>
 <Yfp8Q6OFqTAvESOi@pendragon.ideasonboard.com>
 <87y22ts948.fsf@intel.com>
 <CAA8EJprrhPtDkWRk8+6Wf+OoQi4u8m_t7G5guJQW+SNuttOSgQ@mail.gmail.com>
 <87sft1s1m5.fsf@intel.com>
 <MWHPR11MB17412030E65D4E4821549E24E33C9@MWHPR11MB1741.namprd11.prod.outlook.com>
 <d0677cbd-64f1-eb13-7aea-3de599134d09@quicinc.com>
 <MWHPR11MB1741E1C4A6247CCCBECC6793E33F9@MWHPR11MB1741.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <MWHPR11MB1741E1C4A6247CCCBECC6793E33F9@MWHPR11MB1741.namprd11.prod.outlook.com>
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
Cc: "carsten.haitzler@arm.com" <carsten.haitzler@arm.com>, "Nikula,
 Jani" <jani.nikula@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, "Murthy,
 Arun R" <arun.r.murthy@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Suraj,

On Sat, Feb 26, 2022 at 05:10:06AM +0000, Kandpal, Suraj wrote:
> Hi Abhinav,
> 
> > Based on the discussion in this thread [1] , it seems like having drm_encoder
> > as a pointer seems to have merits for both of us and also in agreement with
> > the folks on this thread and has a better chance of an ack.
> > 
> > However drm_connector is not.
> > 
> > I had a brief look at your implementation. Any reason you need to go
> > through intel_connector here and not drm_writeback_connector directly?
> > 
> > The reason I ask is that I see you are not using prepare_writeback_job hook.
> > If you use that, you can use the drm_writeback_connector passed on from
> > there instead of looping through your list like you are doing in
> > intel_find_writeback_connector.
> > 
> > Also, none of the other entries of struct intel_connector are being used for
> > the writeback implementation. So does the drm_writeback_connector in
> > your implementation need to be an intel_connector when its anyway not
> > using other fields? Why cant it be just stored as a drm_writeback_connector
> > itself in your struct intel_wd.
> 
> The reason we can't do that is i915 driver always assumes that all connectors
> present in device list is an intel connector and since drm_writeback_connector
> even though a faux connector in it's initialization calls drm_connector_init()
> and gets added to the drm device list and hence the i915 driver also expects 
> a corresponding intel connector to go with it. In case I do try to make writeback
> connector standalone a lot of checks, a lot will have to be added all around the 
> driver as there could be a chance that one of the drm_connector in the drm device
> list may not be an intel_connector.
> Yes right now not all fields of intel_connector are being used but we will be working
> on filling them as we add more functionality to writeback for example introducing
> content protection. 
> So even if I do float the patch series with just drm_encoder as pointer it won't help
> us with our implementation if drm_connector isn't a pointer too.

This is a direct consequence of the decision to use connectors for
writeback in the userspace API. This disrupts any code that assumes that
a connector is a connector. The problem isn't limited to kernelspace,
userspace has the same exact problem, which resulted in a hack to avoid
breaking everything. Userspace software that needs to deal with
writeback needs to set the DRM_CLIENT_CAP_WRITEBACK_CONNECTORS
capability to get the writeback connectors exposed by the kernel, but
more than that, a large refactoring is then often needed to chase all
code paths that assume a connector is a connector.

I'm afraid the same applies to the kernel. Drivers that don't use
writeback are largely unaffected. Drievrs that want to use writeback
need to be refactored to properly handle the fact that writeback
connectors are special. i915 will need to go that way.

-- 
Regards,

Laurent Pinchart
