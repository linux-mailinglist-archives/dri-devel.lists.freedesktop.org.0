Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4559E3D934A
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jul 2021 18:35:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 600EC6E952;
	Wed, 28 Jul 2021 16:34:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 420 seconds by postgrey-1.36 at gabe;
 Wed, 28 Jul 2021 16:34:56 UTC
Received: from mail.skyhub.de (mail.skyhub.de [IPv6:2a01:4f8:190:11c2::b:1457])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C0916E952;
 Wed, 28 Jul 2021 16:34:56 +0000 (UTC)
Received: from nazgul.tnic (unknown [109.121.183.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 8F24F1EC0527;
 Wed, 28 Jul 2021 18:27:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
 t=1627489669;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
 bh=GOEYhGPYQ4YUbo4gftj4JX0Uz5V/Qj9S6dris+AXSaA=;
 b=LxjG3gFIJCDuOQDGzY+hiG0vN+dfpBr7Vq5w2ORdpOETiJfx6X9JMDFJJMxIan0ujoNNw7
 KMi/vJ5Nq5Vi/Nq5x7JcXDHRAXe8ptcsnGwT9j1ZZa1hhOAXVDNeta9RonTrMrxsR3lvLV
 KIVjknjki6FEc0QGw1JCe7AU529aFu0=
Date: Wed, 28 Jul 2021 18:28:01 +0200
From: Borislav Petkov <bp@alien8.de>
To: Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCH 01/11] mm: Introduce a function to check for
 virtualization protection features
Message-ID: <YQGFh3BlaD8RAEBz@nazgul.tnic>
References: <cover.1627424773.git.thomas.lendacky@amd.com>
 <cbc875b1d2113225c2b44a2384d5b303d0453cf7.1627424774.git.thomas.lendacky@amd.com>
 <YQFY5/cq2thyHzUe@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YQFY5/cq2thyHzUe@infradead.org>
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
Cc: Tom Lendacky <thomas.lendacky@amd.com>, linux-efi@vger.kernel.org,
 Tianyu Lan <Tianyu.Lan@microsoft.com>, kvm@vger.kernel.org,
 linux-s390@vger.kernel.org, x86@kernel.org, kexec@lists.infradead.org,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 platform-driver-x86@vger.kernel.org, iommu@lists.linux-foundation.org,
 Andi Kleen <ak@linux.intel.com>, linux-graphics-maintainer@vmware.com,
 dri-devel@lists.freedesktop.org, linux-fsdevel@vger.kernel.org,
 Brijesh Singh <brijesh.singh@amd.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jul 28, 2021 at 02:17:27PM +0100, Christoph Hellwig wrote:
> So common checks obviously make sense, but I really hate the stupid
> multiplexer.  Having one well-documented helper per feature is much
> easier to follow.

We had that in x86 - it was called cpu_has_<xxx> where xxx is the
feature bit. It didn't scale with the sheer amount of feature bits that
kept getting added so we do cpu_feature_enabled(X86_FEATURE_XXX) now.

The idea behind this is very similar - those protected guest flags
will only grow in the couple of tens range - at least - so having a
multiplexer is a lot simpler, I'd say, than having a couple of tens of
helpers. And those PATTR flags should have good, readable names, btw.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
