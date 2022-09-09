Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8173F5B3B16
	for <lists+dri-devel@lfdr.de>; Fri,  9 Sep 2022 16:49:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A1E310EDEE;
	Fri,  9 Sep 2022 14:49:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 100CD10EDED;
 Fri,  9 Sep 2022 14:49:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662734972; x=1694270972;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=F9RWZbrEgWr3jOpGPJzSTGXGG9s7o1/0a4ZDcE3DRRM=;
 b=NRbxD10xp+V44QKEsfqkH0oN6ujdruaReLVPuNl8/paMqO+jHYi9pCbS
 xkeuWIRN7wtiXDAC+7u9v/Ht9DwIX7dyN1xGBwn3+eImpSfGl7WMdMe4s
 lEplQnz31W/wNJVUzfGSa6t9omQyuCEcW5+PCDhOHYrD8aM971hBeEwWx
 yjWftChZWmnhBp39wvpXdEfJRpg6NmLfBQMibzzSROnsBiky69XpXurZA
 HS2/op9wUISuD2Nx1rxdHxE0+W40QX1/gZbVm4wlQrCxFAi8uG/Ri5gqM
 /KFU+8R/Ut+IzymJbmimftFTQGixiQqqdNPq4ruNozSi/R3GBbmSdnigF w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10465"; a="277223330"
X-IronPort-AV: E=Sophos;i="5.93,303,1654585200"; d="scan'208";a="277223330"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2022 07:49:31 -0700
X-IronPort-AV: E=Sophos;i="5.93,303,1654585200"; d="scan'208";a="677183072"
Received: from jkrzyszt-mobl1.ger.corp.intel.com ([10.213.25.143])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2022 07:49:26 -0700
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: Re: [igt-dev] [PATCH i-g-t v2 0/4] Add support for KUnit tests
Date: Fri, 09 Sep 2022 16:49:24 +0200
Message-ID: <5354052.Sb9uPGUboI@jkrzyszt-mobl1.ger.corp.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20220829000920.38185-1-isabbasso@riseup.net>
References: <20220829000920.38185-1-isabbasso@riseup.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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
Cc: linux-kselftest@vger.kernel.org, magalilemes00@gmail.com,
 maira.canal@usp.br, dlatypov@google.com, tales.aparecida@gmail.com,
 brendanhiggins@google.com, linux-kernel@vger.kernel.org,
 leandro.ribeiro@collabora.com, dri-devel@lists.freedesktop.org,
 n@nfraprado.net, davidgow@google.com, skhan@linuxfoundation.org,
 andrealmeid@riseup.net, Isabella Basso <isabbasso@riseup.net>,
 kunit-dev@googlegroups.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Isabella,

On Monday, 29 August 2022 02:09:16 CEST Isabella Basso wrote:
> This patch series was first developed as part of the LKCamp hackathon
> that happened last year[1], mainly focusing on refactoring DRM tests to
> use KUnit.
> 
> KUnit[2][3] is a unified test framework that provides helper tools,
> simplifying their development and execution. Using an x86-64 machine
> it's possible to run tests in the host's kernel natively using user-mode
> Linux[4] (aka UML), which simplifies usage in a wide variety of
> scenarios, including integration to CI.
> 
> As the tool's adoption widens into graphics testing territory, I and
> LKCamp members figured it would be important to support it in IGT, as
> it's a core tool for GPU drivers maintainers.
> 
> I have then added KUnit support into IGT mainly following the KTAP
> specs, and it can be tested using patch 4/4 in this series together with
> a DRM selftests patch series available at [5].

CI pre-merge results indicate that your new versions of tests were not able to 
load kunit module, then didn't actually execute any kunit tests, but returned 
SUCCESS.  That's probably not what we expect from IGT tests.

https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7698/shard-rkl-4/igt@drm_buddy.html
https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7698/shard-rkl-1/igt@drm_mm.html
https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7698/shard-rkl-5/igt@kms_selftest.html

Thanks,
Janusz

> 
> Changes since v1:
> - Major rework of parsing function structure:
>   - It is not longer recursive
>   - Adapt kselftests functions and structs to be used with KUnit
> - Switch DRM selftests to KUnit parsing as they're updated in the kernel
> - Replace AMD KUnit tests by DRM selftests
> 
> [1]: https://groups.google.com/g/kunit-dev/c/YqFR1q2uZvk/m/IbvItSfHBAAJ
> [2]: https://kunit.dev
> [3]: https://docs.kernel.org/dev-tools/kunit/index.html
> [4]: http://user-mode-linux.sourceforge.net
> [5]: https://lore.kernel.org/all/20220708203052.236290-1-maira.canal@usp.br/
> 
> Isabella Basso (4):
>   lib/igt_kmod: rename kselftest functions to ktest
>   lib/igt_kmod.c: check if module is builtin before attempting to unload
>     it
>   lib/igt_kmod: add compatibility for KUnit
>   tests: DRM selftests: switch to KUnit
> 
>  lib/igt_kmod.c       | 315 +++++++++++++++++++++++++++++++++++++++++--
>  lib/igt_kmod.h       |  14 +-
>  tests/drm_buddy.c    |   7 +-
>  tests/drm_mm.c       |   7 +-
>  tests/kms_selftest.c |  12 +-
>  5 files changed, 329 insertions(+), 26 deletions(-)
> 
> 




