Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 06E704A4A35
	for <lists+dri-devel@lfdr.de>; Mon, 31 Jan 2022 16:15:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF3E610E250;
	Mon, 31 Jan 2022 15:15:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com
 [IPv6:2607:f8b0:4864:20::329])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95E4E10E247
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Jan 2022 15:15:21 +0000 (UTC)
Received: by mail-ot1-x329.google.com with SMTP id
 s6-20020a0568301e0600b0059ea5472c98so13241784otr.11
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Jan 2022 07:15:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4ZgU+vGjwoubJ875RGR9zEt1v4kg3PV5cuvMBbMqjDc=;
 b=esqX2L3zl905Y4V/EzdVPP2sl+6fanA8uZ9ay50GWGhwYUlJoITrs+ppFlantEW6nQ
 TxuuQOowDZ9PnlFKUR4rVmQGHsl+e+8CHke645UitiKHGeSY1tYZDgUvktOzj+QZLJBv
 9UzdTBOt3eE3dDx3B9kDvC5z1rjSzIUUF1lzA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4ZgU+vGjwoubJ875RGR9zEt1v4kg3PV5cuvMBbMqjDc=;
 b=nBosdW12A/9q/c5OCUgZ9oILEkgKlE78k5+N0i+WUVjHRxkW7S9rWl6a8+T5wKzPzc
 Eblu7MRWGh6PHdWj2LC/u36l/2vkWcI1YWgiiKBcX/Gxb6VBThKLzT9iObgZNA0H2NP8
 9KxukOEETXZAfe9Sa47gFS0X5Vb+dEZmE2BRpPS9TRCXLDMM/LiEcQPFNPxjdBdBa5M6
 dvMEjXONSvS2Zk3EdkAEQppj1HJxY/xLII6AJwTIfe+Iaqq7WdG+nFVg5mj6HyDfAdSU
 7lwFvgEyN7oMGr3xaXepYTiK6QA3cYdpXNoVXX2C08Qznk9fF+lT5XCZp8uB2m4jLvJc
 tqaQ==
X-Gm-Message-State: AOAM531PuUWJj5dNwPSFUK7fwASBxcr4WLJkP4MPBi4ZRhgb+dZ5mOAa
 7zpE2Sw/CV66l/aFSO06XjebYj+yKe8sfg1zhaWCJA==
X-Google-Smtp-Source: ABdhPJyTs7vnJHqxyqBQfChzS9rKUYFzQoYfVDVbHfBXsz/Jv0Pkicsb6xNwHUpx979UIH6aBlsgh3d/tVOt+pEg2C8=
X-Received: by 2002:a05:6830:1153:: with SMTP id
 x19mr11310437otq.321.1643642120656; 
 Mon, 31 Jan 2022 07:15:20 -0800 (PST)
MIME-Version: 1.0
References: <20220127200141.1295328-1-swboyd@chromium.org>
 <20220127200141.1295328-3-swboyd@chromium.org>
 <YffoqgmeUdxZ56zB@kroah.com>
In-Reply-To: <YffoqgmeUdxZ56zB@kroah.com>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Mon, 31 Jan 2022 16:15:09 +0100
Message-ID: <CAKMK7uFYyQ9siB5ENHku+yVPWWM1H=TEn-NZofEKqpJnuEvMmw@mail.gmail.com>
Subject: Re: [PATCH v6 02/35] component: Introduce the aggregate bus_type
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Saravana Kannan <saravanak@google.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Douglas Anderson <dianders@chromium.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Russell King <rmk+kernel@arm.linux.org.uk>, Stephen Boyd <swboyd@chromium.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jan 31, 2022 at 2:48 PM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Thu, Jan 27, 2022 at 12:01:08PM -0800, Stephen Boyd wrote:
> > The component framework only provides 'bind' and 'unbind' callbacks to
> > tell the host driver that it is time to assemble the aggregate driver
> > now that all the components have probed. The component framework doesn't
> > attempt to resolve runtime PM or suspend/resume ordering, and explicitly
> > mentions this in the code. This lack of support leads to some pretty
> > gnarly usages of the 'prepare' and 'complete' power management hooks in
> > drivers that host the aggregate device, and it fully breaks down when
> > faced with ordering shutdown between the various components, the
> > aggregate driver, and the host driver that registers the whole thing.
> >
> > In a concrete example, the MSM display driver at drivers/gpu/drm/msm is
> > using 'prepare' and 'complete' to call the drm helpers
> > drm_mode_config_helper_suspend() and drm_mode_config_helper_resume()
> > respectively, so that it can move the aggregate driver suspend/resume
> > callbacks to be before and after the components that make up the drm
> > device call any suspend/resume hooks they have. This only works as long
> > as the component devices don't do anything in their own 'prepare' and
> > 'complete' callbacks. If they did, then the ordering would be incorrect
> > and we would be doing something in the component drivers before the
> > aggregate driver could do anything. Yuck!
> >
> > Similarly, when trying to add shutdown support to the MSM driver we run
> > across a problem where we're trying to shutdown the drm device via
> > drm_atomic_helper_shutdown(), but some of the devices in the encoder
> > chain have already been shutdown. This time, the component devices
> > aren't the problem (although they could be if they did anything in their
> > shutdown callbacks), but there's a DSI to eDP bridge in the encoder
> > chain that has already been shutdown before the driver hosting the
> > aggregate device runs shutdown. The ordering of driver probe is like
> > this:
> >
> >  1. msm_pdev_probe() (host driver)
> >  2. DSI bridge
> >  3. aggregate bind
> >
> > When it comes to shutdown we have this order:
> >
> >  1. DSI bridge
> >  2. msm_pdev_shutdown() (host driver)
> >
> > and so the bridge is already off, but we want to communicate to it to
> > turn things off on the display during msm_pdev_shutdown(). Double yuck!
> > Unfortunately, this time we can't split shutdown into multiple phases
> > and swap msm_pdev_shutdown() with the DSI bridge.
> >
> > Let's make the component_master_ops into an actual device driver that has
> > probe/remove/shutdown functions. The driver will only be bound to the
> > aggregate device once all component drivers have called component_add()
> > to indicate they're ready to assemble the aggregate driver. This allows
> > us to attach shutdown logic (and in the future runtime PM logic) to the
> > aggregate driver so that it runs the hooks in the correct order.
>
> I know I asked before, but I can not remember the answer.
>
> This really looks like it is turning into the aux bus code.  Why can't
> you just use that instead here for this type of thing?  You are creating
> another bus and drivers for that bus that are "fake" which is great, but
> that's what the aux bus code was supposed to help out with, so we
> wouldn't have to write more of these.
>
> So, if this really is different, can you document it here so I remember
> next time you resend this patch series?

aux takes a device and splits it into a lot of sub-devices, each with
their own driver.

This takes a pile of devices, and turns it into a single logical
device with a single driver.

So aux is 1:N, component is N:1.

And yes you asked this already, I typed this up already :-)

Cheers, Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
