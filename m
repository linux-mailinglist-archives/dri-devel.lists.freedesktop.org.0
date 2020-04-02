Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 485CD19C1D9
	for <lists+dri-devel@lfdr.de>; Thu,  2 Apr 2020 15:13:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 715066EA88;
	Thu,  2 Apr 2020 13:13:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x241.google.com (mail-oi1-x241.google.com
 [IPv6:2607:f8b0:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AABE6EA88
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Apr 2020 13:13:38 +0000 (UTC)
Received: by mail-oi1-x241.google.com with SMTP id k9so2684825oia.8
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Apr 2020 06:13:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MOD1OKjDZ9m0h4qQjuQybCF/pBQV53Hq81AJZAAQ4tQ=;
 b=RY3yfLMdxEJmXX6LF/QbFHzWAdja+flw2YTCHTTGll+ANedm/FgvqP56iTHjd4ldQa
 ccrTQZf/+Og6Gp4EVlqe6Jh2cqfhSbasw7v6qvT60XUAz4Eo+UEpDLeOkTX56KlJqYjK
 wj55oXEnMx6l/E11y/vVbPwr5CGjznGBphbKU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MOD1OKjDZ9m0h4qQjuQybCF/pBQV53Hq81AJZAAQ4tQ=;
 b=C1QDn9OMH+V6gE1zhxTRX/Lu78n/ZFgXscPR++Fdwc2Em5Kd+c79/HferLP98OMwag
 fcHFLhYk2mbq1cH4fE1ap6Z1piTDelLZ3u8241F+JIECVR2mLf7UYGX7Ywuvxk4dO5l8
 Vl7KTyYgGx4QrGr90es2JklfPM4i/4qucqUpFcqKE6zYjYmZiOX/s6A1gXyJaVjqKKti
 FF/gx10m1Q6myrU1FAmPS21Zmt4VFZ7iD/AluVBCAih/AVp3cf3uM4y+ss1S4pfUqopP
 GQmiQXGvjrPIXcLgK2LZMSY/kBcXDHqxTOiuH8OgGD8vZFPdzQ0q4+Mt4C4/VMsiDx//
 +a0w==
X-Gm-Message-State: AGi0Pua4Pz/SQpxAneFJF/KVX26/HsQriWF60oL3wJ9HsRq4iCvifPRu
 VWe9oo/IHCF1/mjuqpnTzqByiVGet3hjcbAfX2JQ79++
X-Google-Smtp-Source: APiQypJxqosMV68Mdu5sw1p4SDIU5NV0DtCJ18mNnt9qygW455OSHcLx6XpUIVZeioq3ZF/PR+7en8cVwr2LaEgg+Ic=
X-Received: by 2002:a54:4189:: with SMTP id 9mr2179916oiy.128.1585833217421;
 Thu, 02 Apr 2020 06:13:37 -0700 (PDT)
MIME-Version: 1.0
References: <956fd624-e1f5-e2a0-90de-9a5f2934547d@nvidia.com>
 <20200402113925.2zvatduiyqld7pj2@wunner.de>
 <20200402154934.04917382@eldfell.localdomain>
In-Reply-To: <20200402154934.04917382@eldfell.localdomain>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Thu, 2 Apr 2020 15:13:26 +0200
Message-ID: <CAKMK7uGusoE+GQOefMTB_tax-Tj5PymMMOrWPMJ6XczdrdFb3g@mail.gmail.com>
Subject: Re: How to handle disconnection of eDP panels due to dynamic display
 mux switches
To: Pekka Paalanen <ppaalanen@gmail.com>
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
Cc: Daniel Dadap <ddadap@nvidia.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Apr 2, 2020 at 2:58 PM Pekka Paalanen <ppaalanen@gmail.com> wrote:
>
> On Thu, 2 Apr 2020 13:39:25 +0200
> Lukas Wunner <lukas@wunner.de> wrote:
>
> > Note that vga_switcheroo is currently controlled via debugfs.
> > That is a historic artefact.  The kernel has since gained a
> > mux subsystem in drivers/mux/ which could be used to represent
> > the display mux in a standardized way in regular sysfs.
>
> Hi,
>
> if mux control was in sysfs, then how would userspace figure out
> which mux state refers to which DRM device and its connector?
>
> Maybe some DRM connector property referring to the mux and its state?
>
> How would a display server running as a regular user gain access to
> sysfs to control the mux?

I think a sysfs interface for vgaswitcheroo would need some kind of
links from drm_device (and for the outpu-only mux from drm_connector
sysfs files) to the corresponding sysfs directory for the
vgaswitcheroo switch.

But actual change of state needs to indeed be done through some other
interface, since sysfs interfaces suck for compositors. We have this
problem already with backlight, and the solution there is a special
backlight frobbing services which compositors can call through udev,
and fun stuff like that. Definitely not an uapi pattern we want to
repeat. So I think sysfs would be only for information links, and
maybe the global switch for the old optimus designs where you can only
switch the entire gpu, and need to delay the switch until all existing
clients are closed. Aka 1) stop compositor 2) write to sysfs 3) start
new compositor on new gpu. For that case compositors don't need to
ever write to sysfs themselves, so I think that's ok. Also only
relevant for rather old hw.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
