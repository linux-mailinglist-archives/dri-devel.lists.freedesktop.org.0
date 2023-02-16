Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E8BA699436
	for <lists+dri-devel@lfdr.de>; Thu, 16 Feb 2023 13:22:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7BDB10ED55;
	Thu, 16 Feb 2023 12:22:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C894810ED55
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Feb 2023 12:22:36 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 f18-20020a7bcd12000000b003e206711347so1529755wmj.0
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Feb 2023 04:22:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=fMx8BAbpdIXe34VxGByr3BaVtPqvuKphKamIlgh1Bag=;
 b=jFS5B3ov23EVHiXg76y/Qls8c8kS5y7Lwf3MZM6cvLmcaQoZTqcOyE2eKLGHfKtXzR
 2F/4W5eojFzCqnXSm2mPQa/Rn36IMBIoMG9UZCFDJFMCylfIJTvyUuOWSmBbM5VRRpfI
 j54HBH8FfzB0FGFhORF/3d5khsCliiMapJ2mw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fMx8BAbpdIXe34VxGByr3BaVtPqvuKphKamIlgh1Bag=;
 b=3+sZOk7xacMDbPYPGmRG2Zbab3RmPKScSN+ldp0X84NyPDqSKaXdEuUyeyJmlBFdEN
 qhasL7gEp1/oAENzGw7FurYXqdtpYzfjFUXSQC0IsPnN4Ue3c+wPZIRooTxnWptIOGcl
 r+wDYFf2qXbDYpCzWwuG58dLsTsjFzrBGrzUNVdeiSQgbKGVTfdx1g9ZUjWZ0qGq5gOU
 Bzth0jlBgi9EHIvQwI4NdyKMkjBw5PeYFDoeR4k5d5xxtob1de797ij0ci5W66u+LjZ3
 HgK2Q1aBLSYKP3FqAFMmPOp3ZRQmDgDDgH/gEH98s9xrfoUl/6IwPWPqFPuXvHF3rS22
 AmTQ==
X-Gm-Message-State: AO0yUKWYux2kGw+4uZ3/7U8WxsG9a8CEHYpJluTFaMNhCKgPDGZGsZHH
 dSkppMgTpF9oEGtALBoWlgqt2w==
X-Google-Smtp-Source: AK7set878VoREr295XMcS6wu4BQXtwW3RR2m5A5tx7mG4sonETPT3aTcl3quaxvVHsPvuMSUhQZMXQ==
X-Received: by 2002:a05:600c:4f46:b0:3db:2922:2b99 with SMTP id
 m6-20020a05600c4f4600b003db29222b99mr5572712wmq.4.1676550155209; 
 Thu, 16 Feb 2023 04:22:35 -0800 (PST)
Received: from phenom.ffwll.local (212-51-149-33.fiber7.init7.net.
 [212.51.149.33]) by smtp.gmail.com with ESMTPSA id
 d21-20020a05600c34d500b003daffc2ecdesm5282033wmq.13.2023.02.16.04.22.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Feb 2023 04:22:34 -0800 (PST)
Date: Thu, 16 Feb 2023 13:22:29 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH 1/6] drm/amdgpu: Generalize KFD dmabuf import
Message-ID: <Y+4gBb3V1uBf3l1c@phenom.ffwll.local>
References: <cab37a40-9737-1b77-3a3f-87965d4c70b2@amd.com>
 <9b5b20e0-e04b-f7f6-9459-42d5a4bb44c7@amd.com>
 <1437874c-4b4b-191f-4486-de6ac69e99cc@amd.com>
 <19873c87-5d01-30dd-84d2-ced61b236fa0@amd.com>
 <27d2a3eb-541f-fd5b-6a92-77e49c74d1b4@gmail.com>
 <e55cc02a-3180-20b9-8255-f95f5910e7fe@amd.com>
 <bac027e4-0e91-8341-3baa-74520c60c808@amd.com>
 <b5101ba0-aa12-b3f1-10c0-368dc50ae4ac@amd.com>
 <8e121589-9e53-9237-6fa3-2a78ecc2dd8a@gmail.com>
 <9eb1a440-159f-1eb4-d4a7-93cc6beb1682@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9eb1a440-159f-1eb4-d4a7-93cc6beb1682@gmail.com>
X-Operating-System: Linux phenom 5.19.0-2-amd64 
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
Cc: "Chen, Xiaogang" <xiaogang.chen@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Felix Kuehling <felix.kuehling@amd.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jan 17, 2023 at 04:06:05AM +0300, Dmitry Osipenko wrote:
> 16.01.2023 18:11, Christian König пишет:
> > 
> >>>>>
> >>>>>> mmapping the memory with that new offset should still work. The
> >>>>>> imported BO is created with ttm_bo_type_sg, and AFAICT ttm_bo_vm.c
> >>>>>> supports mapping of SG BOs.
> >>>>>
> >>>>> Actually it shouldn't. This can go boom really easily.
> >>>>
> >>>> OK. I don't think we're doing this, but after Xiaogang raised the
> >>>> question I went looking through the code whether it's theoretically
> >>>> possible. I didn't find anything in the code that says that mmapping
> >>>> imported dmabufs would be prohibited or even dangerous. On the
> >>>> contrary, I found that ttm_bo_vm explicitly supports mmapping SG BOs.
> >>>>
> >>>>
> >>>>>
> >>>>> When you have imported a BO the only correct way of to mmap() it is
> >>>>> to do so on the original exporter.
> >>>>
> >>>> That seems sensible, and this is what we do today. That said, if
> >>>> mmapping an imported BO is dangerous, I'm missing a mechanism to
> >>>> protect against this. It could be as simple as setting
> >>>> AMDGPU_GEM_CREATE_NO_CPU_ACCESS in amdgpu_dma_buf_create_obj.
> >>>
> >>> At least for the GEM mmap() handler this is double checked very early
> >>> by looking at obj->import_attach and then either rejecting it or
> >>> redirecting the request to the DMA-buf file instead.
> >>
> >> Can you point me at where this check is? I see a check for
> >> obj->import_attach in drm_gem_dumb_map_offset. But I can't see how
> >> this function is called in amdgpu. I don't think it is used at all.
> > 
> > Uff, good question! @Thomas and @Dmitry: I clearly remember that one of
> > you guys was involved in the DRM/GEM mmap cleanup and DMA-buf with
> > workarounds for the KFD and DMA-buf.
> > 
> > What was the final solution to this? I can't find it of hand any more.
> 
> I was looking at it. The AMDGPU indeed allows to map imported GEMs, but
> then touching the mapped area by CPU results in a bus fault. You,
> Christian, suggested that this an AMDGPU bug that should be fixed by
> prohibiting the mapping in the first place and I was going to fix it,
> but then the plan changed from prohibiting the mapping into fixing it.
> 
> The first proposal was to make DRM core to handle the dma-buf mappings
> for all drivers universally [1]. Then we decided that will be better to
> prohibit mapping of imported GEMs [2]. In the end, Rob Clark argued that
> better to implement the [1], otherwise current userspace (Android) will
> be broken if mapping will be prohibited.
> 
> The last question was about the cache syncing of imported dma-bufs, how
> to ensure that drivers will do the cache maintenance/syncing properly.
> Rob suggested that it should be a problem for drivers and not for DRM core.
> 
> I was going to re-send the [1], but other things were getting priority.
> It's good that you reminded me about it :) I may re-send it sometime
> soon if there are no new objections.
> 
> [1] https://patchwork.freedesktop.org/patch/487481/
> 
> [2]
> https://lore.kernel.org/all/20220701090240.1896131-1-dmitry.osipenko@collabora.com/

Hm I still don't like allowing this in general, because in general it just
doesn't work.

I think more like a per-driver opt-in or something might be needed, so
that drivers which "know" that it's ok to just mmap without coherency can
allow that. Allowing this in general essentially gives up on the entire
idea of dma-buf cache flushing completely.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
