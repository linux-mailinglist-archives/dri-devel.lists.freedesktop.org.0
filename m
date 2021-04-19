Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9188C363FDE
	for <lists+dri-devel@lfdr.de>; Mon, 19 Apr 2021 12:48:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E839489E9B;
	Mon, 19 Apr 2021 10:48:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com
 [IPv6:2607:f8b0:4864:20::1033])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D619189E9B;
 Mon, 19 Apr 2021 10:48:24 +0000 (UTC)
Received: by mail-pj1-x1033.google.com with SMTP id
 u14-20020a17090a1f0eb029014e38011b09so13448067pja.5; 
 Mon, 19 Apr 2021 03:48:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=gBK5ezSmXBGy28j4ajL3ZEsWmSj3q9YRztP3DHnHozQ=;
 b=ocJ882+vjbgUoWU5JdLRekQW6gFPqUOa7SmYbN5FOqZlMvJhf0Ii1dH0QwTNg0n48g
 2rL6uRwfHT/gp7t4BKUx57jwrkeSGa1Wa7ZE12cd4Kkl3ZKWOfSFsGfI+J/77/CvaHBI
 RiJHlsDR7rSODhsDgk2VimIyC1Ep0pwAXB6we53HScKv7LhqCTl2tz6bIW2XYOx4/6Xn
 3yGxmHuuUF0mh3btGczY1U4isjpV80PC7q6V2urlGLh3Vi4/MWS9tVzc3Ak05eF1FIk+
 cuSMLFqeE7eJhCYKBYky8M04/WiJ9x+ANnZKrOF/H3fPZ11mkiC9PKZhiyjTaLdo1BQw
 qhCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=gBK5ezSmXBGy28j4ajL3ZEsWmSj3q9YRztP3DHnHozQ=;
 b=dsSH+oiFQhsgDRS4u2rTFirRNljqrlzCDrCRNKobvoh4GapJ+bTRCY9Y6sqtOOu26o
 CvkNqbKd6/szexFuoo4Q5BH/jAUIruiZOtKAer3XBrlYy5vA0FJ54FvTueg9mqwvIiBv
 vzSX+uDtuZGzAUXl8l/bEXfdIJt6bQmpp9dOhKcfFI6auztr6/poiBFYEz1VuFFt+cuN
 W+boEgK0fB7OL9tQoioRuCqRbf+mOUbHFumYNq0ddF2+WC28JMj5yktBcEzgOdBPs1/Q
 Kc8HrvlyxZy8xRCwq1l4s7Q1yM6u+L0fgqPu4FRYlMNFWNqQhNDcUhA3khYhar9UHay9
 wDlg==
X-Gm-Message-State: AOAM5338c6Ym80gwLfPKCXfPAbKM3VAJoeKTjXM4NfGF4MxPkr54uypH
 f+5k7YvHUwlDCioOgPO7+xotIMm7sIxeQhhvzrcYn31mkv8i1w==
X-Google-Smtp-Source: ABdhPJyYs6NKrQKPRFPAAdOviI7AU2PE7eWKXk96tqP4jkYe1iKEAD5fKj6Io8v9VteZH8Yxrcaso4AM3Tvnragoxb0=
X-Received: by 2002:a17:902:c209:b029:ec:7add:e183 with SMTP id
 9-20020a170902c209b02900ec7adde183mr17005245pll.74.1618829304111; Mon, 19 Apr
 2021 03:48:24 -0700 (PDT)
MIME-Version: 1.0
From: =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <maraeo@gmail.com>
Date: Mon, 19 Apr 2021 06:47:48 -0400
Message-ID: <CAAxE2A4mpapnCE7uw8GNWkaRR4jXeoz9qa9j=9XknjR3yeq3YQ@mail.gmail.com>
Subject: [RFC] Linux Graphics Next: Explicit fences everywhere and no BO
 fences - initial proposal
To: ML Mesa-dev <mesa-dev@lists.freedesktop.org>, 
 dri-devel <dri-devel@lists.freedesktop.org>
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
Content-Type: multipart/mixed; boundary="===============1727302083=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1727302083==
Content-Type: multipart/alternative; boundary="0000000000009fa78505c0511119"

--0000000000009fa78505c0511119
Content-Type: text/plain; charset="UTF-8"

Hi,

This is our initial proposal for explicit fences everywhere and new memory
management that doesn't use BO fences. It's a redesign of how Linux
graphics drivers work, and it can coexist with what we have now.


*1. Introduction*
(skip this if you are already sold on explicit fences)

The current Linux graphics architecture was initially designed for GPUs
with only one graphics queue where everything was executed in the
submission order and per-BO fences were used for memory management and
CPU-GPU synchronization, not GPU-GPU synchronization. Later, multiple
queues were added on top, which required the introduction of implicit
GPU-GPU synchronization between queues of different processes using per-BO
fences. Recently, even parallel execution within one queue was enabled
where a command buffer starts draws and compute shaders, but doesn't wait
for them, enabling parallelism between back-to-back command buffers.
Modesetting also uses per-BO fences for scheduling flips. Our GPU scheduler
was created to enable all those use cases, and it's the only reason why the
scheduler exists.

The GPU scheduler, implicit synchronization, BO-fence-based memory
management, and the tracking of per-BO fences increase CPU overhead and
latency, and reduce parallelism. There is a desire to replace all of them
with something much simpler. Below is how we could do it.


*2. Explicit synchronization for window systems and modesetting*

The producer is an application and the consumer is a compositor or a
modesetting driver.

*2.1. The Present request*

As part of the Present request, the producer will pass 2 fences (sync
objects) to the consumer alongside the presented DMABUF BO:
- The submit fence: Initially unsignalled, it will be signalled when the
producer has finished drawing into the presented buffer.
- The return fence: Initially unsignalled, it will be signalled when the
consumer has finished using the presented buffer.

Deadlock mitigation to recover from segfaults:
- The kernel knows which process is obliged to signal which fence. This
information is part of the Present request and supplied by userspace.
- If the producer crashes, the kernel signals the submit fence, so that the
consumer can make forward progress.
- If the consumer crashes, the kernel signals the return fence, so that the
producer can reclaim the buffer.
- A GPU hang signals all fences. Other deadlocks will be handled like GPU
hangs.

Other window system requests can follow the same idea.

Merged fences where one fence object contains multiple fences will be
supported. A merged fence is signalled only when its fences are signalled.
The consumer will have the option to redefine the unsignalled return fence
to a merged fence.

*2.2. Modesetting*

Since a modesetting driver can also be the consumer, the present ioctl will
contain a submit fence and a return fence too. One small problem with this
is that userspace can hang the modesetting driver, but in theory, any later
present ioctl can override the previous one, so the unsignalled
presentation is never used.


*3. New memory management*

The per-BO fences will be removed and the kernel will not know which
buffers are busy. This will reduce CPU overhead and latency. The kernel
will not need per-BO fences with explicit synchronization, so we just need
to remove their last user: buffer evictions. It also resolves the current
OOM deadlock.

*3.1. Evictions*

If the kernel wants to move a buffer, it will have to wait for everything
to go idle, halt all userspace command submissions, move the buffer, and
resume everything. This is not expected to happen when memory is not
exhausted. Other more efficient ways of synchronization are also possible
(e.g. sync only one process), but are not discussed here.

*3.2. Per-process VRAM usage quota*

Each process can optionally and periodically query its VRAM usage quota and
change domains of its buffers to obey that quota. For example, a process
allocated 2 GB of buffers in VRAM, but the kernel decreased the quota to 1
GB. The process can change the domains of the least important buffers to
GTT to get the best outcome for itself. If the process doesn't do it, the
kernel will choose which buffers to evict at random. (thanks to Christian
Koenig for this idea)

*3.3. Buffer destruction without per-BO fences*

When the buffer destroy ioctl is called, an optional fence list can be
passed to the kernel to indicate when it's safe to deallocate the buffer.
If the fence list is empty, the buffer will be deallocated immediately.
Shared buffers will be handled by merging fence lists from all processes
that destroy them. Mitigation of malicious behavior:
- If userspace destroys a busy buffer, it will get a GPU page fault.
- If userspace sends fences that never signal, the kernel will have a
timeout period and then will proceed to deallocate the buffer anyway.

*3.4. Other notes on MM*

Overcommitment of GPU-accessible memory will cause an allocation failure or
invoke the OOM killer. Evictions to GPU-inaccessible memory might not be
supported.

Kernel drivers could move to this new memory management today. Only buffer
residency and evictions would stop using per-BO fences.



*4. Deprecating implicit synchronization*

It can be phased out by introducing a new generation of hardware where the
driver doesn't add support for it (like a driver fork would do), assuming
userspace has all the changes for explicit synchronization. This could
potentially create an isolated part of the kernel DRM where all drivers
only support explicit synchronization.

Marek

--0000000000009fa78505c0511119
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi,</div><div><br></div><div>This is our initial prop=
osal for explicit fences everywhere and new memory management that doesn&#3=
9;t use BO fences. It&#39;s a redesign of how Linux graphics drivers work, =
and it can coexist with what we have now.<br></div><div><br></div><div><br>=
</div><div><b>1. Introduction</b><br></div><div>(skip this if you are alrea=
dy sold on explicit fences)</div><div><br></div><div></div><div>The current=
 Linux graphics architecture was initially designed for GPUs with only one =
graphics queue where everything was executed in the submission order and pe=
r-BO fences were used for memory management and CPU-GPU synchronization, no=
t GPU-GPU synchronization. Later, multiple queues were added on top, which =
required the introduction of implicit GPU-GPU synchronization between queue=
s of different processes using per-BO fences. Recently, even parallel execu=
tion within one queue was enabled where a command buffer starts draws and c=
ompute shaders, but doesn&#39;t wait for them, enabling parallelism between=
 back-to-back command buffers. Modesetting also uses per-BO fences for sche=
duling flips. Our GPU scheduler was created to enable all those use cases, =
and it&#39;s the only reason why the scheduler exists.<br></div><div><br></=
div><div>The GPU scheduler, implicit synchronization, BO-fence-based memory=
 management, and the tracking of per-BO fences increase CPU overhead and la=
tency, and reduce parallelism. There is a desire to replace all of them wit=
h something much simpler. Below is how we could do it.<br></div><div><br></=
div><div><br></div><div><b>2. Explicit synchronization for window systems a=
nd modesetting</b><br></div><div><br></div><div>The producer is an applicat=
ion and the consumer is a compositor or a modesetting driver.<br></div><div=
><br></div><div><b>2.1. The Present request</b><br></div><div><br></div><di=
v>As part of the Present request, the producer will pass 2 fences (sync obj=
ects) to the consumer alongside the presented DMABUF BO:</div><div>- The su=
bmit fence: Initially unsignalled, it will be signalled when the producer h=
as finished drawing into the presented buffer.<br></div><div>- The return f=
ence: Initially unsignalled, it will be signalled when the consumer has fin=
ished using the presented buffer.</div><div><br></div><div>Deadlock mitigat=
ion to recover from segfaults:</div><div>- The kernel knows which process i=
s obliged to signal which fence. This information is part of the Present re=
quest and supplied by userspace.<br></div><div>- If the producer crashes, t=
he kernel signals the submit fence, so that the consumer can make forward p=
rogress.</div><div>- If the consumer crashes, the kernel signals the return=
 fence, so that the producer can reclaim the buffer.</div><div>- A GPU hang=
 signals all fences. Other deadlocks will be handled like GPU hangs.<br></d=
iv><div><br></div><div>Other window system requests can follow the same ide=
a.<br></div><div><br></div><div><div>Merged fences where one fence object c=
ontains multiple fences will be supported. A merged fence is signalled only=
 when its fences are signalled. The consumer will have the option to redefi=
ne the unsignalled return fence to a merged fence.<br></div></div><div><b><=
br></b></div><div><b>2.2. Modesetting</b><br></div><div><br></div><div>Sinc=
e a modesetting driver can also be the consumer, the present ioctl will con=
tain a submit fence and a return fence too.  One small problem with this is=
 that userspace can hang the modesetting=20
driver, but in theory, any later present ioctl can override the previous on=
e, so the unsignalled presentation is never used.<br></div><div></div><div>=
<br></div><div><br></div><div><b>3. New memory management</b></div><div><br=
></div><div>The per-BO fences will be removed and the kernel will not know =
which buffers are busy. This will reduce CPU overhead and latency. The kern=
el will not need per-BO fences with explicit synchronization, so we just ne=
ed to remove their last user: buffer evictions. It also resolves the curren=
t OOM deadlock.<br></div><div><br></div><div><b>3.1. Evictions</b><br></div=
><div><br></div><div>If the kernel wants to move a buffer, it will have to =
wait for everything to go idle, halt all userspace command submissions, mov=
e the buffer, and resume everything. This is not expected to happen when me=
mory is not exhausted. Other more efficient ways of synchronization are als=
o possible (e.g. sync only one process), but are not discussed here.<br></d=
iv><div><br></div><div><b>3.2. Per-process VRAM usage quota</b><br></div><d=
iv><br></div><div>Each process can optionally and periodically query its VR=
AM usage quota and change domains of its buffers to obey that quota. For ex=
ample, a process allocated 2 GB of buffers in VRAM, but the kernel decrease=
d the quota to 1 GB. The process can change the domains of the least import=
ant buffers to GTT to get the best outcome for itself. If the process doesn=
&#39;t do it, the kernel will choose which buffers to evict at random. (tha=
nks to Christian Koenig for this idea)<br></div><div><br></div><div><b>3.3.=
 Buffer destruction without per-BO fences</b><br></div><div><br></div><div>=
When the buffer destroy ioctl is called, an optional fence list can be pass=
ed to the kernel to indicate when it&#39;s safe to deallocate the buffer. I=
f the fence list is empty, the buffer will be deallocated immediately. Shar=
ed buffers will be handled by merging fence lists from all processes that d=
estroy them. Mitigation of malicious behavior:</div><div>- If userspace des=
troys a busy buffer, it will get a GPU page fault.</div><div>- If userspace=
 sends fences that never signal, the kernel will have a timeout period and =
then will proceed to deallocate the buffer anyway.</div><div><br></div><div=
><b>3.4. Other notes on MM</b><br></div><div><br></div><div><div>Overcommit=
ment of GPU-accessible memory will cause an allocation failure or invoke th=
e OOM killer. Evictions to GPU-inaccessible memory might not be supported.<=
br></div></div><div><br></div><div><div>Kernel drivers could move to this n=
ew memory management today. Only buffer residency and evictions would stop =
using per-BO fences.<br><b></b></div></div><div><br></div><div><br></div><d=
iv><b>4. Deprecating implicit synchronization<br></b></div><div></div><div>=
<div><br></div><div>It can be phased out by introducing a new generation of=
 hardware where the driver doesn&#39;t add support for it (like a driver fo=
rk would do), assuming userspace has all the changes for explicit synchroni=
zation. This could potentially create an isolated part of the kernel DRM wh=
ere all drivers only support explicit synchronization.<br></div></div><div>=
</div><div><br></div><div></div><div></div><div></div><div>Marek<br></div><=
/div>

--0000000000009fa78505c0511119--

--===============1727302083==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1727302083==--
