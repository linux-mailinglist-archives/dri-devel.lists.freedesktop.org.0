Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 24105C83DDA
	for <lists+dri-devel@lfdr.de>; Tue, 25 Nov 2025 09:03:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DDE810E35F;
	Tue, 25 Nov 2025 08:03:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.b="Q7o+RqRV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6767A10E1F2
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Nov 2025 09:30:25 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-477a219db05so24054485e9.2
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Nov 2025 01:30:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1763976624; x=1764581424; darn=lists.freedesktop.org; 
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:date:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=S3aytJ2sZxSRYrfcuOc3im2xCWGoA/zkjwdoYJLrsf8=;
 b=Q7o+RqRVJqbPlVlQLpTX/M9pgyHgsV1cJliLJcpEleHeDHXyaGw3KA3omyGNysADeI
 S9QSTlLRS0uxBFYvm2d+vHfwfccRA+8Bd28knP1EDu+kQNuv4Qkg1ju05F0mVaOPL6DH
 pKXgbCGyBMJVH5yXx7U4yQW09C3zUk2I2eFn3RO7Hwi+uxZdh4JkeGUdbA+ZdcF/p7Rt
 0LFqPHRRyFHu9rD5pGbqULRw3qPirNvFtticzm3La3L3WzDXGiz/sXkRyKdJ7RkokCmt
 77INieCIfhfKbzcxduwRolsJchVn0fmpBSBVyP6FbOh9gv4aJCWME30Xg/gcJ8OAonVZ
 84tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763976624; x=1764581424;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:date:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=S3aytJ2sZxSRYrfcuOc3im2xCWGoA/zkjwdoYJLrsf8=;
 b=ueXFq+4zwNKb3qe4ILFy8Y1XIKF5Obu7nMy21GbRfy5BaijMg7gu4XLVpXzhzrnTjV
 RcjLzwVZrj8yiOqimCCSEdD/wf7nES8ED5neoeOMPA4kZUU9B48QGDzDLxIbb/c+kdEF
 doZdPMK7Ku4wFmw0U+54TjBkhsLgyNG3SiA85nSUQohNwZoT2ocv5Bv6Ky/2VWNwwQut
 15GZNFWvxXSFA+3tYYTXuisObai0fIwGuaJsIoBYyg7DHDnrhv7CgrlRSyJRDeTK3sDC
 HdaQitg/SE3xhaDjl1bhxQgBpdhgV/6pwUTa0Q3aS8BuVVqdLjk5hUl716f8IB3pMWOp
 NUiA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXRAgcScZC4cRlRVMVGIdAHSZsIIZ815y/nkRwJB6hfRCrQVTLAkPouOvpkJJXzSLLVOFKQ0l1kGKY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxP4xSH4mw1agTpDdXCBjbuMEj20o1v92Z8Mqs3emNHYufFp534
 XC8E3CsOPvvUTMROjM7u32VtVHYZTcKbl3yt47dQ/5amJ2xuoyozMcQ+0BaPzuaAnmw=
X-Gm-Gg: ASbGncuQB2pBD8RuE2NRE7DmlefUAS8ndKgkL1VYqrytjpN6dbpWPutS0Ki0og2po9l
 nEESI7fBZvPUMgeGIB7lovCfslrgnB/0UlsSrhr6o8Xm5OVeo2Poem1RChJDPZrFoyaap1jkkcb
 6Ph0rV90xVlETU/D66gu5E3Zu168UqNOxtoG4zuJDeJxOMcG4E8k7AsT3jlRnYIMra2p1DNVXsT
 yRiK5RNQrTPq6QWb2p2UnRJCHebSP2WxywlRv5/awpKQuuQArSXrUOSpM6m4ja8VvqPRr5nhjJ4
 VLSkmtx+mrA3zLWTCk04EWq8aZ2figKJ9g8EP+aY1bE1ynb3CiAYrbxszlLrzSHqmeuaj5lDyiL
 b/5DXO7JaE2T565AjsPFlcIhhyNzPmGeQ8IPTvBxXq31cMALywNArLV5GxkCDE9ZEz16EmfdlKu
 k65ftgT92GO40rm42HKSoSgwcgLfM50uoATlYVbGxApOsaGhPvQwA=
X-Google-Smtp-Source: AGHT+IGVswGY/a4pp84AoicemWlC3EeMp/CJWZpQbwJ08GptGBtnpFm9nq439AWBsTFVAzH/O3MyVA==
X-Received: by 2002:a05:600c:4591:b0:477:7925:f7f3 with SMTP id
 5b1f17b1804b1-477c10e1cacmr102371425e9.14.1763976623630; 
 Mon, 24 Nov 2025 01:30:23 -0800 (PST)
Received: from r1chard (220-129-146-231.dynamic-ip.hinet.net.
 [220.129.146.231]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7c3ed470ff6sm13929073b3a.19.2025.11.24.01.30.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Nov 2025 01:30:23 -0800 (PST)
From: Richard Lyu <richard.lyu@suse.com>
X-Google-Original-From: Richard Lyu <r1chard@r1chard>
Date: Mon, 24 Nov 2025 17:30:17 +0800
To: Thomas Zimmermann <tzimmermann@suse.de>, ardb@kernel.org,
 javierm@redhat.com, arnd@arndb.de
Cc: x86@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-efi@vger.kernel.org,
 loongarch@lists.linux.dev, linux-riscv@lists.infradead.org,
 dri-devel@lists.freedesktop.org, linux-hyperv@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-fbdev@vger.kernel.org
Subject: Re: [PATCH 2/6] efi: sysfb_efi: Reduce number of references to
 global screen_info
Message-ID: <aSQlqZPTAXHvTnrG@r1chard>
References: <20251121135624.494768-1-tzimmermann@suse.de>
 <20251121135624.494768-3-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251121135624.494768-3-tzimmermann@suse.de>
User-Agent: Mutt/2.2.13 (2024-03-09)
X-Mailman-Approved-At: Tue, 25 Nov 2025 08:03:45 +0000
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

Reviewed-by: Richard Lyu <richard.lyu@suse.com>

On 2025/11/21 14:36, Thomas Zimmermann wrote:
> Replace usage of global screen_info with local pointers. This will
> later reduce churn when screen_info is being moved.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/firmware/efi/sysfb_efi.c  | 81 ++++++++++++++++---------------
>  drivers/firmware/sysfb.c          |  4 +-
>  drivers/firmware/sysfb_simplefb.c |  2 +-
>  include/linux/sysfb.h             |  9 ++--
>  4 files changed, 51 insertions(+), 45 deletions(-)
> 
> diff --git a/drivers/firmware/efi/sysfb_efi.c b/drivers/firmware/efi/sysfb_efi.c
> index 1e509595ac03..8e0f9d08397f 100644
> --- a/drivers/firmware/efi/sysfb_efi.c
> +++ b/drivers/firmware/efi/sysfb_efi.c
> @@ -92,7 +92,7 @@ void efifb_setup_from_dmi(struct screen_info *si, const char *opt)
>  	})
>  
>  #ifdef CONFIG_EFI
> -static int __init efifb_set_system(const struct dmi_system_id *id)
> +static int __init efifb_set_system(struct screen_info *si, const struct dmi_system_id *id)
>  {
>  	struct efifb_dmi_info *info = id->driver_data;
>  
> @@ -101,14 +101,14 @@ static int __init efifb_set_system(const struct dmi_system_id *id)
>  		return 0;
>  
>  	/* Trust the bootloader over the DMI tables */
> -	if (screen_info.lfb_base == 0) {
> +	if (si->lfb_base == 0) {
>  #if defined(CONFIG_PCI)
>  		struct pci_dev *dev = NULL;
>  		int found_bar = 0;
>  #endif
>  		if (info->base) {
> -			screen_info.lfb_base = choose_value(info->base,
> -				screen_info.lfb_base, OVERRIDE_BASE,
> +			si->lfb_base = choose_value(info->base,
> +				si->lfb_base, OVERRIDE_BASE,
>  				info->flags);
>  
>  #if defined(CONFIG_PCI)
> @@ -135,49 +135,53 @@ static int __init efifb_set_system(const struct dmi_system_id *id)
>  
>  					start = pci_resource_start(dev, i);
>  					end = pci_resource_end(dev, i);
> -					if (screen_info.lfb_base >= start &&
> -					    screen_info.lfb_base < end) {
> +					if (si->lfb_base >= start && si->lfb_base < end) {
>  						found_bar = 1;
>  						break;
>  					}
>  				}
>  			}
>  			if (!found_bar)
> -				screen_info.lfb_base = 0;
> +				si->lfb_base = 0;
>  #endif
>  		}
>  	}
> -	if (screen_info.lfb_base) {
> -		screen_info.lfb_linelength = choose_value(info->stride,
> -			screen_info.lfb_linelength, OVERRIDE_STRIDE,
> +	if (si->lfb_base) {
> +		si->lfb_linelength = choose_value(info->stride,
> +			si->lfb_linelength, OVERRIDE_STRIDE,
>  			info->flags);
> -		screen_info.lfb_width = choose_value(info->width,
> -			screen_info.lfb_width, OVERRIDE_WIDTH,
> +		si->lfb_width = choose_value(info->width,
> +			si->lfb_width, OVERRIDE_WIDTH,
>  			info->flags);
> -		screen_info.lfb_height = choose_value(info->height,
> -			screen_info.lfb_height, OVERRIDE_HEIGHT,
> +		si->lfb_height = choose_value(info->height,
> +			si->lfb_height, OVERRIDE_HEIGHT,
>  			info->flags);
> -		if (screen_info.orig_video_isVGA == 0)
> -			screen_info.orig_video_isVGA = VIDEO_TYPE_EFI;
> +		if (si->orig_video_isVGA == 0)
> +			si->orig_video_isVGA = VIDEO_TYPE_EFI;
>  	} else {
> -		screen_info.lfb_linelength = 0;
> -		screen_info.lfb_width = 0;
> -		screen_info.lfb_height = 0;
> -		screen_info.orig_video_isVGA = 0;
> +		si->lfb_linelength = 0;
> +		si->lfb_width = 0;
> +		si->lfb_height = 0;
> +		si->orig_video_isVGA = 0;
>  		return 0;
>  	}
>  
>  	printk(KERN_INFO "efifb: dmi detected %s - framebuffer at 0x%08x "
>  			 "(%dx%d, stride %d)\n", id->ident,
> -			 screen_info.lfb_base, screen_info.lfb_width,
> -			 screen_info.lfb_height, screen_info.lfb_linelength);
> +			 si->lfb_base, si->lfb_width,
> +			 si->lfb_height, si->lfb_linelength);
>  
>  	return 1;
>  }
>  
> +static int __init efifb_set_system_callback(const struct dmi_system_id *id)
> +{
> +	return efifb_set_system(&screen_info, id);
> +}
> +
>  #define EFIFB_DMI_SYSTEM_ID(vendor, name, enumid)		\
>  	{							\
> -		efifb_set_system,				\
> +		efifb_set_system_callback,			\
>  		name,						\
>  		{						\
>  			DMI_MATCH(DMI_BIOS_VENDOR, vendor),	\
> @@ -284,12 +288,13 @@ static const struct dmi_system_id efifb_dmi_swap_width_height[] __initconst = {
>  	{},
>  };
>  
> -static bool efifb_overlaps_pci_range(const struct of_pci_range *range)
> +static bool efifb_overlaps_pci_range(const struct screen_info *si,
> +				     const struct of_pci_range *range)
>  {
> -	u64 fb_base = screen_info.lfb_base;
> +	u64 fb_base = si->lfb_base;
>  
> -	if (screen_info.capabilities & VIDEO_CAPABILITY_64BIT_BASE)
> -		fb_base |= (u64)(unsigned long)screen_info.ext_lfb_base << 32;
> +	if (si->capabilities & VIDEO_CAPABILITY_64BIT_BASE)
> +		fb_base |= (u64)(unsigned long)si->ext_lfb_base << 32;
>  
>  	return fb_base >= range->cpu_addr &&
>  	       fb_base < (range->cpu_addr + range->size);
> @@ -311,7 +316,7 @@ static struct device_node *find_pci_overlap_node(void)
>  		}
>  
>  		for_each_of_pci_range(&parser, &range)
> -			if (efifb_overlaps_pci_range(&range))
> +			if (efifb_overlaps_pci_range(&screen_info, &range))
>  				return np;
>  	}
>  	return NULL;
> @@ -349,25 +354,25 @@ static const struct fwnode_operations efifb_fwnode_ops = {
>  
>  static struct fwnode_handle efifb_fwnode;
>  
> -__init void sysfb_apply_efi_quirks(void)
> +__init void sysfb_apply_efi_quirks(struct screen_info *si)
>  {
> -	if (screen_info.orig_video_isVGA != VIDEO_TYPE_EFI ||
> -	    !(screen_info.capabilities & VIDEO_CAPABILITY_SKIP_QUIRKS))
> +	if (si->orig_video_isVGA != VIDEO_TYPE_EFI ||
> +	    !(si->capabilities & VIDEO_CAPABILITY_SKIP_QUIRKS))
>  		dmi_check_system(efifb_dmi_system_table);
>  
> -	if (screen_info.orig_video_isVGA == VIDEO_TYPE_EFI &&
> +	if (si->orig_video_isVGA == VIDEO_TYPE_EFI &&
>  	    dmi_check_system(efifb_dmi_swap_width_height)) {
> -		u16 temp = screen_info.lfb_width;
> +		u16 temp = si->lfb_width;
>  
> -		screen_info.lfb_width = screen_info.lfb_height;
> -		screen_info.lfb_height = temp;
> -		screen_info.lfb_linelength = 4 * screen_info.lfb_width;
> +		si->lfb_width = si->lfb_height;
> +		si->lfb_height = temp;
> +		si->lfb_linelength = 4 * si->lfb_width;
>  	}
>  }
>  
> -__init void sysfb_set_efifb_fwnode(struct platform_device *pd)
> +__init void sysfb_set_efifb_fwnode(const struct screen_info *si, struct platform_device *pd)
>  {
> -	if (screen_info.orig_video_isVGA == VIDEO_TYPE_EFI && IS_ENABLED(CONFIG_PCI)) {
> +	if (si->orig_video_isVGA == VIDEO_TYPE_EFI && IS_ENABLED(CONFIG_PCI)) {
>  		fwnode_init(&efifb_fwnode, &efifb_fwnode_ops);
>  		pd->dev.fwnode = &efifb_fwnode;
>  	}
> diff --git a/drivers/firmware/sysfb.c b/drivers/firmware/sysfb.c
> index 889e5b05c739..916b28538a29 100644
> --- a/drivers/firmware/sysfb.c
> +++ b/drivers/firmware/sysfb.c
> @@ -155,7 +155,7 @@ static __init int sysfb_init(void)
>  	if (disabled)
>  		goto unlock_mutex;
>  
> -	sysfb_apply_efi_quirks();
> +	sysfb_apply_efi_quirks(si);
>  
>  	parent = sysfb_parent_dev(si);
>  	if (IS_ERR(parent)) {
> @@ -200,7 +200,7 @@ static __init int sysfb_init(void)
>  
>  	pd->dev.parent = parent;
>  
> -	sysfb_set_efifb_fwnode(pd);
> +	sysfb_set_efifb_fwnode(si, pd);
>  
>  	ret = platform_device_add_data(pd, si, sizeof(*si));
>  	if (ret)
> diff --git a/drivers/firmware/sysfb_simplefb.c b/drivers/firmware/sysfb_simplefb.c
> index 592d8a644619..71f542e37732 100644
> --- a/drivers/firmware/sysfb_simplefb.c
> +++ b/drivers/firmware/sysfb_simplefb.c
> @@ -117,7 +117,7 @@ __init struct platform_device *sysfb_create_simplefb(const struct screen_info *s
>  
>  	pd->dev.parent = parent;
>  
> -	sysfb_set_efifb_fwnode(pd);
> +	sysfb_set_efifb_fwnode(si, pd);
>  
>  	ret = platform_device_add_resources(pd, &res, 1);
>  	if (ret)
> diff --git a/include/linux/sysfb.h b/include/linux/sysfb.h
> index b449665c686a..8527a50a5290 100644
> --- a/include/linux/sysfb.h
> +++ b/include/linux/sysfb.h
> @@ -82,16 +82,17 @@ static inline bool sysfb_handles_screen_info(void)
>  #ifdef CONFIG_EFI
>  
>  extern struct efifb_dmi_info efifb_dmi_list[];
> -void sysfb_apply_efi_quirks(void);
> -void sysfb_set_efifb_fwnode(struct platform_device *pd);
> +void sysfb_apply_efi_quirks(struct screen_info *si);
> +void sysfb_set_efifb_fwnode(const struct screen_info *si, struct platform_device *pd);
>  
>  #else /* CONFIG_EFI */
>  
> -static inline void sysfb_apply_efi_quirks(void)
> +static inline void sysfb_apply_efi_quirks(struct screen_info *si)
>  {
>  }
>  
> -static inline void sysfb_set_efifb_fwnode(struct platform_device *pd)
> +static inline void sysfb_set_efifb_fwnode(const struct screen_info *si,
> +					  struct platform_device *pd)
>  {
>  }
>  
> -- 
> 2.51.1
> 
> 
