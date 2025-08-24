Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89AD8B32DC8
	for <lists+dri-devel@lfdr.de>; Sun, 24 Aug 2025 08:36:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0C3510E0EE;
	Sun, 24 Aug 2025 06:36:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.b="bxUMKVL+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-m1973174.qiye.163.com (mail-m1973174.qiye.163.com
 [220.197.31.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE1B710E0EE
 for <dri-devel@lists.freedesktop.org>; Sun, 24 Aug 2025 06:36:12 +0000 (UTC)
Received: from [172.16.12.26] (unknown [58.22.7.114])
 by smtp.qiye.163.com (Hmail) with ESMTP id 2063387f6;
 Sun, 24 Aug 2025 14:36:09 +0800 (GMT+08:00)
Message-ID: <8513b4b6-0b59-4b42-864b-0fe0423cd7fd@rock-chips.com>
Date: Sun, 24 Aug 2025 14:36:07 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] drm/rockchip: analogix_dp: Apply
 devm_clk_get_optional() for &rockchip_dp_device.grfclk
To: Heiko Stuebner <heiko@sntech.de>, andy.yan@rock-chips.com,
 hjc@rock-chips.com
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 dmitry.baryshkov@oss.qualcomm.com, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250824031932.3204920-1-damon.ding@rock-chips.com>
 <7656195.LvFx2qVVIh@phil>
Content-Language: en-US
From: Damon Ding <damon.ding@rock-chips.com>
In-Reply-To: <7656195.LvFx2qVVIh@phil>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a98dacaa0e303a3kunmefff2f7629c876
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
 tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQkoZQlYYTk5LS01CQkpMQk9WFRQJFh
 oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
 hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
 b=bxUMKVL+NrOoJGo0j4JgfMVjfGeoJtah3thFVVG8wSzKTDStABIUg7WbZ9XvtcP47w1h8dvuRThD6xthQB6L53UVa3N1PaIfZmKod8eCZd4iuBDTPsGmWtFHEFkK6EmcaYr6PGmOunhPJgBRb+vaFxz5D6HPK53Opjr1JHcx5ws=;
 c=relaxed/relaxed; s=default; d=rock-chips.com; v=1; 
 bh=XcRU7Z/PkU7Ppn7Ao+1BSxCwQMj8o7al8ldpZz63HXk=;
 h=date:mime-version:subject:message-id:from;
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Heiko,

On 8/24/2025 2:08 PM, Heiko Stuebner wrote:
> Hi Damon,
> 
> Am Sonntag, 24. August 2025, 05:19:32 Mitteleuropäische Sommerzeit schrieb Damon Ding:
>> The "grf" clock is optional for Rockchip eDP controller(RK3399 needs
>> while RK3288 and RK3588 do not).
>>
>> It can make the code more consice to use devm_clk_get_optional()
>> instead of devm_clk_get() with extra checks.
>>
>> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
>> ---
>>   drivers/gpu/drm/rockchip/analogix_dp-rockchip.c | 8 ++------
>>   1 file changed, 2 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
>> index d30f0983a53a..d0f78ab9faa6 100644
>> --- a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
>> +++ b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
>> @@ -335,12 +335,8 @@ static int rockchip_dp_of_probe(struct rockchip_dp_device *dp)
>>   		return PTR_ERR(dp->grf);
>>   	}
>>   
>> -	dp->grfclk = devm_clk_get(dev, "grf");
>> -	if (PTR_ERR(dp->grfclk) == -ENOENT) {
>> -		dp->grfclk = NULL;
>> -	} else if (PTR_ERR(dp->grfclk) == -EPROBE_DEFER) {
>> -		return -EPROBE_DEFER;
>> -	} else if (IS_ERR(dp->grfclk)) {
>> +	dp->grfclk = devm_clk_get_optional(dev, "grf");
>> +	if (IS_ERR(dp->grfclk)) {
>>   		DRM_DEV_ERROR(dev, "failed to get grf clock\n");
>>   		return PTR_ERR(dp->grfclk);
> 
> generall I definitly I agree, but you're loosing the
> "don't print anything for EPROBE_DEFER" handling.
> 
> Additionally DRM_DEV_ERROR says in the code
> "this is deprecated in favor of drm_err() or dev_err()." .
> 
> Also this in the probe-path, so to catch both issues, I'd sugest
> using dev_err_probe() for the message, which handles EPROBE_DEFER
> automatically.
> 

Yeah, I will use dev_err_probe() instead in the next version.

In addition, it should be nice to modify the other similar codes in 
rockchip_dp_of_probe(). I will add another commit to do it.

Best regards,
Damon

