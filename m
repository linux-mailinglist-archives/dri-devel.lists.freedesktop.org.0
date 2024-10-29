Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 174399B525F
	for <lists+dri-devel@lfdr.de>; Tue, 29 Oct 2024 20:04:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD6BD10E6DB;
	Tue, 29 Oct 2024 19:04:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="cq1ATpfv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com
 [209.85.218.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B41810E6DE
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Oct 2024 19:04:06 +0000 (UTC)
Received: by mail-ej1-f51.google.com with SMTP id
 a640c23a62f3a-a99f646ff1bso734719666b.2
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Oct 2024 12:04:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730228645; x=1730833445; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=aLUZ+U8dhUMvzNf6uY8m8gpAFU1WQk1nsxJaGoeNJ6I=;
 b=cq1ATpfvw1U9rGLyluWGqaJQgqltg5VJLKDC0jRtqWRlz1wKOOm5pp7pGbZckcWT/M
 bzG0gn2Bqcgx120UiGZ4WuEaLw8+M4L6ZCp0VT9nM3Pg/17k2bWxkDfAs41e5HS9vpOA
 rToSC/K8zYykM6NMX54JLCk025r2YjnezhoLTFmX8yP8Idz/2Hmtm9ZeIA3t/158Yo18
 ZFuKv1ksAe7uvoQQfn105MJVN6rV6U1tIu+/DzH24fiTutWO5XzjfKh7caet0R4AnK7Y
 Ym6J8k5M10m4pdk56QZsypwFBOoRsQqUDjOyrTrp6lvAtRK21xilchUTe7yQJkQjP2ce
 c+ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730228645; x=1730833445;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=aLUZ+U8dhUMvzNf6uY8m8gpAFU1WQk1nsxJaGoeNJ6I=;
 b=W/g3qosaRPCW4hMVgfBUtGNm6rGDlIsWPPPrPwwBPE513ENstAdotblN3TsDxlswtf
 lGrc5IY3aVFE0lOmxoK1RpYAZa4sGXvTNVUCRylhy5prIWiT3TBlclpChouzf6mAcZ+C
 QE7KwdxhIMrfHMi9kyJT+7DfLFwZs74CfQ0zUphEaACKIxteULC5+c+pSBniXe0VQCpp
 8cKlusWQSodIrtnOJNwf29WiErMM+4zW1QSleZLF9Z9u26hDvYFQSMSICeLieY5BAcxo
 w6xh1euu4/aGyj+ToaclmiVDUnxoGkJznS1efcScmZAmFVVti8tdiMsZYuLczINIsrWF
 z6AQ==
X-Gm-Message-State: AOJu0YxSVfjzZlo7q2lMaMsDXkQATU7cjc9+Z2V+qlj1aUdIEc7jUF4U
 xMVQ41zWULkyhQybthmJpG0rsM456hVDRkPKPdGx/j0bChRTHP51cbNd4lEQcG5ptT+shhXI9OZ
 qO8K1Z3mkF64OHfgbG/g15n2OZGofzpoF
X-Google-Smtp-Source: AGHT+IE4vcRw5vgq65T6E9sys8f7zrvy1vJrQbloiWASOVuyIlgx737OPm2qQHSZ6K3+RYI6m3OhFeZwk9m7jx9qB5k=
X-Received: by 2002:a17:907:7e8b:b0:a9a:3cec:b322 with SMTP id
 a640c23a62f3a-a9e3a6c99e0mr69461166b.45.1730228644749; Tue, 29 Oct 2024
 12:04:04 -0700 (PDT)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Wed, 30 Oct 2024 05:03:50 +1000
Message-ID: <CAPM=9tzJ4-ERDxvuwrCyUPY0=+P44orhp1kLWVGL7MCfpQjMEQ@mail.gmail.com>
Subject: lockdep and ww mutex debug interactions in hdmi tests
To: Maxime Ripard <mripard@kernel.org>
Cc: dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

I mentioned this internally, but wanted to get it on the list,

I ran the hdmi kunit tests with LOCKDEP and WW_MUTEX_SLOWPATH enabled
and hit some issues.

With the slowpath we get the occasional EDEADLK to test the paths are
doing things right, I think you should handle EDEADLK in the tests
with a retry loop.

meanwhile lockdep said

[   64.885157] KTAP version 1
[   64.886206] 1..2
[   64.887950]     KTAP version 1
[   64.888738]     # Subtest: drm_atomic_helper_connector_hdmi_check
[   64.890271]     # module: drm_hdmi_state_helper_test
[   64.890291]     1..22

[   64.898189] ======================================================
[   64.899995] WARNING: possible circular locking dependency detected
[   64.901475] 6.12.0-rc5+ #2 Tainted: G                 N
[   64.902928] ------------------------------------------------------
[   64.904543] kunit_try_catch/1962 is trying to acquire lock:
[   64.906062] ffff502cc9c1c488 (&dev->mode_config.mutex){+.+.}-{3:3},
at: drm_test_check_broadcast_rgb_auto_cea_mode+0xb0/0x460
[drm_hdmi_state_helper_test]
[   64.909764]
               but task is already holding lock:
[   64.911408] ffff502cd0aa03f0 (crtc_ww_class_acquire){+.+.}-{0:0},
at: drm_kunit_helper_acquire_ctx_alloc+0x64/0x100 [drm_kunit_helpers]
[   64.915352]
               which lock already depends on the new lock.

[   64.917596]
               the existing dependency chain (in reverse order) is:
[   64.919596]
               -> #1 (crtc_ww_class_acquire){+.+.}-{0:0}:
[   64.921408]        __lock_acquire+0x50c/0xb00
[   64.922690]        lock_acquire.part.0+0xf0/0x270
[   64.923955]        lock_acquire+0x90/0x180
[   64.925099]        drm_modeset_acquire_init+0xd4/0x138
[   64.926526]        drm_helper_probe_single_connector_modes+0x70/0x638
[   64.929138]        set_connector_edid.isra.0+0x70/0x118
[drm_hdmi_state_helper_test]
[   64.931267]
drm_atomic_helper_connector_hdmi_init+0x20c/0x3a0
[drm_hdmi_state_helper_test]
[   64.933616]
drm_test_check_broadcast_rgb_auto_cea_mode+0x50/0x460
[drm_hdmi_state_helper_test]
[   64.936099]        kunit_try_run_case+0x74/0x170 [kunit]
[   64.937518]        kunit_generic_run_threadfn_adapter+0x30/0x60 [kunit]
[   64.939325]        kthread+0x100/0x118
[   64.940364]        ret_from_fork+0x10/0x20
[   64.941513]
               -> #0 (&dev->mode_config.mutex){+.+.}-{3:3}:
[   64.943305]        check_prev_add+0x114/0x9d8
[   64.944459]        validate_chain+0x46c/0x500
[   64.946249]        __lock_acquire+0x50c/0xb00
[   64.947421]        lock_acquire.part.0+0xf0/0x270
[   64.948690]        lock_acquire+0x90/0x180
[   64.949801]        __mutex_lock+0xc0/0x430
[   64.950964]        mutex_lock_nested+0x2c/0x40
[   64.952160]
drm_test_check_broadcast_rgb_auto_cea_mode+0xb0/0x460
[drm_hdmi_state_helper_test]
[   64.954613]        kunit_try_run_case+0x74/0x170 [kunit]
[   64.956069]        kunit_generic_run_threadfn_adapter+0x30/0x60 [kunit]
[   64.957830]        kthread+0x100/0x118
[   64.958855]        ret_from_fork+0x10/0x20
[   64.960273]
               other info that might help us debug this:

[   64.962749]  Possible unsafe locking scenario:

[   64.964330]        CPU0                    CPU1
[   64.965575]        ----                    ----
[   64.966782]   lock(crtc_ww_class_acquire);
[   64.967881]                                lock(&dev->mode_config.mutex);
[   64.969841]                                lock(crtc_ww_class_acquire);
[   64.971922]   lock(&dev->mode_config.mutex);
[   64.973070]
                *** DEADLOCK ***

[   64.974634] 1 lock held by kunit_try_catch/1962:
[   64.976040]  #0: ffff502cd0aa03f0
(crtc_ww_class_acquire){+.+.}-{0:0}, at:
drm_kunit_helper_acquire_ctx_alloc+0x64/0x100 [drm_kunit_helpers]
[   64.979943]
               stack backtrace:
[   64.981136] CPU: 2 UID: 0 PID: 1962 Comm: kunit_try_catch Tainted:
G                 N 6.12.0-rc5+ #2
[   64.983577] Tainted: [N]=TEST
[   64.984356] Hardware name: QEMU KVM Virtual Machine, BIOS 0.0.0 02/06/2015
[   64.986202] Call trace:
[   64.986856]  dump_backtrace+0xdc/0x140
[   64.987863]  show_stack+0x20/0x40
[   64.988737]  dump_stack_lvl+0x9c/0xd0
[   64.989761]  dump_stack+0x18/0x30
[   64.990809]  print_circular_bug+0xf0/0x100
[   64.992300]  check_noncircular+0x174/0x188
[   64.993451]  check_prev_add+0x114/0x9d8
[   64.994467]  validate_chain+0x46c/0x500
[   64.995540]  __lock_acquire+0x50c/0xb00
[   64.996566]  lock_acquire.part.0+0xf0/0x270
[   64.997693]  lock_acquire+0x90/0x180
[   64.998643]  __mutex_lock+0xc0/0x430
[   64.999610]  mutex_lock_nested+0x2c/0x40
[   65.000639]  drm_test_check_broadcast_rgb_auto_cea_mode+0xb0/0x460
[drm_hdmi_state_helper_test]
[   65.002987]  kunit_try_run_case+0x74/0x170 [kunit]
[   65.004274]  kunit_generic_run_threadfn_adapter+0x30/0x60 [kunit]
[   65.006488]  kthread+0x100/0x118
[   65.007354]  ret_from_fork+0x10/0x20

Dave.
