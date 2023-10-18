Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B1DF7CD8AB
	for <lists+dri-devel@lfdr.de>; Wed, 18 Oct 2023 11:54:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B93610E3E6;
	Wed, 18 Oct 2023 09:54:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 348 seconds by postgrey-1.36 at gabe;
 Wed, 18 Oct 2023 09:54:47 UTC
Received: from mail-m118111.qiye.163.com (mail-m118111.qiye.163.com
 [115.236.118.111])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A69510E3D2
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Oct 2023 09:54:46 +0000 (UTC)
DKIM-Signature: a=rsa-sha256;
 b=ktnWCoCVQs3NjOmaLfQWDGqlLKhB4vTfPMuUx4NT7mglrFeujvhtijGgbsTmfwPNUfPz4EDFWD4nwyI3ZFAIXPNTeyajKI0lgLHU4FQ0ZB9gxsGVnMWqmayrM7w43PdDAE4TynnaeKjyF9t/ABnBtuudw6eHohY6bzgJ6iIfNDQ=;
 s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
 bh=iHZj9ysRkLYNKTtdYBxy01Tt4rsin7TfVJbcclPSC6U=;
 h=date:mime-version:subject:message-id:from;
Received: from [172.16.12.141] (unknown [58.22.7.114])
 by mail-m12779.qiye.163.com (Hmail) with ESMTPA id 7BD44780E1F;
 Wed, 18 Oct 2023 17:48:45 +0800 (CST)
Message-ID: <ed5642d7-1e1b-4007-bab3-77f9a8644373@rock-chips.com>
Date: Wed, 18 Oct 2023 17:48:45 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] drm/rockchip: fix the plane format defination of
 rk3568/6
Content-Language: en-US
To: Jonas Karlman <jonas@kwiboo.se>, Andy Yan <andyshrk@163.com>,
 linux-rockchip@lists.infradead.org, dri-devel@lists.freedesktop.org,
 heiko@sntech.de
References: <20231013122001.1594009-1-andyshrk@163.com>
 <20231013122112.1594259-1-andyshrk@163.com>
 <3b07caba-3978-372a-9107-f8a73ad6fad1@kwiboo.se>
From: Andy Yan <andy.yan@rock-chips.com>
In-Reply-To: <3b07caba-3978-372a-9107-f8a73ad6fad1@kwiboo.se>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
 tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGUwZGFYaGk4dTUkZGkgZSENVEwETFh
 oSFyQUDg9ZV1kYEgtZQVlOQ1VJSVVMVUpKT1lXWRYaDxIVHRRZQVlPS0hVSk5MSUpJVUpLS1VKQl
 kG
X-HM-Tid: 0a8b4230070db24fkuuu7bd44780e1f
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Mwg6Dio4Pjw4DEorFhAODAk*
 PDhPFAJVSlVKTUJMTUlJTklNSUxJVTMWGhIXVRoVHwJVAhoVOwkUGBBWGBMSCwhVGBQWRVlXWRIL
 WUFZTkNVSUlVTFVKSk9ZV1kIAVlBT0xKTTcG
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
Cc: s.hauer@pengutronix.de, sjoerd.simons@collabora.com, hjc@rock-chips.com,
 sebastian.reichel@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jonas:

On 10/15/23 02:30, Jonas Karlman wrote:
> Hi Andy,
>
> On 2023-10-13 14:21, Andy Yan wrote:
>> From: Andy Yan <andy.yan@rock-chips.com>
>>
>> Add the missing 10 bit RGB format for cluster window.
>> The cluster windows on rk3568/6 only support afbc format,
>> so change the  linear yuv format NV12/16/24 to non-Linear
>> YUV420_8BIT/YUV420_10BIT/YUYV/Y210.
>>
>> Add NV15 for esmart windows.
>>
>> Also add some comments.
>>
>> Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
>>
>> ---
>>
>> Changes in v2:
>> - split rename to another patch
>>
>>   drivers/gpu/drm/rockchip/rockchip_vop2_reg.c | 22 +++++++++++++-------
>>   1 file changed, 14 insertions(+), 8 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c b/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c
>> index 62b573f282a7..05aee588e8c9 100644
>> --- a/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c
>> +++ b/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c
>> @@ -16,6 +16,10 @@
>>   #include "rockchip_drm_vop2.h"
>>   
>>   static const uint32_t formats_win_full_10bit[] = {
>> +	DRM_FORMAT_XRGB2101010,
>> +	DRM_FORMAT_ARGB2101010,
>> +	DRM_FORMAT_XBGR2101010,
>> +	DRM_FORMAT_ABGR2101010,
> atomic_check() will fail for these formats due to missing support for
> these formats in the vop2 driver. Support for these formats should be
> added to vop2 driver before being exposed as a supported pixel format.
>
> vop2_convert_format() return -EINVAL for these and below formats.


Thanks for catching this, I fixed it in v3, Add have  all the added  
afbc format  tested on my rk3566-box-demo board.

>
>>   	DRM_FORMAT_XRGB8888,
>>   	DRM_FORMAT_ARGB8888,
>>   	DRM_FORMAT_XBGR8888,
>> @@ -24,9 +28,10 @@ static const uint32_t formats_win_full_10bit[] = {
>>   	DRM_FORMAT_BGR888,
>>   	DRM_FORMAT_RGB565,
>>   	DRM_FORMAT_BGR565,
>> -	DRM_FORMAT_NV12,
>> -	DRM_FORMAT_NV16,
>> -	DRM_FORMAT_NV24,
>> +	DRM_FORMAT_YUV420_8BIT, /* yuv420_8bit non-Linear mode only */
>> +	DRM_FORMAT_YUV420_10BIT, /* yuv420_10bit non-Linear mode only */
> Same for YUV420_8BIT and YUV420_10BIT.
>
>> +	DRM_FORMAT_YUYV, /* yuv422_8bit non-Linear mode only*/
>> +	DRM_FORMAT_Y210, /* yuv422_10bit non-Linear mode only */
> Same for Y210.
>
>>   };
>>   
>>   static const uint32_t formats_win_full_10bit_yuyv[] = {
>> @@ -38,11 +43,12 @@ static const uint32_t formats_win_full_10bit_yuyv[] = {
>>   	DRM_FORMAT_BGR888,
>>   	DRM_FORMAT_RGB565,
>>   	DRM_FORMAT_BGR565,
>> -	DRM_FORMAT_NV12,
>> -	DRM_FORMAT_NV16,
>> -	DRM_FORMAT_NV24,
>> -	DRM_FORMAT_YVYU,
>> -	DRM_FORMAT_VYUY,
>> +	DRM_FORMAT_NV12, /* yuv420_8bit linear mode, 2 plane */
>> +	DRM_FORMAT_NV15, /* yuv420_10bit linear mode, 2 plane, no padding */
> Same for NV15.
>
> Regards,
> Jonas
>
>> +	DRM_FORMAT_NV16, /* yuv422_8bit linear mode, 2 plane */
>> +	DRM_FORMAT_NV24, /* yuv444_8bit linear mode, 2 plane */
>> +	DRM_FORMAT_YVYU, /* yuv422_8bit[YVYU] linear mode */
>> +	DRM_FORMAT_VYUY, /* yuv422_8bit[VYUY] linear mode */
>>   };
>>   
>>   static const uint32_t formats_win_lite[] = {
