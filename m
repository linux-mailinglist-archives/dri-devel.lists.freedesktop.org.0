Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3112D3FDF7E
	for <lists+dri-devel@lfdr.de>; Wed,  1 Sep 2021 18:13:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C58C6E197;
	Wed,  1 Sep 2021 16:13:07 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mail-qk1-x735.google.com (mail-qk1-x735.google.com
 [IPv6:2607:f8b0:4864:20::735])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E61676E197;
 Wed,  1 Sep 2021 16:13:06 +0000 (UTC)
Received: by mail-qk1-x735.google.com with SMTP id t4so3594010qkb.9;
 Wed, 01 Sep 2021 09:13:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NxNrpbaiB53Il8GQAIXHwFRBLuZJ0ghflN/6zGkiixo=;
 b=lcc+tzMolmeWAag0BHncpW8TnGuFOFA3N3t/KrFueqMgOCJyZgww26EzOz4XPfIrXU
 MUbKzUvGGYW0FwOT/PmPN54dD22ugmbNaonrdDn6euT9BdCrTN2QJV2wGCdr1h7P+BMe
 ECEbQjFDHV4qrRh4agPRZN0DMr5OrSmv8gXbvtouM7tWeO9A1Il7lMW80dmXoDddmd5l
 dBMFXvuVt830LU2QCOjcztbR3Q+K/Dzyr9nJHjYsEftJqa4HVUgR6mf5D3RtiQPspEXv
 PxuIBkNh+Le92q9dE+3CZtHWYL70CqibYB1Nw48GKR3lvwuZOsUKrxntS2SHxle3Av0l
 DMvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NxNrpbaiB53Il8GQAIXHwFRBLuZJ0ghflN/6zGkiixo=;
 b=rZRJOfny/xX2ZkiJhwRT9OTltzL7Rcz35ov6j0862veNIJU9XNsVStRbnYfFV5UVsx
 uvyuuOmFwHv+zJoLzgnd/OysQOoSxeqMiUM4e7RMbAvmHwK6vBNDK0YnP6CMHSGDcJ79
 lDN4M1fWGsHIIE1uuBWyjx8piajdKVlMHQt7LILZff7+eINNoJAl0itp9u3ElYNn7v0t
 lo17sxj7ztgfa7ZxuJmFdl+BauhNxhy7ZPVZuruE7momo97YkSR6v6ymbx1mk7/NkYhg
 90jKTXFSb5pOTprAuS5Kl9bKsVaRXej0sBf7MBGTAS/JmMf/feMRbq6FD1Icv2LqDfCz
 JE/w==
X-Gm-Message-State: AOAM532NWN0jrnQ95HF9rIEZqomPGUckDEmiyibBqSzsPuPuOrsY6BJn
 aVv1ZTl7gQAvl0ojlokqNv2c3OZOwddYCgQVJ7g=
X-Google-Smtp-Source: ABdhPJxeRePKZOH6A6JJs6HRPVgZ0ZJLe/mH6ls+KBJXo+/kFACTU5MUFTJVS73xhau0DnQz9qV0WP87RuacgBQ37eU=
X-Received: by 2002:a05:620a:16c7:: with SMTP id
 a7mr362776qkn.327.1630512785944; 
 Wed, 01 Sep 2021 09:13:05 -0700 (PDT)
MIME-Version: 1.0
References: <20210901022043.2395135-1-John.C.Harrison@Intel.com>
 <20210901022043.2395135-3-John.C.Harrison@Intel.com>
In-Reply-To: <20210901022043.2395135-3-John.C.Harrison@Intel.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Wed, 1 Sep 2021 17:12:38 +0100
Message-ID: <CAM0jSHO7xXFZBwqzw1gnkY47G+DMZUsZEF1_QYWVNa8LLn1cPA@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH 2/7] drm/i915/guc: put all guc objects in lmem
 when available
To: John.C.Harrison@intel.com
Cc: Intel Graphics Development <Intel-GFX@lists.freedesktop.org>, 
 ML dri-devel <DRI-Devel@lists.freedesktop.org>, 
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Matthew Auld <matthew.auld@intel.com>, 
 Abdiel Janulgue <abdiel.janulgue@linux.intel.com>, 
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Vinay Belgaumkar <vinay.belgaumkar@intel.com>, 
 Radoslaw Szwichtenberg <radoslaw.szwichtenberg@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 1 Sept 2021 at 03:21, <John.C.Harrison@intel.com> wrote:
>
> From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>
> The firmware binary has to be loaded from lmem and the recommendation is
> to put all other objects in there as well. Note that we don't fall back
> to system memory if the allocation in lmem fails because all objects are
> allocated during driver load and if we have issues with lmem at that point
> something is seriously wrong with the system, so no point in trying to
> handle it.
>
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: Abdiel Janulgue <abdiel.janulgue@linux.intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> Cc: Radoslaw Szwichtenberg <radoslaw.szwichtenberg@intel.com>
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/i915/gem/i915_gem_lmem.c  | 26 ++++++++
>  drivers/gpu/drm/i915/gem/i915_gem_lmem.h  |  4 ++
>  drivers/gpu/drm/i915/gt/uc/intel_guc.c    |  9 ++-
>  drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c | 13 ++--
>  drivers/gpu/drm/i915/gt/uc/intel_huc.c    | 14 ++++-
>  drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c  | 75 +++++++++++++++++++++--
>  6 files changed, 128 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_lmem.c b/drivers/gpu/drm/i915/gem/i915_gem_lmem.c
> index eb345305dc52..034226c5d4d0 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_lmem.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_lmem.c
> @@ -103,6 +103,32 @@ __i915_gem_object_create_lmem_with_ps(struct drm_i915_private *i915,
>                                              size, page_size, flags);
>  }
>
> +struct drm_i915_gem_object *
> +i915_gem_object_create_lmem_from_data(struct drm_i915_private *i915,
> +                                     const void *data, size_t size)
> +{
> +       struct drm_i915_gem_object *obj;
> +       void *map;
> +
> +       obj = i915_gem_object_create_lmem(i915,
> +                                         round_up(size, PAGE_SIZE),
> +                                         I915_BO_ALLOC_CONTIGUOUS);

Maybe push the ALLOC_CONTIG into the caller and expose the flags
instead, assuming it's still needed for something GuC related?
pin_map() at least no longer has that constraint.
