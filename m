Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B8F14399C2
	for <lists+dri-devel@lfdr.de>; Mon, 25 Oct 2021 17:11:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B20906E0D0;
	Mon, 25 Oct 2021 15:11:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x72e.google.com (mail-qk1-x72e.google.com
 [IPv6:2607:f8b0:4864:20::72e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E01C6E049;
 Mon, 25 Oct 2021 15:11:29 +0000 (UTC)
Received: by mail-qk1-x72e.google.com with SMTP id bl14so12102779qkb.4;
 Mon, 25 Oct 2021 08:11:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9U69ZOR0qEZGqZ3DsVw2NfIxCFPxdN0F2cnCNMl6Iak=;
 b=fg+IQGs9heYtILJy4/zLtJSbWGpYAGrffxBJORwpE/5NJxQJ7ZShT/R82uHE91vqGK
 JLd9LfQe9RXsQT81hzvfe+0vzOI0sGZooQQ1HXgZWfQbQMz49YFSjP6ylSGdHwC7QYbb
 iseexKjF9Ttlw0si0Xfa9nI0rKOePg5AqywbEmqaSnTXSNDR+MZFSe4++RLBo2I9PKY1
 mfPvKdXSyfJy9yRvfzU1T10ODEHVBuK58f2hJ/Ncfg9oRHAtggCKtKxB6DcxO+Hoz9uL
 L6XVRYQnH2+mx+d6Bkn9C+VGxAJySEHP3uwVxxlaebwyp0c2GtJ99JjjW8JdcQQKUdtG
 Tukg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9U69ZOR0qEZGqZ3DsVw2NfIxCFPxdN0F2cnCNMl6Iak=;
 b=Cby9W9sAkG89ap2F4BMaC7UgQnu5ouDLYmGtljPUYP8WCAhs8M64hJsjES2q0VRi0R
 AXQo5/WDnC2C4snauN84X2+W1jE7Mu1/fyQCKLH+EQVrUKS+FPFOgBs5jiIGaDYJbzRc
 icgiUump0aFyC10+1K/sZ0g7bNQmI4vhZn7Lyav3HeA0Fdv7E18yMqtMOUNkstMaknSw
 Kzb7/aA9GWFU3CeD2TmF87npWqbTLXLUZ889F2Ks/R8ZwSTzi/6AvlnNiOz+nPIsO2sS
 3PFvps9831rwzEzh0kUxBEgOLZnvEi81Oje0gDKs5vnliyP4p1d6Mwph2T5QZoNL9oia
 fx+g==
X-Gm-Message-State: AOAM5314FXtaKwvrY4ZOhhb3W53tYmJgLTeubPtY3GwdzRfVv94Ca9GK
 N1OWaE2aF0YWeRW7FsgqMVAkiKSlLqIc0oK32B/lvtK8xio=
X-Google-Smtp-Source: ABdhPJzg23SOIxQnbfR1Rj65XxVrhY7bg8zzZRa97Fr5o4AOKfdOMqKRKIfxSbU1gRdkJHFNaeZDu/m4am7qgAzxkMk=
X-Received: by 2002:a05:620a:2686:: with SMTP id
 c6mr5867315qkp.223.1635174687495; 
 Mon, 25 Oct 2021 08:11:27 -0700 (PDT)
MIME-Version: 1.0
References: <20211021103605.735002-1-maarten.lankhorst@linux.intel.com>
 <20211021103605.735002-21-maarten.lankhorst@linux.intel.com>
In-Reply-To: <20211021103605.735002-21-maarten.lankhorst@linux.intel.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Mon, 25 Oct 2021 16:11:00 +0100
Message-ID: <CAM0jSHOKbNtCCOtF+EAjaEWfW3tQ_NHVqejz5gfmpqy3XLg0kw@mail.gmail.com>
Subject: Re: [PATCH 21/28] drm/i915: Drain the ttm delayed workqueue too
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>, 
 ML dri-devel <dri-devel@lists.freedesktop.org>
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

On Thu, 21 Oct 2021 at 11:37, Maarten Lankhorst
<maarten.lankhorst@linux.intel.com> wrote:
>
> Be thorough..
>
> Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>

Is this strictly needed for something? Needs a proper commit message anyway.

> ---
>  drivers/gpu/drm/i915/i915_drv.h | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
> index 22c891720c6d..7c5ed5957fe2 100644
> --- a/drivers/gpu/drm/i915/i915_drv.h
> +++ b/drivers/gpu/drm/i915/i915_drv.h
> @@ -1819,6 +1819,7 @@ static inline void i915_gem_drain_freed_objects(struct drm_i915_private *i915)
>          */
>         while (atomic_read(&i915->mm.free_count)) {
>                 flush_work(&i915->mm.free_work);
> +               flush_delayed_work(&i915->bdev.wq);
>                 rcu_barrier();
>         }
>  }
> --
> 2.33.0
>
