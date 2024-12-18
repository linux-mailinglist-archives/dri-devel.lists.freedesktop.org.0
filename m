Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DF62A9F6903
	for <lists+dri-devel@lfdr.de>; Wed, 18 Dec 2024 15:50:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50C4610E32A;
	Wed, 18 Dec 2024 14:50:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="KBI0BpeC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6E8C10E32A
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Dec 2024 14:49:59 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 527B95C6253
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Dec 2024 14:49:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1587AC4CECD
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Dec 2024 14:49:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1734533399;
 bh=bJThV+m0IGB06DxWG1zWmJ7yxpo2x1HF0detj6GcZR4=;
 h=From:To:Subject:Date:From;
 b=KBI0BpeC+3K7oxZmAbMMZ6rVZdOeaFfNXoax/1u1ICQry3bS6PFVIG7rW8VQL7o8T
 gqVYq4Dvx9/uKWaH4owOOCcSSo9UfCeCc8KPrL+SFZcg0kMzK3iU3PNgEi8n/bfabX
 KZzTBjgjRLhK1TW+asJePH7hwGft1fjfjlhxCCj38n9vC1Z8Bsz33m9G1oH1SyaB13
 nHYCJtNdT1Okj90rQpKASl4WwV2BxRLdE4avWBiScVRVuTUgUvqIyR7ZFcLvbgIwSH
 6Ynx4gWwc5wi0xDp7OjQDJV7hY/n1qucH/XTG4sQXdAvxzXzLcX6RnFnYE22Wx6C23
 R3xHghAf2JQxQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 07087C41613; Wed, 18 Dec 2024 14:49:59 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 219611] New: Read of pcie_bw sysfs file on AMD GPU blocks for 1
 second
Date: Wed, 18 Dec 2024 14:49:58 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: yumpusamongus+kernelbugzilla@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression
Message-ID: <bug-219611-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219611

            Bug ID: 219611
           Summary: Read of pcie_bw sysfs file on AMD GPU blocks for 1
                    second
           Product: Drivers
           Version: 2.5
          Hardware: Intel
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P3
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: yumpusamongus+kernelbugzilla@gmail.com
        Regression: No

Multiple cases of userspace resource monitors getting tripped up by this:

https://github.com/Syllo/nvtop/issues/139=20=20

https://github.com/Syllo/nvtop/issues/208=20=20

https://github.com/aristocratos/btop/issues/793=20=20

https://gitlab.com/mission-center-devs/mission-center/-/issues/309

The behavior is highly unusual and would require special treatment of just =
that
file in userspace.

The docs say "The amdgpu driver provides a sysfs API for estimating how much
data has been received and sent by the GPU in the last second through PCIe".
Specifically, the LAST second, not the second starting when read() was call=
ed.

The culprit, as far as I can tell, is the msleep here:
https://elixir.bootlin.com/linux/v6.12.4/source/drivers/gpu/drm/amd/amdgpu/=
soc15.c#L756
(the same code is copy-pasted in 4 places).

I am not familiar with the intricacies of AMD GPUs, but what would be the c=
ost
to having those counters enabled all the time, and reporting the number of
messages in some recent second? Or even better, ripping this out and exposi=
ng
the integrating message counts directly, so userspace can choose whichever
sample rate it wants?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
