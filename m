Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 27EEA36C1F4
	for <lists+dri-devel@lfdr.de>; Tue, 27 Apr 2021 11:42:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBFA289DE5;
	Tue, 27 Apr 2021 09:42:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf31.google.com (mail-qv1-xf31.google.com
 [IPv6:2607:f8b0:4864:20::f31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C42DC89DE5;
 Tue, 27 Apr 2021 09:42:30 +0000 (UTC)
Received: by mail-qv1-xf31.google.com with SMTP id x27so28693149qvd.2;
 Tue, 27 Apr 2021 02:42:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xZp+omIfpjqx0dOZjT8YOPOoTGLrVGaiXPBJR5pJjuM=;
 b=TNxknECt4W/zYw9tFnsMVcw53SpOaMiuMBNjLnRaB3s4VR2BcWbXiey7UpRFMnziG2
 Pnx75BRSOcxMeQfBB05Q1OSfty1M+ZcSQml7RON27tpl2dWSk1N9Y3hbKSSqJkZ4N750
 kO50D46i8NzCQenZg3IAFeGAMdBWp/gIa68A0FTLmbS3nTQzz5p3XJi/br6zXugC9YYC
 tHIKDr/8VDTud1fLMTiNLQfdpdgadYLxTbOtCTjzkWzoJXEjUBxqWhbf4+Zm9CPNW5yG
 6ZiFKXXqE9liPfYp4W+2k0N/5XJ07c3lmDzMeflN9LiMvDIuP7bYZjoDEYY7x63bhXe8
 9WmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xZp+omIfpjqx0dOZjT8YOPOoTGLrVGaiXPBJR5pJjuM=;
 b=Cn4aMPHMQOUEkgU6v5t9zDuuELSJCBP/3FsT8shJCdS+1WevJbZbB95FAvOUZjm/cw
 pgWbZNAggdRV1+EhCMHHuP4JKv1wvAHOaD6Z09ySwq4vTN+bGEO9VL7S77DVqS7+/YSa
 tKp4q2xqqa+E5X8KkRT2xwT610ZTe4I5faUUPoEjMLViIPglDdl42EWQ3JbcfHIRDn60
 /lr9wSwMaTnp2kpBD/YAm4yq6YOgoygPoZnz5B00afIJ0L3cDSCNPHIkFJT6xtr0cyVM
 1xRU0ocyerErOp60b5HJ5K5Bp5TBmEVeDqu7/JTolc+zA+do7PV6LdIaWUUrmvxj8GBG
 NVkA==
X-Gm-Message-State: AOAM531cEsHhgmCjwjaiqE7LTOF1T4ahO36t+EHvgs2bI4/ark6KtPhc
 7eOyCORZ8+i5wb8G3Kk9JStFsT6v+ccroM3oc/s=
X-Google-Smtp-Source: ABdhPJw1i5Ej085FKx+9AZJe13/YmFRyDry5nNqfqusksuz2dBIfZ+nFvKDw46T8C00sEUQkZUoeAJQAVGRBxNjms2Q=
X-Received: by 2002:a05:6214:da7:: with SMTP id
 h7mr22459682qvh.48.1619516549875; 
 Tue, 27 Apr 2021 02:42:29 -0700 (PDT)
MIME-Version: 1.0
References: <20210426124340.4238-1-lyl2019@mail.ustc.edu.cn>
In-Reply-To: <20210426124340.4238-1-lyl2019@mail.ustc.edu.cn>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Tue, 27 Apr 2021 10:42:03 +0100
Message-ID: <CAM0jSHN3niCs2bQ6bsP1YmdmWcQS17wt-Yo=730q9f_zES=dBQ@mail.gmail.com>
Subject: Re: [PATCH] drm/i9i5/gt: Fix a double free in
 gen8_preallocate_top_level_pdp
To: Lv Yunlong <lyl2019@mail.ustc.edu.cn>
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
Cc: David Airlie <airlied@linux.ie>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 kernel list <linux-kernel@vger.kernel.org>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 26 Apr 2021 at 13:44, Lv Yunlong <lyl2019@mail.ustc.edu.cn> wrote:
>
> Our code analyzer reported a double free bug.
>
> In gen8_preallocate_top_level_pdp, pde and pde->pt.base are allocated
> via alloc_pd(vm) with one reference. If pin_pt_dma() failed, pde->pt.base
> is freed by i915_gem_object_put() with a reference dropped. Then free_pd
> calls free_px() defined in intel_ppgtt.c, which calls i915_gem_object_put()
> to put pde->pt.base again.
>
> As pde->pt.base is protected by refcount, so the second put will not free
> pde->pt.base actually. But, maybe it is better to remove the first put?
>
> Fixes: 82adf901138cc ("drm/i915/gt: Shrink i915_page_directory's slab bucket")
> Signed-off-by: Lv Yunlong <lyl2019@mail.ustc.edu.cn>

Yes, it looks like this fixes a potential use-after-free. Thanks for the patch,
Reviewed-by: Matthew Auld <matthew.auld@intel.com>

Pushed to drm-intel-gt-next.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
