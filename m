Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA2F127BDA9
	for <lists+dri-devel@lfdr.de>; Tue, 29 Sep 2020 09:13:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6161789E06;
	Tue, 29 Sep 2020 07:12:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from crapouillou.net (crapouillou.net [89.234.176.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0A6689E69
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Sep 2020 11:47:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1601293625; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DoVe+g+DYO+oFmZDLue8I5P2ojf9qtlA9KR9knBjw4s=;
 b=SkNN19W1v82/0aW5KrpnosZ0sPQb6t2LIROzYH12T4/aJLZAR9kEgeKI8tLMBwZe5/NLaK
 TfIngauhK7bDL8CLV4K+v2V05hBwXDEtEg6r9AOlmC2oTvViJLQFyHDvWNVfwsVRejVmmj
 5z+qPulvDx1M9ipk3LpNvm6RRqawscU=
Date: Mon, 28 Sep 2020 13:46:55 +0200
From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: linux-next: build failure after merge of the drm tree
To: Christoph Hellwig <hch@lst.de>
Message-Id: <72ADHQ.T6LL1SHQF0RG3@crapouillou.net>
In-Reply-To: <20200928113415.GA555@lst.de>
References: <20200928135405.73404219@canb.auug.org.au>
 <20200928060427.GA15041@lst.de> <KU5DHQ.C9RVOLP69UO81@crapouillou.net>
 <20200928113415.GA555@lst.de>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 29 Sep 2020 07:12:58 +0000
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
Cc: Dave Airlie <airlied@linux.ie>, Stephen Rothwell <sfr@canb.auug.org.au>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI <dri-devel@lists.freedesktop.org>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Le lun. 28 sept. 2020 =E0 13:34, Christoph Hellwig <hch@lst.de> a =E9crit =

:
> On Mon, Sep 28, 2020 at 12:15:56PM +0200, Paul Cercueil wrote:
>>  Hi Christoph,
>> =

>>  Le lun. 28 sept. 2020 =E0 8:04, Christoph Hellwig <hch@lst.de> a =

>> =E9crit :
>>>  On Mon, Sep 28, 2020 at 01:54:05PM +1000, Stephen Rothwell wrote:
>>>>   Hi all,
>>>> =

>>>>   After merging the drm tree, today's linux-next build (x86_64
>>>>  allmodconfig)
>>>>   failed like this:
>>> =

>>>  The driver needs to switch do dma_alloc_noncoherent + =

>>> dma_sync_single*
>>>  like the other drivers converted in the dma tree.  Paul, let me =

>>> know if
>>>  you have any questions.
>> =

>>  I don't dma_alloc* anything, DRM core does. I use the
>>  DMA_ATTR_NON_CONSISTENT attr with dma_mmap_attrs(). Is there a =

>> replacement
>>  for that?
> =

> dma_mmap_attrs can only be used on allocations from dma_mmap_attrs =

> with
> the same attrs.  As there is no allocation using =

> DMA_ATTR_NON_CONSISTENT
> in the drm core, something looks very fishy here.

Is that a fact? I don't see why you couldn't change the cache settings =

after allocation. In practice it works just fine.

> Where does the allocation you try to mmap come from?  All the =

> allocations
> in drivers/gpu/drm/drm_gem_cma_helper.c seems to use dma_alloc_wc (aka
> dma_allloc_attrs with the DMA_ATTR_WRITE_COMBINE flag).

It's the dma_alloc_wc.

-Paul


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
