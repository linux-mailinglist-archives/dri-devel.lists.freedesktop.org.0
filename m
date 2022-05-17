Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 57FA752A015
	for <lists+dri-devel@lfdr.de>; Tue, 17 May 2022 13:10:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF42110E063;
	Tue, 17 May 2022 11:10:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2261C10E028
 for <dri-devel@lists.freedesktop.org>; Tue, 17 May 2022 11:10:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652785814;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=8+rXDyJTpld4kDiOOJTEx903NZLPEDrw5ckcuE3uWyI=;
 b=D325ayt/o+9J74RqD1CGtbzBP32z+iNtZaDdQETSInmsPUQKcIXjkGTOlJm87rtfeFDdE0
 YydwiseSJERb3AFOMNqlx+v3Ez9EIBpyAFXz1l2+QS9wCKtHgTTaa2mHhWORMmaHzAkFvl
 21vdPTA40Cr6XERpU8Ch7Ut/jQpyZro=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-629-GJJEGWYFOm6ZCZEHklTVpg-1; Tue, 17 May 2022 07:10:11 -0400
X-MC-Unique: GJJEGWYFOm6ZCZEHklTVpg-1
Received: by mail-ej1-f70.google.com with SMTP id
 go17-20020a1709070d9100b006f46e53a2a9so7179419ejc.10
 for <dri-devel@lists.freedesktop.org>; Tue, 17 May 2022 04:10:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent
 :content-language:to:cc:from:subject:content-transfer-encoding;
 bh=8+rXDyJTpld4kDiOOJTEx903NZLPEDrw5ckcuE3uWyI=;
 b=cGR9QYc7AcQGErwvn8OEnv7usARYEa+fUkBhDkkFxCvJNGuYYrxZLcyCvSiNt/ZwLu
 78j+q3ivOIV2NJWyPkOaMRMKEqMIjwrPsLRcV9QEIhPvOMI6rbNEpjxjJokI60F9VlVh
 /cqG/LmTp5lKC5xrdB8FV3leMbhS4korD1IfCnpKY37YHJxOj+gmDtEpnv1u0Sk6wuXz
 voYV13t0ZENZMDa/RVLSiGe3o/wTOi/GBrOE45b+cWM4kSBsgwE2uvJ2hiQ+4qGy/m4K
 rFAAJv689uIk4sEPRjHhaH6Sp8eN2dRGcWBrymZDCnkKlcvhr03v4V3ewV7Lgf1P8FO1
 9TZA==
X-Gm-Message-State: AOAM532oI1QllqJqkLLG/i5QMuvA0N0kxdJlbs5Fk2hakZkzT3Xt+Y4U
 azZ0ytmGSqHQ8pNWrACUmi7XKJYgXakEycfDEhXf4doLDC+o8Bpo/YQFxutFuk2ksI4DQQBgBhH
 YJlLUPYV3Ek+8e6CziPesr+8QGsdp
X-Received: by 2002:a17:906:2c5a:b0:6fe:6045:2209 with SMTP id
 f26-20020a1709062c5a00b006fe60452209mr2728127ejh.241.1652785809649; 
 Tue, 17 May 2022 04:10:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzjdrmSoB7F/0S7MAfPFidkkuz+RF0qsAaiTXK4hEl7Jkj77rUYOCuiLP547Qva/xoEmrsbXg==
X-Received: by 2002:a17:906:2c5a:b0:6fe:6045:2209 with SMTP id
 f26-20020a1709062c5a00b006fe60452209mr2728098ejh.241.1652785809365; 
 Tue, 17 May 2022 04:10:09 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81?
 (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
 by smtp.gmail.com with ESMTPSA id
 c11-20020a056402100b00b0042617ba63a8sm6785951edu.50.2022.05.17.04.10.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 May 2022 04:10:08 -0700 (PDT)
Message-ID: <ac39455b-b85c-4cf7-8cd0-089325c9514a@redhat.com>
Date: Tue, 17 May 2022 13:10:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
To: Ben Skeggs <bskeggs@redhat.com>, Karol Herbst <kherbst@redhat.com>,
 Lyude Paul <lyude@redhat.com>
From: Hans de Goede <hdegoede@redhat.com>
Subject: nouveau lockdep deadlock report with 5.18-rc6
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
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
Cc: "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi All,

I just noticed the below lockdep possible deadlock report with a 5.18-rc6
kernel on a Dell Latitude E6430 laptop with the following nvidia GPU:

01:00.0 VGA compatible controller [0300]: NVIDIA Corporation GF108GLM [NVS 5200M] [10de:0dfc] (rev a1)
01:00.1 Audio device [0403]: NVIDIA Corporation GF108 High Definition Audio Controller [10de:0bea] (rev a1)

This is with the laptop in Optimus mode, so with the Intel integrated
gfx from the i5-3320M CPU driving the LCD panel and with nothing connected
to the HDMI connector, which is always routed to the NVIDIA GPU on this
laptop.

The lockdep possible deadlock warning seems to happen when the NVIDIA GPU
is runtime suspended shortly after gdm has loaded:

[   24.859171] ======================================================
[   24.859173] WARNING: possible circular locking dependency detected
[   24.859175] 5.18.0-rc6+ #34 Tainted: G            E    
[   24.859178] ------------------------------------------------------
[   24.859179] kworker/1:1/46 is trying to acquire lock:
[   24.859181] ffff92b0c0ee0518 (&cli->mutex){+.+.}-{3:3}, at: nouveau_vga_lastclose+0x910/0x1030 [nouveau]
[   24.859231] 
               but task is already holding lock:
[   24.859233] ffff92b0c4bf35a0 (reservation_ww_class_mutex){+.+.}-{3:3}, at: ttm_bo_wait+0x7d/0x140 [ttm]
[   24.859243] 
               which lock already depends on the new lock.

[   24.859244] 
               the existing dependency chain (in reverse order) is:
[   24.859246] 
               -> #1 (reservation_ww_class_mutex){+.+.}-{3:3}:
[   24.859249]        __ww_mutex_lock.constprop.0+0xb3/0xfb0
[   24.859256]        ww_mutex_lock+0x38/0xa0
[   24.859259]        nouveau_bo_pin+0x30/0x380 [nouveau]
[   24.859297]        nouveau_channel_del+0x1d7/0x3e0 [nouveau]
[   24.859328]        nouveau_channel_new+0x48/0x730 [nouveau]
[   24.859358]        nouveau_abi16_ioctl_channel_alloc+0x113/0x360 [nouveau]
[   24.859389]        drm_ioctl_kernel+0xa1/0x150
[   24.859392]        drm_ioctl+0x21c/0x410
[   24.859395]        nouveau_drm_ioctl+0x56/0x1820 [nouveau]
[   24.859431]        __x64_sys_ioctl+0x8d/0xc0
[   24.859436]        do_syscall_64+0x5b/0x80
[   24.859440]        entry_SYSCALL_64_after_hwframe+0x44/0xae
[   24.859443] 
               -> #0 (&cli->mutex){+.+.}-{3:3}:
[   24.859446]        __lock_acquire+0x12e2/0x1f90
[   24.859450]        lock_acquire+0xad/0x290
[   24.859453]        __mutex_lock+0x90/0x830
[   24.859456]        nouveau_vga_lastclose+0x910/0x1030 [nouveau]
[   24.859493]        ttm_bo_move_to_lru_tail+0x32c/0x980 [ttm]
[   24.859498]        ttm_mem_evict_first+0x25c/0x4b0 [ttm]
[   24.859503]        ttm_resource_manager_evict_all+0x93/0x1b0 [ttm]
[   24.859509]        nouveau_debugfs_fini+0x161/0x260 [nouveau]
[   24.859545]        nouveau_drm_ioctl+0xa4a/0x1820 [nouveau]
[   24.859582]        pci_pm_runtime_suspend+0x5c/0x180
[   24.859585]        __rpm_callback+0x48/0x1b0
[   24.859589]        rpm_callback+0x5a/0x70
[   24.859591]        rpm_suspend+0x10a/0x6f0
[   24.859594]        pm_runtime_work+0xa0/0xb0
[   24.859596]        process_one_work+0x254/0x560
[   24.859601]        worker_thread+0x4f/0x390
[   24.859604]        kthread+0xe6/0x110
[   24.859607]        ret_from_fork+0x22/0x30
[   24.859611] 
               other info that might help us debug this:

[   24.859612]  Possible unsafe locking scenario:

[   24.859613]        CPU0                    CPU1
[   24.859615]        ----                    ----
[   24.859616]   lock(reservation_ww_class_mutex);
[   24.859618]                                lock(&cli->mutex);
[   24.859620]                                lock(reservation_ww_class_mutex);
[   24.859622]   lock(&cli->mutex);
[   24.859624] 
                *** DEADLOCK ***

[   24.859625] 3 locks held by kworker/1:1/46:
[   24.859627]  #0: ffff92b0c0bb4338 ((wq_completion)pm){+.+.}-{0:0}, at: process_one_work+0x1d0/0x560
[   24.859634]  #1: ffffa8ffc02dfe80 ((work_completion)(&dev->power.work)){+.+.}-{0:0}, at: process_one_work+0x1d0/0x560
[   24.859641]  #2: ffff92b0c4bf35a0 (reservation_ww_class_mutex){+.+.}-{3:3}, at: ttm_bo_wait+0x7d/0x140 [ttm]
[   24.859649] 
               stack backtrace:
[   24.859651] CPU: 1 PID: 46 Comm: kworker/1:1 Tainted: G            E     5.18.0-rc6+ #34
[   24.859654] Hardware name: Dell Inc. Latitude E6430/0H3MT5, BIOS A21 05/08/2017
[   24.859656] Workqueue: pm pm_runtime_work
[   24.859660] Call Trace:
[   24.859662]  <TASK>
[   24.859665]  dump_stack_lvl+0x5b/0x74
[   24.859669]  check_noncircular+0xdf/0x100
[   24.859672]  ? register_lock_class+0x38/0x470
[   24.859678]  __lock_acquire+0x12e2/0x1f90
[   24.859683]  lock_acquire+0xad/0x290
[   24.859686]  ? nouveau_vga_lastclose+0x910/0x1030 [nouveau]
[   24.859724]  ? lock_is_held_type+0xa6/0x120
[   24.859730]  __mutex_lock+0x90/0x830
[   24.859733]  ? nouveau_vga_lastclose+0x910/0x1030 [nouveau]
[   24.859770]  ? nvif_vmm_map+0x114/0x130 [nouveau]
[   24.859791]  ? nouveau_vga_lastclose+0x910/0x1030 [nouveau]
[   24.859829]  ? nouveau_vga_lastclose+0x910/0x1030 [nouveau]
[   24.859866]  nouveau_vga_lastclose+0x910/0x1030 [nouveau]
[   24.859905]  ttm_bo_move_to_lru_tail+0x32c/0x980 [ttm]
[   24.859912]  ttm_mem_evict_first+0x25c/0x4b0 [ttm]
[   24.859919]  ? lock_release+0x20/0x2a0
[   24.859923]  ttm_resource_manager_evict_all+0x93/0x1b0 [ttm]
[   24.859930]  nouveau_debugfs_fini+0x161/0x260 [nouveau]
[   24.859968]  nouveau_drm_ioctl+0xa4a/0x1820 [nouveau]
[   24.860005]  pci_pm_runtime_suspend+0x5c/0x180
[   24.860008]  ? pci_dev_put+0x20/0x20
[   24.860011]  __rpm_callback+0x48/0x1b0
[   24.860014]  ? pci_dev_put+0x20/0x20
[   24.860018]  rpm_callback+0x5a/0x70
[   24.860020]  ? pci_dev_put+0x20/0x20
[   24.860023]  rpm_suspend+0x10a/0x6f0
[   24.860025]  ? process_one_work+0x1d0/0x560
[   24.860031]  pm_runtime_work+0xa0/0xb0
[   24.860034]  process_one_work+0x254/0x560
[   24.860039]  worker_thread+0x4f/0x390
[   24.860043]  ? process_one_work+0x560/0x560
[   24.860046]  kthread+0xe6/0x110
[   24.860049]  ? kthread_complete_and_exit+0x20/0x20
[   24.860053]  ret_from_fork+0x22/0x30
[   24.860059]  </TASK>

Regards,

Hans


