Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC9B334DFC8
	for <lists+dri-devel@lfdr.de>; Tue, 30 Mar 2021 05:59:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C2E56E849;
	Tue, 30 Mar 2021 03:59:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1A216E849;
 Tue, 30 Mar 2021 03:59:28 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id v11so14757120wro.7;
 Mon, 29 Mar 2021 20:59:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rM9L+7Kw3lO7Pp/XFwkGX6YGb/YVHvAdXNzLLxwfl1w=;
 b=d5r347TSpxGfn0IJ/N8JbKpxDmaafhKU5rNf58YqPHt5eTga6M8/CJYPn4c/3bO1e7
 oLowg+kak8vfpk2OM8l5bkPysCGNpJv+xzUHKoWzsYEy0xAIHVgEP+VawDDV/fIWC0zD
 CMaOLM00fzD5OdZyuBkurYektDz1zDDgrTubQCJBa1c/1ODt2sn+qbEqBAOa8scjFZ90
 ZAX4A3O61vdNTaS+gQOaVFxKMfdnoyzPAPpeEfCbK/SkdedCiktnmLb/vJWLRqtgnbla
 FyB7EDUDvngPW16tQCzd0aF3eRnJoo6QkGqpWoH3M5jWEcrOOpzS0E7S30b9pS7S2L5g
 ibZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rM9L+7Kw3lO7Pp/XFwkGX6YGb/YVHvAdXNzLLxwfl1w=;
 b=VwcaMAZsVXHzBMJYul/uv1diFllMesVb9PK7L4SxcESxIYdiwjvF3mFp/TbjZBprKL
 Pc+42DEwJTs9nMydlu1nj8kj5Qn7kuQDzmeGAD2aYvYyERC3YIytWSiRB+XtFGBclnYM
 caN+KgQBN8zzRLJoapBJLzVsHYuEU4oixG/SVIMTbq6G0uq6dgluyChW/Dwmk8QZUvNE
 6AaN8hlnm42IBSysLg0J7gFTC+3dAd+gkXc3IKeYKnZ+NN5XUMv8bke8dWYh5kAc204h
 aKOv0ItMfdNBvq86DD0JAcLdajgkGmQt0EputLOc9PrvU127vCI2POUGBCsh5tcy7MDt
 /i1g==
X-Gm-Message-State: AOAM531apeThfycUyHd+lz91tra7D1C++qlFUZeSnwf+FDEU2ET21JSD
 pApAyhVaWjAQchx6Q+PBcj9ZMNnlxEa7j0UPV6E=
X-Google-Smtp-Source: ABdhPJxCVxJYlqnudbrjWfS6pU3itZKjPGMqS0eIaTBSDqgxUzehaH8vzOPEvZydqDKJr62fsSsdkBiIDOiSjiD/ZUQ=
X-Received: by 2002:adf:d0c3:: with SMTP id z3mr32463334wrh.28.1617076767659; 
 Mon, 29 Mar 2021 20:59:27 -0700 (PDT)
MIME-Version: 1.0
References: <20210326231303.3071950-1-eric@anholt.net>
 <20210329144729.GB4203@willie-the-truck>
In-Reply-To: <20210329144729.GB4203@willie-the-truck>
From: Rob Clark <robdclark@gmail.com>
Date: Mon, 29 Mar 2021 21:02:50 -0700
Message-ID: <CAF6AEGugpEk396DVtWX=W+uf3p-wcgBfCSpSLWGQJE1vKpJ4aw@mail.gmail.com>
Subject: Re: [PATCH 1/2] iommu/arm-smmu-qcom: Skip the TTBR1 quirk for db820c.
To: Will Deacon <will@kernel.org>
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
 <devicetree@vger.kernel.org>, freedreno <freedreno@lists.freedesktop.org>,
 Joerg Roedel <joro@8bytes.org>, Robin Murphy <robin.murphy@arm.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Jordan Crouse <jcrouse@codeaurora.org>, Rob Herring <robh+dt@kernel.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>, Sean Paul <sean@poorly.run>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Mar 29, 2021 at 7:47 AM Will Deacon <will@kernel.org> wrote:
>
> On Fri, Mar 26, 2021 at 04:13:02PM -0700, Eric Anholt wrote:
> > db820c wants to use the qcom smmu path to get HUPCF set (which keeps
> > the GPU from wedging and then sometimes wedging the kernel after a
> > page fault), but it doesn't have separate pagetables support yet in
> > drm/msm so we can't go all the way to the TTBR1 path.
>
> What do you mean by "doesn't have separate pagetables support yet"? The
> compatible string doesn't feel like the right way to determine this.

the compatible string identifies what it is, not what the sw
limitations are, so in that regard it seems right to me..

BR,
-R
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
