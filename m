Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E21B47C95F8
	for <lists+dri-devel@lfdr.de>; Sat, 14 Oct 2023 20:51:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B58610E0BA;
	Sat, 14 Oct 2023 18:51:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1274 seconds by postgrey-1.36 at gabe;
 Sat, 14 Oct 2023 18:51:37 UTC
Received: from smtp.forwardemail.net (smtp.forwardemail.net [149.28.215.223])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8474310E0BA
 for <dri-devel@lists.freedesktop.org>; Sat, 14 Oct 2023 18:51:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: From: References:
 Cc: To: Subject: MIME-Version: Date: Message-ID; q=dns/txt;
 s=fe-e1b5cab7be; t=1697309495;
 bh=hUNMEXwmvTw5SBMzJ8k04ABt7j0KVQgMlKHvCmzwY40=;
 b=uaZpWCUqTmi2aqfyBV81JVxwc430hDXIujJPItV7PVWaR0vA4v5mj/TzNsmeztt/E4v0MF80V
 BSc1reC9Tex2sfb+6Sqqo5AfzqS3uvCMm9Dh8wZBW/QqMxEQa5ses6yp1Cezdhn23FtcPkInHbD
 yPn0XAVH+vbtEVP080JB65/vi8N0jxIwc+vWY+akb4EUs82B+WQEFDuExUDOtA6X192jT4UD+11
 qD12aCYY+/YBpfyhYd6l9foJuW2r7SBa5zZz//81rA/OXlM/kWD7+Hrs2sgJiiAvaMAwOP8A0WP
 xO64Yfk5Buv/yiU41Ym41TvP+vWzXWsujjziQC9TpXMg==
Message-ID: <3b07caba-3978-372a-9107-f8a73ad6fad1@kwiboo.se>
Date: Sat, 14 Oct 2023 20:30:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v2 3/4] drm/rockchip: fix the plane format defination of
 rk3568/6
To: Andy Yan <andyshrk@163.com>, linux-rockchip@lists.infradead.org,
 dri-devel@lists.freedesktop.org, heiko@sntech.de
References: <20231013122001.1594009-1-andyshrk@163.com>
 <20231013122112.1594259-1-andyshrk@163.com>
Content-Language: en-US
From: Jonas Karlman <jonas@kwiboo.se>
In-Reply-To: <20231013122112.1594259-1-andyshrk@163.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Report-Abuse-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-ForwardEmail-Version: 0.4.40
X-ForwardEmail-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 149.28.215.223
X-ForwardEmail-ID: 652ade3ade770840148a80cd
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
Cc: Andy Yan <andy.yan@rock-chips.com>, s.hauer@pengutronix.de,
 sjoerd.simons@collabora.com, hjc@rock-chips.com,
 sebastian.reichel@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Andy,

On 2023-10-13 14:21, Andy Yan wrote:
> From: Andy Yan <andy.yan@rock-chips.com>
> 
> Add the missing 10 bit RGB format for cluster window.
> The cluster windows on rk3568/6 only support afbc format,
> so change the  linear yuv format NV12/16/24 to non-Linear
> YUV420_8BIT/YUV420_10BIT/YUYV/Y210.
> 
> Add NV15 for esmart windows.
> 
> Also add some comments.
> 
> Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
> 
> ---
> 
> Changes in v2:
> - split rename to another patch
> 
>  drivers/gpu/drm/rockchip/rockchip_vop2_reg.c | 22 +++++++++++++-------
>  1 file changed, 14 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c b/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c
> index 62b573f282a7..05aee588e8c9 100644
> --- a/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c
> +++ b/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c
> @@ -16,6 +16,10 @@
>  #include "rockchip_drm_vop2.h"
>  
>  static const uint32_t formats_win_full_10bit[] = {
> +	DRM_FORMAT_XRGB2101010,
> +	DRM_FORMAT_ARGB2101010,
> +	DRM_FORMAT_XBGR2101010,
> +	DRM_FORMAT_ABGR2101010,

atomic_check() will fail for these formats due to missing support for
these formats in the vop2 driver. Support for these formats should be
added to vop2 driver before being exposed as a supported pixel format.

vop2_convert_format() return -EINVAL for these and below formats.

>  	DRM_FORMAT_XRGB8888,
>  	DRM_FORMAT_ARGB8888,
>  	DRM_FORMAT_XBGR8888,
> @@ -24,9 +28,10 @@ static const uint32_t formats_win_full_10bit[] = {
>  	DRM_FORMAT_BGR888,
>  	DRM_FORMAT_RGB565,
>  	DRM_FORMAT_BGR565,
> -	DRM_FORMAT_NV12,
> -	DRM_FORMAT_NV16,
> -	DRM_FORMAT_NV24,
> +	DRM_FORMAT_YUV420_8BIT, /* yuv420_8bit non-Linear mode only */
> +	DRM_FORMAT_YUV420_10BIT, /* yuv420_10bit non-Linear mode only */

Same for YUV420_8BIT and YUV420_10BIT.

> +	DRM_FORMAT_YUYV, /* yuv422_8bit non-Linear mode only*/
> +	DRM_FORMAT_Y210, /* yuv422_10bit non-Linear mode only */

Same for Y210.

>  };
>  
>  static const uint32_t formats_win_full_10bit_yuyv[] = {
> @@ -38,11 +43,12 @@ static const uint32_t formats_win_full_10bit_yuyv[] = {
>  	DRM_FORMAT_BGR888,
>  	DRM_FORMAT_RGB565,
>  	DRM_FORMAT_BGR565,
> -	DRM_FORMAT_NV12,
> -	DRM_FORMAT_NV16,
> -	DRM_FORMAT_NV24,
> -	DRM_FORMAT_YVYU,
> -	DRM_FORMAT_VYUY,
> +	DRM_FORMAT_NV12, /* yuv420_8bit linear mode, 2 plane */
> +	DRM_FORMAT_NV15, /* yuv420_10bit linear mode, 2 plane, no padding */

Same for NV15.

Regards,
Jonas

> +	DRM_FORMAT_NV16, /* yuv422_8bit linear mode, 2 plane */
> +	DRM_FORMAT_NV24, /* yuv444_8bit linear mode, 2 plane */
> +	DRM_FORMAT_YVYU, /* yuv422_8bit[YVYU] linear mode */
> +	DRM_FORMAT_VYUY, /* yuv422_8bit[VYUY] linear mode */
>  };
>  
>  static const uint32_t formats_win_lite[] = {

