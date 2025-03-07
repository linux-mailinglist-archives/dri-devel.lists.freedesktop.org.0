Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6865BA569E3
	for <lists+dri-devel@lfdr.de>; Fri,  7 Mar 2025 15:04:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E8DC10EBBE;
	Fri,  7 Mar 2025 14:04:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="DwGKzPBq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9177E10EBBE
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Mar 2025 14:04:14 +0000 (UTC)
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4Z8ShB620xz9ssx;
 Fri,  7 Mar 2025 15:04:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1741356250; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type: content-transfer-encoding:content-transfer-encoding;
 bh=anLulmD0OJDdOodYc4nXV1wUU80sO1SqFOcWb+Yie/E=;
 b=DwGKzPBqqMlqug5z1QRkaKL2rR0md6PaOKcjJmUuK0I8VTzKcmrskbCrEDah8wRPby+1Ne
 o9hKY69tONYRT58O6znTH36bD7jf2HCKkllXucXrR9TiEmeqq94NC46wJ5QsQiqvkKZ/zZ
 2ywBnyZVSSSvUS9GkJlw+x3TQxfN/T6195kx5Lt1IgiuQcyajRvvl2KxXIahiTgM6GnOca
 O5pJeN5nQTCci/C0F+rNbBsntB9sclzZKY23Z4OSAccTAjlqo2OE6nOQxUvvr2A43cAFLn
 Bp2II9vMaChwxVlYuNhV9zVlHLihIuYPRLFQj43puaW2CoegSFBQoweVS5WnRw==
Message-ID: <a7655158a6367ac46194d57f4b7433ef0772a73e.camel@mailbox.org>
Subject: drm_analog_tv_mode: memory Leaks in DRM Kunit Tests
From: Philipp Stanner <phasta@mailbox.org>
To: Maxime Ripard <mripard@kernel.org>
Cc: dri-devel@lists.freedesktop.org
Date: Fri, 07 Mar 2025 15:04:09 +0100
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-ID: 46f25cb4a120132d6a3
X-MBO-RS-META: 6bcehtnbcnp4pk59guqih1za8y1njx1r
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
Reply-To: phasta@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hallo,

so, I was just debugging stuff on drm-misc-next and ran the DRM kunit
tests and found a zoo of memleaks, which you find at the end of this
mail.

How to reproduce:
   1. Check out drm-misc-next @ c82734fbdc50 (HEAD -> drm-misc-next)
      drm/panthor: Update CS_STATUS_ defines to correct valuesmake
      defconfig (on AMD64)make menuconfig -> DRM -> <*> KUnit tests for
      DRM
      (means build hard-wired, not as a module)make modules_install &&
      make installbuild initramfsadd boot loader entryBoot that kernel2
      times: echo "scan"> /sys/kernel/debug/kmemleak=C2=A0cat
      /sys/kernel/debug/kmemleak


Tell me if you need more input or stuff.

P.


Complete output from kmemleak:

cat /sys/kernel/debug/kmemleak unreferenced object 0xffff888104903b00
(size 128): comm "kunit_try_catch", pid 429, jiffies 4294669878 hex
dump (first 32 bytes): bc 34 00 00 d0 02 e0 02 20 03 5a 03 00 00 e0 01
.4...... .Z..... e6 01 ec 01 0d 02 00 00 1a 00 00 00 00 00 00 00
................ backtrace (crc 4b90f964):
__kmalloc_cache_noprof+0x2cd/0x360 drm_analog_tv_mode+0x76/0x23d0
drm_test_cmdline_tv_options+0xcb/0xbe0 kunit_try_run_case+0x1ae/0x490
kunit_generic_run_threadfn_adapter+0x7b/0xe0 kthread+0x30f/0x620
ret_from_fork+0x2f/0x70 ret_from_fork_asm+0x1a/0x30 unreferenced object
0xffff8881089e8000 (size 128): comm "kunit_try_catch", pid 431, jiffies
4294669879 hex dump (first 32 bytes): bc 34 00 00 d0 02 e0 02 20 03 5a
03 00 00 e0 01 .4...... .Z..... e6 01 ec 01 0d 02 00 00 1a 00 00 00 00
00 00 00 ................ backtrace (crc 4b90f964):
__kmalloc_cache_noprof+0x2cd/0x360 drm_analog_tv_mode+0x76/0x23d0
drm_test_cmdline_tv_options+0xcb/0xbe0 kunit_try_run_case+0x1ae/0x490
kunit_generic_run_threadfn_adapter+0x7b/0xe0 kthread+0x30f/0x620
ret_from_fork+0x2f/0x70 ret_from_fork_asm+0x1a/0x30 unreferenced object
0xffff8881047e8200 (size 128): comm "kunit_try_catch", pid 433, jiffies
4294669879 hex dump (first 32 bytes): bc 34 00 00 d0 02 e0 02 20 03 5a
03 00 00 e0 01 .4...... .Z..... e6 01 ec 01 0d 02 00 00 1a 00 00 00 00
00 00 00 ................ backtrace (crc 4b90f964):
__kmalloc_cache_noprof+0x2cd/0x360 drm_analog_tv_mode+0x76/0x23d0
drm_test_cmdline_tv_options+0xcb/0xbe0 kunit_try_run_case+0x1ae/0x490
kunit_generic_run_threadfn_adapter+0x7b/0xe0 kthread+0x30f/0x620
ret_from_fork+0x2f/0x70 ret_from_fork_asm+0x1a/0x30 unreferenced object
0xffff88810397c000 (size 128): comm "kunit_try_catch", pid 435, jiffies
4294669880 hex dump (first 32 bytes): bc 34 00 00 d0 02 dc 02 1c 03 60
03 00 00 40 02 .4........`...@. 45 02 4b 02 71 02 00 00 1a 00 00 00 00
00 00 00 E.K.q........... backtrace (crc c90da5a8):
__kmalloc_cache_noprof+0x2cd/0x360 drm_analog_tv_mode+0x76/0x23d0
drm_test_cmdline_tv_options+0xcb/0xbe0 kunit_try_run_case+0x1ae/0x490
kunit_generic_run_threadfn_adapter+0x7b/0xe0 kthread+0x30f/0x620
ret_from_fork+0x2f/0x70 ret_from_fork_asm+0x1a/0x30 unreferenced object
0xffff8881045fa000 (size 128): comm "kunit_try_catch", pid 437, jiffies
4294669880 hex dump (first 32 bytes): bc 34 00 00 d0 02 e0 02 20 03 5a
03 00 00 e0 01 .4...... .Z..... e6 01 ec 01 0d 02 00 00 1a 00 00 00 00
00 00 00 ................ backtrace (crc 4b90f964):
__kmalloc_cache_noprof+0x2cd/0x360 drm_analog_tv_mode+0x76/0x23d0
drm_test_cmdline_tv_options+0xcb/0xbe0 kunit_try_run_case+0x1ae/0x490
kunit_generic_run_threadfn_adapter+0x7b/0xe0 kthread+0x30f/0x620
ret_from_fork+0x2f/0x70 ret_from_fork_asm+0x1a/0x30 unreferenced object
0xffff88810a536500 (size 128): comm "kunit_try_catch", pid 439, jiffies
4294669881 hex dump (first 32 bytes): bc 34 00 00 d0 02 dc 02 1c 03 60
03 00 00 40 02 .4........`...@. 45 02 4b 02 71 02 00 00 1a 00 00 00 00
00 00 00 E.K.q........... backtrace (crc c90da5a8):
__kmalloc_cache_noprof+0x2cd/0x360 drm_analog_tv_mode+0x76/0x23d0
drm_test_cmdline_tv_options+0xcb/0xbe0 kunit_try_run_case+0x1ae/0x490
kunit_generic_run_threadfn_adapter+0x7b/0xe0 kthread+0x30f/0x620
ret_from_fork+0x2f/0x70 ret_from_fork_asm+0x1a/0x30 unreferenced object
0xffff88810a536600 (size 128): comm "kunit_try_catch", pid 441, jiffies
4294669881 hex dump (first 32 bytes): bc 34 00 00 d0 02 dc 02 1c 03 60
03 00 00 40 02 .4........`...@. 45 02 4b 02 71 02 00 00 1a 00 00 00 00
00 00 00 E.K.q........... backtrace (crc c90da5a8):
__kmalloc_cache_noprof+0x2cd/0x360 drm_analog_tv_mode+0x76/0x23d0
drm_test_cmdline_tv_options+0xcb/0xbe0 kunit_try_run_case+0x1ae/0x490
kunit_generic_run_threadfn_adapter+0x7b/0xe0 kthread+0x30f/0x620
ret_from_fork+0x2f/0x70 ret_from_fork_asm+0x1a/0x30 unreferenced object
0xffff88810a536700 (size 128): comm "kunit_try_catch", pid 443, jiffies
4294669881 hex dump (first 32 bytes): bc 34 00 00 d0 02 e0 02 20 03 5a
03 00 00 e0 01 .4...... .Z..... e6 01 ec 01 0d 02 00 00 1a 00 00 00 00
00 00 00 ................ backtrace (crc 4b90f964):
__kmalloc_cache_noprof+0x2cd/0x360 drm_analog_tv_mode+0x76/0x23d0
drm_test_cmdline_tv_options+0xcb/0xbe0 kunit_try_run_case+0x1ae/0x490
kunit_generic_run_threadfn_adapter+0x7b/0xe0 kthread+0x30f/0x620
ret_from_fork+0x2f/0x70 ret_from_fork_asm+0x1a/0x30 unreferenced object
0xffff88810a536800 (size 128): comm "kunit_try_catch", pid 445, jiffies
4294669881 hex dump (first 32 bytes): bc 34 00 00 d0 02 dc 02 1c 03 60
03 00 00 40 02 .4........`...@. 45 02 4b 02 71 02 00 00 1a 00 00 00 00
00 00 00 E.K.q........... backtrace (crc c90da5a8):
__kmalloc_cache_noprof+0x2cd/0x360 drm_analog_tv_mode+0x76/0x23d0
drm_test_cmdline_tv_options+0xcb/0xbe0 kunit_try_run_case+0x1ae/0x490
kunit_generic_run_threadfn_adapter+0x7b/0xe0 kthread+0x30f/0x620
ret_from_fork+0x2f/0x70 ret_from_fork_asm+0x1a/0x30 unreferenced object
0xffff88810d30d340 (size 16): comm "kunit_try_catch", pid 1265, jiffies
4294670713 hex dump (first 16 bytes): 00 00 00 00 00 00 00 00 0b 00 00
00 0b 00 00 00 ................ backtrace (crc 8a6b9b57):
__kmalloc_cache_noprof+0x2cd/0x360 drm_prime_pages_to_sg+0x48/0x100
drm_gem_shmem_test_get_pages_sgt+0x208/0x910
kunit_try_run_case+0x1ae/0x490
kunit_generic_run_threadfn_adapter+0x7b/0xe0 kthread+0x30f/0x620
ret_from_fork+0x2f/0x70 ret_from_fork_asm+0x1a/0x30 unreferenced object
0xffff88810e8a0a00 (size 128): comm "kunit_try_catch", pid 1355,
jiffies 4294670857 hex dump (first 32 bytes): bc 34 00 00 d0 02 dc 02
1c 03 60 03 00 00 40 02 .4........`...@. 45 02 4b 02 71 02 00 00 1a 00
00 00 00 00 00 00 E.K.q........... backtrace (crc c90da5a8):
__kmalloc_cache_noprof+0x2cd/0x360 drm_analog_tv_mode+0x76/0x23d0
drm_test_modes_analog_tv_mono_576i+0xca/0x7c0
kunit_try_run_case+0x1ae/0x490
kunit_generic_run_threadfn_adapter+0x7b/0xe0 kthread+0x30f/0x620
ret_from_fork+0x2f/0x70 ret_from_fork_asm+0x1a/0x30 unreferenced object
0xffff88810ed1b700 (size 128): comm "kunit_try_catch", pid 1357,
jiffies 4294670859 hex dump (first 32 bytes): bc 34 00 00 d0 02 e0 02
20 03 5a 03 00 00 e0 01 .4...... .Z..... e6 01 ec 01 0d 02 00 00 1a 00
00 00 00 00 00 00 ................ backtrace (crc 4b90f964):
__kmalloc_cache_noprof+0x2cd/0x360 drm_analog_tv_mode+0x76/0x23d0
drm_test_modes_analog_tv_ntsc_480i+0xc7/0x7c0
kunit_try_run_case+0x1ae/0x490
kunit_generic_run_threadfn_adapter+0x7b/0xe0 kthread+0x30f/0x620
ret_from_fork+0x2f/0x70 ret_from_fork_asm+0x1a/0x30 unreferenced object
0xffff88810d0c4a00 (size 128): comm "kunit_try_catch", pid 1359,
jiffies 4294670861 hex dump (first 32 bytes): bc 34 00 00 d0 02 e0 02
20 03 5a 03 00 00 e0 01 .4...... .Z..... e6 01 ec 01 0d 02 00 00 1a 00
00 00 00 00 00 00 ................ backtrace (crc 4b90f964):
__kmalloc_cache_noprof+0x2cd/0x360 drm_analog_tv_mode+0x76/0x23d0
drm_test_modes_analog_tv_ntsc_480i_inlined+0xcd/0x370
kunit_try_run_case+0x1ae/0x490
kunit_generic_run_threadfn_adapter+0x7b/0xe0 kthread+0x30f/0x620
ret_from_fork+0x2f/0x70 ret_from_fork_asm+0x1a/0x30 unreferenced object
0xffff88810d0c4b00 (size 128): comm "kunit_try_catch", pid 1359,
jiffies 4294670861 hex dump (first 32 bytes): bc 34 00 00 d0 02 e0 02
20 03 5a 03 00 00 e0 01 .4...... .Z..... e6 01 ec 01 0d 02 00 00 1a 00
00 00 00 00 00 00 ................ backtrace (crc 4b90f964):
__kmalloc_cache_noprof+0x2cd/0x360 drm_analog_tv_mode+0x76/0x23d0
drm_test_modes_analog_tv_ntsc_480i_inlined+0x175/0x370
kunit_try_run_case+0x1ae/0x490
kunit_generic_run_threadfn_adapter+0x7b/0xe0 kthread+0x30f/0x620
ret_from_fork+0x2f/0x70 ret_from_fork_asm+0x1a/0x30 unreferenced object
0xffff88810e73bc00 (size 128): comm "kunit_try_catch", pid 1361,
jiffies 4294670864 hex dump (first 32 bytes): bc 34 00 00 d0 02 dc 02
1c 03 60 03 00 00 40 02 .4........`...@. 45 02 4b 02 71 02 00 00 1a 00
00 00 00 00 00 00 E.K.q........... backtrace (crc c90da5a8):
__kmalloc_cache_noprof+0x2cd/0x360 drm_analog_tv_mode+0x76/0x23d0
drm_test_modes_analog_tv_pal_576i+0xca/0x7c0
kunit_try_run_case+0x1ae/0x490
kunit_generic_run_threadfn_adapter+0x7b/0xe0 kthread+0x30f/0x620
ret_from_fork+0x2f/0x70 ret_from_fork_asm+0x1a/0x30 unreferenced object
0xffff88810ea02700 (size 128): comm "kunit_try_catch", pid 1363,
jiffies 4294670865 hex dump (first 32 bytes): bc 34 00 00 d0 02 dc 02
1c 03 60 03 00 00 40 02 .4........`...@. 45 02 4b 02 71 02 00 00 1a 00
00 00 00 00 00 00 E.K.q........... backtrace (crc c90da5a8):
__kmalloc_cache_noprof+0x2cd/0x360 drm_analog_tv_mode+0x76/0x23d0
drm_test_modes_analog_tv_pal_576i_inlined+0xd0/0x380
kunit_try_run_case+0x1ae/0x490
kunit_generic_run_threadfn_adapter+0x7b/0xe0 kthread+0x30f/0x620
ret_from_fork+0x2f/0x70 ret_from_fork_asm+0x1a/0x30 unreferenced object
0xffff88810ea02800 (size 128): comm "kunit_try_catch", pid 1363,
jiffies 4294670865 hex dump (first 32 bytes): bc 34 00 00 d0 02 dc 02
1c 03 60 03 00 00 40 02 .4........`...@. 45 02 4b 02 71 02 00 00 1a 00
00 00 00 00 00 00 E.K.q........... backtrace (crc c90da5a8):
__kmalloc_cache_noprof+0x2cd/0x360 drm_analog_tv_mode+0x76/0x23d0
drm_test_modes_analog_tv_pal_576i_inlined+0x17b/0x380
kunit_try_run_case+0x1ae/0x490
kunit_generic_run_threadfn_adapter+0x7b/0xe0 kthread+0x30f/0x620
ret_from_fork+0x2f/0x70 ret_from_fork_asm+0x1a/0x30 unreferenced object
0xffff88810d4ed900 (size 128): comm "kunit_try_catch", pid 1391,
jiffies 4294670884 hex dump (first 32 bytes): bc 34 00 00 d0 02 dc 02
1c 03 60 03 00 00 40 02 .4........`...@. 45 02 4b 02 71 02 00 00 1a 00
00 00 00 00 00 00 E.K.q........... backtrace (crc c90da5a8):
__kmalloc_cache_noprof+0x2cd/0x360 drm_analog_tv_mode+0x76/0x23d0
drm_test_connector_helper_tv_get_modes_check+0x5b9/0x10e0
kunit_try_run_case+0x1ae/0x490
kunit_generic_run_threadfn_adapter+0x7b/0xe0 kthread+0x30f/0x620
ret_from_fork+0x2f/0x70 ret_from_fork_asm+0x1a/0x30 unreferenced object
0xffff88810e74cc00 (size 128): comm "kunit_try_catch", pid 1393,
jiffies 4294670890 hex dump (first 32 bytes): bc 34 00 00 d0 02 e0 02
20 03 5a 03 00 00 e0 01 .4...... .Z..... e6 01 ec 01 0d 02 00 00 1a 00
00 00 00 00 00 00 ................ backtrace (crc 4b90f964):
__kmalloc_cache_noprof+0x2cd/0x360 drm_analog_tv_mode+0x76/0x23d0
drm_test_connector_helper_tv_get_modes_check+0x5b9/0x10e0
kunit_try_run_case+0x1ae/0x490
kunit_generic_run_threadfn_adapter+0x7b/0xe0 kthread+0x30f/0x620
ret_from_fork+0x2f/0x70 ret_from_fork_asm+0x1a/0x30 unreferenced object
0xffff88810e8adb00 (size 128): comm "kunit_try_catch", pid 1395,
jiffies 4294670892 hex dump (first 32 bytes): bc 34 00 00 d0 02 e0 02
20 03 5a 03 00 00 e0 01 .4...... .Z..... e6 01 ec 01 0d 02 00 00 1a 00
00 00 00 00 00 00 ................ backtrace (crc 4b90f964):
__kmalloc_cache_noprof+0x2cd/0x360 drm_analog_tv_mode+0x76/0x23d0
drm_test_connector_helper_tv_get_modes_check+0x5b9/0x10e0
kunit_try_run_case+0x1ae/0x490
kunit_generic_run_threadfn_adapter+0x7b/0xe0 kthread+0x30f/0x620
ret_from_fork+0x2f/0x70 ret_from_fork_asm+0x1a/0x30 unreferenced object
0xffff88810e8adc00 (size 128): comm "kunit_try_catch", pid 1395,
jiffies 4294670892 hex dump (first 32 bytes): bc 34 00 00 d0 02 dc 02
1c 03 60 03 00 00 40 02 .4........`...@. 45 02 4b 02 71 02 00 00 1a 00
00 00 00 00 00 00 E.K.q........... backtrace (crc c90da5a8):
__kmalloc_cache_noprof+0x2cd/0x360 drm_analog_tv_mode+0x76/0x23d0
drm_test_connector_helper_tv_get_modes_check+0x808/0x10e0
kunit_try_run_case+0x1ae/0x490
kunit_generic_run_threadfn_adapter+0x7b/0xe0 kthread+0x30f/0x620
ret_from_fork+0x2f/0x70 ret_from_fork_asm+0x1a/0x30 unreferenced object
0xffff88810ed2a800 (size 128): comm "kunit_try_catch", pid 1397,
jiffies 4294670895 hex dump (first 32 bytes): bc 34 00 00 d0 02 dc 02
1c 03 60 03 00 00 40 02 .4........`...@. 45 02 4b 02 71 02 00 00 1a 00
00 00 00 00 00 00 E.K.q........... backtrace (crc c90da5a8):
__kmalloc_cache_noprof+0x2cd/0x360 drm_analog_tv_mode+0x76/0x23d0
drm_test_connector_helper_tv_get_modes_check+0x5b9/0x10e0
kunit_try_run_case+0x1ae/0x490
kunit_generic_run_threadfn_adapter+0x7b/0xe0 kthread+0x30f/0x620
ret_from_fork+0x2f/0x70 ret_from_fork_asm+0x1a/0x30 unreferenced object
0xffff88810ed2a900 (size 128): comm "kunit_try_catch", pid 1397,
jiffies 4294670895 hex dump (first 32 bytes): bc 34 00 00 d0 02 e0 02
20 03 5a 03 00 00 e0 01 .4...... .Z..... e6 01 ec 01 0d 02 00 00 1a 00
00 00 00 00 00 00 ................ backtrace (crc 4b90f964):
__kmalloc_cache_noprof+0x2cd/0x360 drm_analog_tv_mode+0x76/0x23d0
drm_test_connector_helper_tv_get_modes_check+0x808/0x10e0
kunit_try_run_case+0x1ae/0x490
kunit_generic_run_threadfn_adapter+0x7b/0xe0 kthread+0x30f/0x620
ret_from_fork+0x2f/0x70 ret_from_fork_asm+0x1a/0x30 unreferenced object
0xffff88810e823900 (size 128): comm "kunit_try_catch", pid 1399,
jiffies 4294670897 hex dump (first 32 bytes): bc 34 00 00 d0 02 dc 02
1c 03 60 03 00 00 40 02 .4........`...@. 45 02 4b 02 71 02 00 00 1a 00
00 00 00 00 00 00 E.K.q........... backtrace (crc c90da5a8):
__kmalloc_cache_noprof+0x2cd/0x360 drm_analog_tv_mode+0x76/0x23d0
drm_test_connector_helper_tv_get_modes_check+0x5b9/0x10e0
kunit_try_run_case+0x1ae/0x490
kunit_generic_run_threadfn_adapter+0x7b/0xe0 kthread+0x30f/0x620
ret_from_fork+0x2f/0x70 ret_from_fork_asm+0x1a/0x30 unreferenced object
0xffff88810e823a00 (size 128): comm "kunit_try_catch", pid 1399,
jiffies 4294670897 hex dump (first 32 bytes): bc 34 00 00 d0 02 e0 02
20 03 5a 03 00 00 e0 01 .4...... .Z..... e6 01 ec 01 0d 02 00 00 1a 00
00 00 00 00 00 00 ................ backtrace (crc 4b90f964):
__kmalloc_cache_noprof+0x2cd/0x360 drm_analog_tv_mode+0x76/0x23d0
drm_test_connector_helper_tv_get_modes_check+0x808/0x10e0
kunit_try_run_case+0x1ae/0x490
kunit_generic_run_threadfn_adapter+0x7b/0xe0 kthread+0x30f/0x620
ret_from_fork+0x2f/0x70 ret_from_fork_asm+0x1a/0x30 unreferenced object
0xffff88810e570500 (size 128): comm "kunit_try_catch", pid 1401,
jiffies 4294670899 hex dump (first 32 bytes): bc 34 00 00 d0 02 e0 02
20 03 5a 03 00 00 e0 01 .4...... .Z..... e6 01 ec 01 0d 02 00 00 1a 00
00 00 00 00 00 00 ................ backtrace (crc 4b90f964):
__kmalloc_cache_noprof+0x2cd/0x360 drm_analog_tv_mode+0x76/0x23d0
drm_test_connector_helper_tv_get_modes_check+0x5b9/0x10e0
kunit_try_run_case+0x1ae/0x490
kunit_generic_run_threadfn_adapter+0x7b/0xe0 kthread+0x30f/0x620
ret_from_fork+0x2f/0x70 ret_from_fork_asm+0x1a/0x30 unreferenced object
0xffff88810e570600 (size 128): comm "kunit_try_catch", pid 1401,
jiffies 4294670899 hex dump (first 32 bytes): bc 34 00 00 d0 02 dc 02
1c 03 60 03 00 00 40 02 .4........`...@. 45 02 4b 02 71 02 00 00 1a 00
00 00 00 00 00 00 E.K.q........... backtrace (crc c90da5a8):
__kmalloc_cache_noprof+0x2cd/0x360 drm_analog_tv_mode+0x76/0x23d0
drm_test_connector_helper_tv_get_modes_check+0x808/0x10e0
kunit_try_run_case+0x1ae/0x490
kunit_generic_run_threadfn_adapter+0x7b/0xe0 kthread+0x30f/0x620
ret_from_fork+0x2f/0x70 ret_from_fork_asm+0x1a/0x30

