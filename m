Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 986CF19F752
	for <lists+dri-devel@lfdr.de>; Mon,  6 Apr 2020 15:55:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94E166E3D3;
	Mon,  6 Apr 2020 13:55:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x341.google.com (mail-ot1-x341.google.com
 [IPv6:2607:f8b0:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D1196E3D3
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Apr 2020 13:55:40 +0000 (UTC)
Received: by mail-ot1-x341.google.com with SMTP id f52so15314901otf.8
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Apr 2020 06:55:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vEoDxDauFm8UXU1PxP6cMoGFWELp90yUWSMLW0dCfYA=;
 b=Y0wE+5csJbmtFodeJ8ZCgZTMIWVtBHfUqk/Rku64FMUqPpgGHa0gHI2GybEhfGqnrW
 Er0FTBby51bEq29zpN53AxRm4QTqm1sqKwaQ2ydcHhgAGXIw6rurXv14fv4ncSxFmhWC
 7CSavoUeaF5vzEqDW1u3kST7jOdKgApWTpILk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vEoDxDauFm8UXU1PxP6cMoGFWELp90yUWSMLW0dCfYA=;
 b=BHpkHjxk75PbEj4gxMCA/74rjxVFy6g4yX3LEy/PqMV8R2Mbih8yl/0cLcE3t/2lAO
 cYyaySYLIy+8haqTaH830cmVEPk5p1s7DM0SWFPyvvzUxe52VsKmiNtMgzfxT5EsdD9g
 pHYaJwKmlc9Vl8B/W3UOeX/2JFoLoIf0KvsuBKAKw3JbYvf/DmoLqsmtYupkJhC8RMxq
 ou40hS+83K+Rmq+acu3E+muGnVSlt/ystrdKXj8T99i4FT0Sixc2qzKrteI84YxCMKTB
 fM+V4d2820/SPT3ZfA8+QGzUC3sMXzF3QD7dRYxnDOcAYEnxZ/xVyujhjDO3ab8RfKPd
 tC2w==
X-Gm-Message-State: AGi0PubBG0iH9klj+eXoRtqsVGftdS1gze12SDDfZN0Sl8dPIk1v1nHr
 RZVNFiT9X5bSCj7XTjKg9E71OEqPSWqV6sBj9rQw4Q==
X-Google-Smtp-Source: APiQypKgOqUPklz4kLLsmy77+eELn9F6PY7qLhZwNvbTUUJtnUviuoPqwJe2HdtYGzxmpw3ieaNf02ozdr2pBe6cfpE=
X-Received: by 2002:a05:6830:15d4:: with SMTP id
 j20mr17368719otr.303.1586181339270; 
 Mon, 06 Apr 2020 06:55:39 -0700 (PDT)
MIME-Version: 1.0
References: <20200403135828.2542770-1-daniel.vetter@ffwll.ch>
 <20200403135828.2542770-2-daniel.vetter@ffwll.ch>
 <CAKMK7uEEi8NMCopSd+7LqmhaqW0U4ZMif7YLgYQZ58fD7jRfzA@mail.gmail.com>
 <20200406133835.GA24355@kroah.com>
In-Reply-To: <20200406133835.GA24355@kroah.com>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Mon, 6 Apr 2020 15:55:28 +0200
Message-ID: <CAKMK7uG25kTY9iSyz7A-rxD+wMc4Y0NzuQ288Q51KR-sG0KNzQ@mail.gmail.com>
Subject: Re: [PATCH 01/44] drivers/base: Always release devres on device_del
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
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
Cc: Daniel Vetter <daniel.vetter@intel.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Apr 6, 2020 at 3:38 PM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Mon, Apr 06, 2020 at 02:32:51PM +0200, Daniel Vetter wrote:
> > On Fri, Apr 3, 2020 at 3:58 PM Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
> > >
> > > In drm we've added nice drm_device (the main gpu driver thing, which
> > > also represents the userspace interfaces and has everything else
> > > dangling off it) init functions using devres, devm_drm_dev_init and
> > > soon devm_drm_dev_alloc (this patch series adds that).
> > >
> > > A slight trouble is that drm_device itself holds a reference on the
> > > struct device it's sitting on top (for sysfs links and dmesg debug and
> > > lots of other things), so there's a reference loop. For real drivers
> > > this is broken at remove/unplug time, where all devres resources are
> > > released device_release_driver(), before the final device reference is
> > > dropped. So far so good.
> > >
> > > There's 2 exceptions:
> > > - drm/vkms|vgem: Virtual drivers for which we create a fake/virtual
> > >   platform device to make them look more like normal devices to
> > >   userspace. These aren't drivers in the driver model sense, we simple
> > >   create a platform_device and register it.
> > >
> > > - drm/i915/selftests, where we create minimal mock devices, and again
> > >   the selftests aren't proper drivers in the driver model sense.
> > >
> > > For these two cases the reference loop isn't broken, because devres is
> > > only cleaned up when the last device reference is dropped. But that's
> > > not happening, because the drm_device holds that last struct device
> > > reference.
> > >
> > > Thus far this wasn't a problem since the above cases simply
> > > hand-rolled their cleanup code. But I want to convert all drivers over
> > > to the devm_ versions, hence it would be really nice if these
> > > virtual/fake/mock uses-cases could also be managed with devres
> > > cleanup.
> > >
> > > I see three possible approaches:
> >
> > Restarting this at the top level, because the discussion thus far just
> > ended in a long "you're doing it wrong", despite that I think we're
> > doing what v4l is doing (plus/minus that we can't do an exact matching
> > handling in drm because our uapi has a lot more warts, which we can't
> > change because no breaking userspace).
> >
> > So which one of the three below is the right approach?
> >
> > Aside, looking at the v4l solution I think there's also a confusion
> > about struct device representing a char device (which v4l directly
> > uses as its userspace interface refcounted thing, and which drm does
> > _not_ directly). And a struct device embedded into something like
> > platform_device or a virtual device, where a driver can bind to. My
> > question here is about the former, I don't care how cdev struct device
> > are cleaned up one bit. Now if other subsystems relies on the devres
> > cleanup behaviour we currently have because of such cdev usage, then
> > yeah first approach doesn't work (and I have a big surprised that use
> > case, but hey would actually learn something).
> >
> > End of aside, since again I want to figure out which of the tree
> > approaches it the right one. Not about how wrong one of them is,
> > ignoring the other three I laid out. And maybe there's even more
> > options for this.
>
> Sorry, been swamped with other things, give me a few days to get back to
> this, I need to dig into how you all are dealing with the virtual
> drivers.

Sure, no problem.

> Doing this in the middle of the merge window is a bit rough :)

Ah I always forget ... we freeze drm at -rc6, so merge window is
actually my most relaxed time since everyone is busy and no one has
time to report drm bugs :-)

Thanks, Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
