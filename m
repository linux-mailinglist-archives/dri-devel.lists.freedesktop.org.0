Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4790341B85B
	for <lists+dri-devel@lfdr.de>; Tue, 28 Sep 2021 22:32:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD0036E96E;
	Tue, 28 Sep 2021 20:32:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.skyhub.de (mail.skyhub.de [IPv6:2a01:4f8:190:11c2::b:1457])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3C3A6E96E;
 Tue, 28 Sep 2021 20:32:03 +0000 (UTC)
Received: from zn.tnic (p200300ec2f13b200371079131a9f19c8.dip0.t-ipconnect.de
 [IPv6:2003:ec:2f13:b200:3710:7913:1a9f:19c8])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 052251EC0758;
 Tue, 28 Sep 2021 22:32:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
 t=1632861122;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
 bh=qbX+tgbw05504BlKd+vjCTQM+czUsH5nYZVV4FM0DG8=;
 b=PQ4PKcJl3Lyadkflmx+j1VA5OiwXAdXTaEvbm7ew7wHmPI94m7AJwZOzgrvxFt4MxHlIwN
 LDaduODsYvATrWtH3svQYbrndDcAuYcHl9AIp7EwQK4gZbGRwjVVHLxwvW78GbTZv51eLK
 ObLlpU/8EnxkbEHepMYe/Hen7N4ZKDo=
Date: Tue, 28 Sep 2021 22:31:56 +0200
From: Borislav Petkov <bp@alien8.de>
To: "Kuppuswamy, Sathyanarayanan" <sathyanarayanan.kuppuswamy@linux.intel.com>
Cc: LKML <linux-kernel@vger.kernel.org>, Andi Kleen <ak@linux.intel.com>,
 Andy Lutomirski <luto@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
 Baoquan He <bhe@redhat.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Daniel Vetter <daniel@ffwll.ch>, Dave Young <dyoung@redhat.com>,
 David Airlie <airlied@linux.ie>, Heiko Carstens <hca@linux.ibm.com>,
 Joerg Roedel <joro@8bytes.org>,
 "Kirill A. Shutemov" <kirill@shutemov.name>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Paul Mackerras <paulus@samba.org>, Tom Lendacky <thomas.lendacky@amd.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Vasily Gorbik <gor@linux.ibm.com>,
 VMware Graphics <linux-graphics-maintainer@vmware.com>,
 Will Deacon <will@kernel.org>,
 Christoph Hellwig <hch@infradead.org>, x86@kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org,
 iommu@lists.linux-foundation.org, kvm@vger.kernel.org,
 linux-efi@vger.kernel.org, platform-driver-x86@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 kexec@lists.infradead.org
Subject: Re: [PATCH v4 0/8] Implement generic cc_platform_has() helper function
Message-ID: <YVN7vPE/7jecXcJ/@zn.tnic>
References: <20210928191009.32551-1-bp@alien8.de>
 <80593893-c63b-d481-45f1-42a3a6fd762a@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <80593893-c63b-d481-45f1-42a3a6fd762a@linux.intel.com>
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

On Tue, Sep 28, 2021 at 12:19:49PM -0700, Kuppuswamy, Sathyanarayanan wrote:
> Intel CC support patch is not included in this series. You want me
> to address the issue raised by Joerg before merging it?

Did you not see my email to you today:

https://lkml.kernel.org/r/YVL4ZUGhfsh1QfRX@zn.tnic

?

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
