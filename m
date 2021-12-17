Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CCAB4789DF
	for <lists+dri-devel@lfdr.de>; Fri, 17 Dec 2021 12:25:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4DA410FE16;
	Fri, 17 Dec 2021 11:25:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x829.google.com (mail-qt1-x829.google.com
 [IPv6:2607:f8b0:4864:20::829])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1F4210FE15;
 Fri, 17 Dec 2021 11:25:32 +0000 (UTC)
Received: by mail-qt1-x829.google.com with SMTP id f20so2202984qtb.4;
 Fri, 17 Dec 2021 03:25:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=D2+oC7kA/ziH+xhljaFmiOGxCf2s0lQTr3FhWXBo0pM=;
 b=jMvcfg1ASwDmgFVxuXONgHKQDLCKfaKvZvBpeA+4APRJ9UPjlTtWPIXswg1fFU3gh5
 COcgTwtv93N2iOueUsZ+oA7g5twqjBcn6r+BAcokV7KimjigaJMgsXbUlYSkGKWokqiA
 cPxyQlRdLxFLswN7r6e0jWV0M3lbSYI868MZ7vLL1i2+xMkkpDcce2umsXGx8Wec7zx3
 iSWe1KrlzG2+eIX67wKqDZwwH68KfpXMtUSxwTaS1y4dAIhAso8Vi8ZZ92ceL6i/P1O/
 lvdjCLTBS3dhe1lf2EuaZ+B8YJaE6VLBxQvp+iDeQiTSJ1YAGSurT9cBO/UtB0bLtybg
 VNlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=D2+oC7kA/ziH+xhljaFmiOGxCf2s0lQTr3FhWXBo0pM=;
 b=HGTG15Vv4S+MgJcmG1c0doVRwuwTMDrRrHMmN4ZX/0kX3/eV9G1PAO7NvhIruD1SFP
 l51qgDklj78U8embphG2Vi6/WgxYHKz7IHNKRySCB0oSq3qVLlaYxdBXMBQsChW/qiHj
 3WuvFn9/bk1oG8E9eRdaRjDS6uOWDoMRBCB3SqjfnOu8dYxNnT7WIpPwowRxy8KgBGgM
 P8d9m03TxTLbg3Qu8vhCryr385LQcQiBc9vRXaRZ1zrkF3jjCozQa714/Btk+2nucaQY
 z0acNxGEsRz0pNsmMYQXbkVsY4Q8X2kVXR/oqGSx7+SLDrpD6xB8BqAnXs1Ynf9gpFfe
 v+Hg==
X-Gm-Message-State: AOAM531Nspf8CutC/pfh4TUXsRwu0N1zYp+zpTOxFXqhQX/2TW1zHyxI
 ErUKxkle40u08ux+5rOD4lqfDbb8r3Wy5/JPgASKU3Uhuic=
X-Google-Smtp-Source: ABdhPJyQDvgzhoOQ0rshBtv7ZIKfE1/gvd8RS+iCuGKScYh4HHutGprxEXY4JKET8Vds4WdaLzBsxmC1ndlj1QkwxPc=
X-Received: by 2002:ac8:5bd6:: with SMTP id b22mr1792041qtb.231.1639740332028; 
 Fri, 17 Dec 2021 03:25:32 -0800 (PST)
MIME-Version: 1.0
References: <20211216142749.1966107-1-maarten.lankhorst@linux.intel.com>
 <20211216142749.1966107-8-maarten.lankhorst@linux.intel.com>
In-Reply-To: <20211216142749.1966107-8-maarten.lankhorst@linux.intel.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Fri, 17 Dec 2021 11:25:05 +0000
Message-ID: <CAM0jSHOHyOq3pOQ5zU1oQVAzFoh9g9uSBb6pkP7ZME_OTOv5Gg@mail.gmail.com>
Subject: Re: [PATCH v3 07/17] drm/i915: Ensure i915_vma tests do not get
 -ENOSPC with the locking changes.
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

On Thu, 16 Dec 2021 at 14:28, Maarten Lankhorst
<maarten.lankhorst@linux.intel.com> wrote:
>
> Now that we require locking to evict, multiple vmas from the same object
> might not be evicted. This is expected and required, because execbuf will
> move to short-term pinning by using the lock only. This will cause these
> tests to fail, because they create a ton of vma's for the same object.
>
> Unbind manually to prevent spurious -ENOSPC in those mock tests.
>
> Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
