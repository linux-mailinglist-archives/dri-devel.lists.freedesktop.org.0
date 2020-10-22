Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E6CDB295921
	for <lists+dri-devel@lfdr.de>; Thu, 22 Oct 2020 09:28:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C13806F3E9;
	Thu, 22 Oct 2020 07:28:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from merlin.infradead.org (merlin.infradead.org
 [IPv6:2001:8b0:10b:1231::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C95F6E088;
 Thu, 22 Oct 2020 03:13:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
 MIME-Version:Date:Message-ID:Subject:From:To:Sender:Reply-To:Cc:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=RL7EyLAiVLAAeA+tUVQwFvcPYCCvhKb12p82G8TEkTo=; b=qVx+QeRqcAm8L/kfhJPvBHOhvf
 zywkOI2KHXHxpX67DvRgPsf4SBEeWpNkz0zJM9bsY2YfwyQSkkO7q3dG7P94XXH3doGvRYuJ33IAo
 qx/QovdwX/RUHhkWczdjxQGvJ+OET9lPyHQ7HJMyMh2APR8wEbpwEyzRqRrIrvW/+j5qaasMMNJ5G
 MZQa9A5FY/ahldreaf8L2v9YqHBp4ZvSZ5Sn5Xl/rlAyzjQd1xRf4UOwfiwyV14N1yw6Y0RKWX8Rh
 QLY02+0LfpQL/t1PWW7GjHCHXaLk9Z70F35yzNgujF0YrK9ICje9+DOnjHNhqAv2/07lh3WaM5COe
 i6/qH1NQ==;
Received: from [2601:1c0:6280:3f0::507c]
 by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kVR2w-0005G5-TS; Thu, 22 Oct 2020 03:13:47 +0000
To: dri-devel <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, intel-gfx <intel-gfx@lists.freedesktop.org>
From: Randy Dunlap <rdunlap@infradead.org>
Subject: drm_modes: signed integer overflow
Message-ID: <47527cdb-2eda-b5a3-d77c-3855b91a0b61@infradead.org>
Date: Wed, 21 Oct 2020 20:13:43 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
Content-Language: en-US
X-Mailman-Approved-At: Thu, 22 Oct 2020 07:27:48 +0000
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

With linux-next 20201021, when booting up, I am seeing this:

[    0.560896] UBSAN: signed-integer-overflow in ../drivers/gpu/drm/drm_modes.c:765:20
[    0.560903] 2376000 * 1000 cannot be represented in type 'int'
[    0.560909] CPU: 3 PID: 7 Comm: kworker/u16:0 Not tainted 5.9.0-next-20201021 #2
[    0.560914] Hardware name: TOSHIBA PORTEGE R835/Portable PC, BIOS Version 4.10   01/08/2013
[    0.560924] Workqueue: events_unbound async_run_entry_fn

[    0.560930] Call Trace:
[    0.560938]  dump_stack+0x5e/0x74
[    0.560943]  ubsan_epilogue+0x9/0x45
[    0.560948]  handle_overflow+0x8b/0x98
[    0.560953]  ? set_track+0x3f/0xad
[    0.560958]  __ubsan_handle_mul_overflow+0xe/0x10
[    0.560964]  drm_mode_vrefresh+0x4a/0xbc
[    0.560970] initcall i915_init+0x0/0x6a returned 0 after 116076 usecs
[    0.560974] calling  cn_proc_init+0x0/0x36 @ 1
[    0.560978]  cea_mode_alternate_clock+0x11/0x62
[    0.560985]  drm_match_cea_mode+0xc7/0x1e7
[    0.560987] initcall cn_proc_init+0x0/0x36 returned 0 after 3 usecs
[    0.560990] calling  topology_sysfs_init+0x0/0x2d @ 1
[    0.561000]  drm_mode_validate_ycbcr420+0xd/0x48
[    0.561005]  drm_helper_probe_single_connector_modes+0x6db/0x7da
[    0.561012]  drm_client_modeset_probe+0x225/0x143f
[    0.561018]  ? bitmap_fold+0x8a/0x8a
[    0.561023]  ? update_cfs_rq_load_avg+0x192/0x1a2
[    0.561029]  __drm_fb_helper_initial_config_and_unlock+0x3f/0x5b7
[    0.561035]  ? get_sd_balance_interval+0x1c/0x40
[    0.561040]  drm_fb_helper_initial_config+0x48/0x4f
[    0.561047]  intel_fbdev_initial_config+0x13/0x23
[    0.561052]  async_run_entry_fn+0x89/0x15c
[    0.561058]  process_one_work+0x15c/0x1f3
[    0.561064]  worker_thread+0x1ac/0x25d
[    0.561069]  ? process_scheduled_works+0x2e/0x2e
[    0.561074]  kthread+0x10e/0x116
[    0.561078]  ? kthread_parkme+0x1c/0x1c
[    0.561083]  ret_from_fork+0x22/0x30
[    0.561087] ================================================================================

-- 
~Randy
Reported-by: Randy Dunlap <rdunlap@infradead.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
