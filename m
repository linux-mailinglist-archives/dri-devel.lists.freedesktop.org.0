Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93E38343406
	for <lists+dri-devel@lfdr.de>; Sun, 21 Mar 2021 19:19:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45E386E222;
	Sun, 21 Mar 2021 18:19:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 444B86E222
 for <dri-devel@lists.freedesktop.org>; Sun, 21 Mar 2021 18:19:18 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id C4EDA6191C
 for <dri-devel@lists.freedesktop.org>; Sun, 21 Mar 2021 18:19:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1616350757;
 bh=FE1lachLF35TajehZFSYfxAkhZjbaWQHyKQ4/BL7p6M=;
 h=From:To:Subject:Date:From;
 b=h8/Feh5XLVchVbdTl8aAx13MMBNni6u+TGql3/sQVzw5zQH6/fezoNjgpRqS8d22E
 odWDez8vKvkNKkGikHB9i6+kInoNOlAH8GeMdtYiTD144oIl80AsH1U5I0br0/Xxl0
 p+br7AluVsjawgsiRvWhPfJA/bTOLF40GaYUkks1Oews6A1rlFs5eIP8sajYXk7WgG
 y80RiNILcQA6fnQ78PqCzrPzkGHopj4VIBwWL1+vk765p+ynygvAKQtC4Qim247Hdm
 M3kVaJESni/MEC9DpvS1TktrKxleSON/hbfn7yMLspoHA0w1tBaenkezpOPdTFdazl
 jm0K+e3fCzChw==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id BA5E06146B; Sun, 21 Mar 2021 18:19:17 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 212373] New: Dual monitors does not sleep when inactive
Date: Sun, 21 Mar 2021 18:19:17 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: edouard@the-redunicorn.fr
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression
Message-ID: <bug-212373-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=212373

            Bug ID: 212373
           Summary: Dual monitors does not sleep when inactive
           Product: Drivers
           Version: 2.5
    Kernel Version: 5.8.0-45
          Hardware: All
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: edouard@the-redunicorn.fr
        Regression: No

Hi,

Recently I noticed an issue with my dual monitors configuration. I used to have
my monitors sleeping after 5 minutes of inactivity, as setup in gnome control
center. 
When I changed them, the behavior was not that described anymore. It is not
related to the monitors as far as this sleeping feature works with an other OS.
The difference between the new ones and the old ones *may* be the DPMS feature.

The new behavior observed is: 
- after X minutes of inactivity, monitors go black 
- instead of having a "no signal" popup, monitors re-up after few seconds 
- after X minutes again of inactivity, monitors go black again 
- etc
I get the same by typing xset dpms force off.
When I try this with only one monitor connected, it goes to sleep as expected.

The fact is, after seeking for hours in forums, I found that :
https://askubuntu.com/questions/1047182/dual-monitors-on-18-04-with-radeon-rx-580-gpu.
And for an unknown reason, despite the fact the issue described there does not
seem to be related to mine, disabling the DC layer of amdgpu works! In other
words, after X minutes of inactivity both monitors go to sleep as expected.

I hope this is not to confusing.. it is quite hard to describe as a non-english
native person.

Cheers.

PS: my 'uname -a' returns Linux XXXX 5.8.0-45-generic #51~20.04.1-Ubuntu SMP
Tue Feb 23 13:46:31 UTC 2021 x86_64 x86_64 x86_64 GNU/Linux

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
