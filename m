Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 43006461D4D
	for <lists+dri-devel@lfdr.de>; Mon, 29 Nov 2021 19:05:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 981D26E500;
	Mon, 29 Nov 2021 18:05:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DB326E500
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Nov 2021 18:05:14 +0000 (UTC)
Received: by mail-lj1-x22d.google.com with SMTP id d11so36079049ljg.8
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Nov 2021 10:05:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IDi3zvjd6u7ZBVvXAka/LTSyAvUkqeh+L5SnX6c8Zdk=;
 b=ELtQ57DjVTWJPnvASv4jZtvg9xzVjpRXdLK6WadVUiqQO2Tejx2Y4rP/jZvsvwdaGM
 wVK5qYNcJTRTVvihhUy6a3XfzO7ShXe3HSKg9CJ9S9TdxAt3X4+ddQNsKXsRbhOEV3Nn
 NeS7l4DPoqAaH0j+Gm2rrnRobzgyBp+zZRI4nhmfoSItyMTQPe6HJsrb3a8uXIO7pAUp
 d0pHSCno/fnC3Fp0q+W51eSWigYy/I5qIJhRZa/O1KEhI708OF8jeLET61Dg8b9kw0VH
 st1/mw7gEQ1NVGLv+ANo/xqXiZgR94N5ykkWzVgrrh3SWq2UdJQ1DTZyuwBI86rq3HIq
 HE3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IDi3zvjd6u7ZBVvXAka/LTSyAvUkqeh+L5SnX6c8Zdk=;
 b=7vQZYg4ontut9eq5/6C200Kk45lBgdQQ1KfkjLCsHZ0aqdwJZ0Xpsq9DLK14vpRssT
 kLcI8RQb3YStMEnbXlVwSWGvO2bB/VFTuiWLLxKln9jrSMltNDu0l/82D6RMp2JrSeO6
 de3yK5/iLnHhkyxbrvsHZa7N3Znl6tzq3YDc13/qcKBZPvSWlMYNFuMhhmm3TveHXqO/
 H8GUWUHMdXKe7ejaU2PDNZRJto+7DxtVI/lVLmM2C9JB411i9QX0t7BmuG5a26xVXfRt
 El4DGHdEgaMP4+nEJ8B2NgdlN1A+ZuoXXCNYEGd4Yy+1zLUzxIf7hgTwUQjXI5DacWP1
 3F2w==
X-Gm-Message-State: AOAM531BxmL5Q4n28f/iMK0km4XnsXtJVViTTltJd/qVMCtz3Rg6KSkm
 TMxPnVsDntTUzd1jgk9omX+cWvK52jzQ3jEauC7c2A==
X-Google-Smtp-Source: ABdhPJz00rJJqhFv+eY/G4mQJbhWwtM/vfpfxJXb8qlKInsjRYgNcLli9eLdqgC5XVztKYKpkdzK0NNalzo7Gw9l8CQ=
X-Received: by 2002:a2e:95d3:: with SMTP id y19mr50881703ljh.175.1638209112922; 
 Mon, 29 Nov 2021 10:05:12 -0800 (PST)
MIME-Version: 1.0
References: <YaB/JHP/pMbgRJ1O@kroah.com>
 <20211126074904.88388-1-guangming.cao@mediatek.com>
In-Reply-To: <20211126074904.88388-1-guangming.cao@mediatek.com>
From: John Stultz <john.stultz@linaro.org>
Date: Mon, 29 Nov 2021 10:05:00 -0800
Message-ID: <CALAqxLVF1BPznzwjem2BcsDDoo5gMoBqjKEceZDLJan4zCtk3w@mail.gmail.com>
Subject: Re: [PATCH v4] dma-buf: system_heap: Use 'for_each_sgtable_sg' in
 pages free flow
To: guangming.cao@mediatek.com
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
Cc: wsd_upstream@mediatek.com, kuan-ying.lee@mediatek.com, greg@kroah.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 christian.koenig@amd.com, linaro-mm-sig@lists.linaro.org,
 linux-mediatek@lists.infradead.org, lmark@codeaurora.org,
 benjamin.gaignard@linaro.org, matthias.bgg@gmail.com, stable@vger.kernel.org,
 labbott@redhat.com, robin.murphy@arm.com, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Nov 25, 2021 at 11:48 PM <guangming.cao@mediatek.com> wrote:
>
> From: Guangming <Guangming.Cao@mediatek.com>
>
> For previous version, it uses 'sg_table.nent's to traverse sg_table in pages
> free flow.
> However, 'sg_table.nents' is reassigned in 'dma_map_sg', it means the number of
> created entries in the DMA adderess space.
> So, use 'sg_table.nents' in pages free flow will case some pages can't be freed.
>
> Here we should use sg_table.orig_nents to free pages memory, but use the
> sgtable helper 'for each_sgtable_sg'(, instead of the previous rather common
> helper 'for_each_sg' which maybe cause memory leak) is much better.
>
> Fixes: d963ab0f15fb0 ("dma-buf: system_heap: Allocate higher order pages if available")
> Signed-off-by: Guangming <Guangming.Cao@mediatek.com>
> Reviewed-by: Robin Murphy <robin.murphy@arm.com>
> Cc: <stable@vger.kernel.org> # 5.11.*

Thanks so much for catching this and sending in all the revisions!

Reviewed-by: John Stultz <john.stultz@linaro.org>
