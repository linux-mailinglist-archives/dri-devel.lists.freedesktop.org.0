Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7BA490B0D7
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jun 2024 16:04:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 156BF10E052;
	Mon, 17 Jun 2024 14:04:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="Gx7B1cXW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
 [209.85.167.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89CBD10E052
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2024 14:04:30 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id
 2adb3069b0e04-52bc0236f04so600347e87.3
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2024 07:04:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1718633069; x=1719237869; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:mail-followup-to:message-id:subject:cc:to
 :from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=ZkRa5H16FO2uFUjvCQaacs/JeuEyTdLmBVpml2zQQBU=;
 b=Gx7B1cXWodVeETVtcd944jIVaMyfQ4kddyC/iZ3n99TtLP+Qt7wKs4xFXqMB9K0s5o
 3LDiCX458LFE85srfra+Gc3xZzF2Dako5LcznN7oSmjPxUOlzBGLJxLXhG6zCnP1yMfI
 6v+LUBGcdrVRlikGdFPVYlFTdzy3Eyihoires=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718633069; x=1719237869;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:mail-followup-to:message-id:subject:cc:to
 :from:date:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZkRa5H16FO2uFUjvCQaacs/JeuEyTdLmBVpml2zQQBU=;
 b=AE/Iyg2pJxkHnFviIIyFJ1U9vP0QPLkfoH9VNpIyjvIDVf2xOo/xxznF78Y+UAcvAm
 kX52yszUZc/65ZL6Vt5KcNvOWQzTJCRMcpV5T/HYvtXTrLi/G9avCHnTCsenAvuLpt8X
 eFtokg05EaFUisxYRLyhbkFPaBCNf0WypB52tkdWSV8ygVUyGaVVatKgAsl7fysYFdcz
 v1oSgYZJtJNtvPkyobNVD+icdjt9lXbBA7/UNhfacB4GBuoXchjJbjJ1xgS2G2oN5yJd
 ZByMWyusGL4FZwh/3K+ytjjBG7j2CaPxYFwr1tudSjQkvT4/sBcDcmowZJXNPx7Ax1xm
 LJDg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWGCZP4Xb7JZPQn7ZgOQkLyqTEKQ3jlskejCLoAQbmfNPJotJLz6KjSXLzVWyGOJOcE5LtRahS27uuAxM4KHBWDBCJ5AFHpl7SYG0kyHoWp
X-Gm-Message-State: AOJu0YwrodQsm2DNpI9LiYDprbMe2P557NEoDNSGWmFmvUd+nfET5IJw
 qEyfn94oqQH5IyfPAlLB3pHi+fkZZq+QiwdjxK+6eAibyWjuWePgDgt0oQ5zsnxTeRWDnDsMxkg
 e
X-Google-Smtp-Source: AGHT+IEj0VoTUmvM6ZRPstNnvIp1hc3ZMVJzBzlBdGBU8wtbWGv2aF9hkwN1PTkvfVg/5SNeumrNMw==
X-Received: by 2002:a5d:5f52:0:b0:360:8490:74d with SMTP id
 ffacd0b85a97d-360849008a1mr6127742f8f.5.1718633048487; 
 Mon, 17 Jun 2024 07:04:08 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-360750ad10esm11810049f8f.64.2024.06.17.07.04.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jun 2024 07:04:08 -0700 (PDT)
Date: Mon, 17 Jun 2024 16:04:06 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Javier Martinez Canillas <javierm@redhat.com>,
 "Peng Fan (OSS)" <peng.fan@oss.nxp.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 David Airlie <airlied@gmail.com>, Peng Fan <peng.fan@nxp.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/fbdev-dma: fix getting smem_start
Message-ID: <ZnBCVg_tblwJhOIH@phenom.ffwll.local>
Mail-Followup-To: Thomas Zimmermann <tzimmermann@suse.de>,
 Javier Martinez Canillas <javierm@redhat.com>,
 "Peng Fan (OSS)" <peng.fan@oss.nxp.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 David Airlie <airlied@gmail.com>, Peng Fan <peng.fan@nxp.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20240604080328.4024838-1-peng.fan@oss.nxp.com>
 <8f4a6d80-dd3e-422f-88af-d26f50c973ff@suse.de>
 <e307fdc0-553d-4946-9017-ed3a28e9cae2@suse.de>
 <87cyomsiqt.fsf@minerva.mail-host-address-is-not-set>
 <14a7c534-af3f-43b8-a24c-501a9af97936@suse.de>
 <Zmm4HSkia-x_oRWR@phenom.ffwll.local>
 <e1aa9785-6833-4bbb-bed7-2e01ee9634c6@suse.de>
 <209a99c3-6d44-4abc-a486-8e6d0a0c7370@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <209a99c3-6d44-4abc-a486-8e6d0a0c7370@suse.de>
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

On Thu, Jun 13, 2024 at 12:18:55PM +0200, Thomas Zimmermann wrote:
> Hi
> 
> Am 13.06.24 um 12:14 schrieb Thomas Zimmermann:
> > Hi
> > 
> > Am 12.06.24 um 17:00 schrieb Daniel Vetter:
> > > On Wed, Jun 12, 2024 at 10:37:14AM +0200, Thomas Zimmermann wrote:
> > > > Hi Javier
> > > > 
> > > > Am 12.06.24 um 09:49 schrieb Javier Martinez Canillas:
> > > > > Thomas Zimmermann <tzimmermann@suse.de> writes:
> > > > > 
> > > > > Hello Thomas,
> > > > > 
> > > > > > Hi
> > > > > > 
> > > > > > Am 10.06.24 um 10:47 schrieb Thomas Zimmermann:
> > > > > > > Hi
> > > > > > > 
> > > > > > > Am 04.06.24 um 10:03 schrieb Peng Fan (OSS):
> > > > > > > > From: Peng Fan <peng.fan@nxp.com>
> > > > > > > > 
> > > > > > > > If 'info->screen_buffer' locates in vmalloc
> > > > > > > > address space, virt_to_page
> > > > > > > > will not be able to get correct results. With CONFIG_DEBUG_VM and
> > > > > > > > CONFIG_DEBUG_VIRTUAL enabled on ARM64, there is dump below:
> > > > > > > Which graphics driver triggers this bug?
> > > > > > > 
> > > > > > > > [    3.536043] ------------[ cut here ]------------
> > > > > > > > [    3.540716] virt_to_phys used for non-linear address:
> > > > > > > > 000000007fc4f540 (0xffff800086001000)
> > > > > > > > [    3.552628] WARNING: CPU: 4 PID: 61 at
> > > > > > > > arch/arm64/mm/physaddr.c:12
> > > > > > > > __virt_to_phys+0x68/0x98
> > > > > > > > [    3.565455] Modules linked in:
> > > > > > > > [    3.568525] CPU: 4 PID: 61 Comm: kworker/u12:5 Not tainted
> > > > > > > > 6.6.23-06226-g4986cc3e1b75-dirty #250
> > > > > > > > [    3.577310] Hardware name: NXP i.MX95 19X19 board (DT)
> > > > > > > > [    3.582452] Workqueue: events_unbound deferred_probe_work_func
> > > > > > > > [    3.588291] pstate: 60400009 (nZCv daif +PAN
> > > > > > > > -UAO -TCO -DIT -SSBS
> > > > > > > > BTYPE=--)
> > > > > > > > [    3.595233] pc : __virt_to_phys+0x68/0x98
> > > > > > > > [    3.599246] lr : __virt_to_phys+0x68/0x98
> > > > > > > > [    3.603276] sp : ffff800083603990
> > > > > > > > [    3.677939] Call trace:
> > > > > > > > [    3.680393]  __virt_to_phys+0x68/0x98
> > > > > > > > [    3.684067] drm_fbdev_dma_helper_fb_probe+0x138/0x238
> > > > > > > > [    3.689214]
> > > > > > > > __drm_fb_helper_initial_config_and_unlock+0x2b0/0x4c0
> > > > > > > > [    3.695385]  drm_fb_helper_initial_config+0x4c/0x68
> > > > > > > > [    3.700264]  drm_fbdev_dma_client_hotplug+0x8c/0xe0
> > > > > > > > [    3.705161]  drm_client_register+0x60/0xb0
> > > > > > > > [    3.709269]  drm_fbdev_dma_setup+0x94/0x148
> > > > > > > > 
> > > > > > > > So add a check 'is_vmalloc_addr'.
> > > > > > > > 
> > > > > > > > Fixes: b79fe9abd58b ("drm/fbdev-dma: Implement fbdev emulation for
> > > > > > > > GEM DMA helpers")
> > > > > > > > Signed-off-by: Peng Fan <peng.fan@nxp.com>
> > > > > > > Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
> > > > > > I'm taking back my r-b. The memory is expected to by be physically
> > > > > > contiguous and vmalloc() won't guarantee that.
> > > > > > 
> > > > > Agreed.
> > > > These smem_ fields are clearly designed for PCI BARs of
> > > > traditional graphics
> > > > cards. So can we even assume contiguous memory for DMA? That was my
> > > > assumption, but with IOMMUs it might not be the case. Fbdev-dma
> > > > only sets
> > > > smem_start to support a single old userspace driver. Maybe we
> > > > should further
> > > > restrict usage of this field by making it opt-in for each driver. Best
> > > > regards Thomas
> > > We could make it all conditional on CONFIG_DRM_FBDEV_LEAK_PHYS_SMEM, and
> > > remove the FBINFO_HIDE_SMEM_START flag. The reason I've done the flag is
> > > that with the old fb_mmap code we had to always fill out smem_start to
> > > make mmap work. But now that the various drm fbdev helpers have all
> > > their
> > > own mmap implementation, we could make this a lot cleaner.
> > 
> > Enabling CONFIG_DRM_FBDEV_LEAK_PHYS_SMEM would still crash the NXP
> > driver. I think I'll add a flag to drm_fbdev_dma_setup() to set
> > smem_start from within lima, which is the only driver that requires
> > it.I'd like to remove CONFIG_DRM_FBDEV_LEAK_PHYS_SMEM and all that, but
> > I fear that it would break someone's setup. Best regards Thomas

Yeah we'd always need to make this conditional on the memory not being in
the vmalloc range, or things will blow up.

> I've been looking at
> 
> https://lore.kernel.org/dri-devel/20240318-dark-mongoose-of-camouflage-7ac6ed@houat/
> 
> and I'm now confused to find that lima doesn't even set up fbdev support.

The mali driver here was the out-of-tree proprietary mali driver as the
consumer of such buffers.

The "exporters" was just any random fbdev driver, and with the DRM option
to set the smem, also drm drivers could play in this role. It at least
seems to have helped a few people to move away from out-of-tree fbdev
drivers to upstream drm drivers (but still with the out-of-tree mali gpu
driver). Which means we've needed this for any display driver that
happens to have shipped together with one of these older mali gpus.

It's a bit a mess, and it might indeed have outlived it's usefulness.

Cheers, Sima
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
