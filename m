Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3793731702D
	for <lists+dri-devel@lfdr.de>; Wed, 10 Feb 2021 20:35:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07A4C6E34B;
	Wed, 10 Feb 2021 19:35:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B41B6E34B
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Feb 2021 19:35:48 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id E8B1164E74
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Feb 2021 19:35:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612985747;
 bh=ko9VlYAKB1Dj3uJmwAIgUeLsb6npo4A2lrQrratNKTM=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=LvkgeWTqezfUjCy9b6JWuz8cfvkdOCe7CfTbX9n1cT5C6FInFB3WzR2tUoRa6wB8s
 BznRNX9vZ/0tESmIZn7QhMUrWqCR/8x298wn/vcUoRHAIcgY6132G2aFJLy3QabXlC
 Mu5q1N0FJuLQJyJV2zdSQuXZKqQ1oq7C7vjDIssAuYz1cS48RtBprNRb1C83kCnsXp
 ljDtpNDRt7eQwnhl/0SI0KeEfAkReBd0dAe/iYsYGznuyR9BjDBaKb+vstnFWp9Rlq
 fEzWSEkHixHDixXY+CpWa0OGwkulXLgpKQtdQKy4BHoCrlLmA5lo3mWXVM/mC8A/Tq
 EGXQqnM5DpdsA==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id DA74465259; Wed, 10 Feb 2021 19:35:47 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 211649] "drm/amd/display: reuse current context instead of
 recreating one" cause hdmi hotplug blackscreen on amdgpu
Date: Wed, 10 Feb 2021 19:35:47 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: youling257@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-211649-2300-GCCVd3cHLL@https.bugzilla.kernel.org/>
In-Reply-To: <bug-211649-2300@https.bugzilla.kernel.org/>
References: <bug-211649-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=211649

--- Comment #8 from youling257@gmail.com ---
(In reply to Nicholas Kazlauskas from comment #7)
> That makes more sense then, that's the behavior I'd expect on CrOS/Android.
> 
> Also explains why we haven't seen this on X/Wayland based compositors like
> GNOME on Ubuntu.
> 
> One more log I'd like captured here, the trace log. Please record a log from
> before the black screen occurs until after.
> 
> I've included a snippet below that shows how to capture this log:
> 
> #!/bin/bash
> 
> set +x
> OUTPUT_DIR=$(pwd)
> 
> mount -o remount,rw /
> echo 4 > /sys/module/drm/parameters/debug
> echo 65536 > /sys/kernel/debug/tracing/buffer_size_kb
> 
> cd /sys/kernel/debug/tracing/
> echo amdgpu_dm* > set_ftrace_filter
> echo function > current_tracer
> echo 1 > events/amdgpu_dm/enable
> echo 1 > tracing_on
> echo > trace
> echo "Capturing a trace...\n"
> read -n 1
> cat trace > $OUTPUT_DIR/trace.txt
> echo "Saved trace to ${OUTPUT_DIR}/trace.txt"
> dmesg > $OUTPUT_DIR/dmesg.txt
> echo "Saved dmesg to ${OUTPUT_DIR}/dmesg.txt"

run the script,only echo Capturing a trace...\n
failed output trace.txt and dmesg.txt.

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
