Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B46A73A30BE
	for <lists+dri-devel@lfdr.de>; Thu, 10 Jun 2021 18:34:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 887306EDA7;
	Thu, 10 Jun 2021 16:34:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from netline-mail3.netline.ch (mail.netline.ch [148.251.143.180])
 by gabe.freedesktop.org (Postfix) with ESMTP id CDFC06EDA7;
 Thu, 10 Jun 2021 16:34:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by netline-mail3.netline.ch (Postfix) with ESMTP id 7F2EE20201B;
 Thu, 10 Jun 2021 18:34:49 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at netline-mail3.netline.ch
Received: from netline-mail3.netline.ch ([127.0.0.1])
 by localhost (netline-mail3.netline.ch [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id QTH2Eyqvmnwo; Thu, 10 Jun 2021 18:34:49 +0200 (CEST)
Received: from thor (24.99.2.85.dynamic.wline.res.cust.swisscom.ch
 [85.2.99.24])
 by netline-mail3.netline.ch (Postfix) with ESMTPA id 1153820201A;
 Thu, 10 Jun 2021 18:34:49 +0200 (CEST)
Received: from localhost ([::1]) by thor with esmtp (Exim 4.94.2)
 (envelope-from <michel@daenzer.net>)
 id 1lrNdn-0002DL-OM; Thu, 10 Jun 2021 18:34:47 +0200
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
References: <20210610091800.1833-1-christian.koenig@amd.com>
From: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>
Subject: Re: Change how amdgpu stores fences in dma_resv objects
Message-ID: <f3788c24-bb42-4913-6334-fb3549c21fb9@daenzer.net>
Date: Thu, 10 Jun 2021 18:34:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210610091800.1833-1-christian.koenig@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-CA
Content-Transfer-Encoding: 8bit
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
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2021-06-10 11:17 a.m., Christian König wrote:
> Since we can't find a consensus on hot to move forward with the dma_resv object I concentrated on changing the approach for amdgpu first.
> 
> This new approach changes how the driver stores the command submission fence in the dma_resv object in DMA-buf exported BOs.
> 
> For exported BOs we now store the CS fence in a dma_fence_chain container and assign that one to the exclusive fences slot.
> 
> During synchronization this dma_fence_chain container is unpacked again and the containing fences handled individually.
> 
> This has a little bit more overhead than the old approach, but it allows for waiting for the exclusive slot for writes again.

Nice!

This seems to work as expected with https://gitlab.gnome.org/GNOME/mutter/-/merge_requests/1880: Some buffers now don't poll readable at first, until the GPU is done processing them.


Unfortunately, as expected, without a high priority context for the compositor which can preempt client drawing, this isn't enough to prevent slow clients from slowing down the compositor as well. But it should already help for fullscreen apps where the compositor can directly scan out the client buffers at least.


-- 
Earthling Michel Dänzer               |               https://redhat.com
Libre software enthusiast             |             Mesa and X developer
