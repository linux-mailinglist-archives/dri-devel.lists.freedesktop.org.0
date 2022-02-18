Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AB654BC750
	for <lists+dri-devel@lfdr.de>; Sat, 19 Feb 2022 11:02:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0B6710F672;
	Sat, 19 Feb 2022 10:02:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1133.google.com (mail-yw1-x1133.google.com
 [IPv6:2607:f8b0:4864:20::1133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD0D510EBF6
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Feb 2022 13:05:37 +0000 (UTC)
Received: by mail-yw1-x1133.google.com with SMTP id
 00721157ae682-2d6923bca1aso56637697b3.9
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Feb 2022 05:05:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=93CVqQreNey4UxGTD3l51x3Bbik2BD7CmQHLf6XaIHw=;
 b=SehDqi+GFuUda/fggyakKXC3GucwEVDzfyQ+XB9SegLzhnRdrEK7aOvlk06jwkzCsS
 aNaSLYT+u+8pGDTa6UjxHl1z8UdBLaj0G/HWoaslLDhTyhLJg9cGPFP+Y6it77yj34pM
 tFCzlWkyBqHljmskcdiiY81P7bZ5VzAUc2D5oDJkUhlSsNIDaEDZqmc6HVSKvgvsGWwa
 nEx03mCYzfg4NNLI/TK2UKoqYUJ/BWOdpZ4uoww3tVdfX3l5hbuamJYD5Ic9lKdNcPPA
 6yHpMj89muImtCYlQ/NSY24a+GuI562an7j8znatM/94Eb4hg1AvJQIlfSgm/3qAqJid
 zvvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=93CVqQreNey4UxGTD3l51x3Bbik2BD7CmQHLf6XaIHw=;
 b=d5srnsNJGj9roRh7S3w2HrXNO1qlvwf2FsZWjCmoV6qUsB9GttBVbfr5Z2drHu1iL2
 5UdTCERker56Na82S+eOEtJwECT1XLoLphuhErLL92bN3bUZOwxsgXhGbiHqM0bfASrx
 h4dvOf/iJ5KJVRMfaBpkbR/Sd3uFPxwvqWex6Sj7bBIwR8kRNbuazL8VlIZeBKIWRUk/
 bld/6Odq/k/2PSLcbhFhG+FbFuoB81n2q2bDvea9MR+WVU/0t+gP8b3dicLumYJB0+T5
 hLh0S5y4VOVk1gxy7ZKF2Bv6/QiLnsn7QvikWwbo/D3uiCJ2P5JyLmVTEN9hWMjtAp44
 +aoQ==
X-Gm-Message-State: AOAM531ZVMbGDS+krgpix3U9HCetyFVr2d9udiDTnk0BnEmmXjpXdA1Z
 xEAUPJjjhQKYNanMv2A/34DRi8WQW3auEK4UUrliP6yCjr0qm/L1
X-Google-Smtp-Source: ABdhPJzQYHdum9Us26v+wAaJ5eNXNrTZvi6ppwsd2WRgDYD9Vt2zVCDpVIbdO7xcL4XMVutgalQNlOxbsGcJqi6X7k0=
X-Received: by 2002:a81:1516:0:b0:2d0:e7ca:2a5 with SMTP id
 22-20020a811516000000b002d0e7ca02a5mr7291377ywv.55.1645189536473; Fri, 18 Feb
 2022 05:05:36 -0800 (PST)
MIME-Version: 1.0
References: <20220217140441.1218045-1-andrzej.hajda@intel.com>
 <20220217140441.1218045-6-andrzej.hajda@intel.com>
 <CANn89i+nCZ6LV_1E2OnJ4qWE0XkO2FGW+A6_tkmQpdxiiEh=LQ@mail.gmail.com>
 <8f6fb098-d0d9-910e-7d42-9fbc541f9891@intel.com>
In-Reply-To: <8f6fb098-d0d9-910e-7d42-9fbc541f9891@intel.com>
From: Eric Dumazet <edumazet@google.com>
Date: Fri, 18 Feb 2022 05:05:25 -0800
Message-ID: <CANn89iLHd+Y=7xqx0OqfHXmqnUhhRycTARGfgq-y79Xhy5OQew@mail.gmail.com>
Subject: Re: [PATCH 5/9] lib/ref_tracker: improve allocation flags
To: Andrzej Hajda <andrzej.hajda@intel.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Sat, 19 Feb 2022 10:01:55 +0000
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
Cc: Chris Wilson <chris.p.wilson@intel.com>, netdev <netdev@vger.kernel.org>,
 intel-gfx@lists.freedesktop.org, Lucas De Marchi <lucas.demarchi@intel.com>,
 LKML <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 Jakub Kicinski <kuba@kernel.org>, Dmitry Vyukov <dvyukov@google.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Feb 18, 2022 at 2:28 AM Andrzej Hajda <andrzej.hajda@intel.com> wrote:
> > git log --oneline 5740d0689096..4d449bdc5b26 --no-merges -- lib/ref_tracker.c
> > c2d1e3df4af59261777b39c2e47476acd4d1cbeb ref_tracker: remove
> > filter_irq_stacks() call
> > 8fd5522f44dcd7f05454ddc4f16d0f821b676cd9 ref_tracker: add a count of
> > untracked references
> > e3ececfe668facd87d920b608349a32607060e66 ref_tracker: implement
> > use-after-free detection
>
>
> So I will cherry-pick these patches into next version of patchset, with
> "NO MERGE" annotation (to allow testing), and if my ref_track patches
> will be accepted then they can go via net-dev tree and intel patches
> will wait till update of drm-tip.
> Is this scenario OK?

One possibility would be to split your patch series in two, to merge
the ref_tracker changes directly in net-next asap.

But I have no strong opinion, maybe Jakub/David have some guidance.
