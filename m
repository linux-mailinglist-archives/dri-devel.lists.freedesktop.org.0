Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EDB5339290
	for <lists+dri-devel@lfdr.de>; Fri, 12 Mar 2021 16:58:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 527B16F8B5;
	Fri, 12 Mar 2021 15:58:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 815B46F8B5
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Mar 2021 15:58:44 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 837B064FE0
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Mar 2021 15:58:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1615564723;
 bh=pvcRZrlOBQAqDQATezcc/2Oo7+T12YmBuxEtJuOVna0=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=T0iXnb4Zz2u5C/PIWPgrdsMQkyWQBfUbwzi21nqT5YODWkp5XNF7cySfSwj6cUkVM
 dP1ygAhiWKA0cyEcFLwMEmBJlhluhPZhl5p4hLVWxgH5BdeMrPR3Es3U7NWZsmlCuN
 X9pp8r1pYgIF7YflnBxL1g6EpXEm6ahxlXf75iIWM/Y5GYde71w30fdzLHLThBPve8
 jbe2p2/n8CIuB7PiEtYbGLLNGInQtTEJHuIofifPkrK3kD3tmQ4ec8Vfaj59ymgCpt
 hE0LYihBhMGt/s9dRUXRP5dgdVc94cC8TfDNu/SbQx91oVCCNaWRLx8JJo3l+rmd8S
 8olGPdFhRpBZA==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 73A6165373; Fri, 12 Mar 2021 15:58:43 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 210321] /display/dc/dcn20/dcn20_resource.c:3240
 dcn20_validate_bandwidth_fp+0x8b/0xd0 [amdgpu]
Date: Fri, 12 Mar 2021 15:58:43 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: tristen.hayfield@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-210321-2300-J4gYV1tUoU@https.bugzilla.kernel.org/>
In-Reply-To: <bug-210321-2300@https.bugzilla.kernel.org/>
References: <bug-210321-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=210321

--- Comment #5 from Tristen Hayfield (tristen.hayfield@gmail.com) ---
I did some more digging into this. I put some logging inside the if block to
see if that branch is ever taken:

        if (voltage_supported && dummy_pstate_supported) {
                context->bw_ctx.bw.dcn.clk.p_state_change_support = false;
                goto restore_dml_state;
        }

in order to log when or if the fallback worked. The logs confirmed that the
fallback is often used and generally works. Upon starting up the system and
starting up Xorg I get about a dozen log messages indicating that it entered
the if block. The only exception seems to be as Florian describes above, that
when the display shuts off due to power-saving it triggers the assertion.

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
