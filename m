Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CA0AD5638C5
	for <lists+dri-devel@lfdr.de>; Fri,  1 Jul 2022 19:56:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B566F18A2F0;
	Fri,  1 Jul 2022 17:55:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1080B18A2ED
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Jul 2022 17:55:57 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 35C30CE3499
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Jul 2022 17:55:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 73849C341C6
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Jul 2022 17:55:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1656698152;
 bh=myZ9dwkKeQO2uaqr3No/oHDh39Hheti+fHng453WYCw=;
 h=From:To:Subject:Date:From;
 b=lEuddt6xmDWc37L3SysrX2USMVTpJ48hUgLi9hblqMLjA2v61RkIMFN5vVOY8KUpo
 uXNmIFr3wzoHKhoN05qfW/SX9VAdQw22bi+JuH6xAKbD80XXWdUV5pmpGv8eAv0Bv5
 3L9xwXsfhfF0CGn03/vWZsWXLM67SqBkzQmiygxktCJGeT9sq9Z9xzWBAJtAjIb0TL
 xc7iySOV7UHORI5AXIZPVW/t/sR47/aMWzwc865WBfEaWhIGDmc01GZ3hzUathd+na
 uf5+M6iwMtjeFA1vxCerE9z8VAYY94VvDfqLT2qiebiW2C6AZ6XAtFvgost5wv6/AO
 mohbuUoajKjEw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 55749CC13AD; Fri,  1 Jul 2022 17:55:52 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 216198] New: uvd page faults on Radeon
Date: Fri, 01 Jul 2022 17:55:52 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: nutodafozo@freeweb.email
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression attachments.created
Message-ID: <bug-216198-2300@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

https://bugzilla.kernel.org/show_bug.cgi?id=3D216198

            Bug ID: 216198
           Summary: uvd page faults on Radeon
           Product: Drivers
           Version: 2.5
    Kernel Version: 5.15
          Hardware: AMD
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: nutodafozo@freeweb.email
        Regression: No

Created attachment 301322
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D301322&action=3Dedit
oops

After upgrading ubuntu from 20.04 (had stock kernels 5.4, 5.8 and 5.13) to
22.04 with 5.15, I've started to experience page faults when hw acceleratio=
n on
Radeon RX550 is working in Firefox.


2 times already in 5 days, same stacktraces / addresses of faulting instruc=
tion
and the same zero $rbx register.
I've had the same configuration for over a year, never had such oopses befo=
re
on previous kernels.


> [X77.269660] BUG: unable to handle page fault for address: ffffffffffffff=
f8
>=20
> ffffffff8111d4f0 <swake_up_locked>:
> ffffffff8111d4f0:       e8 fb 90 f6 ff          call   ffffffff810865f0
> <__fentry__>
> ffffffff8111d4f5:       48 8b 57 08             mov    0x8(%rdi),%rdx
> ffffffff8111d4f9:       48 8d 47 08             lea    0x8(%rdi),%rax
> ffffffff8111d4fd:       48 39 c2                cmp    %rax,%rdx
> ffffffff8111d500:       74 2d                   je     ffffffff8111d52f
> <swake_up_locked+0x3f>
> ffffffff8111d502:       55                      push   %rbp
> ffffffff8111d503:       48 89 e5                mov    %rsp,%rbp
> ffffffff8111d506:       53                      push   %rbx
> ffffffff8111d507:       48 8b 5f 08             mov    0x8(%rdi),%rbx
> ffffffff8111d50b:       48 8b 7b f8             mov    -0x8(%rbx),%rdi=20=
=20
> !<<<<<<<<<
> ffffffff8111d50f:       e8 4c d6 fd ff          call   ffffffff810fab60
> <wake_up_process>
>=20
> void swake_up_locked(struct swait_queue_head *q)
> {
>       struct swait_queue *curr;
>       if (list_empty(&q->task_list))
>               return;
>       curr =3D list_first_entry(&q->task_list, typeof(*curr), task_list);
>       wake_up_process(curr->task);
>       list_del_init(&curr->task_list);
> }

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
