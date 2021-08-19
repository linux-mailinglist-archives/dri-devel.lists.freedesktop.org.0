Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E63D63F1F0D
	for <lists+dri-devel@lfdr.de>; Thu, 19 Aug 2021 19:26:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D65A26E9B9;
	Thu, 19 Aug 2021 17:26:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.skyhub.de (mail.skyhub.de [IPv6:2a01:4f8:190:11c2::b:1457])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F8D06E9B9;
 Thu, 19 Aug 2021 17:25:58 +0000 (UTC)
Received: from zn.tnic (p200300ec2f0f6a00894cffc8901d9ad3.dip0.t-ipconnect.de
 [IPv6:2003:ec:2f0f:6a00:894c:ffc8:901d:9ad3])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 2D09E1EC04F3;
 Thu, 19 Aug 2021 19:25:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
 t=1629393952;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
 bh=/gAtsE7QtBH5j9ttL3SuPKWfuXAyQgTTaUQCvmLoufU=;
 b=QQBp8NHuP+11G06yi7BdGA+HaVdnbkry0TMbR80aBtGTWa+AS2GGnsUl92jeGasIkZJxjG
 vbA27TU+69/cDt/R71KHjVUhLNS00XEkqnozCdieagZOK0jWv65x9AAvusLIXItaBgTbsA
 IoE8XMNOekYHfnDaNqS/LMVqj09wsDs=
Date: Thu, 19 Aug 2021 19:26:31 +0200
From: Borislav Petkov <bp@alien8.de>
To: Christoph Hellwig <hch@infradead.org>
Cc: Tom Lendacky <thomas.lendacky@amd.com>, linux-kernel@vger.kernel.org,
 x86@kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-s390@vger.kernel.org, iommu@lists.linux-foundation.org,
 kvm@vger.kernel.org, linux-efi@vger.kernel.org,
 platform-driver-x86@vger.kernel.org,
 linux-graphics-maintainer@vmware.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, kexec@lists.infradead.org,
 linux-fsdevel@vger.kernel.org, Brijesh Singh <brijesh.singh@amd.com>,
 Joerg Roedel <joro@8bytes.org>, Andi Kleen <ak@linux.intel.com>,
 Sathyanarayanan Kuppuswamy <sathyanarayanan.kuppuswamy@linux.intel.com>,
 Tianyu Lan <Tianyu.Lan@microsoft.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Joerg Roedel <jroedel@suse.de>
Subject: Re: [PATCH v2 03/12] x86/sev: Add an x86 version of prot_guest_has()
Message-ID: <YR6UR9JWD6l6z9Cn@zn.tnic>
References: <cover.1628873970.git.thomas.lendacky@amd.com>
 <7d55bac0cf2e73f53816bce3a3097877ed9663f3.1628873970.git.thomas.lendacky@amd.com>
 <YR4p9TqKTLdN1A96@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YR4p9TqKTLdN1A96@infradead.org>
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

On Thu, Aug 19, 2021 at 10:52:53AM +0100, Christoph Hellwig wrote:
> Which suggest that the name is not good to start with.  Maybe protected
> hardware, system or platform might be a better choice?

Yah, coming up with a proper name here hasn't been easy.
prot_guest_has() is not the first variant.

From all three things you suggest above, I guess calling it a "platform"
is the closest. As in, this is a confidential computing platform which
provides host and guest facilities etc.

So calling it

confidential_computing_platform_has()

is obviously too long.

ccp_has() clashes with the namespace of drivers/crypto/ccp/ which is
used by the technology too.

coco_platform_has() is too unserious.

So I guess

cc_platform_has()

ain't all that bad.

Unless you have a better idea, ofc.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
