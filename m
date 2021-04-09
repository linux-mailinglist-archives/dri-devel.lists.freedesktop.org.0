Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BE08235A00E
	for <lists+dri-devel@lfdr.de>; Fri,  9 Apr 2021 15:40:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7554B6EC2D;
	Fri,  9 Apr 2021 13:40:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEF166EC2A
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Apr 2021 13:40:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617975606;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lsrzJwlfstULCCREnSPVP3WRVuSyvEw5HXvTFd2r4do=;
 b=OMtcyd0Ey8henN7DdHOa64TG6+RcQ3yQtd9qJqu4fIbwhvuSElxbzysNjju/dUo5Tg7ydo
 MlYxJSNpyADshpWO3/0QogVaZ3JdMf3ol84JxmiAetnJVVMvG4GV3wa3TtZ+fewuLtpPJ5
 jJArafTsuWFRRzZd2bJyiA+Iiq6zuQ4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-143-3MzYaf2pNUSmKJKsGUehFg-1; Fri, 09 Apr 2021 09:40:02 -0400
X-MC-Unique: 3MzYaf2pNUSmKJKsGUehFg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CB324C73AD;
 Fri,  9 Apr 2021 13:39:57 +0000 (UTC)
Received: from [10.36.115.11] (ovpn-115-11.ams2.redhat.com [10.36.115.11])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E60C619801;
 Fri,  9 Apr 2021 13:39:48 +0000 (UTC)
Subject: Re: [PATCH v3] drivers: introduce and use WANT_DMA_CMA for soft
 dependencies on DMA_CMA
To: Arnd Bergmann <arnd@arndb.de>
References: <20210409112035.27221-1-david@redhat.com>
 <CAK8P3a31uKNcim0n99=yt3zjZ+LQSw4V4+8PS8daLsBdS0iSYg@mail.gmail.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat GmbH
Message-ID: <53ec94ac-ffe3-d0bc-d081-3489fa03daa1@redhat.com>
Date: Fri, 9 Apr 2021 15:39:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAK8P3a31uKNcim0n99=yt3zjZ+LQSw4V4+8PS8daLsBdS0iSYg@mail.gmail.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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
Cc: Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>, David Airlie <airlied@linux.ie>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 Paul Cercueil <paul@crapouillou.net>, Suman Anna <s-anna@ti.com>,
 Christoph Hellwig <hch@lst.de>, Marek Szyprowski <m.szyprowski@samsung.com>,
 Masahiro Yamada <masahiroy@kernel.org>, Michal Simek <michal.simek@xilinx.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Joel Stanley <joel@jms.id.au>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 The etnaviv authors <etnaviv@lists.freedesktop.org>,
 Peter Collingbourne <pcc@google.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 "Alexander A. Klimov" <grandmaster@al2klimov.de>,
 Linux-MM <linux-mm@kvack.org>, Andrew Jeffery <andrew@aj.id.au>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "open list:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
 Andrew Morton <akpm@linux-foundation.org>, Robin Murphy <robin.murphy@arm.com>,
 Mike Rapoport <rppt@kernel.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 09.04.21 15:35, Arnd Bergmann wrote:
> On Fri, Apr 9, 2021 at 1:21 PM David Hildenbrand <david@redhat.com> wrote:
>>
>> Random drivers should not override a user configuration of core knobs
>> (e.g., CONFIG_DMA_CMA=n). Applicable drivers would like to use DMA_CMA,
>> which depends on CMA, if possible; however, these drivers also have to
>> tolerate if DMA_CMA is not available/functioning, for example, if no CMA
>> area for DMA_CMA use has been setup via "cma=X". In the worst case, the
>> driver cannot do it's job properly in some configurations.
>>
>> For example, commit 63f5677544b3 ("drm/etnaviv: select CMA and DMA_CMA if
>> available") documents
>>          While this is no build dependency, etnaviv will only work correctly
>>          on most systems if CMA and DMA_CMA are enabled. Select both options
>>          if available to avoid users ending up with a non-working GPU due to
>>          a lacking kernel config.
>> So etnaviv really wants to have DMA_CMA, however, can deal with some cases
>> where it is not available.
>>
>> Let's introduce WANT_DMA_CMA and use it in most cases where drivers
>> select CMA/DMA_CMA, or depend on DMA_CMA (in a wrong way via CMA because
>> of recursive dependency issues).
>>
>> We'll assume that any driver that selects DRM_GEM_CMA_HELPER or
>> DRM_KMS_CMA_HELPER would like to use DMA_CMA if possible.
>>
>> With this change, distributions can disable CONFIG_CMA or
>> CONFIG_DMA_CMA, without it silently getting enabled again by random
>> drivers. Also, we'll now automatically try to enabled both, CONFIG_CMA
>> and CONFIG_DMA_CMA if they are unspecified and any driver is around that
>> selects WANT_DMA_CMA -- also implicitly via DRM_GEM_CMA_HELPER or
>> DRM_KMS_CMA_HELPER.
>>
>> For example, if any driver selects WANT_DMA_CMA and we do a
>> "make olddefconfig":
>>
>> 1. With "# CONFIG_CMA is not set" and no specification of
>>     "CONFIG_DMA_CMA"
>>
>> -> CONFIG_DMA_CMA won't be part of .config
>>
>> 2. With no specification of CONFIG_CMA or CONFIG_DMA_CMA
>>
>> Contiguous Memory Allocator (CMA) [Y/n/?] (NEW)
>> DMA Contiguous Memory Allocator (DMA_CMA) [Y/n/?] (NEW)
>>
>> 3. With "# CONFIG_CMA is not set" and "# CONFIG_DMA_CMA is not set"
>>
>> -> CONFIG_DMA_CMA will be removed from .config
>>
>> Note: drivers/remoteproc seems to be special; commit c51e882cd711
>> ("remoteproc/davinci: Update Kconfig to depend on DMA_CMA") explains that
>> there is a real dependency to DMA_CMA for it to work; leave that dependency
>> in place and don't convert it to a soft dependency.
> 
> I don't think this dependency is fundamentally different from the others,
> though davinci machines tend to have less memory than a lot of the
> other machines, so it's more likely to fail without CMA.
> 

I was also unsure - and Lucas had similar thoughts. If you want, I can 
send a v4 also taking care of this.

Thanks!

> Regardless of this,
> 
> Reviewed-by: Arnd Bergmann <arnd@arndb.de>
> 


-- 
Thanks,

David / dhildenb

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
