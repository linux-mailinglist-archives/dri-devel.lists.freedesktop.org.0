Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B80F1B1F02
	for <lists+dri-devel@lfdr.de>; Tue, 21 Apr 2020 08:48:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8442C6E892;
	Tue, 21 Apr 2020 06:48:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
 [209.85.215.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D5C589D9B;
 Mon, 20 Apr 2020 15:42:20 +0000 (UTC)
Received: by mail-pg1-f195.google.com with SMTP id o15so4671189pgi.1;
 Mon, 20 Apr 2020 08:42:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=urvVKwhYFVo9YmQiRyB75pp00JNNKb1DATs7THuAxM0=;
 b=dmaktFAjAVHGKFEaXRD3dTgDGIzfJWbXPgTFW3qq+ToMQG3qAsaBNiTvf4k/U0FTAP
 8csRiuyEpIza0cLOaV3PUGn0EuPrQhtJ//zL5OuTRnZmiTCS0al3e8n86U3680Bj/c4f
 WaWZNMUrZsYziIpwqnLFRtV28n4LMuZ3EKeS7/GGu45mH8DwsBvSu5Pxi02MwKRss9cL
 aEkcm4l53s2VQYf2LtRjRKU34vdeNtwtaweXtxkpPHiN7p29xtKZW2EyWOhe9qhVHRe/
 qtdg1l68NCPGwbgAe2q6NKOqwtXweyUea22FCwKtkmx9Kxnr6s/K1Rdu7LuP8KvxpcYR
 24iQ==
X-Gm-Message-State: AGi0PuZvPI8IdAKTg0dHfZkLQ4yBP3CeIDX0tUCzAfGVxjY1yZlN7XDn
 8ahlobSP0y/pyiYbiqmKmxo=
X-Google-Smtp-Source: APiQypJd+fuBqEfot8z8i+/En/kswujqoCNHKitTBMgG/Ivm4ah5wWFtimdwR+Mbm6rnh82tN5hnTA==
X-Received: by 2002:a63:1d4a:: with SMTP id d10mr17258952pgm.188.1587397339635; 
 Mon, 20 Apr 2020 08:42:19 -0700 (PDT)
Received: from sultan-box.localdomain ([104.200.129.62])
 by smtp.gmail.com with ESMTPSA id h5sm10591pjv.4.2020.04.20.08.42.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Apr 2020 08:42:18 -0700 (PDT)
Date: Mon, 20 Apr 2020 08:42:16 -0700
From: Sultan Alsawaf <sultan@kerneltoast.com>
To: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Subject: Re: [PATCH v2] drm/i915: Fix ref->mutex deadlock in i915_active_wait()
Message-ID: <20200420154216.GA1963@sultan-box.localdomain>
References: <20200407065210.GA263852@kroah.com>
 <20200407071809.3148-1-sultan@kerneltoast.com>
 <20200410090838.GD1691838@kroah.com>
 <20200410141738.GB2025@sultan-box.localdomain>
 <20200411113957.GB2606747@kroah.com>
 <158685210730.16269.15932754047962572236@build.alporthouse.com>
 <20200414082344.GA10645@kroah.com>
 <158737335977.8380.15005528012712372014@jlahtine-desk.ger.corp.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <158737335977.8380.15005528012712372014@jlahtine-desk.ger.corp.intel.com>
X-Mailman-Approved-At: Tue, 21 Apr 2020 06:48:39 +0000
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
Cc: dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 Greg KH <gregkh@linuxfoundation.org>, intel-gfx@lists.freedesktop.org,
 Chris Wilson <chris@chris-wilson.co.uk>, stable@vger.kernel.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Apr 20, 2020 at 12:02:39PM +0300, Joonas Lahtinen wrote:
> I think the the patch should be dropped for now before the issue is
> properly addressed. Either by backporting the mainline fixes or if
> those are too big and there indeed is a smaller alternative patch
> that is properly reviewed. But the above patch is not, at least yet.

Why should a fix for a bona-fide issue be dropped due to political reasons? This
doesn't make sense to me. This just hurts miserable i915 users even more. If my
patch is going to be dropped, it should be replaced by a different fix at the
same time.

Also, the mainline fixes just *happen* to fix this deadlock by removing the
mutex lock from the path in question and creating multiple other bugs in the
process that had to be addressed with "Fixes:" commits. The regression potential
was too high to include those patches for a "stable" kernel, so I made this
patch which fixes the issue in the simplest way possible. We put this patch into
Ubuntu now as well, because praying for a response from i915 maintainers while
the 20.04 release was on the horizon was not an option.

> There is an another similar thread where there's jumping into
> conclusions and doing ad-hoc patches for already fixed issues:
> 
> https://lore.kernel.org/dri-devel/20200414144309.GB2082@sultan-box.localdomain/

Maybe this wouldn't have happened if I had received a proper response for that
issue on gitlab from the get-go... Instead I got the run-around from Chris
claiming that it wasn't an i915 bug:

https://gitlab.freedesktop.org/drm/intel/issues/1599

> I appreciate enthusiasm to provide fixes to i915 but we should
> continue do the regular due diligence to make sure we're properly
> fixing bugs in upstream kernels. And when fixing them, to make
> sure we're not simply papering over them for a single use case.
> 
> It would be preferred to file a bug for the seen issues,
> describing how to reproduce them with vanilla upstream kernels:
> 
> https://gitlab.freedesktop.org/drm/intel/-/wikis/How-to-file-i915-bugs

gitlab.freedesktop.org/drm/intel is where bugs go to be neglected, as noted
above. I really see no reason to send anything there anymore, when the vast
majority of community-sourced bug reports go ignored. 

Sultan
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
