Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C1BD55B864
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jun 2022 09:59:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5002410E8FF;
	Mon, 27 Jun 2022 07:59:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1130.google.com (mail-yw1-x1130.google.com
 [IPv6:2607:f8b0:4864:20::1130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2861B10E8FF
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jun 2022 07:59:45 +0000 (UTC)
Received: by mail-yw1-x1130.google.com with SMTP id
 00721157ae682-3177e60d980so76950577b3.12
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jun 2022 00:59:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PLbnVfK5qQEeQYnfPgPZcOxuISU/J4AuEIo4n5DoLMs=;
 b=UZfIAOqSuYd4sEobLjGHaElE4Xp1N278qe1VP25+60RNjCFwyV6+9siBVa31jpTz6u
 3bqcwIGrfmsd/CgbWBvC1xjZyARRnRC11XTHEnGjPUgTt8uKLyHSF1OfzRXbXKiLzau+
 vXbJNsDzN2YkspD12MS0ZXCbqPenc+xEmGcgyRlIAS8S+RCtfxnMDrfK7i6nKNGR8c0e
 tvb6MFfa8h4RmTM5VWRI6oc6FLcGELBL6Tj7hgPLlGU1KOiziNyxSm4gzkli/cojKUZm
 ILo8Dz9fXbYpguE/yTBMA3EkL2k7QygqEA2SJEJNZuiC0SP8IQD/PAGpI5JiZ0GpXYeg
 lTVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PLbnVfK5qQEeQYnfPgPZcOxuISU/J4AuEIo4n5DoLMs=;
 b=YFt5rcMVb+4v4xAGAMHZNc15dcSXW+x2o9mahNTtShXqRuvNeoFjIUdf8qaeBmOX9s
 JL0hutNkyTf68MaT4JoMPXNclG66H1RBlUQ+Eb3+RStels3f2zA2zEFJfxB5wiW3ckZT
 3j5/h9JKcCyxPsg+4v+8RcNPe55xXuMFNogsNb+GzzAFIe6dEUS14J914taAvOzUGHfZ
 dG6FgsMZbF/tbp6BGOxjNrBtsrEsRssaYrBl9+qqprJPpNtoFsT+NYsJbhxcgCYslnv0
 2ztl2w+u3CiAKRCLSz8zast1yUxejH7ZXKH/ZkooMhJmwIDSI/5fVt2sBXWY/Y/IKQIc
 mm1A==
X-Gm-Message-State: AJIora/EVKDO1IC5aOZyavIgddE4RD2EqhSs465LNPeaPrrd8W4q5Cna
 Z6ak3TLVXMrErddQ/MVY+QBhazqLegEnsnzccUytrA7np98=
X-Google-Smtp-Source: AGRyM1s8ANsng0ns1eq80nIWyEjCbn1cuhBkyhhVoT4XDy7EcNhK9EPjms3Z1YNrJJlZ8AIuZJaJHReEf3JvhDiAuh0=
X-Received: by 2002:a0d:eace:0:b0:317:87ac:b3a8 with SMTP id
 t197-20020a0deace000000b0031787acb3a8mr13750237ywe.126.1656316784367; Mon, 27
 Jun 2022 00:59:44 -0700 (PDT)
MIME-Version: 1.0
References: <20220525115411.65455-1-linmq006@gmail.com>
In-Reply-To: <20220525115411.65455-1-linmq006@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 27 Jun 2022 09:59:33 +0200
Message-ID: <CACRpkdbS2Ksdo1kP-LZ5Dva-ZY_R9k5Nai2nAji+OGouYCAZHA@mail.gmail.com>
Subject: Re: [PATCH] drm/mcde: Fix refcount leak in mcde_dsi_bind
To: Miaoqian Lin <linmq006@gmail.com>
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, May 25, 2022 at 1:54 PM Miaoqian Lin <linmq006@gmail.com> wrote:

> Every iteration of for_each_available_child_of_node() decrements
> the reference counter of the previous node. There is no decrement
> when break out from the loop and results in refcount leak.
> Add missing of_node_put() to fix this.
>
> Fixes: 5fc537bfd000 ("drm/mcde: Add new driver for ST-Ericsson MCDE")
> Signed-off-by: Miaoqian Lin <linmq006@gmail.com>

Patch applied for next as nonurgent fix.

Yours,
Linus Walleij
