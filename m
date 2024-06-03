Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C58E8D8850
	for <lists+dri-devel@lfdr.de>; Mon,  3 Jun 2024 19:59:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B458310E264;
	Mon,  3 Jun 2024 17:59:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (4096-bit key; unprotected) header.d=alien8.de header.i=@alien8.de header.b="Z0ljThrM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E497010E264
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Jun 2024 17:59:22 +0000 (UTC)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id A806540E0081; 
 Mon,  3 Jun 2024 17:59:19 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
 header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
 by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id 7Mb5g9ACslUU; Mon,  3 Jun 2024 17:59:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
 t=1717437555; bh=JlEEXKm5UWyQVgXc+ZFdVI6RfV+Z9Mo9xPKI1O7Cj/w=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Z0ljThrMSGwn2+pIwvRGfY4P1x/K9CPSErW4n9pJLCn8Y9usR6cz1Pxul3L6qPZ6x
 hZqlTRRQmxKeMO+0DXg+hC+tOycLpm0Qi4XtHwWl7vL26jV9lAF+RxeTy0JvazhqoK
 Gnx+GE3YgXE98nNndiGi0Z6RTnvNlDMghQcHQgxI7dcb5rYYwCp6E8Xwmr5vqSdWBU
 MHKCeUqaMW7EhMCtIxACwZCwTaZ4q696+rdosl8Obj6V8kC4EeedKUeAV3fNU/ludx
 Rjv/0v3wPzp80gBayVRYGosrFPcq4w+Uhn1h4mbyJsWGfR68OZ/3RegBiz0gFqD/b1
 JB5oQA5AA/eTvr5lZZ9fiN/tf5pJIFuY1ZRz49vNGKLWnWeCLJ5UEw5vmUkzeLT6/B
 S2jf1RvAswwJw2IoQDg2ZLWO317dmCiyny+yAFHuY9U3eXculBCcQe8uU/IkKBBRXZ
 /gZUWgx+M4vXBvxhQWY+6+PiILAtfwu74Np7A1CzhBWADR4H5wy+IuxiOf84kcbKus
 +wzVHYJwi8awQS2Ihmr/p5yTZFpru9plvJK+b5KnKUII6NKYcMwbz3TyaXC7vasrzh
 0QOZrGn7PQDCbmkFpedLVjCJPs8TiSHKOuYBVS3pd9JZe8kF6kuLDAeynIMcYUdhmD
 Bfx5erMdRVCP2a/JiVMogeMM=
Received: from zn.tnic (p5de8ee85.dip0.t-ipconnect.de [93.232.238.133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest
 SHA256) (No client certificate requested)
 by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id D165940E016C;
 Mon,  3 Jun 2024 17:58:49 +0000 (UTC)
Date: Mon, 3 Jun 2024 19:58:44 +0200
From: Borislav Petkov <bp@alien8.de>
To: Alexey Makhalov <alexey.makhalov@broadcom.com>
Cc: linux-kernel@vger.kernel.org, virtualization@lists.linux.dev,
 hpa@zytor.com, dave.hansen@linux.intel.com, mingo@redhat.com,
 tglx@linutronix.de, x86@kernel.org, netdev@vger.kernel.org,
 richardcochran@gmail.com, linux-input@vger.kernel.org,
 dmitry.torokhov@gmail.com, zackr@vmware.com,
 linux-graphics-maintainer@vmware.com, pv-drivers@vmware.com,
 timothym@vmware.com, akaher@vmware.com,
 dri-devel@lists.freedesktop.org, daniel@ffwll.ch, airlied@gmail.com,
 tzimmermann@suse.de, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, horms@kernel.org,
 kirill.shutemov@linux.intel.com
Subject: Re: [PATCH v10 1/8] x86/vmware: Introduce VMware hypercall API
Message-ID: <20240603175844.GKZl4EVGUxp2aQZnYJ@fat_crate.local>
References: <20240523191446.54695-1-alexey.makhalov@broadcom.com>
 <20240523191446.54695-2-alexey.makhalov@broadcom.com>
 <20240527170734.GCZlS91uXD68HRN1na@fat_crate.local>
 <9ca6230c-740c-4f1a-8fdf-73f74cf025a1@broadcom.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <9ca6230c-740c-4f1a-8fdf-73f74cf025a1@broadcom.com>
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

On Wed, May 29, 2024 at 05:44:32PM -0700, Alexey Makhalov wrote:
> While most of the vmware_hypercall callers are executed after alternative
> patching applied, there are small amount of hypercalls running before that.
> Only for them we have the logic of analyzing vmware_hypercall_mode as a
> default alternative code. And there are 2 constraints:
> 1. vmcall/vmmcall are not supported by old ESXi/Workstation/Fusion. We have
> to use in/out instructions. After the end of support of old hypervisors the
> alternative can be simplified as follow:
> ALTERNATIVE("vmcall", "vmmcall", X86_FEATURE_VMW_VMMCALL);
> 2. SEV-ES enabled VMs should use _only_ vmcall/vmmcall as in/out
> instructions cause faults.
> 
> Another approach that we discussed internally was to use
> ALTERNATIVE_2("movw %[port], %%dx; "inl (%%dx), %%eax", "vmcall",
> X86_FEATURE_VMW_VMCALL, "vmmcall", X86_FEATURE_VMW_VMMCALL) for
> vmware_hypercallX family of functions, _and_ to have a separate API
> vmware_sev_hypercallX, with the silly dance without an alternative inside,
> to be used only by early boot code, before alternative application. But,
> it's error prone when things come to boot time related code movements or
> rearrangements as it puts additional requirement for SEV-ES
> understanding/testing for VMware guests.

Right, so since we're exporting that alternatives_patched thing already,
you might also try to do:

	if (unlikely(!alternatives_patched))
		return slow_hypercall_X_in_c();

	asm_inline volatile(VMWARE_HYPERCALL...

where that slow_hypercall_X_in_c()* set of APIs does the checks in C.

And the VMWARE_HYPERCALL thing is a lot simpler then.

All in all, you'll have a lot less unreadable asm to pay attention to
and those APIs should be all easy and readable.

But in the end of the day, your call.

Thanks for explaining the situation.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
