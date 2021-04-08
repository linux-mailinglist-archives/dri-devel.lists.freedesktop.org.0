Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D180835813C
	for <lists+dri-devel@lfdr.de>; Thu,  8 Apr 2021 13:01:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B1556EA89;
	Thu,  8 Apr 2021 11:01:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9F0A6EA8A
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Apr 2021 11:01:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617879661;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WQhqnjeZkCOh2eK1FDK8AD+p6DMcS/hFEdzGcfPMAFo=;
 b=Ec63m1aTQBul7FiRa4W1fUa+u8Y3xF7Rt5hKP916XhJsNnAkzHDHEGY/1YLa02TqagJW+I
 FQsnPiGlcOVV/FMGEQjMxKdSqeWZl3g4qndfEUnWmdlbNW0ckgm7Nu0nGMKw2nt7vTve2p
 bTwr+nKMLI/RuUF0MnU86rQ3U4NttXE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-546-cf3ok8EPM6mmTtU9zSKjug-1; Thu, 08 Apr 2021 07:00:57 -0400
X-MC-Unique: cf3ok8EPM6mmTtU9zSKjug-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4E56F83DD21;
 Thu,  8 Apr 2021 11:00:54 +0000 (UTC)
Received: from [10.36.114.231] (ovpn-114-231.ams2.redhat.com [10.36.114.231])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EF0CA5D9D0;
 Thu,  8 Apr 2021 11:00:48 +0000 (UTC)
To: Arnd Bergmann <arnd@arndb.de>
References: <20210408092011.52763-1-david@redhat.com>
 <20210408092011.52763-3-david@redhat.com>
 <CAK8P3a09LdJ-87ZrN28y=t8Sa0zL-3NOvEWhkStMY+2EbO7UAw@mail.gmail.com>
 <cd14d4b4-da82-b21c-2cd6-8e474d97b955@redhat.com>
 <CAK8P3a0Wg1mGZoBkD_RwMx-jzQNK2krrDxDQV5uhCHoyz-e=dw@mail.gmail.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat GmbH
Subject: Re: [PATCH v1 2/2] drivers/gpu/drm: don't select DMA_CMA or CMA from
 aspeed or etnaviv
Message-ID: <7496ac87-9676-1b4e-3444-c2a662ec376b@redhat.com>
Date: Thu, 8 Apr 2021 13:00:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAK8P3a0Wg1mGZoBkD_RwMx-jzQNK2krrDxDQV5uhCHoyz-e=dw@mail.gmail.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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
Cc: Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 David Airlie <airlied@linux.ie>, Andrew Jeffery <andrew@aj.id.au>,
 Randy Dunlap <rdunlap@infradead.org>,
 The etnaviv authors <etnaviv@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Michal Simek <michal.simek@xilinx.com>, Linux-MM <linux-mm@kvack.org>,
 Joel Stanley <joel@jms.id.au>, Russell King <linux+etnaviv@armlinux.org.uk>,
 Peter Collingbourne <pcc@google.com>, Masahiro Yamada <masahiroy@kernel.org>,
 Mike Rapoport <rppt@kernel.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

>>> In particular, it does not prevent a configuration with 'DRM_CMA=m'
>>
>> I assume you meant "DRM_CMA=n" ? DRM_CMA cannot be built as a module.
> 
> Ok, at least that makes it easier.
> 
>>> and 'DRMA_ASPEED_GFX=y', or any build failures from such
>>> a configuration.
>>
>> I don't follow. "DRM_CMA=n" and 'DRMA_ASPEED_GFX=y' is supposed to work
>> just fine (e.g., without HAVE_DMA_CONTIGUOUS) or what am I missing?
> 
> I thought you were trying to solve the problem where DRMA_ASPEED_GFX
> can optionally link against CMA but would fail to build when the CMA code
> is in a loadable module.

Yes. I was trying to say: it works with this patch just fine. The issue 
you described does not seem to apply (DRM_CMA=m).

> 
>> Your example looks more like a NOP - no?
>> Or will it have the same effect?
> 
> The example I gave is only meaningful if both are tristate, which is
> not the case here as you explain.

Okay, thanks.

> 
> It is a somewhat awkward way to say "prevent this symbol from
> being =y if the dependency is =m".

What would be the right thing to do in the case here then to achieve the 
"if DRMA_ASPEED_GFX is enabled, also enable DMA_CMA id possible"?

One approach could be to have for DMA_CMA

default y if DRMA_ASPEED_GFX

but it feels like the wrong way to tackle this.

Thanks!

-- 
Thanks,

David / dhildenb

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
