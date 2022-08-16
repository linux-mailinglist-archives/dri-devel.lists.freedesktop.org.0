Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AB995962ED
	for <lists+dri-devel@lfdr.de>; Tue, 16 Aug 2022 21:14:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1283F10EE4B;
	Tue, 16 Aug 2022 19:14:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x736.google.com (mail-qk1-x736.google.com
 [IPv6:2607:f8b0:4864:20::736])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E01510ED00;
 Tue, 16 Aug 2022 19:14:23 +0000 (UTC)
Received: by mail-qk1-x736.google.com with SMTP id t11so8859703qkt.6;
 Tue, 16 Aug 2022 12:14:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=2na/qB5N5lOlz/8+8KgAPgP6/03l17atLw+bjUACA4E=;
 b=AhVwvbHPjpgNhznL0xXQDP0pjy95GODO2qConQ5goFMxmO7dcnYhSBdyOBzgVSDStF
 8X5YzJVisV16LefelAQPvYcpthjdfCfmvKYKCHwrSoQAhvZMKMhRzYlmd8ND5DUQMJRj
 FgpqNl8gSsZb/noBFZy5isTbkEL3aFXKI6Xk0pL/qOokRiBLI1NhpUMdgwfEUeqGYyIp
 68RFy8SbgxJxYEbi/lfbgLWR0CZ7K1QdWrpo2AnZ8ow5mC4B+lNujLzDE7suc4Dr8NyD
 SIjju3gofVbuE9CA2FCQKDmgrl6XfShsqfGFsW0HoLu5WwRjUakR0uFgHcu2yQH9JsmN
 swSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=2na/qB5N5lOlz/8+8KgAPgP6/03l17atLw+bjUACA4E=;
 b=W87KNB0rvG1ZOrFjGEJXtUDsHHMHXboVfNxt1CAiS4sjFp4FXzAOYeoiTyFVZAtr0+
 FBhXeqp0Rfe9reWx2I4gF0EF03Cvg/WVrTtXbUTEw2TgdfHCE9GIXeWxG7IGhGkzTruF
 Qw9my+1IjAOYLYRpU9bkFs7tK3J94GLAUhGHULiRaz+VQ1mqYBxvYFYIh4Y/WGIY3590
 BmdmOFWeYvMn1DCmYiSBuN9rBP5Wu5wPilxwobekkT0l6EeUOzmnFPnlGNEwFiJlhTtA
 y9prxGYJs4hqYhBCKTNrYoDMGnPCik1eJRpzTkoTv7s4xboA/b1RgLhQN6B9vRhZxOYa
 6knA==
X-Gm-Message-State: ACgBeo0edz23QMUaCYGqy0TqtbZ/75GJ2mYrCJ7eawea7gMYFy/ABMyi
 r4lnyyV4oOPiw4N54x6l4JgHHSiCn4MDFZe2T4w=
X-Google-Smtp-Source: AA6agR7dEIBdG3yyFdlI9pBUKJupoTPoXeKG6ePOm01R7wXlVXUEz+bpz6TJvi97Hxb85z/1563pKyaYXDgQQz4eZpU=
X-Received: by 2002:a05:620a:4249:b0:6b6:7b2f:4d94 with SMTP id
 w9-20020a05620a424900b006b67b2f4d94mr16183527qko.580.1660677262335; Tue, 16
 Aug 2022 12:14:22 -0700 (PDT)
MIME-Version: 1.0
References: <CABXGCsM58-8fxVKAVkwsshg+33B_1_t_WesG160AtVBe1ZvKiw@mail.gmail.com>
 <be6f1ce4-46b1-7a80-230c-b99f203ce8ad@riseup.net>
 <CABXGCsMFYnE+Wn2EAWuC8DSVj=TVprj6ABZwRK-hXcw-1hnMyw@mail.gmail.com>
In-Reply-To: <CABXGCsMFYnE+Wn2EAWuC8DSVj=TVprj6ABZwRK-hXcw-1hnMyw@mail.gmail.com>
From: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
Date: Wed, 17 Aug 2022 00:14:11 +0500
Message-ID: <CABXGCsMpGabZ32j_ObEHa_har2W8M8RWuqnx3d=yJT2NX_ztNg@mail.gmail.com>
Subject: Re: [BUG][5.20] refcount_t: underflow; use-after-free
To: =?UTF-8?B?TWHDrXJhIENhbmFs?= <mairacanal@riseup.net>
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
Cc: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Linux List Kernel Mailing <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Aug 15, 2022 at 3:37 PM Mikhail Gavrilov
<mikhail.v.gavrilov@gmail.com> wrote:
>
> Thanks, I tested this patch.
> But with this patch use-after-free problem happening in another place:

Does anyone have an idea why the second use-after-free happened?
From the trace I don't understand which code is related.
I don't quite understand what the "Workqueue" entry in the trace means.

[ 408.358737] ------------[ cut here ]------------
[ 408.358743] refcount_t: underflow; use-after-free.
[ 408.358760] WARNING: CPU: 9 PID: 62 at lib/refcount.c:28
refcount_warn_saturate+0xba/0x110
[ 408.358769] Modules linked in: uinput snd_seq_dummy rfcomm
snd_hrtimer nft_objref nf_conntrack_netbios_ns nf_conntrack_broadcast
nft_fib_inet nft_fib_ipv4 nft_fib_ipv6 nft_fib nft_reject_inet
nf_reject_ipv4 nf_reject_ipv6 nft_reject nft_ct nft_chain_nat nf_nat
nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 ip_set nf_tables nfnetlink
qrtr bnep sunrpc binfmt_misc snd_seq_midi snd_seq_midi_event mt76x2u
mt76x2_common snd_hda_codec_realtek mt76x02_usb snd_hda_codec_generic
iwlmvm snd_hda_codec_hdmi mt76_usb intel_rapl_msr snd_hda_intel
mt76x02_lib intel_rapl_common snd_intel_dspcfg snd_intel_sdw_acpi mt76
snd_hda_codec vfat fat snd_usb_audio snd_hda_core edac_mce_amd
mac80211 snd_usbmidi_lib snd_hwdep snd_rawmidi mc snd_seq btusb
kvm_amd iwlwifi snd_seq_device btrtl btbcm libarc4 btintel eeepc_wmi
snd_pcm iwlmei kvm btmtk asus_wmi ledtrig_audio irqbypass joydev
snd_timer sparse_keymap bluetooth platform_profile rapl cfg80211 snd
video wmi_bmof soundcore i2c_piix4 k10temp rfkill mei
[ 408.358853] asus_ec_sensors acpi_cpufreq zram hid_logitech_hidpp
amdgpu igb dca drm_ttm_helper ttm iommu_v2 crct10dif_pclmul gpu_sched
crc32_pclmul ucsi_ccg crc32c_intel drm_buddy nvme typec_ucsi
drm_display_helper ghash_clmulni_intel ccp typec nvme_core sp5100_tco
cec wmi ip6_tables ip_tables fuse
[ 408.358880] Unloaded tainted modules: amd64_edac():1 amd64_edac():1
amd64_edac():1 amd64_edac():1 amd64_edac():1 amd64_edac():1
amd64_edac():1 amd64_edac():1 amd64_edac():1 amd64_edac():1
pcc_cpufreq():1 amd64_edac():1 pcc_cpufreq():1 pcc_cpufreq():1
amd64_edac():1 amd64_edac():1 pcc_cpufreq():1 amd64_edac():1
pcc_cpufreq():1 amd64_edac():1 pcc_cpufreq():1 amd64_edac():1
pcc_cpufreq():1 pcc_cpufreq():1 amd64_edac():1 pcc_cpufreq():1
amd64_edac():1 pcc_cpufreq():1 amd64_edac():1 pcc_cpufreq():1
pcc_cpufreq():1 amd64_edac():1 amd64_edac():1 pcc_cpufreq():1
pcc_cpufreq():1 amd64_edac():1 pcc_cpufreq():1 amd64_edac():1
pcc_cpufreq():1 amd64_edac():1 pcc_cpufreq():1 pcc_cpufreq():1
amd64_edac():1 pcc_cpufreq():1 amd64_edac():1 pcc_cpufreq():1
amd64_edac():1 pcc_cpufreq():1 pcc_cpufreq():1 amd64_edac():1
pcc_cpufreq():1 amd64_edac():1 amd64_edac():1 pcc_cpufreq():1
amd64_edac():1 pcc_cpufreq():1 amd64_edac():1 pcc_cpufreq():1
pcc_cpufreq():1 pcc_cpufreq():1 fjes():1 pcc_cpufreq():1 fjes():1
[ 408.358953] pcc_cpufreq():1 pcc_cpufreq():1 fjes():1 pcc_cpufreq():1
fjes():1 fjes():1 fjes():1 fjes():1 fjes():1
[ 408.358967] CPU: 9 PID: 62 Comm: kworker/9:0 Tainted: G W L -------
--- 6.0.0-0.rc1.13.fc38.x86_64+debug #1
[ 408.358971] Hardware name: System manufacturer System Product
Name/ROG STRIX X570-I GAMING, BIOS 4403 04/27/2022
[ 408.358974] Workqueue: events drm_sched_entity_kill_jobs_work [gpu_sched]
[ 408.358982] RIP: 0010:refcount_warn_saturate+0xba/0x110
[ 408.358987] Code: 01 01 e8 d9 59 6f 00 0f 0b e9 a2 46 a5 00 80 3d 3e
7e be 01 00 75 85 48 c7 c7 70 99 8e 92 c6 05 2e 7e be 01 01 e8 b6 59
6f 00 <0f> 0b e9 7f 46 a5 00 80 3d 19 7e be 01 00 0f 85 5e ff ff ff 48
c7
[ 408.358990] RSP: 0018:ffffb124003efe60 EFLAGS: 00010286
[ 408.358994] RAX: 0000000000000026 RBX: ffff9987a025d428 RCX: 0000000000000000
[ 408.358997] RDX: 0000000000000001 RSI: ffffffff928d0754 RDI: 00000000ffffffff
[ 408.358999] RBP: ffff9994e4ff5600 R08: 0000000000000000 R09: ffffb124003efd10
[ 408.359001] R10: 0000000000000003 R11: ffff99952e2fffe8 R12: ffff9994e4ffc800
[ 408.359004] R13: ffff998600228cc0 R14: ffff9994e4ffc805 R15: ffff9987a025d430
[ 408.359006] FS: 0000000000000000(0000) GS:ffff9994e4e00000(0000)
knlGS:0000000000000000
[ 408.359009] CS: 0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[ 408.359012] CR2: 000027ac39e78000 CR3: 00000001a66d8000 CR4: 0000000000350ee0
[ 408.359015] Call Trace:
[ 408.359017] <TASK>
[ 408.359020] process_one_work+0x2a0/0x600
[ 408.359032] worker_thread+0x4f/0x3a0
[ 408.359036] ? process_one_work+0x600/0x600
[ 408.359039] kthread+0xf5/0x120
[ 408.359044] ? kthread_complete_and_exit+0x20/0x20
[ 408.359049] ret_from_fork+0x22/0x30
[ 408.359061] </TASK>
[ 408.359063] irq event stamp: 5468
[ 408.359064] hardirqs last enabled at (5467): [<ffffffff91f2b9e4>]
_raw_spin_unlock_irq+0x24/0x50
[ 408.359071] hardirqs last disabled at (5468): [<ffffffff91f22d8c>]
__schedule+0xe2c/0x16d0
[ 408.359076] softirqs last enabled at (2482): [<ffffffff917acc28>]
rht_deferred_worker+0x708/0xc00
[ 408.359079] softirqs last disabled at (2480): [<ffffffff917ac717>]
rht_deferred_worker+0x1f7/0xc00
[ 408.359082] ---[ end trace 0000000000000000 ]---


Full kernel log is here: https://pastebin.com/Lam9CRLV

-- 
Best Regards,
Mike Gavrilov.
