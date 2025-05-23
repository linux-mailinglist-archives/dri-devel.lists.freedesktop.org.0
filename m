Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ED0FAC1CFC
	for <lists+dri-devel@lfdr.de>; Fri, 23 May 2025 08:29:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B234710E70B;
	Fri, 23 May 2025 06:29:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="JuDxQ2Ov";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3663310E1ED;
 Fri, 23 May 2025 06:29:01 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 19EAF5C6DC5;
 Fri, 23 May 2025 06:26:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 729BDC4CEE9;
 Fri, 23 May 2025 06:28:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1747981736;
 bh=3tqexcS7D6IOEMJ2g2Hd2+uXohr3B3skFKzTrgnzjeg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=JuDxQ2Ov380+IKk6qsxkM74ACiMV8IlKBtx0HuJSsl0m/FGuyD/M4hzcydT7P6V9+
 4owr+lKIgofUesPXNE7RYHCrTtao5YWPYw+nY9I3tSj/lX13yZ7qAN1gkCJqOByC2A
 MMklTTusk0J9g2TejR+4CiZ/2zw8vUo0lPu6QqYu8zFf1cfqqvTMbyDcbxvMnF/j9Y
 i5WBG4PCefDjDfjRzoFSHFRTM0xnY1nYFQ5omqybdO7pZJJKwipMEfj8tYhxzwjOEi
 W4Nf4krPXbix0cvcCdF8o3SxrwoHOcdIU8pPbIzqv6SjWGuOb7cCEDoz6GK+lkWzZR
 3TK0L8CAweDbA==
Date: Fri, 23 May 2025 08:28:51 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Rob Clark <robdclark@gmail.com>
Cc: Dave Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Connor Abbott <cwabbott0@gmail.com>, Rob Clark <robdclark@chromium.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Simona Vetter <simona@ffwll.ch>,
 open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 01/40] drm/gpuvm: Don't require obj lock in destructor
 path
Message-ID: <aDAVo-dle3wgFiJb@pollux>
References: <aCWueFzx2QzF7LVg@pollux>
 <CAF6AEGu9MPxKnkHo45gSRxaCP+CTzqsKZjiLuy4Ne4GbrsStGA@mail.gmail.com>
 <aCYqlvp_T77LyuMa@pollux>
 <CAF6AEGsOTNedZhuBzipSQgNpG0SyVObaeq+g5U1hGUFfRYjw8w@mail.gmail.com>
 <aCb-72KH-NrzvGXy@pollux>
 <CAF6AEGu=KzCnkxuUsYvCHBGwo-e2W16u_cRT1NFAXLphty1_ig@mail.gmail.com>
 <CAPM=9tzcvDVDOM88O8oqDHURR1nbR7KsFStavNnT1CN6C6kGgg@mail.gmail.com>
 <CAF6AEGuv3GXTBcU99sBjAa5gPOSNoxwY+eiPy=Q--cLYHVn+cw@mail.gmail.com>
 <CAPM=9tykCXSKOH0BcMkNLKyCWfEN-kCjs0U7UA+C1pPqFr1jLA@mail.gmail.com>
 <CAF6AEGuK+X4Q=Z-anjQuUBi952eYSs3u9HxVz0GSQM8fokdiiw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAF6AEGuK+X4Q=Z-anjQuUBi952eYSs3u9HxVz0GSQM8fokdiiw@mail.gmail.com>
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

On Thu, May 22, 2025 at 07:51:50PM -0700, Rob Clark wrote:
> So if you _really_ don't like the WEAK_REF flag, I have a workable alternative
> that addresses the performance problems.

The mode you want to introduce is broken, and I don't understand why you don't
want to accept that.

  1. It obviously breaks some features, which is why you have to add lots of
     WARN_ON() calls to the corresponding code paths, such that drivers won't
     call into them any more.
  2. It requires conditionals based on kref_read(), which is oviously racy, and
     can cause UAF bugs.
  3. I'm sure, if we look closely, we'll find more subtle bugs, because GPUVM
     was designed with a clear ownership and lifetime model, that this mode
     undermines entirely.

The only reason why your MSM implementation does not run into trouble is because
it upholds certain contitions such that the racy kref_read() code does not cause
issues.

So, we would need to document all those extra requirements that drivers would
need to uphold using this mode, which eliminates more perfectly normal use
cases, that people expect to just work, one example for that would be to have
the same GEM object in multiple VMs.

This would be a huge mess and a mode full of footguns for drivers, and hence a
NACK from my side.
