Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D43A5200A43
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jun 2020 15:35:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DD476ECBF;
	Fri, 19 Jun 2020 13:35:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.skyhub.de (mail.skyhub.de [5.9.137.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70EF76ECBC;
 Fri, 19 Jun 2020 13:34:59 +0000 (UTC)
Received: from zn.tnic (p200300ec2f0bac004d57d24caa4a0e33.dip0.t-ipconnect.de
 [IPv6:2003:ec:2f0b:ac00:4d57:d24c:aa4a:e33])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id EB6C81EC03D0;
 Fri, 19 Jun 2020 15:34:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
 t=1592573697;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
 bh=u1GbBe13gJ4BTiGHsY3PCYbsBzZ3KFyUO+55Ve0pR54=;
 b=L0o8zXrCdiGsWBnTPoYSrRxtzWeXTGACHWMrRpLgDbX6BXPrI8HiyVTYCS/RWukSK4Ofsz
 mbhXGH1l8VKsrOmCeBqf6jsf864MZlN3BDKOWZwlCpmWGTWb6asrbx8jZetpKzaSerQOhE
 CcGVMpI6l/Hfh8bLprQOFcIpSAjqt54=
Date: Fri, 19 Jun 2020 15:34:49 +0200
From: Borislav Petkov <bp@alien8.de>
To: Ilia Mirkin <imirkin@alum.mit.edu>
Subject: Re: [Nouveau] 2dd4d163cd9c ("drm/nouveau: remove open-coded version
 of remove_conflicting_pci_framebuffers()")
Message-ID: <20200619133449.GD32683@zn.tnic>
References: <20200618200106.GF27951@zn.tnic>
 <CAKb7UviibvRfqJgtLkePEuXFa6mQfi4h=7eeW+YQxB-StVjjrA@mail.gmail.com>
 <20200618203907.GG27951@zn.tnic>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200618203907.GG27951@zn.tnic>
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
Cc: nouveau <nouveau@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 lkml <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jun 18, 2020 at 10:39:07PM +0200, Borislav Petkov wrote:
> I'll redo the bisection tomorrow, on a fresh head, to check.

Ok, just did it again, similar bisection log, points at the same commit.

The commit before it:

fb172f5fe880 ("drm/nouveau/gr/gk20a: move MODULE_FIRMWARE firmware definitions")

boots ok but

2dd4d163cd9c ("drm/nouveau: remove open-coded version of remove_conflicting_pci_framebuffers()")

doesn't.

Ideas?

git bisect start
# good: [3d77e6a8804abcc0504c904bd6e5cdf3a5cf8162] Linux 5.7
git bisect good 3d77e6a8804abcc0504c904bd6e5cdf3a5cf8162
# bad: [5e857ce6eae7ca21b2055cca4885545e29228fe2] Merge branch 'hch' (maccess patches from Christoph Hellwig)
git bisect bad 5e857ce6eae7ca21b2055cca4885545e29228fe2
# bad: [a98f670e41a99f53acb1fb33cee9c6abbb2e6f23] Merge tag 'media/v5.8-1' of git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media
git bisect bad a98f670e41a99f53acb1fb33cee9c6abbb2e6f23
# bad: [5be993432821750f382809df5e20bf4c129b24f7] mm/hugetlb: define a generic fallback for arch_clear_hugepage_flags()
git bisect bad 5be993432821750f382809df5e20bf4c129b24f7
# good: [cfa3b8068b09f25037146bfd5eed041b78878bee] Merge tag 'for-linus-hmm' of git://git.kernel.org/pub/scm/linux/kernel/git/rdma/rdma
git bisect good cfa3b8068b09f25037146bfd5eed041b78878bee
# good: [a1fb548962397bb8609bb46e566809a9a1b30044] Merge tag 'drm-intel-next-2020-04-30' of git://anongit.freedesktop.org/drm/drm-intel into drm-next
git bisect good a1fb548962397bb8609bb46e566809a9a1b30044
# bad: [750a02ab8d3c49ca7d23102be90d3d1db19e2827] Merge tag 'for-5.8/block-2020-06-01' of git://git.kernel.dk/linux-block
git bisect bad 750a02ab8d3c49ca7d23102be90d3d1db19e2827
# good: [e20bb857dea2f620ff37ae541ed8aee70e3c89f1] Merge tag 'exynos-drm-next-for-v5.8' of git://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos into drm-next
git bisect good e20bb857dea2f620ff37ae541ed8aee70e3c89f1
# good: [e6e7abffe386b614a194ec32457a00c304c980f4] blk-mq: simplify the blk_mq_get_request calling convention
git bisect good e6e7abffe386b614a194ec32457a00c304c980f4
# bad: [7dbbdd37f2ae7dd4175ba3f86f4335c463b18403] drm/nouveau: use correct conflicting framebuffer API
git bisect bad 7dbbdd37f2ae7dd4175ba3f86f4335c463b18403
# bad: [0f85bbb6ae517d9a4308527188afe35c2012bbc9] drm/nouveau/device: use regular PRI accessors in chipset detection
git bisect bad 0f85bbb6ae517d9a4308527188afe35c2012bbc9
# good: [fa4f4c213f5f7807360c41f2501a3031a9940f3a] drm/nouveau/kms: Support NVIDIA format modifiers
git bisect good fa4f4c213f5f7807360c41f2501a3031a9940f3a
# bad: [e3d8b08904694e9ccae5163d0bb7d35fa66e5bdc] drm/nouveau/svm: map pages after migration
git bisect bad e3d8b08904694e9ccae5163d0bb7d35fa66e5bdc
# good: [fb172f5fe880cd0ddb4370b2fcc9ad4848c98bbb] drm/nouveau/gr/gk20a: move MODULE_FIRMWARE firmware definitions
git bisect good fb172f5fe880cd0ddb4370b2fcc9ad4848c98bbb
# bad: [b950c8c5d082d822b0134d1fc058101ab346e503] drm/nouveau/bios: move ACPI _ROM handling
git bisect bad b950c8c5d082d822b0134d1fc058101ab346e503
# bad: [2dd4d163cd9c15432524aa9863155bc03a821361] drm/nouveau: remove open-coded version of remove_conflicting_pci_framebuffers()
git bisect bad 2dd4d163cd9c15432524aa9863155bc03a821361
# first bad commit: [2dd4d163cd9c15432524aa9863155bc03a821361] drm/nouveau: remove open-coded version of remove_conflicting_pci_framebuffers()

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
