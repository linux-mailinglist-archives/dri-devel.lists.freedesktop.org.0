Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4737640EACE
	for <lists+dri-devel@lfdr.de>; Thu, 16 Sep 2021 21:29:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4326A6E83B;
	Thu, 16 Sep 2021 19:29:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6A846E858
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Sep 2021 19:28:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631820537;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FS75qvg/QGalPD7nT7v60HvIHwPw+UZ+LYto6G3gDGo=;
 b=WRxm9WZW9YXKCoAvLa5jCVCs52TQcZ4KU9xK9kAiiIN5eJXYTlPFKRhguxVMdBGXfMGHE4
 iuR0deUjwEMttoBTRcQg2dQjGTzDG8UuYTyjXMMT/NvzXX3YIojqTOCW0SXEEHJTT7hKC+
 lkUf++j+oh5jkQdFUupL1yM2zZ86Yb0=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-327-cT5St3MyMuOtvjwbmNmVXg-1; Thu, 16 Sep 2021 15:28:56 -0400
X-MC-Unique: cT5St3MyMuOtvjwbmNmVXg-1
Received: by mail-ed1-f71.google.com with SMTP id
 r7-20020aa7c147000000b003d1f18329dcso6572276edp.13
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Sep 2021 12:28:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=FS75qvg/QGalPD7nT7v60HvIHwPw+UZ+LYto6G3gDGo=;
 b=zHvhaonroyDvF3E2CNF0zeTDf4U+LzbYdHFPz7v5uHECOaNbFwh4zto3lVi09bXFwP
 MBePU7ny75fYWRHuStFFA4xjSYpnepImbsn1mn2aUiyc6tnVrS7RXt1ruM8Z3Qir1SJM
 mXilAeaaebyq/PLBRyOeNT4wIGZ4KC5XbD8ueWCeHXTNw6FW4+gDXOBJPQgpGlPJHUZq
 2A30Gv7oVE/uWC8tdxHe0PA7zEP1QFr752cEc+GmfigBeqApjzJBxgJfcaTQOWYRFaE+
 euGkDhEFupbByDLDLyBjNadApGcFLOfCzpSD98F4/EszYW5zE5cRuLJ+KrhUtn5LRtJ7
 oFWg==
X-Gm-Message-State: AOAM5318qrlqm6lLkHhYVZ8pts9nqumB3hbYT20+AZTtlEKq6Utz3LaJ
 q7cHVjioWGNhF6FTp08bcYn3AozAmrIk8jBALNefYQHXeEZuFDH5fSKl5wkFRh5CFp5eE9S4I8S
 vEcwcdhSp58kbQ/0BbHbMJS1xyxPp
X-Received: by 2002:a50:be8f:: with SMTP id b15mr8414149edk.200.1631820535547; 
 Thu, 16 Sep 2021 12:28:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJymHX5bRV0/tke6JXHg2Y4bqYtXuIZ73eH/jyIPwD4p+V7vHFhL3IQ9beEu/DNayIwW6S3o3w==
X-Received: by 2002:a50:be8f:: with SMTP id b15mr8414132edk.200.1631820535385; 
 Thu, 16 Sep 2021 12:28:55 -0700 (PDT)
Received: from x1.localdomain
 (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
 by smtp.gmail.com with ESMTPSA id dn28sm1761628edb.76.2021.09.16.12.28.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Sep 2021 12:28:55 -0700 (PDT)
Subject: Re: [PATCH 5/5] drm/vboxvideo: Use managed interfaces for framebuffer
 write combining
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@redhat.com,
 airlied@linux.ie, daniel@ffwll.ch, marcan@marcan.st, maz@kernel.org,
 akpm@linux-foundation.org, npiggin@gmail.com, thunder.leizhen@huawei.com,
 gregkh@linuxfoundation.org
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20210916181601.9146-1-tzimmermann@suse.de>
 <20210916181601.9146-6-tzimmermann@suse.de>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <353180c3-4184-4723-a8ae-a633931beec4@redhat.com>
Date: Thu, 16 Sep 2021 21:28:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210916181601.9146-6-tzimmermann@suse.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
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

Hi,

On 9/16/21 8:16 PM, Thomas Zimmermann wrote:
> Replace arch_phys_wc_add() with the rsp managed function. Allows for
> removing the cleanup code for memory management
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans


> ---
>  drivers/gpu/drm/vboxvideo/vbox_drv.c |  5 +----
>  drivers/gpu/drm/vboxvideo/vbox_drv.h |  1 -
>  drivers/gpu/drm/vboxvideo/vbox_ttm.c | 17 ++++++++---------
>  3 files changed, 9 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vboxvideo/vbox_drv.c b/drivers/gpu/drm/vboxvideo/vbox_drv.c
> index 2b81cb259d23..a6c81af37345 100644
> --- a/drivers/gpu/drm/vboxvideo/vbox_drv.c
> +++ b/drivers/gpu/drm/vboxvideo/vbox_drv.c
> @@ -69,7 +69,7 @@ static int vbox_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
>  
>  	ret = vbox_mode_init(vbox);
>  	if (ret)
> -		goto err_mm_fini;
> +		goto err_hw_fini;
>  
>  	ret = vbox_irq_init(vbox);
>  	if (ret)
> @@ -87,8 +87,6 @@ static int vbox_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
>  	vbox_irq_fini(vbox);
>  err_mode_fini:
>  	vbox_mode_fini(vbox);
> -err_mm_fini:
> -	vbox_mm_fini(vbox);
>  err_hw_fini:
>  	vbox_hw_fini(vbox);
>  	return ret;
> @@ -101,7 +99,6 @@ static void vbox_pci_remove(struct pci_dev *pdev)
>  	drm_dev_unregister(&vbox->ddev);
>  	vbox_irq_fini(vbox);
>  	vbox_mode_fini(vbox);
> -	vbox_mm_fini(vbox);
>  	vbox_hw_fini(vbox);
>  }
>  
> diff --git a/drivers/gpu/drm/vboxvideo/vbox_drv.h b/drivers/gpu/drm/vboxvideo/vbox_drv.h
> index 4903b91d7fe4..e77bd6512eb1 100644
> --- a/drivers/gpu/drm/vboxvideo/vbox_drv.h
> +++ b/drivers/gpu/drm/vboxvideo/vbox_drv.h
> @@ -139,7 +139,6 @@ void vbox_mode_fini(struct vbox_private *vbox);
>  void vbox_report_caps(struct vbox_private *vbox);
>  
>  int vbox_mm_init(struct vbox_private *vbox);
> -void vbox_mm_fini(struct vbox_private *vbox);
>  
>  /* vbox_irq.c */
>  int vbox_irq_init(struct vbox_private *vbox);
> diff --git a/drivers/gpu/drm/vboxvideo/vbox_ttm.c b/drivers/gpu/drm/vboxvideo/vbox_ttm.c
> index fd8a53a4d8d6..dc24c2172fd4 100644
> --- a/drivers/gpu/drm/vboxvideo/vbox_ttm.c
> +++ b/drivers/gpu/drm/vboxvideo/vbox_ttm.c
> @@ -13,22 +13,21 @@
>  int vbox_mm_init(struct vbox_private *vbox)
>  {
>  	int ret;
> +	resource_size_t base, size;
>  	struct drm_device *dev = &vbox->ddev;
>  	struct pci_dev *pdev = to_pci_dev(dev->dev);
>  
> -	ret = drmm_vram_helper_init(dev, pci_resource_start(pdev, 0),
> -				       vbox->available_vram_size);
> +	base = pci_resource_start(pdev, 0);
> +	size = pci_resource_len(pdev, 0);
> +
> +	/* Don't fail on errors, but performance might be reduced. */
> +	devm_arch_phys_wc_add(&pdev->dev, base, size);
> +
> +	ret = drmm_vram_helper_init(dev, base, vbox->available_vram_size);
>  	if (ret) {
>  		DRM_ERROR("Error initializing VRAM MM; %d\n", ret);
>  		return ret;
>  	}
>  
> -	vbox->fb_mtrr = arch_phys_wc_add(pci_resource_start(pdev, 0),
> -					 pci_resource_len(pdev, 0));
>  	return 0;
>  }
> -
> -void vbox_mm_fini(struct vbox_private *vbox)
> -{
> -	arch_phys_wc_del(vbox->fb_mtrr);
> -}
> 

