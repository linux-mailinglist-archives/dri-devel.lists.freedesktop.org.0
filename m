Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 801DE69F9AA
	for <lists+dri-devel@lfdr.de>; Wed, 22 Feb 2023 18:09:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A9C510E1A5;
	Wed, 22 Feb 2023 17:09:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 495 seconds by postgrey-1.36 at gabe;
 Tue, 21 Feb 2023 11:43:34 UTC
Received: from out-4.mta1.migadu.com (out-4.mta1.migadu.com
 [IPv6:2001:41d0:203:375::4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CD5010E31D
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Feb 2023 11:43:34 +0000 (UTC)
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1676979317;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=0gXYNRzzbITxqC5/S0B+BHx0Ap4RLzkH7+/YGE5Q3gI=;
 b=VdfJz94FNlNZxmcM6B8iVNMtf676v7YOehY7uKZdLEjaW33iyhyVPy3uWZ+jQVY+x7NY7Z
 kzcTk8Ye5VaOUN7/tOHgaumBhba5ge0zZPjyREl28q4u/SYXrGFdyJdsSqSmpxhvcZ43ON
 iw1rIbEm1rmVKLSPi2/jjNbJlpV/59s=
Date: Tue, 21 Feb 2023 11:35:16 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: qu.huang@linux.dev
Message-ID: <eb49be7c44ae95c4d18e66b59874ef1c@linux.dev>
Subject: [PATCH] drm/amdkfd: Fix an illegal memory access
To: Felix.Kuehling@amd.com, alexander.deucher@amd.com,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch
X-Migadu-Flow: FLOW_OUT
X-Mailman-Approved-At: Wed, 22 Feb 2023 17:09:36 +0000
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
Cc: qu.huang@linux.dev, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Qu Huang <qu.huang@linux.dev>=0A=0AIn the kfd_wait_on_events() func=
tion, the kfd_event_waiter structure is=0Aallocated by alloc_event_waiter=
s(), but the event field of the waiter=0Astructure is not initialized; Wh=
en copy_from_user() fails in the=0Akfd_wait_on_events() function, it will=
 enter exception handling to=0Arelease the previously allocated memory of=
 the waiter structure;=0ADue to the event field of the waiters structure =
being accessed=0Ain the free_waiters() function, this results in illegal =
memory access=0Aand system crash, here is the crash log:=0A=0Alocalhost k=
ernel: RIP: 0010:native_queued_spin_lock_slowpath+0x185/0x1e0=0Alocalhost=
 kernel: RSP: 0018:ffffaa53c362bd60 EFLAGS: 00010082=0Alocalhost kernel: =
RAX: ff3d3d6bff4007cb RBX: 0000000000000282 RCX: 00000000002c0000=0Alocal=
host kernel: RDX: ffff9e855eeacb80 RSI: 000000000000279c RDI: ffffe7088f6=
a21d0=0Alocalhost kernel: RBP: ffffe7088f6a21d0 R08: 00000000002c0000 R09=
: ffffaa53c362be64=0Alocalhost kernel: R10: ffffaa53c362bbd8 R11: 0000000=
000000001 R12: 0000000000000002=0Alocalhost kernel: R13: ffff9e7ead15d600=
 R14: 0000000000000000 R15: ffff9e7ead15d698=0Alocalhost kernel: FS:  000=
0152a3d111700(0000) GS:ffff9e855ee80000(0000) knlGS:0000000000000000=0Alo=
calhost kernel: CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033=0Alocal=
host kernel: CR2: 0000152938000010 CR3: 000000044d7a4000 CR4: 00000000003=
506e0=0Alocalhost kernel: Call Trace:=0Alocalhost kernel: _raw_spin_lock_=
irqsave+0x30/0x40=0Alocalhost kernel: remove_wait_queue+0x12/0x50=0Alocal=
host kernel: kfd_wait_on_events+0x1b6/0x490 [hydcu]=0Alocalhost kernel: ?=
 ftrace_graph_caller+0xa0/0xa0=0Alocalhost kernel: kfd_ioctl+0x38c/0x4a0 =
[hydcu]=0Alocalhost kernel: ? kfd_ioctl_set_trap_handler+0x70/0x70 [hydcu=
]=0Alocalhost kernel: ? kfd_ioctl_create_queue+0x5a0/0x5a0 [hydcu]=0Aloca=
lhost kernel: ? ftrace_graph_caller+0xa0/0xa0=0Alocalhost kernel: __x64_s=
ys_ioctl+0x8e/0xd0=0Alocalhost kernel: ? syscall_trace_enter.isra.18+0x14=
3/0x1b0=0Alocalhost kernel: do_syscall_64+0x33/0x80=0Alocalhost kernel: e=
ntry_SYSCALL_64_after_hwframe+0x44/0xa9=0Alocalhost kernel: RIP: 0033:0x1=
52a4dff68d7=0A=0ASigned-off-by: Qu Huang <qu.huang@linux.dev>=0A---=0A dr=
ivers/gpu/drm/amd/amdkfd/kfd_events.c | 1 +=0A 1 file changed, 1 insertio=
n(+)=0A=0Adiff --git a/drivers/gpu/drm/amd/amdkfd/kfd_events.c b/drivers/=
gpu/drm/amd/amdkfd/kfd_events.c=0Aindex 729d26d..e5faaad 100644=0A--- a/d=
rivers/gpu/drm/amd/amdkfd/kfd_events.c=0A+++ b/drivers/gpu/drm/amd/amdkfd=
/kfd_events.c=0A@@ -787,6 +787,7 @@ static struct kfd_event_waiter *alloc=
_event_waiters(uint32_t num_events)=0A 	for (i =3D 0; (event_waiters) && =
(i < num_events) ; i++) {=0A 		init_wait(&event_waiters[i].wait);=0A 		ev=
ent_waiters[i].activated =3D false;=0A+		event_waiters[i].event =3D NULL;=
=0A 	}=0A=0A 	return event_waiters;=0A--=0A1.8.3.1
