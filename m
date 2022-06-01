Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 02E5B53A924
	for <lists+dri-devel@lfdr.de>; Wed,  1 Jun 2022 16:27:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEA9010E358;
	Wed,  1 Jun 2022 14:27:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com
 [IPv6:2607:f8b0:4864:20::52a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFD7010E358
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Jun 2022 14:27:36 +0000 (UTC)
Received: by mail-pg1-x52a.google.com with SMTP id y187so2074014pgd.3
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Jun 2022 07:27:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=1kEmR6X4i/nh+b6VMavBDubG9LMGPY4F+6d16NUM+gg=;
 b=mzH/QSAKngGq4V8ihQYKENupPuzAZLcXExKUCzkD7wVNpc9ZhtZ9SHvU7A/Wtsjk5p
 u8kr0G8Dxjuyhpjuqw3LG5uYEJBVyjeqJdOgUCIYXBdjvv7C4kZJqrt481urixeIGVCQ
 6Bk5quC5jGzL+SmIzDU43ncWqQdAVI/I0jUgQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=1kEmR6X4i/nh+b6VMavBDubG9LMGPY4F+6d16NUM+gg=;
 b=MI0LbbHLJDk4PsPLcXFYKfeghFSMBnOiBiv7PemKlNXbc+hKCLdnKnKXznGV2jYYGH
 wwjkBySqhLtg+F5jAepFo565YIzDXzvLkW1mRI0Rk8YH6jXWvcnjEST+bjG/QWv/PYu9
 xxZ8wvJLK09wsiLkTyHURXkbUo6tyKbKj//ikoC3ST3XVa8L0H4X4BctBOnpB0JBmB+W
 FrpwQBFHz72/gEUWY+dy4fU5T+AZA5k2w6hNrd4DvvkBN/EAKJ7Fn0GBjZDEKrj9jgky
 En8ZeODEV3mv1WTCzC/+5MnOo/ODbMLdbsvPN4Rt1n09F4wZ8IVoUDDOJgFMHYRRgAox
 K83g==
X-Gm-Message-State: AOAM533LuHjzYg8nJ3dKSXpT0ADx/8J2i6/vkjYDNOaB/kIUMYJAFgu4
 HUDbQwhj3rcTFvCydgzWpG29Ig==
X-Google-Smtp-Source: ABdhPJx1bs4rZIm3ygpokZwXwCX7e324N+HICM85x+DBIaCNTNO14kwZs2t/7lNxNBCdLuDn6WabZQ==
X-Received: by 2002:a05:6a00:a01:b0:51b:51d8:3c2a with SMTP id
 p1-20020a056a000a0100b0051b51d83c2amr152799pfh.68.1654093656292; 
 Wed, 01 Jun 2022 07:27:36 -0700 (PDT)
Received: from google.com ([240f:75:7537:3187:ec3a:4b49:34bc:e5b4])
 by smtp.gmail.com with ESMTPSA id
 2-20020a170902c24200b00162523fdb8fsm1589163plg.252.2022.06.01.07.27.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Jun 2022 07:27:35 -0700 (PDT)
Date: Wed, 1 Jun 2022 23:27:30 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [Linaro-mm-sig] Re: [PATCH] dma-fence: allow dma fence to have
 their own lock
Message-ID: <Ypd3Us3a93aLonqT@google.com>
References: <20220530142232.2871634-1-senozhatsky@chromium.org>
 <7eee4274-bd69-df8d-9067-771366217804@amd.com>
 <YpWCvniLzJfcp684@google.com>
 <33aba213-b6ad-4a15-9272-c62f5dfb1fb7@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <33aba213-b6ad-4a15-9272-c62f5dfb1fb7@gmail.com>
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

On (22/06/01 14:45), Christian König wrote:
> Am 31.05.22 um 04:51 schrieb Sergey Senozhatsky:
> > On (22/05/30 16:55), Christian König wrote:
> > > Am 30.05.22 um 16:22 schrieb Sergey Senozhatsky:
> > > > [SNIP]
> > > > So the `lock` should have at least same lifespan as the DMA fence
> > > > that borrows it, which is impossible to guarantee in our case.
> > > Nope, that's not correct. The lock should have at least same lifespan as the
> > > context of the DMA fence.
> > How does one know when it's safe to release the context? DMA fence
> > objects are still transparently refcount-ed and "live their own lives",
> > how does one synchronize lifespans?
> 
> Well, you don't.
> 
> If you have a dynamic context structure you need to reference count that as
> well. In other words every time you create a fence in your context you need
> to increment the reference count and every time a fence is release you
> decrement it.

OK then fence release should be able to point back to its "context"
structure. Either a "private" data in dma fence or we need to "embed"
fence into another object (refcounted) that owns the lock and provide
dma fence ops->release callback, which can container_of() to the object
that dma fence is embedded into.

I think you are suggesting the latter. Thanks for clarifications.

The limiting factor of this approach is that now our ops->release() is
under the same "pressure" as dma_fence_put()->dma_fence_release() are.
dma_fence_put() and dma_fence_release() can be called from any context,
as far as I understand, e.g. IRQ, however our normal object ->release
can schedule, we do things like synchronize_rcu() and so on. Nothing is
impossible, just saying that even this approach is not 100% perfect and
may need additional workarounds.

> If you have a static context structure like most drivers have then you must
> make sure that all fences at least signal before you unload your driver. We
> still somewhat have a race when you try to unload a driver and the fence_ops
> structure suddenly disappear, but we currently live with that.

Hmm, indeed... I didn't consider fence_ops case.

> Apart from that you are right, fences can live forever and we need to deal
> with that.

OK. I see.
