Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E11406D7E1D
	for <lists+dri-devel@lfdr.de>; Wed,  5 Apr 2023 15:53:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35F9B10E966;
	Wed,  5 Apr 2023 13:53:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D501010E966
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Apr 2023 13:52:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=iAeX/J2cDnhGOFn0l150+YhNcEQU/vWetzFlAgRj7A4=; b=jFNAd/BGAKXQDC1/fcv36lWtWV
 o6KZjsqT0O5FsrEv7+bLkJq/qDixCDINK66oZY4ab2vyuCCb9oVe951UCn7KTjIXtyTmbWLAY/G7i
 bYSqVo+xHkC/kvuNEUZ19Ib0ywMECFOr+7BT6YhkoOCHSXJzlfKDXo5EM3jcwbt0gmCyxbPZLu1km
 Yi4SQSqGH8n0NeqAdm8hi9MJzLmDJN+NI9zcdHttYnLpfDuh7sMeMSmnYnlXo+tjeERfLAgY7ekxo
 aHc6mBJKq8ozlsl5lWcE7/lHELm9lMbLpQj2eN5oXbEKSuAtZoZWYFEV7nHzOqqbp+2vWmeTyZqJM
 StapTk2A==;
Received: from [187.36.234.139] (helo=bowie..)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1pk3ZG-006FbC-V2; Wed, 05 Apr 2023 15:52:55 +0200
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: marius.vlad@collabora.com
Subject: Re: [PATCH 2/2] vkms: Add support for multiple connectors
Date: Wed,  5 Apr 2023 10:51:46 -0300
Message-Id: <20230405135145.305293-1-mcanal@igalia.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20221202142051.136651-3-marius.vlad@collabora.com>
References: <20221202142051.136651-3-marius.vlad@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: mwen@igalia.com, rodrigosiqueiramelo@gmail.com,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
 dri-devel@lists.freedesktop.org, melissa.srw@gmail.com,
 igormtorrente@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Marius,

> This patch adds support for creating multiple virtual connectors, in
> case one would need it. Use module parameters to specify how many,
> defaulting to just one, allocating from the start, a maximum of 4
> possible outputs.

I got a bit confused by this description. The commit message says that you
are creating multiple connectors, but it seems like you are creating multiple
pipes. From what I could see, for each new connector created, you are also
creating a new CRTC and new planes.

Moreover, if your real intention is to create multiple pipes, I believe that
you don't really need to duplicate the planes as well.

I ran the VKMS CI [1] with your patches applied and, although most of the 
tests are now passing with multiple pipes, which is really nice, the test
kms_writeback crashes with the following error:

[ 1997.244347] [IGT] kms_writeback: starting subtest writeback-check-output
[ 1997.250673] BUG: kernel NULL pointer dereference, address: 000000000000016c
[ 1997.250691] #PF: supervisor read access in kernel mode
[ 1997.250693] #PF: error_code(0x0000) - not-present page
[ 1997.250694] PGD 800000001a877067 P4D 800000001a877067 PUD 1a872067 PMD 0
[ 1997.250697] Oops: 0000 [#1] PREEMPT SMP PTI
[ 1997.250699] CPU: 2 PID: 3223 Comm: kms_writeback Not tainted 6.3.0-rc4-g8c2c29ba129f-dirty #257
[ 1997.250701] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-1.fc37 04/01/2014
[ 1997.250703] RIP: 0010:drm_vblank_get+0xa/0xe0
[ 1997.250710] Code: a9 66 66 66 66 66 66 2e 0f 1f 84 00 00 00 00 00 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 55 41 57 41 56 41 55 41 54 53 <8b> 87 6c 01 00 00 41 bc ea ff ff ff 85 c0 74 74 89 f5 48 89 fb 39
[ 1997.250712] RSP: 0018:ffffb84d407a3b08 EFLAGS: 00010202
[ 1997.250714] RAX: 0000000000000000 RBX: ffffa2eb02bf8b70 RCX: 0000000000000000
[ 1997.250718] RDX: ffffa2eb180d2420 RSI: 0000000000000000 RDI: 0000000000000000
[ 1997.250719] RBP: ffffa2eb02bf99e8 R08: 0000000000000036 R09: ffffa2eb01d620c0
[ 1997.250720] R10: ffffe82b84027e40 R11: ffffffffc0042520 R12: ffffa2eb01c01900
[ 1997.250721] R13: ffffa2eb02bf9b60 R14: 0000000000000001 R15: ffffa2ea1ecd6b80
[ 1997.250722] FS:  00007f7d44e89a80(0000) GS:ffffa2eb3bd00000(0000) knlGS:0000000000000000
[ 1997.250723] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[ 1997.250725] CR2: 000000000000016c CR3: 000000001ec02000 CR4: 00000000000006e0
[ 1997.250728] Call Trace:
[ 1997.250735]  <TASK>
[ 1997.250736]  vkms_set_composer+0x18/0x60 [vkms]
[ 1997.250745]  vkms_wb_atomic_commit+0x93/0x150 [vkms]
[ 1997.250749]  drm_atomic_helper_commit_modeset_enables+0x1d9/0x250
[ 1997.250754]  vkms_atomic_commit_tail+0x33/0xb0 [vkms]
[ 1997.250758]  commit_tail+0x8d/0x170
[ 1997.250761]  drm_atomic_helper_commit+0x26b/0x280
[ 1997.250763]  drm_atomic_commit+0x9f/0xc0
[ 1997.250766]  ? __pfx___drm_printfn_info+0x10/0x10
[ 1997.250769]  drm_mode_atomic_ioctl+0x34c/0x480
[ 1997.250771]  ? __pfx_drm_mode_atomic_ioctl+0x10/0x10
[ 1997.250773]  drm_ioctl_kernel+0xd7/0x150
[ 1997.250780]  drm_ioctl+0x31f/0x490
[ 1997.250781]  ? __pfx_drm_mode_atomic_ioctl+0x10/0x10
[ 1997.250783]  __se_sys_ioctl+0x6d/0xb0
[ 1997.250789]  do_syscall_64+0x43/0x90
[ 1997.250795]  entry_SYSCALL_64_after_hwframe+0x72/0xdc

[1] https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/tree/master/tests/vkms_ci

Best Regards,
- Maíra Canal

> 
> This is of particular importance when testing out the DRM backend in
> compositors, but also to be able to independently handle multiple
> outputs/connectors, like setting one to off/sleep on while the others
> are on, and combinations that arise from that.
> 
> Signed-off-by: Marius Vlad <marius.vlad@collabora.com>
> ---
>  drivers/gpu/drm/vkms/vkms_crtc.c      |  3 +--
>  drivers/gpu/drm/vkms/vkms_drv.c       | 26 ++++++++++++++++++++++----
>  drivers/gpu/drm/vkms/vkms_drv.h       |  8 +++++---
>  drivers/gpu/drm/vkms/vkms_output.c    |  5 ++---
>  drivers/gpu/drm/vkms/vkms_writeback.c | 18 ++++++++----------
>  5 files changed, 38 insertions(+), 22 deletions(-)
> 
