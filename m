Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D34C47A711
	for <lists+dri-devel@lfdr.de>; Mon, 20 Dec 2021 10:31:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F30B48938B;
	Mon, 20 Dec 2021 09:31:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D057C113DCC
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Dec 2021 09:31:31 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id q16so18735314wrg.7
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Dec 2021 01:31:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to; bh=Htm2M/1UPb5WYk7y28mkq1tTi0RGZ2Jp48YbGwwH0kA=;
 b=ZF/MduX4/4cT+oBmR4T+v8wQ+QDwsxOJuqK9/wRsJS6zcgT2AKpV/tkvOsOZ5L5v6m
 6lR2L48gW5VYExLPAmgVcEuReMeF3qKNn0fEl4cDu9N7mwYe03+7XG7yhhRMXGiShQAG
 VuATgjbbmIZ4i7mM+4AGwwVET8Ejjexw+StR8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to;
 bh=Htm2M/1UPb5WYk7y28mkq1tTi0RGZ2Jp48YbGwwH0kA=;
 b=k1LbEkX4AbuwYD79evJbZu/OTGyzHDCaeWu4DrQD0cbur0wttNlTi1nctQMaeAm0uU
 iCrAZnCNh63EbBU9tDXg6mpeQOe5rD/DwHS5GU90yOkNmnTtwGskzgn8bG6AtytXOLHO
 1lT+D6uFapEH6iGjp8/FgW4i1vP/JthFt5RgsvkiNGx5x4bVCOOB0t8T9sRqBt20psGY
 WcH6tgAD8t3kpH/9nsYZAe+tQr7mVH7EnSZX5dTRinWCALawukWwEz9AXagE1ohkyVgQ
 MUn63iLAcf4IE8J27DAI8b9pDrWzmQ5hKh4sElgkz8bjqnMHTgXyCBs5o6x57oaOpI60
 lrDQ==
X-Gm-Message-State: AOAM530FheBVoYwmJqab/4pEM+fsY3iLsMm7KGKz200/cP/NteaU64Ey
 bzUBBQ7qyHbfiX4Rogx0Ryldew==
X-Google-Smtp-Source: ABdhPJzIKEWyHUlLuEcrr0JV7s9D8oMvc34Me/oLD7Mq3UMFLkvWeDwegpHqyN1hAZyC9N8Yil8rXg==
X-Received: by 2002:a05:6000:148:: with SMTP id
 r8mr11746823wrx.333.1639992690397; 
 Mon, 20 Dec 2021 01:31:30 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id r17sm15109035wmq.11.2021.12.20.01.31.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Dec 2021 01:31:29 -0800 (PST)
Date: Mon, 20 Dec 2021 10:31:27 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Jason Gunthorpe <jgg@ziepe.ca>
Subject: Re: [RFC PATCH v4 0/2] RDMA/rxe: Add dma-buf support
Message-ID: <YcBNbypJT3UJ0RG6@phenom.ffwll.local>
Mail-Followup-To: Jason Gunthorpe <jgg@ziepe.ca>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Shunsuke Mie <mie@igel.co.jp>, Zhu Yanjun <zyjzyj2000@gmail.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Doug Ledford <dledford@redhat.com>,
 Jianxin Xiong <jianxin.xiong@intel.com>,
 Leon Romanovsky <leon@kernel.org>, Maor Gottlieb <maorg@nvidia.com>,
 Sean Hefty <sean.hefty@intel.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-media@vger.kernel.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-rdma <linux-rdma@vger.kernel.org>,
 Damian Hobson-Garcia <dhobsong@igel.co.jp>,
 Takanari Hayama <taki@igel.co.jp>, Tomohito Esaki <etom@igel.co.jp>
References: <20211122110817.33319-1-mie@igel.co.jp>
 <CANXvt5oB8_2sDGccSiTMqeLYGi3Vuo-6NnHJ9PGgZZMv=fnUVw@mail.gmail.com>
 <20211207171447.GA6467@ziepe.ca>
 <CANXvt5rCayOcengPr7Z_aFmJaXwWj9VcWZbaHnuHj6=2CkPndA@mail.gmail.com>
 <20211210124204.GG6467@ziepe.ca>
 <880e25ad-4fe9-eacd-a971-993eaea37fc4@amd.com>
 <20211210132656.GH6467@ziepe.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211210132656.GH6467@ziepe.ca>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
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
Cc: Damian Hobson-Garcia <dhobsong@igel.co.jp>,
 Takanari Hayama <taki@igel.co.jp>, Leon Romanovsky <leon@kernel.org>,
 linux-rdma <linux-rdma@vger.kernel.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Tomohito Esaki <etom@igel.co.jp>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 Doug Ledford <dledford@redhat.com>, Zhu Yanjun <zyjzyj2000@gmail.com>,
 Shunsuke Mie <mie@igel.co.jp>, Alex Deucher <alexander.deucher@amd.com>,
 Sean Hefty <sean.hefty@intel.com>, Maor Gottlieb <maorg@nvidia.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Jianxin Xiong <jianxin.xiong@intel.com>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Dec 10, 2021 at 09:26:56AM -0400, Jason Gunthorpe wrote:
> On Fri, Dec 10, 2021 at 01:47:37PM +0100, Christian König wrote:
> > Am 10.12.21 um 13:42 schrieb Jason Gunthorpe:
> > > On Fri, Dec 10, 2021 at 08:29:24PM +0900, Shunsuke Mie wrote:
> > > > Hi Jason,
> > > > Thank you for replying.
> > > > 
> > > > 2021年12月8日(水) 2:14 Jason Gunthorpe <jgg@ziepe.ca>:
> > > > > On Fri, Dec 03, 2021 at 12:51:44PM +0900, Shunsuke Mie wrote:
> > > > > > Hi maintainers,
> > > > > > 
> > > > > > Could you please review this patch series?
> > > > > Why is it RFC?
> > > > > 
> > > > > I'm confused why this is useful?
> > > > > 
> > > > > This can't do copy from MMIO memory, so it shouldn't be compatible
> > > > > with things like Gaudi - does something prevent this?
> > > > I think if an export of the dma-buf supports vmap, CPU is able to access the
> > > > mmio memory.
> > > > 
> > > > Is it wrong? If this is wrong, there is no advantages this changes..
> > > I don't know what the dmabuf folks did, but yes, it is wrong.
> > > 
> > > IOMEM must be touched using only special accessors, some platforms
> > > crash if you don't do this. Even x86 will crash if you touch it with
> > > something like an XMM optimized memcpy.
> > > 
> > > Christian? If the vmap succeeds what rules must the caller use to
> > > access the memory?
> > 
> > See dma-buf-map.h and especially struct dma_buf_map.
> > 
> > MMIO memory is perfectly supported here and actually the most common case.
> 
> Okay that looks sane, but this rxe RFC seems to ignore this
> completely. It stuffs the vaddr directly into a umem which goes to all
> manner of places in the driver.
> 
> ??

dma_buf_map is fairly new and we haven't rolled it out consistently yet.
In the past 10 years we simply yolo'd this :-)

Just an explanation, not an excuse for new code to not use dma_buf_map
consistently now that we fixed this mistake.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
