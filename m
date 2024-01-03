Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 406BB823132
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jan 2024 17:24:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E355510E155;
	Wed,  3 Jan 2024 16:24:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90A3C10E155
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Jan 2024 16:24:13 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id A89CACE16C9;
 Wed,  3 Jan 2024 16:24:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9D1FC433C7;
 Wed,  3 Jan 2024 16:24:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1704299050;
 bh=oDxUJ0csC6lWNRIuyYFs6Gg2tiCMbVHu/gNkuWzoWzM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NKpfvShb6tkMIJpN0xEoI1S0zR4aLeaRArZwkobSudX3RkKpGjhNHy7iR044qE4HK
 zvd6GWk3J7PgtL/GHT0G+bH7zAu57/uWcaWQpl5nx7+3IBolmGkmWRh77k32S1xFb9
 xvQV48hg5VbrUz/0abaminyQw6+uu42GfcWgX792V6X4CooopX/mcrkaLa9KuEQK7a
 OCwGZ8d3eQJGe7BxWsFYgxw5etLbuRKscIsP8BJuXk6bD4qyHF2joQcWgyl9H5PftA
 syayVLlMizbNxE4C5uOh4kdVTMjdA5sia4spSl9GLJz4Mi8zT7Fg2MATiYcCUxvmij
 enitnIElliOow==
Date: Wed, 3 Jan 2024 16:24:02 +0000
From: Simon Horman <horms@kernel.org>
To: Alexey Makhalov <alexey.makhalov@broadcom.com>
Subject: Re: [PATCH v4 2/6] x86/vmware: Introduce VMware hypercall API
Message-ID: <20240103162402.GA31813@kernel.org>
References: <20231228192421.29894-1-alexey.makhalov@broadcom.com>
 <20231228192421.29894-3-alexey.makhalov@broadcom.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231228192421.29894-3-alexey.makhalov@broadcom.com>
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
Cc: pv-drivers@vmware.com, dave.hansen@linux.intel.com,
 dri-devel@lists.freedesktop.org, namit@vmware.com, hpa@zytor.com,
 timothym@vmware.com, x86@kernel.org, mingo@redhat.com,
 linux-graphics-maintainer@vmware.com, linux-input@vger.kernel.org,
 tzimmermann@suse.de, richardcochran@gmail.com, virtualization@lists.linux.dev,
 mripard@kernel.org, akaher@vmware.com, bp@alien8.de, jsipek@vmware.com,
 tglx@linutronix.de, netdev@vger.kernel.org, dmitry.torokhov@gmail.com,
 linux-kernel@vger.kernel.org, kirill.shutemov@linux.intel.com,
 zackr@vmware.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Dec 28, 2023 at 11:24:17AM -0800, Alexey Makhalov wrote:
> From: Alexey Makhalov <amakhalov@vmware.com>
> 
> Introduce vmware_hypercall family of functions. It is a common
> implementation to be used by the VMware guest code and virtual
> device drivers in architecture independent manner.
> 
> The API consists of vmware_hypercallX and vmware_hypercall_hb_{out,in}
> set of functions by analogy with KVM hypercall API. Architecture
> specific implementation is hidden inside.
> 
> It will simplify future enhancements in VMware hypercalls such
> as SEV-ES and TDX related changes without needs to modify a
> caller in device drivers code.
> 
> Current implementation extends an idea from commit bac7b4e84323
> ("x86/vmware: Update platform detection code for VMCALL/VMMCALL
> hypercalls") to have a slow, but safe path in VMWARE_HYPERCALL
> earlier during the boot when alternatives are not yet applied.
> This logic was inherited from VMWARE_CMD from the commit mentioned
> above. Default alternative code was optimized by size to reduce
> excessive nop alignment once alternatives are applied. Total
> default code size is 26 bytes, in worse case (3 bytes alternative)
> remaining 23 bytes will be aligned by only 3 long NOP instructions.
> 
> Signed-off-by: Alexey Makhalov <amakhalov@vmware.com>
> Reviewed-by: Nadav Amit <namit@vmware.com>
> Reviewed-by: Jeff Sipek <jsipek@vmware.com>

Hi Alexey,

I'd like to flag that this breaks gcc-13 x86_64 allmodconfig builds of the
following files. And although this is resolved by the subsequent 3 patches
in this series, it does still break bisection.

 drivers/gpu/drm/vmwgfx/vmwgfx_msg.c
 drivers/input/mouse/vmmouse.c
 drivers/ptp/ptp_vmw.c

...
