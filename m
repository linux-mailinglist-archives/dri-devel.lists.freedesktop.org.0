Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F0B14A6149
	for <lists+dri-devel@lfdr.de>; Tue,  1 Feb 2022 17:22:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DBC410E6DB;
	Tue,  1 Feb 2022 16:22:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1499F10E6DB
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Feb 2022 16:22:30 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id C2706B82ECA
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Feb 2022 16:22:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 93EDBC340EB
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Feb 2022 16:22:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643732547;
 bh=nssbaHJ1JSI5rDUuUPf5sAjyD1imuKOKabV7tQVXWAk=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=eNzLdraFJ7dUyznPJ/7yjaszxdhID6ZJTdTMSXprHXkOfcJ+LiMr/8QJErNnbr1Xb
 UbMTffESbOmvLPvgQCNcOamFnOCaNLnLgx251iJYnrA0jGXCWObw0XrnAQdqr7/2zr
 KP+GIsZv1FR1EuSFB0JjbcDPXH/hmMteC51NBThsivqtA/leDlgn04RC0Qiz5s4DQI
 XDqkNREX9MjV0MQ1tWgIjce/9rk3FBOuYN0qTgiWFQOEs0Q9wVF0lYVequVL374ggS
 dH4TTDTFlCbu0uMY+rS6j4EmYpjIrAaoudf/Az6TQCw03sfcrE+lF33PVAVLjpXmEi
 4lNpbpADmE/VA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 76F85C05FCE; Tue,  1 Feb 2022 16:22:27 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 215511] Dual monitor with amd 5700 causes system to hang at
 startup.
Date: Tue, 01 Feb 2022 16:22:27 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: alexdeucher@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-215511-2300-pb72e6KvWz@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215511-2300@https.bugzilla.kernel.org/>
References: <bug-215511-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D215511

--- Comment #3 from Alex Deucher (alexdeucher@gmail.com) ---
Here's a howto for doing a bisect:
https://www.kernel.org/doc/html/latest/admin-guide/bug-bisect.html
Here's a howto for building a kernel:
https://kernelnewbies.org/KernelBuild

Basic process:
# create a directly to store your git source
mkdir kernel
# change to that directory
cd kernel
# clone the stable git tree
git clone git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git
# copy your distros config to use for your build, replace #whatever with
# whatever config your distro is using
cp /boot/config-#whatever .config
# start bisecting
git bisect start
# tag 5.15.13 as bad
git bisect bad v5.15.13
# tag 5.15.2 as good
git bisect good v5.15.12
# build the first kernel to test
make clean
make
make modules_install
make install
# test the new kernel
# if it's good, mark it as good
git bisect good
# if it's bad, mark it as bad
git bisect bad
# build the next kernel to test
make
make modules_install
make install
# test the new kernel
# repeat until the bisect is complete

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
