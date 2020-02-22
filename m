Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BD43168E18
	for <lists+dri-devel@lfdr.de>; Sat, 22 Feb 2020 10:50:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 182E96E595;
	Sat, 22 Feb 2020 09:50:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com
 [IPv6:2607:f8b0:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 033F76E595
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Feb 2020 09:50:50 +0000 (UTC)
Received: by mail-ot1-x344.google.com with SMTP id j20so4414414otq.3
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Feb 2020 01:50:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=e5S/nZCr4nqEYxH5Y3wrkaNYijjYpxHWH5hGO1LnRQ4=;
 b=BoawQScHyiFG89p7KByW4b9ul7MXcbq2KFCxaQBmHZsXUaIQVsUMVaaBtxIhNYQXs1
 uHS+8wLAiYPdeGIrmVqUmlUt4P6s6NhYO01d+yOhKr++D52TjEaF2OgvgL0WiXAFdaXr
 Fp7Izvk1q6TLrcYd/AayTWFyiLLznQjQzZAtk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=e5S/nZCr4nqEYxH5Y3wrkaNYijjYpxHWH5hGO1LnRQ4=;
 b=VNKoLLcRhe7XY/REUGHxqhOQsCDk7rRK2P/qTjDhWdwFryiE/m8Tjm8n9+V2xnKDAg
 1creEouHFH6fRgyB6M9OAkTfqvpr/qcFXGG+haKwTGYrblouGTp4HQ2Qk4k1uKLNKLOn
 evqubqUjoMRyQ7w2Zd73Rq2uLFyngLMS+UBGFO3qi4tFOnu2g0EhUIf7Rf8PKIZsnvCJ
 N7eqGbA1Q0RI+tRx9GXDTfQ/kQHxHLWb/ksmkFrdPyaSDB7OMNbww+2MedWy+2bf9fzG
 rXhbT6L0PJLfXFEX5Z1StZEEc0/d81TNpqado0Z6codw1zpcc0VQn1EhMB8exwwks5kE
 z2ng==
X-Gm-Message-State: APjAAAWReuQNSZGUXJ0iBeGGkx52b8JU4W/ZtbQLxRhLIyzzwAI4R02x
 Jz8P/Uw5CjAOsO/DwxeZBL5Er5CngWFmE6PQ9cqFag==
X-Google-Smtp-Source: APXvYqwWbAZQEYMHHWhS1aboYiXY2Mf9+ysoQmEML4yKTNEkgCGF5c1t/bJGb8p9rybjNZxZhghXt+84r19k6af2c2Q=
X-Received: by 2002:a05:6830:18f1:: with SMTP id
 d17mr31777824otf.303.1582365050206; 
 Sat, 22 Feb 2020 01:50:50 -0800 (PST)
MIME-Version: 1.0
References: <20200221210319.2245170-1-daniel.vetter@ffwll.ch>
 <20200221210319.2245170-3-daniel.vetter@ffwll.ch>
 <158232098048.7320.8539611385294752480@skylake-alporthouse-com>
 <CAKMK7uHoQM=mK1tMkw3-+v_O6qbmAjrObQXjzYn2154zwQi5qA@mail.gmail.com>
In-Reply-To: <CAKMK7uHoQM=mK1tMkw3-+v_O6qbmAjrObQXjzYn2154zwQi5qA@mail.gmail.com>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Sat, 22 Feb 2020 10:50:39 +0100
Message-ID: <CAKMK7uHSesXLupwWmvZgCK4h6t3goHF76vqcgZXbu9Rw1Sw51A@mail.gmail.com>
Subject: Re: [PATCH 02/51] drm/i915: Don't clear drvdata in ->release
To: Chris Wilson <chris@chris-wilson.co.uk>
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
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Feb 22, 2020 at 10:48 AM Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
>
> On Fri, Feb 21, 2020 at 10:36 PM Chris Wilson <chris@chris-wilson.co.uk> wrote:
> > Quoting Daniel Vetter (2020-02-21 21:02:30)
> > > For two reasons:
> > >
> > > - The driver core clears this already for us after we're unloaded in
> > >   __device_release_driver().
> >
> > Even if we abort before loading?
> >
> > History notes that i915_pci_remove was called with a stale pointer on
> > error.
>
> So even if there's a bug we still have the problem that clearing the
> pci_drvdata in our drm_driver->release hook is way too late. You could
> already have bound a new driver to the underlying device. So if driver
> core doesn't clear drvdata on bind failure and we need to clear this
> ourselves, then this line here could actually clear the drvdata of the
> next driver instance bound to the pci device. Not that that's ever
> going to happen outside of very contrived testing.
>
> But looking at really_probe() in base/dd.c we do clear drvdata on
> failure. So no idea how/why that stale drvdata came to be. Anyway
> that's kinda why I cc'ed Greg, so he could confirm that this is
> correct.

Looking at git history, this was fixed in driver core in

commit 0998d0631001288a5974afc0b2a5f568bcdecb4d
Author: Hans de Goede <hdegoede@redhat.com>
Date:   Wed May 23 00:09:34 2012 +0200

    device-core: Ensure drvdata = NULL when no driver is bound

I'll add that to the commit message.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
