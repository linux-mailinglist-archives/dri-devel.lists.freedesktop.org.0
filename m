Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3A5628C915
	for <lists+dri-devel@lfdr.de>; Tue, 13 Oct 2020 09:17:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BD766E899;
	Tue, 13 Oct 2020 07:16:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 487 seconds by postgrey-1.36 at gabe;
 Tue, 13 Oct 2020 06:07:25 UTC
Received: from cmta17.telus.net (cmta17.telus.net [209.171.16.90])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2D276E872
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Oct 2020 06:07:25 +0000 (UTC)
Received: from montezuma.home ([154.5.226.127]) by cmsmtp with SMTP
 id SDL8krq8gwmo8SDL9k9ALM; Mon, 12 Oct 2020 23:59:16 -0600
X-Telus-Authed: none
X-Authority-Analysis: v=2.4 cv=BKt2EHcG c=1 sm=1 tr=0 ts=5f854234
 a=f8b3WT/FcTuUJCJtQO1udw==:117 a=f8b3WT/FcTuUJCJtQO1udw==:17
 a=kj9zAlcOel0A:10 a=20KFwNOVAAAA:8 a=sdRlC8HA8of5HKNwkIoA:9 a=CjuIK1q_8ugA:10
 a=pHzHmUro8NiASowvMSCR:22 a=nt3jZW36AmriUCFCBwmW:22
Date: Mon, 12 Oct 2020 22:59:14 -0700 (PDT)
From: zwane@yosper.io
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2] drm/dp check aux_dev before use in
 drm_dp_aux_dev_get_by_minor()
Message-ID: <alpine.DEB.2.21.2010122231070.38717@montezuma.home>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfGnQYcVIUZMhUGCcXtQyGciJO9UxepkCuKCoeAG//rdo1wejFqqS0rmKdphi5fFA/PAR1bKv/YQtrhgDf/dnCEqgjZjUX47mSZytW5UBbBSSXzFglwQ3
 W8irj/gWZ9+UyiwdTB9/jjwlZeBGPQbUEV0pQ6OpdG5pbZr9j5H5ePTI4oZosgh7LJZPfHUSMvUpmC2GkJVdQ5jcvTVOgNFWiNuBcPRpa677q+XDTGP92uPx
 I33KMUW0z1DS0XoEPKS81Q==
X-Mailman-Approved-At: Tue, 13 Oct 2020 07:16:53 +0000
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
Cc: airlied@redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

I observed this when unplugging a DP monitor whilst a computer is asleep 
and then waking it up. This left DP chardev nodes still being present on 
the filesystem and accessing these device nodes caused an oops because 
drm_dp_aux_dev_get_by_minor() assumes a device exists if it is opened. 
This can also be reproduced by creating a device node with mknod(1) and 
issuing an open(2)

[166164.933198] BUG: kernel NULL pointer dereference, address: 0000000000000018
[166164.933202] #PF: supervisor read access in kernel mode
[166164.933204] #PF: error_code(0x0000) - not-present page
[166164.933205] PGD 0 P4D 0 
[166164.933208] Oops: 0000 [#1] PREEMPT SMP NOPTI
[166164.933211] CPU: 4 PID: 99071 Comm: fwupd Tainted: G        W         
5.8.0-rc6+ #1
[166164.933213] Hardware name: LENOVO 20RD002VUS/20RD002VUS, BIOS R16ET25W 
(1.11 ) 04/21/2020
[166164.933232] RIP: 0010:drm_dp_aux_dev_get_by_minor+0x29/0x70 
[drm_kms_helper]
[166164.933234] Code: 00 0f 1f 44 00 00 55 48 89 e5 41 54 41 89 fc 48 c7 
c7 60 01 a4 c0 e8 26 ab 30 d7 44 89 e6 48 c7 c7 80 01 a4 c0 e8 47 94 d6 d6 
<8b> 50 18 49 89 c4 48 8d 78 18 85 d2 74 33 8d 4a 01 89 d0 f0 0f b1
[166164.933236] RSP: 0018:ffffb7d7c41cbbf0 EFLAGS: 00010246
[166164.933237] RAX: 0000000000000000 RBX: ffff8a90001fe900 RCX: 0000000000000000
[166164.933238] RDX: 0000000000000000 RSI: 0000000000000003 RDI: ffffffffc0a40180
[166164.933239] RBP: ffffb7d7c41cbbf8 R08: 0000000000000000 R09: ffff8a93e157d6d0
[166164.933240] R10: 0000000000000000 R11: ffffffffc0a40188 R12: 0000000000000003
[166164.933241] R13: ffff8a9402200e80 R14: ffff8a90001fe900 R15: 0000000000000000
[166164.933244] FS:  00007f7fb041eb00(0000) GS:ffff8a9411500000(0000) 
knlGS:0000000000000000
[166164.933245] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[166164.933246] CR2: 0000000000000018 CR3: 00000000352c2003 CR4: 00000000003606e0
[166164.933247] Call Trace:
[166164.933264]  auxdev_open+0x1b/0x40 [drm_kms_helper]
[166164.933278]  chrdev_open+0xa7/0x1c0
[166164.933282]  ? cdev_put.part.0+0x20/0x20
[166164.933287]  do_dentry_open+0x161/0x3c0
[166164.933291]  vfs_open+0x2d/0x30
[166164.933297]  path_openat+0xb27/0x10e0
[166164.933306]  ? atime_needs_update+0x73/0xd0
[166164.933309]  do_filp_open+0x91/0x100
[166164.933313]  ? __alloc_fd+0xb2/0x150
[166164.933316]  do_sys_openat2+0x210/0x2d0
[166164.933318]  do_sys_open+0x46/0x80
[166164.933320]  __x64_sys_openat+0x20/0x30
[166164.933328]  do_syscall_64+0x52/0xc0
[166164.933336]  entry_SYSCALL_64_after_hwframe+0x44/0xa9


(gdb) disassemble drm_dp_aux_dev_get_by_minor+0x29
Dump of assembler code for function drm_dp_aux_dev_get_by_minor:
   0x0000000000017b10 <+0>:     callq  0x17b15 <drm_dp_aux_dev_get_by_minor+5>
   0x0000000000017b15 <+5>:     push   %rbp
   0x0000000000017b16 <+6>:     mov    %rsp,%rbp
   0x0000000000017b19 <+9>:     push   %r12
   0x0000000000017b1b <+11>:    mov    %edi,%r12d
   0x0000000000017b1e <+14>:    mov    $0x0,%rdi
   0x0000000000017b25 <+21>:    callq  0x17b2a <drm_dp_aux_dev_get_by_minor+26>
   0x0000000000017b2a <+26>:    mov    %r12d,%esi
   0x0000000000017b2d <+29>:    mov    $0x0,%rdi
   0x0000000000017b34 <+36>:    callq  0x17b39 <drm_dp_aux_dev_get_by_minor+41>
   0x0000000000017b39 <+41>:    mov    0x18(%rax),%edx <=========
   0x0000000000017b3c <+44>:    mov    %rax,%r12
   0x0000000000017b3f <+47>:    lea    0x18(%rax),%rdi
   0x0000000000017b43 <+51>:    test   %edx,%edx
   0x0000000000017b45 <+53>:    je     0x17b7a <drm_dp_aux_dev_get_by_minor+106>
   0x0000000000017b47 <+55>:    lea    0x1(%rdx),%ecx
   0x0000000000017b4a <+58>:    mov    %edx,%eax
   0x0000000000017b4c <+60>:    lock cmpxchg %ecx,(%rdi)
   0x0000000000017b50 <+64>:    jne    0x17b76 <drm_dp_aux_dev_get_by_minor+102>
   0x0000000000017b52 <+66>:    test   %edx,%edx
   0x0000000000017b54 <+68>:    js     0x17b6d <drm_dp_aux_dev_get_by_minor+93>
   0x0000000000017b56 <+70>:    test   %ecx,%ecx
   0x0000000000017b58 <+72>:    js     0x17b6d <drm_dp_aux_dev_get_by_minor+93>
   0x0000000000017b5a <+74>:    mov    $0x0,%rdi
   0x0000000000017b61 <+81>:    callq  0x17b66 <drm_dp_aux_dev_get_by_minor+86>
   0x0000000000017b66 <+86>:    mov    %r12,%rax
   0x0000000000017b69 <+89>:    pop    %r12
   0x0000000000017b6b <+91>:    pop    %rbp
   0x0000000000017b6c <+92>:    retq   
   0x0000000000017b6d <+93>:    xor    %esi,%esi
   0x0000000000017b6f <+95>:    callq  0x17b74 <drm_dp_aux_dev_get_by_minor+100>
   0x0000000000017b74 <+100>:   jmp    0x17b5a <drm_dp_aux_dev_get_by_minor+74>
   0x0000000000017b76 <+102>:   mov    %eax,%edx
   0x0000000000017b78 <+104>:   jmp    0x17b43 <drm_dp_aux_dev_get_by_minor+51>
   0x0000000000017b7a <+106>:   xor    %r12d,%r12d
   0x0000000000017b7d <+109>:   jmp    0x17b5a <drm_dp_aux_dev_get_by_minor+74>
End of assembler dump.

(gdb) list *drm_dp_aux_dev_get_by_minor+0x29
0x17b39 is in drm_dp_aux_dev_get_by_minor (drivers/gpu/drm/drm_dp_aux_dev.c:65).
60      static struct drm_dp_aux_dev *drm_dp_aux_dev_get_by_minor(unsigned index)
61      {
62              struct drm_dp_aux_dev *aux_dev = NULL;
63
64              mutex_lock(&aux_idr_mutex);
65              aux_dev = idr_find(&aux_idr, index);
66              if (!kref_get_unless_zero(&aux_dev->refcount))
67                      aux_dev = NULL;
68              mutex_unlock(&aux_idr_mutex);
69
(gdb) p/x &((struct drm_dp_aux_dev *)(0x0))->refcount
$8 = 0x18

Looking at the caller, checks on the minor are pushed down to 
drm_dp_aux_dev_get_by_minor()

static int auxdev_open(struct inode *inode, struct file *file)
{
    unsigned int minor = iminor(inode);
    struct drm_dp_aux_dev *aux_dev;

    aux_dev = drm_dp_aux_dev_get_by_minor(minor); <====
    if (!aux_dev)
        return -ENODEV;

    file->private_data = aux_dev;
    return 0;
}


Fixes: e94cb37b34eb8 ("Add a drm_aux-dev module for reading/writing dpcd registers")
Cc: Lyude Paul <lyude@redhat.com>
Signed-off-by: Zwane Mwaikambo <zwane@yosper.io>
---
v2 patch re-generated from drm-next branch 0d2e90f47c4f80a5dcf10f5fe57b5e692e62b48f

diff --git a/drivers/gpu/drm/drm_dp_aux_dev.c b/drivers/gpu/drm/drm_dp_aux_dev.c
index 2510717d5a08..e25181bf2c48 100644
--- a/drivers/gpu/drm/drm_dp_aux_dev.c
+++ b/drivers/gpu/drm/drm_dp_aux_dev.c
@@ -63,7 +63,7 @@ static struct drm_dp_aux_dev *drm_dp_aux_dev_get_by_minor(unsigned index)
 
 	mutex_lock(&aux_idr_mutex);
 	aux_dev = idr_find(&aux_idr, index);
-	if (!kref_get_unless_zero(&aux_dev->refcount))
+	if (aux_dev && !kref_get_unless_zero(&aux_dev->refcount))
 		aux_dev = NULL;
 	mutex_unlock(&aux_idr_mutex);
 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
