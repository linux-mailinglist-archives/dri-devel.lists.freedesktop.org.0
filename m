Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C51EC3CCF5E
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jul 2021 10:28:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FCD66E0BE;
	Mon, 19 Jul 2021 08:28:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com
 [IPv6:2607:f8b0:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C62076E0C4
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jul 2021 08:28:33 +0000 (UTC)
Received: by mail-oi1-x231.google.com with SMTP id y66so10466721oie.7
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jul 2021 01:28:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=eYn0e2PugZ5VUVkmOa8+qCs22i/NtWWGivJiUNDyhH0=;
 b=h9wrs+2Zcc7iVF7hLXDQwc9GO0qM6AOzSkLw8RHqar7LSLk/unQa3xCuTUNShCYa5A
 Amvm+Iv38Md2jVORdLSM/mf+CU1HlQEtR7aQRSJfgIDl0Z5FuS1BKBCI/xs4ru9ajY+N
 h7YbLWe26oCK4KzX73dANLPBbT26zqKMaOBVs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eYn0e2PugZ5VUVkmOa8+qCs22i/NtWWGivJiUNDyhH0=;
 b=CpkEef4+3D6srI41TrNYfzFfdP8y9KKNcfqBcG/G9tJRGzj3p/e4MQGG3Mgz/vGyVv
 OtODjGhxASlTMXBi2+DrASQvonbxzPrKFWfudrxdYssoOdIRyRZqA5To+ow+Dw4jZEot
 uCz9oPYDseYkV0RIzu9ms5iIBTxxhdXJl8LXY5Oi5zm6tTCto/XCpMW6aKj8QMyB8Aae
 AIKfzfv+n90pe4vusP0WxfacTWyK9oz2TcAG5a9AN7HcRxBzrSRaMnztYSvtCBMRf16B
 9I8G4Ht2HZcL0QkFJrWYlN5/dbf8d4MbzWcok01OVNpgeAYZZcnxuADz25XDbvzOeJpy
 vqmA==
X-Gm-Message-State: AOAM531TU2NQcKmaHAdS7NBuhMPCAB+IqXgp8evNZNezBQlu6GvmcYQu
 PO+hUoaE8vcKI3iH7OM7VWpIJIM4d2HoDralmXdT0Q==
X-Google-Smtp-Source: ABdhPJwL3FYDTbv1882NYhzUzOCOHkleqGjtyhe2gK5twYlnBN/0+x0IE/dFQfW0FuZY2ubRGOzJkwMRvqH2ZMhfolc=
X-Received: by 2002:aca:3085:: with SMTP id
 w127mr20466826oiw.101.1626683313040; 
 Mon, 19 Jul 2021 01:28:33 -0700 (PDT)
MIME-Version: 1.0
References: <20210716224758.2162003-1-jason@jlekstrand.net>
 <20210716224758.2162003-2-jason@jlekstrand.net>
In-Reply-To: <20210716224758.2162003-2-jason@jlekstrand.net>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Mon, 19 Jul 2021 10:28:22 +0200
Message-ID: <CAKMK7uEgP6NT9PqvXH_bBvzrGRKpub9PH9DfgZ0vpHBtyDkNzg@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/i915: Tear down properly on early i915_init exit
To: Jason Ekstrand <jason@jlekstrand.net>
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
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Jul 17, 2021 at 12:48 AM Jason Ekstrand <jason@jlekstrand.net> wrote:
> In i915_exit(), we check i915_pci_driver.driver.owner to detect if
> i915_init exited early and don't tear anything down.  However, we didn't
> have proper tear-down paths for early exits in i915_init().
>
> Most of the time, you would never notice this as driver init failures
> are extremely rare and generally the sign of a bigger bug.  However,
> when the mock self-tests are run, they run as part of i915_init() and
> exit early once they complete.  They run after i915_globals_init() and
> before we set up anything else.  The IGT test then unloads the module,
> invoking i915_exit() which, thanks to our i915_pci_driver.driver.owner
> check, doesn't actually tear anything down.  Importantly, this means
> i915_globals_exit() never gets called even though i915_globals_init()
> was and we leak the globals.
>
> The most annoying part is that you don't actually notice the failure as
> part of the self-tests since leaking a bit of memory, while bad, doesn't
> result in anything observable from userspace.  Instead, the next time we
> load the driver (usually for next IGT test), i915_globals_init() gets
> invoked again, we go to allocate a bunch of new memory slabs, those
> implicitly create debugfs entries, and debugfs warns that we're trying
> to create directories and files that already exist.  Since this all
> happens as part of the next driver load, it shows up in the dmesg-warn
> of whatever IGT test ran after the mock selftests.

My idea was to onion-unwind in i915_exit, but that means we need to
carry state over or have checks for every step, which is a bit
annoying.

Yours unwinds even if i915_init returns 0, i.e. success, if we had
some selftests, which is most unusual and I think deserves an
explainer here in the commit message and maybe somewhere in the code.

> Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
> Fixes: 32eb6bcfdda9 ("drm/i915: Make request allocation caches global")
> Cc: Daniel Vetter <daniel@ffwll.ch>
> ---
>  drivers/gpu/drm/i915/i915_globals.c |  4 ++--
>  drivers/gpu/drm/i915/i915_pci.c     | 23 +++++++++++++++++------
>  2 files changed, 19 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/i915_globals.c b/drivers/gpu/drm/i915/i915_globals.c
> index 77f1911c463b8..87267e1d2ad92 100644
> --- a/drivers/gpu/drm/i915/i915_globals.c
> +++ b/drivers/gpu/drm/i915/i915_globals.c
> @@ -138,7 +138,7 @@ void i915_globals_unpark(void)
>         atomic_inc(&active);
>  }
>
> -static void __exit __i915_globals_flush(void)
> +static void __i915_globals_flush(void)
>  {
>         atomic_inc(&active); /* skip shrinking */
>
> @@ -148,7 +148,7 @@ static void __exit __i915_globals_flush(void)
>         atomic_dec(&active);
>  }
>
> -void __exit i915_globals_exit(void)
> +void i915_globals_exit(void)
>  {
>         GEM_BUG_ON(atomic_read(&active));
>
> diff --git a/drivers/gpu/drm/i915/i915_pci.c b/drivers/gpu/drm/i915/i915_pci.c
> index 50ed93b03e582..783f547be0990 100644
> --- a/drivers/gpu/drm/i915/i915_pci.c
> +++ b/drivers/gpu/drm/i915/i915_pci.c
> @@ -1199,13 +1199,20 @@ static int __init i915_init(void)
>         bool use_kms = true;
>         int err;
>
> +       /* We use this to detect early returns from i915_init() so we don't
> +        * tear anything down in i915_exit()
> +        */
> +       i915_pci_driver.driver.owner = NULL;

Setting this seems redundant? Or if you want to make it explicit, just
have a dedicated bool with a big comment explaining that only when we
load the full pci driver do we tear down stuff in i915_exit. You could
then set after pci_register_driver was successful. Some screaming name
like driver_fully_loaded or something like that ...

> +
>         err = i915_globals_init();
>         if (err)
>                 return err;
>
>         err = i915_mock_selftests();
> -       if (err)
> -               return err > 0 ? 0 : err;
> +       if (err) {
> +               err = err > 0 ? 0 : err;
> +               goto globals_exit;
> +       }
>
>         /*
>          * Enable KMS by default, unless explicitly overriden by

Imo move this up, but if you want I can send out my diff so you score
an r-b: tag :-)

> @@ -1228,13 +1235,17 @@ static int __init i915_init(void)
>         i915_pmu_init();
>
>         err = pci_register_driver(&i915_pci_driver);
> -       if (err) {
> -               i915_pmu_exit();
> -               return err;
> -       }
> +       if (err)
> +               goto pmu_exit;
>
>         i915_perf_sysctl_register();
>         return 0;
> +

We unwind even on success, which is most unusual. I think that
deserves a comment.

> +pmu_exit:
> +       i915_pmu_exit();
> +globals_exit:
> +       i915_globals_exit();
> +       return err;
>  }
>
>  static void __exit i915_exit(void)
> --
> 2.31.1
>


-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
