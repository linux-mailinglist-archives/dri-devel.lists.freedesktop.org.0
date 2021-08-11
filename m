Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F4E43E9728
	for <lists+dri-devel@lfdr.de>; Wed, 11 Aug 2021 19:57:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30B526E187;
	Wed, 11 Aug 2021 17:57:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x732.google.com (mail-qk1-x732.google.com
 [IPv6:2607:f8b0:4864:20::732])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34CFD6E13C
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Aug 2021 13:47:23 +0000 (UTC)
Received: by mail-qk1-x732.google.com with SMTP id n123so2326766qkn.12
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Aug 2021 06:47:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=toxicpanda-com.20150623.gappssmtp.com; s=20150623;
 h=to:from:subject:message-id:date:user-agent:mime-version
 :content-language:content-transfer-encoding;
 bh=Fm7+XHPXZJAAHRQX8HAqbif6yDHgyzf9iE8QP5xkcUo=;
 b=XalUVSrEgpHQZzdUR7+8TdBjJ1cyMPHIVgyBlUH6ORQhIgC2F+Cd6RN0QYDKO0VpWZ
 6CCOFvRzfKSyQA0SkmeNNS/ghtsL+if4HlZlm6QuVGkl4l1WcAb7gw+bo6nZkaBcYmyO
 TSG7st7ZP1N1f+DcoCcLX8yVSaPLm36/203NG7DE+WImvDrmPWkcHyaSPIb8xbskZb64
 Ffbkto8H1TgoCGm2QQhDYGesMHzhex5rLsuZHDg3bCDmVEMEwnEPqcZvzCzAS9fdgTAK
 A40frH7qSETKBpt0Pwd1/r2tqsDeyI4TtJ6ASAY2hsRk0mwlkxSGQI4+umpMVUchF4FX
 JjGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:from:subject:message-id:date:user-agent
 :mime-version:content-language:content-transfer-encoding;
 bh=Fm7+XHPXZJAAHRQX8HAqbif6yDHgyzf9iE8QP5xkcUo=;
 b=a1tLl6CUlPngvtHfTu1sHUWrmYMCNflp2jgZVMxNiWGAmvpBf1fwizaOTvDNZFxgdg
 m3wuIRJYayGLlZtUy4UZ6qgGQWaZlnjL+1gIDuP30IPRSsUxDtdFwWZl6XMLpvrPziKx
 FxCeNChQoKbfn1qOVFYL5ApaiPzVoFGHNkDUAkDiiukZbyRzfEjYzH7pdUubyjike3Bd
 u9jY3kSvThtbNtdwZHp5OdXdiQqOj91mue36xyjZnKGH9V+y+oP+3SCJZ5j1NxeGu83T
 CSGu9SKKPT1f5nnTLPGOBEk96V1fLeLnCTrtSn0lJ9A0tLHbTYIpPpmXMlQ+NVMIUUE5
 /sFg==
X-Gm-Message-State: AOAM53159k393ClwoCQHwoWO8pR1/qrJs8A0jVwbods+t+dzq1meBVHw
 Q4xMYoFr29K/zODK/puBjeY/JQ==
X-Google-Smtp-Source: ABdhPJwXPuJlsp/yR/WEcBR8nC8Z7LFDTwgTIFwdrxaYMn3xydogpOWRYQJ9ZqjQ/9DHfIWlUsFQXQ==
X-Received: by 2002:a37:e20f:: with SMTP id g15mr20851650qki.450.1628689642038; 
 Wed, 11 Aug 2021 06:47:22 -0700 (PDT)
Received: from [192.168.1.45] (cpe-174-109-172-136.nc.res.rr.com.
 [174.109.172.136])
 by smtp.gmail.com with ESMTPSA id b22sm4274604qtr.2.2021.08.11.06.47.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Aug 2021 06:47:21 -0700 (PDT)
To: dri-devel@lists.freedesktop.org, christian.koenig@amd.com,
 ray.huang@amd.com
From: Josef Bacik <josef@toxicpanda.com>
Subject: Consistently reproduce-able warning
Message-ID: <f14b920e-da26-66c7-0da1-92215a976337@toxicpanda.com>
Date: Wed, 11 Aug 2021 09:47:20 -0400
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.13.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Wed, 11 Aug 2021 17:57:14 +0000
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

Hello,

I have nightly tests that run on VM's against our btrfs devel tree, and I'm 
getting this warning every day

[15522.437976] ------------[ cut here ]------------
[15522.438356] WARNING: CPU: 0 PID: 2334448 at drivers/gpu/drm/ttm/ttm_bo.c:512 
ttm_bo_release+0x4f9/0x5c0 [ttm]
[15522.439322] Modules linked in: dm_thin_pool dm_persistent_data dm_bio_prison 
dm_log_writes dm_dust dm_flakey loop nft_fib_inet nft_fib_ipv4 nft_fib_ipv6 
nft_fib nft_reject_inet nf_reject_ipv4 nf_reject_ipv6 nft_reject nft_ct 
nft_chain_nat nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 ip6_tables 
nft_compat ip_set rfkill nf_tables nfnetlink joydev iTCO_wdt iTCO_vendor_support 
intel_rapl_msr virtio_balloon intel_rapl_common snd_hda_codec_generic lpc_ich 
snd_hda_intel snd_intel_dspcfg snd_hda_codec snd_hwdep snd_hda_core snd_pcm 
snd_timer snd soundcore i2c_i801 i2c_smbus zram ip_tables xfs crct10dif_pclmul 
crc32_pclmul crc32c_intel qxl drm_ttm_helper ttm drm_kms_helper 
ghash_clmulni_intel cec serio_raw virtio_blk qemu_fw_cfg drm
[15522.445295] CPU: 0 PID: 2334448 Comm: kworker/0:6 Tainted: G        W 
5.12.0-rc1+ #155
[15522.446187] Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 
1.13.0-2.fc32 04/01/2014
[15522.447066] Workqueue: events qxl_gc_work [qxl]
[15522.447546] RIP: 0010:ttm_bo_release+0x4f9/0x5c0 [ttm]
[15522.448093] Code: ff 48 8b bd e8 fe ff ff b9 30 75 00 00 31 d2 be 01 00 00 00 
e8 a8 98 5b c9 48 8b 45 e0 e9 fb fe ff ff 4c 89 e8 e9 f3 fe ff ff <0f> 0b c7 85 
94 00 00 00 00 00 00 00 48 8b 3c 24 48 8d 75 08 31 d2
[15522.450625] RSP: 0018:ffffaaf6c14d3d80 EFLAGS: 00010202
[15522.451134] RAX: 0000000000000001 RBX: 0000000000000002 RCX: 0000000000000000
[15522.451896] RDX: 0000000000000001 RSI: 0000000000000000 RDI: ffffffffc039d168
[15522.452641] RBP: ffff9a028335f648 R08: 0000000000000000 R09: 0000000000000000
[15522.453387] R10: 0000000000000000 R11: ffff9a0282367488 R12: ffff9a02920b4c00
[15522.454233] R13: ffff9a0292208d90 R14: ffff9a028335f6b0 R15: ffff9a02920b4700
[15522.454936] FS:  0000000000000000(0000) GS:ffff9a02fbc00000(0000) 
knlGS:0000000000000000
[15522.455938] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[15522.456508] CR2: 00007f2c2fe34000 CR3: 00000001112be001 CR4: 0000000000370ef0
[15522.456910] Call Trace:
[15522.457055]  qxl_bo_unref+0x31/0x50 [qxl]
[15522.457293]  qxl_release_free_list+0x52/0xa0 [qxl]
[15522.457563]  qxl_release_free+0x76/0xe0 [qxl]
[15522.457821]  qxl_garbage_collect+0xbd/0x170 [qxl]
[15522.458086]  process_one_work+0x26e/0x570
[15522.458320]  worker_thread+0x55/0x3c0
[15522.458526]  ? process_one_work+0x570/0x570
[15522.458776]  kthread+0x137/0x150
[15522.458961]  ? __kthread_bind_mask+0x60/0x60
[15522.459199]  ret_from_fork+0x1f/0x30
[15522.459407] irq event stamp: 0
[15522.459580] hardirqs last  enabled at (0): [<0000000000000000>] 0x0
[15522.459935] hardirqs last disabled at (0): [] copy_process+0x8c4/0x1ca0
[15522.460385] softirqs last  enabled at (0): [] copy_process+0x8c4/0x1ca0
[15522.460835] softirqs last disabled at (0): [<0000000000000000>] 0x0
[15522.461179] ---[ end trace d46763407dcdfb0a ]---

You can find the full dmesg here

http://toxicpanda.com/results/josefbacik/xfstests2/btrfs_compression/08-11-2021-06:56:57/btrfs/022.dmesg.html

I had hit this before and just turned off drm because it was going almost 
constantly, but I accidentally turned it back on when messing with my config. 
Can you guys get this fixed, it messes with my test results as kernel warnings 
show up as failures.  I can run whatever debug stuff you want me to run, like I 
said these run every night and it reproduces all the time.  Thanks,

Josef
