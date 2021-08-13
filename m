Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 88F403EBB29
	for <lists+dri-devel@lfdr.de>; Fri, 13 Aug 2021 19:15:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 530706E8AF;
	Fri, 13 Aug 2021 17:15:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FF736E8A5;
 Fri, 13 Aug 2021 17:15:22 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id n12so16397801edx.8;
 Fri, 13 Aug 2021 10:15:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zlUEA9e1VkT1gKXLNSjj1Okgcd3GspYEDUxv1J4Esdc=;
 b=fA8sxxgKhksZ1i4Qq5qRH12NiDHha3/axZgW4UCqa9o6CPE7sxYCS7rBOg2/0txpSW
 9+CrDumsBSyBBbBOgASKG9jgN4jCYaWf65uXG4ctkYYMZRsdKpewJCdKa5BsgvDVsEiQ
 lugujmU729iB3ptr+YbPg+hzVpo3j3hrNsPMQ3TcqJrNMAv5nR+Oml2UD6+SC6DE+TS7
 tR40hw02reD9jMswhju68QwoefFwFXeKZxcuYQwQjzGEd4RlAG9oeAhbRxPcaeTw9hzH
 6N9GvTCTUuzi8s5WaICar7uNOE9CsKOl2V0hhkKWwZHOGFF8Od4q+JLKItGPOpoA0HFA
 apkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zlUEA9e1VkT1gKXLNSjj1Okgcd3GspYEDUxv1J4Esdc=;
 b=nooOMFt+e7cIJ7bgiuX949u+iCK/qNpswNNA5357s9njE+8CNOaqhjp3cbAJTfpDS4
 kbBtR47h3aaLGRnGxDepEbzn2WSe3rpYUl2TRqB5aqB5beTNfkLRegw/EFl41kWTSeqC
 RV54RmBqERLhy8GnngmXeBo0Wc6PUnVUryvfWXNPgnx2JCDTdoIflG+BPw/Ai6AYHJUL
 oMSO2b0ZUIW/KrmJPB5faS+MGct2sTeSQxUFddLDCwKKcExoXSR4Bp6n5ZejJj6p/zYb
 5pB2r6m/rB6mx0/Z5ofQtaER/jdv4feLmHZ1r8/wthVTdyzUQmv4IHgL55xWt0zF752d
 xPHg==
X-Gm-Message-State: AOAM530vEIKux4NYsb+VWUud556hY9lb46FU8QSMnfurT9O7tw2u79Q4
 1WJXkLQgFq5kUOnalpeNLMZ2YA21qYhm3E4bBUQ=
X-Google-Smtp-Source: ABdhPJxKqDQE7Wsav+ukfzCwEKv0lituAMXiubWkS1keXQNfA9S610Xmqy8VSXVezfOBZx/BMV9dsWiuwOIMar4rUmc=
X-Received: by 2002:a05:6402:31ad:: with SMTP id
 dj13mr4363446edb.296.1628874920810; 
 Fri, 13 Aug 2021 10:15:20 -0700 (PDT)
MIME-Version: 1.0
References: <20210813151734.1236324-1-jim.cromie@gmail.com>
 <20210813151734.1236324-3-jim.cromie@gmail.com>
 <YRaTMFzUFCeC6ELA@smile.fi.intel.com>
In-Reply-To: <YRaTMFzUFCeC6ELA@smile.fi.intel.com>
From: jim.cromie@gmail.com
Date: Fri, 13 Aug 2021 11:14:54 -0600
Message-ID: <CAJfuBxyaAG567-PFJo4DX12yUAOPQG4uJfhccgL0=xU9O4rzjA@mail.gmail.com>
Subject: Re: [PATCH v5 2/9] moduleparam: add data member to struct kernel_param
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, Sean Paul <seanpaul@chromium.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, Harry Wentland <harry.wentland@amd.com>,
 Leo Li <sunpeng.li@amd.com>, 
 Zhenyu Wang <zhenyuw@linux.intel.com>, Zhi Wang <zhi.a.wang@intel.com>, 
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Jason Baron <jbaron@akamai.com>, Hawking Zhang <Hawking.Zhang@amd.com>,
 Tao Zhou <tao.zhou1@amd.com>, 
 Huang Rui <ray.huang@amd.com>, Likun Gao <Likun.Gao@amd.com>,
 Chengming Gui <Jack.Gui@amd.com>, 
 Aaron Liu <aaron.liu@amd.com>, John Clements <john.clements@amd.com>, 
 Kevin Wang <kevin1.wang@amd.com>, Ashley Thomas <Ashley.Thomas2@amd.com>, 
 Qingqing Zhuo <qingqing.zhuo@amd.com>, Wyatt Wood <Wyatt.Wood@amd.com>, 
 Aurabindo Pillai <aurabindo.pillai@amd.com>, Johan Hovold <johan@kernel.org>, 
 Jessica Yu <jeyu@kernel.org>, Nick Desaulniers <ndesaulniers@gooogle.com>, 
 Joe Perches <joe@perches.com>, Miguel Ojeda <ojeda@kernel.org>, 
 Andrew Morton <akpm@linux-foundation.org>,
 Masahiro Yamada <masahiroy@kernel.org>, 
 Peter Zijlstra <peterz@infradead.org>, "Paul E. McKenney" <paulmck@kernel.org>,
 Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
 Thomas Gleixner <tglx@linutronix.de>, 
 Vitor Massaru Iha <vitor@massaru.org>, Sedat Dilek <sedat.dilek@gmail.com>, 
 Zhen Lei <thunder.leizhen@huawei.com>, Marco Elver <elver@google.com>, 
 Jarkko Sakkinen <jarkko@kernel.org>, Alexander Potapenko <glider@google.com>, 
 Palmer Dabbelt <palmerdabbelt@google.com>,
 Patricia Alfonso <trishalfonso@google.com>, Jiri Olsa <jolsa@kernel.org>,
 James Bottomley <James.Bottomley@hansenpartnership.com>, 
 Arvind Sankar <nivedita@alum.mit.edu>, Johannes Berg <johannes.berg@intel.com>,
 Arnd Bergmann <arnd@arndb.de>, LKML <linux-kernel@vger.kernel.org>, 
 dri-devel <dri-devel@lists.freedesktop.org>, 
 amd-gfx mailing list <amd-gfx@lists.freedesktop.org>,
 intel-gvt-dev@lists.freedesktop.org, 
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Aug 13, 2021 at 9:44 AM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Fri, Aug 13, 2021 at 09:17:10AM -0600, Jim Cromie wrote:
> > Add a const void* data member to the struct, to allow attaching
> > private data that will be used soon by a setter method (via kp->data)
> > to perform more elaborate actions.
> >
> > To attach the data at compile time, add new macros:
> >
> > module_param_cbd() derives from module_param_cb(), adding data param,
> > and latter is redefined to use former.
> >
> > It calls __module_param_call_wdata(), which accepts a new data param
> > and inits .data with it. Re-define __module_param_call() to use it.
> >
> > Use of this new data member will be rare, it might be worth redoing
> > this as a separate/sub-type to de-bloat the base case.
>
> ...
>
> > +#define module_param_cbd(name, ops, arg, perm, data)                         \
> > +     __module_param_call_wdata(MODULE_PARAM_PREFIX, name, ops, arg, perm, -1, 0, data)
>
> Cryptic name. Moreover, inconsistent with the rest.
> What about module_param_cb_data() ?
>
> >  #define module_param_cb_unsafe(name, ops, arg, perm)                       \
> >       __module_param_call(MODULE_PARAM_PREFIX, name, ops, arg, perm, -1,    \
> >                           KERNEL_PARAM_FL_UNSAFE)
>
> (above left for the above comment)
>
> ...
>
> > +#define __module_param_call_wdata(prefix, name, ops, arg, perm, level, flags, data) \
>
> Similar __module_param_call_with_data()
>
> --
> With Best Regards,
> Andy Shevchenko
>
>

yes to all renames, revised.
thanks
