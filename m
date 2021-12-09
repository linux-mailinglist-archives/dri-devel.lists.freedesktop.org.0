Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14C2A46EEBE
	for <lists+dri-devel@lfdr.de>; Thu,  9 Dec 2021 17:58:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55C0F10E95E;
	Thu,  9 Dec 2021 16:53:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf2a.google.com (mail-qv1-xf2a.google.com
 [IPv6:2607:f8b0:4864:20::f2a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A20B610E11D;
 Thu,  9 Dec 2021 13:05:49 +0000 (UTC)
Received: by mail-qv1-xf2a.google.com with SMTP id j9so5000084qvm.10;
 Thu, 09 Dec 2021 05:05:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gU5vjcI6UriWGeTWYxpP56v9etTTw2WO93kA0XeoyII=;
 b=bVLMgd0+vt0Y761e1vqGC4WbQks5rUuokK3xpD/xBSBLjNbBFS/vVMvrdWXWnFQJS4
 ojCR59Ps7R6T5o/yAGJmlIX5rUaSa2ILe55tsYRAEEoavVpP9uGLXr4iff4rK9w2ecj7
 ZRPKlLA0ZcGDALgnxIKixR7rfIXT5AJheGmrT/UVK/uCURDwWTcXFjkDvSUFflqY8+AB
 u7fds8P4WPZ47vaxytbSQ/5PcO4AGD1qq2jlfTXQ2tVWiEpAvVbJqCfhSWvf1AxyyhWB
 VTvp32EWFwp4KIJ5TSgZrci9382L/3WOv/dwf0vAHrEX3cNWC1y2yCLZhOOmw+O+sZsq
 igow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gU5vjcI6UriWGeTWYxpP56v9etTTw2WO93kA0XeoyII=;
 b=4cWkGPVrposJYTwpENXzSoqzDXxTXhEpfWPYSz7ldD9qwb9NQqgHA7oNhDkTgC+vaR
 +uzf7KG0/6KHc5whZzdGcLL2zYRtbDhgNp7rbbuPXmFbEXxJ9AXc6WEj3mjxrVMpZGQ6
 Rfu7+TvV7Bee6toBtyHoqN2UArjJ505InnVqKTGoiUD+EWovxlbp9zCtn6Qcqeq/KgvM
 R1LQXe31+Ft7CYG3bvJwy9CZmhTOGtyDupLgb3/0Jmull0L/5zc1kWOFUhpjvNE3knBh
 N/mMcr7Nr48MZprnEQMs0nSLhJomQm0M52nHGQN6Xgi/WtTo9017tAL9VH9JbKkO2o6U
 CAEQ==
X-Gm-Message-State: AOAM531tIMnJXwFsRrKTUV/Tb8/XhQqY27a5zcFJW6JUbHbsfoa/vqE7
 KrN0QY5JvD3NgilhO+74MudrwpXvABqsBIxc95TbLipYQ/U=
X-Google-Smtp-Source: ABdhPJz5Z6rAqoGrV7nPbyYru2nyllC9EQ4cQDUd+Jec0wuoGeEQtJAg6WZMDWbok9IkMXwWnUhy7tECW3lDxDb5wO4=
X-Received: by 2002:ad4:4ea6:: with SMTP id ed6mr15734786qvb.54.1639055148415; 
 Thu, 09 Dec 2021 05:05:48 -0800 (PST)
MIME-Version: 1.0
References: <20211129134735.628712-1-maarten.lankhorst@linux.intel.com>
 <20211129134735.628712-13-maarten.lankhorst@linux.intel.com>
In-Reply-To: <20211129134735.628712-13-maarten.lankhorst@linux.intel.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Thu, 9 Dec 2021 13:05:22 +0000
Message-ID: <CAM0jSHM1P0-UqYC01vpjvogW_5ECwonnnmtmiKi3go4Di4+NKQ@mail.gmail.com>
Subject: Re: [PATCH v2 12/16] drm/i915: Add i915_vma_unbind_unlocked, and take
 obj lock for i915_vma_unbind
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 29 Nov 2021 at 13:58, Maarten Lankhorst
<maarten.lankhorst@linux.intel.com> wrote:
>
> We want to remove more members of i915_vma, which requires the locking to be
> held more often.
>
> Start requiring gem object lock for i915_vma_unbind, as it's one of the
> callers that may unpin pages.
>
> Some special care is needed when evicting, because the last reference to the
> object may be held by the VMA, so after __i915_vma_unbind, vma may be garbage,
> and we need to cache vma->obj before unlocking.
>
> Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> ---

<snip>

> @@ -129,22 +129,47 @@ void i915_ggtt_suspend_vm(struct i915_address_space *vm)
>
>         drm_WARN_ON(&vm->i915->drm, !vm->is_ggtt && !vm->is_dpt);
>
> +retry:
> +       i915_gem_drain_freed_objects(vm->i915);
> +
>         mutex_lock(&vm->mutex);
>
>         /* Skip rewriting PTE on VMA unbind. */
>         open = atomic_xchg(&vm->open, 0);
>
>         list_for_each_entry_safe(vma, vn, &vm->bound_list, vm_link) {
> +               struct drm_i915_gem_object *obj = vma->obj;
> +
>                 GEM_BUG_ON(!drm_mm_node_allocated(&vma->node));
> +
>                 i915_vma_wait_for_bind(vma);
>
> -               if (i915_vma_is_pinned(vma))
> +               if (i915_vma_is_pinned(vma) || !i915_vma_is_bound(vma, I915_VMA_GLOBAL_BIND))
>                         continue;
>
> -               if (!i915_vma_is_bound(vma, I915_VMA_GLOBAL_BIND)) {
> -                       __i915_vma_evict(vma);
> -                       drm_mm_remove_node(&vma->node);
> +               /* unlikely to race when GPU is idle, so no worry about slowpath.. */
> +               if (!i915_gem_object_trylock(obj, NULL)) {
> +                       atomic_set(&vm->open, open);

Does this need a comment about barriers?

> +
> +                       i915_gem_object_get(obj);

Should this not be kref_get_unless_zero? Assuming the vm->mutex is the
only thing keeping the object alive here, won't this lead to potential
uaf/double-free or something? Also should we not plonk this before the
trylock? Or maybe I'm missing something here?

> +                       mutex_unlock(&vm->mutex);
> +
> +                       i915_gem_object_lock(obj, NULL);
> +                       open = i915_vma_unbind(vma);
> +                       i915_gem_object_unlock(obj);
> +
> +                       GEM_WARN_ON(open);
> +
> +                       i915_gem_object_put(obj);
> +                       goto retry;
>                 }
> +
> +               i915_vma_wait_for_bind(vma);

We also call wait_for_bind above, is that intentional?
