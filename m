Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C88B6874C6A
	for <lists+dri-devel@lfdr.de>; Thu,  7 Mar 2024 11:33:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 293E510F3A1;
	Thu,  7 Mar 2024 10:33:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.b="qg/46i44";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36A7E10F3A1
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Mar 2024 10:33:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1709807585;
 bh=wMkf3YBzzlJjow/0vVDRQvuksnXHfscP5DgovGq9Jug=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=qg/46i44H7pLCx54yhzkQgWVg4qZBTTKQD/Q8Bx1IRr8kgzzhEugpAN1Y2OEGOkGa
 oQOAWA19qY0L/SK4mQ00DydQh7P4PNpcK3IMibi3IeUjnyKgdicvq1f+/ZxQDmBuS/
 LoGul/mSORMBJrLlhh3VqPkSPQ3tnsgZ+gH+lYI900OncOg8nfTmLTTggZlnfcpxCa
 j5tTTxmPyzavMUc3zNNuiVVFdCM8i4cgRVATCxL7hNgvC01y1VnnbmkIgw2ATnYMes
 W45h2k28FZndeHFogXTQFJYwTYK9CRw3VDuYH39GZmpy0vNy2jFm33252OVfCS5SN2
 Vg/T4X/gy3Hww==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4Tr5H31vRTz4wbh;
 Thu,  7 Mar 2024 21:33:02 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Thomas Zimmermann <tzimmermann@suse.de>, jani.nikula@intel.com,
 naresh.kamboju@linaro.org, deller@gmx.de, npiggin@gmail.com,
 christophe.leroy@csgroup.eu, aneesh.kumar@kernel.org,
 naveen.n.rao@linux.ibm.com
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 lkft-triage@lists.linaro.org, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v3 3/3] arch/powerpc: Remove <linux/fb.h> from backlight
 code
In-Reply-To: <20240306122935.10626-4-tzimmermann@suse.de>
References: <20240306122935.10626-1-tzimmermann@suse.de>
 <20240306122935.10626-4-tzimmermann@suse.de>
Date: Thu, 07 Mar 2024 21:33:00 +1100
Message-ID: <87msranxgj.fsf@mail.lhotse>
MIME-Version: 1.0
Content-Type: text/plain
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

Thomas Zimmermann <tzimmermann@suse.de> writes:
> Replace <linux/fb.h> with a forward declaration in <asm/backlight.h> to
> resolve an unnecessary dependency. Remove pmac_backlight_curve_lookup()
> and struct fb_info from source and header files. The function and the
> framebuffer struct are unused. No functional changes.
>
> v3:
> 	* Add Fixes tag (Christophe)
> 	* fix typos in commit message (Jani)
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Fixes: d565dd3b0824 ("[PATCH] powerpc: More via-pmu backlight fixes")
> Reviewed-by: Jani Nikula <jani.nikula@intel.com>
> ---
>  arch/powerpc/include/asm/backlight.h        |  5 ++--
>  arch/powerpc/platforms/powermac/backlight.c | 26 ---------------------
>  2 files changed, 2 insertions(+), 29 deletions(-)

Acked-by: Michael Ellerman <mpe@ellerman.id.au> (powerpc)

cheers
