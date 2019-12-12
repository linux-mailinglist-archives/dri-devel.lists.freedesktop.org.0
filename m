Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D515811D7F5
	for <lists+dri-devel@lfdr.de>; Thu, 12 Dec 2019 21:39:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D921E6E1D7;
	Thu, 12 Dec 2019 20:39:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78D9E6E1D7;
 Thu, 12 Dec 2019 20:39:08 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 19560382-1500050 for multiple; Thu, 12 Dec 2019 20:38:54 +0000
MIME-Version: 1.0
To: Colin Ian King <colin.king@canonical.com>
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <1d2c3c9d-5f11-db41-68ef-61ff9ec601cb@canonical.com>
References: <1d2c3c9d-5f11-db41-68ef-61ff9ec601cb@canonical.com>
Message-ID: <157618313562.7396.11949995525623174493@skylake-alporthouse-com>
User-Agent: alot/0.6
Subject: re: drm/i915: Use the i915_device name for identifying our,
 request fences
Date: Thu, 12 Dec 2019 20:38:55 +0000
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
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>,
 Venkata Sandeep Dhanalakota <venkata.s.dhanalakota@intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Colin Ian King (2019-12-12 19:53:33)
> Hi,
> 
> Static analysis with Coverity has picked up an issue with the following
> commit:
> 
> commit 65c29dbb19b2451990c5c477fef7ada3b8218f05
> Author: Chris Wilson <chris@chris-wilson.co.uk>
> Date:   Wed Dec 11 15:02:04 2019 +0000
> 
>     drm/i915: Use the i915_device name for identifying our request fences
> 
> In source drivers/gpu/drm/i915/i915_request.c and function
> i915_fence_get_timeline_name there is the following:
> 
>         return to_request(fence)->gem_context->name ?: "[" DRIVER_NAME "]";
> 
> However name is an array: char name[TASK_COMM_LEN + 8], so it can never
> be null, so the ternary operator will always return name and will never
> reaturn "[" DRIVER_NAME "]".  Should it instead be checking if name[0]
> is '\0' instead?

It's older than that patch, we made it a char[] some time ago. There's a
patch pending to make it conditional on ce->gem_context instead.
-Chris
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
