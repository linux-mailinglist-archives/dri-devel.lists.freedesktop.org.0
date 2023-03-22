Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F4C26C4438
	for <lists+dri-devel@lfdr.de>; Wed, 22 Mar 2023 08:40:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5077210E36C;
	Wed, 22 Mar 2023 07:40:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from 189.cn (ptr.189.cn [183.61.185.102])
 by gabe.freedesktop.org (Postfix) with ESMTP id E773D10E36C
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Mar 2023 07:39:58 +0000 (UTC)
HMM_SOURCE_IP: 10.64.8.43:59190.1705419054
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-114.242.206.180 (unknown [10.64.8.43])
 by 189.cn (HERMES) with SMTP id A3EB01002AE;
 Wed, 22 Mar 2023 15:39:50 +0800 (CST)
Received: from  ([114.242.206.180])
 by gateway-151646-dep-7b48884fd-tj646 with ESMTP id
 dca679d30116485da459dc3964325aa4 for tzimmermann@suse.de; 
 Wed, 22 Mar 2023 15:39:57 CST
X-Transaction-ID: dca679d30116485da459dc3964325aa4
X-Real-From: 15330273260@189.cn
X-Receive-IP: 114.242.206.180
X-MEDUSA-Status: 0
Message-ID: <fe469fce-f15a-d381-e972-d38dda51e5cf@189.cn>
Date: Wed, 22 Mar 2023 15:39:49 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [v2,4/8] drm/fb-helper: Support smem_len in deferred I/O
Content-Language: en-US
To: Thomas Zimmermann <tzimmermann@suse.de>, javierm@redhat.com,
 daniel@ffwll.ch, airlied@gmail.com, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, zackr@vmware.com, kraxel@redhat.com,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 linux-graphics-maintainer@vmware.com
References: <20230320150751.20399-5-tzimmermann@suse.de>
From: Sui Jingfeng <15330273260@189.cn>
In-Reply-To: <20230320150751.20399-5-tzimmermann@suse.de>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Yet, better to clarify which one should be used, not two.

Tested-by: Sui Jingfeng <suijingfeng@loongson.cn>


On 2023/3/20 23:07, Thomas Zimmermann wrote:
> The size of the framebuffer can either be stored in screen_info or
> smem_len. Take both into account in the deferred I/O code.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
> ---
>   drivers/gpu/drm/drm_fb_helper.c | 8 ++++++--
>   1 file changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
> index 7e96ed9efdb5..bb0b25209b3e 100644
> --- a/drivers/gpu/drm/drm_fb_helper.c
> +++ b/drivers/gpu/drm/drm_fb_helper.c
> @@ -672,7 +672,7 @@ static void drm_fb_helper_memory_range_to_clip(struct fb_info *info, off_t off,
>   void drm_fb_helper_deferred_io(struct fb_info *info, struct list_head *pagereflist)
>   {
>   	struct drm_fb_helper *helper = info->par;
> -	unsigned long start, end, min_off, max_off;
> +	unsigned long start, end, min_off, max_off, total_size;
>   	struct fb_deferred_io_pageref *pageref;
>   	struct drm_rect damage_area;
>   
> @@ -690,7 +690,11 @@ void drm_fb_helper_deferred_io(struct fb_info *info, struct list_head *pagerefli
>   	 * of the screen and account for non-existing scanlines. Hence,
>   	 * keep the covered memory area within the screen buffer.
>   	 */
> -	max_off = min(max_off, info->screen_size);
> +	if (info->screen_size)
> +		total_size = info->screen_size;
> +	else
> +		total_size = info->fix.smem_len;
> +	max_off = min(max_off, total_size);
>   
>   	if (min_off < max_off) {
>   		drm_fb_helper_memory_range_to_clip(info, min_off, max_off - min_off, &damage_area);
