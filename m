Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5334B793A93
	for <lists+dri-devel@lfdr.de>; Wed,  6 Sep 2023 13:02:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6254C10E5FF;
	Wed,  6 Sep 2023 11:02:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 363FC10E604
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Sep 2023 11:02:46 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-400e8ab9325so9326665e9.1
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Sep 2023 04:02:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1693998164; x=1694602964; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=erX1AkqqONpHzHSZQ0jG3lVYaBKEyf1Ip4MnubYb0fI=;
 b=QNTDuYdNJEKyxrbAD/pDA1JrnHsP99G9xxKqP386vPmOZLhEanN18RtwflWWt/OV1l
 +QKNBkQqI9GmAxi8wYByVUsCP1nmHrwaIh49ZmwBV09zhMWoeaAQ1LE2SWy8bskwa5vy
 gmg3qxILVm8oJvt4UbdWukdZTIyJRU+6tjtPs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693998164; x=1694602964;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=erX1AkqqONpHzHSZQ0jG3lVYaBKEyf1Ip4MnubYb0fI=;
 b=O+y11a6Q8hfv3r1lj+1YEEl6mqFY1BL/9S1otJgD/+XDe9SqRsNjTWxI4XhWZXDgV6
 MIbK3EqSes0P+wPEBkBoEHcMeAxhc5JFB+PxClPZLHNeXFaeS3+V7Dmuu3++9dAJnbz5
 v6amI3+LNV9nvDkeBLkUL/JqPK1FZMpnqRJVGuWtEVYMFS3P+dSy9oanXGjsm2qgcHzt
 Cy9iT2FQUNlt5HfHOg0QMVmooq2TOIWfBk4AWMArgnEbbxDq4+BOu9gZB07nC45vispg
 7acXTfIgC/UcMxxLeXJPF8bzrj/0p7wJ8c6R9jrge63pCsAgDp5PSQ4ep1P+hj8jld4C
 HOGg==
X-Gm-Message-State: AOJu0Yzb9QiP9MnXYdpvEZOY6LmN3UJXv4s6ThXJeDnMfpo6SSZSYMdk
 2NuPbKR4pNa2f/EhMSNscQaT/w==
X-Google-Smtp-Source: AGHT+IHNSidUedPswTBfuyMWzLN3H5WFXzPvMwIszFBJfRMA7I8jbFBGNHQNa4t/0LX0j7p+f9YeEA==
X-Received: by 2002:a05:600c:1c24:b0:3fe:dd78:8fbc with SMTP id
 j36-20020a05600c1c2400b003fedd788fbcmr12552447wms.3.1693998164243; 
 Wed, 06 Sep 2023 04:02:44 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 r19-20020a05600c299300b003fe539b83f2sm22486449wmd.42.2023.09.06.04.02.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Sep 2023 04:02:43 -0700 (PDT)
Date: Wed, 6 Sep 2023 13:02:41 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Jani Nikula <jani.nikula@linux.intel.com>
Subject: Re: [Intel-gfx] [PATCH v5] drm/i915: Avoid circular locking
 dependency when flush delayed work on gt reset
Message-ID: <ZPhcUQrROMrftxfr@phenom.ffwll.local>
References: <20230811182011.546026-1-zhanjun.dong@intel.com>
 <3a745c83-e7cf-6a24-5556-8c0c019adfec@intel.com>
 <ZOYtNyqfvqJPeqq2@phenom.ffwll.local>
 <e31b1f49-88cd-d6e4-abbe-51f27712ff83@intel.com>
 <ZPCc4CU+S6Gv6GzQ@ashyti-mobl2.lan>
 <983eb186-5b6a-8df3-1e67-eb7da6a8dbcd@intel.com>
 <ZPhDqTusn9FYY8qV@ashyti-mobl2.lan> <87jzt3hb3d.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87jzt3hb3d.fsf@intel.com>
X-Operating-System: Linux phenom 6.4.0-3-amd64 
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
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 John Harrison <john.c.harrison@intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Sep 06, 2023 at 01:04:06PM +0300, Jani Nikula wrote:
> On Wed, 06 Sep 2023, Andi Shyti <andi.shyti@linux.intel.com> wrote:
> > It's the developer's responsibility to test its code with
> > debug_lockdep and fix all the potential deadlocks and ignore the
> > false ones.
> 
> No. Manual validation of lockdep reports is not feasible. Lockdep is the
> tool to validate locking. It's the developer's responsibility to make
> lockdep understand the design.

Yeah I guess I need to drop my locking design principle once more:

If lockdep doesn't understand your locking design, your design is shit.

You need to fix the design, not play whack-a-mole with lockdep. Or worse,
pretend there's no problem and just disable lockdep outright.

If you don't understand your design, and can't succinctly explain it (or
demonstrate the full hierarchy with lockdep priming, testing in CI isn't
good enough for anything remotely complex), then you have a _really_ big
problem. Yes CI is good at catching accidental changes in locking design,
but if you use it for anything more than that you're in deep trouble.

Cheers, Sima
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
