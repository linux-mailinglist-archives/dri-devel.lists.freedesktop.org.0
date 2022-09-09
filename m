Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 143445B3A48
	for <lists+dri-devel@lfdr.de>; Fri,  9 Sep 2022 16:01:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C91010ED86;
	Fri,  9 Sep 2022 14:01:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A927A10ED87
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Sep 2022 14:01:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662732104;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=mmurUuPfY4CSsGXMopu3kXzx5e5l7+stCxGfg5MZbeg=;
 b=Qya1dqFhaXftSX9jPgMaT6h62sM8PghiUyXLcYLX/MEIaZbXHO6TCEQzFTqUNpfR11CTR2
 Dg878xp3lSup0173QrlJfiSyYtnXNnYeI1eftN8/d5QS80Eiuk0a5nEpXW/whuW96+joFz
 E6BA+bfwWjaR2trdkL6yv9dTgFOQ7R8=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-376-LB0zMJCKPwyWRINWS8MfHg-1; Fri, 09 Sep 2022 10:01:42 -0400
X-MC-Unique: LB0zMJCKPwyWRINWS8MfHg-1
Received: by mail-ej1-f69.google.com with SMTP id
 gn30-20020a1709070d1e00b0074144af99d1so1075182ejc.17
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Sep 2022 07:01:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date;
 bh=mmurUuPfY4CSsGXMopu3kXzx5e5l7+stCxGfg5MZbeg=;
 b=A4wDiPjjEBFdw9lcBGDvYJ+z1t+Tf/Cw3a7MXdq76g6q14jTjHHRKxKA3AfdqjXRK5
 EURR5WkHi7k33qTLV2XH5Utw1Ua6AcNdV33nT1vX44k9//w7UysYFm0gksKYat/Ml4ZS
 AGoX1qn9ZZFkDHYqiZ85sDh6g7v1DjACuEeF9FKCoIP6UlQg7GDuQEApfgw+ocJtZyA6
 I1mOX9tHERe0JMncY7hl/Bx2SfYxunMJCLJxNlWOeuN30wBO/62OpMtG3lmeXQy5MRm3
 oxp31XMvFZ4QAbpq7On8AbzZzS5V9BnCyQg15uLB7gNLd3Ibwq3tnw/6nAXUGfyK6DNm
 pDMA==
X-Gm-Message-State: ACgBeo007y/GdPznxVBJdzOUQLAwd0XupMNIivBtS9YtXKeBJHGM9u37
 ifEpSJ9Wb5VCHedw6mXOgDXL6ywfIIF/OKJXF0l6VEd0spABo9tn+tFBXGrHksm0lnXk5xEMOtF
 uDRe/Ujyiy3rLyEFy8nt88V+TGiwo
X-Received: by 2002:a17:906:846b:b0:770:82e5:1519 with SMTP id
 hx11-20020a170906846b00b0077082e51519mr9690592ejc.221.1662732100552; 
 Fri, 09 Sep 2022 07:01:40 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5cRBPXdEZPFZlONtBxXbkVKluQAB+eqr/N7QwxhdMBwFCwN/QJRPkdLZUifQ+2NbWPIwNn1Q==
X-Received: by 2002:a17:906:846b:b0:770:82e5:1519 with SMTP id
 hx11-20020a170906846b00b0077082e51519mr9690572ejc.221.1662732100345; 
 Fri, 09 Sep 2022 07:01:40 -0700 (PDT)
Received: from fedora (nat-2.ign.cz. [91.219.240.2])
 by smtp.gmail.com with ESMTPSA id
 f4-20020a17090631c400b0073d6093ac93sm353806ejf.16.2022.09.09.07.01.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Sep 2022 07:01:39 -0700 (PDT)
From: Vitaly Kuznetsov <vkuznets@redhat.com>
To: eahariha@linux.microsoft.com
Subject: Re: [PATCH 2/3] pci_ids: Add Microsoft PCI Vendor ID, and remove
 redundant definitions
In-Reply-To: <1662674757-31945-2-git-send-email-eahariha@linux.microsoft.com>
References: <1662674757-31945-1-git-send-email-eahariha@linux.microsoft.com>
 <1662674757-31945-2-git-send-email-eahariha@linux.microsoft.com>
Date: Fri, 09 Sep 2022 16:01:37 +0200
Message-ID: <87leqsr6im.fsf@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
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
Cc: "open list:DRM DRIVER FOR HYPERV SYNTHETIC VIDEO
 DEVICE" <linux-hyperv@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 "open list:PCI SUBSYSTEM" <linux-pci@vger.kernel.org>,
 Colin Ian King <colin.i.king@googlemail.com>,
 "open list:FRAMEBUFFER LAYER" <linux-fbdev@vger.kernel.org>,
 "open list:DRM DRIVER FOR HYPERV
 SYNTHETIC VIDEO DEVICE" <dri-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>, Eric Dumazet <edumazet@google.com>,
 "K. Y. Srinivasan" <kys@microsoft.com>, Wei Liu <wei.liu@kernel.org>,
 Stephen Hemminger <sthemmin@microsoft.com>, Helge Deller <deller@gmx.de>,
 Dexuan Cui <decui@microsoft.com>, Deepak Rawat <drawat.floss@gmail.com>,
 Easwar Hariharan <easwar.hariharan@microsoft.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Haiyang Zhang <haiyangz@microsoft.com>, Bjorn Helgaas <bhelgaas@google.com>,
 "open list:NETWORKING DRIVERS" <netdev@vger.kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 "David S. Miller" <davem@davemloft.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

eahariha@linux.microsoft.com writes:

> From: Easwar Hariharan <easwar.hariharan@microsoft.com>
>
> Move the Microsoft PCI Vendor ID from the various drivers to the pci_ids
> file
>
> Signed-off-by: Easwar Hariharan <easwar.hariharan@microsoft.com>
> ---
>  drivers/gpu/drm/hyperv/hyperv_drm_drv.c         | 1 -
>  drivers/net/ethernet/microsoft/mana/gdma_main.c | 4 ----
>  drivers/video/fbdev/hyperv_fb.c                 | 3 ---
>  include/linux/pci_ids.h                         | 2 ++
>  4 files changed, 2 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/gpu/drm/hyperv/hyperv_drm_drv.c b/drivers/gpu/drm/hyperv/hyperv_drm_drv.c
> index 6d11e79..61083c7 100644
> --- a/drivers/gpu/drm/hyperv/hyperv_drm_drv.c
> +++ b/drivers/gpu/drm/hyperv/hyperv_drm_drv.c
> @@ -23,7 +23,6 @@
>  #define DRIVER_MAJOR 1
>  #define DRIVER_MINOR 0
>  
> -#define PCI_VENDOR_ID_MICROSOFT 0x1414
>  #define PCI_DEVICE_ID_HYPERV_VIDEO 0x5353
>  
>  DEFINE_DRM_GEM_FOPS(hv_fops);
> diff --git a/drivers/net/ethernet/microsoft/mana/gdma_main.c b/drivers/net/ethernet/microsoft/mana/gdma_main.c
> index 5f92401..00d8198 100644
> --- a/drivers/net/ethernet/microsoft/mana/gdma_main.c
> +++ b/drivers/net/ethernet/microsoft/mana/gdma_main.c
> @@ -1465,10 +1465,6 @@ static void mana_gd_shutdown(struct pci_dev *pdev)
>  	pci_disable_device(pdev);
>  }
>  
> -#ifndef PCI_VENDOR_ID_MICROSOFT
> -#define PCI_VENDOR_ID_MICROSOFT 0x1414
> -#endif
> -
>  static const struct pci_device_id mana_id_table[] = {
>  	{ PCI_DEVICE(PCI_VENDOR_ID_MICROSOFT, MANA_PF_DEVICE_ID) },
>  	{ PCI_DEVICE(PCI_VENDOR_ID_MICROSOFT, MANA_VF_DEVICE_ID) },
> diff --git a/drivers/video/fbdev/hyperv_fb.c b/drivers/video/fbdev/hyperv_fb.c
> index 886c564..a502c80 100644
> --- a/drivers/video/fbdev/hyperv_fb.c
> +++ b/drivers/video/fbdev/hyperv_fb.c
> @@ -58,7 +58,6 @@
>  
>  #include <linux/hyperv.h>
>  
> -
>  /* Hyper-V Synthetic Video Protocol definitions and structures */
>  #define MAX_VMBUS_PKT_SIZE 0x4000
>  
> @@ -74,10 +73,8 @@
>  #define SYNTHVID_DEPTH_WIN8 32
>  #define SYNTHVID_FB_SIZE_WIN8 (8 * 1024 * 1024)
>  
> -#define PCI_VENDOR_ID_MICROSOFT 0x1414
>  #define PCI_DEVICE_ID_HYPERV_VIDEO 0x5353
>  
> -
>  enum pipe_msg_type {
>  	PIPE_MSG_INVALID,
>  	PIPE_MSG_DATA,
> diff --git a/include/linux/pci_ids.h b/include/linux/pci_ids.h
> index 6feade6..c008fda 100644
> --- a/include/linux/pci_ids.h
> +++ b/include/linux/pci_ids.h
> @@ -2079,6 +2079,8 @@
>  #define PCI_DEVICE_ID_ICE_1712		0x1712
>  #define PCI_DEVICE_ID_VT1724		0x1724
>  
> +#define PCI_VENDOR_ID_MICROSOFT  	0x1414
> +
>  #define PCI_VENDOR_ID_OXSEMI		0x1415
>  #define PCI_DEVICE_ID_OXSEMI_12PCI840	0x8403
>  #define PCI_DEVICE_ID_OXSEMI_PCIe840		0xC000

I've sent a similar patch recently:
https://lore.kernel.org/linux-hyperv/20220827130345.1320254-2-vkuznets@redhat.com/

which Wei has already queued to hyperv/fixes. Moving
PCI_DEVICE_ID_MICROSOFT_MANA_PF/VF definitions to 'pci_ids.h' does make
sense but please rebase first.

-- 
Vitaly

