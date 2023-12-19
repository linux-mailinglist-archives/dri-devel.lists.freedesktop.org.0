Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87C82819482
	for <lists+dri-devel@lfdr.de>; Wed, 20 Dec 2023 00:23:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EF3310E237;
	Tue, 19 Dec 2023 23:23:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 244E710E237
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Dec 2023 23:23:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1703028212; x=1734564212;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=vS5AE7N9nQ3SlnVS08m4qPs43i9JpvyT0LdsYgBIZjI=;
 b=lgIdbIZ7ew6czjd6kxX4fknJ0sYdBUk5SZu5eacEcjDShbkQd8L5aYGJ
 k+LHxwz2cHuZZU3GbyRzPcyeNs/1XZ9/Ny/mdQzC06gOqbwPH7qEpMFHK
 KG7hn9ntEsGbYtXqQ6R5mF3Eqi5a06E1CbBe474Vza+H42fzHVDkH8RCn
 x3AyWVG1DgMAIRnsuW7yTBfbQ3jdMHji/uPrhTb/70Dc85QEoOQQUgFrC
 yAcU+F+EKknS2khAsjqzB4xNdhKTA9JFhPEsXUJQ4m04ra3IeIw2s7Wwh
 oujEbJYCY20N19eqjj3fjWntqAvC51FECYT9zGJbArHjglRY3keCfXaEh A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10929"; a="9196782"
X-IronPort-AV: E=Sophos;i="6.04,289,1695711600"; 
   d="scan'208";a="9196782"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2023 15:23:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,289,1695711600"; d="scan'208";a="10561229"
Received: from lveltman-mobl.ger.corp.intel.com (HELO box.shutemov.name)
 ([10.252.33.252])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2023 15:23:26 -0800
Received: by box.shutemov.name (Postfix, from userid 1000)
 id 1DC2210A43B; Wed, 20 Dec 2023 02:23:23 +0300 (+03)
Date: Wed, 20 Dec 2023 02:23:23 +0300
From: kirill.shutemov@linux.intel.com
To: Alexey Makhalov <alexey.makhalov@broadcom.com>
Subject: Re: [PATCH v3 6/6] x86/vmware: Add TDX hypercall support
Message-ID: <20231219232323.euweerulgsgbodx5@box.shutemov.name>
References: <20231219215751.9445-1-alexey.makhalov@broadcom.com>
 <20231219215751.9445-7-alexey.makhalov@broadcom.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231219215751.9445-7-alexey.makhalov@broadcom.com>
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
 airlied@gmail.com, timothym@vmware.com, x86@kernel.org, mingo@redhat.com,
 linux-graphics-maintainer@vmware.com, linux-input@vger.kernel.org,
 tzimmermann@suse.de, richardcochran@gmail.com, virtualization@lists.linux.dev,
 mripard@kernel.org, akaher@vmware.com, bp@alien8.de, jsipek@vmware.com,
 tglx@linutronix.de, netdev@vger.kernel.org, dmitry.torokhov@gmail.com,
 linux-kernel@vger.kernel.org, horms@kernel.org, zackr@vmware.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Dec 19, 2023 at 01:57:51PM -0800, Alexey Makhalov wrote:
> diff --git a/arch/x86/kernel/cpu/vmware.c b/arch/x86/kernel/cpu/vmware.c
> index 3aa1adaed18f..ef07ab7a07e1 100644
> --- a/arch/x86/kernel/cpu/vmware.c
> +++ b/arch/x86/kernel/cpu/vmware.c
> @@ -428,6 +428,30 @@ static bool __init vmware_legacy_x2apic_available(void)
>  		(eax & BIT(VCPU_LEGACY_X2APIC));
>  }
>  
> +#ifdef CONFIG_INTEL_TDX_GUEST
> +unsigned long vmware_tdx_hypercall(unsigned long cmd,
> +				   struct tdx_module_args *args)
> +{
> +	if (!hypervisor_is_type(X86_HYPER_VMWARE))
> +		return 0;
> +
> +	if (cmd & ~VMWARE_CMD_MASK) {
> +		pr_warn("Out of range command %x\n", cmd);
> +		return 0;

Is zero success? Shouldn't it be an error?

> +	}
> +
> +	args->r10 = VMWARE_TDX_VENDOR_LEAF;
> +	args->r11 = VMWARE_TDX_HCALL_FUNC;
> +	args->r12 = VMWARE_HYPERVISOR_MAGIC;
> +	args->r13 = cmd;
> +
> +	__tdx_hypercall(args);
> +
> +	return args->r12;
> +}
> +EXPORT_SYMBOL_GPL(vmware_tdx_hypercall);
> +#endif
> +
>  #ifdef CONFIG_AMD_MEM_ENCRYPT
>  static void vmware_sev_es_hcall_prepare(struct ghcb *ghcb,
>  					struct pt_regs *regs)
> -- 
> 2.39.0
> 

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
