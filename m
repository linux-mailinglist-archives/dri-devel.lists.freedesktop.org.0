Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C1B981D0E6
	for <lists+dri-devel@lfdr.de>; Sat, 23 Dec 2023 02:07:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9CFD10E02D;
	Sat, 23 Dec 2023 01:07:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1132.google.com (mail-yw1-x1132.google.com
 [IPv6:2607:f8b0:4864:20::1132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0D0710E02D
 for <dri-devel@lists.freedesktop.org>; Sat, 23 Dec 2023 01:07:50 +0000 (UTC)
Received: by mail-yw1-x1132.google.com with SMTP id
 00721157ae682-5d7a47d06eeso23389947b3.1
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Dec 2023 17:07:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1703293670; x=1703898470;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0JAu7/kbP8sA38uZvHKjtFhpd9VbwIgxoHvIN0GjsTU=;
 b=hBfEOwP1U+nvcHQrWq/qnY2+eAienhDiHMUAkoa5mGIcIwyeNhIziafilasT9CDzrb
 1ujz9cb3xrZrmB+r//GLcZE2LgklmvEJUpp8jiFD32YXIMn7GvQJv9J/8qIQBID6Hqit
 oz2DRlnWbuJpIZwZFeSaqqoPiTxjM0g853sRs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703293670; x=1703898470;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0JAu7/kbP8sA38uZvHKjtFhpd9VbwIgxoHvIN0GjsTU=;
 b=Q+QsAa7n4ov4FiEKh3e8pnuLrynXEcyL8hi3uol3YMlOPAh+SkI0Yy0/1eViGNPUCM
 BJAD7hBHmYj2DDn7gBFm0QT6ZqgHJkrwKRHTLSUu2jqVGNkmQ//R+WuKwVg+pPATgv8F
 p4n9g10Eefa1kTp72I8wILJjunO0tWGV+ofT5ks+5IxhfLH/aqJ1jW2YIiHtliI3O9Wt
 UPSkMu30/HW58S+ZK8GYNfWNxIKotyfVlvT5BddFD9d5RfpO2caQl45NEog9Btnv9oXv
 vaIocReXeUinVrjlz5MVQ0gRVZWx1qxyO1g63C6JqTXMnvg3cytUiuYihRphfkuv7Ugl
 NkaQ==
X-Gm-Message-State: AOJu0Yxqq8C7hRywfpEZK2RCJiLSNWaNlFCGMb3ce/qF6wSJdSaL+sDx
 nSgY+Pj2plWZZ2c47AY2I84fUCzN7GLNeO95DHBLLOIifpy7
X-Google-Smtp-Source: AGHT+IEwlKZa714nLbvZrGxPAdcK81MlcBvHMQ/IsHzEpZlcvBa3td4Cesk1zXENAMIIvXwQ3J2tLZHBUhNq9kkubDw=
X-Received: by 2002:a25:aca2:0:b0:dbc:fbba:a2e0 with SMTP id
 x34-20020a25aca2000000b00dbcfbbaa2e0mr1545144ybi.104.1703293669741; Fri, 22
 Dec 2023 17:07:49 -0800 (PST)
MIME-Version: 1.0
References: <20230928041355.737635-1-zack@kde.org>
 <db8ba4d9d99c946b4649ba64abaf20fed16a0bc6.camel@siemens.com>
In-Reply-To: <db8ba4d9d99c946b4649ba64abaf20fed16a0bc6.camel@siemens.com>
From: Zack Rusin <zack.rusin@broadcom.com>
Date: Fri, 22 Dec 2023 20:07:39 -0500
Message-ID: <CABQX2QP60W6HqZxUjCkRfM=nD+YvoKqMBh-YkCEVjFCtf-cSdA@mail.gmail.com>
Subject: Re: [PATCH] drm/vmwgfx: Keep a gem reference to user bos in surfaces
To: "Sverdlin, Alexander" <alexander.sverdlin@siemens.com>
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "murray.mcallister@gmail.com" <murray.mcallister@gmail.com>,
 "krastevm@vmware.com" <krastevm@vmware.com>,
 "zackr@vmware.com" <zackr@vmware.com>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>,
 "iforbes@vmware.com" <iforbes@vmware.com>,
 "mombasawalam@vmware.com" <mombasawalam@vmware.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Dec 21, 2023 at 5:54=E2=80=AFAM Sverdlin, Alexander
<alexander.sverdlin@siemens.com> wrote:
>
> Hi Zack,
>
> thank you for the patch!
>
> On Thu, 2023-09-28 at 00:13 -0400, Zack Rusin wrote:
> > From: Zack Rusin <zackr@vmware.com>
> >
> > Surfaces can be backed (i.e. stored in) memory objects (mob's) which
> > are created and managed by the userspace as GEM buffers. Surfaces
> > grab only a ttm reference which means that the gem object can
> > be deleted underneath us, especially in cases where prime buffer
> > export is used.
> >
> > Make sure that all userspace surfaces which are backed by gem objects
> > hold a gem reference to make sure they're not deleted before vmw
> > surfaces are done with them, which fixes:
> > ------------[ cut here ]------------
> > refcount_t: underflow; use-after-free.
> > WARNING: CPU: 2 PID: 2632 at lib/refcount.c:28 refcount_warn_saturate+0=
xfb/0x150
> > Modules linked in: overlay vsock_loopback vmw_vsock_virtio_transport_co=
mmon vmw_vsock_vmci_transport vsock snd_ens1371 snd_ac97_codec ac97_bus snd=
_pcm gameport>
> > CPU: 2 PID: 2632 Comm: vmw_ref_count Not tainted 6.5.0-rc2-vmwgfx #1
> > Hardware name: VMware, Inc. VMware Virtual Platform/440BX Desktop Refer=
ence Platform, BIOS 6.00 11/12/2020
> > RIP: 0010:refcount_warn_saturate+0xfb/0x150
> > Code: eb 9e 0f b6 1d 8b 5b a6 01 80 fb 01 0f 87 ba e4 80 00 83 e3 01 75=
 89 48 c7 c7 c0 3c f9 a3 c6 05 6f 5b a6 01 01 e8 15 81 98 ff <0f> 0b e9 6f =
ff ff ff 0f b>
> > RSP: 0018:ffffbdc34344bba0 EFLAGS: 00010286
> > RAX: 0000000000000000 RBX: 0000000000000000 RCX: 0000000000000027
> > RDX: ffff960475ea1548 RSI: 0000000000000001 RDI: ffff960475ea1540
> > RBP: ffffbdc34344bba8 R08: 0000000000000003 R09: 65646e75203a745f
> > R10: ffffffffa5b32b20 R11: 72657466612d6573 R12: ffff96037d6a6400
> > R13: ffff9603484805b0 R14: 000000000000000b R15: ffff9603bed06060
> > FS:  00007f5fd8520c40(0000) GS:ffff960475e80000(0000) knlGS:00000000000=
00000
> > CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> > CR2: 00007f5fda755000 CR3: 000000010d012005 CR4: 00000000003706e0
> > Call Trace:
> >  <TASK>
> >  ? show_regs+0x6e/0x80
> >  ? refcount_warn_saturate+0xfb/0x150
> >  ? __warn+0x91/0x150
> >  ? refcount_warn_saturate+0xfb/0x150
> >  ? report_bug+0x19d/0x1b0
> >  ? handle_bug+0x46/0x80
> >  ? exc_invalid_op+0x1d/0x80
> >  ? asm_exc_invalid_op+0x1f/0x30
> >  ? refcount_warn_saturate+0xfb/0x150
> >  drm_gem_object_handle_put_unlocked+0xba/0x110 [drm]
> >  drm_gem_object_release_handle+0x6e/0x80 [drm]
> >  drm_gem_handle_delete+0x6a/0xc0 [drm]
> >  ? __pfx_vmw_bo_unref_ioctl+0x10/0x10 [vmwgfx]
> >  vmw_bo_unref_ioctl+0x33/0x40 [vmwgfx]
> >  drm_ioctl_kernel+0xbc/0x160 [drm]
> >  drm_ioctl+0x2d2/0x580 [drm]
> >  ? __pfx_vmw_bo_unref_ioctl+0x10/0x10 [vmwgfx]
> >  ? do_vmi_munmap+0xee/0x180
> >  vmw_generic_ioctl+0xbd/0x180 [vmwgfx]
> >  vmw_unlocked_ioctl+0x19/0x20 [vmwgfx]
> >  __x64_sys_ioctl+0x99/0xd0
> >  do_syscall_64+0x5d/0x90
> >  ? syscall_exit_to_user_mode+0x2a/0x50
> >  ? do_syscall_64+0x6d/0x90
> >  ? handle_mm_fault+0x16e/0x2f0
> >  ? exit_to_user_mode_prepare+0x34/0x170
> >  ? irqentry_exit_to_user_mode+0xd/0x20
> >  ? irqentry_exit+0x3f/0x50
> >  ? exc_page_fault+0x8e/0x190
> >  entry_SYSCALL_64_after_hwframe+0x6e/0xd8
> > RIP: 0033:0x7f5fda51aaff
> > Code: 00 48 89 44 24 18 31 c0 48 8d 44 24 60 c7 04 24 10 00 00 00 48 89=
 44 24 08 48 8d 44 24 20 48 89 44 24 10 b8 10 00 00 00 0f 05 <41> 89 c0 3d =
00 f0 ff ff 7>
> > RSP: 002b:00007ffd536a4d30 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
> > RAX: ffffffffffffffda RBX: 00007ffd536a4de0 RCX: 00007f5fda51aaff
> > RDX: 00007ffd536a4de0 RSI: 0000000040086442 RDI: 0000000000000003
> > RBP: 0000000040086442 R08: 000055fa603ada50 R09: 0000000000000000
> > R10: 0000000000000001 R11: 0000000000000246 R12: 00007ffd536a51b8
> > R13: 0000000000000003 R14: 000055fa5ebb4c80 R15: 00007f5fda90f040
> >  </TASK>
> > ---[ end trace 0000000000000000 ]---
> >
> > A lot of the analyis on the bug was done by Murray McAllister and
> > Ian Forbes.
> >
> > Reported-by: Murray McAllister <murray.mcallister@gmail.com>
> > Cc: Ian Forbes <iforbes@vmware.com>
> > Signed-off-by: Zack Rusin <zackr@vmware.com>
> > Fixes: a950b989ea29 ("drm/vmwgfx: Do not drop the reference to the hand=
le too soon")
> > Cc: <stable@vger.kernel.org> # v6.2+
>
> Do you remember the particular reason this was marked 6.2+?

That's because that's the kernel release where the commit this one is
fixing first landed.

> We see this on Debian 6.1.67 (which at least has the mentioned
> "drm/vmwgfx: Do not drop the reference to the handle too soon"):

The original had to be backported there. I'll ask someone on my team
to check the branches the original was backported to see if this
change even applies on those and then we'll see what we can do. In the
meantime if you know anyone on the Debian kernel team suggesting this
as a cherry-pick might also be a good idea.

z
