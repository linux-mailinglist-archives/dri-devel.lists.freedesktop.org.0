Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB140562D9F
	for <lists+dri-devel@lfdr.de>; Fri,  1 Jul 2022 10:18:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77FAC10F07C;
	Fri,  1 Jul 2022 08:18:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C133010F07C;
 Fri,  1 Jul 2022 08:18:28 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id t24so2572020lfr.4;
 Fri, 01 Jul 2022 01:18:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=yLGtqLSqs0PrnuW1mH2z4b5ktp7tZQnFGpCN+5loQmo=;
 b=SYPqAnuJ+FjIYhUSxgZAoZNehq8yowEpHSGJ8tdqj/R6GXCqtj6Yg96EJu3RKiGLJk
 BFFTOixQYg9opNCAg0lLfRYL4ZRb11fntzCEROvPNOFIKditsRo3BoxYhprrvK6UvPqn
 Wqt8X/kbwUh0sivHlcOPu9pKA7BkynCcLMFfmdGuk7xewxSVwHlYFWCQsMupS6z1YiPc
 0KNIszOogA9xd9h/21wv3oyDXKCVvfM+zEJH3KKwxmpH0UCfN/CPk2cd4xjB4s1arD3/
 SnP9k8OVANTyGK0GHlZRWn1NiYxzShgULJynFVov6ZV/S8o1AM+xSl+4CFDBodHgDQ2e
 RI3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=yLGtqLSqs0PrnuW1mH2z4b5ktp7tZQnFGpCN+5loQmo=;
 b=iEEjIUQVqN+3mgt+hbKR4ZorRUrTWVutUcBiNrZlVj39eJzmoGYD60DzM2FuE9k+NB
 9ga9Eo1qvQ/aoN3+SafJqkflMSlglHFBnfauZu7KnxQOCNMKk6eFbvQMdfSgy/Y0YE12
 j3Z53bUJgs4BLxzEkcczrbBT/dy900lux9Jalz/rx8/23h3gNsS4FnNMx3bl+1gkJFyu
 MhKqEO95LCNm8uJbEY2wW+b9RkdRrCAkxFTNpuRaR2OEfoQsCdviVHc50BThzWkBNyTi
 k6bj50TwOD05LuqMYRMyc46lotsnO2qg59WIApf1nZ4aiXMNO0c9DWq4sFriWKdzxa8v
 C52w==
X-Gm-Message-State: AJIora89e+mvsaacrseydwV6KBVKJkVlp7b6BD/3tzmD1NhuQyxRwFls
 LhIVLhvMaYaP/jcKov12dEWOfa9lc9x4HpsCTkM=
X-Google-Smtp-Source: AGRyM1vQFj3ABJdbMtBdBxIT5y20N9yjp8c2knERjGasulFOhstdkjMDldPUSXKW5jC5j/gzc7+2NazCnHxJA+e3eyM=
X-Received: by 2002:a05:6512:234c:b0:47f:8fd9:16f3 with SMTP id
 p12-20020a056512234c00b0047f8fd916f3mr8606117lfu.543.1656663506961; Fri, 01
 Jul 2022 01:18:26 -0700 (PDT)
MIME-Version: 1.0
References: <20220620123659.381772-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20220620123659.381772-1-thomas.hellstrom@linux.intel.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Fri, 1 Jul 2022 09:18:00 +0100
Message-ID: <CAM0jSHNhkHubybXgBa+Z2Eq-SNv7uQGnmoZzOCtFwE_p9f=UDw@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH v2] drm/i915: Fix vm use-after-free in vma
 destruction
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
 Matthew Auld <matthew.auld@intel.com>,
 ML dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 20 Jun 2022 at 13:37, Thomas Hellstr=C3=B6m
<thomas.hellstrom@linux.intel.com> wrote:
>
> In vma destruction, the following race may occur:
>
> Thread 1:                         Thread 2:
> i915_vma_destroy();
>
>   ...
>   list_del_init(vma->vm_link);
>   ...
>   mutex_unlock(vma->vm->mutex);
>                                   __i915_vm_release();
> release_references();
>
> And in release_reference() we dereference vma->vm to get to the
> vm gt pointer, leading to a use-after free.
>
> However, __i915_vm_release() grabs the vm->mutex so the vm won't be
> destroyed before vma->vm->mutex is released, so extract the gt pointer
> under the vm->mutex to avoid the vma->vm dereference in
> release_references().
>
> v2: Fix a typo in the commit message (Andi Shyti)
>
> Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/5944
> Fixes: e1a7ab4fca ("drm/i915: Remove the vm open count")
>
> Cc: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>
> Signed-off-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
