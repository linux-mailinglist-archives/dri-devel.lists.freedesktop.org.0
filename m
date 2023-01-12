Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C973E666BE4
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jan 2023 08:56:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB38810E88B;
	Thu, 12 Jan 2023 07:56:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x549.google.com (mail-pg1-x549.google.com
 [IPv6:2607:f8b0:4864:20::549])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D83010E88B
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Jan 2023 07:56:35 +0000 (UTC)
Received: by mail-pg1-x549.google.com with SMTP id
 g18-20020a63f412000000b004aef17e314cso6231413pgi.21
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Jan 2023 23:56:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=to:from:subject:message-id:references:mime-version:in-reply-to:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Vg6nAgYjZ4wYYlTqMF3jbo791ipG8SuFLzs8v41dmTI=;
 b=kL0UvQite/urbN7Yp3NlzfzFTECRjRM1K7T5g4ZxG3zHylBlslAyzr6qxrAi9aysJM
 RDeACOZIgRrgriXoR4Pb3FUm6siAnl76A15BakL+7xmzzyJYvBrIKvFGmqzOdrHuLyHw
 eLCWL5a84U7mTNiiuZkhyyW//9BsTntHFbTMWG3xqNxmoxumrT4tac24HiqQmCacQxb7
 hWUb45XPnPy09DrO6jQeVMIxbVjfhO/QXKCL83ehtKjjTMjBps8fFK6gPa75SmpeTyw8
 vcf4DzdsP5Yv5ETLXzCGGp7Lotol2entUVESDqjWMyWKfU3XQsKSss8PleO3BkZomuWi
 ioIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:from:subject:message-id:references:mime-version:in-reply-to:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Vg6nAgYjZ4wYYlTqMF3jbo791ipG8SuFLzs8v41dmTI=;
 b=KBpE8aAkBAJpWUyXPwqD7hwX3BUt6L/6edbzwo271xZ/XmOPj7apkj5smekmkLBWUr
 oOPV1pVkd6aoHQGFux1Posc2NPbEPuNz9P/PuzwIOPoZOGOtDkXicHd/9ZTHugqCZUI3
 ftQiItDOpNBT5nPr1ilxI0uN3SQmfeTYUj/7Q6mjDGLpleKgZc7tK4HpWvt/xXw9PBGZ
 C0Cz4aVIm1+1KGLyES7QkXo8MRkS/H5wIJhNWdG5LSQAYRo+t65GGnx9XM/beY7Arsl4
 AHfJPfutBuK44k7MS6TLYIeGj7nfUE9WhE1D5DfbpH/sqQWrZpb5Wo4UL7SYElADo/KS
 u+HA==
X-Gm-Message-State: AFqh2kqZx4c38nceyxXKdjxA/nF+HNA5aByEaTP+IFsBHky3jrby2Opt
 B0JmsyUjayS08HvBZ4joas0xkWDbR0+85Q==
X-Google-Smtp-Source: AMrXdXv29WhmagcsXxW5VJTVWoRrJdV9U6Gev8NYUGOd+PwEKkvAbufkJGb0qU84S3rueo4liZ5Ei6F1OKpY1Q==
X-Received: from shakeelb.c.googlers.com
 ([fda3:e722:ac3:cc00:7f:e700:c0a8:262e])
 (user=shakeelb job=sendgmr) by 2002:a62:1488:0:b0:581:85ab:16b3 with SMTP id
 130-20020a621488000000b0058185ab16b3mr4558933pfu.67.1673510194669; Wed, 11
 Jan 2023 23:56:34 -0800 (PST)
Date: Thu, 12 Jan 2023 07:56:31 +0000
In-Reply-To: <Y78+rfzXPq5XGs9O@phenom.ffwll.local>
Mime-Version: 1.0
References: <20230109213809.418135-1-tjmercier@google.com>
 <CALvZod4ru7F38tAO-gM9ZFKaEhS0w3KqFbPwhwcTvgJs4xMUow@mail.gmail.com>
 <Y78+rfzXPq5XGs9O@phenom.ffwll.local>
Message-ID: <20230112075631.wc6fd54ci55drhkp@google.com>
Subject: Re: [PATCH 0/4] Track exported dma-buffers with memcg
From: Shakeel Butt <shakeelb@google.com>
To: "T.J. Mercier" <tjmercier@google.com>, Tejun Heo <tj@kernel.org>, 
 Zefan Li <lizefan.x@bytedance.com>, Johannes Weiner <hannes@cmpxchg.org>, 
 Jonathan Corbet <corbet@lwn.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Arve =?utf-8?B?SGrDuG5uZXbDpWc=?=" <arve@android.com>,
 Todd Kjos <tkjos@android.com>, Martijn Coenen <maco@android.com>, 
 Joel Fernandes <joel@joelfernandes.org>, Christian Brauner <brauner@kernel.org>,
 Carlos Llamas <cmllamas@google.com>, Suren Baghdasaryan <surenb@google.com>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 "Christian =?utf-8?B?S8O2bmln?=" <christian.koenig@amd.com>,
 Michal Hocko <mhocko@kernel.org>, 
 Roman Gushchin <roman.gushchin@linux.dev>, Muchun Song <muchun.song@linux.dev>,
 Andrew Morton <akpm@linux-foundation.org>, Paul Moore <paul@paul-moore.com>, 
 James Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>, 
 Stephen Smalley <stephen.smalley.work@gmail.com>,
 Eric Paris <eparis@parisplace.org>, 
 android-mm@google.com, jstultz@google.com, cgroups@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linaro-mm-sig@lists.linaro.org, linux-mm@kvack.org, 
 linux-security-module@vger.kernel.org, selinux@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
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

On Wed, Jan 11, 2023 at 11:56:45PM +0100, Daniel Vetter wrote:
> 
[...]
> I think eventually, at least for other "account gpu stuff in cgroups" use
> case we do want to actually charge the memory.
> 
> The problem is a bit that with gpu allocations reclaim is essentially "we
> pass the error to userspace and they get to sort the mess out". There are
> some exceptions (some gpu drivers to have shrinkers) would we need to make
> sure these shrinkers are tied into the cgroup stuff before we could enable
> charging for them?
> 

No, there is no requirement to have shrinkers or making such memory
reclaimable before charging it. Though existing shrinkers and the
possible future shrinkers would need to be converted into memcg aware
shrinkers.

Though there will be a need to update user expectations that if they 
use memcgs with hard limits, they may start seeing memcg OOMs after the
charging of dmabuf.

> Also note that at least from the gpu driver side this is all a huge
> endeavour, so if we can split up the steps as much as possible (and get
> something interim useable that doesn't break stuff ofc), that is
> practically need to make headway here. 

This sounds reasonable to me.
