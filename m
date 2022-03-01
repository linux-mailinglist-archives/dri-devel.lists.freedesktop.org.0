Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 740DF4C8DC8
	for <lists+dri-devel@lfdr.de>; Tue,  1 Mar 2022 15:32:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93EC910E492;
	Tue,  1 Mar 2022 14:32:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE0B010E492
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Mar 2022 14:32:18 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 8DCD5B819EB
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Mar 2022 14:32:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 36DB7C340F0
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Mar 2022 14:32:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646145136;
 bh=nuCDRBfRq5oAPI+DFm7VWiPGO0xz50vj7FK+RBKHtl4=;
 h=From:To:Subject:Date:From;
 b=K8RFoOIuhFjLyuwgH1iOwaeTdLAxpg3bKriewGW3mrfy9FQTg4Ef0h+QqdH9OdFHy
 ihBmERCT8ZI9iq1syt4ZTgts7AF6H6cuN5PEC03T42TUOeON/7AZYXw62OuOeJwSCt
 L1JanhC+v1t1qnXlfsfAlNg5Tqx8E97zBbPmgivHYzVe8Vq3VcYhLqeixmWbyioyb/
 jWQzY2bOlN0CnlfrfQH3K+9vaEKc/uSRr2I+ee6j0kGXpWQ/qNSES0Ugr4U+Cz0rUt
 qJp4J2jnbNNejEDNDXbx0v8Qts3JFCFoD/lnFNCdYniXl9ORHb31jm/oTgD6tVWSPB
 +6kTIw8IatYcw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 1F375C05FD6; Tue,  1 Mar 2022 14:32:16 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 215648] New: amdgpu: Changing monitor configuration
 (plug/unplug/wake from DPMS) causes kernel panic
Date: Tue, 01 Mar 2022 14:32:15 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: pr_kernel@tum.fail
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression
Message-ID: <bug-215648-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D215648

            Bug ID: 215648
           Summary: amdgpu: Changing monitor configuration
                    (plug/unplug/wake from DPMS) causes kernel panic
           Product: Drivers
           Version: 2.5
    Kernel Version: 5.15.12
          Hardware: x86-64
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: pr_kernel@tum.fail
        Regression: No

Hi!

My Lenovo T14s (AMD) crashes with a panic (https://imgur.com/a/P6Twvov) whe=
n I
unplug/replug any monitor. This also happens when an external display wakes
from DPMS.

I have bisected the issue to the same 0f591d17e36e08313b0c440b99b0e57b47e01=
a9a
as Jose Mestre did in #215511. The patch proposed there (that is already
mainlined, if I see that correctly) does not help. Alex Deucher asked me to
open this as a new bug.

I have tried all kernel up to 5.15.24 -- I cannot try 5.16 as I use zfs as =
root
device the and zfs module is not (yet) compatible with 5.16.

Is there anything you would like me to try or should my issue be fixed in
5.16+?

Cheers,
Philipp

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
