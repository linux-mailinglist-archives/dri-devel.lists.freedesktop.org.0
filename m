Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BFFAD905614
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jun 2024 17:00:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B12DD10E88D;
	Wed, 12 Jun 2024 15:00:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="eAtqm6aI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 982B610E88D
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2024 15:00:49 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-422948b9140so297455e9.1
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2024 08:00:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1718204448; x=1718809248; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:mail-followup-to:message-id:subject:cc:to
 :from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Vga4bYp9jxqSv9eCBMzwANuaNkrPnKBob/TvPmGImHU=;
 b=eAtqm6aIbiTVVgps2hWLEfS8K/0lRpIZZn1koItpQwHACB/du3s1I0YeboWxqhsfgc
 rQdvhuYIWHfupYjYiW6E5AVDXHro4g88lQ90/rx6ulgSNrCaKUWLFZBbRBMz7N3VvkxT
 y13rcAEEuA11v25ZUEOe56+q0iFhqVKy2ROk8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718204448; x=1718809248;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:mail-followup-to:message-id:subject:cc:to
 :from:date:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Vga4bYp9jxqSv9eCBMzwANuaNkrPnKBob/TvPmGImHU=;
 b=G5w6d0P5yMjM6Yym95RbsmABsg6upog7/EwMGch4UHsVfXi1Z3RSQvYnNRVt6+JQes
 o4E7gNB3OsD8CQAPLWbg2QQWwOo5dOZ++RnLTSHQxTHiiOhYhXnnEh68zywoomKEzveh
 ugkyhJkuhiKq2Imfcz27YDxAtiC5SKncAYE7MppJtDTnA++r9Bu3vXKII57B1gc4C5p4
 bnVFhX1UaHO14JURHmVHvv5+4LA+9hfqaLN2LmiQHVIILGRve4d4GlvJeksTFJt5KSDz
 8PgfHFukfFzTfHI0p3GiHP6V3fEwDYQ7bwR928lVjPqPkc+N6dUgLy9NdviBvlCypSMD
 bIXg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXAj9vZsCdh9V/z73tONEyMsUU/G+RAFIl2LnLgz53EtgbnedNLJxURke9oGs9+xNmJ8rWnhpr9k6A=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxRv+JNPYtj56bL6Y0sLROogvyp5nlHTKnU9JFqxNBFGD/6G1Mn
 6Egl4hXUEo+as5R3jai/MF9CpepI7CFE5CdSYEdwH8k40twWb34HqNT0+X0xAVQ=
X-Google-Smtp-Source: AGHT+IFSC1i2V0ypqWkq76qJSJvokwb8rd6Yp8fMrGyYSDy7uditWcjWH2yTATEfSucgGwiy+8PrEw==
X-Received: by 2002:a5d:59a1:0:b0:35f:2f97:e890 with SMTP id
 ffacd0b85a97d-35fd4b30419mr1419392f8f.0.1718204447552; 
 Wed, 12 Jun 2024 08:00:47 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-35f25aa8fb6sm7982282f8f.92.2024.06.12.08.00.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Jun 2024 08:00:47 -0700 (PDT)
Date: Wed, 12 Jun 2024 17:00:45 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Javier Martinez Canillas <javierm@redhat.com>,
 "Peng Fan (OSS)" <peng.fan@oss.nxp.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Peng Fan <peng.fan@nxp.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/fbdev-dma: fix getting smem_start
Message-ID: <Zmm4HSkia-x_oRWR@phenom.ffwll.local>
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
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <14a7c534-af3f-43b8-a24c-501a9af97936@suse.de>
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

On Wed, Jun 12, 2024 at 10:37:14AM +0200, Thomas Zimmermann wrote:
> Hi Javier
> 
> Am 12.06.24 um 09:49 schrieb Javier Martinez Canillas:
> > Thomas Zimmermann <tzimmermann@suse.de> writes:
> > 
> > Hello Thomas,
> > 
> > > Hi
> > > 
> > > Am 10.06.24 um 10:47 schrieb Thomas Zimmermann:
> > > > Hi
> > > > 
> > > > Am 04.06.24 um 10:03 schrieb Peng Fan (OSS):
> > > > > From: Peng Fan <peng.fan@nxp.com>
> > > > > 
> > > > > If 'info->screen_buffer' locates in vmalloc address space, virt_to_page
> > > > > will not be able to get correct results. With CONFIG_DEBUG_VM and
> > > > > CONFIG_DEBUG_VIRTUAL enabled on ARM64, there is dump below:
> > > > Which graphics driver triggers this bug?
> > > > 
> > > > > [    3.536043] ------------[ cut here ]------------
> > > > > [    3.540716] virt_to_phys used for non-linear address:
> > > > > 000000007fc4f540 (0xffff800086001000)
> > > > > [    3.552628] WARNING: CPU: 4 PID: 61 at arch/arm64/mm/physaddr.c:12
> > > > > __virt_to_phys+0x68/0x98
> > > > > [    3.565455] Modules linked in:
> > > > > [    3.568525] CPU: 4 PID: 61 Comm: kworker/u12:5 Not tainted
> > > > > 6.6.23-06226-g4986cc3e1b75-dirty #250
> > > > > [    3.577310] Hardware name: NXP i.MX95 19X19 board (DT)
> > > > > [    3.582452] Workqueue: events_unbound deferred_probe_work_func
> > > > > [    3.588291] pstate: 60400009 (nZCv daif +PAN -UAO -TCO -DIT -SSBS
> > > > > BTYPE=--)
> > > > > [    3.595233] pc : __virt_to_phys+0x68/0x98
> > > > > [    3.599246] lr : __virt_to_phys+0x68/0x98
> > > > > [    3.603276] sp : ffff800083603990
> > > > > [    3.677939] Call trace:
> > > > > [    3.680393]  __virt_to_phys+0x68/0x98
> > > > > [    3.684067]  drm_fbdev_dma_helper_fb_probe+0x138/0x238
> > > > > [    3.689214] __drm_fb_helper_initial_config_and_unlock+0x2b0/0x4c0
> > > > > [    3.695385]  drm_fb_helper_initial_config+0x4c/0x68
> > > > > [    3.700264]  drm_fbdev_dma_client_hotplug+0x8c/0xe0
> > > > > [    3.705161]  drm_client_register+0x60/0xb0
> > > > > [    3.709269]  drm_fbdev_dma_setup+0x94/0x148
> > > > > 
> > > > > So add a check 'is_vmalloc_addr'.
> > > > > 
> > > > > Fixes: b79fe9abd58b ("drm/fbdev-dma: Implement fbdev emulation for
> > > > > GEM DMA helpers")
> > > > > Signed-off-by: Peng Fan <peng.fan@nxp.com>
> > > > Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
> > > I'm taking back my r-b. The memory is expected to by be physically
> > > contiguous and vmalloc() won't guarantee that.
> > > 
> > Agreed.
> 
> These smem_ fields are clearly designed for PCI BARs of traditional graphics
> cards. So can we even assume contiguous memory for DMA? That was my
> assumption, but with IOMMUs it might not be the case. Fbdev-dma only sets
> smem_start to support a single old userspace driver. Maybe we should further
> restrict usage of this field by making it opt-in for each driver. Best
> regards Thomas

We could make it all conditional on CONFIG_DRM_FBDEV_LEAK_PHYS_SMEM, and
remove the FBINFO_HIDE_SMEM_START flag. The reason I've done the flag is
that with the old fb_mmap code we had to always fill out smem_start to
make mmap work. But now that the various drm fbdev helpers have all their
own mmap implementation, we could make this a lot cleaner.

If I haven't missed anything, that is.
-Sima
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
