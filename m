Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CD76B7AEB2E
	for <lists+dri-devel@lfdr.de>; Tue, 26 Sep 2023 13:15:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5891410E3A8;
	Tue, 26 Sep 2023 11:15:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de
 [80.237.130.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EFA810E3A8
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Sep 2023 11:15:40 +0000 (UTC)
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
 by wp530.webpack.hosteurope.de running ExIM with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 id 1ql62Q-0005FQ-74; Tue, 26 Sep 2023 13:15:34 +0200
Message-ID: <31bdf7b1-0ed9-4217-b459-1d857e53120b@leemhuis.info>
Date: Tue, 26 Sep 2023 13:15:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Blank screen on boot of Linux 6.5 and later on Lenovo ThinkPad
 L570
Content-Language: en-US, de-DE
To: Huacai Chen <chenhuacai@kernel.org>
References: <7c50e051-eba2-09fc-da9f-023d592de457@ristioja.ee>
From: "Linux regression tracking (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
In-Reply-To: <7c50e051-eba2-09fc-da9f-023d592de457@ristioja.ee>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de; regressions@leemhuis.info; 1695726941;
 7b051caa; 
X-HE-SMSGID: 1ql62Q-0005FQ-74
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
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
Cc: Jaak Ristioja <jaak@ristioja.ee>, javierm@redhat.com,
 dri-devel@lists.freedesktop.org,
 Linux kernel regressions list <regressions@lists.linux.dev>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

[CCing the regression list, as it should be in the loop for regressions:
https://docs.kernel.org/admin-guide/reporting-regressions.html]

Hi, Thorsten here, the Linux kernel's regression tracker.

On 13.09.23 14:02, Jaak Ristioja wrote:
> 
> Upgrading to Linux 6.5 on a Lenovo ThinkPad L570 (Integrated Intel HD
> Graphics 620 (rev 02), Intel(R) Core(TM) i7-7500U) results in a blank
> screen after boot until the display manager starts... if it does start
> at all. Using the nomodeset kernel parameter seems to be a workaround.
> 
> I've bisected this to commit 60aebc9559492cea6a9625f514a8041717e3a2e4
> ("drivers/firmware: Move sysfb_init() from device_initcall to
> subsys_initcall_sync").

Hmmm, no reaction since it was posted a while ago, unless I'm missing
something.

Huacai Chen, did you maybe miss this report? The problem is apparently
caused by a commit of yours (that Javier applied), you hence should look
into this.

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
If I did something stupid, please tell me, as explained on that page.

> git bisect start
> # status: waiting for both good and bad commits
> # good: [6995e2de6891c724bfeb2db33d7b87775f913ad1] Linux 6.4
> git bisect good 6995e2de6891c724bfeb2db33d7b87775f913ad1
> # status: waiting for bad commit, 1 good commit known
> # bad: [2dde18cd1d8fac735875f2e4987f11817cc0bc2c] Linux 6.5
> git bisect bad 2dde18cd1d8fac735875f2e4987f11817cc0bc2c
> # bad: [b775d6c5859affe00527cbe74263de05cfe6b9f9] Merge tag 'mips_6.5'
> of git://git.kernel.org/pub/scm/linux/kernel/git/mips/linux
> git bisect bad b775d6c5859affe00527cbe74263de05cfe6b9f9
> # good: [3a8a670eeeaa40d87bd38a587438952741980c18] Merge tag
> 'net-next-6.5' of
> git://git.kernel.org/pub/scm/linux/kernel/git/netdev/net-next
> git bisect good 3a8a670eeeaa40d87bd38a587438952741980c18
> # bad: [188d3f80fc6d8451ab5e570becd6a7b2d3033023] drm/amdgpu: vcn_4_0
> set instance 0 init sched score to 1
> git bisect bad 188d3f80fc6d8451ab5e570becd6a7b2d3033023
> # good: [12fb1ad70d65edc3405884792d044fa79df7244f] drm/amdkfd: update
> process interrupt handling for debug events
> git bisect good 12fb1ad70d65edc3405884792d044fa79df7244f
> # bad: [9cc31938d4586f72eb8e0235ad9d9eb22496fcee] i915/perf: Drop the
> aging_tail logic in perf OA
> git bisect bad 9cc31938d4586f72eb8e0235ad9d9eb22496fcee
> # bad: [51d86ee5e07ccef85af04ee9850b0baa107999b6] drm/msm: Switch to
> fdinfo helper
> git bisect bad 51d86ee5e07ccef85af04ee9850b0baa107999b6
> # good: [bfdede3a58ea970333d77a05144a7bcec13cf515] drm/rockchip: cdn-dp:
> call drm_connector_update_edid_property() unconditionally
> git bisect good bfdede3a58ea970333d77a05144a7bcec13cf515
> # good: [123ee07ba5b7123e0ce0e0f9d64938026c16a2ce] drm: sun4i_tcon: use
> devm_clk_get_enabled in `sun4i_tcon_init_clocks`
> git bisect good 123ee07ba5b7123e0ce0e0f9d64938026c16a2ce
> # bad: [20d54e48d9c705091a025afff5839da2ea606f6b] fbdev: Rename
> fb_mem*() helpers
> git bisect bad 20d54e48d9c705091a025afff5839da2ea606f6b
> # bad: [728cb3f061e2b3a002fd76d91c2449b1497b6640] gpu: drm: bridge: No
> need to set device_driver owner
> git bisect bad 728cb3f061e2b3a002fd76d91c2449b1497b6640
> # bad: [0f1cb4d777281ca3360dbc8959befc488e0c327e] drm/ssd130x: Fix
> include guard name
> git bisect bad 0f1cb4d777281ca3360dbc8959befc488e0c327e
> # good: [0bd5bd65cd2e4d1335ea6c17cd2c8664decbc630] dt-bindings: display:
> simple: Add BOE EV121WXM-N10-1850 panel
> git bisect good 0bd5bd65cd2e4d1335ea6c17cd2c8664decbc630
> # bad: [60aebc9559492cea6a9625f514a8041717e3a2e4] drivers/firmware: Move
> sysfb_init() from device_initcall to subsys_initcall_sync
> git bisect bad 60aebc9559492cea6a9625f514a8041717e3a2e4
> # good: [8bb7c7bca5b70f3cd22d95b4d36029295c4274f6] drm/panel:
> panel-simple: Add BOE EV121WXM-N10-1850 panel support
> git bisect good 8bb7c7bca5b70f3cd22d95b4d36029295c4274f6
> # first bad commit: [60aebc9559492cea6a9625f514a8041717e3a2e4]
> drivers/firmware: Move sysfb_init() from device_initcall to
> subsys_initcall_sync
