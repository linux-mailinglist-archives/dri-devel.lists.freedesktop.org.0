Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B93F75A016
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jul 2023 22:43:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5E1710E513;
	Wed, 19 Jul 2023 20:43:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7159310E510;
 Wed, 19 Jul 2023 20:43:46 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E16256182F;
 Wed, 19 Jul 2023 20:43:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2564EC433C8;
 Wed, 19 Jul 2023 20:43:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1689799425;
 bh=tjOjdSqSd3UKBynevaKWHcXD+EhI+M4v0jnzU2q7Kcs=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=hoIuUAXNfvO3M5AutVXnVrVmIL15s0aDDjv5sTYY7QwPsMEjGwZYCwvmBAa1rSdaJ
 G23BZB20qaA1vwMkix+TGC8n2/pi7HmJ+ZjiqlswwHNDjrvqGJIjGUmzzmFP8u0tCV
 h///K7shd6BCvmJ66/CeMedszQb9KNLBPSUv10r+Dw2aDdcvCh6njSJVvvDh5tMYUB
 4fGyuwhn/0YJTytmhTSd/vJGtvF21ZcrrmIJfO4sQrwpRWfpo5JoVtjNfk66WxLXUc
 L24L1XsaP0Gnnmk31klc/45lESRc+Lky137WSqVbg/grtvs+05Ntx1wsjylkjwtxri
 q+znIJLt8j6Tg==
Date: Wed, 19 Jul 2023 15:43:43 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Sui Jingfeng <sui.jingfeng@linux.dev>
Subject: Re: [PATCH v3 1/9] video/aperture: Add a helper to detect if an
 aperture contains firmware FB
Message-ID: <20230719204343.GA513226@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230711164310.791756-2-sui.jingfeng@linux.dev>
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
Cc: linux-fbdev@vger.kernel.org, Sui Jingfeng <suijingfeng@loongson.cn>,
 kvm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Javier Martinez Canillas <javierm@redhat.com>, amd-gfx@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Bjorn Helgaas <bhelgaas@google.com>,
 Helge Deller <deller@gmx.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jul 12, 2023 at 12:43:02AM +0800, Sui Jingfeng wrote:
> From: Sui Jingfeng <suijingfeng@loongson.cn>
> 
> This patch adds the aperture_contain_firmware_fb() function to do the
> determination. Unfortunately, due to the fact that the apertures list
> will be freed dynamically, the location and size information of the
> firmware FB will be lost after dedicated drivers call
> aperture_remove_conflicting_devices(),
> aperture_remove_conflicting_pci_devices() or
> aperture_remove_all_conflicting_devices() functions

> We solve this problem by introducing two static variables that record the
> firmware framebuffer's start addrness and end addrness. It assumes that the
> system has only one active firmware framebuffer driver at a time. We don't
> use the global structure screen_info here, because PCI resources may get
> reallocated (the VRAM BAR could be moved) during the kernel boot stage.

s/addrness/address/ (twice)
