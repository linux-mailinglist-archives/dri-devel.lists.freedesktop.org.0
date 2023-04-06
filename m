Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E7296D9280
	for <lists+dri-devel@lfdr.de>; Thu,  6 Apr 2023 11:17:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96F0310EB3F;
	Thu,  6 Apr 2023 09:17:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98F3B10EB3F
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Apr 2023 09:17:07 +0000 (UTC)
Received: from [192.168.100.34] (unknown [109.100.38.211])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: mvlad)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 4629466031BD;
 Thu,  6 Apr 2023 10:17:05 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1680772625;
 bh=EWXpga+9Pks1POflkgrlgkk4abEpzqnlsjg11D3sbGY=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=b73AflyAl5HRFaulr+B0yXEP6tcqn5dxoOgr/Ly8sJdD+XOKD5Jy74yTfyUW79YCG
 MEtIo4vYWBg2Qzbdi/lYeV9Tw/5OCvtwAolDsvsO0mibkeZM11oxZNe6I8oYpuib0c
 AyGI+Qq8frNtbNU/zpkLpZnVXmS3yxHGQB/Gw5QzNCa106u0JhRFDjqX4cLfzZPXiK
 DEOmssHedT5q0ydn3T3gjbxGlWPG1+zVAP+Ru0ymLT31aoxHag5Y3xHxMDln3NE3W+
 6ELhY4J2Wn3FqfT46l4VE3vfcoh3z5hQW8cTNTFj1n1PKFCIDFq9CsPAJQ+uUrXewo
 TzqxCoFRUft3A==
Message-ID: <c3a03808-db42-5dca-54d0-2a227d765bf1@collabora.com>
Date: Thu, 6 Apr 2023 12:17:01 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 2/2] vkms: Add support for multiple connectors
To: =?UTF-8?Q?Ma=c3=adra_Canal?= <mcanal@igalia.com>
References: <20221202142051.136651-3-marius.vlad@collabora.com>
 <20230405135145.305293-1-mcanal@igalia.com>
Content-Language: en-US
From: Marius Vlad <marius.vlad@collabora.com>
In-Reply-To: <20230405135145.305293-1-mcanal@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: melissa.srw@gmail.com, mwen@igalia.com, rodrigosiqueiramelo@gmail.com,
 dri-devel@lists.freedesktop.org, igormtorrente@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Maira,

Thanks a lot for taking a look. Yeah, indeed, this creates a new 
connector, a CRTC and planes for it. Terminology wise, multiple pipes. 
The idea is to have multiple outputs, each with its own connector, as to 
be able to simulate (a few) more outputs. At least that's what I'm 
looking for.

I'll adjust the commits description to clarify that.

Regarding the planes, it seemed a bit easier to just create a new
tuple of planes for each output, as in to reuse vkms_output_init(). So I 
guess that you're suggestion would be to make use the existing planes.

Seems a bit more work, not that keen on changing that, but I do have 
some follow-up questions for my own curiosity in case I do this:

-  Don't I need an entire pipe (a primary plane, crtc, encoder, 
connector) to power up the end side of the sink (display)?
- Can the primary one be sufficient for multiple outputs?
- Can the overlay planes be shared or I need to
   discard the ones that are already in-use by other outputs?

I'll have a look at that writeback test as well see what's causing that
NULL pointer deref.


On 4/5/23 16:51, Maíra Canal wrote:
> Hi Marius,
> 
>> This patch adds support for creating multiple virtual connectors, in
>> case one would need it. Use module parameters to specify how many,
>> defaulting to just one, allocating from the start, a maximum of 4
>> possible outputs.
> 
> I got a bit confused by this description. The commit message says that you
> are creating multiple connectors, but it seems like you are creating multiple
> pipes. From what I could see, for each new connector created, you are also
> creating a new CRTC and new planes.
> 
> Moreover, if your real intention is to create multiple pipes, I believe that
> you don't really need to duplicate the planes as well.
> 
> I ran the VKMS CI [1] with your patches applied and, although most of the
> tests are now passing with multiple pipes, which is really nice, the test
> kms_writeback crashes with the following error:
> 
> [ 1997.244347] [IGT] kms_writeback: starting subtest writeback-check-output
> [ 1997.250673] BUG: kernel NULL pointer dereference, address: 000000000000016c
> [ 1997.250691] #PF: supervisor read access in kernel mode
> [ 1997.250693] #PF: error_code(0x0000) - not-present page
> [ 1997.250694] PGD 800000001a877067 P4D 800000001a877067 PUD 1a872067 PMD 0
> [ 1997.250697] Oops: 0000 [#1] PREEMPT SMP PTI
> [ 1997.250699] CPU: 2 PID: 3223 Comm: kms_writeback Not tainted 6.3.0-rc4-g8c2c29ba129f-dirty #257
> [ 1997.250701] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-1.fc37 04/01/2014
> [ 1997.250703] RIP: 0010:drm_vblank_get+0xa/0xe0
> [ 1997.250710] Code: a9 66 66 66 66 66 66 2e 0f 1f 84 00 00 00 00 00 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 55 41 57 41 56 41 55 41 54 53 <8b> 87 6c 01 00 00 41 bc ea ff ff ff 85 c0 74 74 89 f5 48 89 fb 39
> [ 1997.250712] RSP: 0018:ffffb84d407a3b08 EFLAGS: 00010202
> [ 1997.250714] RAX: 0000000000000000 RBX: ffffa2eb02bf8b70 RCX: 0000000000000000
> [ 1997.250718] RDX: ffffa2eb180d2420 RSI: 0000000000000000 RDI: 0000000000000000
> [ 1997.250719] RBP: ffffa2eb02bf99e8 R08: 0000000000000036 R09: ffffa2eb01d620c0
> [ 1997.250720] R10: ffffe82b84027e40 R11: ffffffffc0042520 R12: ffffa2eb01c01900
> [ 1997.250721] R13: ffffa2eb02bf9b60 R14: 0000000000000001 R15: ffffa2ea1ecd6b80
> [ 1997.250722] FS:  00007f7d44e89a80(0000) GS:ffffa2eb3bd00000(0000) knlGS:0000000000000000
> [ 1997.250723] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [ 1997.250725] CR2: 000000000000016c CR3: 000000001ec02000 CR4: 00000000000006e0
> [ 1997.250728] Call Trace:
> [ 1997.250735]  <TASK>
> [ 1997.250736]  vkms_set_composer+0x18/0x60 [vkms]
> [ 1997.250745]  vkms_wb_atomic_commit+0x93/0x150 [vkms]
> [ 1997.250749]  drm_atomic_helper_commit_modeset_enables+0x1d9/0x250
> [ 1997.250754]  vkms_atomic_commit_tail+0x33/0xb0 [vkms]
> [ 1997.250758]  commit_tail+0x8d/0x170
> [ 1997.250761]  drm_atomic_helper_commit+0x26b/0x280
> [ 1997.250763]  drm_atomic_commit+0x9f/0xc0
> [ 1997.250766]  ? __pfx___drm_printfn_info+0x10/0x10
> [ 1997.250769]  drm_mode_atomic_ioctl+0x34c/0x480
> [ 1997.250771]  ? __pfx_drm_mode_atomic_ioctl+0x10/0x10
> [ 1997.250773]  drm_ioctl_kernel+0xd7/0x150
> [ 1997.250780]  drm_ioctl+0x31f/0x490
> [ 1997.250781]  ? __pfx_drm_mode_atomic_ioctl+0x10/0x10
> [ 1997.250783]  __se_sys_ioctl+0x6d/0xb0
> [ 1997.250789]  do_syscall_64+0x43/0x90
> [ 1997.250795]  entry_SYSCALL_64_after_hwframe+0x72/0xdc
> 
> [1] https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/tree/master/tests/vkms_ci
> 
> Best Regards,
> - Maíra Canal
> 
>>
>> This is of particular importance when testing out the DRM backend in
>> compositors, but also to be able to independently handle multiple
>> outputs/connectors, like setting one to off/sleep on while the others
>> are on, and combinations that arise from that.
>>
>> Signed-off-by: Marius Vlad <marius.vlad@collabora.com>
>> ---
>>   drivers/gpu/drm/vkms/vkms_crtc.c      |  3 +--
>>   drivers/gpu/drm/vkms/vkms_drv.c       | 26 ++++++++++++++++++++++----
>>   drivers/gpu/drm/vkms/vkms_drv.h       |  8 +++++---
>>   drivers/gpu/drm/vkms/vkms_output.c    |  5 ++---
>>   drivers/gpu/drm/vkms/vkms_writeback.c | 18 ++++++++----------
>>   5 files changed, 38 insertions(+), 22 deletions(-)
>>
