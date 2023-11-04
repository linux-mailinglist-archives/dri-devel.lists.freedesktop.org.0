Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EAA77E0D33
	for <lists+dri-devel@lfdr.de>; Sat,  4 Nov 2023 03:07:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 627DA10E1B5;
	Sat,  4 Nov 2023 02:07:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C067410E1B5
 for <dri-devel@lists.freedesktop.org>; Sat,  4 Nov 2023 02:07:42 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 78727B80F3B;
 Sat,  4 Nov 2023 02:07:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A970C433C8;
 Sat,  4 Nov 2023 02:07:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1699063659;
 bh=L6ks4yKT0/F+fOvkUaGIHPgT6JzQVMFwAqz5caY4KZU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=UJUrnToOTQovPehLi9haOD6o6/5UCScaj5JM30hNFQItSwGi1w+nMogw1UJ/dJYpc
 ua3XgBh20btA8FNNcYLkjqecTFGkHFMrG0bs6JLz1Up7iX9f62geWyNSHBrE6iL1Zl
 uEgPkL2FyLym3rEwvNYaWzAVaIKSuYTXN3qSzukOQZ41rRUW5ZVmL01GxrE1ywBgQs
 gzknh1xRxRIcS0jDbi7PqRqcfJCD6q3az+h7frcHd4y9NeqEbYOWzEmOad84/06Fns
 h3OnLG5IEEok7PiPAzPDzkaIL4RZiyHzkTMlrRnObJESAbpscTKuRvWHu8izzYbW+G
 0TbNtB5ppbLJg==
Date: Fri, 3 Nov 2023 22:07:38 -0400
From: Sasha Levin <sashal@kernel.org>
To: Sergey Shtylyov <s.shtylyov@omp.ru>
Subject: Re: [PATCH AUTOSEL 6.5 34/52] fbdev: core: cfbcopyarea: fix sloppy
 typing
Message-ID: <ZUWnasfAphVCFPhR@sashalap>
References: <20231029225441.789781-1-sashal@kernel.org>
 <20231029225441.789781-34-sashal@kernel.org>
 <a93b7be2-a0a6-084d-47e6-a0e8fcd5bc2b@omp.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <a93b7be2-a0a6-084d-47e6-a0e8fcd5bc2b@omp.ru>
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
Cc: linux-fbdev@vger.kernel.org, Helge Deller <deller@gmx.de>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 stable@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Oct 30, 2023 at 11:39:14AM +0300, Sergey Shtylyov wrote:
>Hello!
>
>On 10/30/23 1:53 AM, Sasha Levin wrote:
>
>> From: Sergey Shtylyov <s.shtylyov@omp.ru>
>>
>> [ Upstream commit 7f33df94cf0156f64eee9509bd9b4a178990f613 ]
>>
>> In cfb_copyarea(), the local variable bits_per_line is needlessly typed as
>> *unsigned long* -- which is a 32-bit type on the 32-bit arches and a 64-bit
>> type on the 64-bit arches; that variable's value is derived from the __u32
>> typed fb_fix_screeninfo::line_length field (multiplied by 8u) and a 32-bit
>> *unsigned int* type should still be enough to store the # of bits per line.
>>
>> Found by Linux Verification Center (linuxtesting.org) with the Svace static
>> analysis tool.
>>
>> Signed-off-by: Sergey Shtylyov <s.shtylyov@omp.ru>
>> Signed-off-by: Helge Deller <deller@gmx.de>
>> Signed-off-by: Sasha Levin <sashal@kernel.org>
>> ---
>>  drivers/video/fbdev/core/cfbcopyarea.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/video/fbdev/core/cfbcopyarea.c b/drivers/video/fbdev/core/cfbcopyarea.c
>> index 6d4bfeecee350..5b80bf3dae504 100644
>> --- a/drivers/video/fbdev/core/cfbcopyarea.c
>> +++ b/drivers/video/fbdev/core/cfbcopyarea.c
>> @@ -382,7 +382,7 @@ void cfb_copyarea(struct fb_info *p, const struct fb_copyarea *area)
>>  {
>>  	u32 dx = area->dx, dy = area->dy, sx = area->sx, sy = area->sy;
>>  	u32 height = area->height, width = area->width;
>> -	unsigned long const bits_per_line = p->fix.line_length*8u;
>> +	unsigned int const bits_per_line = p->fix.line_length * 8u;
>>  	unsigned long __iomem *base = NULL;
>>  	int bits = BITS_PER_LONG, bytes = bits >> 3;
>>  	unsigned dst_idx = 0, src_idx = 0, rev_copy = 0;
>
>   I highly doubt this is necessary to pull that into stable. This was
>intended to be a cleanup originally.

I'll drop this and the other one you've pointed out, thanks!

-- 
Thanks,
Sasha
