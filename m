Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D464266BBBB
	for <lists+dri-devel@lfdr.de>; Mon, 16 Jan 2023 11:30:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFC9810E331;
	Mon, 16 Jan 2023 10:30:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 1F6CC10E331
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Jan 2023 10:30:25 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BF85FAD7;
 Mon, 16 Jan 2023 02:31:06 -0800 (PST)
Received: from [10.57.13.214] (unknown [10.57.13.214])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5A7443F67D;
 Mon, 16 Jan 2023 02:30:23 -0800 (PST)
Message-ID: <5b4f73a1-60bf-7da6-e94d-fca9f6ec7c3a@arm.com>
Date: Mon, 16 Jan 2023 10:30:21 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH RFC 0/4] drm/panfrost: Expose memory usage stats through
 fdinfo
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Rob Herring <robh+dt@kernel.org>, Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Robin Murphy <robin.murphy@arm.com>
References: <20230104130308.3467806-1-boris.brezillon@collabora.com>
Content-Language: en-GB
From: Steven Price <steven.price@arm.com>
In-Reply-To: <20230104130308.3467806-1-boris.brezillon@collabora.com>
Content-Type: text/plain; charset=UTF-8
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
Cc: Christopher Healy <healych@amazon.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 04/01/2023 13:03, Boris Brezillon wrote:
> Hello,
> 
> Here's an attempt at exposing some memory usage stats through fdinfo,
> which recently proved useful in debugging a memory leak. Not entirely
> sure the name I chose are accurate, so feel free to propose
> alternatives, and let me know if you see any other mem-related stuff
> that would be interesting to expose.

Sorry it's taken me a while to look at this - I'm still working through
the holiday backlog.

The names look reasonable to me, and I gave this a quick spin and it
seemed to work (the numbers reported looks reasonable). As Daniel
suggested it would be good if some of the boiler plate fdinfo code could
be moved to generic code (although to be fair there's not much here).

Of course what we're missing is the 'engine' usage information for
gputop - it's been on my todo list of a while, but I'm more than happy
for you to do it for me ;) It's somewhat more tricky because of the
whole 'queuing' on slots mechanism that Mali has. But we obviously
shouldn't block this memory implementation on that, it can be added
afterwards.

Anyway, for the series as it is:

Reviewed-by: Steven Price <steven.price@arm.com>

Thanks,

Steve

> Regards,
> 
> Boris
> 
> Boris Brezillon (4):
>   drm/panfrost: Provide a dummy show_fdinfo() implementation
>   drm/panfrost: Track BO resident size
>   drm/panfrost: Add a helper to retrieve MMU context stats
>   drm/panfrost: Expose some memory related stats through fdinfo
> 
>  drivers/gpu/drm/panfrost/panfrost_drv.c       | 24 ++++++++++++++++-
>  drivers/gpu/drm/panfrost/panfrost_gem.h       |  7 +++++
>  .../gpu/drm/panfrost/panfrost_gem_shrinker.c  |  1 +
>  drivers/gpu/drm/panfrost/panfrost_mmu.c       | 27 +++++++++++++++++++
>  drivers/gpu/drm/panfrost/panfrost_mmu.h       | 10 +++++++
>  5 files changed, 68 insertions(+), 1 deletion(-)
> 

