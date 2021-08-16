Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 56E4B3ED834
	for <lists+dri-devel@lfdr.de>; Mon, 16 Aug 2021 15:59:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53D7989E3B;
	Mon, 16 Aug 2021 13:59:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com
 [IPv6:2607:f8b0:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E50A89E3B
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Aug 2021 13:59:38 +0000 (UTC)
Received: by mail-ot1-x32d.google.com with SMTP id
 r16-20020a0568304190b02904f26cead745so20993903otu.10
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Aug 2021 06:59:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dbwBktY0sbcO1rcZRUJvSkw7JUJsCG0GF14rbQ+hXDY=;
 b=ZDBQvtC4gcpDSJ/zjRP7Qim0rPL3y+QlzC/UbTk+TiHF5bVNsrzXOcQMm7mTJ8hcOl
 RiwV5HJ+yVwopsPBOv87EaBlaIwnOB+bgqRuaeOr4tZ/1zLputbWdMag2TPmEapX1N1r
 vJ3jgsAgD2OGjDSk3vO7uX35BCtIq1TaMmDCo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dbwBktY0sbcO1rcZRUJvSkw7JUJsCG0GF14rbQ+hXDY=;
 b=HcpFyCS8QdFZDsfc2+WvegxfQEPvkuNcd+e+LSHD4LsdWCYEW2ncGumBH5xNmsGHZt
 4fTsRC5x+Hn6x9i09itJbfXqVr8MPZ1oZxGg8tvjMTYIS/VCmWut/V2i8KlCK/lV3k8b
 OD8GInJWkkWjuX0tkguPrgZLPGCTE+ClPnAt+5ozgnFADGHO1RzIsne7tA31DgQlZuBo
 fhgtiy2NDfcul9aqxvIaxFWv8UEzpoORTaMLKiGANZKipsWDuLzV05ZYXi/KA8g0IOWQ
 vyiajAplTkgCEp/+0US3VK9aZOhGEhstlxbTQ0RUmTVshvZIXYrwhe/nYQxU3UPgBgDg
 uLDw==
X-Gm-Message-State: AOAM533v2ZIxcnynwlgZJK//AQNUOFoaHROTSWwERgq1AASAE8t7fxJy
 cTP0Dfe5Q2U5bu/4Uuynq6kLFjFiuaZPkyQ+sfHA5w==
X-Google-Smtp-Source: ABdhPJxDpzI+0G3YC8pCkjgnpnIssqICkJMk5x03/FLDb/HE6D6TFRnOthRxJsGmzo1z5uiPr9EMZMGWAFiVdkWWSBI=
X-Received: by 2002:a9d:27a4:: with SMTP id c33mr13164173otb.281.1629122377396; 
 Mon, 16 Aug 2021 06:59:37 -0700 (PDT)
MIME-Version: 1.0
References: <20210815153740.195330-1-desmondcheongzx@gmail.com>
 <202108160208.ONHHWxXy-lkp@intel.com>
 <f88fe698-b40c-b309-96c2-32b314280aad@gmail.com>
 <CAKMK7uEWMjaDEuMpc1__EwD5rpaouJ-dhahQBEQ5rsBz3VV=qg@mail.gmail.com>
 <3a5ffd83-3d91-73dc-0cae-e822ba381b2b@gmail.com>
In-Reply-To: <3a5ffd83-3d91-73dc-0cae-e822ba381b2b@gmail.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Mon, 16 Aug 2021 15:59:26 +0200
Message-ID: <CAKMK7uFe6y5W7ZuTGV1rc8vPmpLdDd-rN4aC=1CXWjZLOAOQsQ@mail.gmail.com>
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

On Mon, Aug 16, 2021 at 12:31 PM Desmond Cheong Zhi Xi
<desmondcheongzx@gmail.com> wrote:
>
> On 16/8/21 5:04 pm, Daniel Vetter wrote:
> > On Mon, Aug 16, 2021 at 10:53 AM Desmond Cheong Zhi Xi
> > <desmondcheongzx@gmail.com> wrote:
> >> On 16/8/21 2:47 am, kernel test robot wrote:
> >>> Hi Desmond,
> >>>
> >>> Thank you for the patch! Yet something to improve:
> >>>
> >>> [auto build test ERROR on next-20210813]
> >>> [also build test ERROR on v5.14-rc5]
> >>> [cannot apply to linus/master v5.14-rc5 v5.14-rc4 v5.14-rc3]
> >>> [If your patch is applied to the wrong git tree, kindly drop us a note.
> >>> And when submitting patch, we suggest to use '--base' as documented in
> >>> https://git-scm.com/docs/git-format-patch]
> >>>
> >>> url:    https://github.com/0day-ci/linux/commits/Desmond-Cheong-Zhi-Xi/drm-avoid-races-with-modesetting-rights/20210815-234145
> >>> base:    4b358aabb93a2c654cd1dcab1a25a589f6e2b153
> >>> config: i386-randconfig-a004-20210815 (attached as .config)
> >>> compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
> >>> reproduce (this is a W=1 build):
> >>>           # https://github.com/0day-ci/linux/commit/cf6d8354b7d7953cd866fad004cbb189adfa074f
> >>>           git remote add linux-review https://github.com/0day-ci/linux
> >>>           git fetch --no-tags linux-review Desmond-Cheong-Zhi-Xi/drm-avoid-races-with-modesetting-rights/20210815-234145
> >>>           git checkout cf6d8354b7d7953cd866fad004cbb189adfa074f
> >>>           # save the attached .config to linux build tree
> >>>           make W=1 ARCH=i386
> >>>
> >>> If you fix the issue, kindly add following tag as appropriate
> >>> Reported-by: kernel test robot <lkp@intel.com>
> >>>
> >>> All errors (new ones prefixed by >>, old ones prefixed by <<):
> >>>
> >>>>> ERROR: modpost: "task_work_add" [drivers/gpu/drm/drm.ko] undefined!
> >>>
> >>
> >> I'm a bit uncertain about this. Looking into the .config used, this
> >> error seems to happen because task_work_add isn't an exported symbol,
> >> but DRM is being compiled as a loadable kernel module (CONFIG_DRM=m).
> >>
> >> One way to deal with this is to export the symbol, but there was a
> >> proposed patch to do this a few months back that wasn't picked up [1],
> >> so I'm not sure what to make of this.
> >>
> >> I'll export the symbol as part of a v3 series, and check in with the
> >> task-work maintainers.
> >>
> >> Link:
> >> https://lore.kernel.org/lkml/20210127150029.13766-3-joshi.k@samsung.com/ [1]
> >
> > Yeah that sounds best. I have two more thoughts on the patch:
> > - drm_master_flush isn't used by any modules outside of drm.ko, so we
> > can unexport it and drop the kerneldoc (the comment is still good).
> > These kind of internal functions have their declaration in
> > drm-internal.h - there's already a few there from drm_auth.c
> >
>
> Sounds good, I'll do that and move the declaration from drm_auth.h to
> drm_internal.h.
>
> > - We know have 3 locks for master state, that feels a bit like
> > overkill. The spinlock I think we need to keep due to lock inversions,
> > but the master_mutex and master_rwsem look like we should be able to
> > merge them? I.e. anywhere we currently grab the master_mutex we could
> > instead grab the rwsem in either write mode (when we change stuff) or
> > read mode (when we just check, like in master_internal_acquire).
> >
> > Thoughts?
> > -Daniel
> >
>
> Using rwsem in the places where we currently hold the mutex seems pretty
> doable.
>
> There are some tricky bits once we add rwsem read locks to the ioctl
> handler. Some ioctl functions like drm_authmagic need a write lock.

Ah yes, I only looked at the dropmaster/setmaster ioctl, and those
don't have the DRM_MASTER bit set.

> In this particular case, it might make sense to break master_mutex down
> into finer-grained locks, since the function doesn't change master
> permissions. It just needs to prevent concurrent writes to the
> drm_master.magic_map idr.

Yeah for authmagic we could perhaps just reuse the spinlock to protect
->magic_map?

> For other ioctls, I'll take a closer look on a case-by-case basis.

If it's too much shuffling then I think totally fine to leave things
as-is. Just feels a bit silly to have 3 locks, on of which is an
rwlock itself, for this fairly small amount of state.
-Daniel

>
> >>
> >>> ---
> >>> 0-DAY CI Kernel Test Service, Intel Corporation
> >>> https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
> >>>
> >>
> >
> >
>


-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
