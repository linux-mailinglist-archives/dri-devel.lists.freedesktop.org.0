Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7545E37B795
	for <lists+dri-devel@lfdr.de>; Wed, 12 May 2021 10:13:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40EEA6E11C;
	Wed, 12 May 2021 08:13:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2FCB6E11C
 for <dri-devel@lists.freedesktop.org>; Wed, 12 May 2021 08:13:48 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id j10so6624360ejb.3
 for <dri-devel@lists.freedesktop.org>; Wed, 12 May 2021 01:13:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=vQ7To4nG6aFbAsH/NhJz6mo/fHXrLLuUsS/kwglbCHo=;
 b=fd9iqGyt5ZyKStzfARmEqGlovnijDQyg41Wr+Jjrf46d57ww7czGwZObq0rJDvWRjk
 wtWKnsRRRqCZGaBewt9Otuem5McE745pbFG6coZuDO5HK5XbXkXhOEE+5+7XIFhwqURV
 +uobFfVrCvME2mWE7iG0cpY8KrloI7DRwKjnk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=vQ7To4nG6aFbAsH/NhJz6mo/fHXrLLuUsS/kwglbCHo=;
 b=OVTQBVhBpLYcBiF9l6G0WtsCA+q8OW6/WE2LO7WRu18PPTXFFOVxxmOjxsuKYtGDN3
 kcezNZXyRtvm2KhGIf9ZC2yH5hDnMyS1MBwcA7AsMiZBkOdxAHMXU6Vn102J4hzulHS8
 XuuwAcyl15BeF/pK4wEBZ7uzVwb8xrBFUrSrWlP5psHgSxh4KuNB4ZOL5/y/ZBYc1LLi
 IL+E0pp3/o0RawukMOcj7n4aZGjPwX0DRbtCII4FxP5xfBmogN5QDEZVjx9x3PgRA7bQ
 8JuNX/vB7Pl1x4qlkqUmmc7xh5MPX+AaLTdu6AtHEnUA+x6v8YFj+u3XTv+DUGSi0QLy
 hdPw==
X-Gm-Message-State: AOAM533wy2YhDeyEEQS78m88l2Zzlz0oXzxIKu+7LGdVMXYOWMIFGnHu
 sIAMjusRe3x6kE7/XdYQwMaoPXDO56QSrQ==
X-Google-Smtp-Source: ABdhPJxjfqGHh0Ce6QHlDDcuNX/vHKfMQNxy850U6FzUkriVid14p3Xi3XlXKDA6VH7jLxxIUTrpxg==
X-Received: by 2002:a17:906:cf82:: with SMTP id
 um2mr36196032ejb.322.1620807227624; 
 Wed, 12 May 2021 01:13:47 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id rs8sm13735032ejb.17.2021.05.12.01.13.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 May 2021 01:13:47 -0700 (PDT)
Date: Wed, 12 May 2021 10:13:45 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [RFC] Implicit vs explicit user fence sync
Message-ID: <YJuOOVSayHwz2ug7@phenom.ffwll.local>
References: <YJFXG/THrjXqQjyN@phenom.ffwll.local>
 <d266ccd2-3259-99ce-5fd6-b8ae81ac14e9@gmail.com>
 <YJFkN/bgN6UCXdvA@phenom.ffwll.local>
 <f1616be5-a8cb-076d-a63d-9554a76b0b0a@gmail.com>
 <YJoy6oI34tQZMt6/@phenom.ffwll.local>
 <0128750d-56bf-7697-0fda-0342c7b7df17@gmail.com>
 <YJqTeQAjsr1Tn9CZ@phenom.ffwll.local>
 <a08a4b30-5ae5-49ac-bad0-c77a5cabbecd@gmail.com>
 <YJq1T8yWXSW6TRjW@phenom.ffwll.local>
 <d91f5635-9f03-d1ea-4bc5-594b42402eaa@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d91f5635-9f03-d1ea-4bc5-594b42402eaa@gmail.com>
X-Operating-System: Linux phenom 5.10.32scarlett+ 
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, May 11, 2021 at 09:34:11PM +0200, Christian König wrote:
> Am 11.05.21 um 18:48 schrieb Daniel Vetter:
> > [SNIP]
> > > Why?
> > If you allow implicit fencing then you can end up with
> > - an implicit userspace fence as the in-fence
> > - but an explicit dma_fence as the out fence
> > 
> > Which is not allowed. So there's really no way to make this work, except
> > if you stall in the ioctl, which also doesn't work.
> 
> Ok, wait a second. I really don't understand what's going on here.
> 
> The out fence is just to let the userspace know when the frame is displayed.
> Or rather when the old frame is no longer displayed so that it can be
> reused, right?
> 
> Then why does that need to be a dma_fence? We don't use that for memory
> management anywhere, don't we?

It can be a sync_file, so you can queue up the next rendering targeting
the old backbuffer right away. On memory constraint devices where
triple-buffering is prohibitive this is apparently a pretty cool trick or
something like that.

> > So you have to do an uapi change here. At that point we might as well do
> > it right.
> 
> I mean in the worst case we might need to allow user fences with sync_files
> as well when that is really used outside of Android.
> 
> But I still don't see the fundamental problem here.

Making sync_file use implicit is more pain, it becomes sprawling pretty
quickly.

Anyway I think we're just turning in circles. My take is that your patch
series here demonstrates nothing beyond "adding function calls that do
nothing is easy", the real deal is in making it work. And I think it's
easier to make this all work with explicit userspace fencing first and
then worry about how we maybe make this work implicitly. Instead of what
you propose, which is rig up a lot of scaffolding without having any idea
whether it's even in the right place. That seems very backwards to me.

Plus I really don't like retro-fitting userspace fences into implicit sync
and sync_file and everything. But that's not the main issue I have here.
-Daniel

> 
> Regards,
> Christian.
> 
> > Of course if you only care about some specific compositors (or maybe only
> > the -amdgpu Xorg driver even) then this isn't a concern, but atomic is
> > cross-driver so we can't do that. Or at least I don't see a way how to do
> > this without causing endless amounts of fun down the road.
> > 
> > > > So I have a plan here, what was yours?
> > > As far as I see that should still work perfectly fine and I have the strong
> > > feeling I'm missing something here.
> > > 
> > > > > Transporting fences between processes is not the fundamental problem here,
> > > > > but rather the question how we represent all this in the kernel?
> > > > > 
> > > > > In other words I think what you outlined above is just approaching it from
> > > > > the wrong side again. Instead of looking what the kernel needs to support
> > > > > this you take a look at userspace and the requirements there.
> > > > Uh ... that was my idea here? That's why I put "build userspace fences in
> > > > userspace only" as the very first thing. Then extend to winsys and
> > > > atomic/display and all these cases where things get more tricky.
> > > > 
> > > > I agree that transporting the fences is easy, which is why it's not
> > > > interesting trying to solve that problem first. Which is kinda what you're
> > > > trying to do here by adding implicit userspace fences (well not even that,
> > > > just a bunch of function calls without any semantics attached to them).
> > > > 
> > > > So if there's more here, you need to flesh it out more or I just dont get
> > > > what you're actually trying to demonstrate.
> > > Well I'm trying to figure out why you see it as such a problem to keep
> > > implicit sync around.
> > > 
> > > As far as I can tell it is completely octagonal if we use implicit/explicit
> > > and dma_fence/user_fence.
> > > 
> > > It's just a different implementation inside the kernel.
> > See above. It falls apart with the atomic ioctl.
> > -Daniel

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
