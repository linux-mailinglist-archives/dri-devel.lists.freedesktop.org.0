Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FD1853A968
	for <lists+dri-devel@lfdr.de>; Wed,  1 Jun 2022 16:52:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 651EB10EB03;
	Wed,  1 Jun 2022 14:52:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com
 [IPv6:2607:f8b0:4864:20::102a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A134B10EC4E
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Jun 2022 14:52:48 +0000 (UTC)
Received: by mail-pj1-x102a.google.com with SMTP id
 n13-20020a17090a394d00b001e30a60f82dso6483107pjf.5
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Jun 2022 07:52:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=f+l3Hk+6FFyk8vfmjX/U6HXz2Y13gVkjD8RbjyOHnBg=;
 b=T5QqxGoUWNlBhCvVCWar98KbLBlFh2IAuojNaK8vvjKwgDeliiAt4f3t71WOdr8+Py
 HHMOe73t4gfkGJiwHy+Hm70Yy7VauFSTuriqV7I5dLMxENsXS5NHU703r5zm8sGzuyvW
 ERZjD24VHVXiLLmqN1EGXjLw6PBs9QKqmrdhw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=f+l3Hk+6FFyk8vfmjX/U6HXz2Y13gVkjD8RbjyOHnBg=;
 b=snT2nEhZuls3bU2NDHQ7HsQ+p0kNCjYfc97G9M4WeZT9Nz1x/uoEiiZdFOM8fbZ7xW
 FFyOJpV+CehX6H+jXZV5vnHVy2nm2uPFhUmmhHsCadCYYpGBJm4kBsoOh/tDjCGMppqk
 gSR057mIHpmVsSCKSYndvl0OJJ3P/deWrqBdUGWtUKQXvTZdgbFt1gEB63k+yuT24p68
 JTh18a4rm1qqK6HDJc4Wtz0K0Lx1tRyyLXtKw809LORDlF6txzxZC+fqTH/dkqkocVvj
 TR0fkElVx31thRAT6EAFiRTHXV2dD2W8GzXPIJmMFTRKSQmTiv9WhAzMslpZLV2WKuu7
 vniA==
X-Gm-Message-State: AOAM531hsQgIIFbsbrka1jdXEbQ2PkCcaPJho3XugUc9uH3dj91R8VLO
 /beepMZCocdAJATPk1faiJpQkA==
X-Google-Smtp-Source: ABdhPJzKbPPwilL4Mlo2lBLeWQY4KScURQiGlR+yz2oCKIOnCppVLjpaiJcEObTKUBj8vtB6Oz8esg==
X-Received: by 2002:a17:902:d2c1:b0:165:d4cd:e118 with SMTP id
 n1-20020a170902d2c100b00165d4cde118mr125029plc.4.1654095168205; 
 Wed, 01 Jun 2022 07:52:48 -0700 (PDT)
Received: from google.com ([240f:75:7537:3187:ec3a:4b49:34bc:e5b4])
 by smtp.gmail.com with ESMTPSA id
 u79-20020a627952000000b0051ba7515e0dsm1629431pfc.54.2022.06.01.07.52.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Jun 2022 07:52:47 -0700 (PDT)
Date: Wed, 1 Jun 2022 23:52:41 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [Linaro-mm-sig] Re: [PATCH] dma-fence: allow dma fence to have
 their own lock
Message-ID: <Ypd9OSqMtGMVKYZ0@google.com>
References: <20220530142232.2871634-1-senozhatsky@chromium.org>
 <7eee4274-bd69-df8d-9067-771366217804@amd.com>
 <YpWCvniLzJfcp684@google.com>
 <33aba213-b6ad-4a15-9272-c62f5dfb1fb7@gmail.com>
 <Ypd3Us3a93aLonqT@google.com>
 <a009c207-a5fa-af1e-b961-8083b48360bf@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a009c207-a5fa-af1e-b961-8083b48360bf@gmail.com>
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
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On (22/06/01 16:38), Christian König wrote:
> > > Well, you don't.
> > > 
> > > If you have a dynamic context structure you need to reference count that as
> > > well. In other words every time you create a fence in your context you need
> > > to increment the reference count and every time a fence is release you
> > > decrement it.
> > OK then fence release should be able to point back to its "context"
> > structure. Either a "private" data in dma fence or we need to "embed"
> > fence into another object (refcounted) that owns the lock and provide
> > dma fence ops->release callback, which can container_of() to the object
> > that dma fence is embedded into.
> > 
> > I think you are suggesting the latter. Thanks for clarifications.
> 
> Daniel might hurt me for this, but if you really only need a pointer to your
> context then we could say that using a pointer value for the context field
> is ok as well.
> 
> That should be fine as well as long as you can guarantee that it will be
> unique during the lifetime of all it's fences.

I think we can guarantee that. Object that creates fence is kmalloc-ed and
it sticks around until dma_fence_release() calls ops->release() and kfree-s
it. We *probably* can even do something like it now, by re-purposing dma_fence
context member:

        dma_fence_init(obj->fence,
                       &fence_ops,
                       &obj->fence_lock,
                       (u64)obj,                             <<   :/
                       atomic64_inc_return(&obj->seqno));

I'd certainly refrain from being creative here and doing things that
are not documented/common. DMA fence embedding should work for us.

> > The limiting factor of this approach is that now our ops->release() is
> > under the same "pressure" as dma_fence_put()->dma_fence_release() are.
> > dma_fence_put() and dma_fence_release() can be called from any context,
> > as far as I understand, e.g. IRQ, however our normal object ->release
> > can schedule, we do things like synchronize_rcu() and so on. Nothing is
> > impossible, just saying that even this approach is not 100% perfect and
> > may need additional workarounds.
> 
> Well just use a work item for release.

Yup, that's the plan.
