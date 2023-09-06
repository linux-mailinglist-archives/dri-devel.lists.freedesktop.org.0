Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7741A793D62
	for <lists+dri-devel@lfdr.de>; Wed,  6 Sep 2023 15:05:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB7F910E64C;
	Wed,  6 Sep 2023 13:05:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11B6610E64C
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Sep 2023 13:05:24 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 7FE34660087A;
 Wed,  6 Sep 2023 14:05:22 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1694005522;
 bh=eH9/DywfzNURN6pvfU0wSJFMmgq/CtXWPGjegEzgGxs=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=aiX+MduuWnuU/VmQLo1vxEDwKwtZQrR+rDDRVrP+mnmtGPBIlo8NfP+A9d0+qNXDx
 VY02zfntIIjGTVWj3VvKTRCohp5s9DZ80lbT4KR7PCM8D+5szrh3+5krDGr+kvvF8Y
 Nj22PndDyq/05mKCGiCqHXEhUYF7ZtxQt5ujCP4xYf8+e01sEQ/wBEBMfxiXBlHYmi
 P0c+Hz+4p+1BwHAOXIVdaODjk+G4yd6J4bur2tGvufqSKm+2IC8NEY+SQp6Rxea3Kh
 T1z+JWSdKuMZCTie3nP2HK1fTV4aDbqkh1wXAbUkfZGeyQ5s2XOYyXWT3qeKibqmFU
 +jDqxlHQXOLJA==
Date: Wed, 6 Sep 2023 15:05:20 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Ketil Johnsen <ketil.johnsen@arm.com>
Subject: Re: [PATCH v2 12/15] drm/panthor: Add the driver frontend block
Message-ID: <20230906150520.7cc83499@collabora.com>
In-Reply-To: <6b24d964-97d7-5337-f200-aab6c7d22318@arm.com>
References: <20230809165330.2451699-1-boris.brezillon@collabora.com>
 <20230809165330.2451699-13-boris.brezillon@collabora.com>
 <6b24d964-97d7-5337-f200-aab6c7d22318@arm.com>
Organization: Collabora
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Nicolas Boichat <drinkcat@chromium.org>, Daniel Stone <daniels@collabora.com>,
 Liviu Dudau <Liviu.Dudau@arm.com>, dri-devel@lists.freedesktop.org,
 Steven Price <steven.price@arm.com>,
 =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>,
 "Marty E . Plummer" <hanetzer@startmail.com>,
 Robin Murphy <robin.murphy@arm.com>,
 Faith Ekstrand <faith.ekstrand@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 6 Sep 2023 14:38:15 +0200
Ketil Johnsen <ketil.johnsen@arm.com> wrote:

> On 8/9/23 18:53, Boris Brezillon wrote:
> > +static int panthor_ioctl_vm_create(struct drm_device *ddev, void *data,
> > +				   struct drm_file *file)
> > +{
> > +	struct panthor_device *ptdev = container_of(ddev, struct panthor_device, base);
> > +	u32 va_bits = GPU_MMU_FEATURES_VA_BITS(ptdev->gpu_info.mmu_features);
> > +	struct panthor_file *pfile = file->driver_priv;
> > +	struct drm_panthor_vm_create *args = data;
> > +	u64 kernel_va_start = 0;
> > +	int cookie, ret;
> > +
> > +	if (!drm_dev_enter(ddev, &cookie))
> > +		return -ENODEV;
> > +
> > +	if (args->flags & ~PANTHOR_VM_CREATE_FLAGS) {
> > +		ret = -EINVAL;
> > +		goto out_dev_exit;
> > +	}
> > +
> > +	if (drm_WARN_ON(ddev, !va_bits) || args->kernel_va_range > (1ull << (va_bits - 1))) {
> > +		ret = -EINVAL;
> > +		goto out_dev_exit;
> > +	}
> > +
> > +	if (args->kernel_va_range)
> > +		kernel_va_start = (1 << (va_bits - 1)) - args->kernel_va_range;  
> 
> Bug here if user space provides kernel_va_range, which is the intention 
> of the current Mesa proposal.
> 
> I think the desired calculation should be something like:
> kernel_va_start = (1ull << va_bits) - args->kernel_va_range;
> 
> PS: There is currently also a bug in the accompanying Mesa changes which 
> accidentally makes kernel_va_range always zero, thus bypassing this 
> kernel bug.
> The Mesa bug is due to va_bits always being zero because mmu_features 
> field is not copied in panthor_dev_query_props().

Yep, I noticed/fixed the problem recently, when working on 32-bit
enablement. Anyway, thanks for the reporting those bugs.
