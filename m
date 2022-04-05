Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46B614F36C5
	for <lists+dri-devel@lfdr.de>; Tue,  5 Apr 2022 16:09:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32ACF8928D;
	Tue,  5 Apr 2022 14:09:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0070810E383
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Apr 2022 14:08:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649167737;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8mhz+GXQ+F2knkdpN0pkRBKF5Bk9810pqXm8/F3H4YU=;
 b=Edljg99XqK6r9AgxORTwQSA/WZKIzaPDLe6v1yRklKZNNP26TdqMELF791vigVkqXoCxoI
 aC91nkQvAH+DQ0fKi0mCHgvEIy5wwuuUZkWE27WXcCC3fUULEwbLmIhW80MOuK2WCZLvQd
 Ljy0AvtP5lrUT65VVbuH1+HNHtp4BT4=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-475-kCrPoOnSM_yGfs6y4HBdJQ-1; Tue, 05 Apr 2022 10:08:57 -0400
X-MC-Unique: kCrPoOnSM_yGfs6y4HBdJQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 k39-20020a05600c1ca700b0038e6f5d2f40so1805284wms.6
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Apr 2022 07:08:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=8mhz+GXQ+F2knkdpN0pkRBKF5Bk9810pqXm8/F3H4YU=;
 b=7CBHbviyEw6BdSgF0PHw2Obvj2es0oxhEMhnHlN8fT3xXngtnrH1zOKEirBniO+EK8
 wntMzq4N8ZuGfXFWc0jKPO0mxktNK7en5faSPfoG98CG89k4Tf9+rAZf3zkOXBDNcs+J
 acLZF3rcEqaDKWSZANgckDjsHNxakyXM6VH6XJeU6nM9DI9YLbQRPOgFePHh9pRWESoC
 BgS7XGrbQ+6I0bBJXGvj4qtJEJDArUJ+1IJ+7LwbJb20fWOmLQMMa0vlG93SISBVH9vN
 bYRgNqNSh6hOE9hcMeymDQ01A5h4iSocV+tfVB+N5bHa/PLOsZs+HS2SethvXfQ/7hUY
 ASsw==
X-Gm-Message-State: AOAM532r8gxkpcL2suVGPbraJUrx2No290OAVqTbp7FtpDy+vcD0P8YJ
 WHFYTqr32VxiJ9z5+ukVhjNsk9OQp8/bqYAucJQe7Yc8aNRbrRM6QDChDaYHaggcFCwywAZiph0
 iXuWBpsui71BMohnzL7kCA87STLyK
X-Received: by 2002:a1c:f009:0:b0:387:6fea:8ebc with SMTP id
 a9-20020a1cf009000000b003876fea8ebcmr3392259wmb.84.1649167735841; 
 Tue, 05 Apr 2022 07:08:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz/wWlhf9Si4RyvlIN45Pe3xd7Dy+0JTdGwgBD+8q6PFh7Firoxt7BiM/k5LjLGK5Ogtt0T1Q==
X-Received: by 2002:a1c:f009:0:b0:387:6fea:8ebc with SMTP id
 a9-20020a1cf009000000b003876fea8ebcmr3392230wmb.84.1649167735553; 
 Tue, 05 Apr 2022 07:08:55 -0700 (PDT)
Received: from [192.168.1.102] ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id
 h10-20020adf9cca000000b002061b07f6f8sm2856521wre.88.2022.04.05.07.08.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Apr 2022 07:08:55 -0700 (PDT)
Message-ID: <d843bbb8-8632-62a7-4447-719dcd3a0582@redhat.com>
Date: Tue, 5 Apr 2022 16:08:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] fbdev: Fix unregistering of framebuffers without device
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch, deller@gmx.de,
 sudipm.mukherjee@gmail.com, sam@ravnborg.org, zackr@vmware.com,
 hdegoede@redhat.com
References: <20220404194402.29974-1-tzimmermann@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20220404194402.29974-1-tzimmermann@suse.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
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
Cc: linux-fbdev@vger.kernel.org, Matthew Wilcox <willy@infradead.org>,
 Xiyu Yang <xiyuyang19@fudan.edu.cn>,
 Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Zheyu Ma <zheyuma97@gmail.com>,
 stable@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Zhen Lei <thunder.leizhen@huawei.com>,
 Alex Deucher <alexander.deucher@amd.com>, Guenter Roeck <linux@roeck-us.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Thomas,

On 4/4/22 21:44, Thomas Zimmermann wrote:
> OF framebuffers do not have an underlying device in the Linux
> device hierarchy. Do a regular unregister call instead of hot
> unplugging such a non-existing device. Fixes a NULL dereference.
> An example error message on ppc64le is shown below.
> 
>   BUG: Kernel NULL pointer dereference on read at 0x00000060
>   Faulting instruction address: 0xc00000000080dfa4
>   Oops: Kernel access of bad area, sig: 11 [#1]
>   LE PAGE_SIZE=64K MMU=Hash SMP NR_CPUS=2048 NUMA pSeries
>   [...]
>   CPU: 2 PID: 139 Comm: systemd-udevd Not tainted 5.17.0-ae085d7f9365 #1
>   NIP:  c00000000080dfa4 LR: c00000000080df9c CTR: c000000000797430
>   REGS: c000000004132fe0 TRAP: 0300   Not tainted  (5.17.0-ae085d7f9365)
>   MSR:  8000000002009033 <SF,VEC,EE,ME,IR,DR,RI,LE>  CR: 28228282  XER: 20000000
>   CFAR: c00000000000c80c DAR: 0000000000000060 DSISR: 40000000 IRQMASK: 0
>   GPR00: c00000000080df9c c000000004133280 c00000000169d200 0000000000000029
>   GPR04: 00000000ffffefff c000000004132f90 c000000004132f88 0000000000000000
>   GPR08: c0000000015658f8 c0000000015cd200 c0000000014f57d0 0000000048228283
>   GPR12: 0000000000000000 c00000003fffe300 0000000020000000 0000000000000000
>   GPR16: 0000000000000000 0000000113fc4a40 0000000000000005 0000000113fcfb80
>   GPR20: 000001000f7283b0 0000000000000000 c000000000e4a588 c000000000e4a5b0
>   GPR24: 0000000000000001 00000000000a0000 c008000000db0168 c0000000021f6ec0
>   GPR28: c0000000016d65a8 c000000004b36460 0000000000000000 c0000000016d64b0
>   NIP [c00000000080dfa4] do_remove_conflicting_framebuffers+0x184/0x1d0
>   [c000000004133280] [c00000000080df9c] do_remove_conflicting_framebuffers+0x17c/0x1d0 (unreliable)
>   [c000000004133350] [c00000000080e4d0] remove_conflicting_framebuffers+0x60/0x150
>   [c0000000041333a0] [c00000000080e6f4] remove_conflicting_pci_framebuffers+0x134/0x1b0
>   [c000000004133450] [c008000000e70438] drm_aperture_remove_conflicting_pci_framebuffers+0x90/0x100 [drm]
>   [c000000004133490] [c008000000da0ce4] bochs_pci_probe+0x6c/0xa64 [bochs]
>   [...]
>   [c000000004133db0] [c00000000002aaa0] system_call_exception+0x170/0x2d0
>   [c000000004133e10] [c00000000000c3cc] system_call_common+0xec/0x250
> 
> The bug [1] was introduced by commit 27599aacbaef ("fbdev: Hot-unplug
> firmware fb devices on forced removal"). Most firmware framebuffers
> have an underlying platform device, which can be hot-unplugged
> before loading the native graphics driver. OF framebuffers do not
> (yet) have that device. Fix the code by unregistering the framebuffer
> as before without a hot unplug.
>

I believe the assumption that all firmware fb would have an underlying
device was a reasonable one and it's a pity that offb doesn't...

But that is how things are and your patch is the least intrusive fix.
 
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

