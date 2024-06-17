Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5857290BCC7
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jun 2024 23:18:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B51C910E0FA;
	Mon, 17 Jun 2024 21:18:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (4096-bit key; unprotected) header.d=alien8.de header.i=@alien8.de header.b="UM8T/G+l";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73DC210E0FA
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2024 21:18:30 +0000 (UTC)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 73A3D40E01F9; 
 Mon, 17 Jun 2024 21:18:28 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
 header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
 by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id tde_eHHVuoG1; Mon, 17 Jun 2024 21:18:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
 t=1718659105; bh=yK+oTJoi5DGuEHt6jESCPtqmrBbsMm4vga3QYTDWOxs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=UM8T/G+lPTeB4SuRGoE9vf9I0FOvyUQYpL1yVCD9HjVhLj3m6C9Px/9ZAaCG3oD9r
 7GNAh0JUIAYea7bhql07cHV4dy7cg4qq1KsW+KGO3fkl41zA+tu3W+AyfTL8EkS865
 Geg/Tl0Uoy5Uru/g1xSLXiHlZ7wKhnjK5kXtfeE4Xt8xmDG3qn9uX96v0Zvc0jKdj8
 nQZ0omgR81Zf4qk9Jc/q4x9DOuPCoj+Y+OiLyCk95I8JTQ1g2b7zQ7uE0A7nTRFdAw
 xdHSIhxRABsU5W5jPbFXRk++KLT3cysJwxZj8Npn1S1kPtEnzrqMMsPD7ilEFMF6Pj
 uL212OxyfMOFSX8pnLYfuSWIB3NLrASeQBTTN5/+SUF0fMP/NZUsfWc6f7I3rOZ9hA
 dGwTvdoT4jHyq/hJ5HxV97DYtJI/hxvXvFTv8g3XhDl63gqx3Rbdz52juifyYrycjN
 V3Tr6oX9GkotHVirBjsLg8XZgA6nOWUOWovabnqKFpSWBJI1GOlgEkfeQuIaO0vwK2
 qAQUwBnGHKYEb9CZYXJfTi95JVErV6fUHDHj911kk9KF68/TdALRWEGR5XXGsV5FxI
 gOmnUB/5NcsdYd4qKHxKveeHHSSZNZUG1j8hAymip8/kS+5pXjo2KrJsh9No6ALasN
 2wfhgOcsSqKNmIrzdJN9Hz0w=
Received: from zn.tnic (p5de8ee85.dip0.t-ipconnect.de [93.232.238.133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest
 SHA256) (No client certificate requested)
 by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id EAB3E40E0185;
 Mon, 17 Jun 2024 21:18:04 +0000 (UTC)
Date: Mon, 17 Jun 2024 23:17:58 +0200
From: Borislav Petkov <bp@alien8.de>
To: Alexey Makhalov <alexey.makhalov@broadcom.com>
Cc: linux-kernel@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com,
 lkp@intel.com, zack.rusin@broadcom.com,
 dri-devel@lists.freedesktop.org, daniel@ffwll.ch, airlied@gmail.com,
 tzimmermann@suse.de, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, linux-iio@vger.kernel.org,
 jic23@kernel.org, lars@metafoo.de, nuno.sa@analog.com,
 dragos.bogdan@analog.com, anshulusr@gmail.com,
 andrea.collamati@gmail.com, oe-kbuild-all@lists.linux.dev, x86@kernel.org
Subject: Re: [PATCH 1/2] drm/vmwgfx: Fix missing HYPERVISOR_GUEST dependency
Message-ID: <20240617211758.GKZnCoBvT2enGx5p5r@fat_crate.local>
References: <202406152104.FxakP1MB-lkp@intel.com>
 <20240616012511.198243-1-alexey.makhalov@broadcom.com>
 <20240617090709.GCZm_8vdnLzt048UH_@fat_crate.local>
 <0a29389e-8ba2-48c5-bb26-381de58a62fb@broadcom.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <0a29389e-8ba2-48c5-bb26-381de58a62fb@broadcom.com>
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

On Mon, Jun 17, 2024 at 01:51:23PM -0700, Alexey Makhalov wrote:
> Not really a gcc related, but the matter of a config file. It is
> reproducible if CONFIG_HYPERVISOR_GUEST not set, but CONFIG_DRM_VMWGFX=y.
> And this combination was allowed before the fix.

Using their config:

$ grep -E "(CONFIG_DRM_VMWGFX|CONFIG_HYPERVISOR_GUEST)" .config
# CONFIG_HYPERVISOR_GUEST is not set
CONFIG_DRM_VMWGFX=y
CONFIG_DRM_VMWGFX_MKSSTATS=y

$ make ...

  OBJCOPY arch/x86/boot/setup.bin
  BUILD   arch/x86/boot/bzImage
Kernel: arch/x86/boot/bzImage is ready  (#2)
$ gcc --version
gcc (Debian 13.2.0-25) 13.2.0
$

So no, I can't reproduce with my compiler.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
