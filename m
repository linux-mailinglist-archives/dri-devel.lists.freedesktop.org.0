Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D1A2D168E13
	for <lists+dri-devel@lfdr.de>; Sat, 22 Feb 2020 10:48:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EEE16E593;
	Sat, 22 Feb 2020 09:48:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x242.google.com (mail-oi1-x242.google.com
 [IPv6:2607:f8b0:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6D566E593
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Feb 2020 09:48:45 +0000 (UTC)
Received: by mail-oi1-x242.google.com with SMTP id l136so4247480oig.1
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Feb 2020 01:48:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=cmbG+49dwq/UKXs2qkLYicIDlg+fkXHU5U0KkF7+hVs=;
 b=T0GlGoX1pDwnWm9cs2beArG904MrxBjwGZysbcb1OLV2mcrwkjnabv+10PfeX2OJC9
 I0ox3HKFHNObK54nFyRarj3Nt/3N0doBFxjJTY9ME/oIGR2EbShb5Z22vm5V6zhH3JWo
 jdW1OYf6r4HBjtbwFhXonD4Xapk1DvfAvfoSE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cmbG+49dwq/UKXs2qkLYicIDlg+fkXHU5U0KkF7+hVs=;
 b=tK+g8K9oVmxYv65Ec+FSSQEhyC8xwYhQguGsoTBOGy32zgJ273Xt8ZB/weSGsmkJxK
 0875jDNh+9z57Y4N8WbPL02vh1V4g2hK/LssTOPE4MSKoyydH80xgEedyexfAGowIyp/
 TSuqKdyikpu7nFmEo4k+OYqLi6F96MLlaJmiM9bK2CMha5TAEpgg03Qh5T29Gv/2F1LK
 KVQqLBn4Kcv2peFi43d2xcQGpq369RQSIU/6zjXNIYACZY90KokwYO3HiL2RZdzJUFLg
 QIpbJeAuzUpN/6JN1nGQ/GMt3zk9ZiUBLQuZvooMB50GRnthTvC2MTkDPBZFGftyVV27
 tRsg==
X-Gm-Message-State: APjAAAXrsXxZnoRzYBJxRB4JB79FsyBSnIiRAoZpg7l5ERnVY6o6kx44
 ER8E3iGQ2E9Y6rbnv3+Jb/3ODGyr/GvkI8dGIm3UZA==
X-Google-Smtp-Source: APXvYqyjVrWhS17dh73Cj6QlWpQMlNY6kRGXdK0JFvHvP1jDKiEfgRhx0ijFQQuOq9m2Tt/g63LrNE3qc7NsRndH9FI=
X-Received: by 2002:a05:6808:319:: with SMTP id
 i25mr5655242oie.128.1582364925216; 
 Sat, 22 Feb 2020 01:48:45 -0800 (PST)
MIME-Version: 1.0
References: <20200221210319.2245170-1-daniel.vetter@ffwll.ch>
 <20200221210319.2245170-3-daniel.vetter@ffwll.ch>
 <158232098048.7320.8539611385294752480@skylake-alporthouse-com>
In-Reply-To: <158232098048.7320.8539611385294752480@skylake-alporthouse-com>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Sat, 22 Feb 2020 10:48:33 +0100
Message-ID: <CAKMK7uHoQM=mK1tMkw3-+v_O6qbmAjrObQXjzYn2154zwQi5qA@mail.gmail.com>
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

On Fri, Feb 21, 2020 at 10:36 PM Chris Wilson <chris@chris-wilson.co.uk> wrote:
> Quoting Daniel Vetter (2020-02-21 21:02:30)
> > For two reasons:
> >
> > - The driver core clears this already for us after we're unloaded in
> >   __device_release_driver().
>
> Even if we abort before loading?
>
> History notes that i915_pci_remove was called with a stale pointer on
> error.

So even if there's a bug we still have the problem that clearing the
pci_drvdata in our drm_driver->release hook is way too late. You could
already have bound a new driver to the underlying device. So if driver
core doesn't clear drvdata on bind failure and we need to clear this
ourselves, then this line here could actually clear the drvdata of the
next driver instance bound to the pci device. Not that that's ever
going to happen outside of very contrived testing.

But looking at really_probe() in base/dd.c we do clear drvdata on
failure. So no idea how/why that stale drvdata came to be. Anyway
that's kinda why I cc'ed Greg, so he could confirm that this is
correct.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
