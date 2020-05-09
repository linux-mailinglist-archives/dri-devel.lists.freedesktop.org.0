Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 16A321CC499
	for <lists+dri-devel@lfdr.de>; Sat,  9 May 2020 22:48:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DD7B6E3A2;
	Sat,  9 May 2020 20:48:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6EC16E3A2
 for <dri-devel@lists.freedesktop.org>; Sat,  9 May 2020 20:48:35 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: dri-devel@lists.freedesktop.org
Subject: [Bug 207667] New: power_dpm_force_performance_level set to "low"
 reduces CPU performance (Vega 8 / Ryzen 2200G)
Date: Sat, 09 May 2020 20:48:35 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: low
X-Bugzilla-Who: alekshs@hotmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression
Message-ID: <bug-207667-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=207667

            Bug ID: 207667
           Summary: power_dpm_force_performance_level set to "low" reduces
                    CPU performance (Vega 8 / Ryzen 2200G)
           Product: Drivers
           Version: 2.5
    Kernel Version: 5.6.8
          Hardware: x86-64
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: low
          Priority: P1
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: alekshs@hotmail.com
        Regression: No

I've been on a power saving quest lately, trying various different things. One
of the things that I don't particularly need in my Ryzen 2200G is GPU
performance. So it made sense to reduce the 400 MHz clock to lower levels to
gain in power efficiency.

I echoed "low" to power_dpm_force_performance_level and indeed my power
consumption dropped while the frequency went down from 400MHz to 200MHz. I now
see Vsoc went from 1.01v to 0.91v and Isoc went from 3.5A to 1.75A.

What I did not expect was that I would see performance issues in terms of CPU
tasks.

CPU tasks like SHA256 hashing are unaffected.
CPU tasks that involve RAM, like lrzip, cinebench 15 (under wine), etc, show a
considerable drop in performance. CB15 cpu score loses >10% while an lrzip file
compression went from 14 to 21 seconds. I also did a geekbench 5 comparison
(more of that in the end - with links).

I measured cache and memory bandwidth, it seems to be the same whether I have
power_dpm_force_performance_level set to low or auto, so downclocking the
integrated graphics of the ryzen didn't impact memory speeds. Maybe it's an
interactivity thing / irq thing or something that makes tasks wait? Or maybe
it's a power delay issue as the SOC has to increase watts on demand? I don't
know - someone has to find out.

I think it's abnormal behavior for the IGP clock to cause CPU applications to
slow down - especially by more than 50% in some cases:

I've run 2 geekbench 5.0 benchmarks, with the only difference being "low" and
"auto" on the power_dpm_force_performance_level:

Low: https://browser.geekbench.com/v5/cpu/2096508
Auto: https://browser.geekbench.com/v5/cpu/2096537

If you scroll down you see some tasks are very heavily affected while others
aren't.

For example multithreaded raytracing is at 4900 in both instances. But
multithreaded speech recognition is 900 vs 1800, while AES is 2100 vs 4500.
Huge differences.

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
