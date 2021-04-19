Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 314C536474D
	for <lists+dri-devel@lfdr.de>; Mon, 19 Apr 2021 17:43:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E622289FDB;
	Mon, 19 Apr 2021 15:43:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf2a.google.com (mail-qv1-xf2a.google.com
 [IPv6:2607:f8b0:4864:20::f2a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFBD789FDB
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Apr 2021 15:43:47 +0000 (UTC)
Received: by mail-qv1-xf2a.google.com with SMTP id gv2so7784659qvb.8
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Apr 2021 08:43:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gY9I1iBHQGPcCB4nWpZeR+9X7MDWUZ4aIohnT6sq9KM=;
 b=LuajrzoVUJVAdvAKuLMaSA2GyXoFL6hgUFQss59m00qFmneaM+UjMEkqsxkRo2MFc/
 LJHJTU7m/f5NjVz7LeikwX04VYOp6CMtdSlm9CeT+OBa82q74NCljvEvaN/ReEmqLYCN
 PYD7iJ0LBf/3EMFqx8I8V7xuxo+Q33WDVQ7pI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gY9I1iBHQGPcCB4nWpZeR+9X7MDWUZ4aIohnT6sq9KM=;
 b=JJRUUHbre4BzYrpFCxW+fCF9IIRwcJeF4KXWa6Mdn6uasd3Y/DqRK2olocuwyveUqe
 TyFgBFGnOXJH20QAQn7mr60DbiR+EYY90ctXYMuBVMpFzKwGLiaxhi9f7bEvG9TQDOK/
 hDy0yimnazhAjZajdcuQcJuqfblBMZd+AwYv7G+cniMeVbuWLSuOrvekwdVQ6VDYmZTQ
 vlasKN/ZuiPFBxx8xZ5gfmNOwfEUyMnoq+hzH/yZRMP8xlzAuUIKODdWy+r3Z4bJz2oA
 /aWR7uvA+oPU7ihOx9Dr/ax8voJB6AizCyH/HZWZRLTZmUgu9QM1yfP7ZZ3iEe4dNZZw
 AB7A==
X-Gm-Message-State: AOAM533T2VifC2tI/QW0rwq9OAvxOLSQEFRYoQdJ9thX/rTwFGcRa9v7
 qFvUSCS4zx9wKbMAhzmRCJaPkNuGVlC3Aw==
X-Google-Smtp-Source: ABdhPJxLbh0PUYYsiy5cApP4KUbnigxW0HJ6foXz+ZYb6cZkoZL0XqHvGBeb9vdCk5tLDWvjF4dUxQ==
X-Received: by 2002:a0c:f18c:: with SMTP id m12mr22146802qvl.19.1618847026425; 
 Mon, 19 Apr 2021 08:43:46 -0700 (PDT)
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com.
 [209.85.219.174])
 by smtp.gmail.com with ESMTPSA id s22sm1008727qkg.58.2021.04.19.08.43.45
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Apr 2021 08:43:45 -0700 (PDT)
Received: by mail-yb1-f174.google.com with SMTP id v3so36920154ybi.1
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Apr 2021 08:43:45 -0700 (PDT)
X-Received: by 2002:a25:244d:: with SMTP id k74mr17981842ybk.79.1618847024707; 
 Mon, 19 Apr 2021 08:43:44 -0700 (PDT)
MIME-Version: 1.0
References: <20210416153909.v4.15.I3e68fa38c4ccbdbdf145cad2b01e83a1e5eac302@changeid>
 <202104171051.46GyYIaF-lkp@intel.com>
In-Reply-To: <202104171051.46GyYIaF-lkp@intel.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 19 Apr 2021 08:43:33 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WL3tWAg-jtB6qoq0nrCxaZZwYKwKCCoxytzR2YMS9iPA@mail.gmail.com>
Message-ID: <CAD=FV=WL3tWAg-jtB6qoq0nrCxaZZwYKwKCCoxytzR2YMS9iPA@mail.gmail.com>
Subject: Re: [PATCH v4 15/27] drm/bridge: ti-sn65dsi86: Break GPIO and
 MIPI-to-eDP bridge into sub-drivers
To: kernel test robot <lkp@intel.com>
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
Cc: Rob Clark <robdclark@chromium.org>,
 Jernej Skrabec <jernej.skrabec@siol.net>, kbuild-all@lists.01.org,
 clang-built-linux <clang-built-linux@googlegroups.com>,
 Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Wolfram Sang <wsa-dev@sang-engineering.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Fri, Apr 16, 2021 at 7:32 PM kernel test robot <lkp@intel.com> wrote:
>
> Hi Douglas,
>
> I love your patch! Yet something to improve:
>
> [auto build test ERROR on next-20210416]
> [cannot apply to wsa/i2c/for-next robh/for-next linus/master v5.12-rc7 v5.12-rc6 v5.12-rc5 v5.12-rc7]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch]
>
> url:    https://github.com/0day-ci/linux/commits/Douglas-Anderson/drm-Fix-EDID-reading-on-ti-sn65dsi86-solve-some-chicken-and-egg-problems/20210417-064243
> base:    18250b538735142307082e4e99e3ae5c12d44013
> config: x86_64-randconfig-a002-20210416 (attached as .config)
> compiler: clang version 13.0.0 (https://github.com/llvm/llvm-project f549176ad976caa3e19edd036df9a7e12770af7c)
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # install x86_64 cross compiling tool for clang build
>         # apt-get install binutils-x86-64-linux-gnu
>         # https://github.com/0day-ci/linux/commit/a870b6e38fac3e5453e4b74fdfe6eb05c8be7ea7
>         git remote add linux-review https://github.com/0day-ci/linux
>         git fetch --no-tags linux-review Douglas-Anderson/drm-Fix-EDID-reading-on-ti-sn65dsi86-solve-some-chicken-and-egg-problems/20210417-064243
>         git checkout a870b6e38fac3e5453e4b74fdfe6eb05c8be7ea7
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 ARCH=x86_64
>
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
>
> All errors (new ones prefixed by >>):
>
> >> drivers/gpu/drm/bridge/ti-sn65dsi86.c:1308:1: error: redefinition of '__inittest'
>    module_auxiliary_driver(ti_sn_bridge_driver);
>    ^
>    include/linux/auxiliary_bus.h:71:2: note: expanded from macro 'module_auxiliary_driver'
>            module_driver(__auxiliary_driver, auxiliary_driver_register, auxiliary_driver_unregister)
>            ^
>    include/linux/device/driver.h:262:3: note: expanded from macro 'module_driver'
>    } \
>      ^
>    include/linux/module.h:130:42: note: expanded from macro '\
>    module_init'
>            static inline initcall_t __maybe_unused __inittest(void)                \
>                                                    ^
>    drivers/gpu/drm/bridge/ti-sn65dsi86.c:1190:1: note: previous definition is here
>    module_auxiliary_driver(ti_sn_gpio_driver);
>    ^
>    include/linux/auxiliary_bus.h:71:2: note: expanded from macro 'module_auxiliary_driver'
>            module_driver(__auxiliary_driver, auxiliary_driver_register, auxiliary_driver_unregister)
>            ^
>    include/linux/device/driver.h:262:3: note: expanded from macro 'module_driver'
>    } \
>      ^
>    include/linux/module.h:130:42: note: expanded from macro '\
>    module_init'
>            static inline initcall_t __maybe_unused __inittest(void)                \

Ah, my mistake in individually using these in the same module:

module_auxiliary_driver(ti_sn_gpio_driver);
module_auxiliary_driver(ti_sn_bridge_driver);
module_auxiliary_driver(ti_sn_aux_driver);
module_i2c_driver(ti_sn65dsi86_driver);

What I had worked fine because I wasn't building as a module. I've
fixed this to have a manual init mechanism that will look something
like this at the end of the series:

---

static int __init ti_sn65dsi86_init(void)
{
    int ret;

    ret = i2c_add_driver(&ti_sn65dsi86_driver);
    if (ret)
        return ret;

    ret = ti_sn_gpio_register();
    if (ret)
        goto err_main_was_registered;

    ret = auxiliary_driver_register(&ti_sn_aux_driver);
    if (ret)
        goto err_gpio_was_registered;

    ret = auxiliary_driver_register(&ti_sn_bridge_driver);
    if (ret)
        goto err_aux_was_registered;

    return 0;

err_aux_was_registered:
    auxiliary_driver_unregister(&ti_sn_aux_driver);
err_gpio_was_registered:
    ti_sn_gpio_unregister();
err_main_was_registered:
    i2c_del_driver(&ti_sn65dsi86_driver);

    return ret;
}
module_init(ti_sn65dsi86_init);

static void __exit ti_sn65dsi86_exit(void)
{
    auxiliary_driver_unregister(&ti_sn_bridge_driver);
    auxiliary_driver_unregister(&ti_sn_aux_driver);
    ti_sn_gpio_unregister();
    i2c_del_driver(&ti_sn65dsi86_driver);
}
module_exit(ti_sn65dsi86_exit);

---

With that I can compile as a module and everything works fine with
this builtin. I'll plan to spin a v5 with that fix but I'll wait a
little bit to see if I get any feedback. If I happen to get drm-misc
commit access or can convince someone, I'll try to get the early
patches in the series landed so v5 isn't so giant.

NOTE: on my system sn65dsi86 doesn't actually work currently when
running as a module. That's a pre-existing problem and not one
introduced by my patch. Or perhaps, more appropriately, a pre-existing
pile of problems that I'm not going to try to tackle. A quick summary:

* Part of the problem of making this a module is that I run into the
looping I spent a little bit of time looking at in the past [1]. I
believe the main MSM graphics driver can't handle itself being builtin
but some of the things it needs being in modules.

* Part of the problem is fw_devlink. I don't think it understands the
circularness of the panel and HPD lines and it seems to get upset
unless in permissive mode.

* If I try permissive mode and move the whole MSM graphics to a
module, I get an error about 'disp_cc_mdss_mdp_clk_src: RCG did not
turn on'. Again, this is without my patch series.

Those are not small problems and not new, so I'll settle for making
sure I continue to compile as a module.


[1] https://lore.kernel.org/lkml/20200710230224.2265647-1-dianders@chromium.org/
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
