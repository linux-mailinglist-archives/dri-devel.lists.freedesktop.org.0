Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 568B0525BA8
	for <lists+dri-devel@lfdr.de>; Fri, 13 May 2022 08:38:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12ADB10E215;
	Fri, 13 May 2022 06:38:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com
 [IPv6:2607:f8b0:4864:20::b30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9360810F9DC
 for <dri-devel@lists.freedesktop.org>; Thu, 12 May 2022 21:31:31 +0000 (UTC)
Received: by mail-yb1-xb30.google.com with SMTP id m128so12135088ybm.5
 for <dri-devel@lists.freedesktop.org>; Thu, 12 May 2022 14:31:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3GME8g6CPueWMd7lO8qXn1DRp2ceHlUdCzpOykCHbrg=;
 b=sZeZsptj07txPT3pe6bg85WLBogL/niFdujvXhGmvGHvUMdf+ubK/UMpNHCLyogLwJ
 1SzO61ddJPTl2rtfw/kEWCzbP/eORv0uCHNC9PQeJyNGrGAE73x2lB0kWBr2Kjmq3xRa
 mHwmaWFkL87Lq1cgfh194/MR4V/+H09KgB3y8gzFiALIbiGBD1RimwncOW3qBHBZ2PVs
 UJ6FI/VP/MEHjwSS79k9qDB+GAXe0Ehg7pg7yN/vCBgUpTkurP3pNm1JUOvBj2epSt4W
 zK35VaXeUyV2ai5LhbEjWsjFjQ7WQtGm92S5pR09fzSj8A5IT67/CPetqREViJP8tMHW
 dVyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3GME8g6CPueWMd7lO8qXn1DRp2ceHlUdCzpOykCHbrg=;
 b=CNLmamazV8IRK4Xl1Qt/zK/O0KOzJvLsG/jZuglD0YtOexYksesFQfPniy+bgXvzrn
 Uj639KOQbrer+/xjG8NAkh9LH60Kra+uZ4zNy/lxz+xfmzo244+qQdrCwgUUiLCfxuGl
 zxUf2glVsYo78+HNoeZtrgF9FJ8lgDOc2cY6dCnTQ6deDzGqwM7dJOWGpipgKURknE6z
 6vriqzpeQmgrNf3kNE/juHF88DKlE3ZnqvQrd9Mx9kJ0ZRTdaqARBRlcL21q6j2w6/dT
 f/75qCIZKXJ93jHUxXx6UKz2ct2LCVmCuj4j+5ZA70J4t2ISqBpdvW8+vpZvrCx1v6//
 EFWQ==
X-Gm-Message-State: AOAM532tsv0EhOm3liLs+pjVAtRnzweOgj5OKZt57YwiV4Uj7P/ZueYA
 HQW9GNL13Rg86F7E2D1+3qljSvcMxwJUDzo/NVeT2Q==
X-Google-Smtp-Source: ABdhPJzRP9OzjWdpg6cI3ylhn4k+6QO0736A21gHd6fEDFV4tnKVbdWhReuAz2gSne+SFZ3750d7D1xL3b8UC7zpu2M=
X-Received: by 2002:a25:84c3:0:b0:64a:de2c:2b75 with SMTP id
 x3-20020a2584c3000000b0064ade2c2b75mr1889370ybm.70.1652391089597; Thu, 12 May
 2022 14:31:29 -0700 (PDT)
MIME-Version: 1.0
References: <20220512211704.3158759-1-nathan@kernel.org>
In-Reply-To: <20220512211704.3158759-1-nathan@kernel.org>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Thu, 12 May 2022 14:30:53 -0700
Message-ID: <CABCJKucbETQeRHx4bLG1fWZBnpszbrS9N+Ryp9sr2AcAY=9sxA@mail.gmail.com>
Subject: Re: [PATCH] drm/i915: Fix CFI violation with show_dynamic_id()
To: Nathan Chancellor <nathan@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Fri, 13 May 2022 06:38:31 +0000
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, llvm@lists.linux.dev,
 Kees Cook <keescook@chromium.org>, Tom Rix <trix@redhat.com>,
 intel-gfx@lists.freedesktop.org, Nick Desaulniers <ndesaulniers@google.com>,
 LKML <linux-kernel@vger.kernel.org>, patches@lists.linux.dev,
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, May 12, 2022 at 2:17 PM Nathan Chancellor <nathan@kernel.org> wrote:
>
> When an attribute group is created with sysfs_create_group(), the
> ->sysfs_ops() callback is set to kobj_sysfs_ops, which sets the ->show()
> callback to kobj_attr_show(). kobj_attr_show() uses container_of() to
> get the ->show() callback from the attribute it was passed, meaning the
> ->show() callback needs to be the same type as the ->show() callback in
> 'struct kobj_attribute'.
>
> However, show_dynamic_id() has the type of the ->show() callback in
> 'struct device_attribute', which causes a CFI violation when opening the
> 'id' sysfs node under drm/card0/metrics. This happens to work because
> the layout of 'struct kobj_attribute' and 'struct device_attribute' are
> the same, so the container_of() cast happens to allow the ->show()
> callback to still work.
>
> Change the type of show_dynamic_id() to match the ->show() callback in
> 'struct kobj_attributes' and update the type of sysfs_metric_id to
> match, which resolves the CFI violation.
>
> Fixes: f89823c21224 ("drm/i915/perf: Implement I915_PERF_ADD/REMOVE_CONFIG interface")
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---
>  drivers/gpu/drm/i915/i915_perf.c       | 4 ++--
>  drivers/gpu/drm/i915/i915_perf_types.h | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/i915_perf.c b/drivers/gpu/drm/i915/i915_perf.c
> index 0a9c3fcc09b1..1577ab6754db 100644
> --- a/drivers/gpu/drm/i915/i915_perf.c
> +++ b/drivers/gpu/drm/i915/i915_perf.c
> @@ -4050,8 +4050,8 @@ static struct i915_oa_reg *alloc_oa_regs(struct i915_perf *perf,
>         return ERR_PTR(err);
>  }
>
> -static ssize_t show_dynamic_id(struct device *dev,
> -                              struct device_attribute *attr,
> +static ssize_t show_dynamic_id(struct kobject *kobj,
> +                              struct kobj_attribute *attr,
>                                char *buf)
>  {
>         struct i915_oa_config *oa_config =
> diff --git a/drivers/gpu/drm/i915/i915_perf_types.h b/drivers/gpu/drm/i915/i915_perf_types.h
> index 473a3c0544bb..05cb9a335a97 100644
> --- a/drivers/gpu/drm/i915/i915_perf_types.h
> +++ b/drivers/gpu/drm/i915/i915_perf_types.h
> @@ -55,7 +55,7 @@ struct i915_oa_config {
>
>         struct attribute_group sysfs_metric;
>         struct attribute *attrs[2];
> -       struct device_attribute sysfs_metric_id;
> +       struct kobj_attribute sysfs_metric_id;
>
>         struct kref ref;
>         struct rcu_head rcu;

This looks correct to me. Thanks for testing this and fixing the issue!

Reviewed-by: Sami Tolvanen <samitolvanen@google.com>

Sami
