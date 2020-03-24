Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D9CEF191347
	for <lists+dri-devel@lfdr.de>; Tue, 24 Mar 2020 15:35:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30CCE6E287;
	Tue, 24 Mar 2020 14:35:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe44.google.com (mail-vs1-xe44.google.com
 [IPv6:2607:f8b0:4864:20::e44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADE4E6E287
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Mar 2020 14:35:34 +0000 (UTC)
Received: by mail-vs1-xe44.google.com with SMTP id j128so4659737vsd.6
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Mar 2020 07:35:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vHxRlatObgRvnysxTZAZ7i5pl1JSDT2R3bHKmGhkgUE=;
 b=YiMsSpudpT6FxZHxA6De/saSAHGXK7VlyDXtpNtN9hNzxOPelBBcnUkk9LPz8Mz4Ir
 KztvWvGmrqbAk7jwUQE14sSAWV4hf05oN5i6odmjR/cou/29qpALc9peKPyrjgXDkrAc
 oq6V4L/S8pZ9LSBWm00J5so+SUpk1hSQ8Va+g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vHxRlatObgRvnysxTZAZ7i5pl1JSDT2R3bHKmGhkgUE=;
 b=gWpQzTvQXafLFL/Rex1JPqVEUpbQlazgmKtzZ9kRp7ZBz67CeYlop6UVTQIpn/CZyf
 CFYeLyAgRYTgwiAIWa6Aox5OF+ATNN8tlTICUFfWEc/hzQ5o/joGkdYVGwGjPw5urc24
 GfeKu5pU8V5pXUI6t3XCqqdnzOlU6oBBM2nfnd+zr+t59yIJ16X33at4Qztidqfq15pQ
 hYineporieiIgMq1lwCaCa4u6dCzXQdmbk1AkSZixANG4WV4VjyR05ekzahAAjpoMWWp
 AAgt2/61005TlOGsdF6KKMr6vdepbccn132VLQ3aZKYwN7uYLZAX7ztyjU//I0oFh0wc
 NWOg==
X-Gm-Message-State: ANhLgQ3n1tLHIm3P2TyP3KnCiU7kOIhZEu5n0l1Q/JunUhFSyje8A1Pg
 Zo9DkDUJQzBTLmHCjTIUCI8cvyYgnK8=
X-Google-Smtp-Source: ADFU+vvEXoHp1sMv4WlM2FBSRtHCy2Ds++G5EB1UyTQaTsGeDlDKXPpYuITpiAmEN+uOZe6X8ZctnQ==
X-Received: by 2002:a67:ffd0:: with SMTP id w16mr11272260vsq.151.1585060533332; 
 Tue, 24 Mar 2020 07:35:33 -0700 (PDT)
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com.
 [209.85.222.42])
 by smtp.gmail.com with ESMTPSA id s17sm8991192vsc.27.2020.03.24.07.35.32
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Mar 2020 07:35:32 -0700 (PDT)
Received: by mail-ua1-f42.google.com with SMTP id o16so6378379uap.6
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Mar 2020 07:35:32 -0700 (PDT)
X-Received: by 2002:a9f:300a:: with SMTP id h10mr18039835uab.91.1585060531555; 
 Tue, 24 Mar 2020 07:35:31 -0700 (PDT)
MIME-Version: 1.0
References: <1584944027-1730-1-git-send-email-kalyan_t@codeaurora.org>
In-Reply-To: <1584944027-1730-1-git-send-email-kalyan_t@codeaurora.org>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 24 Mar 2020 07:35:18 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VX+Lj=NeZnYxDv9gLYUiwUO6brwvDSL8dbs1MTF4ieuA@mail.gmail.com>
Message-ID: <CAD=FV=VX+Lj=NeZnYxDv9gLYUiwUO6brwvDSL8dbs1MTF4ieuA@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dpu: ensure device suspend happens during PM sleep
To: Kalyan Thota <kalyan_t@codeaurora.org>
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, mkrishn@codeaurora.org,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>, travitej@codeaurora.org,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Sean Paul <seanpaul@chromium.org>,
 "Kristian H. Kristensen" <hoegsberg@chromium.org>,
 freedreno <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Sun, Mar 22, 2020 at 11:14 PM Kalyan Thota <kalyan_t@codeaurora.org> wrote:
>
> "The PM core always increments the runtime usage counter
> before calling the ->suspend() callback and decrements it
> after calling the ->resume() callback"
>
> DPU and DSI are managed as runtime devices. When
> suspend is triggered, PM core adds a refcount on all the
> devices and calls device suspend, since usage count is
> already incremented, runtime suspend was not getting called
> and it kept the clocks on which resulted in target not
> entering into XO shutdown.
>
> Add changes to manage runtime devices during pm sleep.
>
> Changes in v1:
>  - Remove unnecessary checks in the function
>      _dpu_kms_disable_dpu (Rob Clark).

I'm wondering what happened with my feedback on v1, AKA:

https://lore.kernel.org/r/CAD=FV=VxzEV40g+ieuEN+7o=34+wM8MHO8o7T5zA1Yosx7SVWg@mail.gmail.com

Maybe you didn't see it?  ...or if you or Rob think I'm way off base
(always possible) then please tell me so.

Thanks!

-Doug
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
