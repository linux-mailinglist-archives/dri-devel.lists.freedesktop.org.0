Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B0C2281850E
	for <lists+dri-devel@lfdr.de>; Tue, 19 Dec 2023 11:11:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 513A610E43D;
	Tue, 19 Dec 2023 10:11:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [IPv6:2a00:1098:ed:100::25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CD4510E43D
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Dec 2023 10:11:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1702980661;
 bh=pj0lIA9Q31kjFuIIwauPHWLe6dxO8mUSAxs/Y/O05fE=;
 h=Date:From:Subject:To:Cc:From;
 b=EuVUp0u4zuytOE5fNxYB3j0yd1OVnJEE6GLKgLjmx/aFplW/WyN4tgOgknfIe9b0A
 v3/EpqhI1xCdZzEwMeldks2pNcvohMiMagZdm8DuZVu1R5QORuji7KLb/mJEqouiZ5
 KUKUnQncTevvLo/cjNka/c3mYE31RndhdxL4nbHSmVgNZ+tY9sSaRlBx1mGOCIKOlz
 cr0dyM3Wr73Gt/YJDejfTmUzKmnFpnBBPKmEIZ28cdf23z1XevP16lXWYT2Vwp5NuZ
 PsFhC6bxYFAagBQJKem62asn0n3vgqyZAWOaroajRPoqWBEmwCMlYDOmvSWU39TIPT
 MMJRHPrGfxbgw==
Received: from [100.66.96.193] (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: vignesh)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 1C37D37813F2;
 Tue, 19 Dec 2023 10:10:57 +0000 (UTC)
Message-ID: <931e3f9a-9c5c-fc42-16fc-abaac4e0c0ff@collabora.com>
Date: Tue, 19 Dec 2023 15:40:49 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
From: Vignesh Raman <vignesh.raman@collabora.com>
Subject: Flaky tests for mediatek mt8173/mt8183
Content-Language: en-US
To: chunkuang.hu@kernel.org, p.zabel@pengutronix.de
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: Daniel Stone <daniels@collabora.com>,
 Guilherme Alcarde Gallo <guilherme.gallo@collabora.com>,
 Sergi Blanch Torne <sergi.blanch.torne@collabora.com>,
 dri-devel@lists.freedesktop.org,
 David Heidelberg <david.heidelberg@collabora.com>,
 Helen Mae Koike Fornazier <helen.koike@collabora.com>,
 linux-mediatek@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Maintainers,

There are some flaky tests reported for mediatek mt8173 and mt8183 
display driver testing in drm-ci.

=== mediatek mt8173 ===
# Board Name: mt8173-elm-hana.dtb
# Linux Version: 6.7.0-rc3
# IGT Version: 1.28-gd2af13d9f
# Failure Rate: 50

Pipeline url:
https://gitlab.freedesktop.org/vigneshraman/linux/-/jobs/52857571
https://gitlab.freedesktop.org/vigneshraman/linux/-/jobs/52923475

Below test shows inconsistency across multiple runs, giving
results of Pass and Timeout/Fail alternately

kms_cursor_legacy@cursor-vs-flip-atomic-transitions: Timeout and also 
reported as flaky by deqp-runner:
Starting subtest: cursor-vs-flip-atomic-transitions
Using pipe A & eDP-1
Using a target of 128 cursor updates per quarter-vblank
page flip 8 was delayed, missed 6 frames
page flip 25 was delayed, missed 6 frames
page flip 1 was delayed, missed 15 frames

kms_prop_blob@invalid-set-prop (Fail):
CRITICAL: Test assertion failure function prop_tests, file ../tests 
/kms_prop_blob.c:342:
CRITICAL: Failed assertion: drmIoctl(fd, DRM_IOCTL_MODE_OBJ_SETPROPERTY, 
&set_prop) == -1 && errno == EINVAL
CRITICAL: Last errno: 13, Permission denied
igt_core-INFO: Stack trace:
igt_core-INFO:   #0 ../lib/igt_core.c:1988 __igt_fail_assert()
igt_core-INFO:   #1 ../tests/kms_prop_blob.c:312 prop_tests()
igt_core-INFO:   #2 ../tests/kms_prop_blob.c:382 
__igt_unique____real_main350()
igt_core-INFO:   #3 ../tests/kms_prop_blob.c:350 main()
igt_core-INFO:   #4 [__libc_init_first+0x80]
igt_core-INFO:   #5 [__libc_start_main+0x98]
igt_core-INFO:   #6 [_start+0x30]

kms_prop_blob@invalid-set-prop-any (Fail):
CRITICAL: Test assertion failure function prop_tests, file 
../tests/kms_prop_blob.c:334:
CRITICAL: Failed assertion: drmIoctl(fd, DRM_IOCTL_MODE_OBJ_SETPROPERTY, 
&set_prop) == -1 && errno == EINVAL
CRITICAL: Last errno: 13, Permission denied
igt_core-INFO: Stack trace:
igt_core-INFO:   #0 ../lib/igt_core.c:1988 __igt_fail_assert()
igt_core-INFO:   #1 ../tests/kms_prop_blob.c:321 prop_tests()
igt_core-INFO:   #2 ../tests/kms_prop_blob.c:382 
__igt_unique____real_main350()
igt_core-INFO:   #3 ../tests/kms_prop_blob.c:350 main()
igt_core-INFO:   #4 [__libc_init_first+0x80]
igt_core-INFO:   #5 [__libc_start_main+0x98]
igt_core-INFO:   #6 [_start+0x30]

=== mediatek mt8183 ===
# Board Name: mt8183-kukui-jacuzzi-juniper-sku16.dtb
# Linux Version: 6.7.0-rc3
# IGT Version: 1.28-gd2af13d9f
# Failure Rate: 100

Pipeline url:
https://gitlab.freedesktop.org/vigneshraman/linux/-/jobs/52925486

# Reported as flaky by deqp-runner
kms_cursor_legacy@cursor-vs-flip-atomic-transitions:

Starting subtest: cursor-vs-flip-atomic-transitions
Using pipe A & eDP-1
Using a target of 128 cursor updates per quarter-vblank
page flip 1 was delayed, missed 2 frames
page flip 2 was delayed, missed 9 frames
page flip 7 was delayed, missed 1 frames
page flip 8 was delayed, missed 2 frames

I will add these tests in 
drivers/gpu/drm/ci/xfails/mediatek-mt8173-display-flakes.txt and 
drivers/gpu/drm/ci/xfails/mediatek-mt8183-display-flakes.txt 
(https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/tree/Documentation/gpu/automated_testing.rst#n70)

Please could you have a look at these failures and let us know if you 
need more information. Thank you.

Regards,
Vignesh
