Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EDFA6ADDBAD
	for <lists+dri-devel@lfdr.de>; Tue, 17 Jun 2025 20:52:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56D4710E0AD;
	Tue, 17 Jun 2025 18:52:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="BZxCee7J";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F204110E00C
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Jun 2025 18:52:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1750186365;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=j7GR8b6oq+VKsS7zEblPcoLobXIu9Z0EZdf91JZ1evE=;
 b=BZxCee7J+REm65pWAt4vMMk2MBzboHYoIB0bB892iLKG4lnGvI6zzk147A3OeKwF05lR2r
 h7PkqaLGAgxZXlmVPvQO8+51UH2bwSDAL7tziFFsoWIf52SVVble+BxvlTJAlBePDqTSfF
 4ZOfr5BfB52B3rqrk3Sv1cgxDeis4jU=
Received: from mail-io1-f69.google.com (mail-io1-f69.google.com
 [209.85.166.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-465-HnvdTEg3OIm8g6KpAZQt5g-1; Tue, 17 Jun 2025 14:52:43 -0400
X-MC-Unique: HnvdTEg3OIm8g6KpAZQt5g-1
X-Mimecast-MFC-AGG-ID: HnvdTEg3OIm8g6KpAZQt5g_1750186362
Received: by mail-io1-f69.google.com with SMTP id
 ca18e2360f4ac-86cf803792dso44668639f.3
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Jun 2025 11:52:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750186362; x=1750791162;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=j7GR8b6oq+VKsS7zEblPcoLobXIu9Z0EZdf91JZ1evE=;
 b=BvzjbalDNTc+FfulHuvE55icMmxPnYeJJP5JiQXdbFoTgEZaOI5MZYVxt9VcIwsC/V
 ukLAS5Q1GZhfE1KYwt2lx4XIYUyRT7S4w5KlHwYHLPUCBQaYiNwrNUyIEpSz2kRphkuY
 qW/y+0lohFbMX/DrYo5xGdQT4UptHJaccjkrgemHc32t1uc0pwJigkZmoy53qkLj+8Cw
 qhOJBhDa/75DdPHGWa83BWFmjqbkSjgVnmikSbbJbvKSSz1wvC03QW/+zINSiwIFYmxG
 HSq5+uv57MDRnGCvsn6cGcZT+SWqLXwhD+S0ZqlOUP3f1oeDg0aulwLrEg1w/d0GKg9R
 AGMQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXZkcY1mwj+ylu2fwqQi3HHC+YXz8CTEbExk1uDCOn3X7P+i1SzLjYp4e/wUph2Ie9QaK8gssiHtgE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyR+p4zL0pMBcuMWsffzrMEnJqL80YMSzfZ/cw8mH8kK1nSKo5N
 IcXk4zSBd2ImALwH7TwaK4NNwohX3cKjexdPBxyO+hRW5IZPPq2trqrNao/bNPLdzaFaQnxUbX5
 gXHPfPGSaPamj6q84EIyl/IRwDSYRBW78GBotCIhAVB2BiioPUZhvJZCIxUzJAmEl2TCSew==
X-Gm-Gg: ASbGncutK4d/98D0hh7/SHcMjTRdic69pX2Dmc1Ilr59oERDLgp5kdb1fz8E528bO9E
 fBANsucaRxirBiplj75l94p6eQo+RFbaQBu0ejaIpKFy8mn9b7cyW4bHQGPNSFLdKp3CRI2UbNr
 TRYj6nmccng7xMqJX74HOD8KYxl4gfF6Atxh2QUaKqo+DB4K3ZoWFEa9lFkbgehH3dgDos9CkGW
 ZatzOqCU9G3NsCsBzOhzu6cbxvWuMcbfZldW+wEsZNZ+TA7gD2rW8nJURT2iziTON4LeJidWsGH
 XaaCu3zobyN6WQ20f+6mWX1RcQ==
X-Received: by 2002:a05:6602:3414:b0:86a:24c0:8829 with SMTP id
 ca18e2360f4ac-87601391479mr183502839f.0.1750186362595; 
 Tue, 17 Jun 2025 11:52:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEKthDmryWBtQYhqN8X3vXXpFX6gedZAuw/STdWF8X1NR60JiUUJho0FZmRHCrhQiS9JYovUQ==
X-Received: by 2002:a05:6602:3414:b0:86a:24c0:8829 with SMTP id
 ca18e2360f4ac-87601391479mr183500639f.0.1750186362211; 
 Tue, 17 Jun 2025 11:52:42 -0700 (PDT)
Received: from redhat.com ([38.15.36.11]) by smtp.gmail.com with ESMTPSA id
 ca18e2360f4ac-875d5842a19sm225353839f.44.2025.06.17.11.52.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Jun 2025 11:52:40 -0700 (PDT)
Date: Tue, 17 Jun 2025 12:52:35 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Mario Limonciello <superm1@kernel.org>
Cc: Bjorn Helgaas <bhelgaas@google.com>, Alex Deucher
 <alexander.deucher@amd.com>, Christian =?UTF-8?B?S8O2bmln?=
 <christian.koenig@amd.com>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Lukas Wunner <lukas@wunner.de>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Woodhouse
 <dwmw2@infradead.org>, Lu Baolu <baolu.lu@linux.intel.com>, Joerg Roedel
 <joro@8bytes.org>, Will Deacon <will@kernel.org>, Robin Murphy
 <robin.murphy@arm.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai
 <tiwai@suse.com>, dri-devel@lists.freedesktop.org (open list:DRM DRIVERS),
 linux-kernel@vger.kernel.org (open list), iommu@lists.linux.dev (open
 list:INTEL IOMMU (VT-d)), linux-pci@vger.kernel.org (open list:PCI
 SUBSYSTEM), kvm@vger.kernel.org (open list:VFIO DRIVER),
 linux-sound@vger.kernel.org (open list:SOUND), Daniel Dadap
 <ddadap@nvidia.com>, Mario Limonciello <mario.limonciello@amd.com>, Bjorn
 Helgaas <helgaas@kernel.org>
Subject: Re: [PATCH v2 2/6] vfio/pci: Use pci_is_display()
Message-ID: <20250617125235.13017540.alex.williamson@redhat.com>
In-Reply-To: <20250617175910.1640546-3-superm1@kernel.org>
References: <20250617175910.1640546-1-superm1@kernel.org>
 <20250617175910.1640546-3-superm1@kernel.org>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: gA-USqsebHgVE3um_ONY8LWC1xlvPePw2NhFrrR20s4_1750186362
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
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

On Tue, 17 Jun 2025 12:59:06 -0500
Mario Limonciello <superm1@kernel.org> wrote:

> From: Mario Limonciello <mario.limonciello@amd.com>
> 
> The inline pci_is_display() helper does the same thing.  Use it.
> 
> Suggested-by: Bjorn Helgaas <helgaas@kernel.org>
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
> ---
>  drivers/vfio/pci/vfio_pci_igd.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/vfio/pci/vfio_pci_igd.c b/drivers/vfio/pci/vfio_pci_igd.c
> index ef490a4545f48..988b6919c2c31 100644
> --- a/drivers/vfio/pci/vfio_pci_igd.c
> +++ b/drivers/vfio/pci/vfio_pci_igd.c
> @@ -437,8 +437,7 @@ static int vfio_pci_igd_cfg_init(struct vfio_pci_core_device *vdev)
>  
>  bool vfio_pci_is_intel_display(struct pci_dev *pdev)
>  {
> -	return (pdev->vendor == PCI_VENDOR_ID_INTEL) &&
> -	       ((pdev->class >> 16) == PCI_BASE_CLASS_DISPLAY);
> +	return (pdev->vendor == PCI_VENDOR_ID_INTEL) && pci_is_display(pdev);
>  }
>  
>  int vfio_pci_igd_init(struct vfio_pci_core_device *vdev)

Acked-by: Alex Williamson <alex.williamson@redhat.com>

