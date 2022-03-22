Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6218F4E4140
	for <lists+dri-devel@lfdr.de>; Tue, 22 Mar 2022 15:27:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E98B10E54E;
	Tue, 22 Mar 2022 14:27:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A33010E2FC
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Mar 2022 14:27:36 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id
 p184-20020a1c29c1000000b0037f76d8b484so1942068wmp.5
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Mar 2022 07:27:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=aFJ8fEE2GmOZRq2LQko1sVV66aL7LKjJL0NKXhRxHqI=;
 b=V5Fveq5WdZ2O1E/UHe/Kd/2Tq2XKcYmKLrvMgQL0ZFn3w2rYOsfKLTxdYURrm/8Avw
 sSpJwrhVxtG4ih+/xD4Wp6wFgRCVFiTJf8f0hRjgQwRyr8ayboOqmEZ++brrpQ09jSwq
 otAb7ac5DrVEvEv7se0+mm3/EiGGLLRX0kyGs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=aFJ8fEE2GmOZRq2LQko1sVV66aL7LKjJL0NKXhRxHqI=;
 b=Ewd2aoFTEbrqxbmi7UBfM0qL9vVfSEDJfeC5fGTCT964bns7rCNehP/jMnZNJ3nX1P
 uhgtMV5xjZS6dbzRmnuXTG/7a0JO8vnEWF/6f8pA+YkOlS+3lDJ4ub0sFc4c43z/Gwr2
 V8Z9oIByqDqYFfomaysUDXQlySF9eRjIC7kjmj/hB2EnZYf8EEYIn6B0Be418Y1nYkwm
 23mGETP6z/fDcHJYALJf6muhqtx4GeRJWq701JiABjhug50ORZyxyf4DU+uXMmGfcQR1
 +HOTIlmMG8MCVMB1gqcukRrxerb4gaBeWoMsR+xvcy0cmUBl0kGX/vIY1jX2qEDtHdQZ
 CmqQ==
X-Gm-Message-State: AOAM532C2EybrBKNCkyyUZlc/cg3eOMsGuQ3f0MPA6wRVG5JDx6CRqSc
 qT0eKSAr+nfLifiSsVxy3i6w28lHY7UXLadpRGs=
X-Google-Smtp-Source: ABdhPJxOqZteDgpdZsZu0oPCEXdNAPTFOjbUarDx25uP8lDbSGAd7h8aMt73l8sJSR0+303XjDYMnA==
X-Received: by 2002:a05:600c:3ca8:b0:38c:6dc6:6de0 with SMTP id
 bg40-20020a05600c3ca800b0038c6dc66de0mr4092167wmb.159.1647959254730; 
 Tue, 22 Mar 2022 07:27:34 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 l19-20020a05600c4f1300b0038cb924c3d7sm1461155wmq.45.2022.03.22.07.27.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Mar 2022 07:27:34 -0700 (PDT)
Date: Tue, 22 Mar 2022 15:27:32 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Zheyu Ma <zheyuma97@gmail.com>
Subject: Re: [PATCH] drm: drm_bufs: Error out if 'dev->agp' is a null pointer
Message-ID: <Yjnc1A2heVopcyXh@phenom.ffwll.local>
Mail-Followup-To: Zheyu Ma <zheyuma97@gmail.com>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@linux.ie,
 dri-devel@lists.freedesktop.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <1646983382-30036-1-git-send-email-zheyuma97@gmail.com>
 <YjMSMIrbsVZjEw8W@phenom.ffwll.local>
 <CAMhUBjkohp=-4YZ7x6Yyf4tQr_2zCoR+RVmEZPGLoXTEhNoPFA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMhUBjkohp=-4YZ7x6Yyf4tQr_2zCoR+RVmEZPGLoXTEhNoPFA@mail.gmail.com>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
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
Cc: airlied@linux.ie, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, tzimmermann@suse.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Mar 21, 2022 at 09:02:47PM +0800, Zheyu Ma wrote:
> On Thu, Mar 17, 2022 at 6:49 PM Daniel Vetter <daniel@ffwll.ch> wrote:
> >
> > On Fri, Mar 11, 2022 at 07:23:02AM +0000, Zheyu Ma wrote:
> > > The user program can control the 'drm_buf_desc::flags' via ioctl system
> > > call and enter the function drm_legacy_addbufs_agp(). If the driver
> > > doesn't initialize the agp resources, the driver will cause a null
> > > pointer dereference.
> > >
> > > The following log reveals it:
> > >     general protection fault, probably for non-canonical address
> > >     0xdffffc000000000f: 0000 [#1] PREEMPT SMP KASAN PTI
> > >     KASAN: null-ptr-deref in range [0x0000000000000078-0x000000000000007f]
> > >     Call Trace:
> > >      <TASK>
> > >      drm_ioctl_kernel+0x342/0x450 drivers/gpu/drm/drm_ioctl.c:785
> > >      drm_ioctl+0x592/0x940 drivers/gpu/drm/drm_ioctl.c:885
> > >      vfs_ioctl fs/ioctl.c:51 [inline]
> > >      __do_sys_ioctl fs/ioctl.c:874 [inline]
> > >      __se_sys_ioctl+0xaa/0xf0 fs/ioctl.c:860
> > >      do_syscall_x64 arch/x86/entry/common.c:50 [inline]
> > >      do_syscall_64+0x43/0x90 arch/x86/entry/common.c:80
> > >      entry_SYSCALL_64_after_hwframe+0x44/0xae
> > >
> > > Fix this bug by adding a check.
> > >
> > > Signed-off-by: Zheyu Ma <zheyuma97@gmail.com>
> >
> > You can only hit this if you enabled a DRIVER_LEGACY drm driver, which
> > opens you up to tons of other CVEs and issues. What's your .config?
> 
> Yes, I enable the DRM_LEGACY option in the config.
> I think you mean this is not a normal configuration file? Do you have
> a recommended configuration option for when I want to test the GPU
> driver?

Yeah DRM_LEGACY gives you all kinds of horrible and known-broken
interfaces. Don't enable that :-)

You have a bunch of other drivers enable which require DRM_LEGACY, so
those will disable too. Anything else I think would be an upstream bug and
we'd need to adjust Kconfig (or fix the code).

Cheers, Daniel
> 
> Actually, I use the following configs related to GPU:
> 
> CONFIG_AGP=y
> CONFIG_AGP_AMD64=y
> CONFIG_AGP_INTEL=y
> CONFIG_AGP_SIS=y
> CONFIG_AGP_VIA=y
> CONFIG_INTEL_GTT=y
> CONFIG_VGA_ARB=y
> CONFIG_VGA_ARB_MAX_GPUS=16
> CONFIG_DRM=y
> CONFIG_DRM_MIPI_DSI=y
> CONFIG_DRM_KMS_HELPER=y
> CONFIG_DRM_DEBUG_MODESET_LOCK=y
> CONFIG_DRM_FBDEV_EMULATION=y
> CONFIG_DRM_FBDEV_OVERALLOC=100
> CONFIG_DRM_TTM=y
> CONFIG_DRM_VRAM_HELPER=y
> CONFIG_DRM_TTM_HELPER=y
> CONFIG_DRM_GEM_SHMEM_HELPER=y
> CONFIG_DRM_SCHED=y
> CONFIG_DRM_RADEON=y
> CONFIG_DRM_AMDGPU=y
> CONFIG_DRM_AMD_DC=y
> CONFIG_DRM_AMD_DC_DCN=y
> CONFIG_DRM_I915=y
> CONFIG_DRM_I915_FORCE_PROBE=""
> CONFIG_DRM_I915_CAPTURE_ERROR=y
> CONFIG_DRM_I915_COMPRESS_ERROR=y
> CONFIG_DRM_I915_USERPTR=y
> CONFIG_DRM_I915_REQUEST_TIMEOUT=20000
> CONFIG_DRM_I915_FENCE_TIMEOUT=10000
> CONFIG_DRM_I915_USERFAULT_AUTOSUSPEND=250
> CONFIG_DRM_I915_HEARTBEAT_INTERVAL=2500
> CONFIG_DRM_I915_PREEMPT_TIMEOUT=640
> CONFIG_DRM_I915_MAX_REQUEST_BUSYWAIT=8000
> CONFIG_DRM_I915_STOP_TIMEOUT=100
> CONFIG_DRM_I915_TIMESLICE_DURATION=1
> CONFIG_DRM_VMWGFX=y
> CONFIG_DRM_GMA500=y
> CONFIG_DRM_UDL=y
> CONFIG_DRM_AST=y
> CONFIG_DRM_MGAG200=y
> CONFIG_DRM_QXL=y
> CONFIG_DRM_VIRTIO_GPU=y
> CONFIG_DRM_PANEL=y
> CONFIG_DRM_BRIDGE=y
> CONFIG_DRM_PANEL_BRIDGE=y
> CONFIG_DRM_BOCHS=y
> CONFIG_DRM_CIRRUS_QEMU=y
> CONFIG_DRM_GM12U320=y
> CONFIG_DRM_VBOXVIDEO=y
> CONFIG_DRM_GUD=y
> CONFIG_DRM_HYPERV=y
> CONFIG_DRM_LEGACY=y
> CONFIG_DRM_TDFX=y
> CONFIG_DRM_R128=y
> CONFIG_DRM_MGA=y
> CONFIG_DRM_SIS=y
> CONFIG_DRM_VIA=y
> CONFIG_DRM_SAVAGE=y
> CONFIG_DRM_PANEL_ORIENTATION_QUIRKS=y
> 
> Thanks,
> Zheyu Ma

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
