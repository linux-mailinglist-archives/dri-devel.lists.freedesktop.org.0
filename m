Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F57029F56F
	for <lists+dri-devel@lfdr.de>; Thu, 29 Oct 2020 20:35:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF8586E8F6;
	Thu, 29 Oct 2020 19:35:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com
 [IPv6:2607:f8b0:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 196626E8F4
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Oct 2020 19:35:03 +0000 (UTC)
Received: by mail-ot1-x342.google.com with SMTP id 32so3432479otm.3
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Oct 2020 12:35:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pNs67top4pPOTGcP1NX7Pu7/uSm+kbCFKUDcv3vSLmY=;
 b=MQWqXJYCQgyXX2ED5upvS1zb/S5C1frA3jtLf8wN4hQgUkBCTJdeytiWYoqHWLJGwc
 Et2uXFDO9vJn9YdPxvW7EdORHys3z1FcdVODWJcjXelZlWEq3ff/wL64LENYfqlnNvIv
 ckJux5YWlOs6YLhRHDYrT2QluVkyhCkEjrk42hML2mgWA4g9BuWXwHj5ujn+Jbzt370f
 OUvmYK/AVfE97h3+gd2w1bcRNWRicBIdwPeUG/dTFDizok+kju4vmUbj8MVtu8wyqyEm
 uUfTLU9/up/V6EdurhRz9ibvNZqc+xEyRIONBF+zEUqPz41J/bSSzbBTJZYa8Iv41pUv
 9YUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pNs67top4pPOTGcP1NX7Pu7/uSm+kbCFKUDcv3vSLmY=;
 b=GsMlFgd8Qs+PL8MDgkFEB3zgBn38MOm4yUzMnjfiLx4IsnyfXwBfRlR9dR/idBYN+S
 A9ciWvMHn5ubNcLPX7ximz0S1R8e3Fm1mQZtTXFbpken3a9plLm7Ly7raF16/Xi+Qonc
 M9yrESDF+FcgTvmUz7JaYST0YLhdSn9X3j8O1akgNoOsPJZvJlR0H7B8/8YVvEAnvnLx
 1iVheDY0YXUq7FXBQnsmcdsGS75R9hvvHbA7TLu7jBFa8sxJP9pgonzPgBixfexCDliE
 09AZxfwqsBnIgANZZL3cmvxpB9Z1kg21CZ0kdrky3Z5MkrlH6DhVwJPrLgNK+WkPRYBo
 3Wlw==
X-Gm-Message-State: AOAM531G8FQOsWR90cfgqSwvOCtfaRU8v2MEr2DUmH9uRGd/GulBRdyu
 hUI6ijrS5hf+VfWgAJVwB4JNOg4UU2JB/d3DeahKTQ==
X-Google-Smtp-Source: ABdhPJy0AyVCxa/MNqqLnCtulrwic0DXZmVBbHxEFIqaCu0LwsfmMANQIDL2vahx/7Rjil+GW+C9/cBLzXFlqiduehw=
X-Received: by 2002:a05:6830:400c:: with SMTP id
 h12mr4739838ots.102.1604000102315; 
 Thu, 29 Oct 2020 12:35:02 -0700 (PDT)
MIME-Version: 1.0
References: <20201029001624.17513-1-john.stultz@linaro.org>
 <20201029001624.17513-6-john.stultz@linaro.org>
 <20201029070221.2856-1-hdanton@sina.com>
In-Reply-To: <20201029070221.2856-1-hdanton@sina.com>
From: John Stultz <john.stultz@linaro.org>
Date: Thu, 29 Oct 2020 12:34:51 -0700
Message-ID: <CALAqxLV8EYq7FEXFGrGnWocpiXihAd+wHcu5=X4oC2oS8_Fy=A@mail.gmail.com>
Subject: Re: [PATCH v4 5/7] dma-buf: system_heap: Allocate higher order pages
 if available
To: Hillf Danton <hdanton@sina.com>
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
Cc: James Jones <jajones@nvidia.com>, Robin Murphy <robin.murphy@arm.com>,
 Liam Mark <lmark@codeaurora.org>, lkml <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Ezequiel Garcia <ezequiel@collabora.com>,
 linux-media <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Oct 29, 2020 at 12:02 AM Hillf Danton <hdanton@sina.com> wrote:
>
> On Thu, 29 Oct 2020 00:16:22 +0000 John Stultz wrote:
> >
> > +#define HIGH_ORDER_GFP  (((GFP_HIGHUSER | __GFP_ZERO | __GFP_NOWARN \
> > +                             | __GFP_NORETRY) & ~__GFP_RECLAIM) \
> > +                             | __GFP_COMP)
> > +#define LOW_ORDER_GFP (GFP_HIGHUSER | __GFP_ZERO | __GFP_COMP)
> > +static gfp_t order_flags[] = {HIGH_ORDER_GFP, LOW_ORDER_GFP, LOW_ORDER_GFP};
> > +static const unsigned int orders[] = {8, 4, 0};
> > +#define NUM_ORDERS ARRAY_SIZE(orders)
>
> A two-line comment helps much understand the ORDERs above if it specifies the
> reasons behind the detour to HPAGE_PMD_ORDER and PAGE_ALLOC_COSTLY_ORDER.

Thanks so much for the review and feedback!

So yes, this was pulled from ION's system heap:
  https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/staging/android/ion/ion_system_heap.c#n20

But adding __GFP_COMP as that's added by ION in the pagepool code I
didn't include:
  https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/staging/android/ion/ion_page_pool.c#n146

I unfortunately don't have a lot of detail on the exact rationale
(other than what I can pull from the commit log), I suspect it has to
do experiential knowledge of the majority of graphics buffers being
small multiples of 1M or 64K.

But I do agree some rationale in a comment would be helpful, and will
try to add that.

As for your comment on HPAGE_PMD_ORDER (9 on arm64/arm) and
PAGE_ALLOC_COSTLY_ORDER(3), I'm not totally sure I understand your
question? Are you suggesting those values would be more natural orders
to choose from?

Thanks again!
-john
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
