Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 245867A41FF
	for <lists+dri-devel@lfdr.de>; Mon, 18 Sep 2023 09:17:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9397F10E1CB;
	Mon, 18 Sep 2023 07:17:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 436 seconds by postgrey-1.36 at gabe;
 Wed, 13 Sep 2023 12:09:43 UTC
Received: from mx1.heh.ee (heh.ee [213.35.143.160])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4C0B10E4A6
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Sep 2023 12:09:43 +0000 (UTC)
Received: from [10.0.0.254] (unknown [10.0.0.254])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested)
 by mx1.heh.ee (Hehee) with ESMTPSA id 5F2FA174BC8;
 Wed, 13 Sep 2023 15:02:24 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ristioja.ee; s=mail;
 t=1694606544; bh=xjg/VjIRLVZ4lO229orujo77kOdOiSLjyh9ozzagUSY=;
 h=Date:From:Subject:To:Cc;
 b=T54+SNP3w+Wt+0C8wVLXhppKF4sUvKXSDdoahaZ+8j9JdPpYK8xx8+AhsjUhrsK1H
 Cn+pMeTBG5xHIaGUI0R0avqM12d4sbi6vPh1mEVhphego9mJDRpxdACTruRGFtl/od
 F7T/y6vgPnonRmYsOGHeJRD7rdKOCx907YlHR9lQ=
Message-ID: <7c50e051-eba2-09fc-da9f-023d592de457@ristioja.ee>
Date: Wed, 13 Sep 2023 15:02:26 +0300
MIME-Version: 1.0
User-Agent: undefined
Content-Language: et-EE, en-US
From: Jaak Ristioja <jaak@ristioja.ee>
Subject: Blank screen on boot of Linux 6.5 and later on Lenovo ThinkPad L570
To: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Mon, 18 Sep 2023 07:16:21 +0000
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
Cc: Huacai Chen <chenhuacai@kernel.org>, javierm@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello,

Upgrading to Linux 6.5 on a Lenovo ThinkPad L570 (Integrated Intel HD 
Graphics 620 (rev 02), Intel(R) Core(TM) i7-7500U) results in a blank 
screen after boot until the display manager starts... if it does start 
at all. Using the nomodeset kernel parameter seems to be a workaround.

I've bisected this to commit 60aebc9559492cea6a9625f514a8041717e3a2e4 
("drivers/firmware: Move sysfb_init() from device_initcall to 
subsys_initcall_sync").

Any ideas?

Best regards,
Jaak Ristioja


git bisect start
# status: waiting for both good and bad commits
# good: [6995e2de6891c724bfeb2db33d7b87775f913ad1] Linux 6.4
git bisect good 6995e2de6891c724bfeb2db33d7b87775f913ad1
# status: waiting for bad commit, 1 good commit known
# bad: [2dde18cd1d8fac735875f2e4987f11817cc0bc2c] Linux 6.5
git bisect bad 2dde18cd1d8fac735875f2e4987f11817cc0bc2c
# bad: [b775d6c5859affe00527cbe74263de05cfe6b9f9] Merge tag 'mips_6.5' 
of git://git.kernel.org/pub/scm/linux/kernel/git/mips/linux
git bisect bad b775d6c5859affe00527cbe74263de05cfe6b9f9
# good: [3a8a670eeeaa40d87bd38a587438952741980c18] Merge tag 
'net-next-6.5' of 
git://git.kernel.org/pub/scm/linux/kernel/git/netdev/net-next
git bisect good 3a8a670eeeaa40d87bd38a587438952741980c18
# bad: [188d3f80fc6d8451ab5e570becd6a7b2d3033023] drm/amdgpu: vcn_4_0 
set instance 0 init sched score to 1
git bisect bad 188d3f80fc6d8451ab5e570becd6a7b2d3033023
# good: [12fb1ad70d65edc3405884792d044fa79df7244f] drm/amdkfd: update 
process interrupt handling for debug events
git bisect good 12fb1ad70d65edc3405884792d044fa79df7244f
# bad: [9cc31938d4586f72eb8e0235ad9d9eb22496fcee] i915/perf: Drop the 
aging_tail logic in perf OA
git bisect bad 9cc31938d4586f72eb8e0235ad9d9eb22496fcee
# bad: [51d86ee5e07ccef85af04ee9850b0baa107999b6] drm/msm: Switch to 
fdinfo helper
git bisect bad 51d86ee5e07ccef85af04ee9850b0baa107999b6
# good: [bfdede3a58ea970333d77a05144a7bcec13cf515] drm/rockchip: cdn-dp: 
call drm_connector_update_edid_property() unconditionally
git bisect good bfdede3a58ea970333d77a05144a7bcec13cf515
# good: [123ee07ba5b7123e0ce0e0f9d64938026c16a2ce] drm: sun4i_tcon: use 
devm_clk_get_enabled in `sun4i_tcon_init_clocks`
git bisect good 123ee07ba5b7123e0ce0e0f9d64938026c16a2ce
# bad: [20d54e48d9c705091a025afff5839da2ea606f6b] fbdev: Rename 
fb_mem*() helpers
git bisect bad 20d54e48d9c705091a025afff5839da2ea606f6b
# bad: [728cb3f061e2b3a002fd76d91c2449b1497b6640] gpu: drm: bridge: No 
need to set device_driver owner
git bisect bad 728cb3f061e2b3a002fd76d91c2449b1497b6640
# bad: [0f1cb4d777281ca3360dbc8959befc488e0c327e] drm/ssd130x: Fix 
include guard name
git bisect bad 0f1cb4d777281ca3360dbc8959befc488e0c327e
# good: [0bd5bd65cd2e4d1335ea6c17cd2c8664decbc630] dt-bindings: display: 
simple: Add BOE EV121WXM-N10-1850 panel
git bisect good 0bd5bd65cd2e4d1335ea6c17cd2c8664decbc630
# bad: [60aebc9559492cea6a9625f514a8041717e3a2e4] drivers/firmware: Move 
sysfb_init() from device_initcall to subsys_initcall_sync
git bisect bad 60aebc9559492cea6a9625f514a8041717e3a2e4
# good: [8bb7c7bca5b70f3cd22d95b4d36029295c4274f6] drm/panel: 
panel-simple: Add BOE EV121WXM-N10-1850 panel support
git bisect good 8bb7c7bca5b70f3cd22d95b4d36029295c4274f6
# first bad commit: [60aebc9559492cea6a9625f514a8041717e3a2e4] 
drivers/firmware: Move sysfb_init() from device_initcall to 
subsys_initcall_sync
