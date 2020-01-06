Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F9E3131BB7
	for <lists+dri-devel@lfdr.de>; Mon,  6 Jan 2020 23:43:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8C466E4FE;
	Mon,  6 Jan 2020 22:43:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-xa41.google.com (mail-vk1-xa41.google.com
 [IPv6:2607:f8b0:4864:20::a41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E64A76E4FE
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Jan 2020 22:43:44 +0000 (UTC)
Received: by mail-vk1-xa41.google.com with SMTP id u6so12922397vkn.13
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Jan 2020 14:43:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TR0dAeXGfCCFkxJD34tOpB63AtNq67/wZLn1sgE74zk=;
 b=eL75pyahAHEuX3ngDs7I3eNS+ac9tWxkPj73XAmr0aLMHAm7DokL7cftGGGdU+mJr8
 W4UPw/aWX6QLjlvEQmMCf4/yezgaqrxEw97e/m2sTE7nYv76t6Lbwa/BdJnbc3XZyjdl
 iXXshyIY5TSz/6e+cN+SojeHi8SiSJfq8oZMk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TR0dAeXGfCCFkxJD34tOpB63AtNq67/wZLn1sgE74zk=;
 b=SBm2q5iuyl5zF4ltgGUd5/4GsZn3faTHjqxxC99ORdYT7el6J66chA88BiCbIyARgz
 JjNzPPP8ZO0Uois8u6UY9v/2/ixq1mGQAeA+IvYFwT4eYi8kkHhq1G6EAe6zqHs97ZTz
 w7u3OPgR5UvH+DPo/E1GTG2rOM3wmcrZKP5Dmu3fM1lvKCCjudaBpHbio7BfwDp1PaSp
 hFqua8C2neK1cjZqgREjbMvnO5nPo3662zyBz2oCY+I63lfApETBMfbvO1vW7O29wMMe
 D9Q7LobTWFEpGMXQzkAjAzldJL4V/UFMgM1jr2dANPVw19yR7iGl7hrT266TCG3V7r5+
 a95Q==
X-Gm-Message-State: APjAAAUG1xKgn71fbkWZ0D5jzO8znyind9pMO6cLlT6R+9IwFsL9jRtA
 A48iuGCVm8MR3SQVnSNvtrz+ZGR1aHs=
X-Google-Smtp-Source: APXvYqwSbYoxjt+AkFQ1W+DwGEjNO9y/hJtpxjmr0HWPwXvjM468y+yKXWun6kOBiXpVYD/wrzF/BQ==
X-Received: by 2002:a1f:1b07:: with SMTP id b7mr60923912vkb.79.1578350622019; 
 Mon, 06 Jan 2020 14:43:42 -0800 (PST)
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com.
 [209.85.217.45])
 by smtp.gmail.com with ESMTPSA id w28sm19465008vkm.36.2020.01.06.14.43.40
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Jan 2020 14:43:41 -0800 (PST)
Received: by mail-vs1-f45.google.com with SMTP id u14so32698574vsu.3
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Jan 2020 14:43:40 -0800 (PST)
X-Received: by 2002:a67:8704:: with SMTP id j4mr55185151vsd.106.1578350620195; 
 Mon, 06 Jan 2020 14:43:40 -0800 (PST)
MIME-Version: 1.0
References: <20191217164702.v2.9.Ib59207b66db377380d13748752d6fce5596462c5@changeid>
 <201912212109.ehZOyrlG%lkp@intel.com>
In-Reply-To: <201912212109.ehZOyrlG%lkp@intel.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 6 Jan 2020 14:43:28 -0800
X-Gmail-Original-Message-ID: <CAD=FV=Ui=ZbzdyV6SjLvrL-zj6e+upog_wZMG4seOsdgZpF6tg@mail.gmail.com>
Message-ID: <CAD=FV=Ui=ZbzdyV6SjLvrL-zj6e+upog_wZMG4seOsdgZpF6tg@mail.gmail.com>
Subject: Re: [PATCH v2 9/9] drm/bridge: ti-sn65dsi86: Avoid invalid rates
To: kbuild test robot <lkp@intel.com>
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
 Jeffrey Hugo <jeffrey.l.hugo@gmail.com>, David Airlie <airlied@linux.ie>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Neil Armstrong <narmstrong@baylibre.com>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Jonas Karlman <jonas@kwiboo.se>,
 Sean Paul <seanpaul@chromium.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Dear Robot,

On Sat, Dec 21, 2019 at 5:57 AM kbuild test robot <lkp@intel.com> wrote:
>
> Hi Douglas,
>
> I love your patch! Perhaps something to improve:
>
> [auto build test WARNING on linus/master]
> [also build test WARNING on v5.5-rc2 next-20191220]
> [if your patch is applied to the wrong git tree, please drop us a note to help
> improve the system. BTW, we also suggest to use '--base' option to specify the
> base tree in git format-patch, please see https://stackoverflow.com/a/37406982]
>
> url:    https://github.com/0day-ci/linux/commits/Douglas-Anderson/drm-bridge-ti-sn65dsi86-Improve-support-for-AUO-B116XAK01-other-DP/20191221-083448
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 7e0165b2f1a912a06e381e91f0f4e495f4ac3736
> config: sh-allmodconfig (attached as .config)
> compiler: sh4-linux-gcc (GCC) 7.5.0
> reproduce:
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # save the attached .config to linux build tree
>         GCC_VERSION=7.5.0 make.cross ARCH=sh
>
> If you fix the issue, kindly add following tag
> Reported-by: kbuild test robot <lkp@intel.com>
>
> Note: it may well be a FALSE warning. FWIW you are at least aware of it now.
> http://gcc.gnu.org/wiki/Better_Uninitialized_Warnings
>
> All warnings (new ones prefixed by >>):
>
>    drivers/gpu/drm/bridge/ti-sn65dsi86.c: In function 'ti_sn_bridge_enable':
> >> drivers/gpu/drm/bridge/ti-sn65dsi86.c:543:18: warning: 'rate_valid' may be used uninitialized in this function [-Wmaybe-uninitialized]
>        if (rate_valid[i])
>            ~~~~~~~~~~^~~

I love your report!  Interestingly I had already noticed this problem
myself and v3 of the patch fixes the issue.  See:

https://lore.kernel.org/r/20191218143416.v3.9.Ib59207b66db377380d13748752d6fce5596462c5@changeid


If the maintainer of the robot is reading this, something to improve
about your robot is that it could have noticed v3 of the patch (which
was posted several days before your report) and skipped analyzing v2
of the patch.  I'm currently using Change-Ids embedded in my
Message-Id to help automation relate one version of my patches to the
next.  Specifically you compare the Message-Id of v2 and v3 of this
patch:

20191217164702.v2.9.Ib59207b66db377380d13748752d6fce5596462c5@changeid
20191218143416.v3.9.Ib59207b66db377380d13748752d6fce5596462c5@changeid

Since the last section before the "@changeid" remained constant it
could be assumed that this patch replaced the v2.  I know there's not
too much usage of this technique yet, but if only more tools supported
it then maybe more people would use it.


-Doug
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
