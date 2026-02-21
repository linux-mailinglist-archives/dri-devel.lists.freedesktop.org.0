Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GHLOC1FGmWnySQMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sat, 21 Feb 2026 06:44:49 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8781E16C359
	for <lists+dri-devel@lfdr.de>; Sat, 21 Feb 2026 06:44:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B58E910E00E;
	Sat, 21 Feb 2026 05:44:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="FGeGjp6V";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48CF189D99;
 Sat, 21 Feb 2026 05:44:44 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 9E94760053;
 Sat, 21 Feb 2026 05:44:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 879CFC4CEF7;
 Sat, 21 Feb 2026 05:44:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1771652683;
 bh=L0S8drGWjFk6KEnAO+uGBlVcUrNdz/CeGlNCcbnoA1Y=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=FGeGjp6VPnsHmAVNPUV0tpR0QUOyFc7QdjEVCNB//xXzNBNvujs8fGBLOtelRkCB5
 gB2WbjBctG8Bt3MLYA63wkar1KgTdB0GrLfFV1ptUwqI1Vas+6QaDrGmIgvPTH02jN
 9rWLVLv+iVq4cJmRote93aYm9RjEGH/odHKNzk5I=
Date: Sat, 21 Feb 2026 06:44:40 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Joel Fernandes <joelagnelf@nvidia.com>
Cc: Danilo Krummrich <dakr@kernel.org>,
 Koen Koning <koen.koning@linux.intel.com>,
 dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 Matthew Auld <matthew.auld@intel.com>, Dave Airlie <airlied@redhat.com>,
 Peter Senna Tschudin <peter.senna@linux.intel.com>, stable@vger.kernel.org
Subject: Re: [PATCH v3 1/3] gpu/buddy: fix module_init() usage
Message-ID: <2026022156-citizen-shredding-5d6d@gregkh>
References: <DGJPMOESHINC.1NGNT8LLY8DKW@kernel.org>
 <1771594440.99434@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1771594440.99434@nvidia.com>
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.19 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	TAGGED_RCPT(0.00)[dri-devel];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linuxfoundation.org:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 8781E16C359
X-Rspamd-Action: no action

On Fri, Feb 20, 2026 at 08:55:52AM -0500, Joel Fernandes wrote:
> > On Feb 20, 2026, at 5:17 AM, Danilo Krummrich <dakr@kernel.org> wrote:
> > 
> > ﻿On Fri Feb 20, 2026 at 7:06 AM CET, Greg KH wrote:
> >>> On Thu, Feb 19, 2026 at 10:38:56PM +0100, Koen Koning wrote:
> >>> Use subsys_initcall() instead of module_init() (which compiles to
> >>> device_initcall() for built-ins) for buddy, so its initialization code
> >>> always runs before any (built-in) drivers.
> >>> This happened to work correctly so far due to the order of linking in
> >>> the Makefiles, but this should not be relied upon.
> >> 
> >> Same here, Makefile order can always be relied on.
> > 
> > I want to point out that Koen's original patch fixed the Makefile order:
> > 
> > diff --git a/drivers/gpu/Makefile b/drivers/gpu/Makefile
> > index 5cd54d06e262..b4e5e338efa2 100644
> > --- a/drivers/gpu/Makefile
> > +++ b/drivers/gpu/Makefile
> > @@ -2,8 +2,9 @@
> > # drm/tegra depends on host1x, so if both drivers are built-in care must be
> > # taken to initialize them in the correct order. Link order is the only way
> > # to ensure this currently.
> > +# Similarly, buddy must come first since it is used by other drivers.
> > +obj-$(CONFIG_GPU_BUDDY)    += buddy.o
> > obj-y            += host1x/ drm/ vga/ tests/
> > obj-$(CONFIG_IMX_IPUV3_CORE)    += ipu-v3/
> > obj-$(CONFIG_TRACE_GPU_MEM)        += trace/
> > obj-$(CONFIG_NOVA_CORE)        += nova-core/
> > -obj-$(CONFIG_GPU_BUDDY)        += buddy.o
> > 
> > He was then suggested to not rely on this and rather use subsys_initcall().
> 
> I take the blame for the suggestion; however, I am not yet convinced it is a bad
> idea. 
> > 
> > When I then came across the new patch using subsys_initcall() I made it worse; I
> > badly confused this with something else and gave a wrong advise -- sorry Koen!
> > 
> > (Of course, since this is all within the same subsystem, without any external
> > ordering contraints, Makefile order is sufficient.)
> 
> If we are still going to do the link ordering by reordering in the Makefile,
> may I ask what is the drawback of doing the alternative - that is, not
> relying on that (and its associated potential for breakage)?
> 
> Even if Makefile ordering can be relied on, why do we want to rely on it if
> there is an alternative? Also module_init() compiles to device_initcall() for
> built-ins and this is shared infra.
> 
> We use this technique in other code paths too, no? See
> drivers/i2c/i2c-core-base.c:
> 
>   /* We must initialize early, because some subsystems register i2c drivers
>    * in subsys_initcall() code, but are linked (and initialized) before i2c.
>    */
>   postcore_initcall(i2c_init);
> 
> If there is a drawback I am all ears but otherwise I would prefer the new
> patch tbh. 

The "problem" is that the init levels are very "coarse", and the link
order is very specific.  You can play with init levels a lot, but what
happens if another driver also sets to the same init level, or an
earlier one to try to solve something that way?

So it can be a loosing battle for many things, choose the best and
simplest solution, but always remember, Makefile order matters, which is
what I was wanting to correct here.

thanks,

greg k-h
