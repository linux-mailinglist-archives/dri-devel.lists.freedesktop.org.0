Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5CF76BB79E
	for <lists+dri-devel@lfdr.de>; Wed, 15 Mar 2023 16:25:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E42610E8EC;
	Wed, 15 Mar 2023 15:25:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D75D10E8DE;
 Wed, 15 Mar 2023 15:25:15 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id l1so17645808wry.12;
 Wed, 15 Mar 2023 08:25:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678893913;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=F1Tjdkcm9ANXGn5qxb6DEQ8TaNVeqrlKXE/a6qrBYv0=;
 b=O3A6NoI86j6M1Fpyq/29vuO8MJ1QL+z3yixMg1bAnLe5zomimV5D7DYNWho9euqPah
 hByHOA1i5cD10Pw9EfWJi9b7Lj5zzETcNJahWVEB+wD3qVRES79flC/38q82o3GovdEV
 5v2lmHSCPKdH3cofEx8//4uuL24GotJ+b6p2Pow91bvFgnOLj5673MG8EM6wt0fzUkPO
 m54U7YC6gKLmTqiKPJ9jyIOtpKxaiTAyF+8Pa6KCBPFNDz6AVwnwI9vCJOMo0C6i4YPU
 0A9IXtr8D6cKUO9xYIXItBLcolDb0GA1DjJCrpAY0bcONaY8Dq6QS9fL96teIpos11mq
 SGbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678893913;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=F1Tjdkcm9ANXGn5qxb6DEQ8TaNVeqrlKXE/a6qrBYv0=;
 b=xqhalGUpl2lcTMtyJKjcJ1MjX/4lFpxXS23y/6lWtITWRNbraQ+sEL0bn7cy8/Dxt7
 nUYd539j2nhSy7COPgIhDryLDgL1GkbYIrglFQsuTY5h/m/gC7F+/dc8OsizfBCyHbTZ
 E9DSfSHpx9CM0Q8Fzx6e5jXXR2vrxNPIo8cooraJ53fxWSmBYxV4hndmfekmOgKt/Kb1
 2bz1pKx6QJ43V2brEpWXzpB8AvAYqRjaLHL9faapVRxo55URAFjqC9i7vPPfs3n8NT3u
 WxG5/WTHNTM3gHsOA7xvJgYuqu2nYHCt7O3anoYuP3Ah7k7R8gZKNTjp5PLpkC17DvTP
 EJtQ==
X-Gm-Message-State: AO0yUKUxPMDvAHxNqqAcYSCWxWZ2xdt15FhZJ1/7T8tpG89qI47w8akj
 2EbrlMs5ujbPg6vLNrwvfgQ=
X-Google-Smtp-Source: AK7set8aLE6gJUe/UJpmlxdKFlAhVSGfuCFvLfWpHPxZSIXWu4cZ2oh/V5Dcjj07r4qXT8eSJKnIyA==
X-Received: by 2002:adf:ee4f:0:b0:2cf:ef5d:4ee7 with SMTP id
 w15-20020adfee4f000000b002cfef5d4ee7mr2401506wro.69.1678893913468; 
 Wed, 15 Mar 2023 08:25:13 -0700 (PDT)
Received: from ?IPV6:2a02:908:1256:79a0:2e4a:9084:4119:9c9f?
 ([2a02:908:1256:79a0:2e4a:9084:4119:9c9f])
 by smtp.gmail.com with ESMTPSA id
 b6-20020adfde06000000b002cfe466e894sm4795147wrm.38.2023.03.15.08.25.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Mar 2023 08:25:12 -0700 (PDT)
Message-ID: <07597f3e-0b35-c22b-91ec-fa3875d6fe22@gmail.com>
Date: Wed, 15 Mar 2023 16:25:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [BUG 6.3-rc1] Bad lock in ttm_bo_delayed_delete()
Content-Language: en-US
To: Steven Rostedt <rostedt@goodmis.org>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
References: <20230307212223.7e49384a@gandalf.local.home>
 <20230307212615.7a099103@gandalf.local.home>
 <b919b550-6da8-f9f0-a0eb-0fd8af513817@amd.com>
 <20230315110949.1e11b3aa@gandalf.local.home>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <20230315110949.1e11b3aa@gandalf.local.home>
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
Cc: amd-gfx@lists.freedesktop.org,
 Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>,
 intel-gfx@lists.freedesktop.org, LKML <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, Masami Hiramatsu <mhiramat@kernel.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Felix Kuehling <Felix.Kuehling@amd.com>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 15.03.23 um 16:09 schrieb Steven Rostedt:
> On Wed, 8 Mar 2023 07:17:38 +0100
> Christian König <christian.koenig@amd.com> wrote:
>
>> Am 08.03.23 um 03:26 schrieb Steven Rostedt:
>>> On Tue, 7 Mar 2023 21:22:23 -0500
>>> Steven Rostedt <rostedt@goodmis.org> wrote:
>>>   
>>>> Looks like there was a lock possibly used after free. But as commit
>>>> 9bff18d13473a9fdf81d5158248472a9d8ecf2bd ("drm/ttm: use per BO cleanup
>>>> workers") changed a lot of this code, I figured it may be the culprit.
>>> If I bothered to look at the second warning after this one (I usually stop
>>> after the first), it appears to state there was a use after free issue.
>> Yeah, that looks like the reference count was somehow messed up.
>>
>> What test case/environment do you run to trigger this?
>>
>> Thanks for the notice,
> I'm still getting this on Linus's latest tree.

This must be some reference counting issue which only happens in your 
particular use case. We have tested this quite extensively and couldn't 
reproduce it so far.

Can you apply this code snippet here and see if you get any warning in 
the system logs?

diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index 459f1b4440da..efc390bfd69c 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -314,6 +314,7 @@ static void ttm_bo_delayed_delete(struct work_struct 
*work)
         dma_resv_lock(bo->base.resv, NULL);
         ttm_bo_cleanup_memtype_use(bo);
         dma_resv_unlock(bo->base.resv);
+       bo->delayed_delete.func = NULL;
         ttm_bo_put(bo);
  }

@@ -327,6 +328,8 @@ static void ttm_bo_release(struct kref *kref)
         WARN_ON_ONCE(bo->pin_count);
         WARN_ON_ONCE(bo->bulk_move);

+       WARN_ON(bo->delayed_delete.func != NULL);
+
         if (!bo->deleted) {
                 ret = ttm_bo_individualize_resv(bo);
                 if (ret) {


Thanks,
Christian.

>
> [  230.530222] ------------[ cut here ]------------
> [  230.569795] DEBUG_LOCKS_WARN_ON(lock->magic != lock)
> [  230.569957] WARNING: CPU: 0 PID: 212 at kernel/locking/mutex.c:582 __ww_mutex_lock.constprop.0+0x62a/0x1300
> [  230.612599] Modules linked in:
> [  230.632144] CPU: 0 PID: 212 Comm: kworker/0:8H Not tainted 6.3.0-rc2-test-00047-g6015b1aca1a2-dirty #992
> [  230.654939] Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.0-debian-1.16.0-5 04/01/2014
> [  230.678866] Workqueue: ttm ttm_bo_delayed_delete
> [  230.699452] EIP: __ww_mutex_lock.constprop.0+0x62a/0x1300
> [  230.720582] Code: e8 3b 9a 95 ff 85 c0 0f 84 61 fa ff ff 8b 0d 58 bc 3a c4 85 c9 0f 85 53 fa ff ff 68 54 98 06 c4 68 b7 b6 04 c4 e8 46 af 40 ff <0f> 0b 58 5a e9 3b fa ff ff 8d 74 26 00 90 a1 ec 47 b0 c4 85 c0 75
> [  230.768336] EAX: 00000028 EBX: 00000000 ECX: c51abdd8 EDX: 00000002
> [  230.792001] ESI: 00000000 EDI: c53856bc EBP: c51abf00 ESP: c51abeac
> [  230.815944] DS: 007b ES: 007b FS: 00d8 GS: 0000 SS: 0068 EFLAGS: 00010246
> [  230.840033] CR0: 80050033 CR2: ff9ff000 CR3: 04506000 CR4: 00150ef0
> [  230.864059] Call Trace:
> [  230.886369]  ? ttm_bo_delayed_delete+0x30/0x94
> [  230.909902]  ww_mutex_lock+0x32/0x94
> [  230.932550]  ttm_bo_delayed_delete+0x30/0x94
> [  230.955798]  process_one_work+0x21a/0x484
> [  230.979335]  worker_thread+0x14a/0x39c
> [  231.002258]  kthread+0xea/0x10c
> [  231.024769]  ? process_one_work+0x484/0x484
> [  231.047870]  ? kthread_complete_and_exit+0x1c/0x1c
> [  231.071498]  ret_from_fork+0x1c/0x28
> [  231.094701] irq event stamp: 4023
> [  231.117272] hardirqs last  enabled at (4023): [<c3d1df99>] _raw_spin_unlock_irqrestore+0x2d/0x58
> [  231.143217] hardirqs last disabled at (4022): [<c31d5a55>] kvfree_call_rcu+0x155/0x2ec
> [  231.166058] softirqs last  enabled at (3460): [<c3d1f403>] __do_softirq+0x2c3/0x3bb
> [  231.183104] softirqs last disabled at (3455): [<c30c96a9>] call_on_stack+0x45/0x4c
> [  231.200336] ---[ end trace 0000000000000000 ]---
> [  231.216572] ------------[ cut here ]------------
>
>
> This is preventing me from adding any of my own patches on v6.3-rcX due to
> this bug failing my tests. Which means I can't add anything to linux-next
> until this is fixed!
>
> -- Steve

