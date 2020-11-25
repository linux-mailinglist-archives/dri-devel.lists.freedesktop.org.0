Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AF3742C3B8C
	for <lists+dri-devel@lfdr.de>; Wed, 25 Nov 2020 10:04:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0049F6E87A;
	Wed, 25 Nov 2020 09:04:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com
 [IPv6:2607:f8b0:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E76886E87C
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Nov 2020 09:04:13 +0000 (UTC)
Received: by mail-ot1-x342.google.com with SMTP id f16so1551507otl.11
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Nov 2020 01:04:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9wYWJikKWEF7mzc6gXjvB67X7IZ716O0oqUWtkn0kL0=;
 b=LSzj8JLHFaHY6x4ngdNMihRg4WqNVhzwV0Phz4YUVGJPpQZeSkg+G6iYTb1H4lIw91
 Vg4pVbPk66lKq4Uy4nNDEPFMZoc6ZwXKUO5M9vhErUaR0tsR5i0yxHGDRc4Pj0pccE1P
 aYAM+AHdxIjLRf6JaL9nIRPhh6JqbxB80tKyc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9wYWJikKWEF7mzc6gXjvB67X7IZ716O0oqUWtkn0kL0=;
 b=ZS2qYqzyG8tPB9BmwiEgiCVxAVM/IRGzwaXFSnlYq+Ex0oWJ4YeJIpLTqNcCOlPyMI
 EmRTKTnfKlm86bTsTjidBSe5bF18grhDMZYxriaEa/pjue67eX/Y/PAWv3u2uCHA5A1R
 E3s7dtfEHe6uQDifsrhEKSRbekq/6R3GeTtRzY3oQFK/AkdAOuuN85LM++W4uLxoxL/P
 VsOCgoFQ2QPrm+IY4HFXs6e47XHOnlc1raxvkzpYatA29sqFnWRBF8a8I/0kr6UOLi7A
 G2cZg7omxZtwDS7EZ8R7b7dvOwfDfGJCnj72NU8JonyBh2ET9OTZU/p/oHUJfqmFpoQx
 FIZA==
X-Gm-Message-State: AOAM5310IXmvOIaxTZKUL1tFgIFVnpWy9eVhepzykUfCo6MqGmjCOHnA
 9gK1bKjDVxdtEF2Jav9qpQOXNxn77bUIH+4/rdyn6g==
X-Google-Smtp-Source: ABdhPJxRcZQP9FheH9uUjamSxQgYj5aOm/UzQMjgZdqqFuu1RblFJMmHQXiN6sJHuvDOKbGj6WoSVv5x6oEv7+buiwk=
X-Received: by 2002:a9d:27a5:: with SMTP id c34mr1992080otb.303.1606295053199; 
 Wed, 25 Nov 2020 01:04:13 -0800 (PST)
MIME-Version: 1.0
References: <1605936082-3099-1-git-send-email-andrey.grodzovsky@amd.com>
 <1605936082-3099-11-git-send-email-andrey.grodzovsky@amd.com>
 <20201124144938.GR401619@phenom.ffwll.local>
 <36fdb2f8-2238-6321-201e-a25a3a828fc5@amd.com>
In-Reply-To: <36fdb2f8-2238-6321-201e-a25a3a828fc5@amd.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Wed, 25 Nov 2020 10:04:02 +0100
Message-ID: <CAKMK7uE=AfP2p=UKjG=TFuFh8d0vphyHndxxEqqNNa+ouX48AQ@mail.gmail.com>
Subject: Re: [PATCH v3 10/12] drm/amdgpu: Avoid sysfs dirs removal post device
 unplug
To: Andrey Grodzovsky <Andrey.Grodzovsky@amd.com>
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
Cc: amd-gfx list <amd-gfx@lists.freedesktop.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, Qiang Yu <yuq825@gmail.com>,
 Greg KH <gregkh@linuxfoundation.org>, Alex Deucher <Alexander.Deucher@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Nov 24, 2020 at 11:27 PM Andrey Grodzovsky
<Andrey.Grodzovsky@amd.com> wrote:
>
>
> On 11/24/20 9:49 AM, Daniel Vetter wrote:
> > On Sat, Nov 21, 2020 at 12:21:20AM -0500, Andrey Grodzovsky wrote:
> >> Avoids NULL ptr due to kobj->sd being unset on device removal.
> >>
> >> Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
> >> ---
> >>   drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c   | 4 +++-
> >>   drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c | 4 +++-
> >>   2 files changed, 6 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
> >> index caf828a..812e592 100644
> >> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
> >> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
> >> @@ -27,6 +27,7 @@
> >>   #include <linux/uaccess.h>
> >>   #include <linux/reboot.h>
> >>   #include <linux/syscalls.h>
> >> +#include <drm/drm_drv.h>
> >>
> >>   #include "amdgpu.h"
> >>   #include "amdgpu_ras.h"
> >> @@ -1043,7 +1044,8 @@ static int amdgpu_ras_sysfs_remove_feature_node(struct amdgpu_device *adev)
> >>              .attrs = attrs,
> >>      };
> >>
> >> -    sysfs_remove_group(&adev->dev->kobj, &group);
> >> +    if (!drm_dev_is_unplugged(&adev->ddev))
> >> +            sysfs_remove_group(&adev->dev->kobj, &group);
> > This looks wrong. sysfs, like any other interface, should be
> > unconditionally thrown out when we do the drm_dev_unregister. Whether
> > hotunplugged or not should matter at all. Either this isn't needed at all,
> > or something is wrong with the ordering here. But definitely fishy.
> > -Daniel
>
>
> So technically this is needed because kobejct's sysfs directory entry kobj->sd
> is set to NULL
> on device removal (from sysfs_remove_dir) but because we don't finalize the device
> until last reference to drm file is dropped (which can happen later) we end up
> calling sysfs_remove_file/dir after
> this pointer is NULL. sysfs_remove_file checks for NULL and aborts while
> sysfs_remove_dir
> is not and that why I guard against calls to sysfs_remove_dir.
> But indeed the whole approach in the driver is incorrect, as Greg pointed out -
> we should use
> default groups attributes instead of explicit calls to sysfs interface and this
> would save those troubles.
> But again. the issue here of scope of work, converting all of amdgpu to default
> groups attributes is somewhat
> lengthy process with extra testing as the entire driver is papered with sysfs
> references and seems to me more of a standalone
> cleanup, just like switching to devm_ and drmm_ work. To me at least it seems
> that it makes more sense
> to finalize and push the hot unplug patches so that this new functionality can
> be part of the driver sooner
> and then incrementally improve it by working on those other topics. Just as
> devm_/drmm_ I also added sysfs cleanup
> to my TODO list in the RFC patch.

Hm, whether you solve this with the default group stuff to
auto-remove, or remove explicitly at the right time doesn't matter
much. The underlying problem you have here is that it's done way too
late. sysfs removal (like all uapi interfaces) need to be removed as
part of drm_dev_unregister. I guess aside from the split into fini_hw
and fini_sw, you also need an unregister_late callback (like we have
already for drm_connector, so that e.g. backlight and similar stuff
can be unregistered).

Papering over the underlying bug like this doesn't really fix much,
the lifetimes are still wrong.
-Daniel

>
> Andrey
>
>
> >
> >>
> >>      return 0;
> >>   }
> >> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c
> >> index 2b7c90b..54331fc 100644
> >> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c
> >> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c
> >> @@ -24,6 +24,7 @@
> >>   #include <linux/firmware.h>
> >>   #include <linux/slab.h>
> >>   #include <linux/module.h>
> >> +#include <drm/drm_drv.h>
> >>
> >>   #include "amdgpu.h"
> >>   #include "amdgpu_ucode.h"
> >> @@ -464,7 +465,8 @@ int amdgpu_ucode_sysfs_init(struct amdgpu_device *adev)
> >>
> >>   void amdgpu_ucode_sysfs_fini(struct amdgpu_device *adev)
> >>   {
> >> -    sysfs_remove_group(&adev->dev->kobj, &fw_attr_group);
> >> +    if (!drm_dev_is_unplugged(&adev->ddev))
> >> +            sysfs_remove_group(&adev->dev->kobj, &fw_attr_group);
> >>   }
> >>
> >>   static int amdgpu_ucode_init_single_fw(struct amdgpu_device *adev,
> >> --
> >> 2.7.4
> >>



-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
