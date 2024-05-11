Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 083CF8C31FF
	for <lists+dri-devel@lfdr.de>; Sat, 11 May 2024 17:02:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94A7F10E07B;
	Sat, 11 May 2024 15:02:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="EOQJlBLk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C333910E07B
 for <dri-devel@lists.freedesktop.org>; Sat, 11 May 2024 15:02:35 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id E1EBB612F5;
 Sat, 11 May 2024 15:02:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1CCBCC2BBFC;
 Sat, 11 May 2024 15:02:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1715439754;
 bh=MZAWv/ScyEBJVD21IicPp5L10HCN0chmKIi6qdoF9E0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=EOQJlBLkU83hwtxIzoRrpInNyQTz0MO/2OhNMD2dLwkHCxFfjmMQ5NiQmctLMLTWk
 Il6ktAJwEbqlKLiSm3cUHjNhMTy/XdqXbtUMFW2Umkx9EpwkBrkN+EVdeW+O6qXEAq
 vqK6X61CaKrd2Z3hruLVZy4nU+9MyLljT7j4Qc5Zy/4i4FhOcEXXyNBpkJiZ5vMLON
 vAjOzytqc+LdsIBpL9Hcd+ORNqxpTDuUe0y596Dd9TKtRNuuGwQtEkfB3LVFOmCp+n
 PlpZuRVhpeVaCcWF5ta1lHDGzebwXWHQ5graYzlNckH2mcii1gkgJPNWDb5/Tg14hg
 OaHIGXKF2hJQQ==
Date: Sat, 11 May 2024 16:02:25 +0100
From: Simon Horman <horms@kernel.org>
To: Alexey Makhalov <alexey.makhalov@broadcom.com>
Cc: linux-kernel@vger.kernel.org, virtualization@lists.linux.dev,
 bp@alien8.de, hpa@zytor.com, dave.hansen@linux.intel.com,
 mingo@redhat.com, tglx@linutronix.de, x86@kernel.org,
 netdev@vger.kernel.org, richardcochran@gmail.com,
 linux-input@vger.kernel.org, dmitry.torokhov@gmail.com,
 zackr@vmware.com, linux-graphics-maintainer@vmware.com,
 pv-drivers@vmware.com, timothym@vmware.com, akaher@vmware.com,
 dri-devel@lists.freedesktop.org, daniel@ffwll.ch, airlied@gmail.com,
 tzimmermann@suse.de, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, kirill.shutemov@linux.intel.com,
 Nadav Amit <nadav.amit@gmail.com>, Jeff Sipek <jsipek@vmware.com>
Subject: Re: [PATCH v9 3/8] x86/vmware: Introduce VMware hypercall API
Message-ID: <20240511150225.GK2347895@kernel.org>
References: <20240505182829.GBZjfPzeEijTsBUth5@fat_crate.local>
 <20240506215305.30756-1-alexey.makhalov@broadcom.com>
 <20240506215305.30756-4-alexey.makhalov@broadcom.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240506215305.30756-4-alexey.makhalov@broadcom.com>
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

On Mon, May 06, 2024 at 02:53:00PM -0700, Alexey Makhalov wrote:
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
> Signed-off-by: Alexey Makhalov <alexey.makhalov@broadcom.com>
> Reviewed-by: Nadav Amit <nadav.amit@gmail.com>
> Reviewed-by: Jeff Sipek <jsipek@vmware.com>

...

> diff --git a/arch/x86/include/asm/vmware.h b/arch/x86/include/asm/vmware.h

...

> +static inline
> +unsigned long vmware_hypercall3(unsigned long cmd, unsigned long in1,
> +				uint32_t *out1, uint32_t *out2)

nit: u32 is preferred over uint32_t.
     Likewise elsewhere in this patch-set.
...

>  /*
> - * The high bandwidth in call. The low word of edx is presumed to have the
> - * HB bit set.
> + * High bandwidth calls are not supported on encrypted memory guests.
> + * The caller should check cc_platform_has(CC_ATTR_MEM_ENCRYPT) and use
> + * low bandwidth hypercall it memory encryption is set.
> + * This assumption simplifies HB hypercall impementation to just I/O port

nit: implementation

     checkpatch.pl --codespell is your friend

> + * based approach without alternative patching.
>   */

...
