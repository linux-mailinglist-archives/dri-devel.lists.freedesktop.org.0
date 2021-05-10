Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34BFF378A4F
	for <lists+dri-devel@lfdr.de>; Mon, 10 May 2021 13:59:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E45E26E459;
	Mon, 10 May 2021 11:59:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com
 [209.85.167.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6F126E459
 for <dri-devel@lists.freedesktop.org>; Mon, 10 May 2021 11:59:33 +0000 (UTC)
Received: by mail-oi1-f178.google.com with SMTP id i81so15562271oif.6
 for <dri-devel@lists.freedesktop.org>; Mon, 10 May 2021 04:59:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ft2as+DEhhR7uAKVAn+z+CaK8IC5vgi2WkAS6id5V0Q=;
 b=eRSQDHOvADN/pzbd1yEiEUXDBxlzhQAbDQOyiezLadNVdeieWqL2sO+ud1Gw5pOaPT
 5X4BNofgcEXnWAHQplFBTnEGy5WVWo2yJKcpoADR7ewx+f9FRSKY/fC+K6h8ODMPWWg3
 YnJ1/0Bv34XaS9A29czfn9wZjp4FFjtVV3exE1cfmENXCEv8atnPbpH0zZJfmV2eUIl7
 RljgBM1G0Yf5bccgkftQi8a3vA+7idDUeG72+9ZDhwZ42rWNCKtW6ynLOmcAicNDk9d/
 anLJJs9wujqJC7pDs41kTCKtrZ4TPSBKE3WtnxycOHYm3oplmfSjXmB6iVds3z3HzO5z
 4vEg==
X-Gm-Message-State: AOAM532iu3ZrCuM0vcL/dcwY3SDgPNZ1Dx45+uprTKFXFEY8JUk/CfR6
 rqAAA2GZM2+FmonOjJOPDPHWNCjcXurC7hfsuwo=
X-Google-Smtp-Source: ABdhPJw3mWmVQtgGJmtc3X2Fgr1ShkV4TgstW/nQiiPsLAuD10Ol93xQnTGqlRGvUMyKJ6gUc2jY+GdU/CVHKemEh3Y=
X-Received: by 2002:a05:6808:90d:: with SMTP id
 w13mr3003924oih.71.1620647973280; 
 Mon, 10 May 2021 04:59:33 -0700 (PDT)
MIME-Version: 1.0
References: <20210508074118.1621729-1-swboyd@chromium.org>
In-Reply-To: <20210508074118.1621729-1-swboyd@chromium.org>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Mon, 10 May 2021 13:59:17 +0200
Message-ID: <CAJZ5v0jX4ef+oO95dyFmKC0hnfKR7kSmHKQzD=RHgN51O1w_uQ@mail.gmail.com>
Subject: Re: [PATCH] component: Move host device to end of device lists on
 binding
To: Stephen Boyd <swboyd@chromium.org>
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
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Russell King <rmk+kernel@arm.linux.org.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, May 8, 2021 at 9:41 AM Stephen Boyd <swboyd@chromium.org> wrote:
>
> The device lists are poorly ordered when the component device code is
> used. This is because component_master_add_with_match() returns 0
> regardless of component devices calling component_add() first. It can
> really only fail if an allocation fails, in which case everything is
> going bad and we're out of memory. The host device (called master_dev in
> the code), can succeed at probe and be put on the device lists before
> any of the component devices are probed and put on the lists.
>
> Within the component device framework this usually isn't that bad
> because the real driver work is done at bind time via
> component{,master}_ops::bind(). It becomes a problem when the driver
> core, or host driver, wants to operate on the component device outside
> of the bind/unbind functions, e.g. via 'remove' or 'shutdown'. The
> driver core doesn't understand the relationship between the host device
> and the component devices and could possibly try to operate on component
> devices when they're already removed from the system or shut down.
>
> Normally, device links or probe defer would reorder the lists and put
> devices that depend on other devices in the lists at the correct
> location, but with component devices this doesn't happen because this
> information isn't expressed anywhere. Drivers simply succeed at
> registering their component or host with the component framework and
> wait for their bind() callback to be called once the other components
> are ready. We could make various device links between 'master_dev' and
> 'component->dev' but it's not necessary. Let's simply move the hosting
> device to the end of the device lists when the component device fully
> binds. This way we know that all components are present and have probed
> properly and now the host device has really probed so it's safe to
> assume the host driver ops can operate on any component device.

Moving a device to the end of dpm_list is generally risky in cases
when some dependency information may be missing.

For example, if there is a device depending on the hosting one, but
that dependency is not represented by a device link or a direct
ancestor-descendant relationship (or generally a path in the device
dependency graph leading from one of them to the other), then moving
it to the end of dpm_list would cause system-wide suspend to fail (the
hosting device would be suspended before the one depending on it).

That may not be a concern here, but at least it would be good to
document why it is not a concern.
