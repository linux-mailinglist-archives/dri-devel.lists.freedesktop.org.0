Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA976146C94
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jan 2020 16:24:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90E9B6FD76;
	Thu, 23 Jan 2020 15:24:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B6886FD71;
 Thu, 23 Jan 2020 15:24:53 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 19984240-1500050 for multiple; Thu, 23 Jan 2020 15:24:46 +0000
MIME-Version: 1.0
To: "Michael J . Ruhl" <michael.j.ruhl@intel.com>,
 Colin King <colin.king@canonical.com>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <20200123151406.51679-1-colin.king@canonical.com>
References: <20200123151406.51679-1-colin.king@canonical.com>
Message-ID: <157979308341.19995.6106728840274572701@skylake-alporthouse-com>
User-Agent: alot/0.6
Subject: Re: [PATCH][next] drm/i915/gem: fix null pointer dereference on vm
Date: Thu, 23 Jan 2020 15:24:43 +0000
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Colin King (2020-01-23 15:14:06)
> From: Colin Ian King <colin.king@canonical.com>
> 
> Currently if the call to function context_get_vm_rcu returns
> a null pointer for vm then the error exit path via label err_put
> will call i915_vm_put on the null vm, causing a null pointer
> dereference.  Fix this by adding a null check on vm and returning
> without calling the i915_vm_put.
> 
> Fixes: 5dbd2b7be61e ("drm/i915/gem: Convert vm idr to xarray")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Hmm. Actually, we can drop the rcu_read_lock as soon as we've acquire
the local ref to ctx->vm. So something like,

        if (!rcu_access_pointer(ctx->vm))
                return -ENODEV;

-       err = -ENODEV;
        rcu_read_lock();
        vm = context_get_vm_rcu(ctx);
-       if (vm)
-               err = xa_alloc(&file_priv->vm_xa, &id, vm,
-                              xa_limit_32b, GFP_KERNEL);
        rcu_read_unlock();
+       if (!vm)
+               return -ENODEV;
+
+       err = xa_alloc(&file_priv->vm_xa, &id, vm,
+                      xa_limit_32b, GFP_KERNEL);
        if (err)
                goto err_put;

would work.
-Chris
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
