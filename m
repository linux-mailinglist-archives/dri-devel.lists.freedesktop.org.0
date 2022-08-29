Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 34FF95A4039
	for <lists+dri-devel@lfdr.de>; Mon, 29 Aug 2022 02:10:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E46610EEAC;
	Mon, 29 Aug 2022 00:09:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.riseup.net (mx1.riseup.net [198.252.153.129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49DBB10EE8E;
 Mon, 29 Aug 2022 00:09:43 +0000 (UTC)
Received: from fews1.riseup.net (fews1-pn.riseup.net [10.0.1.83])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
 client-signature RSA-PSS (2048 bits) client-digest SHA256)
 (Client CN "mail.riseup.net", Issuer "R3" (not verified))
 by mx1.riseup.net (Postfix) with ESMTPS id 4MG9mN6RdszDrb2;
 Mon, 29 Aug 2022 00:09:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1661731782; bh=VtjZAMq50WDc2JV4qsxMbdF++DZSjSFlkdTI6UQoXDY=;
 h=From:To:Cc:Subject:Date:From;
 b=gacBh53FIDLeBgCB3F02Dnz+WYlWLlO+dBjxpGmzhriX1FYoFmcqQwMu8ikMoTeCK
 p9w150jy9tCu9ra1BO/Wd5M0hlAgsmTz36jLFeNZve4X9yYyeF+ZWp+AMOhAci38MW
 EiIq5rHscVUjUaDetm5CcoDtWd7JkK1rMP0Xr80g=
X-Riseup-User-ID: EC7CA0391D2F46489D39CE88BE1AB6243E7EDC666D6266A7CD73F85762F41ADD
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews1.riseup.net (Postfix) with ESMTPSA id 4MG9mG0L4Zz5vkC;
 Mon, 29 Aug 2022 00:09:33 +0000 (UTC)
From: Isabella Basso <isabbasso@riseup.net>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t v2 0/4] Add support for KUnit tests
Date: Sun, 28 Aug 2022 21:09:16 -0300
Message-Id: <20220829000920.38185-1-isabbasso@riseup.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com,
 magalilemes00@gmail.com, maira.canal@usp.br, dlatypov@google.com,
 n@nfraprado.net, rodrigo.siqueira@amd.com, linux-kernel@vger.kernel.org,
 leandro.ribeiro@collabora.com, mwen@igalia.com,
 dri-devel@lists.freedesktop.org, davidgow@google.com,
 tales.aparecida@gmail.com, skhan@linuxfoundation.org, andrealmeid@riseup.net,
 Isabella Basso <isabbasso@riseup.net>, brendanhiggins@google.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch series was first developed as part of the LKCamp hackathon
that happened last year[1], mainly focusing on refactoring DRM tests to
use KUnit.

KUnit[2][3] is a unified test framework that provides helper tools,
simplifying their development and execution. Using an x86-64 machine
it's possible to run tests in the host's kernel natively using user-mode
Linux[4] (aka UML), which simplifies usage in a wide variety of
scenarios, including integration to CI.

As the tool's adoption widens into graphics testing territory, I and
LKCamp members figured it would be important to support it in IGT, as
it's a core tool for GPU drivers maintainers.

I have then added KUnit support into IGT mainly following the KTAP
specs, and it can be tested using patch 4/4 in this series together with
a DRM selftests patch series available at [5].

Changes since v1:
- Major rework of parsing function structure:
  - It is not longer recursive
  - Adapt kselftests functions and structs to be used with KUnit
- Switch DRM selftests to KUnit parsing as they're updated in the kernel
- Replace AMD KUnit tests by DRM selftests

[1]: https://groups.google.com/g/kunit-dev/c/YqFR1q2uZvk/m/IbvItSfHBAAJ
[2]: https://kunit.dev
[3]: https://docs.kernel.org/dev-tools/kunit/index.html
[4]: http://user-mode-linux.sourceforge.net
[5]: https://lore.kernel.org/all/20220708203052.236290-1-maira.canal@usp.br/

Isabella Basso (4):
  lib/igt_kmod: rename kselftest functions to ktest
  lib/igt_kmod.c: check if module is builtin before attempting to unload
    it
  lib/igt_kmod: add compatibility for KUnit
  tests: DRM selftests: switch to KUnit

 lib/igt_kmod.c       | 315 +++++++++++++++++++++++++++++++++++++++++--
 lib/igt_kmod.h       |  14 +-
 tests/drm_buddy.c    |   7 +-
 tests/drm_mm.c       |   7 +-
 tests/kms_selftest.c |  12 +-
 5 files changed, 329 insertions(+), 26 deletions(-)

-- 
2.37.2

