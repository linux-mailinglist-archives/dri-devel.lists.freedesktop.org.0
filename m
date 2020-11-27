Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B5DE2C6BEF
	for <lists+dri-devel@lfdr.de>; Fri, 27 Nov 2020 20:21:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36E0F6EEB3;
	Fri, 27 Nov 2020 19:21:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A70206EEB3;
 Fri, 27 Nov 2020 19:21:35 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 23138469-1500050 for multiple; Fri, 27 Nov 2020 19:21:33 +0000
MIME-Version: 1.0
In-Reply-To: <20201127120718.454037-93-matthew.auld@intel.com>
References: <20201127120718.454037-1-matthew.auld@intel.com>
 <20201127120718.454037-93-matthew.auld@intel.com>
Subject: Re: [Intel-gfx] [RFC PATCH 092/162] drm/i915/uapi: introduce
 drm_i915_gem_create_ext
From: Chris Wilson <chris@chris-wilson.co.uk>
To: Matthew Auld <matthew.auld@intel.com>, intel-gfx@lists.freedesktop.org
Date: Fri, 27 Nov 2020 19:21:31 +0000
Message-ID: <160650489191.2925.8368836004531106032@build.alporthouse.com>
User-Agent: alot/0.9
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Matthew Auld (2020-11-27 12:06:08)
> +int
> +i915_gem_create_ioctl(struct drm_device *dev, void *data,
> +                     struct drm_file *file)
> +{
> +       struct drm_i915_private *i915 = to_i915(dev);
> +       struct create_ext ext_data = { .i915 = i915 };
> +       struct drm_i915_gem_create_ext *args = data;
> +       int ret;
> +
> +       i915_gem_flush_free_objects(i915);
> +
> +       ret = i915_user_extensions(u64_to_user_ptr(args->extensions),
> +                                  create_extensions,
> +                                  ARRAY_SIZE(create_extensions),
> +                                  &ext_data);
> +       if (ret)
> +               goto err_free;
> +
> +       if (!ext_data.placements) {
> +               struct intel_memory_region **placements;
> +               enum intel_memory_type mem_type = INTEL_MEMORY_SYSTEM;
> +
> +               placements = kmalloc(sizeof(struct intel_memory_region *),
> +                                    GFP_KERNEL);
> +               if (!placements)
> +                       return -ENOMEM;
> +
> +               placements[0] = intel_memory_region_by_type(i915, mem_type);
> +
> +               ext_data.placements = placements;
> +               ext_data.n_placements = 1;
> +       }
> +
> +       ret = i915_gem_create(file,
> +                             ext_data.placements,
> +                             ext_data.n_placements,
> +                             &args->size, &args->handle);
> +       if (!ret)
> +               return 0;

Applying the extensions has to happen after creating the vanilla object.

It literally is the equivalent of applying the setparam ioctl to a fresh
object.

Look at the PXP series for how badly wrong this goes if you try it this
way around.
-Chris
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
