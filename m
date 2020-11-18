Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D3D662B77F1
	for <lists+dri-devel@lfdr.de>; Wed, 18 Nov 2020 09:02:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 214546E415;
	Wed, 18 Nov 2020 08:02:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com
 [IPv6:2607:f8b0:4864:20::1043])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 000556E2E6
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Nov 2020 05:28:32 +0000 (UTC)
Received: by mail-pj1-x1043.google.com with SMTP id js21so452225pjb.0
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Nov 2020 21:28:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=i7NQcmg0sYY8A0xlzCx+NZowN/eNGNUoVY/o8X/i+jY=;
 b=HVHOpkt/qqNt9sE6chv3U7ohVXbszeie0CQi5JUw5PUCYb4Q8G/UdR3X+kkmQ45kKt
 Em/Cnv12xCd9dU5raew3gzyMlRZ1vSpv2v5EJ2ubv3k25i7cQWfuyJojAKDsfus2pQAw
 L07ZygsSRdwZthKV63A0oOgdzRd7y6vebdXXytZPb+YoVKKa/BR8DxngpQTYRcrGLqcm
 6e31dz04CuMnlD9QbqCaMqbWP3aACS5ya1bCz7VeFlQWY/w2/qJXSGX8O7PywPyTB63R
 iM/93VxE9HYXfTZvbaB+w4XthiYuzpDSk/lxJhpdZ/hCCVoxlEYIGf7DocxfiyqduRJI
 PDlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=i7NQcmg0sYY8A0xlzCx+NZowN/eNGNUoVY/o8X/i+jY=;
 b=EO5zBy+BzQP3q//5nDGJO4q3Xj3Uwy57A0mFhXQsscJBvHfeLOSXLLxUY4atpmuaLT
 9pM4B/ZTUvMGzlWl7wODOgsA2yDDxhUQ12J4zPAWO9E9UYbnx0uCrUGJlS9qlbmMBfoD
 KoxpDhNxVX0OGG4+5uq7uTBFubsI16DZGFHTZvY+hXkYWm/+T6zlwJnCDzeTg6Ru0PBP
 4MF7+PLBwhWkXGTJ8IAHkl/SSLzAEnB9L3doywEJDkJES3hfFSfwA4mXlQWuu4yGgx0k
 4bThPXgRDqlTB1tAjIulmO/Uox8vsAEY0UHuElkEEZ2g+0U/oJojd5OVTHuuG+2yxrb2
 J64w==
X-Gm-Message-State: AOAM531rrA9NExqyz4ASIOiK9GU5/P/B1xCoRwlQZZA55LMzqnRW+e6c
 Pk99/ZF7+OD5KNzWPfuJkMAOkg==
X-Google-Smtp-Source: ABdhPJwE3hBbeNtRV7Zgs+1PM2OnxpXYUaUyaPcW0+rjSjJgGdij1UAnuyebd9b/G+OtrU4TJCHdpA==
X-Received: by 2002:a17:902:8d82:b029:d8:c5e8:9785 with SMTP id
 v2-20020a1709028d82b02900d8c5e89785mr2704949plo.5.1605677312497; 
 Tue, 17 Nov 2020 21:28:32 -0800 (PST)
Received: from localhost ([122.172.12.172])
 by smtp.gmail.com with ESMTPSA id w127sm23328945pfc.172.2020.11.17.21.28.30
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 17 Nov 2020 21:28:31 -0800 (PST)
Date: Wed, 18 Nov 2020 10:58:29 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Rob Clark <robdclark@gmail.com>
Subject: Re: [PATCH v2 07/22] drm/msm: Do rpm get sooner in the submit path
Message-ID: <20201118052829.ugt7i7ac6eqsj4l6@vireshk-i7>
References: <CAF6AEGsCj-AtFozn8d1xiNNFNbuMJ0UxS-eMhBVXiQ7rKahKnQ@mail.gmail.com>
 <20201022080644.2ck4okrxygmkuatn@vireshk-i7>
 <CAF6AEGv6RMCsK4yp-W2d1mVTMcEiiwFGAb+V8rYLhDdMhqP80Q@mail.gmail.com>
 <20201027113532.nriqqws7gdcu5su6@vireshk-i7>
 <20201103054715.4l5j57pyjz6zd6ed@vireshk-i7>
 <CAF6AEGtgUVXm6Wwod0FC38g91Q8CotLFSoC4NmXx7GzcA=1mOA@mail.gmail.com>
 <20201104030353.ny7zvakgb4fsye6r@vireshk-i7>
 <CAF6AEGv215ixcAWmaOWs7UKAqmbMs=aFyTBBYLU-bt8XBnWb7g@mail.gmail.com>
 <20201106071621.j732gt4nqifjrccd@vireshk-i7>
 <CAF6AEGt_wbWuQA7gBw4yn4f2x0SVbfub4eRDX59PCvnd_0uFxg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAF6AEGt_wbWuQA7gBw4yn4f2x0SVbfub4eRDX59PCvnd_0uFxg@mail.gmail.com>
User-Agent: NeoMutt/20180716-391-311a52
X-Mailman-Approved-At: Wed, 18 Nov 2020 08:01:05 +0000
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

On 17-11-20, 09:02, Rob Clark wrote:
> With that on top of the previous patch,

Don't you still have this ? Which fixed the lockdep in the remove path.

https://lore.kernel.org/lkml/20201022080644.2ck4okrxygmkuatn@vireshk-i7/

To make it clear you need these patches to fix the OPP stuff:

//From 5.10-rc3 (the one from the above link).
commit e0df59de670b ("opp: Reduce the size of critical section in _opp_table_kref_release()")

//Below two from linux-next
commit ef43f01ac069 ("opp: Always add entries in dev_list with opp_table->lock held")
commit 27c09484dd3d ("opp: Allocate the OPP table outside of opp_table_lock")

This matches the diff I gave you earlier.

-- 
viresh
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
