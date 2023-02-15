Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 056DF697AC8
	for <lists+dri-devel@lfdr.de>; Wed, 15 Feb 2023 12:31:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DED8610E08E;
	Wed, 15 Feb 2023 11:30:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF29910E08E
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Feb 2023 11:30:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676460656; x=1707996656;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=w/8TxSnNAH+BRghrAQBoEx6mrAa67WDCH/JQ1gaizsc=;
 b=S/DHfMMTUeBQkNhxynJdgXIdzcwqULztFr8PO6a1vES8YjaJaGxCKuyl
 AzZpG1Z3Bv50YddG2P7zPOIqrxr34hTqqC04cfsT5HDmL7AxRDYVk7cEl
 JG+2y3/0IE0s42ZCIXDatg0jECAYgIjJZxiJqpUTUPXd+hTrT3Qw4GKBn
 UmEaeHKFmEs9KDxP0Sw1kXnaYzg39YQvgInTjOxHoDNSKbk5GFV23cuCJ
 S2W56njlcMkEbY4DSnLqiUIcSY39e2zpg6M5jc4QZYA+hdg0RYtSUorvg
 lj24Z4ybAAOGpHHyZoiWJ6lmDz7Xm33lo4kUeGBtLI7VsdxsVnZaDqgGH g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10621"; a="396027999"
X-IronPort-AV: E=Sophos;i="5.97,299,1669104000"; d="scan'208";a="396027999"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2023 03:30:55 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10621"; a="669577083"
X-IronPort-AV: E=Sophos;i="5.97,299,1669104000"; d="scan'208";a="669577083"
Received: from josefgel-mobl.ger.corp.intel.com (HELO [10.251.213.167])
 ([10.251.213.167])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2023 03:30:53 -0800
Message-ID: <836d600a-bb1c-fbb2-89f5-7c79c3150e8c@linux.intel.com>
Date: Wed, 15 Feb 2023 12:30:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.7.1
Subject: Re: Question: partial transfers of DMABUFs
Content-Language: en-US
To: Paul Cercueil <paul@crapouillou.net>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Vinod Koul <vkoul@kernel.org>
References: <53ea4d2db570d3ca514a69015488bd5b849a5193.camel@crapouillou.net>
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
In-Reply-To: <53ea4d2db570d3ca514a69015488bd5b849a5193.camel@crapouillou.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hey,

On 2023-02-15 11:48, Paul Cercueil wrote:
> Hi,
>
> I am working on adding support for DMABUFs in the IIO subsystem.
>
> One thing we want there, is the ability to specify the number of bytes
> to transfer (while still defaulting to the DMABUF size).
>
> Since dma_buf_map_attachment() returns a sg_table, I basically have two
> options, and I can't decide which one is the best (or the less ugly):
>
> - Either I add a new API function similar to dmaengine_prep_slave_sg(),
> which still takes a scatterlist as argument but also takes the number
> of bytes as argument;
>
> - Or I add a function to duplicate the scatterlist and then shrink it
> manually, which doesn't sound like a good idea either.
>
> What would be the recommended way?

Does this need an api change? If you create a DMA-BUF of size X, it has 
to be of size X. You can pad with a dummy page probably if you know it 
in advance. But after it has been imported, it cannot change size.

You don´t have to write the entire dma-buf either, so if you want to 
create a 1GB buf and only use the first 4K, that is allowed. The 
contents of  the remainder of the DMA-BUF are undefined. It's up to 
userspace to assign a meaning to it.

I think I'm missing something here that makes the whole question m,ake 
more sense.

~Maarten

