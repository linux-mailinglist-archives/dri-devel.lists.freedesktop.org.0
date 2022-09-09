Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CDE935B32B7
	for <lists+dri-devel@lfdr.de>; Fri,  9 Sep 2022 11:03:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D44210EC2F;
	Fri,  9 Sep 2022 09:03:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A1B010EC2F
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Sep 2022 09:03:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662714213;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rf0tKYf4n/E9K/9Wpb1fbOxuLZkhOrUw5/TCgkx9PNc=;
 b=LAjlZYKUnoYzGeLVbKCFejRS9hZeTm7r41b3xpQJVLD/6L94MImSV53ik+Pry3Y7LUjHda
 5CkNceVYvARV1KyCD1Zk/ThIbxUg1eg/inIK8758YbvXediEmwyxNKbC8UFv4xDppiMqpa
 yQt6OY82t/SdY4nJt0xTMpoG+DklGdo=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-246-WPcgtxVhPzu3N5czRpW-KA-1; Fri, 09 Sep 2022 05:03:32 -0400
X-MC-Unique: WPcgtxVhPzu3N5czRpW-KA-1
Received: by mail-ed1-f70.google.com with SMTP id
 c14-20020a05640227ce00b0043e5df12e2cso806281ede.15
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Sep 2022 02:03:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=rf0tKYf4n/E9K/9Wpb1fbOxuLZkhOrUw5/TCgkx9PNc=;
 b=721rMfzhnWQ8laKrn7rLftU2Brg97Jv3nSMU0ao4JaKKcu9vBBE4uTEGcKDS6hfHJf
 ymH3reWfTOx2qwN5CYh8cMfp0r3xmkUqCcx9oep2I26vvM1qJzyQ9lQ2y8g15KkLzBLs
 A2Voe39+qCmlVQeCOXYec7gQCg2X1hE4y9QKiwmjwJb6gSQN2UDNyVvmHhpmzVFd4+jy
 K34VEofZlPBntm25bAcnVA77mUbdFPBJL/D4vOnswOByypZyEBrtervGqoQpg5Kfh6Qb
 ENItoU1fji/jbkFUfwLauriTqmjEpLa4X4C1sasLsra3iuZsHUCpuND4mz4ZF1PEHVrX
 EX4Q==
X-Gm-Message-State: ACgBeo3IWdHUsSn6Q4GDkeFntLBg9cw7kGyZz6GCNZzV2hE97NZrrPsq
 i/Tkn2cpH9Jj0S54MOQlspxvg0rrSG5jIsG8/nQKfFhWTxQa1LODuJrssfEA7FvmStvU9Dob9Ni
 rcWmmobM9mVfuEm5usLTlqSS4fsw/
X-Received: by 2002:a17:906:9b90:b0:738:60f9:c7d6 with SMTP id
 dd16-20020a1709069b9000b0073860f9c7d6mr9140961ejc.198.1662714210837; 
 Fri, 09 Sep 2022 02:03:30 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4sOJtjLVWzjb3GzSfgtXZkVgrOpHVLm/N/R0Vf9Mnfca33Irkbtz7XDVOvzQ3DQ/+B/9UdrQ==
X-Received: by 2002:a17:906:9b90:b0:738:60f9:c7d6 with SMTP id
 dd16-20020a1709069b9000b0073860f9c7d6mr9140955ejc.198.1662714210584; 
 Fri, 09 Sep 2022 02:03:30 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81?
 (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
 by smtp.gmail.com with ESMTPSA id
 e6-20020a170906648600b00775f6081a87sm653942ejm.121.2022.09.09.02.03.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Sep 2022 02:03:30 -0700 (PDT)
Message-ID: <a549e3a5-b04a-187b-43e3-cc0ac8e7b61a@redhat.com>
Date: Fri, 9 Sep 2022 11:03:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v2 2/3] drm/gma500: Fix WARN_ON(lock->magic != lock) error
To: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
References: <20220906203852.527663-1-hdegoede@redhat.com>
 <20220906203852.527663-3-hdegoede@redhat.com>
 <CAMeQTsZEuhwDBsUAqtbSmC+uPpJh6V7z9c+0ahPC83Hv1TsOOw@mail.gmail.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAMeQTsZEuhwDBsUAqtbSmC+uPpJh6V7z9c+0ahPC83Hv1TsOOw@mail.gmail.com>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 9/9/22 10:20, Patrik Jakobsson wrote:
> On Tue, Sep 6, 2022 at 10:38 PM Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> psb_gem_unpin() calls dma_resv_lock() but the underlying ww_mutex
>> gets destroyed by drm_gem_object_release() move the
>> drm_gem_object_release() call in psb_gem_free_object() to after
>> the unpin to fix the below warning:
> 
> Looks good. I'll apply this to drm-misc-fixes. Let me know if it
> should go somewhere else.

drm-misc-fixes sounds good to me, thank you.

Regards,

Hans


> 
> Signed-off-by: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
> 
>>
>> [   79.693962] ------------[ cut here ]------------
>> [   79.693992] DEBUG_LOCKS_WARN_ON(lock->magic != lock)
>> [   79.694015] WARNING: CPU: 0 PID: 240 at kernel/locking/mutex.c:582 __ww_mutex_lock.constprop.0+0x569/0xfb0
>> [   79.694052] Modules linked in: rfcomm snd_seq_dummy snd_hrtimer qrtr bnep ath9k ath9k_common ath9k_hw snd_hda_codec_realtek snd_hda_codec_generic ledtrig_audio snd_hda_codec_hdmi snd_hda_intel ath3k snd_intel_dspcfg mac80211 snd_intel_sdw_acpi btusb snd_hda_codec btrtl btbcm btintel btmtk bluetooth at24 snd_hda_core snd_hwdep uvcvideo snd_seq libarc4 videobuf2_vmalloc ath videobuf2_memops videobuf2_v4l2 videobuf2_common snd_seq_device videodev acer_wmi intel_powerclamp coretemp mc snd_pcm joydev sparse_keymap ecdh_generic pcspkr wmi_bmof cfg80211 i2c_i801 i2c_smbus snd_timer snd r8169 rfkill lpc_ich soundcore acpi_cpufreq zram rtsx_pci_sdmmc mmc_core serio_raw rtsx_pci gma500_gfx(E) video wmi ip6_tables ip_tables i2c_dev fuse
>> [   79.694436] CPU: 0 PID: 240 Comm: plymouthd Tainted: G        W   E      6.0.0-rc3+ #490
>> [   79.694457] Hardware name: Packard Bell dot s/SJE01_CT, BIOS V1.10 07/23/2013
>> [   79.694469] RIP: 0010:__ww_mutex_lock.constprop.0+0x569/0xfb0
>> [   79.694496] Code: ff 85 c0 0f 84 15 fb ff ff 8b 05 ca 3c 11 01 85 c0 0f 85 07 fb ff ff 48 c7 c6 30 cb 84 aa 48 c7 c7 a3 e1 82 aa e8 ac 29 f8 ff <0f> 0b e9 ed fa ff ff e8 5b 83 8a ff 85 c0 74 10 44 8b 0d 98 3c 11
>> [   79.694513] RSP: 0018:ffffad1dc048bbe0 EFLAGS: 00010282
>> [   79.694623] RAX: 0000000000000028 RBX: 0000000000000000 RCX: 0000000000000000
>> [   79.694636] RDX: 0000000000000001 RSI: ffffffffaa8b0ffc RDI: 00000000ffffffff
>> [   79.694650] RBP: ffffad1dc048bc80 R08: 0000000000000000 R09: ffffad1dc048ba90
>> [   79.694662] R10: 0000000000000003 R11: ffffffffaad62fe8 R12: ffff9ff302103138
>> [   79.694675] R13: ffff9ff306ec8000 R14: ffff9ff307779078 R15: ffff9ff3014c0270
>> [   79.694690] FS:  00007ff1cccf1740(0000) GS:ffff9ff3bc200000(0000) knlGS:0000000000000000
>> [   79.694705] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>> [   79.694719] CR2: 0000559ecbcb4420 CR3: 0000000013210000 CR4: 00000000000006f0
>> [   79.694734] Call Trace:
>> [   79.694749]  <TASK>
>> [   79.694761]  ? __schedule+0x47f/0x1670
>> [   79.694796]  ? psb_gem_unpin+0x27/0x1a0 [gma500_gfx]
>> [   79.694830]  ? lock_is_held_type+0xe3/0x140
>> [   79.694864]  ? ww_mutex_lock+0x38/0xa0
>> [   79.694885]  ? __cond_resched+0x1c/0x30
>> [   79.694902]  ww_mutex_lock+0x38/0xa0
>> [   79.694925]  psb_gem_unpin+0x27/0x1a0 [gma500_gfx]
>> [   79.694964]  psb_gem_unpin+0x199/0x1a0 [gma500_gfx]
>> [   79.694996]  drm_gem_object_release_handle+0x50/0x60
>> [   79.695020]  ? drm_gem_object_handle_put_unlocked+0xf0/0xf0
>> [   79.695042]  idr_for_each+0x4b/0xb0
>> [   79.695066]  ? _raw_spin_unlock_irqrestore+0x30/0x60
>> [   79.695095]  drm_gem_release+0x1c/0x30
>> [   79.695118]  drm_file_free.part.0+0x1ea/0x260
>> [   79.695150]  drm_release+0x6a/0x120
>> [   79.695175]  __fput+0x9f/0x260
>> [   79.695203]  task_work_run+0x59/0xa0
>> [   79.695227]  do_exit+0x387/0xbe0
>> [   79.695250]  ? seqcount_lockdep_reader_access.constprop.0+0x82/0x90
>> [   79.695275]  ? lockdep_hardirqs_on+0x7d/0x100
>> [   79.695304]  do_group_exit+0x33/0xb0
>> [   79.695331]  __x64_sys_exit_group+0x14/0x20
>> [   79.695353]  do_syscall_64+0x58/0x80
>> [   79.695376]  ? up_read+0x17/0x20
>> [   79.695401]  ? lock_is_held_type+0xe3/0x140
>> [   79.695429]  ? asm_exc_page_fault+0x22/0x30
>> [   79.695450]  ? lockdep_hardirqs_on+0x7d/0x100
>> [   79.695473]  entry_SYSCALL_64_after_hwframe+0x63/0xcd
>> [   79.695493] RIP: 0033:0x7ff1ccefe3f1
>> [   79.695516] Code: Unable to access opcode bytes at RIP 0x7ff1ccefe3c7.
>> [   79.695607] RSP: 002b:00007ffed4413378 EFLAGS: 00000246 ORIG_RAX: 00000000000000e7
>> [   79.695629] RAX: ffffffffffffffda RBX: 00007ff1cd0159e0 RCX: 00007ff1ccefe3f1
>> [   79.695644] RDX: 000000000000003c RSI: 00000000000000e7 RDI: 0000000000000000
>> [   79.695656] RBP: 0000000000000000 R08: ffffffffffffff80 R09: 00007ff1cd020b20
>> [   79.695671] R10: 0000000000000000 R11: 0000000000000246 R12: 00007ff1cd0159e0
>> [   79.695684] R13: 0000000000000000 R14: 00007ff1cd01aee8 R15: 00007ff1cd01af00
>> [   79.695733]  </TASK>
>> [   79.695746] irq event stamp: 725979
>> [   79.695757] hardirqs last  enabled at (725979): [<ffffffffa9132d54>] finish_task_switch.isra.0+0xe4/0x3f0
>> [   79.695780] hardirqs last disabled at (725978): [<ffffffffa9eb4113>] __schedule+0xdd3/0x1670
>> [   79.695803] softirqs last  enabled at (725974): [<ffffffffa90fbc9d>] __irq_exit_rcu+0xed/0x160
>> [   79.695825] softirqs last disabled at (725969): [<ffffffffa90fbc9d>] __irq_exit_rcu+0xed/0x160
>> [   79.695845] ---[ end trace 0000000000000000 ]---
>>
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>> ---
>>  drivers/gpu/drm/gma500/gem.c | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/gma500/gem.c b/drivers/gpu/drm/gma500/gem.c
>> index dffe37490206..4b7627a72637 100644
>> --- a/drivers/gpu/drm/gma500/gem.c
>> +++ b/drivers/gpu/drm/gma500/gem.c
>> @@ -112,12 +112,12 @@ static void psb_gem_free_object(struct drm_gem_object *obj)
>>  {
>>         struct psb_gem_object *pobj = to_psb_gem_object(obj);
>>
>> -       drm_gem_object_release(obj);
>> -
>>         /* Undo the mmap pin if we are destroying the object */
>>         if (pobj->mmapping)
>>                 psb_gem_unpin(pobj);
>>
>> +       drm_gem_object_release(obj);
>> +
>>         WARN_ON(pobj->in_gart && !pobj->stolen);
>>
>>         release_resource(&pobj->resource);
>> --
>> 2.37.2
>>
> 

