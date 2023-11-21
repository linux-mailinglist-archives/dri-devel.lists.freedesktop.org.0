Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BC647F340D
	for <lists+dri-devel@lfdr.de>; Tue, 21 Nov 2023 17:41:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1371C10E517;
	Tue, 21 Nov 2023 16:41:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14D8710E517
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Nov 2023 16:41:39 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id DDA8BB822A0
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Nov 2023 16:41:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3DF6AC433C9
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Nov 2023 16:41:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1700584896;
 bh=6XbtZ8ilAAIlx/obZegSpsDQ/+nZxaWDDRYaAg42+t0=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=qc/tyvG9+b/IRSEERUkmmQp8MDulMxbLUZi9123byhcK1w+lEy2TyQ+0ymkx/XXy7
 PC5MXlYJRGq738f5WuWOEfHXiteN1gCNw1LfglQWp2RmUa9abNjM2zsVAOVt6yB/i1
 PWXpysQe72sTImMF259SmjETDkvJfq33OEaN9V5t4YnvdzMtdyI2OdKOnIW2mCjJ5W
 T+5haqRAgmnJG1tMxrNAbOTEIvchAIORd5FDnsIX7yJsUyulVUnPGKfwGZrNFzkdVn
 QS7sXcBFf81lsEnilbMTi1c2WLanrN5KEL1b0NQlr6aCIKtDz/wrbGRxm9CGvqa9O6
 upKkC9iE3Kw5Q==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 292F7C53BD4; Tue, 21 Nov 2023 16:41:36 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 218168] amdgpu: kfd_topology.c warning: the frame size of 1408
 bytes is larger than 1024 bytes
Date: Tue, 21 Nov 2023 16:41:35 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: felix.kuehling@amd.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: ANSWERED
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218168-2300-JqmZfiejHf@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218168-2300@https.bugzilla.kernel.org/>
References: <bug-218168-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218168

--- Comment #5 from Felix Kuehling (felix.kuehling@amd.com) ---
There are two patches that didn't make it into Linux 6.6 that reduce the=20
stack size in kfd_topology_add_device. Can you check if those fix the=20
problem?

commit aa5a9b2ccda2fa834fddb4bd30a2ab831598f551
Author: Alex Deucher <alexander.deucher@amd.com>
Date:   Tue Sep 26 12:00:23 2023 -0400

     drm/amdkfd: drop struct kfd_cu_info

     I think this was an abstraction back from when
     kfd supported both radeon and amdgpu.  Since we just
     support amdgpu now, there is no more need for this and
     we can use the amdgpu structures directly.

     This also avoids having the kfd_cu_info structures on
     the stack when inlining which can blow up the stack.

     Cc: Arnd Bergmann <arnd@kernel.org>
     Acked-by: Arnd Bergmann <arnd@arndb.de>
     Reviewed-by: Felix Kuehling <Felix.Kuehling@amd.com>
     Acked-by: Christian K=C3=B6nig <christian.koenig@amd.com>
     Signed-off-by: Alex Deucher <alexander.deucher@amd.com>

commit 1f3b515578a1d73926993629a06a7f3b60535b59
Author: Alex Deucher <alexander.deucher@amd.com>
Date:   Thu Sep 21 10:32:09 2023 -0400

     drm/amdkfd: reduce stack size in kfd_topology_add_device()

     kfd_topology.c:2082:1: warning: the frame size of 1440 bytes is larger
than 1024 bytes

     Link: https://gitlab.freedesktop.org/drm/amd/-/issues/2866
     Cc: Arnd Bergmann <arnd@kernel.org>
     Acked-by: Arnd Bergmann <arnd@arndb.de>
     Acked-by: Christian K=C3=B6nig <christian.koenig@amd.com>
     Reviewed-by: Felix Kuehling <Felix.Kuehling@amd.com>
     Signed-off-by: Alex Deucher <alexander.deucher@amd.com>

Regards,
 =C2=A0 Felix


On 2023-11-20 10:36, Hamza Mahfooz wrote:
> + amd-gfx
> + Felix
>
> On 11/20/23 10:16, bugzilla-daemon@kernel.org wrote:
>> https://bugzilla.kernel.org/show_bug.cgi?id=3D218168
>>
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 Bug ID: 218168
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Summa=
ry: amdgpu: kfd_topology.c warning: the frame size=20
>> of 1408
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bytes is larger than 1024 =
bytes
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Produ=
ct: Drivers
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Versi=
on: 2.5
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Hardware: A=
ll
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 OS: Linux
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 Status: NEW
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Severity: n=
ormal
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Priority: P3
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Component: Video(=
DRI - non Intel)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Assignee: d=
rivers_video-dri@kernel-bugs.osdl.org
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Reporter: b=
luesun654@gmail.com
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Regression: No
>>
>> Trying to compile Linux 6.6.2 with GCC 13.2.1 and CONFIG_WERROR=3Dy:
>>
>> [...]
>> drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_topology.c: In function
>> 'kfd_topology_add_device':
>> drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_topology.c:2082:1: error:=20
>> the frame
>> size of 1408 bytes is larger than 1024 bytes=20
>> [-Werror=3Dframe-larger-than=3D]
>> =C2=A0 2082 | }
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | ^
>> cc1: all warnings being treated as errors
>> [...]
>>

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
