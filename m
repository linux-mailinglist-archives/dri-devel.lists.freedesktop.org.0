Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 30D5A831E17
	for <lists+dri-devel@lfdr.de>; Thu, 18 Jan 2024 18:02:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C74AD10E8B5;
	Thu, 18 Jan 2024 17:02:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1FCE10E8B5
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jan 2024 17:02:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
 Message-ID:Sender:Reply-To:Content-ID:Content-Description;
 bh=86x9UQGzuif9Ycxlv973IYRAed3OPWJVVR3izs/Vp2w=; b=k4ZoqsgYCT+fgi+JxQJKgfsiKz
 mUowEqGPILNl2NOKO5ufMZlcQVtm7iKuBKtYtHzOy4g4VB+LHz+GLA00AYgSLOS4HD5nfXsQCeewQ
 KRCTDLQ9opxucEIU/6x4V14Ep5UZHsrMiaEwAoN5gCidQfNnbKtDxbMpcefgNnZtKLhxhdS/t8TO+
 nc5wW2Ra7Bzo1DN57o+F61nFpfaVTUku0m4TudkQdFABtd4/RMSZPJqwXmSHq9fBsPJjGhu835yiM
 t8pZkTecOivC//5F0fvEcqdHmKu05gPSrfnKvjRNNA1A1PVnx1Py/yqfAO6Nl2reWiq5ifBJQkUIk
 StM1Vz2g==;
Received: from [50.53.46.231] (helo=[192.168.254.15])
 by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1rQVkU-003Ktl-0w; Thu, 18 Jan 2024 17:00:14 +0000
Message-ID: <842e9e01-32cf-4a2d-8c5e-334616192889@infradead.org>
Date: Thu, 18 Jan 2024 09:00:13 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/imagination: fix ARRAY_SIZE build error
Content-Language: en-US
To: Matt Coster <Matt.Coster@imgtec.com>
References: <20240110002350.1096-1-rdunlap@infradead.org>
 <ca53a99f-4bd9-47cb-bf4f-869712ef950c@imgtec.com>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <ca53a99f-4bd9-47cb-bf4f-869712ef950c@imgtec.com>
Content-Type: text/plain; charset=UTF-8
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Maxime Ripard <mripard@kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Matt,

On 1/18/24 01:38, Matt Coster wrote:
> On 10/01/2024 00:23, Randy Dunlap wrote:
>> Fix a build error when using GCC 13.2.0 from kernel.org crosstools
>> by changing ARRAY_SIZE() to the macro PVR_MIPS_PT_PAGE_COUNT:
> 
> I assume you're referring to the x86_64 => aarch64 toolchain here?

Yes.

> 
>> drivers/gpu/drm/imagination/pvr_vm_mips.c: In function 'pvr_vm_mips_fini':
>> ../include/linux/array_size.h:11:25: warning: overflow in conversion from 'long unsigned int' to 'int' changes value from '18446744073709551615' to '-1' [-Woverflow]
>>     11 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
>>        |                         ^
>> drivers/gpu/drm/imagination/pvr_vm_mips.c:105:24: note: in expansion of macro 'ARRAY_SIZE'
>>    105 |         for (page_nr = ARRAY_SIZE(mips_data->pt_pages) - 1; page_nr >= 0; page_nr--) {
>>        |                        ^~~~~~~~~~
> 
> I can't seem to reproduce this using the above toolchain (or any other),
> even with -Woverflow explicitly specified.
> 
> The use of ARRAY_SIZE() in loop bounds is a pretty common construction –
> even within the pvr driver. Do you see similar warnings anywhere else?

No, this is the only place that I have seen this issue.

Thanks.

> -- 
> Matt Coster
> Imagination Technologies
> 
>> Fixes: 927f3e0253c1 ("drm/imagination: Implement MIPS firmware processor and MMU support")
>> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
>> Cc: Donald Robson <donald.robson@imgtec.com>
>> Cc: Maxime Ripard <mripard@kernel.org>
>> Cc: Frank Binns <frank.binns@imgtec.com>
>> Cc: Matt Coster <matt.coster@imgtec.com>
>> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>> Cc: Thomas Zimmermann <tzimmermann@suse.de>
>> Cc: David Airlie <airlied@gmail.com>
>> Cc: Daniel Vetter <daniel@ffwll.ch>
>> Cc: dri-devel@lists.freedesktop.org
>> ---
>>   drivers/gpu/drm/imagination/pvr_vm_mips.c |    4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff -- a/drivers/gpu/drm/imagination/pvr_vm_mips.c b/drivers/gpu/drm/imagination/pvr_vm_mips.c
>> --- a/drivers/gpu/drm/imagination/pvr_vm_mips.c
>> +++ b/drivers/gpu/drm/imagination/pvr_vm_mips.c
>> @@ -46,7 +46,7 @@ pvr_vm_mips_init(struct pvr_device *pvr_
>>       if (!mips_data)
>>           return -ENOMEM;
>>   -    for (page_nr = 0; page_nr < ARRAY_SIZE(mips_data->pt_pages); page_nr++) {
>> +    for (page_nr = 0; page_nr < PVR_MIPS_PT_PAGE_COUNT; page_nr++) {
>>           mips_data->pt_pages[page_nr] = alloc_page(GFP_KERNEL | __GFP_ZERO);
>>           if (!mips_data->pt_pages[page_nr]) {
>>               err = -ENOMEM;
>> @@ -102,7 +102,7 @@ pvr_vm_mips_fini(struct pvr_device *pvr_
>>       int page_nr;
>>         vunmap(mips_data->pt);
>> -    for (page_nr = ARRAY_SIZE(mips_data->pt_pages) - 1; page_nr >= 0; page_nr--) {
>> +    for (page_nr = PVR_MIPS_PT_PAGE_COUNT - 1; page_nr >= 0; page_nr--) {
>>           dma_unmap_page(from_pvr_device(pvr_dev)->dev,
>>                      mips_data->pt_dma_addr[page_nr], PAGE_SIZE, DMA_TO_DEVICE);
>>   

-- 
#Randy
