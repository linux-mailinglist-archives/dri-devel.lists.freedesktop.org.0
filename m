Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9851E61F760
	for <lists+dri-devel@lfdr.de>; Mon,  7 Nov 2022 16:16:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 133D910E3C2;
	Mon,  7 Nov 2022 15:16:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81FAC10E3C2
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Nov 2022 15:16:36 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id g12so16661675wrs.10
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Nov 2022 07:16:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Q908VuZ5cJytv2/gI78/GYL+1PN9gGzcS5yUknzV+T0=;
 b=Wpu9rKvfoUbVgTy0zuO9ScrrxoN6dp/6O05Txoc99yp3KdpHUu2iomCgFM3yq0gdme
 19bjClFCaEYbac4o4yNLc3bzOgwXmmYtwyHSpnSKqgce7WGpliizIQLzwuOtJZwr10/B
 MW9WFpAASjpSop6DF7zi7txivZ06BFKg1HqPjp8E5bK1IS/ppA043ESQIxyh1nZZuPD+
 Fd4S9i9T3foDUZIenDxkW+DgMdNATDKJXEsrhyObQk5bAy0+ZcpicmGNsDL1IdVK+ejN
 vPI3O0eEhMAydvRV0rVheFxvUcuXfFYXN5jQ1yG8qd41LTdGZbovaGl9XfS5qnhblMui
 bUXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Q908VuZ5cJytv2/gI78/GYL+1PN9gGzcS5yUknzV+T0=;
 b=VWW1revpDUzPNzCAQuwZaj79xtLr0Z+LpDGM1urRKU+rFE0aF0M0xMrISMy84aZOJU
 7zuakieFm1R0S70KDtgq+ItPaO95K3EiCfC0dGOXAs3/lOqRrpGu47sfn5oeV0uqfBQm
 70BHB2t9PRNnlpgOs6eOsYDQ9ltE4u3D4bT0IfoHE03erfxaMnkk+kh043ML3+gEUjih
 V2Y3H8633+FZT98R12JvRydy10FjLQBMOK8xG2Pc8/70zcUKZH8fA9gaOsINGnGzDWTb
 tf4lVJ/nQuApRAWw4bnD/oaART763B+R3VON4JjJ6Rxa9uvicCGIoaOLDUeQORJVSqEw
 gtgA==
X-Gm-Message-State: ACrzQf112fsIDCT7CuDzxgSpcn2tpaRwl9JL0MSJkQ8VfuMoqoak+jOc
 +2ICCTltYn2GEjI2sHhbfbs=
X-Google-Smtp-Source: AMsMyM6cPcZM0jL6k4OqPbT+5EwFiAHx1Ei9YgybnmxozUr4ENJVn0werjS597XLtu9Tw0++xRinBA==
X-Received: by 2002:a5d:5292:0:b0:236:ccb9:673b with SMTP id
 c18-20020a5d5292000000b00236ccb9673bmr27567091wrv.317.1667834194880; 
 Mon, 07 Nov 2022 07:16:34 -0800 (PST)
Received: from [192.168.2.181] (84-238-195-21.ip.btc-net.bg. [84.238.195.21])
 by smtp.gmail.com with ESMTPSA id
 n37-20020a05600c3ba500b003cfa3a12660sm13232566wms.1.2022.11.07.07.16.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Nov 2022 07:16:34 -0800 (PST)
Message-ID: <a722801b-e8b1-ccce-41e3-5951958baa9f@gmail.com>
Date: Mon, 7 Nov 2022 17:16:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v2] drm/vmwgfx: Protect pin_user_pages with mmap_lock
To: Dawei Li <set_pte_at@outlook.com>, zackr@vmware.com, airlied@gmail.com,
 daniel@ffwll.ch
References: <TYCP286MB23235B138D18ECA0797A6D0FCA3D9@TYCP286MB2323.JPNP286.PROD.OUTLOOK.COM>
Content-Language: en-US
From: "Martin Krastev (VMware)" <martinkrastev768@gmail.com>
In-Reply-To: <TYCP286MB23235B138D18ECA0797A6D0FCA3D9@TYCP286MB2323.JPNP286.PROD.OUTLOOK.COM>
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
Cc: krastevm@vmware.com, linux-graphics-maintainer@vmware.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Martin Krastev <krastevm@vmware.com>



Thanks for the catch. LGTM, with the following remarks:


1) Original design used erroneously pin_user_pages() in place of 
pin_user_pages_fast(); you could just substitute pin_user_pages for 
pin_user_pages_fast and call it a day, Please, consider that option 
after reading (2) below.

2) Re exception handling in vmw_mksstat_add_ioctl(), the 'incorrect 
exception handling' would be incorrect in the context of the new 
refactor, i.e. with a common entry point to all pin_user_pages() 
exceptions; it was correct originally, with dedicated entry points, as 
all nr_pinned_* were used only after being assigned.


Basically, you could keep everything as it was and just do the 
substitution suggested in (1) and the patch would be as good.


Regards,

Martin


On 6.11.22 г. 17:47 ч., Dawei Li wrote:
> This patch includes changes below:
> 1) pin_user_pages() is unsafe without protection of mmap_lock,
>     fix it by calling mmap_read_lock() & mmap_read_unlock().
> 2) fix & refactor the incorrect exception handling procedure in
>     vmw_mksstat_add_ioctl().
>
> Fixes: 7a7a933edd6c ("drm/vmwgfx: Introduce VMware mks-guest-stats")
> Signed-off-by: Dawei Li <set_pte_at@outlook.com>
> ---
> v1:
> https://lore.kernel.org/all/TYCP286MB23235C9A9FCF85C045F95EA7CA4F9@TYCP286MB2323.JPNP286.PROD.OUTLOOK.COM/
>
> v1->v2:
> Rebased to latest vmwgfx/drm-misc-fixes
> ---
>   drivers/gpu/drm/vmwgfx/vmwgfx_msg.c | 23 ++++++++++++++---------
>   1 file changed, 14 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_msg.c b/drivers/gpu/drm/vmwgfx/vmwgfx_msg.c
> index 089046fa21be..ec40a3364e0a 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_msg.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_msg.c
> @@ -1020,9 +1020,9 @@ int vmw_mksstat_add_ioctl(struct drm_device *dev, void *data,
>   	const size_t num_pages_info = PFN_UP(arg->info_len);
>   	const size_t num_pages_strs = PFN_UP(arg->strs_len);
>   	long desc_len;
> -	long nr_pinned_stat;
> -	long nr_pinned_info;
> -	long nr_pinned_strs;
> +	long nr_pinned_stat = 0;
> +	long nr_pinned_info = 0;
> +	long nr_pinned_strs = 0;
>   	struct page *pages_stat[ARRAY_SIZE(pdesc->statPPNs)];
>   	struct page *pages_info[ARRAY_SIZE(pdesc->infoPPNs)];
>   	struct page *pages_strs[ARRAY_SIZE(pdesc->strsPPNs)];
> @@ -1084,28 +1084,33 @@ int vmw_mksstat_add_ioctl(struct drm_device *dev, void *data,
>   	reset_ppn_array(pdesc->infoPPNs, ARRAY_SIZE(pdesc->infoPPNs));
>   	reset_ppn_array(pdesc->strsPPNs, ARRAY_SIZE(pdesc->strsPPNs));
>   
> +	/* pin_user_pages() needs protection of mmap_lock */
> +	mmap_read_lock(current->mm);
> +
>   	/* Pin mksGuestStat user pages and store those in the instance descriptor */
>   	nr_pinned_stat = pin_user_pages(arg->stat, num_pages_stat, FOLL_LONGTERM, pages_stat, NULL);
>   	if (num_pages_stat != nr_pinned_stat)
> -		goto err_pin_stat;
> +		goto __err_pin_pages;
>   
>   	for (i = 0; i < num_pages_stat; ++i)
>   		pdesc->statPPNs[i] = page_to_pfn(pages_stat[i]);
>   
>   	nr_pinned_info = pin_user_pages(arg->info, num_pages_info, FOLL_LONGTERM, pages_info, NULL);
>   	if (num_pages_info != nr_pinned_info)
> -		goto err_pin_info;
> +		goto __err_pin_pages;
>   
>   	for (i = 0; i < num_pages_info; ++i)
>   		pdesc->infoPPNs[i] = page_to_pfn(pages_info[i]);
>   
>   	nr_pinned_strs = pin_user_pages(arg->strs, num_pages_strs, FOLL_LONGTERM, pages_strs, NULL);
>   	if (num_pages_strs != nr_pinned_strs)
> -		goto err_pin_strs;
> +		goto __err_pin_pages;
>   
>   	for (i = 0; i < num_pages_strs; ++i)
>   		pdesc->strsPPNs[i] = page_to_pfn(pages_strs[i]);
>   
> +	mmap_read_unlock(current->mm);
> +
>   	/* Send the descriptor to the host via a hypervisor call. The mksGuestStat
>   	   pages will remain in use until the user requests a matching remove stats
>   	   or a stats reset occurs. */
> @@ -1120,15 +1125,15 @@ int vmw_mksstat_add_ioctl(struct drm_device *dev, void *data,
>   
>   	return 0;
>   
> -err_pin_strs:
> +__err_pin_pages:
> +	mmap_read_unlock(current->mm);
> +
>   	if (nr_pinned_strs > 0)
>   		unpin_user_pages(pages_strs, nr_pinned_strs);
>   
> -err_pin_info:
>   	if (nr_pinned_info > 0)
>   		unpin_user_pages(pages_info, nr_pinned_info);
>   
> -err_pin_stat:
>   	if (nr_pinned_stat > 0)
>   		unpin_user_pages(pages_stat, nr_pinned_stat);
>   
