Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70C243CCF61
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jul 2021 10:29:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90ECE89D02;
	Mon, 19 Jul 2021 08:29:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com
 [IPv6:2607:f8b0:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4CEE89D02
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jul 2021 08:29:45 +0000 (UTC)
Received: by mail-oi1-x235.google.com with SMTP id c197so19846764oib.11
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jul 2021 01:29:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=I/U/F/FoGCwikPSNTinZDpXksxDgDl9adfNXfGBR7OU=;
 b=YVyQBerlcnS/dwMrvzX8Gq5MysLT3Xw3iYV7nQS4rqqlzb2FOXeTnYSBDIw3SMTI7T
 jjTWaOkXo+ELz+3bSKjJu0SgAtoc+UYOrowpJfgegK5m8NW7CRF5fw3fZ0Ab7FRSNX7r
 plg1mf/f0ji9u38M9LbWK3UhxiTW8mtPSXORs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=I/U/F/FoGCwikPSNTinZDpXksxDgDl9adfNXfGBR7OU=;
 b=Byk+KGEfmHwx1oSRKv31yZZsU6kzx3L3ASKFlwUg7wjleGVNfLnL7k7vHn8YaYCed1
 H3Ij2qOmUUZEGQTBSfEw4nrdpNO6UokC8rwhxlDc0YDJkIAYhdj5Oxfm3fAxvP6RI76S
 5odPAsZQR+Rr8mbKtav3w0/KG9hwIFBQH2CmS3gVKfHLBZhuyipLXqY+SQAIMRUCo8fF
 /iomA+nrFnRuxRxIlkFHOsKFy1UFCM/hSEaUVguQUvo8ML2BXE3F/S2LzxV5kU4EHNNz
 Qe6HMKNiGPQimJar+PLLDSFKgvOr0jA/IOGZ2RTpjSMg2b06Rk6wst207LcnawwLUGgy
 fHpw==
X-Gm-Message-State: AOAM531HmMoSOA0UbUelwMVbERZ7IT3wCV24vSA4+pQVmBnytRQSlDGh
 f6M3ABHUFjJXSQN0axVASFsH+mmtNP/J9My/bEMR4g==
X-Google-Smtp-Source: ABdhPJyDF2Zvihqlfib/G24hn8FKftpUajDO9Q2bpEudI0iDTQNgjSSYYhxBFgUqbK5fizWFUC1/K+G2TLSLMNE60oU=
X-Received: by 2002:aca:3085:: with SMTP id
 w127mr20468682oiw.101.1626683385258; 
 Mon, 19 Jul 2021 01:29:45 -0700 (PDT)
MIME-Version: 1.0
References: <20210716224758.2162003-1-jason@jlekstrand.net>
In-Reply-To: <20210716224758.2162003-1-jason@jlekstrand.net>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Mon, 19 Jul 2021 10:29:34 +0200
Message-ID: <CAKMK7uEfh4zoxWQCvuGEmQH=_-rfO9mFa-yA3PLiJWbbnT_+rg@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/i915: Call i915_globals_exit() after
 i915_pmu_exit()
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
>
> We should tear down in the opposite order we set up.
>
> Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
> Fixes: 537f9c84a427 ("drm/i915/pmu: Fix CPU hotplug with multiple GPUs")
> Cc: Daniel Vetter <daniel@ffwll.ch>

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> ---
>  drivers/gpu/drm/i915/i915_pci.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/i915/i915_pci.c b/drivers/gpu/drm/i915/i915_pci.c
> index 67696d7522718..50ed93b03e582 100644
> --- a/drivers/gpu/drm/i915/i915_pci.c
> +++ b/drivers/gpu/drm/i915/i915_pci.c
> @@ -1244,8 +1244,8 @@ static void __exit i915_exit(void)
>
>         i915_perf_sysctl_unregister();
>         pci_unregister_driver(&i915_pci_driver);
> -       i915_globals_exit();
>         i915_pmu_exit();
> +       i915_globals_exit();
>  }
>
>  module_init(i915_init);
> --
> 2.31.1
>


-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
