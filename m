Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1455530D13B
	for <lists+dri-devel@lfdr.de>; Wed,  3 Feb 2021 03:07:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F200D6E23F;
	Wed,  3 Feb 2021 02:07:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A32B6E23F
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Feb 2021 02:07:51 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id h12so31055480lfp.9
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Feb 2021 18:07:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ayzfcSfxCvzlRbstGP9hGkgIcQ5hx1YuU1pxX+bWuHs=;
 b=eGlil+w2DCwQD8KK1xRdq7AIVCuqHRf5q1ar8b/Fy9tkCbGJE8I1o9Qh9anhQO2hK9
 xZmfjyfzF11eyHCvfh+oppTiW9/Xd1whsALSsj6vTiIjxqVyHaq3TV6bPu9hHW0k9y4E
 Cr2aFpB7ctiPfw+uWvahloZr+9eLF1MS6oRzP9XcHmFnx5EJc5khMz4vtafLlo2Rttda
 mQsJCiB4acmtmbiR7l0NS4lcvNKZK7ks3LGsQhkW0ctj4/iD3jp2/yPnn21S2B/fvdvm
 k/9L97xrZ36XRy3b1hTg6XmL3zJNXAiUgdCzJG/Aw1DV2xr1LsWaEybvLB6qFi3fliAC
 PFXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ayzfcSfxCvzlRbstGP9hGkgIcQ5hx1YuU1pxX+bWuHs=;
 b=NZgFitRHe50uatrdxwOC5C/4AU8ceytm0JFtUJ1MhcCMnms2dcpm2Wrdu3/d4uRI+Y
 l8vZtL4AvHm+ZV8N2Dxyzmv1+rHThiyw58Ufl7DiCpDGTPoaZWz3fnlvAQv/M2zlMI7b
 ot+H1bal0xkIEIDSt4LJGAlifNG0me/jS5zVJpY8plEH5GPh5Qvs4G7cot7LdMgkMzgj
 iJduZ6QsGlypOgCavcVaqF08+7bY5cRCBNkxPG0Pe6LbL5cjXobxx/nJyuxod0ZQDc3B
 DVlEqXTkTNrmojXvAY5cQwINWlXNBXSRuUYPirtAdG0s+ESz0oXEQ3/tA8nuIMoHZIKS
 JKbA==
X-Gm-Message-State: AOAM531/nBWj5ZIWPeBez1yiXtwbJMK2d0ga23wcrgDPdoFIXOKWnZOf
 +8Q3OGJR8eUPkx7neTPlX8LHzWenIgU11BoBDQ8GQw==
X-Google-Smtp-Source: ABdhPJz/zm1PeC2ZluNB85wRkNtw1G6dZzG/v+ZbpRoZh6RdqPs9LSsJ6rK/g2cd13qi3PrT9YkluWDRlb8ciDHM4uI=
X-Received: by 2002:ac2:5590:: with SMTP id v16mr454568lfg.626.1612318069555; 
 Tue, 02 Feb 2021 18:07:49 -0800 (PST)
MIME-Version: 1.0
References: <20210203003134.2422308-1-surenb@google.com>
 <20210203003134.2422308-2-surenb@google.com>
In-Reply-To: <20210203003134.2422308-2-surenb@google.com>
From: John Stultz <john.stultz@linaro.org>
Date: Tue, 2 Feb 2021 18:07:38 -0800
Message-ID: <CALAqxLWJNDDx_MFvYHszFXy=aV9bZGi50L3zDtuGaiYUbHKHSA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] dma-buf: heaps: Map system heap pages as managed
 by linux vm
To: Suren Baghdasaryan <surenb@google.com>
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
Cc: "moderated list:DMA BUFFER SHARING FRAMEWORK"
 <linaro-mm-sig@lists.linaro.org>,
 =?UTF-8?Q?=C3=98rjan_Eide?= <orjan.eide@arm.com>,
 Sandeep Patil <sspatil@google.com>,
 Christian Koenig <christian.koenig@amd.com>,
 Android Kernel Team <kernel-team@android.com>,
 James Jones <jajones@nvidia.com>, lkml <linux-kernel@vger.kernel.org>,
 Liam Mark <lmark@codeaurora.org>, Christoph Hellwig <hch@infradead.org>,
 Minchan Kim <minchan@kernel.org>, linux-mm <linux-mm@kvack.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Chris Goldsworthy <cgoldswo@codeaurora.org>,
 Hridya Valsaraju <hridya@google.com>,
 Andrew Morton <akpm@linux-foundation.org>, Laura Abbott <labbott@redhat.com>,
 Robin Murphy <robin.murphy@arm.com>, linux-media <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Feb 2, 2021 at 4:31 PM Suren Baghdasaryan <surenb@google.com> wrote:
> Currently system heap maps its buffers with VM_PFNMAP flag using
> remap_pfn_range. This results in such buffers not being accounted
> for in PSS calculations because vm treats this memory as having no
> page structs. Without page structs there are no counters representing
> how many processes are mapping a page and therefore PSS calculation
> is impossible.
> Historically, ION driver used to map its buffers as VM_PFNMAP areas
> due to memory carveouts that did not have page structs [1]. That
> is not the case anymore and it seems there was desire to move away
> from remap_pfn_range [2].
> Dmabuf system heap design inherits this ION behavior and maps its
> pages using remap_pfn_range even though allocated pages are backed
> by page structs.
> Replace remap_pfn_range with vm_insert_page, following Laura's suggestion
> in [1]. This would allow correct PSS calculation for dmabufs.
>
> [1] https://driverdev-devel.linuxdriverproject.narkive.com/v0fJGpaD/using-ion-memory-for-direct-io
> [2] http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/2018-October/127519.html
> (sorry, could not find lore links for these discussions)
>
> Suggested-by: Laura Abbott <labbott@kernel.org>
> Signed-off-by: Suren Baghdasaryan <surenb@google.com>

For consistency, do we need something similar for the cma heap as well?

thanks
-john
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
