Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 685956BBD16
	for <lists+dri-devel@lfdr.de>; Wed, 15 Mar 2023 20:15:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2817710E30F;
	Wed, 15 Mar 2023 19:15:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C9DE10E2FF;
 Wed, 15 Mar 2023 19:15:51 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id bi9so3426022lfb.12;
 Wed, 15 Mar 2023 12:15:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678907749;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=s/TbcNqKWN0M5lu3wJAR1U2s2LeA07pOPBmN8acExL0=;
 b=O5ur8jSvdB/27xbe32AESiRGhcveHvRo5NOaDMOW1kpL0OswesjyshUT7QTDwawvGN
 vx/xKxwCiKLsKEJkO1qWFU2FXLc4atOFdLRmZ3076bqob4ti2vI1cECaFybQvMKz5pZv
 /bHto9NZ01y2aSX9adBezC6aYsnn+1b+rY6uhUv2O8/DrGn8KQVVlCVpS/6fGWQbv1uU
 gWbM7JHpV8JnX5u+M+33xxdoyG7FOo2M5edJsKRthcQfvqf9M8Hk4pwzDp0fjfPmCKxD
 ZuKfWkLnY3oUfQF5Su3evoeUpfkg6RgrTpD0LLO806HlCoeLQBEc7dPwq5e1BTqIGQD8
 2vjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678907749;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=s/TbcNqKWN0M5lu3wJAR1U2s2LeA07pOPBmN8acExL0=;
 b=cn3qqdoHBttY47mzzRShAKyOJYwpqlJDWUSLX0KDE2g+rxZPIHql7nOxRyd1P9kuC0
 CmWl9/sQyMyTMhUatpuC4q733XrjztEL18N5jRzPr+Ay69qb5JtQ7mS/xSvqFi3YBmZA
 /Uk6iANsuX6e7REW79s88dgh6tKAgJICX8dI1i4i3p/M+JcSJB5hSX9fEwCnguUX6zpF
 xPnc9bjKXN+uj1vTLJEmXQqYb5yGuz8h5L8k0ujA46Glz//ABjpil+/fD7Sqgjrrrk01
 hrpplJDmfdhiamAtI7euqcdZXoNH94pq6uxvoQL9xvD+7fTS9wXjmbjSjCFda+ciwcbi
 V+QQ==
X-Gm-Message-State: AO0yUKVziX8lLYyJg/0dFrYQpeq57KFTSr1jB9Crmw8rD4HxsoY+kzkc
 EpBqRy30Eg5nMIC+zKk0JF8kefFa9j+/kIr+DU8=
X-Google-Smtp-Source: AK7set+RLtA8GIwiFyS4rsBM8IKpZnaihakScemGdopDS8WcGoKzTe0kT84u6FhuozpIRdVObQcJElU+HSk0NKRv5fk=
X-Received: by 2002:ac2:5df9:0:b0:4db:2554:93a2 with SMTP id
 z25-20020ac25df9000000b004db255493a2mr2378777lfq.10.1678907749244; Wed, 15
 Mar 2023 12:15:49 -0700 (PDT)
MIME-Version: 1.0
References: <20230307212223.7e49384a@gandalf.local.home>
 <20230307212615.7a099103@gandalf.local.home>
 <b919b550-6da8-f9f0-a0eb-0fd8af513817@amd.com>
 <20230308074333.49546088@gandalf.local.home>
 <980021d5-09f7-9fc3-2726-44884a57822f@gmail.com>
In-Reply-To: <980021d5-09f7-9fc3-2726-44884a57822f@gmail.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Wed, 15 Mar 2023 19:15:21 +0000
Message-ID: <CAM0jSHPf5u4=GGWm6x-zVkLA_LScAxq371ny2NoozuNjHfQefQ@mail.gmail.com>
Subject: Re: [Intel-gfx] [BUG 6.3-rc1] Bad lock in ttm_bo_delayed_delete()
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
 dri-devel@lists.freedesktop.org, Steven Rostedt <rostedt@goodmis.org>,
 Felix Kuehling <Felix.Kuehling@amd.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 15 Mar 2023 at 18:41, Christian K=C3=B6nig
<ckoenig.leichtzumerken@gmail.com> wrote:
>
> Am 08.03.23 um 13:43 schrieb Steven Rostedt:
> > On Wed, 8 Mar 2023 07:17:38 +0100
> > Christian K=C3=B6nig <christian.koenig@amd.com> wrote:
> >
> >> What test case/environment do you run to trigger this?
> > I'm running a 32bit x86 qemu instance. Attached is the config.
> >
> > The libvirt xml file is here: https://rostedt.org/vm-images/tracetest-3=
2.xml
> > and the VM image itself is here: https://rostedt.org/vm-images/tracetes=
t-32.qcow2.bz2
>
> I've started to download that, but it will take about an hour. So I
> tried to avoid that for now.
>
> But looks like there isn't any other way to reproduce this, the code
> seems to work with both amdgpu and radeon.
>
> My suspicion is that we just have a reference count issue in qxl or ttm
> which was never noticed because it didn't caused any problems (except
> for a minor memory corruption).

Why does ttm_bo_cleanup_refs() do a bo_put() at the end? It doesn't
make sense to me. Say if the BO is in the process of being delay freed
(bo->deleted =3D true), and we just did the kref_init() in
ttm_bo_release(), it might drop that ref hitting ttm_bo_release() yet
again, this time doing the actual bo->destroy(), which frees the
object. The worker then fires at some later point calling
ttm_bo_delayed_delete(), but the BO has already been freed.

>
> Now you get a rain of warnings because we try to grab the lock in the
> delete worker.
>
> Christian.
>
> >
> > It happened again in another test (it's not 100% reproducible).
> >
> > [   23.234838] ------------[ cut here ]------------
> > [   23.236391] DEBUG_LOCKS_WARN_ON(lock->magic !=3D lock)
> > [   23.236429] WARNING: CPU: 0 PID: 61 at kernel/locking/mutex.c:582 __=
ww_mutex_lock.constprop.0+0x566/0xfec
> > [   23.240990] Modules linked in:
> > [   23.242368] CPU: 0 PID: 61 Comm: kworker/0:1H Not tainted 6.3.0-rc1-=
test-00001-ga98bd42762ed-dirty #972
> > [   23.245106] Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS=
 1.16.0-debian-1.16.0-5 04/01/2014
> > [   23.247900] Workqueue: ttm ttm_bo_delayed_delete
> > [   23.249642] EIP: __ww_mutex_lock.constprop.0+0x566/0xfec
> > [   23.251563] Code: e8 2b 5a 95 ff 85 c0 0f 84 25 fb ff ff 8b 0d 18 71=
 3b c8 85 c9 0f 85 17 fb ff ff 68 c0 58 07 c8 68 07 77 05 c8 e8 e6 0a 40 ff=
 <0f> 0b 58 5a e9 ff fa ff ff e8 f8 59 95 ff 85 c0 74 0e 8b 0d 18 71
> > [   23.256901] EAX: 00000028 EBX: 00000000 ECX: c1847dd8 EDX: 00000002
> > [   23.258849] ESI: 00000000 EDI: c12958bc EBP: c1847f00 ESP: c1847eac
> > [   23.260786] DS: 007b ES: 007b FS: 00d8 GS: 0000 SS: 0068 EFLAGS: 000=
10286
> > [   23.262840] CR0: 80050033 CR2: ffbff000 CR3: 0850e000 CR4: 00150ef0
> > [   23.264781] Call Trace:
> > [   23.265899]  ? lock_is_held_type+0xbe/0x10c
> > [   23.267434]  ? ttm_bo_delayed_delete+0x30/0x94
> > [   23.268971]  ww_mutex_lock+0x32/0x94
> > [   23.270327]  ttm_bo_delayed_delete+0x30/0x94
> > [   23.271818]  process_one_work+0x21a/0x538
> > [   23.273242]  worker_thread+0x146/0x398
> > [   23.274616]  kthread+0xea/0x10c
> > [   23.275859]  ? process_one_work+0x538/0x538
> > [   23.277312]  ? kthread_complete_and_exit+0x1c/0x1c
> > [   23.278899]  ret_from_fork+0x1c/0x28
> > [   23.280223] irq event stamp: 33
> > [   23.281440] hardirqs last  enabled at (33): [<c7d28089>] _raw_spin_u=
nlock_irqrestore+0x2d/0x58
> > [   23.283860] hardirqs last disabled at (32): [<c71d4ba5>] kvfree_call=
_rcu+0x155/0x2ec
> > [   23.286066] softirqs last  enabled at (0): [<c71217fd>] copy_process=
+0x989/0x2368
> > [   23.288220] softirqs last disabled at (0): [<00000000>] 0x0
> > [   23.289952] ---[ end trace 0000000000000000 ]---
> > [   23.291501] ------------[ cut here ]------------
> > [   23.293027] refcount_t: underflow; use-after-free.
> > [   23.294644] WARNING: CPU: 0 PID: 61 at lib/refcount.c:28 refcount_wa=
rn_saturate+0xb6/0xfc
> > [   23.296959] Modules linked in:
> > [   23.298168] CPU: 0 PID: 61 Comm: kworker/0:1H Tainted: G        W   =
       6.3.0-rc1-test-00001-ga98bd42762ed-dirty #972
> > [   23.301073] Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS=
 1.16.0-debian-1.16.0-5 04/01/2014
> > [   23.303642] Workqueue: ttm ttm_bo_delayed_delete
> > [   23.305190] EIP: refcount_warn_saturate+0xb6/0xfc
> > [   23.306767] Code: 68 70 e1 0c c8 e8 f6 d6 a9 ff 0f 0b 58 c9 c3 90 80=
 3d 8a 78 38 c8 00 75 8a c6 05 8a 78 38 c8 01 68 9c e1 0c c8 e8 d6 d6 a9 ff=
 <0f> 0b 59 c9 c3 80 3d 88 78 38 c8 00 0f 85 67 ff ff ff c6 05 88 78
> > [   23.311935] EAX: 00000026 EBX: c1295950 ECX: c1847e40 EDX: 00000002
> > [   23.313884] ESI: c12958bc EDI: f7591100 EBP: c1847f18 ESP: c1847f14
> > [   23.315840] DS: 007b ES: 007b FS: 00d8 GS: 0000 SS: 0068 EFLAGS: 000=
10246
> > [   23.317887] CR0: 80050033 CR2: ffbff000 CR3: 0850e000 CR4: 00150ef0
> > [   23.319859] Call Trace:
> > [   23.320978]  ttm_bo_delayed_delete+0x8c/0x94
> > [   23.322492]  process_one_work+0x21a/0x538
> > [   23.323959]  worker_thread+0x146/0x398
> > [   23.325353]  kthread+0xea/0x10c
> > [   23.326609]  ? process_one_work+0x538/0x538
> > [   23.328081]  ? kthread_complete_and_exit+0x1c/0x1c
> > [   23.329683]  ret_from_fork+0x1c/0x28
> > [   23.331011] irq event stamp: 33
> > [   23.332251] hardirqs last  enabled at (33): [<c7d28089>] _raw_spin_u=
nlock_irqrestore+0x2d/0x58
> > [   23.334334] hardirqs last disabled at (32): [<c71d4ba5>] kvfree_call=
_rcu+0x155/0x2ec
> > [   23.336176] softirqs last  enabled at (0): [<c71217fd>] copy_process=
+0x989/0x2368
> > [   23.337904] softirqs last disabled at (0): [<00000000>] 0x0
> > [   23.339313] ---[ end trace 0000000000000000 ]---
> >
> > -- Steve
>
