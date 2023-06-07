Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AEACF725AB8
	for <lists+dri-devel@lfdr.de>; Wed,  7 Jun 2023 11:38:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBB8610E49F;
	Wed,  7 Jun 2023 09:38:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0E6110E49F
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Jun 2023 09:38:20 +0000 (UTC)
Received: from [192.168.88.20] (91-154-35-171.elisa-laajakaista.fi
 [91.154.35.171])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 25D1B2B6;
 Wed,  7 Jun 2023 11:37:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1686130672;
 bh=Tb+ysY4linkYaB45XMud7iGM44eizwZQ/ClNN38SdNQ=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=AxARCMkCrorxgL1QOSjqBlpeMh0qnkevxUSwoTHNpas7vYFt1xd1eySO/fHrf8Pfn
 ZTvQENB7mUn6f6eErfsKxP1aaxysNw4dSSzsESYioCF1ybAw8mhTuGysvZkbJVmNUl
 TJdHc+7gcnXhziZQ0GeQ34IOaXEJGw1Ga60kJRNQ=
Message-ID: <70a188a2-7d56-9798-ecc9-700c9e8fd57f@ideasonboard.com>
Date: Wed, 7 Jun 2023 12:38:14 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] drm: xlnx: zynqmp_dpsub: Add missing check for
 dma_set_mask
Content-Language: en-US
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Jiasheng Jiang <jiasheng@iscas.ac.cn>
References: <20230607020529.22934-1-jiasheng@iscas.ac.cn>
 <20230607050705.GF14101@pendragon.ideasonboard.com>
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <20230607050705.GF14101@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: hyun.kwon@xilinx.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, michal.simek@amd.com,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 07/06/2023 08:07, Laurent Pinchart wrote:
> Hello Jiasheng,
> 
> Thank you for the patch.
> 
> On Wed, Jun 07, 2023 at 10:05:29AM +0800, Jiasheng Jiang wrote:
>> Add check for dma_set_mask() and return the error if it fails.
>>
>> Fixes: d76271d22694 ("drm: xlnx: DRM/KMS driver for Xilinx ZynqMP DisplayPort Subsystem")
>> Signed-off-by: Jiasheng Jiang <jiasheng@iscas.ac.cn>
>> ---
>>   drivers/gpu/drm/xlnx/zynqmp_dpsub.c | 4 +++-
>>   1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/xlnx/zynqmp_dpsub.c b/drivers/gpu/drm/xlnx/zynqmp_dpsub.c
>> index bab862484d42..068413be6527 100644
>> --- a/drivers/gpu/drm/xlnx/zynqmp_dpsub.c
>> +++ b/drivers/gpu/drm/xlnx/zynqmp_dpsub.c
>> @@ -227,7 +227,9 @@ static int zynqmp_dpsub_probe(struct platform_device *pdev)
>>   	dpsub->dev = &pdev->dev;
>>   	platform_set_drvdata(pdev, dpsub);
>>   
>> -	dma_set_mask(dpsub->dev, DMA_BIT_MASK(ZYNQMP_DISP_MAX_DMA_BIT));
>> +	ret = dma_set_mask(dpsub->dev, DMA_BIT_MASK(ZYNQMP_DISP_MAX_DMA_BIT));
>> +	if (ret)
>> +		return ret;
> 
> This seems reasonable.
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 
> Tomi, would you be able to quickly test this ?

Works for me.

Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

  Tomi

