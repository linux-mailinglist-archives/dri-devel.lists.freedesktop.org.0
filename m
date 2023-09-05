Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BE27792015
	for <lists+dri-devel@lfdr.de>; Tue,  5 Sep 2023 04:56:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21C0310E15F;
	Tue,  5 Sep 2023 02:56:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 534 seconds by postgrey-1.36 at gabe;
 Tue, 05 Sep 2023 02:56:10 UTC
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4520110E15F
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Sep 2023 02:56:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1693882031;
 bh=u10/VToy+E/OPi9XjZP4n2I6K6AMC3YNx3lXqqyKrWA=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=J0UyS+WIgQoJYbA9dbawO9edyrVtzWysZpXCEe9VqoDfs69TC9XyVtpilDMb0DEdo
 axw/o1IALllIcMtWiaXWPx2zGTpR7663jgxJF0b2wkAXldKnXW3f7Cit6zC8eQlq5W
 zxrCjsTS3nw4p4rSekMEqCCJ3X2Es8bFh+9hvA9nIvYbKQSVD3PA5ruIot2oAAap5E
 HvFJj7T0be9dQ0NvrLr0/NzJmayyh2b5KWasZixoItg0Ptm1DeHlC7hhO2b213URb3
 gAfV86Nq7wJZpMhKiDyKmU5ssXQRSkyv/QhuKEp9AjNySr/h2XsGejVTsQZaXbEGJT
 AbXUqd44M/lMw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4RfqfP1SNYz4wZn;
 Tue,  5 Sep 2023 12:47:09 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Thomas Zimmermann <tzimmermann@suse.de>, npiggin@gmail.com,
 christophe.leroy@csgroup.eu, arnd@arndb.de, deller@gmx.de
Subject: Re: [PATCH 0/4] ppc, fbdev: Clean up fbdev mmap helper
In-Reply-To: <20230901142659.31787-1-tzimmermann@suse.de>
References: <20230901142659.31787-1-tzimmermann@suse.de>
Date: Tue, 05 Sep 2023 12:47:08 +1000
Message-ID: <874jk9ibf7.fsf@mail.lhotse>
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
Cc: linux-arch@vger.kernel.org, linux-fbdev@vger.kernel.org,
 linux-ia64@vger.kernel.org, linux-mips@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-m68k@lists.linux-m68k.org,
 Thomas Zimmermann <tzimmermann@suse.de>, sparclinux@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thomas Zimmermann <tzimmermann@suse.de> writes:
> Refactor fb_pgprotect() in PowerPC to work without struct file. Then
> clean up and rename fb_pgprotect(). This change has been discussed at
> [1] in the context of refactoring fbdev's mmap code.
>
> The first three patches adapt PowerPC's internal interfaces to
> provide a phys_mem_access_prot() that works without struct file. Neither
> the architecture code or fbdev helpers need the parameter.
>
> Patch 4 replaces fbdev's fb_pgprotect() with fb_pgprot_device() on
> all architectures. The new helper with its stream-lined interface
> enables more refactoring within fbdev's mmap implementation.

The content of this series is OK, but the way it's structured makes it a
real headache to merge, because it's mostly powerpc changes and then a
dependant cross architecture patch at the end.

It would be simpler if patch 4 was first and just passed file=NULL to
the powerpc helper, with an explanation that it's unused and will be
dropped in a future cleanup.

We could then put the first patch (previously patch 4) in a topic branch
that is shared between the powerpc tree and the fbdev tree, and then the
powerpc changes could be staged on top of that through the powerpc tree.

cheers
