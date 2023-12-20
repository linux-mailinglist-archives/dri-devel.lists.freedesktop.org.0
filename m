Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DCD98819D7B
	for <lists+dri-devel@lfdr.de>; Wed, 20 Dec 2023 12:01:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 701D510E0A7;
	Wed, 20 Dec 2023 11:01:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [IPv6:2a00:1098:ed:100::25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D78D10E0A7
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Dec 2023 11:01:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1703070069;
 bh=I8w6PJkXNy6rGE5GGqTHbqFhMg1a+ToqNjIbCukuil0=;
 h=Date:From:To:Subject:Cc:From;
 b=KAhXTKbP5GZ808RucxdEt0Yi8apDhn2C0GdSuPTEeT0Fg62Jm6jhG6AsTx8AKuF+5
 ma9qQC0aLRndsqZ+y8P3UcwHfpIMQ6AlJScqbjDcVJSYjrvpCMYJcOqTBG5oywNLgo
 Dn5XMveGxiHAYWjhtm2HTZ5kbOkDhVKWbesjc/YSlgw3W7gKnKTznpqVrP/5bugDkB
 Lz7hWvkIan9gFFKeEwyLOt+h1awLjdHPm/O5JOZmDThT5lDeTVzWblCrlM2qp/US88
 o+HiNTfw1tKrp73p1RIZvoLrSravFrxoz5Btb3yffuEcGptaLsrihAWeUVEL+xcbfu
 QIMAduUkoV1VQ==
Received: from [100.66.96.193] (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: vignesh)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id E985B3781FED;
 Wed, 20 Dec 2023 11:01:05 +0000 (UTC)
Message-ID: <bdb53650-1888-30b8-93ee-2290d020af4a@collabora.com>
Date: Wed, 20 Dec 2023 16:31:02 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
From: Vignesh Raman <vignesh.raman@collabora.com>
To: hjc@rock-chips.com, heiko@sntech.de
Subject: Flaky tests for rockchip rk3288/rk3399
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
Cc: Daniel Stone <daniels@collabora.com>, linux-rockchip@lists.infradead.org,
 Guilherme Alcarde Gallo <guilherme.gallo@collabora.com>,
 Sergi Blanch Torne <sergi.blanch.torne@collabora.com>,
 dri-devel@lists.freedesktop.org,
 David Heidelberg <david.heidelberg@collabora.com>,
 Helen Mae Koike Fornazier <helen.koike@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Maintainers,

There are some flaky tests reported for rk3288 and rk3399 rockchip-drm 
display driver testing in drm-ci.

=== rockchip rk3288 ===
# Board Name: rk3288-veyron-jaq.dtb
# Failure Rate: 50
# IGT Version: 1.28-gd2af13d9f
# Linux Version: 6.7.0-rc3

Pipeline url:
https://gitlab.freedesktop.org/vigneshraman/linux/-/jobs/52974828
https://gitlab.freedesktop.org/vigneshraman/linux/-/jobs/52979524
https://gitlab.freedesktop.org/vigneshraman/linux/-/jobs/52933410

# Reported by deqp-runner
kms_cursor_crc@cursor-offscreen-64x21
kms_cursor_crc@cursor-offscreen-32x32

kms_cursor_legacy@flip-vs-cursor-legacy:
(kms_cursor_legacy:1366) CRITICAL: Test assertion failure function 
flip_vs_cursor, file ../tests/kms_cursor_legacy.c:1015:
(kms_cursor_legacy:1366) CRITICAL: Failed assertion: 
kmstest_get_vblank(display->drm_fd, pipe, 0) == vblank_start
(kms_cursor_legacy:1366) CRITICAL: error: 25330 != 25329
Received signal SIGSEGV.

# The below test shows inconsistency across multiple runs, giving
# results of Pass and Crash alternately.
kms_cursor_crc@cursor-size-change:
(kms_cursor_crc:1047) igt_pipe_crc-CRITICAL: Test assertion failure 
function igt_assert_crc_equal, file ../lib/igt_pipe_crc.c:112:
(kms_cursor_crc:1047) igt_pipe_crc-CRITICAL: Failed assertion: !mismatch 
|| igt_skip_crc_compare
(kms_cursor_crc:1047) igt_pipe_crc-CRITICAL: Last errno: 11, Resource 
temporarily unavailable
Received signal SIGSEGV.


=== rockchip rk3399 ===
# Board Name: rk3399-gru-kevin.dtb
# Failure Rate: 50
# IGT Version: 1.28-gd2af13d9f
# Linux Version: 6.7.0-rc3

Pipeline url:
https://gitlab.freedesktop.org/vigneshraman/linux/-/jobs/52978575
https://gitlab.freedesktop.org/vigneshraman/linux/-/jobs/52940368
https://gitlab.freedesktop.org/vigneshraman/linux/-/jobs/52933412
https://gitlab.freedesktop.org/vigneshraman/linux/-/jobs/52929703

# Reported by deqp-runner
kms_color@gamma
kms_cursor_legacy@cursorA-vs-flipA-toggle
kms_flip@dpms-vs-vblank-race
kms_flip@dpms-vs-vblank-race-interruptible
kms_flip@flip-vs-absolute-wf_vblank-interruptible
kms_flip@flip-vs-wf_vblank-interruptible
kms_flip@modeset-vs-vblank-race-interruptible
kms_pipe_crc_basic@compare-crc-sanitycheck-xr24
kms_setmode@basic

# The below test shows inconsistency across multiple runs, giving
# results of Pass and Fail alternately.
kms_cursor_crc@cursor-rapid-movement-32x10:
(kms_cursor_crc:1495) igt_fb-DEBUG: Test requirement passed: 
cairo_surface_status(fb->cairo_surface) == CAIRO_STATUS_SUCCESS
(kms_cursor_crc:1495) igt_core-INFO: Timed out: Opening crc fd, and poll 
for first CRC.

I will add these tests in 
drivers/gpu/drm/ci/xfails/rockchip-rk3288-display-flakes.txt and 
drivers/gpu/drm/ci/xfails/rockchip-rk3399-display-flakes.txt 
(https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/tree/Documentation/gpu/automated_testing.rst#n70)

Please could you have a look at these test results and let us know if 
you need more information. Thank you.

Regards,
Vignesh
