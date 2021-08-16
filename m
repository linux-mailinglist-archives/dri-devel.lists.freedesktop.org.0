Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 531083ED0CE
	for <lists+dri-devel@lfdr.de>; Mon, 16 Aug 2021 11:05:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F0B489359;
	Mon, 16 Aug 2021 09:05:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com
 [IPv6:2607:f8b0:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E0B289D81
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Aug 2021 09:05:04 +0000 (UTC)
Received: by mail-ot1-x330.google.com with SMTP id
 l36-20020a0568302b24b0290517526ce5e3so12656595otv.11
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Aug 2021 02:05:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=I0X8cjnS3exVhKOIPaaxhXaLTasft0jjNO1dDnir+M0=;
 b=WsrmEAbKR9Ea1DN08aTHGiAKPFqgbYhwc/9LS5oJ/HgSk5p3+zAIlUvaEE/ADQPgGI
 cbx68FP3RCl9hHQN2gqWFmFuSN6q5AvO1obN0fG5yDYwq1dbG2mdRJCH7IUPvuPyo4+N
 z0/O2WvILWTFfLPT83dMk2DaEY89r5CjM7/lE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=I0X8cjnS3exVhKOIPaaxhXaLTasft0jjNO1dDnir+M0=;
 b=tItcgbicNO4ZLWIdeugaC36BXU62TJHHh9TgTuaqwFxQcN21IIP7GYNxXBJ+zQycTS
 gdSA1DgW3991gHVW85fbJDMhdrE3XyEeVpGl10msZOkfZIJXze6IKcX7Ia2PBuQtvL4p
 9nrCqYpD0bk5oxQwcv2DGgIDqGWEpYWCCUkHbylsWtjVTzcytq02wyVt2cQXBYlMsFeR
 5iaPF2TepF47rujJ5rh+twp9pEKEfBHuUVoGJNpSO3/piGH+hi8+Bf6HVyvchoBtcDWS
 7ULQ13zdv5PkURSwuB7hEQ8mpWoTHxZcwvsF3L95g3tC3B71wCvK8TbkrK3/tFGkYayx
 DNkQ==
X-Gm-Message-State: AOAM533NdW/6Ek39nkHrgVggRkfWBpx/fQ1VnOsVSYmV246VNYitRKHr
 lso8YND5pxmqqk3RWx1OTTOlbxHptBNY43iaXzpurQ==
X-Google-Smtp-Source: ABdhPJwYfeYsTGTja3gdEWuUROrubaV5DSeozV6ZWk480EPEPOe0sNVBRHe913XVZngXT6YGFbGy1Z4ZGIwcRux0I0g=
X-Received: by 2002:a9d:27a4:: with SMTP id c33mr12175776otb.281.1629104703642; 
 Mon, 16 Aug 2021 02:05:03 -0700 (PDT)
MIME-Version: 1.0
References: <20210815153740.195330-1-desmondcheongzx@gmail.com>
 <202108160208.ONHHWxXy-lkp@intel.com>
 <f88fe698-b40c-b309-96c2-32b314280aad@gmail.com>
In-Reply-To: <f88fe698-b40c-b309-96c2-32b314280aad@gmail.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Mon, 16 Aug 2021 11:04:52 +0200
Message-ID: <CAKMK7uEWMjaDEuMpc1__EwD5rpaouJ-dhahQBEQ5rsBz3VV=qg@mail.gmail.com>
Subject: Re: [PATCH v2] drm: avoid races with modesetting rights
To: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
Cc: kernel test robot <lkp@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Dave Airlie <airlied@linux.ie>, 
 kbuild-all@lists.01.org, dri-devel <dri-devel@lists.freedesktop.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 intel-gfx <intel-gfx@lists.freedesktop.org>, 
 Shuah Khan <skhan@linuxfoundation.org>
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

On Mon, Aug 16, 2021 at 10:53 AM Desmond Cheong Zhi Xi
<desmondcheongzx@gmail.com> wrote:
> On 16/8/21 2:47 am, kernel test robot wrote:
> > Hi Desmond,
> >
> > Thank you for the patch! Yet something to improve:
> >
> > [auto build test ERROR on next-20210813]
> > [also build test ERROR on v5.14-rc5]
> > [cannot apply to linus/master v5.14-rc5 v5.14-rc4 v5.14-rc3]
> > [If your patch is applied to the wrong git tree, kindly drop us a note.
> > And when submitting patch, we suggest to use '--base' as documented in
> > https://git-scm.com/docs/git-format-patch]
> >
> > url:    https://github.com/0day-ci/linux/commits/Desmond-Cheong-Zhi-Xi/drm-avoid-races-with-modesetting-rights/20210815-234145
> > base:    4b358aabb93a2c654cd1dcab1a25a589f6e2b153
> > config: i386-randconfig-a004-20210815 (attached as .config)
> > compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
> > reproduce (this is a W=1 build):
> >          # https://github.com/0day-ci/linux/commit/cf6d8354b7d7953cd866fad004cbb189adfa074f
> >          git remote add linux-review https://github.com/0day-ci/linux
> >          git fetch --no-tags linux-review Desmond-Cheong-Zhi-Xi/drm-avoid-races-with-modesetting-rights/20210815-234145
> >          git checkout cf6d8354b7d7953cd866fad004cbb189adfa074f
> >          # save the attached .config to linux build tree
> >          make W=1 ARCH=i386
> >
> > If you fix the issue, kindly add following tag as appropriate
> > Reported-by: kernel test robot <lkp@intel.com>
> >
> > All errors (new ones prefixed by >>, old ones prefixed by <<):
> >
> >>> ERROR: modpost: "task_work_add" [drivers/gpu/drm/drm.ko] undefined!
> >
>
> I'm a bit uncertain about this. Looking into the .config used, this
> error seems to happen because task_work_add isn't an exported symbol,
> but DRM is being compiled as a loadable kernel module (CONFIG_DRM=m).
>
> One way to deal with this is to export the symbol, but there was a
> proposed patch to do this a few months back that wasn't picked up [1],
> so I'm not sure what to make of this.
>
> I'll export the symbol as part of a v3 series, and check in with the
> task-work maintainers.
>
> Link:
> https://lore.kernel.org/lkml/20210127150029.13766-3-joshi.k@samsung.com/ [1]

Yeah that sounds best. I have two more thoughts on the patch:
- drm_master_flush isn't used by any modules outside of drm.ko, so we
can unexport it and drop the kerneldoc (the comment is still good).
These kind of internal functions have their declaration in
drm-internal.h - there's already a few there from drm_auth.c

- We know have 3 locks for master state, that feels a bit like
overkill. The spinlock I think we need to keep due to lock inversions,
but the master_mutex and master_rwsem look like we should be able to
merge them? I.e. anywhere we currently grab the master_mutex we could
instead grab the rwsem in either write mode (when we change stuff) or
read mode (when we just check, like in master_internal_acquire).

Thoughts?
-Daniel

>
> > ---
> > 0-DAY CI Kernel Test Service, Intel Corporation
> > https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
> >
>


-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
