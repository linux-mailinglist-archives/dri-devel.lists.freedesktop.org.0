Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA4E269B33F
	for <lists+dri-devel@lfdr.de>; Fri, 17 Feb 2023 20:42:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3758610E1CF;
	Fri, 17 Feb 2023 19:42:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5E7A10E1CF
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Feb 2023 19:42:24 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id 12so1662293wmk.2
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Feb 2023 11:42:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=Vl+zQvB/6cwxY0Yyf39ZRPqTyTazNhl17olswH5t6jY=;
 b=gowmS8I5/Rq19ImSMrR0MNzmwOBHIquicud3L6Gp6FlIik+mWbHu8Ena9PwB0mc1sb
 VfEa7yO3BQ5Jh0/yeL1q1JYfe7o2J5pdPeYsFRfLX5y5RM51oCTS7aPxWW+Lgo8ObqC6
 mza4FzyGgYMhetuQ8BZOFTD/aOKKvXO+fy4xM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Vl+zQvB/6cwxY0Yyf39ZRPqTyTazNhl17olswH5t6jY=;
 b=ctIqhogRHbhA1ni96w1V8LEyJpKC4TtFRFbpgyu78YEml84IJiLqOdMG/gf2620S4O
 JHw/sj0cKDdqZ+w75zqJA+C4cHfDqPltMwu8EYE5fBBFUn64G30wXvxR2m+YRmacCX+U
 ebVj4WGNUUQQHQP3inJfZl/c2xobxfkUHpcx2bKPHJKaQG/3HzE1BmvngScQA0jnUouX
 aNCWNspkZARLy1nvMb8I3GEXo5B/lF3ILPFKtYjDS3ONjpwAQXo7sE0AqjLJdY4uyJeu
 VnLAgR9XNSxMWwogCe9eDjH50HDSQexbyZ8fvqywzACknNoXGK2OYvuXvN6JKSOG+bUK
 fEEg==
X-Gm-Message-State: AO0yUKUKbAk7BW8O/z/CggIyYcuEtb13S1bnemx3vE3Knopr6TGnFhKF
 IgkSvCMQBbbuzo51nk/ZzJ4ApA==
X-Google-Smtp-Source: AK7set8jH8w2A48gCabPFeS/iXdGBbU7N37pRtXynBzZnZGMq9e/8mpHPFW8iiPbGBSl3+zAKkWL2A==
X-Received: by 2002:a05:600c:1ca1:b0:3e1:bfc:f57b with SMTP id
 k33-20020a05600c1ca100b003e10bfcf57bmr2189106wms.2.1676662943231; 
 Fri, 17 Feb 2023 11:42:23 -0800 (PST)
Received: from phenom.ffwll.local (212-51-149-33.fiber7.init7.net.
 [212.51.149.33]) by smtp.gmail.com with ESMTPSA id
 n12-20020a05600c294c00b003dc42d48defsm5810427wmd.6.2023.02.17.11.42.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Feb 2023 11:42:22 -0800 (PST)
Date: Fri, 17 Feb 2023 20:42:16 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Subject: Re: [PATCH 3/3] drm/debugfs: remove dev->debugfs_list and
 debugfs_mutex
Message-ID: <Y+/YmK32UYNlQR52@phenom.ffwll.local>
References: <20230209081838.45273-4-christian.koenig@amd.com>
 <Y+4UdBzk6RkQzcsI@phenom.ffwll.local>
 <20230216163757.GK2849548@linux.intel.com>
 <87lekxzgih.fsf@intel.com>
 <20230217103501.GC2862577@linux.intel.com>
 <871qmozhve.fsf@intel.com>
 <20230217113621.GD2862577@linux.intel.com>
 <5c6fe661-9e96-d122-1a7a-110ecbd8a6c6@gmail.com>
 <87r0uoxyby.fsf@intel.com>
 <17f64e37-4ad4-d42d-ce0b-175f01a24957@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <17f64e37-4ad4-d42d-ce0b-175f01a24957@amd.com>
X-Operating-System: Linux phenom 6.0.0-6-amd64 
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
Cc: mairacanal@riseup.net, daniel.vetter@ffwll.ch, mcanal@igalia.com,
 dri-devel@lists.freedesktop.org, mwen@igalia.com,
 Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
 wambui.karugax@gmail.com, maxime@cerno.tech
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Feb 17, 2023 at 04:55:27PM +0100, Christian König wrote:
> Am 17.02.23 um 13:37 schrieb Jani Nikula:
> > On Fri, 17 Feb 2023, Christian König <ckoenig.leichtzumerken@gmail.com> wrote:
> > > If i915 have such structural problems then I strongly suggest to solve
> > > them inside i915 and not make common code out of that.
> > All other things aside, that's just a completely unnecessary and
> > unhelpful remark.
> 
> Sorry, but why?
> 
> We have gone through the same problems on radeon and it was massively
> painful, what I try here is to prevent others from using this bad design as
> well. And yes I think devm_ and drmm_ is a bit questionable in that regard
> as well.
> 
> The goal is not to make it as simple as possible to write a driver, but
> rather as defensive as possible. In other words automatically releasing
> memory when an object is destroyed might be helpful, but it isn't
> automatically a good idea.
> 
> What can easily happen for example is that you run into use after free
> situations on object reference decommissions, e.g. parent is freed before
> child for example.

I know that radeon/amd are going different paths on this, but I think it's
also very clear that you're not really representing the consensus here.
For smaller drivers especially there really isn't anyone arguing against
devm/drmm.

Similar for uapi interfaces that just do the right thing and prevent
races. You're the very first one who argued this is a good thing to have.
kernfs/kobj/sysfs people spend endless amounts of engineer on trying to
build something that's impossible to get wrong, or at least get as close
to that as feasible.

I mean the entire rust endeavour flies under that flag too.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
