Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AD1652948AB
	for <lists+dri-devel@lfdr.de>; Wed, 21 Oct 2020 09:16:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C69E66E976;
	Wed, 21 Oct 2020 07:16:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com
 [IPv6:2607:f8b0:4864:20::1043])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4591E6EC4A
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Oct 2020 11:24:17 +0000 (UTC)
Received: by mail-pj1-x1043.google.com with SMTP id p21so758820pju.0
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Oct 2020 04:24:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=rTNS0r1ZbZNkLyFUEQ/iIWxtqaA40PYGtHZsuJiDCcM=;
 b=lmdA0vZcj+gZ1N8Z10STVszxUkjLEFOgixTZSc1eGkqCzwK1uhJ84SarFjT733XzT1
 lRIYiuu6c2to5PmKYINoXAr3CZgaHbvvrViof7FKOZVXy16u4Op+zo0G8PQqXnAolNnQ
 Ez4ynljhCkVMP6Z9EgoZ13aV5pDmU8pPr28YUsh8PJDrrPb8sFHBtNuhCUW1Nt+vpTZg
 Avw7ELL7Mo6Nfrp0aTI1LXdUgnv1+p3hRndqOaYdnZ8MDh6xsDiorg6hokf1rGCM4cJh
 bQjjzse/pqj5beP5D0fgow0PbmGCnAekWihGbD/fXvXyjig6FI7LSnOR1SKmYp5b9UMc
 IDYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=rTNS0r1ZbZNkLyFUEQ/iIWxtqaA40PYGtHZsuJiDCcM=;
 b=YY40Enl7cmNNJqHiyVZdQSogBTR/GVGBRk27pg2HOWyrS9+Z9LdVZn8A3PEYOhwqHG
 OduyhRu9WjppB9N5fM/vRx9cZbZnxpnYobRvkZX6sF9OU6V+aausylPrRWGf0nmCs5Vw
 wf6djZ5T4yO19QY92gya88IWHWbf26tLwVYxTqS9Lpymf64U5DppZcnw5JcmUGrNMpEN
 HUK4fBJAQ+tmVsswJGU3IlYlKQOpn0ScvrKjwGgNKrhb9Qa4kKh2WL/JsYQbjWBOhRtl
 +D4WfunJQEDx5Vp+gd8uIxdEXRu+xq5OXClBwR8xY+o3yumey/CMK9fpOSPrzRErlSt9
 aIow==
X-Gm-Message-State: AOAM533+Box1ZHjWWkZ7N7OlAIiyFC4GH0eEdL8ENK8j7jCewvpHBv0x
 rma//uKMHoyn4VFK6dk5NYLw4Q==
X-Google-Smtp-Source: ABdhPJxiKN8vYDR35svXlvXCDZWliSZkknnCW89y9BP+j1N1wNwI4v+gtfsW8+8fhi+ND0fGzlcE+A==
X-Received: by 2002:a17:902:ee8b:b029:d3:f156:eefc with SMTP id
 a11-20020a170902ee8bb02900d3f156eefcmr703577pld.19.1603193056837; 
 Tue, 20 Oct 2020 04:24:16 -0700 (PDT)
Received: from localhost ([122.181.54.133])
 by smtp.gmail.com with ESMTPSA id y4sm1714126pjc.53.2020.10.20.04.24.14
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 20 Oct 2020 04:24:15 -0700 (PDT)
Date: Tue, 20 Oct 2020 16:54:13 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH v2 07/22] drm/msm: Do rpm get sooner in the submit path
Message-ID: <20201020112413.xbk2vow2kgjky3pb@vireshk-i7>
References: <20201012020958.229288-1-robdclark@gmail.com>
 <20201012020958.229288-8-robdclark@gmail.com>
 <20201012143555.GA438822@phenom.ffwll.local>
 <CAF6AEGstGtBswUUiyHxT2cCm8NwZekDnMzD0J_pQH37GwS=LiA@mail.gmail.com>
 <20201020090729.qgqish5kqamhvatj@vireshk-i7>
 <CAKMK7uHAgVUPHOPxDdt3LeAWqokxfuzqjZj4qqFkoKxFbRbRrg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKMK7uHAgVUPHOPxDdt3LeAWqokxfuzqjZj4qqFkoKxFbRbRrg@mail.gmail.com>
User-Agent: NeoMutt/20180716-391-311a52
X-Mailman-Approved-At: Wed, 21 Oct 2020 07:16:42 +0000
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
 "open list:DRM DRIVER FOR MSM ADRENO GPU"
 <freedreno@lists.freedesktop.org>, "Menon, Nishanth" <nm@ti.com>,
 David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 20-10-20, 12:56, Daniel Vetter wrote:
> Yeah that's bad practice. Generally you shouldn't need to hold locks
> in setup/teardown code, since there's no other thread which can
> possible hold a reference to anything your touching anymore. Ofc
> excluding quickly grabbing/dropping a lock to insert/remove objects
> into lists and stuff.
> 
> The other reason is that especially with anything related to sysfs or
> debugfs, the locking dependencies you're pulling in are enormous: vfs
> locks pull in mm locks (due to mmap) and at that point there's pretty
> much nothing left you're allowed to hold while acquiring such a lock.
> For simple drivers this is no issue, but for fancy drivers (like gpu
> drivers) which need to interact with core mm) this means your
> subsystem is a major pain to use.
> 
> Usually the correct fix is to only hold your subsystem locks in
> setup/teardown when absolutely required, and fix any data
> inconsistency issues by reordering your setup/teardown code: When you
> register as the last step and unregister as the first step, there's no
> need for any additional locking. And hence no need to call debugfs
> functions while holding your subsystem locks.
> 
> The catch phrase I use for this is "don't solve object lifetime issues
> with locking". Instead use refcounting and careful ordering in
> setup/teardown code.

This is exactly what I have done in the OPP core, the locks were taken
only when really necessary, though as we have seen now I have missed
that at a single place and that should be fixed as well. Will do that,
thanks.

-- 
viresh
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
