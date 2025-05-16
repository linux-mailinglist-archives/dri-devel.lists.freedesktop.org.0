Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E6B1ABA0E2
	for <lists+dri-devel@lfdr.de>; Fri, 16 May 2025 18:42:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8236410EB23;
	Fri, 16 May 2025 16:41:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=cmpxchg-org.20230601.gappssmtp.com header.i=@cmpxchg-org.20230601.gappssmtp.com header.b="Zrk0+xoX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com
 [209.85.222.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFA5010EB23
 for <dri-devel@lists.freedesktop.org>; Fri, 16 May 2025 16:41:56 +0000 (UTC)
Received: by mail-qk1-f175.google.com with SMTP id
 af79cd13be357-7c5675dec99so233637085a.0
 for <dri-devel@lists.freedesktop.org>; Fri, 16 May 2025 09:41:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cmpxchg-org.20230601.gappssmtp.com; s=20230601; t=1747413716; x=1748018516;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=5J2wC9tTnCntXNvDVkFSqpJ+5OZHuJw2jDGcRFbaOU0=;
 b=Zrk0+xoXhf1gEumOx2M6XvwmB0H4wgly7MO0UWQKSHqi28+lP8SUK8cDCB3WkT6RbU
 2Up/nfi4d7d7lnToKukyg0BhfoB3VxMdCEiDvwAhTZ7csAHUZDyYSY0W00yz5mhPCr2x
 dkCFTu57l6yggWrzTMftHcu6d2u/sJgnn4Y3o9QGMik+JZ3ga1mlNHqzrH0HgMPac+op
 AtTO2bUnkf82hnmDZmvuYu/zVHXjhpCOz/QO7pY14965Tlq6BnsUxKLgPpJKdRzOFIBm
 AZhdlXfSrmB9BRMH/C4uzF2QrQ2Rni5AiIm11V8ujzMyFnaa0ixU23KH/NoMup8Zj4cQ
 PCoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747413716; x=1748018516;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5J2wC9tTnCntXNvDVkFSqpJ+5OZHuJw2jDGcRFbaOU0=;
 b=omdogVOc4bm292OICkeMkYAz995jiWPEKgN6QnFiwnxJgQqXlw209XtnONmWGX3GIn
 SVBEKpsQRBLs5QpkIHyVHrVmePbjJc2tZzXHCFer3yjz/dfuQVKhlVK5Zt63s6hRF7pY
 YS3gpeLvUtbW46KjvUtIXXjaGc0cNaT/cde6fyvSWHfWCWgpEpe88Cg6q/rUO8wRpUN2
 Juku79mDUiQb/ITj6nYEZkgJAca0idgiNrJ2ndStMPzmpnRiICJoVlFpQaQmXBsEQFRo
 XSkKd5udLeniKHpGWZntAvLvUFcUHtH7MgdTf5Fdfa+kXbkXuqhevBnPmBXND1CP0Ft0
 pmoQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXqMr893STq4kMASdYNUYx0XBPy3vPNsHdSZxugZVYoLwdeh+dwR/LGABo0VE6T6wzQ3ZowxP2Xtj8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxijqb4MBkh0fuZqrQtoa/XOwynFGMMp1q7sD2SAJ0GZuT6jKYT
 jvnBcPM0pBiHkEPDfm/wdZ4bFkxs4fd+xQE01KP3TROZSlPr2Pd6pUmn6zhb7SXCFv6SE5s19N5
 W9fZqtr8=
X-Gm-Gg: ASbGncvPBzsXTlfralqsg7iJZGDGId8NEv52YrfAexBv66XoKg6Qivzj+Azvq0P10+p
 XsjBBIIYFbl/5193qsDCNe2KGUI9Eequjji71uW6YwYVkJOLC3AxNDaSjxwl5FtENlG3JljQIbK
 rbA7TWhfVyzcw9VATdf8thwzEVTGNO2Ex+Kos7Fz3ZAHH/+JEUf71AcYcwKfOvtmEMOSb3koa/h
 Rw2YcraRk5dxCAbw4Y1PchNKBYOIfr5HfF8ldjH0/71l5MOSWkg1fUu0oRhAjz6+Lp6U8aPimRj
 cc1FtgC0NdE/Ez1dCFoIoCFHnl0WGT0jWaZGT7PcFBXW6wbHeA==
X-Google-Smtp-Source: AGHT+IEtBMFIFAv7ssiv8r9xyjjpS4y6HGWSwusporLTNbSdncvwuVbb9EkCbAuPsKwJEg/pHlYsqQ==
X-Received: by 2002:a05:620a:4015:b0:7c7:c772:7442 with SMTP id
 af79cd13be357-7cd4672dbd2mr523716785a.20.1747413715739; 
 Fri, 16 May 2025 09:41:55 -0700 (PDT)
Received: from localhost ([2603:7000:c01:2716:365a:60ff:fe62:ff29])
 by smtp.gmail.com with UTF8SMTPSA id
 6a1803df08f44-6f8b0966098sm13924376d6.82.2025.05.16.09.41.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 May 2025 09:41:54 -0700 (PDT)
Date: Fri, 16 May 2025 12:41:50 -0400
From: Johannes Weiner <hannes@cmpxchg.org>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Cc: Dave Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org,
 tj@kernel.org, Michal Hocko <mhocko@kernel.org>,
 Roman Gushchin <roman.gushchin@linux.dev>,
 Shakeel Butt <shakeel.butt@linux.dev>,
 Muchun Song <muchun.song@linux.dev>, cgroups@vger.kernel.org,
 Waiman Long <longman@redhat.com>, simona@ffwll.ch
Subject: Re: [rfc] drm/ttm/memcg: simplest initial memcg/ttm integration (v2)
Message-ID: <20250516164150.GD720744@cmpxchg.org>
References: <20250502034046.1625896-1-airlied@gmail.com>
 <20250507175238.GB276050@cmpxchg.org>
 <CAPM=9tw0hn=doXVdH_hxQMvUhyAQvWOp+HT24RVGA7Hi=nhwRA@mail.gmail.com>
 <20250513075446.GA623911@cmpxchg.org>
 <CAPM=9txLcFNt-5hfHtmW5C=zhaC4pGukQJ=aOi1zq_bTCHq4zg@mail.gmail.com>
 <b0953201-8d04-49f3-a116-8ae1936c581c@amd.com>
 <20250515160842.GA720744@cmpxchg.org>
 <bba93237-9266-4e25-a543-e309eb7bb4ec@amd.com>
 <20250516145318.GB720744@cmpxchg.org>
 <5000d284-162c-4e63-9883-7e6957209b95@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5000d284-162c-4e63-9883-7e6957209b95@amd.com>
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

On Fri, May 16, 2025 at 05:35:12PM +0200, Christian König wrote:
> On 5/16/25 16:53, Johannes Weiner wrote:
> > On Fri, May 16, 2025 at 08:53:07AM +0200, Christian König wrote:
> >> The cgroup who originally allocated it has no reference to the
> >> memory any more and also no way of giving it back to the core
> >> system.
> > 
> > Of course it does, the shrinker LRU.
> 
> No it doesn't. The LRU handling here is global and not per cgroup.

Well, the discussion at hand is that it should be.

> > Listen, none of this is even remotely new. This isn't the first cache
> > we're tracking, and it's not the first consumer that can outlive the
> > controlling cgroup.
> 
> Yes, I knew about all of that and I find that extremely questionable
> on existing handling as well.

This code handles billions of containers every day, but we'll be sure
to consult you on the next redesign.

> Memory pools which are only used to improve allocation performance
> are something the kernel handles transparently and are completely
> outside of any cgroup tracking whatsoever.

You're describing a cache. It doesn't matter whether it's caching CPU
work, IO work or network packets.

What matters is what it takes to recycle those pages for other
purposes - especially non-GPU purposes.

And more importantly, *what other memory in other cgroups they
displace in the meantime*.

It's really not that difficult to see an isolation issue here.

Anyway, it doesn't look like there is a lot of value in continuing
this conversation, so I'm going to check out of this subthread.
