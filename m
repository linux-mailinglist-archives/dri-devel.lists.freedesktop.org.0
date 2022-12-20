Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BD84651D69
	for <lists+dri-devel@lfdr.de>; Tue, 20 Dec 2022 10:33:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EF78891D9;
	Tue, 20 Dec 2022 09:33:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D301891D9
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Dec 2022 09:32:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671528777;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AzV1868qdOe1XrhL7OcqYIS/A7VjHb9o4AzfKTps9Yw=;
 b=CtrWn1OBODksqJrqL5e28n92WBrWJgbQroZm+2OnvYzRTyqv2zJddboX1veEo5VZD2MoV4
 abHGd0iBIFHoqD1z2BE/7adjmFwcFPeatt43Zl55gMvhM53eDL2imJABdK2xNLJNdc/d2W
 iuOA6yJTSPakBYf2PURB63bEBWQnvSQ=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-124-m8aOdgLvNbWQdYXzUEs9Ig-1; Tue, 20 Dec 2022 04:32:56 -0500
X-MC-Unique: m8aOdgLvNbWQdYXzUEs9Ig-1
Received: by mail-wr1-f69.google.com with SMTP id
 h10-20020adfaa8a000000b0024208cf285eso2104649wrc.22
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Dec 2022 01:32:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=AzV1868qdOe1XrhL7OcqYIS/A7VjHb9o4AzfKTps9Yw=;
 b=miGbGks6fXZUe5n5MnoHc3I7UJMK3BtXkl3H7huFRtzLKJWJFbPlwvZn971GbaOP1J
 kzbNBwna4cxdFzFFnV8gIW5tIOItUMfEvkGZcPMZoCjVwXaXcw4693qZKecE4erFPN8v
 bcv7qIfdLz/1tyN6A9KKzFLZoYRw0v0uwXVzhlZGCOz9XiCi8OmxPdgvoBBKCoXjoLNt
 noggzE0Z1R/0VGxs0/oiyuXV5e0Ze3tFRof1qwiYex2BUTkzPGEOrwVuFcGz5a8F6V3Q
 tcIehzx6fJLvrtnH0KquQhHltbrH2E59fr8/4g186lwHeezc8fr8nXVsRghw9RZjOYEj
 fiOg==
X-Gm-Message-State: AFqh2kr35C3+v6nb235IZQBWzZPX1zWHSbMs5qMae7IahoR5Jt3h0zXW
 dPnPps7a6aJRk+j9XwQ4zJ2s355cnRcVz9MA/4wZL8CoNWtBOCmjoD75JU9+EnbTaDMTR4bRpTN
 NxRuOpZ8eTUCJByqqMeQAv79yXT6a
X-Received: by 2002:a05:600c:a4d:b0:3cf:6e78:e2ca with SMTP id
 c13-20020a05600c0a4d00b003cf6e78e2camr1014182wmq.5.1671528775021; 
 Tue, 20 Dec 2022 01:32:55 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtkJLPUngoE7Rdpiz+7rMSQUZVxCPiiE7/wiftR1AcmdksgPntUPs9xb4hKM0A1bxh9x31lEA==
X-Received: by 2002:a05:600c:a4d:b0:3cf:6e78:e2ca with SMTP id
 c13-20020a05600c0a4d00b003cf6e78e2camr1014168wmq.5.1671528774842; 
 Tue, 20 Dec 2022 01:32:54 -0800 (PST)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 o13-20020a05600c510d00b003c6f8d30e40sm25405979wms.31.2022.12.20.01.32.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Dec 2022 01:32:54 -0800 (PST)
Message-ID: <12990f75-6b72-7ed7-0593-1c542d71f0f0@redhat.com>
Date: Tue, 20 Dec 2022 10:32:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH 09/18] vfio-mdev/mdpy-fb: Do not set struct
 fb_info.apertures
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@gmail.com, deller@gmx.de
References: <20221219160516.23436-1-tzimmermann@suse.de>
 <20221219160516.23436-10-tzimmermann@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20221219160516.23436-10-tzimmermann@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
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
Cc: linux-fbdev@vger.kernel.org, kvm@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, linux-hyperv@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, Kirti Wankhede <kwankhede@nvidia.com>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

[adding Kirti Wankhede and kvm@vger.kernel.org to Cc list]

On 12/19/22 17:05, Thomas Zimmermann wrote:
> Generic fbdev drivers use the apertures field in struct fb_info to
> control ownership of the framebuffer memory and graphics device. Do
> not set the values in mdpy-fb.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  samples/vfio-mdev/mdpy-fb.c | 8 --------
>  1 file changed, 8 deletions(-)
> 
> diff --git a/samples/vfio-mdev/mdpy-fb.c b/samples/vfio-mdev/mdpy-fb.c
> index 9ec93d90e8a5..1de5801cd2e8 100644
> --- a/samples/vfio-mdev/mdpy-fb.c
> +++ b/samples/vfio-mdev/mdpy-fb.c
> @@ -161,14 +161,6 @@ static int mdpy_fb_probe(struct pci_dev *pdev,
>  		goto err_release_fb;
>  	}
>  
> -	info->apertures = alloc_apertures(1);
> -	if (!info->apertures) {
> -		ret = -ENOMEM;
> -		goto err_unmap;
> -	}
> -	info->apertures->ranges[0].base = info->fix.smem_start;
> -	info->apertures->ranges[0].size = info->fix.smem_len;
> -
>  	info->fbops = &mdpy_fb_ops;
>  	info->flags = FBINFO_DEFAULT;
>  	info->pseudo_palette = par->palette;
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

But I think an ack from Kirti Wankhede or other virt folk is needed if you
want to merge this through drm-misc-next.

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

