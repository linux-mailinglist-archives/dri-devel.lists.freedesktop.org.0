Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C2DD908FCD
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2024 18:14:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D5AD10E088;
	Fri, 14 Jun 2024 16:14:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (4096-bit key; unprotected) header.d=alien8.de header.i=@alien8.de header.b="iZBd8+jP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9773910E088
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2024 16:14:44 +0000 (UTC)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 2FE7A40E019F; 
 Fri, 14 Jun 2024 16:14:40 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
 header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
 by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id 6wf_wZH5Ifv4; Fri, 14 Jun 2024 16:14:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
 t=1718381677; bh=i2Oov2b/x7FRTX2KE+EloDSI1YULDDwDpYnfJIwHGJE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=iZBd8+jPngmiZb77P8mi6r7eRQtBh4h9gbPdm6FJabEDpaE6/+HzqqWZJw5Thr2GN
 Vj+ctIZT7b+eEvcBV4iqtgJsFoo39TWSCZJlGVELqkLcmGXi6zp4YbzqinkqBHrasA
 /+nuxMuwHR2gClm3uYzPTVwXzDrjVPOH7s8nqZk0eUQ0tRWo9Y84kOWt3RVz7MZPvq
 EypI+ADjwmqcT3if6YAYnQGldPMWQ3qM91lVdQKJYemC2e6ySo7sXeU0AvCOYSzfRJ
 QqMvDkOun8hGXfLPutsqMekWnqgsffzsLaGPSV8nSZhL4hAYrdnlfmswwvDYmCEeBm
 oNV6lsqmFV5TwQXrpu7OA4hgze+qjHgJ5yQnLFoOdmZQIiyW7wFzrbL4hO1qme6FZ4
 VhN2d6eUULdMgP6Y+6A/Yw3Ex0Cfc3r0pUIMk0oacL9T8dQtQ1Q/2S+dvnkTVvwH12
 BlRrX+ALNJMmw6dDAPemqvDUWrc4an16PRliARVl6VFGT3K9UcZFEQED5blrBfu2sn
 SDIzmIppS5IQzJjy5a7IbGoHR5zjeEshCmHz8oKq5nOR6340YfM/tcEsS0Ov8dM0l0
 Gqm1qYxxDVqAvB3HoOo965IKG/AKtBdPNrK2rdYkjMitOo4O2MpCyUkmCstYJ5Uo7e
 pWxN9W+gGhj1uFhFunJqQjjw=
Received: from zn.tnic (p5de8ee85.dip0.t-ipconnect.de [93.232.238.133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest
 SHA256) (No client certificate requested)
 by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 9990440E00C9;
 Fri, 14 Jun 2024 16:14:09 +0000 (UTC)
Date: Fri, 14 Jun 2024 18:14:04 +0200
From: Borislav Petkov <bp@alien8.de>
To: Dave Hansen <dave.hansen@intel.com>
Cc: Alexey Makhalov <alexey.makhalov@broadcom.com>,
 linux-kernel@vger.kernel.org, virtualization@lists.linux.dev,
 hpa@zytor.com, dave.hansen@linux.intel.com, mingo@redhat.com,
 tglx@linutronix.de, x86@kernel.org, netdev@vger.kernel.org,
 richardcochran@gmail.com, linux-input@vger.kernel.org,
 dmitry.torokhov@gmail.com, zackr@vmware.com,
 linux-graphics-maintainer@vmware.com, pv-drivers@vmware.com,
 timothym@vmware.com, akaher@vmware.com,
 dri-devel@lists.freedesktop.org, daniel@ffwll.ch, airlied@gmail.com,
 tzimmermann@suse.de, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, horms@kernel.org,
 kirill.shutemov@linux.intel.com,
 Tim Merrifield <tim.merrifield@broadcom.com>
Subject: Re: [PATCH v11 8/8] x86/vmware: Add TDX hypercall support
Message-ID: <20240614161404.GCZmxsTNLSoYTqoRoj@fat_crate.local>
References: <20240613191650.9913-1-alexey.makhalov@broadcom.com>
 <20240613191650.9913-9-alexey.makhalov@broadcom.com>
 <844ef200-aabe-4497-85c9-44fc46c9133a@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <844ef200-aabe-4497-85c9-44fc46c9133a@intel.com>
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

On Fri, Jun 14, 2024 at 09:03:22AM -0700, Dave Hansen wrote:
> On 6/13/24 12:16, Alexey Makhalov wrote:
> > +unsigned long vmware_tdx_hypercall(unsigned long cmd,
> > +				   unsigned long in1, unsigned long in3,
> > +				   unsigned long in4, unsigned long in5,
> > +				   u32 *out1, u32 *out2, u32 *out3,
> > +				   u32 *out4, u32 *out5)
> > +{
> > +	struct tdx_module_args args;
> > +
> > +	if (!hypervisor_is_type(X86_HYPER_VMWARE)) {
> > +		pr_warn_once("Incorrect usage\n");
> > +		return ULONG_MAX;
> > +	}
> > +
> > +	if (cmd & ~VMWARE_CMD_MASK) {
> > +		pr_warn_once("Out of range command %lx\n", cmd);
> > +		return ULONG_MAX;
> > +	}
> > +
> > +	args.rbx = in1;
> > +	args.rdx = in3;
> > +	args.rsi = in4;
> > +	args.rdi = in5;
> > +	args.r10 = VMWARE_TDX_VENDOR_LEAF;
> > +	args.r11 = VMWARE_TDX_HCALL_FUNC;
> > +	args.r12 = VMWARE_HYPERVISOR_MAGIC;
> > +	args.r13 = cmd;
> > +	args.r15 = 0; /* CPL */
> 
> I believe this leaks stack data into the hypervisor.  Or did I miss the
> zeroing of rcx/r8/r9/r14?
> 
> You need to zero out all of 'args' somehow.

You mean like this:

	struct tdx_module_args args = {};

?

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
