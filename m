Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9292904E65
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jun 2024 10:46:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D20CD10E7D3;
	Wed, 12 Jun 2024 08:46:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="ebQx80dF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com
 [209.85.208.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D16C10E7D3
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2024 08:45:57 +0000 (UTC)
Received: by mail-lj1-f169.google.com with SMTP id
 38308e7fff4ca-2ebdd684ef6so4582071fa.1
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2024 01:45:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1718181956; x=1718786756; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Mmdle60OyXYzHnY4uAc3ZIp5lh6qnfcxEmNuLz4sZH8=;
 b=ebQx80dFDy2hvAPt9Ah0Nv8tAZ1XRoNTDx6ptNgRJS2GzBcIdDVYsoWgP2BHrHUMcQ
 zCUcDEvLX9jUWDaWNNuhj4AiJdd6h/W964HcTr/R0vBtBau1aMPIJSlBP6T9FFgYxWzC
 hOP3vORwWW+BjakbV8Emc62XfiXVoI2XLcCSE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718181956; x=1718786756;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Mmdle60OyXYzHnY4uAc3ZIp5lh6qnfcxEmNuLz4sZH8=;
 b=TMwohxshEyZrRjBFXaHYis6L/0RlkzEP/6YJ9InxRCNIZz1W4B21LT39q63cpLgSYp
 e2k/PNe5mgB5EkOOsgFsSKtzLYzDHru98mtGtBDqFGQ0+0TIeODlgn/Y8rAEZYHYfE1Y
 NL+9PLmbwFRyh8dIJH5X56PSZAimLUiV6ckk9pk95kQjG6LzxDfNtdfQN2XLT8oS8GBx
 mR9oZa/N2cBgXLrFzpQSlo42RDD3z35ik2qaHM/rMkzBHWMRDRwknJ0qCzUPwhhSE5f3
 aXz3JS/vSDQHlItayIBVyImIbkGpwtyzdzfbngVegTRC8oqa4X3WF46SFLY7+W8U7b+w
 afzw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV1ItsEBko7Li7ruUMt/4krGLT5s9d3PjZjMXsKcccfe1mFEIEporIFQAGpr6hDZzYMXMLz0yBMyHTczhLVsevVyROqO6a2wYF5nBZm7nKo
X-Gm-Message-State: AOJu0YwlZeNjMegzuca7Q56ZfH7fFj2hAGD6p88aMHvb8OPaQGGmx2x2
 RUuFxo0F+ALeGLMJnSaXXb4GNJn4dp945C9ZVP+4G9qv/0qP9HQ2QGUK6DsjsaY=
X-Google-Smtp-Source: AGHT+IEN2iOgvU4IG9+VZppwFPKb+iyuVD3RBsFuaPvkQqAd7b8Sg7CAQLH7LpQ/LkJ8NrbWNpd/gQ==
X-Received: by 2002:a2e:2281:0:b0:2ea:eac6:6872 with SMTP id
 38308e7fff4ca-2ebfc815c37mr7977921fa.0.1718181955802; 
 Wed, 12 Jun 2024 01:45:55 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-422871f9068sm16507935e9.43.2024.06.12.01.45.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Jun 2024 01:45:55 -0700 (PDT)
Date: Wed, 12 Jun 2024 10:45:53 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Peng Fan <peng.fan@nxp.com>, "Peng Fan (OSS)" <peng.fan@oss.nxp.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Javier Martinez Canillas <javierm@redhat.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] drm/fbdev-dma: fix getting smem_start
Message-ID: <ZmlgQV4Eov0xv5bc@phenom.ffwll.local>
Mail-Followup-To: Thomas Zimmermann <tzimmermann@suse.de>,
 Peng Fan <peng.fan@nxp.com>,
 "Peng Fan (OSS)" <peng.fan@oss.nxp.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 David Airlie <airlied@gmail.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20240604080328.4024838-1-peng.fan@oss.nxp.com>
 <8f4a6d80-dd3e-422f-88af-d26f50c973ff@suse.de>
 <AM6PR04MB59415B3F01D02024A255BFB988C72@AM6PR04MB5941.eurprd04.prod.outlook.com>
 <766908de-922c-4d71-bb04-29dbe4d1d64d@suse.de>
 <AM6PR04MB5941216A69AE325A79689C5888C72@AM6PR04MB5941.eurprd04.prod.outlook.com>
 <6c01bee4-c3f5-496e-8b4f-a29c97954808@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6c01bee4-c3f5-496e-8b4f-a29c97954808@suse.de>
X-Operating-System: Linux phenom 6.8.9-amd64 
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

On Tue, Jun 11, 2024 at 11:29:58AM +0200, Thomas Zimmermann wrote:
> Hi
> 
> Am 11.06.24 um 10:23 schrieb Peng Fan:
> > > Subject: Re: [PATCH] drm/fbdev-dma: fix getting smem_start
> > > 
> > > Hi
> > > 
> > > Am 11.06.24 um 03:00 schrieb Peng Fan:
> > > > > Subject: Re: [PATCH] drm/fbdev-dma: fix getting smem_start
> > > > > 
> > > > > Hi
> > > > > 
> > > > > Am 04.06.24 um 10:03 schrieb Peng Fan (OSS):
> > > > > > From: Peng Fan <peng.fan@nxp.com>
> > > > > > 
> > > > > > If 'info->screen_buffer' locates in vmalloc address space,
> > > > > > virt_to_page will not be able to get correct results. With
> > > > > > CONFIG_DEBUG_VM and CONFIG_DEBUG_VIRTUAL enabled on ARM64,
> > > > > there is dump below:
> > > > > 
> > > > > Which graphics driver triggers this bug?
> > > > It is NXP i.MX95 DPU driver which is still in NXP downstream repo.
> > > Which DRM memory manager does that driver use?
> > DRM_GEM_DMA_DRIVER_OPS
> 
> So fbdev-dma would be correct. But with the gem-dma allocator, wouldn't you
> allocate from one of these dma_alloc_() calls at [1] ? How does the drivers
> end up with vmalloc'd fbdev memory? Specifically in the light of the docs at
> [2].

I think when you have an iommu dma_alloc just allocates pages, and uses
the iommu to make it all contiguous for the device, and vmalloc for the
kernel. So it's not allocated with vmalloc(), just ends up getting mapped
into the vmalloc range.
-Sima


> 
> [1] https://elixir.bootlin.com/linux/v6.9/source/drivers/gpu/drm/drm_gem_dma_helper.c#L146
> [2] https://elixir.bootlin.com/linux/v6.9/source/Documentation/core-api/dma-api-howto.rst#L124
> 
> Best regards
> Thomas
> 
> > 
> > > I'm asking because if the driver allocates BOs via vmalloc(), should it really
> > > use fbdev-dma?
> > We use it for fbdev emulation. If drm_kms_helper.fbdev_emulation is 0,
> > fbdev emulation could be disabled.
> > 
> > Thanks
> > Peng
> > > Best regards
> > > Thomas
> > > 
> > > > Thanks,
> > > > Peng.
> > > --
> > > --
> > > Thomas Zimmermann
> > > Graphics Driver Developer
> > > SUSE Software Solutions Germany GmbH
> > > Frankenstrasse 146, 90461 Nuernberg, Germany
> > > GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman HRB
> > > 36809 (AG Nuernberg)
> 
> -- 
> --
> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Frankenstrasse 146, 90461 Nuernberg, Germany
> GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
> HRB 36809 (AG Nuernberg)
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
