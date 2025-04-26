Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4B3DA9DAD7
	for <lists+dri-devel@lfdr.de>; Sat, 26 Apr 2025 14:57:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7747710E09F;
	Sat, 26 Apr 2025 12:57:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="oMuCLQgI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF71D10E09F;
 Sat, 26 Apr 2025 12:57:31 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id DB3005C1660;
 Sat, 26 Apr 2025 12:55:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8C96C4CEE2;
 Sat, 26 Apr 2025 12:57:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1745672242;
 bh=7vnqcVl5ngC2WnVfizhAsL0Eks4mJZUDw7HzflzBWOI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=oMuCLQgIKpLjI+JSbeLr/pxzfWwb4AEqiajhWDjJ/K96eva/VELbmm37Yk2ZYZe7f
 Vg8A7Dl7Zjgf0mc7kjwMiQsm6b4ZS8madUWixIRihiSiQHWNz1WFL2AzHeqi4DiCsk
 PHZYuNER9j2uOXc3BwGq5lOe1SI2GXaW3+4KCI30zojnYZbA22oh7wHXDMX8OaTsGI
 Z+SlxlyLJgNW2M9Mthj/eOHUwv3c1hbqEBkLT1AJ3PhOOygFj23ihq/kTCdsWN/fTV
 ZRjA2efx9Xlpg9m3Yefh/iwXUkWMxLAiPY1+IB629NYJbT/wo3xJK0guh7q46WQ23R
 NFvCyAbiZe0pQ==
Date: Sat, 26 Apr 2025 20:57:08 +0800
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>, airlied@gmail.com,
 corbet@lwn.net, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, jani.nikula@linux.intel.com,
 joonas.lahtinen@linux.intel.com, linux-doc@vger.kernel.org,
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
 maarten.lankhorst@linux.intel.com, masahiroy@kernel.org,
 mripard@kernel.org, nathan@kernel.org, nicolas.schier@linux.dev,
 rodrigo.vivi@intel.com, simona@ffwll.ch, tursulin@ursulin.net,
 tzimmermann@suse.de
Subject: Re: [PATCH v4 0/4] Don't create Python bytecode when building the
 kernel
Message-ID: <20250426205708.4f90a83d@sal.lan>
In-Reply-To: <22d7bca2-cdfb-4e06-acb2-41363ba13333@gmail.com>
References: <cover.1745453655.git.mchehab+huawei@kernel.org>
 <22d7bca2-cdfb-4e06-acb2-41363ba13333@gmail.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

Hi Akira,

Em Sat, 26 Apr 2025 11:39:05 +0900
Akira Yokosawa <akiyks@gmail.com> escreveu:

> Bothering with might-become-incompatilbe-in-the-future python environment
> variables in kernel Makefiles looks over-engineering to me.
> Also, as Mauro says in 3/4, it is incomplete in that it does not cover
> the cases where those scripts are invoked outside of kernel build.
> And it will interfere with existing developers who want the benefit of
> bytecode caching.
> 
> I'm not precluding the possibility of incoherent bytecode cache; for example
> by using a shared kernel source tree among several developers, and only
> one of them (owner) has a write permission of it.  In that case, said
> owner might update the tree without running relevant python scripts.
> 
> I don't know if python can notice outdated cache and disregard it.
> 
> In such a situation, setting PYTHONPYCACHEPREFIX as an environment
> variable should help, for sure, but only in such special cases.
> 
> Andy, what do you say if I ask reverts of 1/4, 2/4/, and 3/4?

Patches 1 and 2 are, IMO, needed anyway, as they fix a problem:
KERNELDOC environment is not used consistently.

Now, patch 3 is the one that may require more thinking.

I agree with Andy that, when O=<dir> is used, nothing shall be
written to source dir.

There are a couple of reasons for that:

1. source dir may be read only;
2. one may want to do cross compilation and use multiple output
   directories, one for each version;
3. the source dir could be mapped via NFS to multiple machines
   with different architectures.

For (3), it could mean that multiple machines may have different
Python versions, so, sharing the Python bytecode from source dir doesn't
sound a good idea. Also, I'm not sure if the pyc from different archs
would be identical.

With that, there are two options:

a. disable cache;
b. set PYTHONCACHEPREFIX.

We're currently doing (a). I guess everybody agrees that this is
is not ideal.

So, ideally, we should move to (b). For Spinx, the easiest solution
is just to place it under Documentation/output, but this is not
generic enough: ideally, we should revert patch 3 and set
PYTHONCACHEPREFIX when O is used. Eventually, we can apply my
patch for Documentation/output, while we craft such logic.

Regards,
Mauro

