Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40D3F2EFF45
	for <lists+dri-devel@lfdr.de>; Sat,  9 Jan 2021 12:47:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6583B6E943;
	Sat,  9 Jan 2021 11:46:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from merlin.infradead.org (merlin.infradead.org
 [IPv6:2001:8b0:10b:1231::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEF696E888
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Jan 2021 18:24:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=GgFFJ4hcRk9+UAJsMT8sbchAV7zRGgy6uNsRiOf7ev0=; b=tm8GEkPuhSAhfIgHvojD5FSi/b
 xO3HyKT3HuqcBInQDvoayJy4QfgpiFZu2Ce71hqlz4pZSwSopPkcERYYcKHUtDH1Wc7E0xVB6RBqi
 jGyx9nmDcSw2agzMzI6f4ItpA4kKFoje0IzEEAchWv6zBL9s1famUqra3IhRC7BBMQUOAK9WUaMPK
 6qerhTy+zUvyNpjOcT6210M+bxy0R/SsecZGlutwxCl9/Agp5nJ9vzBz/ViDYNQH7Hl2eSwncf54Z
 wsfJOW7nMQEZcvllcR0KFXgf2IsnaB8jFLuQObrqgZ1phBfXRSN3/TIdzELDwJBRtfBsapfekyQn0
 kkaSycPQ==;
Received: from [2601:1c0:6280:3f0::79df]
 by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kxwQl-00055n-76; Fri, 08 Jan 2021 18:24:11 +0000
Subject: Re: [PATCH] drm/modes: add non-OF stub for of_get_drm_display_mode
To: Philipp Zabel <p.zabel@pengutronix.de>, dri-devel@lists.freedesktop.org
References: <20210108101343.23695-1-p.zabel@pengutronix.de>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <6bed2949-bf2d-d10c-0dec-58c4f86fae16@infradead.org>
Date: Fri, 8 Jan 2021 10:24:03 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20210108101343.23695-1-p.zabel@pengutronix.de>
Content-Language: en-US
X-Mailman-Approved-At: Sat, 09 Jan 2021 11:46:48 +0000
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 1/8/21 2:13 AM, Philipp Zabel wrote:
> If CONFIG_OF is disabled, of_get_drm_display_mode is not compiled in,
> and drivers using it fail to build:
> 
>   ld: drivers/gpu/drm/imx/parallel-display.o: in function `imx_pd_connector_get_modes':
>   parallel-display.c:(.text+0x8d): undefined reference to `of_get_drm_display_mode'
> 
> Add an inline stub so they can be build-tested with non-OF
> configurations.
> 
> Reported-by: Randy Dunlap <rdunlap@infradead.org>
> Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>

Acked-by: Randy Dunlap <rdunlap@infradead.org>

Thanks.

> ---
>  include/drm/drm_modes.h | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/include/drm/drm_modes.h b/include/drm/drm_modes.h
> index a0d79d1c51e2..29ba4adf0c53 100644
> --- a/include/drm/drm_modes.h
> +++ b/include/drm/drm_modes.h
> @@ -461,9 +461,19 @@ void drm_display_mode_from_videomode(const struct videomode *vm,
>  void drm_display_mode_to_videomode(const struct drm_display_mode *dmode,
>  				   struct videomode *vm);
>  void drm_bus_flags_from_videomode(const struct videomode *vm, u32 *bus_flags);
> +
> +#if defined(CONFIG_OF)
>  int of_get_drm_display_mode(struct device_node *np,
>  			    struct drm_display_mode *dmode, u32 *bus_flags,
>  			    int index);
> +#else
> +static inline int of_get_drm_display_mode(struct device_node *np,
> +					  struct drm_display_mode *dmode,
> +					  u32 *bus_flags, int index)
> +{
> +	return -EINVAL;
> +}
> +#endif
>  
>  void drm_mode_set_name(struct drm_display_mode *mode);
>  int drm_mode_vrefresh(const struct drm_display_mode *mode);
> 


-- 
~Randy

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
