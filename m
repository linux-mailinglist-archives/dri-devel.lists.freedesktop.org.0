Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CD848B9A59
	for <lists+dri-devel@lfdr.de>; Thu,  2 May 2024 13:59:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B9FC10E4B0;
	Thu,  2 May 2024 11:59:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="mCdpu/qe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A31AB10E1D4;
 Thu,  2 May 2024 11:59:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1714651184;
 bh=XZo7wRgbf0SUBFLeg6ecqZ1fAr1k0EXrtbbfVnJdPEo=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=mCdpu/qe7v+utfSvRdJ8QuoA9C72/EK1+J+9qcA6zXCd1XFTbwEGJp0Xhgwe/FtTj
 6JWzyTUsKe36VR0GhoxhcyK4zuByh+KG0jAPV5LRH1JL47+DxZzv78yn0t/hKOPmCN
 pTXp3U+TBFmRiCsCIDKkDNi1X6i9xeLdi7WD0YN/McVwMkU6IV1peZcz/5/QUqKaH5
 GyOwjG+Og9AXLUVu+Pe6PZzZVbt8TBmzbBTaeEXQvOl9cH+zGaxsmNsnY2cyDtIf/f
 S1yjBwMAt6m6maCoAmUfEwKpbpUmWQ/ctzl2On1muXSkXnSN4BNiCd2/JMSVXms0/d
 Zl1NH4lZ5mxrA==
Received: from localhost (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 1ED0F378143B;
 Thu,  2 May 2024 11:59:43 +0000 (UTC)
Date: Thu, 2 May 2024 13:59:41 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: =?UTF-8?B?QWRyacOhbg==?= Larumbe <adrian.larumbe@collabora.com>, Qiang
 Yu <yuq825@gmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Rob
 Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>, Sumit
 Semwal <sumit.semwal@linaro.org>, Christian Koenig=
 <christian.koenig@amd.com>, Dmitry Osipenko
 <dmitry.osipenko@collabora.com>, Zack Rusin <zack.rusin@broadcom.com>,
 kernel@collabora.com, dri-devel@lists.freedesktop.org,
 lima@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH v3 0/2] drm: Fix dma_resv deadlock at drm object pin time
Message-ID: <20240502135941.136ad639@collabora.com>
In-Reply-To: <84a5f7b6-d20a-4c69-83a8-d8394fea2b68@suse.de>
References: <20240501065650.2809530-1-adrian.larumbe@collabora.com>
 <84a5f7b6-d20a-4c69-83a8-d8394fea2b68@suse.de>
Organization: Collabora
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
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

Hi Thomas,

On Thu, 2 May 2024 13:51:16 +0200
Thomas Zimmermann <tzimmermann@suse.de> wrote:

> Hi,
> 
> ignoring my r-b on patch 1, I'd like to rethink the current patches in 
> general.
> 
> I think drm_gem_shmem_pin() should become the locked version of _pin(), 
> so that drm_gem_shmem_object_pin() can call it directly. The existing 
> _pin_unlocked() would not be needed any longer. Same for the _unpin() 
> functions. This change would also fix the consistency with the semantics 
> of the shmem _vmap() functions, which never take reservation locks.
> 
> There are only two external callers of drm_gem_shmem_pin(): the test 
> case and panthor. These assume that drm_gem_shmem_pin() acquires the 
> reservation lock. The test case should likely call drm_gem_pin() 
> instead. That would acquire the reservation lock and the test would 
> validate that shmem's pin helper integrates well into the overall GEM 
> framework. The way panthor uses drm_gem_shmem_pin() looks wrong to me. 
> For now, it could receive a wrapper that takes the lock and that's it.

I do agree that the current inconsistencies in the naming is
troublesome (sometimes _unlocked, sometimes _locked, with the version
without any suffix meaning either _locked or _unlocked depending on
what the suffixed version does), and that's the very reason I asked
Dmitry to address that in his shrinker series [1]. So, ideally I'd
prefer if patches from Dmitry's series were applied instead of
trying to fix that here (IIRC, we had an ack from Maxime).

Regards,

Boris
