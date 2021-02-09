Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 93DA4315255
	for <lists+dri-devel@lfdr.de>; Tue,  9 Feb 2021 16:05:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E0036EB5D;
	Tue,  9 Feb 2021 15:05:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D180A6EB5D
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Feb 2021 15:05:47 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4595664EB4
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Feb 2021 15:05:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612883147;
 bh=WNG2+plq1S0seFeY7764YUq9JcgRytX1RRvs8QCgBaM=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=jfaxzGtYZQTgf6CtRT3vHUK3kQ5kQefSCcWG7uQvhpw9hdxC78X9gXwQ6OPsRpfQB
 lGhjie/bIvbwuCliDhRRBnU4PyF+v2pzkcI/W6K8YDDt+yZmRfwpuT+sj5mLPK3HYL
 GtC+nb7ohesRIrYcfkingkhd8Uwz6/F9r+Jgsr5WaWWcZLKWmbz0kvvBzNl8kvu5mb
 AyvIG4ra2uRo++yD1FvCuBrsYCnl9cjGBj2aL9gxoBU8CRmvFZ5I/E9rdGR00xCdCt
 5WpouCpvkShfue/r5o7TFuqvOXPcrUPtOYLdIAMbuO0JuDfFGwDU06cciGj7LIveQo
 TZpkPe7TgVkYg==
Received: by mail-ed1-f41.google.com with SMTP id s11so24149345edd.5
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Feb 2021 07:05:47 -0800 (PST)
X-Gm-Message-State: AOAM530KpNUeKLsw31NGchi/jPDrjtZZ+/OP/8T0+HUxO0CZFBAUhU+q
 H8HzoW2XM31uKTzD7BG3BuL6zqeQGAWKzOQn+g==
X-Google-Smtp-Source: ABdhPJxzjdLPP5+jClhtQ6hG2Lbhzn0FQse5ObS3jV2+efL8ibLjDygIesNoKqY4xtr1cPPyo0COxSLikdZ803og7gI=
X-Received: by 2002:a05:6402:6c7:: with SMTP id
 n7mr23618644edy.289.1612883145702; 
 Tue, 09 Feb 2021 07:05:45 -0800 (PST)
MIME-Version: 1.0
References: <20210205111757.585248-1-boris.brezillon@collabora.com>
 <20210205111757.585248-4-boris.brezillon@collabora.com>
In-Reply-To: <20210205111757.585248-4-boris.brezillon@collabora.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Tue, 9 Feb 2021 09:05:19 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLcQdAaU6nax1=2PgsM7LwTQADhG69rNYVx_Xg+D-dZCA@mail.gmail.com>
Message-ID: <CAL_JsqLcQdAaU6nax1=2PgsM7LwTQADhG69rNYVx_Xg+D-dZCA@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] drm/panfrost: Stay in the threaded MMU IRQ handler
 until we've handled all IRQs
To: Boris Brezillon <boris.brezillon@collabora.com>
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 Robin Murphy <robin.murphy@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Steven Price <steven.price@arm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Feb 5, 2021 at 5:18 AM Boris Brezillon
<boris.brezillon@collabora.com> wrote:
>
> Doing a hw-irq -> threaded-irq round-trip is counter-productive, stay
> in the threaded irq handler as long as we can.
>
> v2:
> * Rework the loop to avoid a goto
>
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> ---
>  drivers/gpu/drm/panfrost/panfrost_mmu.c | 26 +++++++++++++------------
>  1 file changed, 14 insertions(+), 12 deletions(-)

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
