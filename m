Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 58F701BD4F9
	for <lists+dri-devel@lfdr.de>; Wed, 29 Apr 2020 08:46:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECCCC6E3A4;
	Wed, 29 Apr 2020 06:46:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CA526E3A4;
 Wed, 29 Apr 2020 06:46:42 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 21054240-1500050 for multiple; Wed, 29 Apr 2020 07:45:58 +0100
MIME-Version: 1.0
In-Reply-To: <20200429030051.920203-1-natechancellor@gmail.com>
References: <20200429030051.920203-1-natechancellor@gmail.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Nathan Chancellor <natechancellor@gmail.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PATCH] drm/i915/gt: Avoid uninitialized use of rpcurupei in
 frequency_show
From: Chris Wilson <chris@chris-wilson.co.uk>
Message-ID: <158814275688.18349.12896739005148519908@build.alporthouse.com>
User-Agent: alot/0.8.1
Date: Wed, 29 Apr 2020 07:45:56 +0100
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
Cc: Nathan Chancellor <natechancellor@gmail.com>,
 clang-built-linux@googlegroups.com, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Nathan Chancellor (2020-04-29 04:00:52)
> When building with clang + -Wuninitialized:
> 
> drivers/gpu/drm/i915/gt/debugfs_gt_pm.c:407:7: warning: variable
> 'rpcurupei' is uninitialized when used here [-Wuninitialized]
>                            rpcurupei,
>                            ^~~~~~~~~
> drivers/gpu/drm/i915/gt/debugfs_gt_pm.c:304:16: note: initialize the
> variable 'rpcurupei' to silence this warning
>                 u32 rpcurupei, rpcurup, rpprevup;
>                              ^
>                               = 0
> 1 warning generated.
> 
> rpupei is assigned twice; based on the second argument to
> intel_uncore_read, it seems this one should have been assigned to
> rpcurupei.
> 
> Fixes: 9c878557b1eb ("drm/i915/gt: Use the RPM config register to determine clk frequencies")
> Link: https://github.com/ClangBuiltLinux/linux/issues/1016
> Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>

Thanks.
Reviewed-by: Chris Wilson <chris@chris-wilson.co.uk>
-Chris
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
