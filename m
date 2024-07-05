Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB7EA928C11
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jul 2024 18:05:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A8E710E296;
	Fri,  5 Jul 2024 16:05:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="eNrHZrCo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CD2510E29B
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jul 2024 16:05:30 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 37916CE3E0B
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jul 2024 16:05:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8360EC116B1
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jul 2024 16:05:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1720195527;
 bh=kcxPjMO6dyUsDZXbVT5sz8fCfuutQnZbJIG5IcaSbYo=;
 h=From:To:Subject:Date:From;
 b=eNrHZrCoDFLeZVwrWjHqMXcBZzllx8ppzA8HIkIxwr5JAvKbHY/JtCkGrmi1XYZX2
 fLMiguLf0vw7OTZ+aUAmAUhW4T/YeeHqBUqrrp3kEf4JirVNfj0zmNE1/YY3opmKYa
 aJ/3Ofg1j91Muyt8ZXHYhTJbPXkJ69i05RLzl/y94hfzJwwKGHPdPUIugyGRB/Fcbq
 rDSMXkC6tuXKV3ScDV3JnECqp1DZD3Bodrb5ovU0CAzF96ji7ImfSeRdBpJL3YdKj6
 60RIVk+55lJUVb2t+FK7xS1kZXgiWFKcHgSaiKGiaA6RolI7ugZmmUVH8glT7YthST
 D20qD6UWdMo/Q==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 77347C53B7F; Fri,  5 Jul 2024 16:05:27 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 219007] New: opening and closing /dev/dri/card0 in a QEMU KVM
 instance will shutdown system, 6.10.0-rc6+
Date: Fri, 05 Jul 2024 16:05:27 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: colin.i.king@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression
Message-ID: <bug-219007-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219007

            Bug ID: 219007
           Summary: opening and closing /dev/dri/card0 in a QEMU KVM
                    instance will shutdown system, 6.10.0-rc6+
           Product: Drivers
           Version: 2.5
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P3
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: colin.i.king@gmail.com
        Regression: No

The following code when run as root on a Debian sid amd64 server running in
virt-manager (KVM QEMU) will shut the system down with 6.10.0-rc6.  The for=
k()
is required to cause racing on the open/close on /dev/dri/card0

#include <fcntl.h>
#include <unistd.h>

int main(void)
{
         pid_t pid =3D fork();

         while (1) {
                int fd;

                fd =3D openat(AT_FDCWD, "/dev/dri/card0",
O_WRONLY|O_NONBLOCK|O_SYNC);
                close(fd);
         }
}

This was originally found using: while true; do sudo ./stress-ng  --dev 4
--dev-file /dev/dri/card0 -t 5; done and narrowed down to the above reprodu=
cer.
(cf: https://github.com/ColinIanKing/stress-ng/issues/407 )

This does not occur on pre 6.10 kernels, so it looks like a 6.10 regression.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
