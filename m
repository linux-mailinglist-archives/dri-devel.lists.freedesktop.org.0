Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C5A5452AE10
	for <lists+dri-devel@lfdr.de>; Wed, 18 May 2022 00:25:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA24110FD98;
	Tue, 17 May 2022 22:25:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFB9D10FD98
 for <dri-devel@lists.freedesktop.org>; Tue, 17 May 2022 22:24:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652826299;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GDitkohmrRAtIYlNxb61J4+su9MWn+qVxcNEE5lRZNY=;
 b=bM0yXjaHSIXEZVxXXmd/wWrLMScxK0f/oiPfYwgRdUj0aHGxGKhYxmQIpEg8wE0igkmUPk
 yzIsoa8z+eI7ERZGBbTuFcmM3hT9ZX2r+Ic+JYuFT0w7OU8jif3UlJ4c2sVsJWHl2V8ulJ
 5/md/vtDdM46AkW2jLDspbvjMzIRfUw=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-368-tDDPiFImM0WbUBIyi75wLg-1; Tue, 17 May 2022 18:24:57 -0400
X-MC-Unique: tDDPiFImM0WbUBIyi75wLg-1
Received: by mail-qv1-f71.google.com with SMTP id
 a1-20020a056214130100b00456549a0589so248896qvv.2
 for <dri-devel@lists.freedesktop.org>; Tue, 17 May 2022 15:24:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=GDitkohmrRAtIYlNxb61J4+su9MWn+qVxcNEE5lRZNY=;
 b=dW66A8hMDM6EAtQDODbrHSMHybb9kfYDcVwsAPYRE7buxXz/OHmk9IGbxntk0bL7bA
 kRmgSG1WfBIofRBlySvC0fe2Vzf5+J9qZG9JI2BUou0dRzs36afDn4rhzjv7hO9FoRZH
 1LLBzXy3eyIC39B6C24D60hV5KLAqGSIuwIntQwb6LxHXjxHS9gy/IyriOq68oZafBYK
 GhUM8cfYpzO+YEEElsnz05JjX5Ak3Bs1ty2ulRykaFkWoj1p/5FTyPRAbrpYjkF7sg48
 L7V0zYhfGG1hwM3vCSa20bW7ELcbxLS6q4oYbMUmUbQan37BKNJCv03yLNXxM0K9pdbS
 7gjg==
X-Gm-Message-State: AOAM533Lno3u+ty54cNUWEvRXXD28EU3hJWETdKzsR9cygoNysHSMZvq
 fGXHwn9vvEMu2EwP8z/GxbOrqnNE1ONOG+4EM3hYxqVnse0Pcsb8bwoXpZVaplXojbgrOXtMUKE
 Yxobiy1K71M1V4NwQOX5mx5Vo9ebF
X-Received: by 2002:a37:a504:0:b0:69f:d12a:3414 with SMTP id
 o4-20020a37a504000000b0069fd12a3414mr18155036qke.213.1652826297369; 
 Tue, 17 May 2022 15:24:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyjkwJo+V5WPoHD9BBcBprrOlsjB8IAC300o1XbHedytkjyGurpAMYu9kKhI5i8CjmVvg9GRg==
X-Received: by 2002:a37:a504:0:b0:69f:d12a:3414 with SMTP id
 o4-20020a37a504000000b0069fd12a3414mr18155020qke.213.1652826297072; 
 Tue, 17 May 2022 15:24:57 -0700 (PDT)
Received: from [192.168.8.138] (static-71-184-137-158.bstnma.ftas.verizon.net.
 [71.184.137.158]) by smtp.gmail.com with ESMTPSA id
 d3-20020ac85443000000b002f39b99f68asm140595qtq.36.2022.05.17.15.24.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 May 2022 15:24:56 -0700 (PDT)
Message-ID: <1cfc459d038a3499ead4ce7c3619829263231a53.camel@redhat.com>
Subject: Re: nouveau lockdep deadlock report with 5.18-rc6
From: Lyude Paul <lyude@redhat.com>
To: Hans de Goede <hdegoede@redhat.com>, Ben Skeggs <bskeggs@redhat.com>, 
 Karol Herbst <kherbst@redhat.com>
Date: Tue, 17 May 2022 18:24:55 -0400
In-Reply-To: <ac39455b-b85c-4cf7-8cd0-089325c9514a@redhat.com>
References: <ac39455b-b85c-4cf7-8cd0-089325c9514a@redhat.com>
Organization: Red Hat Inc.
User-Agent: Evolution 3.42.4 (3.42.4-2.fc35)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lyude@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
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
Cc: "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

YEah I saw this as well, will try to bisect soon

On Tue, 2022-05-17 at 13:10 +0200, Hans de Goede wrote:
> Hi All,
> 
> I just noticed the below lockdep possible deadlock report with a 5.18-rc6
> kernel on a Dell Latitude E6430 laptop with the following nvidia GPU:
> 
> 01:00.0 VGA compatible controller [0300]: NVIDIA Corporation GF108GLM [NVS
> 5200M] [10de:0dfc] (rev a1)
> 01:00.1 Audio device [0403]: NVIDIA Corporation GF108 High Definition Audio
> Controller [10de:0bea] (rev a1)
> 
> This is with the laptop in Optimus mode, so with the Intel integrated
> gfx from the i5-3320M CPU driving the LCD panel and with nothing connected
> to the HDMI connector, which is always routed to the NVIDIA GPU on this
> laptop.
> 
> The lockdep possible deadlock warning seems to happen when the NVIDIA GPU
> is runtime suspended shortly after gdm has loaded:
> 
> [   24.859171] ======================================================
> [   24.859173] WARNING: possible circular locking dependency detected
> [   24.859175] 5.18.0-rc6+ #34 Tainted: G            E    
> [   24.859178] ------------------------------------------------------
> [   24.859179] kworker/1:1/46 is trying to acquire lock:
> [   24.859181] ffff92b0c0ee0518 (&cli->mutex){+.+.}-{3:3}, at:
> nouveau_vga_lastclose+0x910/0x1030 [nouveau]
> [   24.859231] 
>                but task is already holding lock:
> [   24.859233] ffff92b0c4bf35a0 (reservation_ww_class_mutex){+.+.}-{3:3},
> at: ttm_bo_wait+0x7d/0x140 [ttm]
> [   24.859243] 
>                which lock already depends on the new lock.
> 
> [   24.859244] 
>                the existing dependency chain (in reverse order) is:
> [   24.859246] 
>                -> #1 (reservation_ww_class_mutex){+.+.}-{3:3}:
> [   24.859249]        __ww_mutex_lock.constprop.0+0xb3/0xfb0
> [   24.859256]        ww_mutex_lock+0x38/0xa0
> [   24.859259]        nouveau_bo_pin+0x30/0x380 [nouveau]
> [   24.859297]        nouveau_channel_del+0x1d7/0x3e0 [nouveau]
> [   24.859328]        nouveau_channel_new+0x48/0x730 [nouveau]
> [   24.859358]        nouveau_abi16_ioctl_channel_alloc+0x113/0x360
> [nouveau]
> [   24.859389]        drm_ioctl_kernel+0xa1/0x150
> [   24.859392]        drm_ioctl+0x21c/0x410
> [   24.859395]        nouveau_drm_ioctl+0x56/0x1820 [nouveau]
> [   24.859431]        __x64_sys_ioctl+0x8d/0xc0
> [   24.859436]        do_syscall_64+0x5b/0x80
> [   24.859440]        entry_SYSCALL_64_after_hwframe+0x44/0xae
> [   24.859443] 
>                -> #0 (&cli->mutex){+.+.}-{3:3}:
> [   24.859446]        __lock_acquire+0x12e2/0x1f90
> [   24.859450]        lock_acquire+0xad/0x290
> [   24.859453]        __mutex_lock+0x90/0x830
> [   24.859456]        nouveau_vga_lastclose+0x910/0x1030 [nouveau]
> [   24.859493]        ttm_bo_move_to_lru_tail+0x32c/0x980 [ttm]
> [   24.859498]        ttm_mem_evict_first+0x25c/0x4b0 [ttm]
> [   24.859503]        ttm_resource_manager_evict_all+0x93/0x1b0 [ttm]
> [   24.859509]        nouveau_debugfs_fini+0x161/0x260 [nouveau]
> [   24.859545]        nouveau_drm_ioctl+0xa4a/0x1820 [nouveau]
> [   24.859582]        pci_pm_runtime_suspend+0x5c/0x180
> [   24.859585]        __rpm_callback+0x48/0x1b0
> [   24.859589]        rpm_callback+0x5a/0x70
> [   24.859591]        rpm_suspend+0x10a/0x6f0
> [   24.859594]        pm_runtime_work+0xa0/0xb0
> [   24.859596]        process_one_work+0x254/0x560
> [   24.859601]        worker_thread+0x4f/0x390
> [   24.859604]        kthread+0xe6/0x110
> [   24.859607]        ret_from_fork+0x22/0x30
> [   24.859611] 
>                other info that might help us debug this:
> 
> [   24.859612]  Possible unsafe locking scenario:
> 
> [   24.859613]        CPU0                    CPU1
> [   24.859615]        ----                    ----
> [   24.859616]   lock(reservation_ww_class_mutex);
> [   24.859618]                                lock(&cli->mutex);
> [   24.859620]                               
> lock(reservation_ww_class_mutex);
> [   24.859622]   lock(&cli->mutex);
> [   24.859624] 
>                 *** DEADLOCK ***
> 
> [   24.859625] 3 locks held by kworker/1:1/46:
> [   24.859627]  #0: ffff92b0c0bb4338 ((wq_completion)pm){+.+.}-{0:0}, at:
> process_one_work+0x1d0/0x560
> [   24.859634]  #1: ffffa8ffc02dfe80 ((work_completion)(&dev-
> >power.work)){+.+.}-{0:0}, at: process_one_work+0x1d0/0x560
> [   24.859641]  #2: ffff92b0c4bf35a0 (reservation_ww_class_mutex){+.+.}-
> {3:3}, at: ttm_bo_wait+0x7d/0x140 [ttm]
> [   24.859649] 
>                stack backtrace:
> [   24.859651] CPU: 1 PID: 46 Comm: kworker/1:1 Tainted: G            E    
> 5.18.0-rc6+ #34
> [   24.859654] Hardware name: Dell Inc. Latitude E6430/0H3MT5, BIOS A21
> 05/08/2017
> [   24.859656] Workqueue: pm pm_runtime_work
> [   24.859660] Call Trace:
> [   24.859662]  <TASK>
> [   24.859665]  dump_stack_lvl+0x5b/0x74
> [   24.859669]  check_noncircular+0xdf/0x100
> [   24.859672]  ? register_lock_class+0x38/0x470
> [   24.859678]  __lock_acquire+0x12e2/0x1f90
> [   24.859683]  lock_acquire+0xad/0x290
> [   24.859686]  ? nouveau_vga_lastclose+0x910/0x1030 [nouveau]
> [   24.859724]  ? lock_is_held_type+0xa6/0x120
> [   24.859730]  __mutex_lock+0x90/0x830
> [   24.859733]  ? nouveau_vga_lastclose+0x910/0x1030 [nouveau]
> [   24.859770]  ? nvif_vmm_map+0x114/0x130 [nouveau]
> [   24.859791]  ? nouveau_vga_lastclose+0x910/0x1030 [nouveau]
> [   24.859829]  ? nouveau_vga_lastclose+0x910/0x1030 [nouveau]
> [   24.859866]  nouveau_vga_lastclose+0x910/0x1030 [nouveau]
> [   24.859905]  ttm_bo_move_to_lru_tail+0x32c/0x980 [ttm]
> [   24.859912]  ttm_mem_evict_first+0x25c/0x4b0 [ttm]
> [   24.859919]  ? lock_release+0x20/0x2a0
> [   24.859923]  ttm_resource_manager_evict_all+0x93/0x1b0 [ttm]
> [   24.859930]  nouveau_debugfs_fini+0x161/0x260 [nouveau]
> [   24.859968]  nouveau_drm_ioctl+0xa4a/0x1820 [nouveau]
> [   24.860005]  pci_pm_runtime_suspend+0x5c/0x180
> [   24.860008]  ? pci_dev_put+0x20/0x20
> [   24.860011]  __rpm_callback+0x48/0x1b0
> [   24.860014]  ? pci_dev_put+0x20/0x20
> [   24.860018]  rpm_callback+0x5a/0x70
> [   24.860020]  ? pci_dev_put+0x20/0x20
> [   24.860023]  rpm_suspend+0x10a/0x6f0
> [   24.860025]  ? process_one_work+0x1d0/0x560
> [   24.860031]  pm_runtime_work+0xa0/0xb0
> [   24.860034]  process_one_work+0x254/0x560
> [   24.860039]  worker_thread+0x4f/0x390
> [   24.860043]  ? process_one_work+0x560/0x560
> [   24.860046]  kthread+0xe6/0x110
> [   24.860049]  ? kthread_complete_and_exit+0x20/0x20
> [   24.860053]  ret_from_fork+0x22/0x30
> [   24.860059]  </TASK>
> 
> Regards,
> 
> Hans
> 
> 

-- 
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

