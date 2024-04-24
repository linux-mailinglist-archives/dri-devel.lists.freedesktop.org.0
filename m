Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AFC1C8B0F82
	for <lists+dri-devel@lfdr.de>; Wed, 24 Apr 2024 18:15:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B52EE113C59;
	Wed, 24 Apr 2024 16:15:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (4096-bit key; unprotected) header.d=alien8.de header.i=@alien8.de header.b="QWF3TD5D";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 538 seconds by postgrey-1.36 at gabe;
 Wed, 24 Apr 2024 16:15:45 UTC
Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 285B4113C59
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Apr 2024 16:15:45 +0000 (UTC)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 3C07440E0177; 
 Wed, 24 Apr 2024 16:06:44 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
 header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
 by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id a1whXnU_urG2; Wed, 24 Apr 2024 16:06:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
 t=1713974800; bh=eT/sJrq6XNpXYldhLxOFeSR6n1DYq3NDJUftCdjBaNE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=QWF3TD5DfjsDxjpmOqQmkDBvJqmy2ArfExGwOQxTl1ZUOlBsHM9dtYnlQhG69Fb/7
 iE8KAkqTm0OoHa0sqEnqNWcuhISoAq6YJGJLh2CTI2HJoTz0gwL3sxig0eL2t+XY2M
 7wcaIOfeHdUmZE9oVDfrIbgjpsMl6j0NStBevpmYsILuDiK2NinFpnprFt/Kj8uVA+
 CgGjjZ6BKlhY91FWBu4lXYHoICXTM/XrlbZghwGMPwi39FaWBenySPfMaq7snqnjLK
 DHGyOx9XcOjdHxhTvqrGTHO6iAOOp87i4FR5e4l8X/niXuR8947AHiBMYDsv+0p+ie
 t5by9FFOxn4v6FEVb6CCDgwFRUmOGmr9k5AGdoH/POcu1MD+4/6NYOsUNYV5EDjOg5
 PPfjXhZSgcHT6hAu1FyqGHmnFr86tOFQDX/vQ0hzX5nqQ/zkc40g+B1+8fLb8NhoeS
 sgaTO3Iq/7BGdS5CLYN1eCV/iCM3MzN8rlDKiRcnn3IIlulziuBtI2Sv48bI4kC/Xl
 AOXtU65xrJi/MHNBROsVykmeh3rLJlX0/ypKzomYRUxao3j+puNaybZVeElC4NGJWW
 ciPuepgMBQQkbIYhb89WOO2YsKOgl5TanEh8YSI9J8FxddQFkWw/8nsJP1lF9kclVP
 nGSR16o2/oCj2/GI5CzL2t9k=
Received: from zn.tnic (pd953020b.dip0.t-ipconnect.de [217.83.2.11])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest
 SHA256) (No client certificate requested)
 by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id C440840E0192;
 Wed, 24 Apr 2024 16:06:13 +0000 (UTC)
Date: Wed, 24 Apr 2024 18:06:08 +0200
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
 kirill.shutemov@linux.intel.com, Nadav Amit <nadav.amit@gmail.com>
Subject: Re: [PATCH v8 1/7] x86/vmware: Move common macros to vmware.h
Message-ID: <20240424160608.GFZikt8JLrTN4M5PG2@fat_crate.local>
References: <20240422225656.10309-1-alexey.makhalov@broadcom.com>
 <20240422225656.10309-2-alexey.makhalov@broadcom.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240422225656.10309-2-alexey.makhalov@broadcom.com>
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

On Mon, Apr 22, 2024 at 03:56:50PM -0700, Alexey Makhalov wrote:
> Move VMware hypercall macros to vmware.h. This is a prerequisite for
> the introduction of vmware_hypercall API. No functional changes besides
> exporting vmware_hypercall_mode symbol.

Well, I see more.

So code movement patches should be done this way:

* first patch: sole code movement, no changes whatsoever

* follow-on patches: add changes and explain them

Because... (follow me down)...

> @@ -476,8 +431,8 @@ static bool __init vmware_legacy_x2apic_available(void)
>  {
>  	uint32_t eax, ebx, ecx, edx;
>  	VMWARE_CMD(GETVCPU_INFO, eax, ebx, ecx, edx);
> -	return !(eax & BIT(VMWARE_CMD_VCPU_RESERVED)) &&
> -		(eax & BIT(VMWARE_CMD_LEGACY_X2APIC));
> +	return !(eax & BIT(VCPU_RESERVED)) &&
> +		(eax & BIT(VCPU_LEGACY_X2APIC));

... what is that change for?

Those bit definitions are clearly vmware-specific. So why are you
changing them to something generic-ish?

In any case, this patch needs to be split as outlined above.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
