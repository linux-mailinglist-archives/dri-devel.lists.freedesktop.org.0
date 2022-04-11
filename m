Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C8764FC7AA
	for <lists+dri-devel@lfdr.de>; Tue, 12 Apr 2022 00:28:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C7AD10E090;
	Mon, 11 Apr 2022 22:27:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BC0B10E090;
 Mon, 11 Apr 2022 22:27:57 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id CC88761776;
 Mon, 11 Apr 2022 22:27:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E97D8C385A3;
 Mon, 11 Apr 2022 22:27:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649716074;
 bh=6KzJ2U0BFdGw2Dd8rbf6y6V7A15Lm+p/0Tn+UumRDOY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=K1j63g7tC590U21DUMNKsqyemPNIWT5VJStqo81Au9EANSGT1x8e/D6dg3f3YIF4y
 sdAmklvNYIdvtDt49nAP4g09t7MSmq2d13Hw3qUzXrSdxpNEVbwgLk1cf41huMgutF
 FztrMpiy6b7Pb8REOkIOuFmDgjiKjPaKD/PzAhhEs5iicxB0MzxjBoG5Z+4bEn54/D
 xHqtspxYuySq+RsBQGt80Uj2LOq+BWxtGb0zwumjr75AskF8IIjXiQBx6nFQ2cxPR+
 PnIq10asbaoKbshZcqKpZk+T4WsiytfXKdL5xQHiS7bT9KRdxjhurlCbkr3IsuzJdd
 ae9r6UZHnkyWg==
Date: Mon, 11 Apr 2022 15:27:47 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH v3 14/17] fbcon: Move console_lock for
 register/unlink/unregister
Message-ID: <YlSrYyVlcq/gHV5T@dev-arch.thelio-3990X>
References: <20220405210335.3434130-1-daniel.vetter@ffwll.ch>
 <20220405210335.3434130-15-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220405210335.3434130-15-daniel.vetter@ffwll.ch>
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
Cc: Xiyu Yang <xiyuyang19@fudan.edu.cn>, Du Cheng <ducheng2@gmail.com>,
 Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Zheyu Ma <zheyuma97@gmail.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Claudio Suarez <cssk@net-c.es>, Matthew Wilcox <willy@infradead.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Zhen Lei <thunder.leizhen@huawei.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Daniel Vetter <daniel.vetter@intel.com>, Sam Ravnborg <sam@ravnborg.org>,
 Guenter Roeck <linux@roeck-us.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Daniel,

On Tue, Apr 05, 2022 at 11:03:32PM +0200, Daniel Vetter wrote:
> Ideally console_lock becomes an implementation detail of fbcon.c and
> doesn't show up anywhere in fbmem.c. We're still pretty far from that,
> but at least the register/unregister code is there now.
> 
> With this the do_fb_ioctl() handler is the only code in fbmem.c still
> calling console_lock().
> 
> Acked-by: Sam Ravnborg <sam@ravnborg.org>
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Du Cheng <ducheng2@gmail.com>
> Cc: Claudio Suarez <cssk@net-c.es>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
> Cc: Matthew Wilcox <willy@infradead.org>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Zheyu Ma <zheyuma97@gmail.com>
> Cc: Guenter Roeck <linux@roeck-us.net>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: Zhen Lei <thunder.leizhen@huawei.com>
> Cc: Xiyu Yang <xiyuyang19@fudan.edu.cn>

This patch as commit 6e7da3af008b ("fbcon: Move console_lock for
register/unlink/unregister") in next-20220411 causes a lock up on my
test Intel desktop; I get no output on my display and I cannot ssh into
the machine. Bisect log below. If back out of this patch and the ones
that follow in this series on top of next-20220411, everything works
properly (i.e. 'git diff 6e7da3af008b^..efc3acbc105a | git apply -R').

What information would be helpful for debugging this? The system has an
i7-11700 in it and it is booting under UEFI, so I assume it should be
using EFI_FB. I am happy to offer any debugging information or test any
patches.

# bad: [d12d7e1cfe38e0c36d28c7a9fbbc436ad0d17c14] Add linux-next specific files for 20220411
# good: [8b57b3046107b50ebecb65537a172ef3d6cec673] Merge tag 'tty-5.18-rc2' of git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/tty
git bisect start 'd12d7e1cfe38e0c36d28c7a9fbbc436ad0d17c14' '8b57b3046107b50ebecb65537a172ef3d6cec673'
# bad: [8f0b3ef070bd35e80da1caa85824fc344fb6b82e] Merge branch 'for-linux-next' of git://anongit.freedesktop.org/drm/drm-misc
git bisect bad 8f0b3ef070bd35e80da1caa85824fc344fb6b82e
# good: [69ae2d6587df089ec1c21bddddc7852df403d3ce] Merge branch 'for-next' of git://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git
git bisect good 69ae2d6587df089ec1c21bddddc7852df403d3ce
# good: [43ffc7321ed6ce13e5424fa687576f4442c25f9d] Merge branch 'master' of git://git.kernel.org/pub/scm/linux/kernel/git/bluetooth/bluetooth-next.git
git bisect good 43ffc7321ed6ce13e5424fa687576f4442c25f9d
# good: [d44c2642c40b6c11e4a0afc76d491287c074376c] drm/gem: Delete gem array fencing helpers
git bisect good d44c2642c40b6c11e4a0afc76d491287c074376c
# good: [3223e922ccf8b5c3dd0b05faeaba407655ee0774] orinoco: Prepare cleanup of powerpc's asm/prom.h
git bisect good 3223e922ccf8b5c3dd0b05faeaba407655ee0774
# good: [689333136327b6cd618df85d83d79f2aa620d585] fbcon: Move fbcon_bmove(_rec) functions
git bisect good 689333136327b6cd618df85d83d79f2aa620d585
# good: [840db0076b05a1dd4c2ded8d08f8481e0297d09f] Merge branch 'master' of git://git.kernel.org/pub/scm/linux/kernel/git/herbert/cryptodev-2.6.git
git bisect good 840db0076b05a1dd4c2ded8d08f8481e0297d09f
# bad: [6e7da3af008b72520f5318507f455f344b27f022] fbcon: Move console_lock for register/unlink/unregister
git bisect bad 6e7da3af008b72520f5318507f455f344b27f022
# good: [6b2060cf9138a2cd5f3468a949d3869abed049ef] fb: Delete fb_info->queue
git bisect good 6b2060cf9138a2cd5f3468a949d3869abed049ef
# good: [d443d93864726ad68c0a741d1e7b03934a9af143] fbcon: move more common code into fb_open()
git bisect good d443d93864726ad68c0a741d1e7b03934a9af143
# good: [43553559121ca90965b572cf8a1d6d0fd618b449] fbcon: Consistently protect deferred_takeover with console_lock()
git bisect good 43553559121ca90965b572cf8a1d6d0fd618b449
# first bad commit: [6e7da3af008b72520f5318507f455f344b27f022] fbcon: Move console_lock for register/unlink/unregister

Cheers,
Nathan
