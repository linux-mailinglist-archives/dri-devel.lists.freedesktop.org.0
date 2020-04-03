Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8978019D8C0
	for <lists+dri-devel@lfdr.de>; Fri,  3 Apr 2020 16:13:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A58DE6E131;
	Fri,  3 Apr 2020 14:13:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 864836E131
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Apr 2020 14:13:46 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: gtucker) with ESMTPSA id CA75D2978D8
Subject: Re: mainline/master bisection: baseline.login on peach-pi
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>,
 Shane Francis <bigbeeshane@gmail.com>,
 Alex Deucher <alexander.deucher@amd.com>
References: <5e863110.1c69fb81.17969.099e@mx.google.com>
From: Guillaume Tucker <guillaume.tucker@collabora.com>
Message-ID: <187eeb8e-5c70-4479-d806-a7123f9023c8@collabora.com>
Date: Fri, 3 Apr 2020 15:13:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <5e863110.1c69fb81.17969.099e@mx.google.com>
Content-Language: en-US
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
Cc: Joerg Roedel <jroedel@suse.de>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, Tom Murphy <murphyt7@tcd.ie>, kernelci@groups.io,
 dri-devel@lists.freedesktop.org,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Please see the bisection report below about a boot failure.

Reports aren't automatically sent to the public while we're
trialing new bisection features on kernelci.org but this one
looks valid.

This bisection was run with exynos_defconfig but the issue can
also be reproduced with multi_v7_defconfig.  It doesn't appear to
be affecting any other platforms on kernelci.org.  This looks
like a DRM driver problem, the kernel image boots fine without
the modules installed.  It actually started failing on Tuesday in
mainline.

Guillaume

On 02/04/2020 19:38, kernelci.org bot wrote:
> * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
> * This automated bisection report was sent to you on the basis  *
> * that you may be involved with the breaking commit it has      *
> * found.  No manual investigation has been done to verify it,   *
> * and the root cause of the problem may be somewhere else.      *
> *                                                               *
> * If you do send a fix, please include this trailer:            *
> *   Reported-by: "kernelci.org bot" <bot@kernelci.org>          *
> *                                                               *
> * Hope this helps!                                              *
> * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
> 
> mainline/master bisection: baseline.login on peach-pi
> 
> Summary:
>   Start:      56a451b780676 Merge tag 'ntb-5.7' of git://github.com/jonmason/ntb
>   Plain log:  https://storage.kernelci.org//mainline/master/v5.6-3277-g56a451b78067/arm/exynos_defconfig/gcc-8/lab-collabora/baseline-exynos5800-peach-pi.txt
>   HTML log:   https://storage.kernelci.org//mainline/master/v5.6-3277-g56a451b78067/arm/exynos_defconfig/gcc-8/lab-collabora/baseline-exynos5800-peach-pi.html
>   Result:     42e67b479eab6 drm/prime: use dma length macro when mapping sg
> 
> Checks:
>   revert:     PASS
>   verify:     PASS
> 
> Parameters:
>   Tree:       mainline
>   URL:        https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
>   Branch:     master
>   Target:     peach-pi
>   CPU arch:   arm
>   Lab:        lab-collabora
>   Compiler:   gcc-8
>   Config:     exynos_defconfig
>   Test case:  baseline.login
> 
> Breaking commit found:
> 
> -------------------------------------------------------------------------------
> commit 42e67b479eab6d26459b80b4867298232b0435e7
> Author: Shane Francis <bigbeeshane@gmail.com>
> Date:   Wed Mar 25 09:07:39 2020 +0000
> 
>     drm/prime: use dma length macro when mapping sg
>     
>     As dma_map_sg can reorganize scatter-gather lists in a
>     way that can cause some later segments to be empty we should
>     always use the sg_dma_len macro to fetch the actual length.
>     
>     This could now be 0 and not need to be mapped to a page or
>     address array
>     
>     Fixes: be62dbf554c5 ("iommu/amd: Convert AMD iommu driver to the dma-iommu api")
>     Bug: https://bugzilla.kernel.org/show_bug.cgi?id=206461
>     Bug: https://bugzilla.kernel.org/show_bug.cgi?id=206895
>     Bug: https://gitlab.freedesktop.org/drm/amd/issues/1056
>     Signed-off-by: Shane Francis <bigbeeshane@gmail.com>
>     Reviewed-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
>     Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
>     Link: https://patchwork.freedesktop.org/patch/msgid/20200325090741.21957-2-bigbeeshane@gmail.com
>     Cc: stable@vger.kernel.org
> 
> diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.c
> index 86d9b0e45c8c6..1de2cde2277ca 100644
> --- a/drivers/gpu/drm/drm_prime.c
> +++ b/drivers/gpu/drm/drm_prime.c
> @@ -967,7 +967,7 @@ int drm_prime_sg_to_page_addr_arrays(struct sg_table *sgt, struct page **pages,
>  
>  	index = 0;
>  	for_each_sg(sgt->sgl, sg, sgt->nents, count) {
> -		len = sg->length;
> +		len = sg_dma_len(sg);
>  		page = sg_page(sg);
>  		addr = sg_dma_address(sg);
> -------------------------------------------------------------------------------
> 
> 
> Git bisection log:
> 
> -------------------------------------------------------------------------------
> git bisect start
> # good: [8b614cb8f1dcac8ca77cf4dd85f46ef3055f8238] Merge tag '5.6-rc4-smb3-fixes' of git://git.samba.org/sfrench/cifs-2.6
> git bisect good 8b614cb8f1dcac8ca77cf4dd85f46ef3055f8238
> # bad: [56a451b780676bc1cdac011735fe2869fa2e9abf] Merge tag 'ntb-5.7' of git://github.com/jonmason/ntb
> git bisect bad 56a451b780676bc1cdac011735fe2869fa2e9abf
> # bad: [59838093be51ee9447f6ad05483d697b6fa0368d] Merge tag 'driver-core-5.7-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/driver-core
> git bisect bad 59838093be51ee9447f6ad05483d697b6fa0368d
> # bad: [32db9f10d52c97ffc407c7dad81c6fafcad730b2] Merge tag 'arm-soc-fixes-5.6' of git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc
> git bisect bad 32db9f10d52c97ffc407c7dad81c6fafcad730b2
> # good: [78511edc2dd4c7b9f74f3b544093c854b7bd7744] Merge tag 'pm-5.6-rc6' of git://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm
> git bisect good 78511edc2dd4c7b9f74f3b544093c854b7bd7744
> # good: [76ccd234269bd05debdbc12c96eafe62dd9a6180] Merge branch 'perf-urgent-for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip
> git bisect good 76ccd234269bd05debdbc12c96eafe62dd9a6180
> # good: [81573b18f26defe672a7d960f9af9ac2c97f324d] selftests/net/forwarding: add Makefile to install tests
> git bisect good 81573b18f26defe672a7d960f9af9ac2c97f324d
> # good: [9efcc4a129363187c9bf15338692f107c5c9b6f0] afs: Fix unpinned address list during probing
> git bisect good 9efcc4a129363187c9bf15338692f107c5c9b6f0
> # bad: [823846c3107197b6eae9fb656a23e986926d6c07] Merge tag 'riscv-for-linus-5.6' of git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux
> git bisect bad 823846c3107197b6eae9fb656a23e986926d6c07
> # bad: [7bf8df68cba0536479aead32297e47908922582c] Merge tag 'drm-fixes-2020-03-27' of git://anongit.freedesktop.org/drm/drm
> git bisect bad 7bf8df68cba0536479aead32297e47908922582c
> # good: [fbf66796a0aedbaea248c7ade1459ccd0dd4cb44] Input: move the new KEY_SELECTIVE_SCREENSHOT keycode
> git bisect good fbf66796a0aedbaea248c7ade1459ccd0dd4cb44
> # bad: [5117c363eb213d5503f5b7e39c9bfafd46388184] Merge tag 'drm-misc-fixes-2020-03-26' of git://anongit.freedesktop.org/drm/drm-misc into drm-fixes
> git bisect bad 5117c363eb213d5503f5b7e39c9bfafd46388184
> # bad: [0199172f933342d8b1011aae2054a695c25726f4] drm/amdgpu: fix scatter-gather mapping with user pages
> git bisect bad 0199172f933342d8b1011aae2054a695c25726f4
> # bad: [42e67b479eab6d26459b80b4867298232b0435e7] drm/prime: use dma length macro when mapping sg
> git bisect bad 42e67b479eab6d26459b80b4867298232b0435e7
> # first bad commit: [42e67b479eab6d26459b80b4867298232b0435e7] drm/prime: use dma length macro when mapping sg
> -------------------------------------------------------------------------------
> 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
