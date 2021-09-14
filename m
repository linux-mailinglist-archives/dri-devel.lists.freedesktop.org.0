Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E3F9440A5B4
	for <lists+dri-devel@lfdr.de>; Tue, 14 Sep 2021 07:05:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED60E6E3DA;
	Tue, 14 Sep 2021 05:05:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 096D06E3D6;
 Tue, 14 Sep 2021 05:05:13 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id jg16so26004975ejc.1;
 Mon, 13 Sep 2021 22:05:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZIbpz1lokigo6OOWerFyDcXJIDXILYOfcZE71FEQA1w=;
 b=AARF40TwuxG5Uh2ElZuEo0Ifa6iAIm1ZKQe2llhFfh4EXylZysqLFjR+mXZjDsQhRz
 tXhsnZCkhBGlmb2lbC3YaoPcsq4jEzSlx0cLGQkE2IVXzyyocqMX0/5JzOUlFNlstl/u
 SWux/cOQ3nu1P4kWCxUocHar0Ve9CZ/JOeDpd0nKXy1IWMZAQjFex247r6QbBnjhHYWu
 DpyYxsyaRunc9pkpFcIX46MK5D/Bt1sFNQf7ovbZ1KmiWSpnriIBZZYB0FPLHMCORV/o
 O+VtYIziqw6+7agzNkCAbwbi3lhJuCMbv4UbJE1o/TwyYtpqTIHDHf1SYbuarbtyT6Eo
 g9UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZIbpz1lokigo6OOWerFyDcXJIDXILYOfcZE71FEQA1w=;
 b=EHz5+GmEUWNedDpGmNjlgcEaSFSFQSLX7MAlM6+2U3CZHox1xiAlDbveUhpQHmaeMw
 Xxpp28xeqqx/MkczDE6XwSJ/gHi3Fz6AQGgYIPsLc1kfiWezxvLSP+t/NOoKLgsVbMFq
 OHYlheutFAUV1Q/4bax3JfuJ2bLfthfwEdqBBcNLzD6WLh4g3NfOREgExbB8/D8io08O
 evZL5928CUZuHGTdRIH3BPA8iIWKv8di2LmH8qAYyDBQBIcVntXXNm5WYc9rKOJ+BATQ
 OFc4UpyjadGBJlUfA7N8ApPTVUmWkcnG3b4VIF3a+biLLSrHmT8CYys7rbQ2C7LfKeeX
 gk2w==
X-Gm-Message-State: AOAM530MIzz6jY2SK9rC8Rl10A3+ufR315KAdvFA9h7nJxnzOztexDN5
 Z9DXGfwSuAe3gxyBsbCgJVLWn+iqcF+sgn4CTxo=
X-Google-Smtp-Source: ABdhPJxAx6PQvqgwUuiGnlpTh9RfEzMdwyM+xVgQpavycaD57LL2z4YqFMsHXHPKpA45gEvKCJVM/uISr4mawV4A0oE=
X-Received: by 2002:a17:906:8608:: with SMTP id
 o8mr16796470ejx.470.1631595911366; 
 Mon, 13 Sep 2021 22:05:11 -0700 (PDT)
MIME-Version: 1.0
References: <20210914044933.22932-1-matthew.brost@intel.com>
 <20210914044933.22932-2-matthew.brost@intel.com>
In-Reply-To: <20210914044933.22932-2-matthew.brost@intel.com>
From: Dave Airlie <airlied@gmail.com>
Date: Tue, 14 Sep 2021 15:04:59 +1000
Message-ID: <CAPM=9tzHmYkf_y2W_1TO2MPeohFQ9MzkTD1s0gmpNgLcWbX1NA@mail.gmail.com>
Subject: Re: [PATCH 1/5] drm/i915: Do not define vma on stack
To: Matthew Brost <matthew.brost@intel.com>
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>, 
 dri-devel <dri-devel@lists.freedesktop.org>, john.c.harrison@intel.com
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

On Tue, 14 Sept 2021 at 14:55, Matthew Brost <matthew.brost@intel.com> wrote:
>
> From: Venkata Sandeep Dhanalakota <venkata.s.dhanalakota@intel.com>
>
> Defining vma on stack can cause stack overflow, if
> vma gets populated with new fields.

Is there some higher level locking stopping that from getting trashed?
or a guarantee that uc_fw_bind_ggtt is only entered by one thread at a
time?

Dave.

>
> Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> Signed-off-by: Venkata Sandeep Dhanalakota <venkata.s.dhanalakota@intel.com>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> Reviewed-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c | 18 +++++++++---------
>  drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h |  2 ++
>  2 files changed, 11 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
> index 3a16d08608a5..f632dbd32b42 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
> @@ -413,20 +413,20 @@ static void uc_fw_bind_ggtt(struct intel_uc_fw *uc_fw)
>  {
>         struct drm_i915_gem_object *obj = uc_fw->obj;
>         struct i915_ggtt *ggtt = __uc_fw_to_gt(uc_fw)->ggtt;
> -       struct i915_vma dummy = {
> -               .node.start = uc_fw_ggtt_offset(uc_fw),
> -               .node.size = obj->base.size,
> -               .pages = obj->mm.pages,
> -               .vm = &ggtt->vm,
> -       };
> +       struct i915_vma *dummy = &uc_fw->dummy;
> +
> +       dummy->node.start = uc_fw_ggtt_offset(uc_fw);
> +       dummy->node.size = obj->base.size;
> +       dummy->pages = obj->mm.pages;
> +       dummy->vm = &ggtt->vm;
>
>         GEM_BUG_ON(!i915_gem_object_has_pinned_pages(obj));
> -       GEM_BUG_ON(dummy.node.size > ggtt->uc_fw.size);
> +       GEM_BUG_ON(dummy->node.size > ggtt->uc_fw.size);
>
>         /* uc_fw->obj cache domains were not controlled across suspend */
> -       drm_clflush_sg(dummy.pages);
> +       drm_clflush_sg(dummy->pages);
>
> -       ggtt->vm.insert_entries(&ggtt->vm, &dummy, I915_CACHE_NONE, 0);
> +       ggtt->vm.insert_entries(&ggtt->vm, dummy, I915_CACHE_NONE, 0);
>  }
>
>  static void uc_fw_unbind_ggtt(struct intel_uc_fw *uc_fw)
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h
> index 99bb1fe1af66..693cc0ebcd63 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h
> @@ -10,6 +10,7 @@
>  #include "intel_uc_fw_abi.h"
>  #include "intel_device_info.h"
>  #include "i915_gem.h"
> +#include "i915_vma.h"
>
>  struct drm_printer;
>  struct drm_i915_private;
> @@ -75,6 +76,7 @@ struct intel_uc_fw {
>         bool user_overridden;
>         size_t size;
>         struct drm_i915_gem_object *obj;
> +       struct i915_vma dummy;
>
>         /*
>          * The firmware build process will generate a version header file with major and
> --
> 2.32.0
>
