Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DE673D916C
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jul 2021 16:57:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D1F56E075;
	Wed, 28 Jul 2021 14:57:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x131.google.com (mail-il1-x131.google.com
 [IPv6:2607:f8b0:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADD506E075;
 Wed, 28 Jul 2021 14:57:04 +0000 (UTC)
Received: by mail-il1-x131.google.com with SMTP id r1so2848496iln.6;
 Wed, 28 Jul 2021 07:57:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=e2ywKCAyW5iOo3TdeL4LGysC3w1acIn4LADsFzbMsMA=;
 b=LmKgLak9fidSbx+hsVMK04ZqjeFal/L/sWVRHPUbfKyYpAF/FL5spbTmGeZD7MgHAl
 5eKMIgEflypQwCqPRdpVG+ohHTvVL0gBPbAuOm+9PrzqU+/ObXpT9ut0SBxUdL8zmnHI
 OPsmcDAzTcTcJWQIB749Hk8BpJbIVEZ07oaLxPd7XcdWRrnfTvHjB0BJrna7ADRoLGjZ
 n+P/gZUano47GrIg207NeiAQuBa6oQ24nHw/HJsegM188NC5ZcZvJv9JqoG//qye24Z3
 WrrGadOWX2X3AHUZIgCS/4wEBiOmnnDhciABNrJS19nIl7rlcCXgi4f3NxtLO6aAt1Kd
 kWcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=e2ywKCAyW5iOo3TdeL4LGysC3w1acIn4LADsFzbMsMA=;
 b=tlJQYjcDTBbWknGuS6KsIk0sCnDxEops1vGDxGWXv7PN8NQDVHCPd7290ja7Dv3kk+
 ttszRQTP+P9CRgGeTw08exhchq55pmAc8H71UadUPxiROXcaKeHiF6uV2agetwxQw/r4
 O56koAPKf7TKRY5ki3AbpKVeNODljGew31K3WhpGA30FzRXyuCM/Ff9zyFHeKnGjxz7b
 SbJ9oLoJIat/SKLRlfwMMC6NmVfhlmR0PMYTKdQjZo3IRk8XSBbiikckTEe6TyyuzC04
 CbPXk9dBfaTZmiZdydC1C/ZviclttJByiuemYjwA0eRjUimhbRHVPARgQuvtPW3g1GR7
 PxDw==
X-Gm-Message-State: AOAM530+NVIn2TLeBUAqxzIRg2g3c9YLNSDHiYHWerPzZv6xT6p/vwF2
 z7otHkbe19IcMjMCcpuBPy8=
X-Google-Smtp-Source: ABdhPJywbWBVLY6qHpI7Oc9lffXNu0yIXkEG1M1rAmTYABJuf5ipVoG372N5iVxALJi3BqYFfoigxA==
X-Received: by 2002:a05:6e02:ecd:: with SMTP id
 i13mr199143ilk.182.1627484223888; 
 Wed, 28 Jul 2021 07:57:03 -0700 (PDT)
Received: from localhost ([12.28.44.171])
 by smtp.gmail.com with ESMTPSA id x4sm78028ilj.52.2021.07.28.07.57.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Jul 2021 07:57:03 -0700 (PDT)
Date: Wed, 28 Jul 2021 07:57:02 -0700
From: Yury Norov <yury.norov@gmail.com>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>,
 Lucas Stach <l.stach@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Marc Zyngier <maz@kernel.org>, David Woodhouse <dwmw@amazon.co.uk>,
 Andrew Morton <akpm@linux-foundation.org>,
 Wei Yang <richard.weiyang@linux.alibaba.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Alexey Klimov <aklimov@redhat.com>, x86@kernel.org,
 linux-kernel@vger.kernel.org, etnaviv@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH 0/3] for_each_*_bit: move to find.h and reconsider
Message-ID: <YQFwPtKOtlN6Cigg@yury-ThinkPad>
References: <20210618195735.55933-1-yury.norov@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210618195735.55933-1-yury.norov@gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ping?

On Fri, Jun 18, 2021 at 12:57:32PM -0700, Yury Norov wrote:
> for_each_bit() macro family uses find_bit() functions, so it's better
> to have for_each_bit() and find_bit() functions in the same header. 
> 
> This series puts for_each_bit() to a proper place and optimizes its
> usage over the kernel.
> 
> The series is based on this:
> https://lore.kernel.org/linux-arch/20210612123639.329047-1-yury.norov@gmail.com/
> 
> The full series can be found here:
> https://github.com/norov/linux/commits/bm-final
> 
> Yury Norov (3):
>   include/linux: move for_each_bit() macros from bitops.h to find.h
>   find: micro-optimize for_each_{set,clear}_bit()
>   Replace for_each_*_bit_from() with for_each_*_bit() where appropriate
> 
>  arch/x86/kernel/apic/vector.c         |  4 ++--
>  drivers/gpu/drm/etnaviv/etnaviv_gpu.c |  4 ++--
>  drivers/hwmon/ltc2992.c               |  3 +--
>  include/linux/bitops.h                | 34 ---------------------------
>  include/linux/find.h                  | 34 +++++++++++++++++++++++++++
>  5 files changed, 39 insertions(+), 40 deletions(-)
> 
> -- 
> 2.30.2
