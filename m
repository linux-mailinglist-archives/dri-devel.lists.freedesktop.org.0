Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 36E8F81960A
	for <lists+dri-devel@lfdr.de>; Wed, 20 Dec 2023 02:00:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B7D610E263;
	Wed, 20 Dec 2023 01:00:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F79E10E263
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Dec 2023 01:00:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1703034009; x=1734570009;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=gIKef6p2pnRwDgZPaAPbr3bSEyMzw577pOdpYRM0VGo=;
 b=er1d/tGhfDLuuaPgN1BFWmLPqYWd7FGILvBsEizAPPXNHVu6+GLKPMjN
 yl0qwNr1GBqKCn4SPAIZ7rEdzAKtv7yGdTXCykJ7gM2MIhJdb/SdrR0sZ
 Lmgxezjm0W4nYCXUhf654ZJU33qz1lLPiJl1hCElZtkiyj7Eqp7Eg+Kfy
 2CcVmVMDEwkKYhO8VWb4OnSgoSu3a0TGEXhsamUkBKCYYIqbZw2CUhH1g
 W0slSN1ag56izcefMws8J75aUarRuL48y/VNLC6u3JEwVSvAs8LLd3heb
 M322DR1W4FeHB0exJZBdJ9srxKmGlQhTy0e+w91GwWZ9MHyNIpYwXLytO g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10929"; a="392914602"
X-IronPort-AV: E=Sophos;i="6.04,290,1695711600"; d="scan'208";a="392914602"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2023 17:00:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10929"; a="846534858"
X-IronPort-AV: E=Sophos;i="6.04,290,1695711600"; d="scan'208";a="846534858"
Received: from lveltman-mobl.ger.corp.intel.com (HELO box.shutemov.name)
 ([10.252.33.252])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2023 17:00:03 -0800
Received: by box.shutemov.name (Postfix, from userid 1000)
 id 9C43A10A43B; Wed, 20 Dec 2023 04:00:00 +0300 (+03)
Date: Wed, 20 Dec 2023 04:00:00 +0300
From: kirill.shutemov@linux.intel.com
To: Alexey Makhalov <alexey.makhalov@broadcom.com>
Subject: Re: [PATCH v3 6/6] x86/vmware: Add TDX hypercall support
Message-ID: <20231220010000.y5ybey76xjckvh6y@box.shutemov.name>
References: <20231219215751.9445-1-alexey.makhalov@broadcom.com>
 <20231219215751.9445-7-alexey.makhalov@broadcom.com>
 <20231219232323.euweerulgsgbodx5@box.shutemov.name>
 <ba679460-827d-40b1-bc78-bcee1c013f36@broadcom.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ba679460-827d-40b1-bc78-bcee1c013f36@broadcom.com>
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

On Tue, Dec 19, 2023 at 04:27:51PM -0800, Alexey Makhalov wrote:
> 
> 
> On 12/19/23 3:23 PM, kirill.shutemov@linux.intel.com wrote:
> > On Tue, Dec 19, 2023 at 01:57:51PM -0800, Alexey Makhalov wrote:
> > > diff --git a/arch/x86/kernel/cpu/vmware.c b/arch/x86/kernel/cpu/vmware.c
> > > index 3aa1adaed18f..ef07ab7a07e1 100644
> > > --- a/arch/x86/kernel/cpu/vmware.c
> > > +++ b/arch/x86/kernel/cpu/vmware.c
> > > @@ -428,6 +428,30 @@ static bool __init vmware_legacy_x2apic_available(void)
> > >   		(eax & BIT(VCPU_LEGACY_X2APIC));
> > >   }
> > > +#ifdef CONFIG_INTEL_TDX_GUEST
> > > +unsigned long vmware_tdx_hypercall(unsigned long cmd,
> > > +				   struct tdx_module_args *args)
> > > +{
> > > +	if (!hypervisor_is_type(X86_HYPER_VMWARE))
> > > +		return 0;

BTW, don't you want to warn here to? We don't expect vmware hypercalls to
be called by non-vmware guest, do we?

> > > +
> > > +	if (cmd & ~VMWARE_CMD_MASK) {
> > > +		pr_warn("Out of range command %x\n", cmd);
> > > +		return 0;
> > 
> > Is zero success? Shouldn't it be an error?
> 
> VMware hypercalls do not have a standard way of signalling an error.
> To generalize expectations from the caller perspective of any existing
> hypercalls: error (including hypercall is not supported or disabled) is when
> return value is 0 and out1/2 are unchanged or equal to in1/in2.

You are talking about signaling errors over hypercall transport. But if
kernel can see that something is wrong why cannot it signal the issue
clearly to caller. It is going to be in-kernel convention.

And to very least, it has to be pr_warn_once().

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
