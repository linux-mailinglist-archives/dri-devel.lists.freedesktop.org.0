Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 094AA3D70A3
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jul 2021 09:54:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 186996E9D1;
	Tue, 27 Jul 2021 07:54:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3F8C6E9D1
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jul 2021 07:54:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627372468;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=msI4RjMytbP1n7F7yoVvayHHN7FThjzPJmiZOR0CDww=;
 b=HiioyW9V6mNgQmyq04TOLuK6VP7ciAjFusqxRaOJwMO7a4AzEev1cVj7scPOA74AS07e6z
 OJVCJj30tt1bB99HOsPBUgVtvvCF7YW8a41E9P/llhxeFIS4t3kuow2iq7NfvUZpLPOMYo
 GqKIfzcSe5Az0lYScURYQY3aSNFlHxI=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-247-VwyCXeFhN-Oj-L1YhGbBpg-1; Tue, 27 Jul 2021 03:54:27 -0400
X-MC-Unique: VwyCXeFhN-Oj-L1YhGbBpg-1
Received: by mail-wm1-f69.google.com with SMTP id
 n7-20020a05600c3b87b029024e59a633baso1022460wms.5
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jul 2021 00:54:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=msI4RjMytbP1n7F7yoVvayHHN7FThjzPJmiZOR0CDww=;
 b=SVvfomRQldbnOddV3SRkiqeGZwjVUNb7Ai3iaWUaw66RRi8bwyZ1IjmVTIYFvbR9Ur
 akFzUfJvxFe7jhxS897cflnRXhHmuGdDwqa3WxQQ2N33UHB2Mrmje7rU/1Zz8HzIya9y
 N5mou3cip0Z8hRgTfLwlFX5MmHliWgFpUdCPVA8U66WrhluYsvfM9oZNQ/bzr1d4Zq42
 LFo8LwVQPR7R2+5jRNQxjufB0oEWsP7xgNHCvSzJPaSfaAA/RhXKX0D22mqQ8kvcNjoP
 P6DvRv64PZ7bRhYOosZyzGNiTiwTUHzYTFJdTlGg1og1doSGllAe9hAOjuzCnojaXSRN
 zc1Q==
X-Gm-Message-State: AOAM5330U94oIQiXUqjQ6tKd+QZIso1vSIio4uefA/EVCLeYSfcoLjtr
 KGSiYA0j7wUMQLVkKfjHoj0mCxkqItn/3f+MxiOv2ywrFBLm/kLplfhpYiFNj9rOZtD0daibe/G
 1UpmivSjU+UYUOL8sNDysdWmd26i/
X-Received: by 2002:a1c:cc05:: with SMTP id h5mr2750550wmb.5.1627372465942;
 Tue, 27 Jul 2021 00:54:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxs3kNtwhKpPWdmwpsLv1on90CJ6AInc7UOF2HuXnQYNpNtZo7URlKNGEOuIDGFM2r1G3RPMg==
X-Received: by 2002:a1c:cc05:: with SMTP id h5mr2750536wmb.5.1627372465738;
 Tue, 27 Jul 2021 00:54:25 -0700 (PDT)
Received: from [192.168.1.101] ([92.176.231.106])
 by smtp.gmail.com with ESMTPSA id p22sm1716714wmq.44.2021.07.27.00.54.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Jul 2021 00:54:25 -0700 (PDT)
Subject: Re: [PATCH] efi: sysfb_efi: fix build when EFI is not set
To: Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org
References: <20210727050447.7339-1-rdunlap@infradead.org>
From: Javier Martinez Canillas <javierm@redhat.com>
Message-ID: <9aa81fd9-359d-fc30-2969-50b8c7677f9f@redhat.com>
Date: Tue, 27 Jul 2021 09:54:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210727050447.7339-1-rdunlap@infradead.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
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
Cc: linux-efi@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Mark Brown <broonie@kernel.org>, linux-next@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Ard Biesheuvel <ardb@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 7/27/21 7:04 AM, Randy Dunlap wrote:
> When # CONFIG_EFI is not set, there are 2 definitions of
> sysfb_apply_efi_quirks(). The stub from sysfb.h should be used
> and the __init function from sysfb_efi.c should not be used.
> 
> ../drivers/firmware/efi/sysfb_efi.c:337:13: error: redefinition of ‘sysfb_apply_efi_quirks’
>  __init void sysfb_apply_efi_quirks(struct platform_device *pd)
>              ^~~~~~~~~~~~~~~~~~~~~~
> In file included from ../drivers/firmware/efi/sysfb_efi.c:26:0:
> ../include/linux/sysfb.h:65:20: note: previous definition of ‘sysfb_apply_efi_quirks’ was here
>  static inline void sysfb_apply_efi_quirks(struct platform_device *pd)
>                     ^~~~~~~~~~~~~~~~~~~~~~
> 
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Ard Biesheuvel <ardb@kernel.org>
> Cc: linux-efi@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: Javier Martinez Canillas <javierm@redhat.com>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Mark Brown <broonie@kernel.org>
> Cc: linux-next@vger.kernel.org
> ---
>  drivers/firmware/efi/sysfb_efi.c |    2 ++
>  1 file changed, 2 insertions(+)
> 
> --- linext-20210726.orig/drivers/firmware/efi/sysfb_efi.c
> +++ linext-20210726/drivers/firmware/efi/sysfb_efi.c
> @@ -332,6 +332,7 @@ static const struct fwnode_operations ef
>  	.add_links = efifb_add_links,
>  };
>  
> +#ifdef CONFIG_EFI
>  static struct fwnode_handle efifb_fwnode;
>  
>  __init void sysfb_apply_efi_quirks(struct platform_device *pd)
> @@ -354,3 +355,4 @@ __init void sysfb_apply_efi_quirks(struc
>  		pd->dev.fwnode = &efifb_fwnode;
>  	}
>  }
> +#endif
> 

Thanks for the patch.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

Best regards,
-- 
Javier Martinez Canillas
Linux Engineering
Red Hat

