Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C7A431DE12
	for <lists+dri-devel@lfdr.de>; Wed, 17 Feb 2021 18:24:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 412F36E5BE;
	Wed, 17 Feb 2021 17:24:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A15596E5BE
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Feb 2021 17:24:21 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 6A91F64E62
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Feb 2021 17:24:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1613582661;
 bh=4hS3DJb4o3D2Qq3tV4aKZURz4Cgbu5qlOWhmRTCkGwo=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=YLSuIKkSWVHrpVsdIxg0bVQMM7RL7chCHg5BTa5NsAKjaPM11KPB3hYD1BGVrzgAK
 NChlV0e2AqYodPOaivm1A9EBMqMVnBYhWq7gnRSsY31goPNirUlqFG92I8vuiwEG/j
 61s/x08VypkStEfer4RAQ+P8b4r3VwH4A7AWzjSj9pGV8SJiAAPWS42rEOrau4miBC
 SX+AR9GF3M+tb318ECC/zk4qM72LzzZZAylsnj9S3FWRXw8hR8uwqrwmSQFvZGNh30
 u2hyfgnKZOBFbSiiCvtSfPdRs+bS9crEN/8efiAflrv4+XZT9V9IVaVUmORcOvPbro
 KdOfWjRXSFk0w==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 639B4653C2; Wed, 17 Feb 2021 17:24:21 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 203905] amdgpu:actual_brightness has unreal/wrong value
Date: Wed, 17 Feb 2021 17:24:20 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: m11.1l1.f64@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-203905-2300-XsZYnf0NnG@https.bugzilla.kernel.org/>
In-Reply-To: <bug-203905-2300@https.bugzilla.kernel.org/>
References: <bug-203905-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=203905

m11.1l1.f64@gmail.com changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |m11.1l1.f64@gmail.com

--- Comment #23 from m11.1l1.f64@gmail.com ---
There's a workaround here



I hope it helps :)



simply write this into `/etc/systemd/system/backlight-fix.service`:

```
[Unit]
Description=Dummy service for attempting to start the problematic amdgpu_bl0
service

[Service]
Type=simple
ExecStart=systemctl start systemd-backlight@backlight:amdgpu_bl0

[Install]
WantedBy=multi-user.target
```

And then `sudo systemctl enable --now backlight-fix.service`

Bingo!!

The problem is gone

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
