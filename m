Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 592433F6BB9
	for <lists+dri-devel@lfdr.de>; Wed, 25 Aug 2021 00:32:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12A1289428;
	Tue, 24 Aug 2021 22:32:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D597C89428
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Aug 2021 22:32:31 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 975BD61265
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Aug 2021 22:32:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1629844351;
 bh=10CR99EYOcsvAxA/Al3XzcQv8Nj0aWopUCUoKMem1aI=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=eZdREbvxJGaWnWCOe5A1PfaFfh/XlBVfjTXifmqJDLl/5AMmLfk9WBaV87ALhEtgZ
 DiBTDQzH+btFTaKMLsUePpKghcDQ0qoeLOVUf9H03QaPJZXaL2qavo+/IIDBXMmuvw
 DRJljmzht2nl9hkWv54Odc6wuXoHU6ikTBQTUhHMt0DMRt0jCj8C7vNnz7aw8/kOmz
 1plTeStOd3wYk7DMQpu8j/QGrR64YqGzl/XWyztzBJ+UkcPx8u3rWHsIVGvY3MEdDZ
 ci/U0y3h/10ddcNZyLr+OebXDZSx9d6zQiCwAcI0UYf6OgtWbhDINNmg5/xWJp/31+
 gxFunG9720K8Q==
Received: by mail-ej1-f47.google.com with SMTP id u3so47497257ejz.1
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Aug 2021 15:32:31 -0700 (PDT)
X-Gm-Message-State: AOAM532xY+gYnrnCRTgmSzwmd1rAbdnZT1LxSyQhHqLk1yj2oVgFQ93t
 go1GPGtJMxjadQ9/rTfKMxgTU+bz0oO7iIjYvQ==
X-Google-Smtp-Source: ABdhPJwcT3E/+4reEOVVj9eK7xhPUpapFeT3ObUfnT1HAlL5ATW6K5J1ynlDlfctI2sMynrJHYKufcQCmtV5oFGR6PA=
X-Received: by 2002:a17:906:ff41:: with SMTP id
 zo1mr12446795ejb.525.1629844350263; 
 Tue, 24 Aug 2021 15:32:30 -0700 (PDT)
MIME-Version: 1.0
References: <20210824172614.7299-1-alyssa.rosenzweig@collabora.com>
In-Reply-To: <20210824172614.7299-1-alyssa.rosenzweig@collabora.com>
From: Rob Herring <robh@kernel.org>
Date: Tue, 24 Aug 2021 17:32:18 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+L7JRhcuy7vgPocGf48KeeW1wBXcw=MZ0r8h5FKHTZ5g@mail.gmail.com>
Message-ID: <CAL_Jsq+L7JRhcuy7vgPocGf48KeeW1wBXcw=MZ0r8h5FKHTZ5g@mail.gmail.com>
Subject: Re: [PATCH] drm/panfrost: Use upper/lower_32_bits helpers
To: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
Cc: dri-devel <dri-devel@lists.freedesktop.org>, 
 Tomeu Vizoso <tomeu.vizoso@collabora.com>, Steven Price <steven.price@arm.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
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

On Tue, Aug 24, 2021 at 12:27 PM Alyssa Rosenzweig
<alyssa.rosenzweig@collabora.com> wrote:
>
> Use upper_32_bits/lower_32_bits helpers instead of open-coding them.
> This is easier to scan quickly compared to bitwise manipulation, and it
> is pleasingly symmetric. I noticed this when debugging lock_region,
> which had a particularly "creative" way of writing upper_32_bits.
>
> Signed-off-by: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
> ---
>  drivers/gpu/drm/panfrost/panfrost_job.c |  8 ++++----
>  drivers/gpu/drm/panfrost/panfrost_mmu.c | 12 ++++++------
>  2 files changed, 10 insertions(+), 10 deletions(-)

Reviewed-by: Rob Herring <robh@kernel.org>
