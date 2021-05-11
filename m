Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E259237AC8D
	for <lists+dri-devel@lfdr.de>; Tue, 11 May 2021 19:00:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02CFB6E7D1;
	Tue, 11 May 2021 17:00:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com
 [IPv6:2607:f8b0:4864:20::336])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E23066EA85
 for <dri-devel@lists.freedesktop.org>; Tue, 11 May 2021 17:00:44 +0000 (UTC)
Received: by mail-ot1-x336.google.com with SMTP id
 d3-20020a9d29030000b029027e8019067fso18053063otb.13
 for <dri-devel@lists.freedesktop.org>; Tue, 11 May 2021 10:00:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=+kc9oZEJ14VtCjgrFBVdOi9/5rD3BSHSZSNV5GjZufU=;
 b=PwB1lvevVfB5Kbm7k/H348W91Tj9WxfX+YOZ70lpfrPoOc2vzHtRmS5rzAxstsVpqY
 Zl0ZnQ2lcLSRGIrkT1mPSfwIH/C9/vw9xKaTCm97G55DwAuj0An0UPbRbckwhMyctHF/
 Zgehk3RmB3QlbD21BR0O3H+D2qgTa39u0LNUA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=+kc9oZEJ14VtCjgrFBVdOi9/5rD3BSHSZSNV5GjZufU=;
 b=XVo7CmCQcnt1OVcFkXlSihW78at5uCU6zt9MyvXSklc+E3azhI0kwsapq0RATmKli9
 im59v4xmOjxFsUB5pFw87zxK7B6DFcRaw2nlOVGua9PzLsfXdHIPWkqEUMfSPuIBnfll
 vccPZlmHNjSr5SS9/kCoX1jT5Dh+LMRg1A66Oys67BPaEPovDInrisvZ6RDD2PEmhNIJ
 4IRcetvIF4cIWX7Dtd4ysAeQmEmSvYJh+e74OLEW3xfyNN+wr/C735pEMB+H+AMdB4Se
 pJ7juyfQXr01ayrn2jE/fLCKFzkV7gfPKjNdSKASeJKbMe4GsAhmFH+LOZLLYzCPLm9t
 +u5w==
X-Gm-Message-State: AOAM531vIZiuyomoNhl9MuKDv2mYX2EAK9kfdjDOtGg4n8RuGE5QjcLg
 oH9SlRukpF+1Mr4bB0ZBOzsB36QNSB4pOZdM8hq+1Q==
X-Google-Smtp-Source: ABdhPJzW1noUSaOfHP3CiUI7zDa9O8HOgGEUnZzp7SKJNkf/LeqfB00UDdoZldzFkZBlJffiYsv995L7sOx4TuPsCo4=
X-Received: by 2002:a9d:425:: with SMTP id 34mr27097167otc.25.1620752444214;
 Tue, 11 May 2021 10:00:44 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 11 May 2021 10:00:43 -0700
MIME-Version: 1.0
In-Reply-To: <CAJZ5v0h42fTKueFxrB6fpc9YBVNyDsCBryAf_geS-=0+OQQqjg@mail.gmail.com>
References: <20210508074118.1621729-1-swboyd@chromium.org>
 <YJlZwYS+oH7W5WjO@phenom.ffwll.local>
 <CAE-0n52S=LFRx93qVyWBpF5PmdCEbWH_+HnN0Do9W45kiJLCbQ@mail.gmail.com>
 <CAKMK7uE_yrXNdEYTf-snNU9dS+=6AKOmUxRuLSHLWBTOtVwpmg@mail.gmail.com>
 <CAE-0n50d8_OtZTpBGaz0uhj6AO823_kwHg9+SJK6ar=e+rGxFA@mail.gmail.com>
 <CAJZ5v0h42fTKueFxrB6fpc9YBVNyDsCBryAf_geS-=0+OQQqjg@mail.gmail.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Tue, 11 May 2021 10:00:43 -0700
Message-ID: <CAE-0n50WBz6rpbuxw-2=XNi=1fmaf=mYrcWdV88E-0KioKHZDg@mail.gmail.com>
Subject: Re: [PATCH] component: Move host device to end of device lists on
 binding
To: "Rafael J. Wysocki" <rafael@kernel.org>
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Russell King <rmk+kernel@arm.linux.org.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Rafael J. Wysocki (2021-05-11 03:52:06)
> On Mon, May 10, 2021 at 9:08 PM Stephen Boyd <swboyd@chromium.org> wrote:
>
> [cut]
>
> >
> > >
> > > > I will try it, but then I wonder about things like system wide
> > > > suspend/resume too. The drm encoder chain would need to reimplement the
> > > > logic for system wide suspend/resume so that any PM ops attached to the
> > > > msm device run in the correct order. Right now the bridge PM ops will
> > > > run, the i2c bus PM ops will run, and then the msm PM ops will run.
> > > > After this change, the msm PM ops will run, the bridge PM ops will run,
> > > > and then the i2c bus PM ops will run. It feels like that could be a
> > > > problem if we're suspending the DSI encoder while the bridge is still
> > > > active.
> > >
> > > Yup suspend/resume has the exact same problem as shutdown.
> >
> > I think suspend/resume has the exact opposite problem. At least I think
> > the correct order is to suspend the bridge, then the encoder, i.e. DSI,
> > like is happening today. It looks like drm_atomic_helper_shutdown()
> > operates from the top down when we want bottom up? I admit I have no
> > idea what is supposed to happen here.
>
> Why would the system-wide suspend ordering be different from the
> shutdown ordering?

I don't really know. I'm mostly noting that today the order of suspend
is to suspend the bridge device first and then the aggregate device. If
the suspend of the aggregate device is traversing the devices like
drm_atomic_helper_shutdown() then it would operate on the bridge device
after it has been suspended, like is happening during shutdown. But it
looks like that isn't happening. At least for the msm driver we're
suspending the aggregate device after the bridge, and there are some
weird usages of prepare and complete in there (see msm_pm_prepare() and
msm_pm_complete) which makes me think that it's all working around this
component code.

The prepare phase is going to suspend the display pipeline, and then the
bridge device will run its suspend hooks, and then the aggregate driver
will run its suspend hooks. If we had a proper device for the aggregate
device instead of the bind/unbind component hooks we could clean this
up.
