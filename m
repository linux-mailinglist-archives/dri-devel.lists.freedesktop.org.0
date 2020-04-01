Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AC2319B5D5
	for <lists+dri-devel@lfdr.de>; Wed,  1 Apr 2020 20:42:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88CE86E984;
	Wed,  1 Apr 2020 18:42:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02E4C6E983;
 Wed,  1 Apr 2020 18:42:35 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id t17so521022ljc.12;
 Wed, 01 Apr 2020 11:42:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=IrrldTgAN7hTfBxih+s1Nww8MyB4MUn1MXU0pAaOgKQ=;
 b=dxgLbEc28YpYyaU/j3FsFhXcNLqv3nYdw7RQrUl7uJ+mvBqE7U8IIW4YLfwyxx2XdK
 vK7NRcwbd6v0DUDLBwJLfqe5Ol9FZ5kA4/tIo8RuLju3UBXFXyngW7Wg8Ze5uB2qldGL
 pbjSwavROa8Es8Q75coGgcdi9j5xJ05UOyQNQ8R+rGsaD4q/iywU3kS9sALenyC3k5Zd
 HsnhcWGxSXKbgnpAtGt6vARV7hlPw1DdjR1pDlfsL6jrSQnd97Qs5QiKgH30zNqndtV3
 y/3McEz31pH6tRpOj91gc9pEIf3SjCqFUekY6XVwbxUU0bYXwW/tlzaQMZe5WufHYtNd
 bAvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=IrrldTgAN7hTfBxih+s1Nww8MyB4MUn1MXU0pAaOgKQ=;
 b=j/QT+JMRhO3W4ODTA0qZYufE0r8l+vgPZzqs7VUX2lvax9cYVvnimffUXNFS53XvuA
 PK4yATwpllL8OqHxZH2RmpbVfeZaBP1CcFDB8/XGkbze056Hr0P56US/DyxP/gHgHZuZ
 +VGw6fbsvIrgBw9pfnRpq/b8C3jNOypWlVbrZnecZ9ofZvGkr9AytuwCC3m9Zr/9se23
 HqHoZQmekjM/CK2O0D1wWRfxBXtF9bec3DrWdUtxPEtcUR5u22TXiNWiV0EGZ+zJ8IxD
 N7BPfOuYv01rCXhJSkl5S4LP5m0IgcZJosVHLR5+56lX35JOSfzj+sN7J0R2jlE8zpaN
 isMQ==
X-Gm-Message-State: AGi0Pua5G9PPAESfx4BlTYG7Z+Loirq7EP5vW/+B+NbN/HVOTsjY5cfu
 cONYcZcj1ahNEuh+c64BP1QXbtQdXPRxRFDXK1k=
X-Google-Smtp-Source: APiQypINhs3c3OXYf+uTLmRtByz48UJcG+m1SnlDQU0z4kHCJ/dUDgk88oXaDrvmhYj01dL8RfxuM9eeYUghLE3LLBg=
X-Received: by 2002:a2e:b4d1:: with SMTP id r17mr2922655ljm.117.1585766554155; 
 Wed, 01 Apr 2020 11:42:34 -0700 (PDT)
MIME-Version: 1.0
From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 1 Apr 2020 15:42:23 -0300
Message-ID: <CAOMZO5BL58oJH6EwYQ3wnzCrKpeadte6NLSRXM=qY0PCAiqkOA@mail.gmail.com>
Subject: gpu: msm: possible circular locking dependency detected on 5.5
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Jordan Crouse <jcrouse@codeaurora.org>
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
Cc: Jonathan Marek <jonathan@marek.ca>,
 DRI mailing list <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <freedreno@lists.freedesktop.org>,
 Chris Healy <cphealy@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

Here is an adreno regression I noticed on imx53 running 5.5.13:

[   21.283902] ======================================================
[   21.290148] WARNING: possible circular locking dependency detected
[   21.296409] 5.5.13 #1 Not tainted
[   21.299785] ------------------------------------------------------
[   21.306030] kworker/u2:1/19 is trying to acquire lock:
[   21.311236] dc888ae8 (reservation_ww_class_mutex){+.+.}, at:
dma_buf_detach+0x78/0x1e0
[   21.319341]
[   21.319341] but task is already holding lock:
[   21.325232] dc88838c (&msm_obj->lock){+.+.}, at:
msm_gem_free_work+0x100/0x188
[   21.332587]
[   21.33258[   32.525073] evbug: Event. Dev: input1, Type: 3, Code:
1, Value: 41
[   32.531942] evbug: Event. Dev: input1, Type: 0, Code: 0, Value: 0
7] which lock already depends on the new lock.
[   21.332587]
[   21.340823]
[   21.340823] the existing dependency chain (in reverse order) is:
[   21.348362]
[   21.348362] -> #1 (&msm_obj->lock){+.+.}:
[   21.353989]        mutex_lock_nested+0x1c/0x24
[   21.358514]        msm_gem_get_and_pin_iova+0x30/0x158
[   21.363733]        msm_ioctl_gem_submit+0xa90/0x1148
[   21.368775]        drm_ioctl_kernel+0xa4/0xec
[   21.373203]        drm_ioctl+0x1e0/0x3c8
[   21.377215]        do_vfs_ioctl+0x9c/0xa68
[   21.381388]        ksys_ioctl+0x34/0x60
[   21.385304]        ret_fast_syscall+0x0/0x28
[   21.389646]        0xbea6f8d8
[   21.392670]
[   21.392670] -> #0 (reservation_ww_class_mutex){+.+.}:
[   21.399333]        lock_acquire+0xcc/0x1ec
[   21.403516]        __ww_mutex_lock.constprop.8+0x94/0x10a4
[   21.409080]        ww_mutex_lock+0x78/0xb0
[   21.413261]        dma_buf_detach+0x78/0x1e0
[   21.417637]        drm_prime_gem_destroy+0x2c/0x38
[   21.422505]        msm_gem_free_work+0x88/0x188
[   21.427133]        process_one_work+0x2c4/0x754
[   21.431744]        worker_thread+0x2c/0x590
[   21.436015]        kthread+0x134/0x148
[   21.439838]        ret_from_fork+0x14/0x20
[   21.444000]        0x0
[   21.446418]
[   21.446418] other info that might help us debug this:
[   21.446418]
[   21.454483]  Possible unsafe locking scenario:
[   21.454483]
[   21.460460]        CPU0                    CPU1
[   21.465044]        ----                    ----
[   21.469627]   lock(&msm_obj->lock);
[   21.473190]                                lock(reservation_ww_class_mutex);
[   21.480314]                                lock(&msm_obj->lock);
[   21.486392]   lock(reservation_ww_class_mutex);
[   21.490996]
[   21.490996]  *** DEADLOCK ***
[   21.490996]
[   21.496985] 4 locks held by kworker/u2:1/19:
[   21.501311]  #0: dc43a6a0 ((wq_completion)msm){+.+.}, at:
process_one_work+0x210/0x754
[   21.509358]  #1: dc207f1c
((work_completion)(&priv->free_work)){+.+.}, at:
process_one_work+0x210/0x754
[   21.518876]  #2: dc3a7070 (&dev->struct_mutex){+.+.}, at:
msm_gem_free_work+0x4c/0x188
[   21.526915]  #3: dc88838c (&msm_obj->lock){+.+.}, at:
msm_gem_free_work+0x100/0x188
[   21.534692]
[   21.534692] stack backtrace:
[   21.539136] CPU: 0 PID: 19 Comm: kworker/u2:1 Not tainted 5.5.13 #1
[   21.545470] Hardware name: Freescale i.MX53 (Device Tree Support)
[   21.551667] Workqueue: msm msm_gem_free_work
[   21.556087] [<c0112e18>] (unwind_backtrace) from [<c010cda0>]
(show_stack+0x10/0x14)
[   21.563950] [<c010cda0>] (show_stack) from [<c0c9989c>]
(dump_stack+0xe4/0x11c)
[   21.571372] [<c0c9989c>] (dump_stack) from [<c0180334>]
(check_noncircular+0x130/0x1e4)
[   21.579486] [<c0180334>] (check_noncircular) from [<c0182450>]
(__lock_acquire+0xf58/0x2458)
[   21.588030] [<c0182450>] (__lock_acquire) from [<c01841bc>]
(lock_acquire+0xcc/0x1ec)
[   21.595976] [<c01841bc>] (lock_acquire) from [<c0cb887c>]
(__ww_mutex_lock.constprop.8+0x94/0x10a4)
[   21.605134] [<c0cb887c>] (__ww_mutex_lock.constprop.8) from
[<c0cb99b4>] (ww_mutex_lock+0x78/0xb0)
[   21.614207] [<c0cb99b4>] (ww_mutex_lock) from [<c070c078>]
(dma_buf_detach+0x78/0x1e0)
[   21.622239] [<c070c078>] (dma_buf_detach) from [<c06276e8>]
(drm_prime_gem_destroy+0x2c/0x38)
[   21.630874] [<c06276e8>] (drm_prime_gem_destroy) from [<c0696b48>]
(msm_gem_free_work+0x88/0x188)
[   21.639854] [<c0696b48>] (msm_gem_free_work) from [<c0148228>]
(process_one_work+0x2c4/0x754)
[   21.648487] [<c0148228>] (process_one_work) from [<c01486e4>]
(worker_thread+0x2c/0x590)
[   21.656681] [<c01486e4>] (worker_thread) from [<c01505f0>]
(kthread+0x134/0x148)
[   21.664176] [<c01505f0>] (kthread) from [<c01010b4>]
(ret_from_fork+0x14/0x20)
[   21.671470] Exception stack(0xdc207fb0 to 0xdc207ff8)

In order to reproduce it, I just launch kmscube and it starts running normally.

Then I do a "CTRL + C" and the message below appears.

Testing on 5.4.x I don't see this problem.

I haven't started bisecting this yet, but just checking if anyone has
any ideas first.

Thanks,

Fabio Estevam
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
