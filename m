Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F1A576D3C3
	for <lists+dri-devel@lfdr.de>; Wed,  2 Aug 2023 18:33:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA19810E552;
	Wed,  2 Aug 2023 16:33:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D2EB10E552
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Aug 2023 16:33:24 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 372GXH0Y040683;
 Wed, 2 Aug 2023 11:33:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1690993997;
 bh=aj36lQFcLGyLFCI4TdSoefHrWZpxlble72FTUSoXD1M=;
 h=Date:Subject:To:CC:References:From:In-Reply-To;
 b=tfUzKdjeTKEr9zzRx+ue3Gqs13hUAQZxXMUxI+a/zgO2YfdmPJhPP0HHrErpEVNsK
 ZpblM8HX/rCMwWw+yTI1QwqXas8WHDiMEkn28ShVFzQYvMr/NTOrYYBORTcLQNfI43
 1d/JpLc9j94Z9FVsuLyNfY1P3+ZRhWSvRMDPT+W4=
Received: from DLEE106.ent.ti.com (dlee106.ent.ti.com [157.170.170.36])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 372GXHBn068377
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 2 Aug 2023 11:33:17 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 2
 Aug 2023 11:33:17 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 2 Aug 2023 11:33:17 -0500
Received: from [10.250.36.161] (ileaxei01-snat.itg.ti.com [10.180.69.5])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 372GXGFr126074;
 Wed, 2 Aug 2023 11:33:16 -0500
Message-ID: <a3764397-ec79-0bb6-e3f4-179f92e1e45c@ti.com>
Date: Wed, 2 Aug 2023 11:33:16 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3] misc: sram: Add DMA-BUF Heap exporting of SRAM areas
Content-Language: en-US
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20230713191316.116019-1-afd@ti.com>
 <2023071344-skinhead-send-33f7@gregkh>
From: Andrew Davis <afd@ti.com>
In-Reply-To: <2023071344-skinhead-send-33f7@gregkh>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
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
Cc: Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 John Stultz <jstultz@google.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 7/13/23 2:27 PM, Greg Kroah-Hartman wrote:
> On Thu, Jul 13, 2023 at 02:13:16PM -0500, Andrew Davis wrote:
>> +int sram_add_dma_heap(struct sram_dev *sram,
>> +		      struct sram_reserve *block,
>> +		      phys_addr_t start,
>> +		      struct sram_partition *part)
>> +{
>> +	struct sram_dma_heap *sram_dma_heap;
>> +	struct dma_heap_export_info exp_info;
>> +
>> +	dev_info(sram->dev, "Exporting SRAM Heap '%s'\n", block->label);
> 
> When drivers are working properly, they are quiet.
> 

This should only be printed once in early boot when the memory is added,
I was wanting this to match the other memory exporters/output at the
beginning of boot logs.

But quiet is fine too, will change this to dev_dbg() for v4.

Thanks,
Andrew

> thanks,
> 
> greg k-h
