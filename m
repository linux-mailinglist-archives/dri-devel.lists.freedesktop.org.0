Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AE117204C4
	for <lists+dri-devel@lfdr.de>; Fri,  2 Jun 2023 16:44:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70DF710E6B3;
	Fri,  2 Jun 2023 14:44:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 160183 seconds by postgrey-1.36 at gabe;
 Fri, 02 Jun 2023 14:44:03 UTC
Received: from mail.skyhub.de (mail.skyhub.de [5.9.137.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74E2B10E6AA
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Jun 2023 14:44:03 +0000 (UTC)
Received: from zn.tnic (pd9530d32.dip0.t-ipconnect.de [217.83.13.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id C2FAD1EC026E;
 Fri,  2 Jun 2023 16:44:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
 t=1685717041;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
 bh=2AOFicJwTPgUdcHfcpeKSndwQkStqIz6/wMMCYd0H1E=;
 b=ogLDfweyKnYTGaSj85WYz31gQ/v2w7nHloTwxh2YY6RBQVWC/SaOuntubLbpuc9p0svdWH
 LalG3+Q/DaurBrLWBXgV7Jgz6a8URUEYtts6cQJKS03Bf3kndHAjMh5+AW/8AL2g9ccS1X
 4UysctKv5AnrBwgPz7GnDYkdGF2kj/M=
Date: Fri, 2 Jun 2023 16:43:57 +0200
From: Borislav Petkov <bp@alien8.de>
To: Juergen Gross <jgross@suse.com>
Subject: Re: [RESUBMIT][PATCH] x86/mm: Fix PAT bit missing from page
 protection modify mask
Message-ID: <20230602144357.GCZHoALQjO+xx3YxAz@fat_crate.local>
References: <20230519183634.190364-1-janusz.krzysztofik@linux.intel.com>
 <20230531181412.GFZHeOdMHIGOXB2hwL@fat_crate.local>
 <cfd19da7-4148-f277-0cf8-507b94d214a3@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <cfd19da7-4148-f277-0cf8-507b94d214a3@suse.com>
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
Cc: x86@kernel.org, Yu Zhao <yuzhao@google.com>,
 David Hildenbrand <david@redhat.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, drm-intel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
 Ingo Molnar <mingo@redhat.com>, Andi Shyti <andi.shyti@linux.intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Andrew Morton <akpm@linux-foundation.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jun 01, 2023 at 10:47:39AM +0200, Juergen Gross wrote:
> As described in the commit message, this only works on bare metal due to the
> PAT bit not being needed for WC mappings.
>
> Making this patch Xen specific would try to cure the symptoms without fixing
> the underlying problem: _PAGE_PAT should be regarded the same way as the bits
> for caching mode (_PAGE_CHG_MASK).

So why isn't _PAGE_PAT part of _PAGE_CHG_MASK?

It says above it "Set of bits not changed in pte_modify."

And I don't see pte_modify() changing that bit either.

Right now this "fix" looks like, "let's OR these two masks so that we
can take care of _PAGE_PAT too". But it doesn't make a whole lotta sense
to me...

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
