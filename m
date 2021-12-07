Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB11246C294
	for <lists+dri-devel@lfdr.de>; Tue,  7 Dec 2021 19:20:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A74A16E4D4;
	Tue,  7 Dec 2021 18:20:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12DD36E4D4;
 Tue,  7 Dec 2021 18:20:48 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10190"; a="261718957"
X-IronPort-AV: E=Sophos;i="5.87,295,1631602800"; d="scan'208";a="261718957"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2021 09:54:49 -0800
X-IronPort-AV: E=Sophos;i="5.87,293,1631602800"; d="scan'208";a="502693308"
Received: from ideak-desk.fi.intel.com ([10.237.68.141])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2021 09:54:44 -0800
Date: Tue, 7 Dec 2021 19:54:40 +0200
From: Imre Deak <imre.deak@intel.com>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Subject: Re: [RFC] drm/msm/dp: Allow attaching a drm_panel
Message-ID: <20211207175440.GB727629@ideak-desk.fi.intel.com>
References: <YVumL1lHLqtb/HKS@ripper>
 <CAD=FV=W9uKq00wXn4H1ax0u2D=R8Wn3J-Je43uxcPyDtk7AK7Q@mail.gmail.com>
 <YVyMwsvLl6XalJxB@ripper>
 <CAD=FV=WY+g38p7--QKZCaQnSqx7VvdwC36jH-VKnrEWoxK=XHQ@mail.gmail.com>
 <YV0KBWxVtKgOp2Cj@ripper>
 <CAD=FV=X5JFE3u9BtxxocaUrYNSpYXJN90UJ8HOvXZE6oYiVsDQ@mail.gmail.com>
 <CACeCKac4b_ej87cQD692TNwpsoFsmBwDcSeLy5fp+pvLX1si7g@mail.gmail.com>
 <YV7JNH9QvI4cBz5s@kuha.fi.intel.com> <Ya6PTGN4zaZ8RD9K@ripper>
 <Ya9S3cFo0rOUotqY@kuha.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Ya9S3cFo0rOUotqY@kuha.fi.intel.com>
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
Cc: freedreno <freedreno@lists.freedesktop.org>,
 David Airlie <airlied@linux.ie>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Doug Anderson <dianders@chromium.org>, Abhinav Kumar <abhinavk@codeaurora.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Kuogee Hsieh <khsieh@codeaurora.org>, Hans de Goede <hdegoede@redhat.com>,
 Prashant Malani <pmalani@chromium.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Vara Reddy <varar@codeaurora.org>, Stephen Boyd <swboyd@chromium.org>,
 Sean Paul <sean@poorly.run>, LKML <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Dec 07, 2021 at 02:26:05PM +0200, Heikki Krogerus wrote:
> +Hans and Imre
> [...]
>
> Originally I wanted an API that we could use to pass all the details
> that we have in the USB Type-C drivers (that would be the
> configuration and status) to the GPU drivers, but Hans was against
> that because, if I remember correctly, the OOB hotplug event may need
> to be delivered to the GPU drivers in some cases even when the
> connector is not USB Type-C connector, and he wanted a common API.
> Hans, please correct me if I got it wrong.
> 
> I think that the GPU drivers need to handle USB Type-C connectors
> separately one way or the other, but maybe the notification from the
> connector can continue to be generic - not USB Type-C specific.
> 
> Imre proposed that the GPU drivers should be able to query the
> DisplayPort configuration and status from the USB Type-C drivers
> instead of the USB Type-C drivers just dumping the information
> together with the notification about some event (so connection,
> disconnection or attention) like I originally proposed. Imre, please
> correct me if I misunderstood you :-).

I think the link config may be useful on Intel systems as well where the
hotplug event is delivered by another mean, the Gfx driver getting an
actual HW interrupt. Also on systems where the hotplug event does get
delivered OOB, the Gfx driver may want to query the current state, for
instance during booting or system resuming, independently of a hotplug
event.

Based on the above imo it would make sense to decouple the hotplug event
notification and the link configuration querying interface, or at least
make the querying possible in addition to the notification.

> I'm fine with anything, but we do need improvement here as you guys
> can see.
> 
> thanks,
> 
> -- 
> heikki
