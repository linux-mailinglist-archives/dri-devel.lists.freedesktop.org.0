Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ACB4821D7F0
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jul 2020 16:11:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C27AC6E524;
	Mon, 13 Jul 2020 14:11:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5E7F6E503;
 Mon, 13 Jul 2020 14:11:19 +0000 (UTC)
Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com
 [209.85.161.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8547620771;
 Mon, 13 Jul 2020 14:11:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594649479;
 bh=T7QvK7R+StJM4r1IQ7c0n9HcB+fbfozHwcxG3TVZxo4=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=X7FqkZipmIBmyCZGB2I50FJei86C7jKNyhfscfKTgxvANpKpPjPQ+2Oe2TEv+EiB7
 affUXOkPREJoFFD6k8g7b7Z4mpB0bFJ/1T92vUM55PbW8XX5Tt0XNsw4Sk0jdKO3ZR
 L3jlsUUKQorGXQalVIGSFuIaVfRfeIfGk032djzI=
Received: by mail-oo1-f54.google.com with SMTP id s190so2357815ooa.13;
 Mon, 13 Jul 2020 07:11:19 -0700 (PDT)
X-Gm-Message-State: AOAM5318Q39X16kqB9hjneQcer28T6FQrgGhiC0fY5MWB1Ba3iWG4pC6
 ttw+HxCAqEOAyo1tAl0EJBVXFk7zLV51IBTpBw==
X-Google-Smtp-Source: ABdhPJzP1wWznjdcOYYxW7COHis2JavRSCgLMLU2wKLa+wmcB7a1M0yROJgH50RXyQmrjZLEyjG4GfeETI7dveqtQXI=
X-Received: by 2002:a4a:7459:: with SMTP id t25mr64494ooe.25.1594649478792;
 Mon, 13 Jul 2020 07:11:18 -0700 (PDT)
MIME-Version: 1.0
References: <20200710230224.2265647-1-dianders@chromium.org>
In-Reply-To: <20200710230224.2265647-1-dianders@chromium.org>
From: Rob Herring <robh+dt@kernel.org>
Date: Mon, 13 Jul 2020 08:11:07 -0600
X-Gmail-Original-Message-ID: <CAL_JsqKC5WtHb-coMCxMTDJ7CJcjVXcAxDT4J9N-Xyr=0uuURA@mail.gmail.com>
Message-ID: <CAL_JsqKC5WtHb-coMCxMTDJ7CJcjVXcAxDT4J9N-Xyr=0uuURA@mail.gmail.com>
Subject: Re: [PATCH 0/9] drm/msm: Avoid possible infinite probe deferral and
 speed booting
To: Douglas Anderson <dianders@chromium.org>
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
Cc: freedreno <freedreno@lists.freedesktop.org>, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Andy Gross <agross@kernel.org>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jul 10, 2020 at 5:02 PM Douglas Anderson <dianders@chromium.org> wrote:
>
> I found that if I ever had a little mistake in my kernel config,
> or device tree, or graphics driver that my system would sit in a loop
> at bootup trying again and again and again.  An example log was:

Why do we care about optimizing the error case?

>   msm ae00000.mdss: bound ae01000.mdp (ops 0xffffffe596e951f8)
>   msm_dsi ae94000.dsi: ae94000.dsi supply gdsc not found, using dummy regulator
>   msm_dsi_manager_register: failed to register mipi dsi host for DSI 0
>   [drm:ti_sn_bridge_probe] *ERROR* could not find any panel node
>   ...
>
> I finally tracked it down where this was happening:
>   - msm_pdev_probe() is called.
>   - msm_pdev_probe() registers drivers.  Registering drivers kicks
>     off processing of probe deferrals.
>   - component_master_add_with_match() could return -EPROBE_DEFER.
>     making msm_pdev_probe() return -EPROBE_DEFER.
>   - When msm_pdev_probe() returned the processing of probe deferrals
>     happens.
>   - Loop back to the start.
>
> It looks like we can fix this by marking "mdss" as a "simple-bus".
> I have no idea if people consider this the right thing to do or a
> hack.  Hopefully it's the right thing to do.  :-)

It's a simple test. Do the child devices have any dependency on the
parent to probe and/or function? If so, not a simple-bus.

> Once I do this I notice that my boot gets marginally faster (you
> don't need to probe the sub devices over and over) and also if I

Can you quantify that?

Have you run with devlinks enabled. You need a command line option to
enable. That too should reduce deferred probes.

> have a problem it doesn't loop forever (on my system it still
> gets upset about some stuck clocks in that case, but at least I
> can boot up).

Deferred probe only runs when a device is added, so it's not like it
is continually running.

Rob
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
