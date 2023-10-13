Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 372187C7E00
	for <lists+dri-devel@lfdr.de>; Fri, 13 Oct 2023 08:49:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11F5010E5AF;
	Fri, 13 Oct 2023 06:49:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 365 seconds by postgrey-1.36 at gabe;
 Fri, 13 Oct 2023 06:49:45 UTC
Received: from mail-m12793.qiye.163.com (mail-m12793.qiye.163.com
 [115.236.127.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1056410E5AF
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Oct 2023 06:49:44 +0000 (UTC)
DKIM-Signature: a=rsa-sha256;
 b=SXvp1Hqo4KrRsJir5t70t3q3+nMGTk5T7wLEuHW1pshyvOE2QXQBe2a3iWqj9rPQRw9u5a9cMLq1nxYTqe0+Pc0bWCUFepNmjWXsZu8h7KFslrPp+R/vI2sm9ma6KfVjyAmze4c3DLUxOc7o827ph4PjpYBu2+lwi+D9wtGCiGM=;
 s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
 bh=/J8MCPtcoAdb5sqYoyuWKaTpAz3ggHxQnms1iSj6HBA=;
 h=date:mime-version:subject:message-id:from;
Received: from [172.16.12.141] (unknown [58.22.7.114])
 by mail-m12779.qiye.163.com (Hmail) with ESMTPA id 18953780307;
 Fri, 13 Oct 2023 14:43:32 +0800 (CST)
Message-ID: <afd589f4-4fcc-4ede-8e16-a8bb4d8f29f2@rock-chips.com>
Date: Fri, 13 Oct 2023 14:43:31 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] drm/rockchip: fix the plane format defination of
 rk3568/6
Content-Language: en-US
To: Sascha Hauer <s.hauer@pengutronix.de>, Andy Yan <andyshrk@163.com>
References: <20231012023439.1497304-1-andyshrk@163.com>
 <20231012023705.1497648-1-andyshrk@163.com>
 <20231013061106.GH3359458@pengutronix.de>
From: Andy Yan <andy.yan@rock-chips.com>
In-Reply-To: <20231013061106.GH3359458@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
 tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGUtJT1ZDSUwdSxlCGk1CSE5VEwETFh
 oSFyQUDg9ZV1kYEgtZQVlOQ1VJSVVMVUpKT1lXWRYaDxIVHRRZQVlPS0hVSk5MSUpJVUpLS1VKQl
 kG
X-HM-Tid: 0a8b27c6a73eb24fkuuu18953780307
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6NzI6Fww*CDw*LgkuCyI5Mj8c
 LzJPCRxVSlVKTUJMSkxCT0pJQ05MVTMWGhIXVRoVHwJVAhoVOwkUGBBWGBMSCwhVGBQWRVlXWRIL
 WUFZTkNVSUlVTFVKSk9ZV1kIAVlBQ0tISzcG
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
Cc: sjoerd.simons@collabora.com, sebastian.reichel@collabora.com,
 dri-devel@lists.freedesktop.org, hjc@rock-chips.com,
 linux-rockchip@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sacha:

On 10/13/23 14:11, Sascha Hauer wrote:
> On Thu, Oct 12, 2023 at 10:37:05AM +0800, Andy Yan wrote:
>> From: Andy Yan <andy.yan@rock-chips.com>
>>
>> The cluster windows on rk3568/6 only support afbc format,
>> linear format(RGB/YUV) are not supported.
>> The cluster windows on rk3588 support both linear and afbc rgb
>> format, but for yuv format it only support afbc.
>>
>> The esmart windows on rk3588 support uv swap for yuyv, but
>> rk356x does not support it.
> It's a bit hard to track which sentence in the description refers to
> which change in the patch. Could you split this up into multiple patches
> to make this easier reviewable?
>
> Renaming of the formats could also be a separate patch. Patches marked
> with "no functional change" are nice and easy to review.


How do you like if I split  the patch like bellow:

PATCH 1 : fix the format

PATCH 2: rename: s/formats_win_full_10bit/formats_cluster/

s/formats_win_full_10bit_yuyv/formats_rk356x_esmart/

s/formats_win_little/formats_win_smart/

>> Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
>> ---
>>
>>   drivers/gpu/drm/rockchip/rockchip_vop2_reg.c | 53 +++++++++++---------
>>   1 file changed, 30 insertions(+), 23 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c b/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c
>> index 62b573f282a7..cde85a17f138 100644
>> --- a/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c
>> +++ b/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c
>> @@ -15,7 +15,11 @@
>>   
>>   #include "rockchip_drm_vop2.h"
>>   
>> -static const uint32_t formats_win_full_10bit[] = {
>> +static const uint32_t formats_for_cluster[] = {
> You can drop the "for_"
>
> Sascha
>
>> +	DRM_FORMAT_XRGB2101010,
>> +	DRM_FORMAT_ARGB2101010,
>> +	DRM_FORMAT_XBGR2101010,
>> +	DRM_FORMAT_ABGR2101010,
>>   	DRM_FORMAT_XRGB8888,
>>   	DRM_FORMAT_ARGB8888,
>>   	DRM_FORMAT_XBGR8888,
>> @@ -24,12 +28,14 @@ static const uint32_t formats_win_full_10bit[] = {
>>   	DRM_FORMAT_BGR888,
>>   	DRM_FORMAT_RGB565,
>>   	DRM_FORMAT_BGR565,
>> -	DRM_FORMAT_NV12,
>> -	DRM_FORMAT_NV16,
>> -	DRM_FORMAT_NV24,
>> +	DRM_FORMAT_YUV420_8BIT, /* yuv420_8bit non-Linear mode only */
>> +	DRM_FORMAT_YUV420_10BIT, /* yuv420_10bit non-Linear mode only */
>> +	DRM_FORMAT_YUYV, /* yuv422_8bit non-Linear mode only*/
>> +	DRM_FORMAT_Y210, /* yuv422_10bit non-Linear mode only */
>>   };
>>   
>> -static const uint32_t formats_win_full_10bit_yuyv[] = {
>> +/* RK356x can't support uv swap for YUYV and UYVY */
>> +static const uint32_t formats_for_rk356x_esmart[] = {
>>   	DRM_FORMAT_XRGB8888,
>>   	DRM_FORMAT_ARGB8888,
>>   	DRM_FORMAT_XBGR8888,
>> @@ -38,14 +44,15 @@ static const uint32_t formats_win_full_10bit_yuyv[] = {
>>   	DRM_FORMAT_BGR888,
>>   	DRM_FORMAT_RGB565,
>>   	DRM_FORMAT_BGR565,
>> -	DRM_FORMAT_NV12,
>> -	DRM_FORMAT_NV16,
>> -	DRM_FORMAT_NV24,
>> -	DRM_FORMAT_YVYU,
>> -	DRM_FORMAT_VYUY,
>> +	DRM_FORMAT_NV12, /* yuv420_8bit linear mode, 2 plane */
>> +	DRM_FORMAT_NV16, /* yuv422_8bit linear mode, 2 plane */
>> +	DRM_FORMAT_NV24, /* yuv444_8bit linear mode, 2 plane */
>> +	DRM_FORMAT_NV15, /* yuv420_10bit linear mode, 2 plane, no padding */
>> +	DRM_FORMAT_YUYV, /* yuv422_8bit[YUYV] linear mode */
>> +	DRM_FORMAT_UYVY, /* yuv422_8bit[UYVY] linear mode */
>>   };
>>   
>> -static const uint32_t formats_win_lite[] = {
>> +static const uint32_t formats_for_smart[] = {
>>   	DRM_FORMAT_XRGB8888,
>>   	DRM_FORMAT_ARGB8888,
>>   	DRM_FORMAT_XBGR8888,
>> @@ -144,8 +151,8 @@ static const struct vop2_win_data rk3568_vop_win_data[] = {
>>   		.name = "Smart0-win0",
>>   		.phys_id = ROCKCHIP_VOP2_SMART0,
>>   		.base = 0x1c00,
>> -		.formats = formats_win_lite,
>> -		.nformats = ARRAY_SIZE(formats_win_lite),
>> +		.formats = formats_for_smart,
>> +		.nformats = ARRAY_SIZE(formats_for_smart),
>>   		.format_modifiers = format_modifiers,
>>   		.layer_sel_id = 3,
>>   		.supported_rotations = DRM_MODE_REFLECT_Y,
>> @@ -156,8 +163,8 @@ static const struct vop2_win_data rk3568_vop_win_data[] = {
>>   	}, {
>>   		.name = "Smart1-win0",
>>   		.phys_id = ROCKCHIP_VOP2_SMART1,
>> -		.formats = formats_win_lite,
>> -		.nformats = ARRAY_SIZE(formats_win_lite),
>> +		.formats = formats_for_smart,
>> +		.nformats = ARRAY_SIZE(formats_for_smart),
>>   		.format_modifiers = format_modifiers,
>>   		.base = 0x1e00,
>>   		.layer_sel_id = 7,
>> @@ -169,8 +176,8 @@ static const struct vop2_win_data rk3568_vop_win_data[] = {
>>   	}, {
>>   		.name = "Esmart1-win0",
>>   		.phys_id = ROCKCHIP_VOP2_ESMART1,
>> -		.formats = formats_win_full_10bit_yuyv,
>> -		.nformats = ARRAY_SIZE(formats_win_full_10bit_yuyv),
>> +		.formats = formats_for_rk356x_esmart,
>> +		.nformats = ARRAY_SIZE(formats_for_rk356x_esmart),
>>   		.format_modifiers = format_modifiers,
>>   		.base = 0x1a00,
>>   		.layer_sel_id = 6,
>> @@ -182,8 +189,8 @@ static const struct vop2_win_data rk3568_vop_win_data[] = {
>>   	}, {
>>   		.name = "Esmart0-win0",
>>   		.phys_id = ROCKCHIP_VOP2_ESMART0,
>> -		.formats = formats_win_full_10bit_yuyv,
>> -		.nformats = ARRAY_SIZE(formats_win_full_10bit_yuyv),
>> +		.formats = formats_for_rk356x_esmart,
>> +		.nformats = ARRAY_SIZE(formats_for_rk356x_esmart),
>>   		.format_modifiers = format_modifiers,
>>   		.base = 0x1800,
>>   		.layer_sel_id = 2,
>> @@ -196,8 +203,8 @@ static const struct vop2_win_data rk3568_vop_win_data[] = {
>>   		.name = "Cluster0-win0",
>>   		.phys_id = ROCKCHIP_VOP2_CLUSTER0,
>>   		.base = 0x1000,
>> -		.formats = formats_win_full_10bit,
>> -		.nformats = ARRAY_SIZE(formats_win_full_10bit),
>> +		.formats = formats_for_cluster,
>> +		.nformats = ARRAY_SIZE(formats_for_cluster),
>>   		.format_modifiers = format_modifiers_afbc,
>>   		.layer_sel_id = 0,
>>   		.supported_rotations = DRM_MODE_ROTATE_90 | DRM_MODE_ROTATE_270 |
>> @@ -211,8 +218,8 @@ static const struct vop2_win_data rk3568_vop_win_data[] = {
>>   		.name = "Cluster1-win0",
>>   		.phys_id = ROCKCHIP_VOP2_CLUSTER1,
>>   		.base = 0x1200,
>> -		.formats = formats_win_full_10bit,
>> -		.nformats = ARRAY_SIZE(formats_win_full_10bit),
>> +		.formats = formats_for_cluster,
>> +		.nformats = ARRAY_SIZE(formats_for_cluster),
>>   		.format_modifiers = format_modifiers_afbc,
>>   		.layer_sel_id = 1,
>>   		.supported_rotations = DRM_MODE_ROTATE_90 | DRM_MODE_ROTATE_270 |
>> -- 
>> 2.34.1
>>
>>
