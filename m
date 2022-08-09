Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64DAE58DA6E
	for <lists+dri-devel@lfdr.de>; Tue,  9 Aug 2022 16:38:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DC9CD8C67;
	Tue,  9 Aug 2022 14:37:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AB0DD8BC1
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Aug 2022 14:37:15 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id ay12so3600648wmb.1
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Aug 2022 07:37:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc; bh=A68NIbIg/H1nJ9is16UY07r9xLu1Koj/fixZivFhYJ0=;
 b=RoKIYUaTlzGf4GWjMigQE3YrLAatx6VH16JBAqrKpBQlgWZ/zCFmJjSLlmCfBeagQp
 1bgs5vg7QlIFB7f1BM8Fq5+RRDuAZDYGaZYx/sIZmtagYhW2CYqsZD8w0LVULh+Yejus
 ZoatQ25jGAZiSvFZw86IkL4+HFNHHikHlea8o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc;
 bh=A68NIbIg/H1nJ9is16UY07r9xLu1Koj/fixZivFhYJ0=;
 b=Yr9ZFJEs6NqsZzWQqlG03WZAwqjSWqkMBch5DPxS3XSFUNgYcAGXz7SNUwBj/P+Bfg
 0IdeSOqfGelWGfgEoUBZ9Qa1hR7hI7otsT8SP63GX24Qs0tgiVCGLhD2HhY3tdzCHKwC
 PnVd1UBYi4jnNcwgX8G4llJEF/3jZyyB5QkvwdpSVVlntFlWnzDG2tk731yzqi5h7kYM
 kimo/Eua35YPDr0z8sRku1bOurUho13/p3KHchMVq6cJ4g/30ziterPgGlqqLZyXJsJe
 WtwU9uY2oVLXIHSMmy0hOsVTqtWfeklX22EOkPXQZfks0WOi32H3+ZzUTnQFwZOCP2iO
 V2EQ==
X-Gm-Message-State: ACgBeo0Zd5pHtdlwMzAqK4vLSG6XYJjTijhR2YcCf3L8xyOhRe+FM6aJ
 IZMFSce3KQO6yRMHQQ0j3lj/VB6M+wDfh88o
X-Google-Smtp-Source: AA6agR4Hs60cgPkKn6k7V2vVbrPweIxQJV8V2V9Xx/U8IqUSY/RDnxQzl7r2u3sJN/ws6oM79ETHOA==
X-Received: by 2002:a05:600c:1d8a:b0:3a3:1104:88ad with SMTP id
 p10-20020a05600c1d8a00b003a3110488admr15641707wms.179.1660055833818; 
 Tue, 09 Aug 2022 07:37:13 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 l18-20020a7bc452000000b003a53da4ef8bsm7217837wmi.16.2022.08.09.07.37.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Aug 2022 07:37:13 -0700 (PDT)
Date: Tue, 9 Aug 2022 16:37:11 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Subject: Re: [RFC PATCH 3/5] drm/amdgpu: Allow explicit sync for VM ops.
Message-ID: <YvJxF/oBjqYAWXyg@phenom.ffwll.local>
References: <CAP+8YyGL_WEME-1_oB_K5_K600c5kcmO0GxXBQGVQEF7aP_D7w@mail.gmail.com>
 <91e843ca-928a-7ab1-12e4-89fbba085403@amd.com>
 <CAP+8YyHqcoxVeropBpeuSRX4kNtVezi1-s3FKSic_Z_OQ8BcAg@mail.gmail.com>
 <1e04e766-4a5b-6825-6991-3bd542f562b5@amd.com>
 <CAP+8YyGEHUZhCCUa-3sSVmgGMrTkj=vQomPar=hTN=3-RCznOA@mail.gmail.com>
 <71cc9552-4bf6-4941-e903-2ea62a22a2e9@amd.com>
 <YrYfw6T4MGvifIco@phenom.ffwll.local>
 <785d01ba-7d4a-1b69-a97a-6144ce0f6772@amd.com>
 <YreQER+Szg5dxyNN@phenom.ffwll.local>
 <ac6e1937-4943-9bc1-8a85-74447e6c0447@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ac6e1937-4943-9bc1-8a85-74447e6c0447@amd.com>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
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
Cc: ML dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

[Back from vacations and work change and out sick and absolutely
everything else going wrong]

On Mon, Jul 04, 2022 at 03:37:43PM +0200, Christian König wrote:
> Hey Daniel,
> 
> Am 26.06.22 um 00:45 schrieb Daniel Vetter:
> > [SNIP]
> > I think we should highlight a bit more that for explicitly synchronized
> > userspace like vk OTHER is the normal case. So really not an exception.
> > Ofc aside from amdkgf there's currently no driver doing this, but really
> > we should have lots of them ...
> > 
> > See https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flore.kernel.org%2Fdri-devel%2FYZ%2By%2BUwo809qtvs5%40phenom.ffwll.local%2F&amp;data=05%7C01%7Cchristian.koenig%40amd.com%7C88037a566a8d4c8d4aca08da56fc6e3c%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637917939428739923%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=6sYto7GCLw8i3pT9OCFN1l6dxeYYHPghzKDMYxqUw90%3D&amp;reserved=0
> > 
> > I didn't find anything else. So not sure how we managed to create
> > confusion here :-(
> 
> Well you said something like "Yeah, READ is supposed to be used for
> that...." and that created the impression that AMDGPU should start using
> that for Vulkan submissions and you are rejecting my idea of using BOOKKEEP
> for that.
> 
> > > I mean that still makes a lot of sense to me because if I'm not completely
> > > mistaken we do have use cases which break, especially Vulkan+encoding.
> > Yeah I think we only have some communication fumble here, nothing else :-)
> 
> Ok, well then @Bas: Sorry for all the noise, we are actually all on the same
> page :)
> 
> > And yes libva doesn't have any support for vk's explicit sync model, so
> > that will just fall flat on its face. Might motivate a few folks to fix
> > libva :-)
> 
> Well that's not the problem. The problem is that we have a couple of use
> cases where libva is supposed to encode a Vulkan surface without letting
> Vulkan know about that.
> 
> In other words: Application shares DMA-buf between Vulkan and VA-API,
> renders with Vulkan and encodes with VA-API without any explicit
> synchronization between the two.
> 
> I know that this is absolutely against the Vulkan specification, but it just
> happened to work fine. And when you break something which used to work
> people start to complain...

Yeah I feared that, and worse libva doesn't have the nice gl interop
extensions to make it actually work.

> > Note that on i915 side it's exactly the same, we've also been setting the
> > READ fence thus far. Since the breakage will be introduced by upgrading
> > mesa we'll at least avoid the kernel regression complaints, or at least I
> > hope we can get away with that.
> 
> Yeah, the path to salvation start's with the words: It's not my f... problem
> :)
> 
> > Since really I don't have any idea how it could be fixed otherwise, except
> > through some really, really terrible hacks. Maybe kernel module option or
> > so.
> > 
> > Anyway I think all we need is just a patch to the dma_resv docs to explain
> > that USAGE_BOOKKEEPING is what vulkan userspace wants, and why. Bas,
> > you're up to typing that?
> 
> I can do that. I'm just back from a week of vacation and still digging
> through my mails.

Yeah I think the best path is we're pushing hard for adding the libva
syncobj extensions like gl has, so that this can be done properly. And
then just pave it over with kernel modoptions until userspace is fixed.

If we end up making implicit sync part of defacto vk api on linux, then a
_lot_ of people will be very sad :-(
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
