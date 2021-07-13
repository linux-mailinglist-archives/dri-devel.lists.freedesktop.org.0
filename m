Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ED5B3C7700
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jul 2021 21:34:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 703776E11E;
	Tue, 13 Jul 2021 19:34:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.smtp.larsendata.com (mx1.smtp.larsendata.com
 [91.221.196.215])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25F466E11C
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jul 2021 19:34:38 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx1.smtp.larsendata.com (Halon) with ESMTPS
 id 58e5d393-e411-11eb-9082-0050568c148b;
 Tue, 13 Jul 2021 19:34:32 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id 61C01194B3A;
 Tue, 13 Jul 2021 21:34:48 +0200 (CEST)
Date: Tue, 13 Jul 2021 21:34:34 +0200
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [RFC] drm: return int error code from mode_fixup
Message-ID: <YO3qyktHXds+4vql@ravnborg.org>
References: <1626196421-24595-1-git-send-email-gracan@codeaurora.org>
 <CAKMK7uGcwLmvyPB1Z2HyOQg3bHYev5J=ad8Cjj=AQMVTTSHPNg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKMK7uGcwLmvyPB1Z2HyOQg3bHYev5J=ad8Cjj=AQMVTTSHPNg@mail.gmail.com>
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
Cc: Grace An <gracan@codeaurora.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Stephen Boyd <swboyd@chromium.org>, Kuogee Hsieh <khsieh@codeaurora.org>,
 pdhaval@codeaurora.org, Sean Paul <seanpaul@chromium.org>,
 Abhinav Kumar <abhinavk@codeaurora.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, aravindh@codeaurora.org,
 freedreno <freedreno@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jul 13, 2021 at 07:44:12PM +0200, Daniel Vetter wrote:
> On Tue, Jul 13, 2021 at 7:14 PM Grace An <gracan@codeaurora.org> wrote:
> > When CONFIG_PROVE_LOCKING is defined, the kernel randomly injects
> > -EDEADLK errors for all the ww_mutex. This results in
> > drm_atomic_get_private_obj_state randomly returning -EDEADLK.
> > However, the mode_fixup functions do not propagate these error
> > codes and return false, causing the atomic commit to fail with
> > -EINVAL instead of retrying.
> >
> > Change encoder, crtc, and bridge mode_fixup functions to return
> > an int instead of a boolean to indicate success or failure. If
> > any of these functions fail, the mode_fixup function now returns
> > the provided integer error code instead of -EINVAL.
> >
> > This change needs modifications across drivers, but before submitting
> > the entire change, we want to get feedback on this RFC.
> >
> > Signed-off-by: Grace An <gracan@codeaurora.org>
> 
> Why don't you just use the various atomic_check hooks we have for
> this? There you get passed the state and everything, have a full int
> return value, and things actually work.
> 
> ->mode_fixup is for compatibility with legacy crtc modeset helpers
> from the pre-atomic times. If the kerneldoc isn't clear yet, please do
> a patch to fix that up so that @mode_fixup points at the relevant
> @atomic_check as the recommended function.
Agreed, and we need to document this better.

I have posted the following patch to make it more obvious that
mode_fixup is deprecated.
https://lore.kernel.org/dri-devel/20210713193257.958852-1-sam@ravnborg.org/T/#u

	Sam
