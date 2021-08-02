Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FE703DD42D
	for <lists+dri-devel@lfdr.de>; Mon,  2 Aug 2021 12:45:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C5EE6E57E;
	Mon,  2 Aug 2021 10:45:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from theia.8bytes.org (8bytes.org
 [IPv6:2a01:238:4383:600:38bc:a715:4b6d:a889])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E4426E57E;
 Mon,  2 Aug 2021 10:45:26 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id A1662379; Mon,  2 Aug 2021 12:45:24 +0200 (CEST)
Date: Mon, 2 Aug 2021 12:45:23 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Tom Lendacky <thomas.lendacky@amd.com>
Cc: linux-kernel@vger.kernel.org, x86@kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org,
 iommu@lists.linux-foundation.org, kvm@vger.kernel.org,
 linux-efi@vger.kernel.org, platform-driver-x86@vger.kernel.org,
 linux-graphics-maintainer@vmware.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, kexec@lists.infradead.org,
 linux-fsdevel@vger.kernel.org, Borislav Petkov <bp@alien8.de>,
 Brijesh Singh <brijesh.singh@amd.com>, Andi Kleen <ak@linux.intel.com>,
 Sathyanarayanan Kuppuswamy <sathyanarayanan.kuppuswamy@linux.intel.com>,
 Tianyu Lan <Tianyu.Lan@microsoft.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>
Subject: Re: [PATCH 06/11] x86/sev: Replace occurrences of sev_es_active()
 with prot_guest_has()
Message-ID: <YQfMw2FRO5M1osGF@8bytes.org>
References: <cover.1627424773.git.thomas.lendacky@amd.com>
 <ba565128b88661a656fc3972f01bb2e295158a15.1627424774.git.thomas.lendacky@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ba565128b88661a656fc3972f01bb2e295158a15.1627424774.git.thomas.lendacky@amd.com>
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

On Tue, Jul 27, 2021 at 05:26:09PM -0500, Tom Lendacky wrote:
> @@ -48,7 +47,7 @@ static void sme_sev_setup_real_mode(struct trampoline_header *th)
>  	if (prot_guest_has(PATTR_HOST_MEM_ENCRYPT))
>  		th->flags |= TH_FLAGS_SME_ACTIVE;
>  
> -	if (sev_es_active()) {
> +	if (prot_guest_has(PATTR_GUEST_PROT_STATE)) {
>  		/*
>  		 * Skip the call to verify_cpu() in secondary_startup_64 as it
>  		 * will cause #VC exceptions when the AP can't handle them yet.

Not sure how TDX will handle AP booting, are you sure it needs this
special setup as well? Otherwise a check for SEV-ES would be better
instead of the generic PATTR_GUEST_PROT_STATE.

Regards,

Joerg
