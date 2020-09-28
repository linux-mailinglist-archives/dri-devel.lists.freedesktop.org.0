Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C247727BDB6
	for <lists+dri-devel@lfdr.de>; Tue, 29 Sep 2020 09:13:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9985189F38;
	Tue, 29 Sep 2020 07:13:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from crapouillou.net (crapouillou.net [89.234.176.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F71B89F63
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Sep 2020 13:31:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1601299899; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0SzWACBuI9QMwCiW7RkNoVRmCLnHWeSCxcbUL7DcVfc=;
 b=P4xXMCayyWAAUDEbXfTSxFl4XMI4I4+bQRS2Qk7dt0KhWyH5QLZ1rKOaIo3hAxLyYoHIxC
 r6YtBANmwXXU6POC+6apbG+i/HWU/ed63WaAfGWgrKlrr7kaoa0PEVoQKKY3vISb3E/yBG
 NucA0ykHdNpTVz8EiYXLt+7u6qAwppU=
Date: Mon, 28 Sep 2020 15:31:28 +0200
From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: linux-next: build failure after merge of the drm tree
To: Christoph Hellwig <hch@lst.de>
Message-Id: <GWEDHQ.HNERRUK8XXOM2@crapouillou.net>
In-Reply-To: <20200928121002.GA3219@lst.de>
References: <20200928135405.73404219@canb.auug.org.au>
 <20200928060427.GA15041@lst.de> <KU5DHQ.C9RVOLP69UO81@crapouillou.net>
 <20200928113415.GA555@lst.de> <72ADHQ.T6LL1SHQF0RG3@crapouillou.net>
 <20200928121002.GA3219@lst.de>
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



Le lun. 28 sept. 2020 =E0 14:10, Christoph Hellwig <hch@lst.de> a =E9crit =

:
> On Mon, Sep 28, 2020 at 01:46:55PM +0200, Paul Cercueil wrote:
>>>  dma_mmap_attrs can only be used on allocations from dma_mmap_attrs =

>>> with
>>>  the same attrs.  As there is no allocation using =

>>> DMA_ATTR_NON_CONSISTENT
>>>  in the drm core, something looks very fishy here.
>> =

>>  Is that a fact? I don't see why you couldn't change the cache =

>> settings
>>  after allocation. In practice it works just fine.
> =

> Accessing the same physical address using different caching attributes
> is undefined behavior and fairly dangerous on most architectures, and
> thus not supported by the DMA API.

It's allocated with dma_alloc_wc, but then it's only accessed as =

non-coherent.

Anyway, for the time being I guess you could revert 37054fc81443. But I =

have patches on top of it in drm-misc-next so it's going to be a mess.

If we have time I can come up with a custom dumb_create() fonction, to =

make sure that the GEM buffers are allocated with =

dma_alloc_noncoherent(). Is there a dma_mmap_noncoherent() too?

-Paul


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
