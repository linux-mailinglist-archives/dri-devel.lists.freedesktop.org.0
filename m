Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19F4E49E6D2
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jan 2022 16:59:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B099010F175;
	Thu, 27 Jan 2022 15:59:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5811210F175;
 Thu, 27 Jan 2022 15:59:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643299154; x=1674835154;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=H+/eoThfG+75X7A+Op4iugtDZzzkJmdbY8DLaA/CLPA=;
 b=hPMR2AF4M71ztgJOodVJulUINCv6SqoXg6pARMXe9mGMEVVxMNb3LIOv
 Ojg7fNIQvEIoOeqbyrsLklXG1uYGkDBu79T4wf8kqQWeAS/OTY+xreS3E
 Kj2RPjQLPg4cnansBsIbGapss4rYppKaC4TJoNuU2RLVZDigJS1gd2M7d
 WNId+z6XvNLeT6TZqF/Nsx0CWChjV+YnoYXy1RZ3Z8Q+0XyOqM3uq4JFf
 Bd7MfiUcIeOXBxLxUT+k2HzotG8GW/qSf0iFUEUWg5EkEgkby3j7amFPK
 87urEUyi4eOKj182fcFYoqDc+pJzSXTZp2LvGpMwlmJedodszemFhWkCH g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10239"; a="226867873"
X-IronPort-AV: E=Sophos;i="5.88,321,1635231600"; d="scan'208";a="226867873"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2022 07:59:13 -0800
X-IronPort-AV: E=Sophos;i="5.88,321,1635231600"; d="scan'208";a="480345386"
Received: from anithaha-mobl.amr.corp.intel.com (HELO ldmartin-desk2)
 ([10.212.224.126])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2022 07:59:13 -0800
Date: Thu, 27 Jan 2022 07:59:13 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [Intel-gfx] [PATCH 02/19] dma-buf-map: Add helper to initialize
 second map
Message-ID: <20220127155913.vt7a74zmsglghzom@ldmartin-desk2>
X-Patchwork-Hint: comment
References: <20220126203702.1784589-1-lucas.demarchi@intel.com>
 <20220126203702.1784589-3-lucas.demarchi@intel.com>
 <b7a3fe1d-3b85-cb7e-19cf-1611ff4f3c9e@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b7a3fe1d-3b85-cb7e-19cf-1611ff4f3c9e@suse.de>
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
Cc: intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jan 27, 2022 at 03:33:12PM +0100, Thomas Zimmermann wrote:
>
>
>Am 26.01.22 um 21:36 schrieb Lucas De Marchi:
>>When dma_buf_map struct is passed around, it's useful to be able to
>>initialize a second map that takes care of reading/writing to an offset
>>of the original map.
>>
>>Add a helper that copies the struct and add the offset to the proper
>>address.
>>
>>Cc: Sumit Semwal <sumit.semwal@linaro.org>
>>Cc: Christian König <christian.koenig@amd.com>
>>Cc: linux-media@vger.kernel.org
>>Cc: dri-devel@lists.freedesktop.org
>>Cc: linaro-mm-sig@lists.linaro.org
>>Cc: linux-kernel@vger.kernel.org
>>Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>>---
>>  include/linux/dma-buf-map.h | 29 +++++++++++++++++++++++++++++
>>  1 file changed, 29 insertions(+)
>>
>>diff --git a/include/linux/dma-buf-map.h b/include/linux/dma-buf-map.h
>>index 65e927d9ce33..3514a859f628 100644
>>--- a/include/linux/dma-buf-map.h
>>+++ b/include/linux/dma-buf-map.h
>>@@ -131,6 +131,35 @@ struct dma_buf_map {
>>  		.is_iomem = false, \
>>  	}
>>+/**
>>+ * DMA_BUF_MAP_INIT_OFFSET - Initializes struct dma_buf_map from another dma_buf_map
>>+ * @map_:	The dma-buf mapping structure to copy from
>>+ * @offset:	Offset to add to the other mapping
>>+ *
>>+ * Initializes a new dma_buf_struct based on another. This is the equivalent of doing:
>>+ *
>>+ * .. code-block: c
>>+ *
>>+ *	dma_buf_map map = other_map;
>>+ *	dma_buf_map_incr(&map, &offset);
>>+ *
>>+ * Example usage:
>>+ *
>>+ * .. code-block: c
>>+ *
>>+ *	void foo(struct device *dev, struct dma_buf_map *base_map)
>>+ *	{
>>+ *		...
>>+ *		struct dma_buf_map = DMA_BUF_MAP_INIT_OFFSET(base_map, FIELD_OFFSET);
>>+ *		...
>>+ *	}
>>+ */
>>+#define DMA_BUF_MAP_INIT_OFFSET(map_, offset_)	(struct dma_buf_map)	\
>>+	{								\
>>+		.vaddr = (map_)->vaddr + (offset_),			\
>>+		.is_iomem = (map_)->is_iomem,				\
>>+	}
>>+
>
>It's illegal to access .vaddr  with raw pointer. Always use a 
>dma_buf_memcpy_() interface. So why would you need this macro when you 
>have dma_buf_memcpy_*() with an offset parameter?

I did a better job with an example in 20220127093332.wnkd2qy4tvwg5i5l@ldmartin-desk2

While doing this series I had code like this when using the API in a function to
parse/update part of the struct mapped:

	int bla_parse_foo(struct dma_buf_map *bla_map)
	{
		struct dma_buf_map foo_map = *bla_map;
		...

		dma_buf_map_incr(&foo_map, offsetof(struct bla, foo));

		...
	}

Pasting the rest of the reply here:

I had exactly this code above, but after writting quite a few patches
using it, particularly with functions that have to write to 2 maps (see
patch 6 for example), it felt much better to have something to
initialize correctly from the start

         struct dma_buf_map other_map = *bla_map;
         /* poor Lucas forgetting dma_buf_map_incr(map, offsetof(...)); */

is error prone and hard to debug since you will be reading/writting
from/to another location rather than exploding

While with the construct below

         other_map;
         ...
         other_map = INITIALIZER()

I can rely on the compiler complaining about uninitialized var. And
in most of the cases I can just have this single line in the beggining of the
function when the offset is constant:

         struct dma_buf_map other_map = INITIALIZER(bla_map, offsetof(..));


This is useful when you have several small functions in charge of
updating/reading inner struct members.

>
>I've also been very careful to distinguish between .vaddr and 
>.vaddr_iomem, even in places where I wouldn't have to. This macro 
>breaks the assumption.

That's one reason I think if we have this macro, it should be in the
dma_buf_map.h header (or whatever we rename these APIs to). It's the
only place where we can safely add code that relies on the implementation
of the "private" fields in struct dma_buf_map.

Lucas De Marchi

>
>Best regards
>Thomas
>
>>  /**
>>   * dma_buf_map_set_vaddr - Sets a dma-buf mapping structure to an address in system memory
>>   * @map:	The dma-buf mapping structure
>
>-- 
>Thomas Zimmermann
>Graphics Driver Developer
>SUSE Software Solutions Germany GmbH
>Maxfeldstr. 5, 90409 Nürnberg, Germany
>(HRB 36809, AG Nürnberg)
>Geschäftsführer: Ivo Totev



