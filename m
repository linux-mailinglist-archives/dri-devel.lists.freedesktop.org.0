Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 38B7424ADA7
	for <lists+dri-devel@lfdr.de>; Thu, 20 Aug 2020 06:21:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 455C96E899;
	Thu, 20 Aug 2020 04:21:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7A0A6E899
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Aug 2020 04:21:09 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: dri-devel@lists.freedesktop.org
Subject: [Bug 206987] [drm] [amdgpu] Whole system crashes when the driver is
 in mode_support_and_system_configuration
Date: Thu, 20 Aug 2020 04:21:09 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: krakopo@protonmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: DUPLICATE
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-206987-2300-uuUXjU7FET@https.bugzilla.kernel.org/>
In-Reply-To: <bug-206987-2300@https.bugzilla.kernel.org/>
References: <bug-206987-2300@https.bugzilla.kernel.org/>
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

https://bugzilla.kernel.org/show_bug.cgi?id=206987

--- Comment #37 from krakopo@protonmail.com ---
I do see ldmxcsr in the disassembly:

ffffffff81038870 <kernel_fpu_begin>:
ffffffff81038870:       e8 9b 07 03 00          callq  ffffffff81069010
<__fentry__>
ffffffff81038875:       48 83 ec 10             sub    $0x10,%rsp
ffffffff81038879:       bf 01 00 00 00          mov    $0x1,%edi
ffffffff8103887e:       65 48 8b 04 25 28 00    mov    %gs:0x28,%rax
ffffffff81038885:       00 00 
ffffffff81038887:       48 89 44 24 08          mov    %rax,0x8(%rsp)
ffffffff8103888c:       31 c0                   xor    %eax,%eax
ffffffff8103888e:       c7 44 24 04 00 00 00    movl   $0x0,0x4(%rsp)
ffffffff81038895:       00 
ffffffff81038896:       e8 35 ae 08 00          callq  ffffffff810c36d0
<preempt_count_add>
ffffffff8103889b:       e8 80 fd ff ff          callq  ffffffff81038620
<irq_fpu_usable>
ffffffff810388a0:       65 8a 05 b1 f2 fd 7e    mov    %gs:0x7efdf2b1(%rip),%al
       # 17b58 <in_kernel_fpu>
ffffffff810388a7:       65 c6 05 a9 f2 fd 7e    movb  
$0x1,%gs:0x7efdf2a9(%rip)        # 17b58 <in_kernel_fpu>
ffffffff810388ae:       01 
ffffffff810388af:       65 48 8b 3c 25 c0 7b    mov    %gs:0x17bc0,%rdi
ffffffff810388b6:       01 00 
ffffffff810388b8:       f6 47 26 20             testb  $0x20,0x26(%rdi)
ffffffff810388bc:       74 3c                   je     ffffffff810388fa
<kernel_fpu_begin+0x8a>
ffffffff810388be:       48 c7 c7 57 43 40 82    mov    $0xffffffff82404357,%rdi
ffffffff810388c5:       e8 46 41 9c 00          callq  ffffffff819fca10
<__this_cpu_preempt_check>
ffffffff810388ca:       c7 44 24 04 80 1f 00    movl   $0x1f80,0x4(%rsp)
ffffffff810388d1:       00 
ffffffff810388d2:       65 48 c7 05 82 f2 fd    movq  
$0x0,%gs:0x7efdf282(%rip)        # 17b60 <fpu_fpregs_owner_ctx>
ffffffff810388d9:       7e 00 00 00 00 
ffffffff810388de:       0f ae 54 24 04          ldmxcsr 0x4(%rsp)
ffffffff810388e3:       db e3                   fninit 
ffffffff810388e5:       48 8b 44 24 08          mov    0x8(%rsp),%rax
ffffffff810388ea:       65 48 2b 04 25 28 00    sub    %gs:0x28,%rax
ffffffff810388f1:       00 00 
ffffffff810388f3:       75 20                   jne    ffffffff81038915
<kernel_fpu_begin+0xa5>
ffffffff810388f5:       48 83 c4 10             add    $0x10,%rsp
ffffffff810388f9:       c3                      retq   
ffffffff810388fa:       48 8b 07                mov    (%rdi),%rax
ffffffff810388fd:       f6 c4 40                test   $0x40,%ah
ffffffff81038900:       75 bc                   jne    ffffffff810388be
<kernel_fpu_begin+0x4e>
ffffffff81038902:       f0 80 4f 01 40          lock orb $0x40,0x1(%rdi)
ffffffff81038907:       48 81 c7 00 1b 00 00    add    $0x1b00,%rdi
ffffffff8103890e:       e8 5d fd ff ff          callq  ffffffff81038670
<copy_fpregs_to_fpstate>
ffffffff81038913:       eb a9                   jmp    ffffffff810388be
<kernel_fpu_begin+0x4e>
ffffffff81038915:       e8 36 3c 9c 00          callq  ffffffff819fc550
<__stack_chk_fail>
ffffffff8103891a:       66 0f 1f 44 00 00       nopw   0x0(%rax,%rax,1)


And yes I do have the "sse" flag in /proc/cpuinfo.

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
