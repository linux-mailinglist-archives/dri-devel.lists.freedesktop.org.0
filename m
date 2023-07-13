Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E625C751992
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jul 2023 09:13:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 527C710E60A;
	Thu, 13 Jul 2023 07:13:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DE2510E60A
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jul 2023 07:13:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1689232389;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XZElw/42Acwsqlv0sLLz3TB1mHO5lPitgxlxBFeqOyo=;
 b=Dvkoqry0woSpyVQ5SxUGJqPvurE6lCm8GyWDMbowPMX9zVFlM6KAcSHkUrl90FTzyoRkiV
 dvrlZTdahR/ZSoRb4rcf7jzFu5+bwzxre3gYyD7RCDWXafxdLaRe0MEm9qTcIWaMqNuwVe
 jC4QsdjGvtWo2BKpj0b3vkBOONUxbnM=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-187-u9TC9DxaPyS-PEyLyCoo8A-1; Thu, 13 Jul 2023 03:13:07 -0400
X-MC-Unique: u9TC9DxaPyS-PEyLyCoo8A-1
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-3fbffd088a9so1944135e9.1
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jul 2023 00:13:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689232387; x=1691824387;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=XZElw/42Acwsqlv0sLLz3TB1mHO5lPitgxlxBFeqOyo=;
 b=bcodAEQvP5wr/VAIOYoQY9OcTJwPhCSu/22e8UE4zwxBVEhY6GUBaREpwqiC9VSg+6
 vwwOuwCePfJzQWgzYU1IFW+GacNcDTHXiu+b7XDnov8Ib5C6gQRYgp5Jjz+MLYjprRf5
 o6LBVwEF6WRd9pQBRSUSxx0zKi5aeXIngys9PsdHzKewD8AXTPvon/3SX/nF2ar2Jbvh
 3fEPDikwoQDTHdTulWzY3bxYku1uWiGv4wCK0tBoUydnpYN1qlw8pFCiXTIf4T3VxOel
 VIy8j4eBqH6IUe+mgkyD5eskESrOHSgmlm2LgDJKx822qtgRcOAB46HfQUdeIUH8Yenb
 E5XQ==
X-Gm-Message-State: ABy/qLbSWvdW25K4X+y0vW8MxKNNQcm3TvYIzHQNH0M9APsQo0mSbFqG
 mSRm3NaV73J9playb+LvTCzMZW3iU5pmWJ2kaEusILgvBJqrUmQlfsy8Eo6Ul3gd/QLNjqFkRUY
 yOEK97hZ/IvrURwhST7H98tZjnIos
X-Received: by 2002:a05:600c:2993:b0:3f9:c82e:9d87 with SMTP id
 r19-20020a05600c299300b003f9c82e9d87mr746089wmd.13.1689232386900; 
 Thu, 13 Jul 2023 00:13:06 -0700 (PDT)
X-Google-Smtp-Source: APBJJlHn6HZ+OqLMM/xolipbV0WvjiU33wf8LOxnA/luQSBI68URlRzpu34l9TDZBkYvhCri96UYzQ==
X-Received: by 2002:a05:600c:2993:b0:3f9:c82e:9d87 with SMTP id
 r19-20020a05600c299300b003f9c82e9d87mr746069wmd.13.1689232386589; 
 Thu, 13 Jul 2023 00:13:06 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 v24-20020a05600c215800b003fa95f328afsm17397184wml.29.2023.07.13.00.13.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Jul 2023 00:13:06 -0700 (PDT)
Message-ID: <3a0ee192-f495-b78f-d68e-4974601a746f@redhat.com>
Date: Thu, 13 Jul 2023 09:13:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH] drm/ast: Do not enable PCI resources multiple times
To: Thomas Zimmermann <tzimmermann@suse.de>, suijingfeng@loongson.cn,
 airlied@gmail.com, airlied@redhat.com, daniel@ffwll.ch
References: <20230712130826.3318-1-tzimmermann@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20230712130826.3318-1-tzimmermann@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 12/07/2023 15:08, Thomas Zimmermann wrote:
> Remove ast_init_pci_config() as the ast driver already enables the PCI
> resources by calling pcim_enable_device().
> 
> Suggested-by: Sui Jingfeng <suijingfeng@loongson.cn>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   drivers/gpu/drm/ast/ast_main.c | 21 ---------------------
>   1 file changed, 21 deletions(-)
> 

looks good to me.
indeed pcim_enable_device() call pci_enable_resources() which set
PCI_COMMAND_MEMORY and PCI_COMMAND_IO flags.

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>


Best regards,

-- 

Jocelyn


> diff --git a/drivers/gpu/drm/ast/ast_main.c b/drivers/gpu/drm/ast/ast_main.c
> index 8bfbdfd86d77..dae365ed3969 100644
> --- a/drivers/gpu/drm/ast/ast_main.c
> +++ b/drivers/gpu/drm/ast/ast_main.c
> @@ -35,23 +35,6 @@
>   
>   #include "ast_drv.h"
>   
> -static int ast_init_pci_config(struct pci_dev *pdev)
> -{
> -	int err;
> -	u16 pcis04;
> -
> -	err = pci_read_config_word(pdev, PCI_COMMAND, &pcis04);
> -	if (err)
> -		goto out;
> -
> -	pcis04 |= PCI_COMMAND_MEMORY | PCI_COMMAND_IO;
> -
> -	err = pci_write_config_word(pdev, PCI_COMMAND, pcis04);
> -
> -out:
> -	return pcibios_err_to_errno(err);
> -}
> -
>   static bool ast_is_vga_enabled(struct drm_device *dev)
>   {
>   	struct ast_device *ast = to_ast_device(dev);
> @@ -483,10 +466,6 @@ struct ast_device *ast_device_create(const struct drm_driver *drv,
>   			return ERR_PTR(-EIO);
>   	}
>   
> -	ret = ast_init_pci_config(pdev);
> -	if (ret)
> -		return ERR_PTR(ret);
> -
>   	if (!ast_is_vga_enabled(dev)) {
>   		drm_info(dev, "VGA not enabled on entry, requesting chip POST\n");
>   		need_post = true;

