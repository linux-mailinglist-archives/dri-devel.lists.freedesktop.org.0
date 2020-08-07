Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 26D9223F331
	for <lists+dri-devel@lfdr.de>; Fri,  7 Aug 2020 21:47:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 766CA6E046;
	Fri,  7 Aug 2020 19:47:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFDB36E046
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Aug 2020 19:47:22 +0000 (UTC)
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com
 [209.85.167.173])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5B4202086A
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Aug 2020 19:47:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1596829642;
 bh=3J6m0L2M1H6OYUCNqt6X/ozt7tphzFWFRd3BR+Q4sdE=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=ZsZVOnU0pSYlXCiknGgpzZ+yoJggEaZQgAobS6FE23rUVqN6a8RbLV9/R4gY80skh
 l2n9eHAw4Outhaghsb5o7cqPeB7bhMxJ1pXv2nojezu/Hu779bT/VAplrQWS2bVnPb
 5oQHwGBk8XQ38k63F6pkOUCGCDBITrtsK1rQSnxg=
Received: by mail-oi1-f173.google.com with SMTP id b22so2945807oic.8
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Aug 2020 12:47:22 -0700 (PDT)
X-Gm-Message-State: AOAM532QzLJ0OKTHuG+sMWmxNIv7y0zaH51J3WDUMPiKajZTGDxaYhG5
 iXPnsly/+pd9dgwNpe+fcMx8pQD25Y5FGBRuPQ==
X-Google-Smtp-Source: ABdhPJyDBKNKazQW/H5+sfR53s7164vQnk9FjIqPg3Oig0DKLylafCiJV+BIvaMmp1qTHNFx1uIlWVQ5HREMyGpLsKY=
X-Received: by 2002:aca:bb82:: with SMTP id
 l124mr12846734oif.106.1596829641729; 
 Fri, 07 Aug 2020 12:47:21 -0700 (PDT)
MIME-Version: 1.0
References: <20200611085900.49740-1-tomeu.vizoso@collabora.com>
In-Reply-To: <20200611085900.49740-1-tomeu.vizoso@collabora.com>
From: Rob Herring <robh@kernel.org>
Date: Fri, 7 Aug 2020 13:47:10 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLw9t0GJ4dDu6DgW4_Vwy3LzX_uCUJYXCN5rD-WUNEHTA@mail.gmail.com>
Message-ID: <CAL_JsqLw9t0GJ4dDu6DgW4_Vwy3LzX_uCUJYXCN5rD-WUNEHTA@mail.gmail.com>
Subject: Re: [PATCH 1/2] panfrost: Make sure GPU is powered on when reading
 GPU_LATEST_FLUSH_ID
To: Tomeu Vizoso <tomeu.vizoso@collabora.com>
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
Cc: David Airlie <airlied@linux.ie>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Steven Price <steven.price@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jun 11, 2020 at 2:59 AM Tomeu Vizoso <tomeu.vizoso@collabora.com> wrote:
>
> Bifrost devices do support the flush reduction feature, so on first job
> submit we were trying to read the register while still powered off.
>
> If the GPU is powered off, the feature doesn't bring any benefit, so
> don't try to read.
>
> Signed-off-by: Tomeu Vizoso <tomeu.vizoso@collabora.com>
> ---
>  drivers/gpu/drm/panfrost/panfrost_gpu.c | 14 ++++++++++++--
>  1 file changed, 12 insertions(+), 2 deletions(-)

Both patches applied.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
