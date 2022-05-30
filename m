Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 61FD75383D8
	for <lists+dri-devel@lfdr.de>; Mon, 30 May 2022 17:10:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FA5010EE6F;
	Mon, 30 May 2022 15:09:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [IPv6:2607:f8b0:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E55210EE75
 for <dri-devel@lists.freedesktop.org>; Mon, 30 May 2022 15:09:56 +0000 (UTC)
Received: by mail-pl1-x636.google.com with SMTP id f18so10588925plg.0
 for <dri-devel@lists.freedesktop.org>; Mon, 30 May 2022 08:09:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=MDPsVzr9oRyPkDpdSrgjcqTfOM2U/KUUhbX2zAPuMn4=;
 b=Rmu2aX+sVAwyRRIb8uJtLMJIpDvhcNVejEF5IBcJ3h5yqmi2cUtdDqcTOA0ypkJTh9
 rhLj41dl6/tr/MmFpmgayS8Gul644Tp/xjjxNjBbGlmtLqch9E5HhTB+O6upwO04lJHd
 PkmajRsVMECLRiDKXkEGJYdRGRsAgw7uGeooI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=MDPsVzr9oRyPkDpdSrgjcqTfOM2U/KUUhbX2zAPuMn4=;
 b=HuBXKOjR6lMmr+FIsSN0S9QMi+gqWfbetEIoMkbnyFtP4VWUMG8Yl9x6txdrhgcadh
 8twBxaE/a79jZG2NgxHgnk3bEMe+kVWbQ7jxtRxBob5WTzlI5eXT+3hrrjB6cRVssJfW
 8ZmhiTW2NZHCVChxc1/j77JzzFZzplcTbIAJFNBYYifDILEyox69Hbj7LJlfO2Sg/aCo
 +xP3WGj6UgblpmGst51Dp4HpxTrKcYj6WAX83KumpS6ulcY3tt0k9DygKAloTQOOHypG
 d8K1fJEyS3rCroyuVWcnZ0ufz4KcY0jiZdc3iwokqlxPFqE6AM3u3hYZTQ6F4KNEGGC7
 88Ww==
X-Gm-Message-State: AOAM533AHcMu4MNBszte/qi/Z5xEzihH2t3kmDf8wjXWBLqCv91yMO4o
 Ncn6Yy050EQ2KLB3r/t6t1iahQ==
X-Google-Smtp-Source: ABdhPJwq3IbiSe+zl8GbAUwRzcQ8OUxiTgD7YBetwDEH+LuBXltBpWmdQNeyJempTdQIRVtLo9dQ9Q==
X-Received: by 2002:a17:90a:6390:b0:1e0:a47b:a57a with SMTP id
 f16-20020a17090a639000b001e0a47ba57amr23275881pjj.115.1653923396152; 
 Mon, 30 May 2022 08:09:56 -0700 (PDT)
Received: from google.com ([240f:75:7537:3187:7d2a:ad1f:afa1:7770])
 by smtp.gmail.com with ESMTPSA id
 u11-20020a170902bf4b00b0016392bd5060sm7274738pls.142.2022.05.30.08.09.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 May 2022 08:09:55 -0700 (PDT)
Date: Tue, 31 May 2022 00:09:49 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Subject: Re: [PATCH] dma-fence: allow dma fence to have their own lock
Message-ID: <YpTePTj6rrHYN0QT@google.com>
References: <20220530142232.2871634-1-senozhatsky@chromium.org>
 <7eee4274-bd69-df8d-9067-771366217804@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7eee4274-bd69-df8d-9067-771366217804@amd.com>
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
Cc: linaro-mm-sig@lists.linaro.org, Gustavo Padovan <gustavo@padovan.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Tomasz Figa <tfiga@chromium.org>, Christoph Hellwig <hch@infradead.org>,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Ricardo Ribalda <ribalda@chromium.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Christian,

On (22/05/30 16:55), Christian König wrote:
> Hi Sergey,
> 
> I'm removing most of the mail because you have a very fundamental
> misunderstanding about what this dma_fence lock is all about.

Happy to learn.

> Am 30.05.22 um 16:22 schrieb Sergey Senozhatsky:
> > [SNIP]
> > So the `lock` should have at least same lifespan as the DMA fence
> > that borrows it, which is impossible to guarantee in our case.
>
> Nope, that's not correct. The lock should have at least same lifespan as the
> context of the DMA fence.

In our case we have one context and it lives as long as the module is loaded.
Does this mean that all DMA fences within that context should be serialized
by a single spinlock? We can have a number of "active" fences so the lock
can become a bit congested. But each operation creates, exports and signals
just once fence.

> The idea here is that DMA fence signaling and callback calling serializes.
> E.g. when you have fence a,b,c,d... they must signal in the order a,b,c,d...
> and that's what this lock is good for.

Hmm, OK. So that borrowed ->lock is in fact something like
context_lock_irqsave() and context_unlock_irqrestore().

> If you just want to create a single dma_fence which is also only bound to a
> single context you can embed the lock into the fence without much problem.

Aha, I guess this is what we need then. I'll take a look. Thanks.
