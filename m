Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ACA6035777B
	for <lists+dri-devel@lfdr.de>; Thu,  8 Apr 2021 00:18:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 326E36E106;
	Wed,  7 Apr 2021 22:18:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C68E86E0CE
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Apr 2021 22:18:12 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id C34C46121E
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Apr 2021 22:18:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617833891;
 bh=FQmdsHUnywJONxWqauD2KoSmF0tC4w4z9zIb5rGHA0A=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=GQ55byNu+oyIvD4//m6Ira8zQuucef2fCB3pkf3mCAnQJLrdXd9GS8+E0vY0/BH69
 P6oSpYV+BsYFjwidlRbNeoDK1L8GizltyOAPvbocSKnkhVz8N98OdQi5GNJ+rt/afv
 9gfRvIPSH8E8byF1CMzpxwXbQmlqQ2Oc1M6SDxWynyt8YSTcoaXM1KtlzLyT5772w1
 6OzscWj3xatIIor/b4jueXfdfXASLhJyd0nihEOBG3NJnCRdbezmLYkRX65phlPOfr
 ki7ljJKWxGKIjUTa8rn780wN3A16Cvemibsmx60MwHyt7I76yzthPqq1ZjTF3KNP9T
 QEbcUBpWtHIZg==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id B7E3861107; Wed,  7 Apr 2021 22:18:11 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 211875] CPU frequency scaling lost after "WARNING: CPU: 2 PID:
 2358578 at smu8_send_msg_to_smc_with_parameter+0xfe/0x140 [amdgpu]"
Date: Wed, 07 Apr 2021 22:18:11 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: erhard_f@mailbox.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-211875-2300-7TA5ClDSbL@https.bugzilla.kernel.org/>
In-Reply-To: <bug-211875-2300@https.bugzilla.kernel.org/>
References: <bug-211875-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=211875

--- Comment #8 from Erhard F. (erhard_f@mailbox.org) ---
Created attachment 296273
  --> https://bugzilla.kernel.org/attachment.cgi?id=296273&action=edit
dmesg (kernel 4.14.228, A10-9700E)

Traced the issue back to kernel v4.14.228 which is still affected (v4.19.184
and v5.4.109 too). On v4.14.228 no stack trace like in recent kernels but these
messages:

[...]
[28541.868617] amdgpu: [powerplay] min_core_set_clock not set
[28542.483228] cz_send_msg_to_smc_async (0x0011) failed
[28543.097905] cz_send_msg_to_smc_async (0x026e) failed
[28543.712424] cz_send_msg_to_smc_async (0x002f) failed
[28543.712719] amdgpu: [powerplay] min_core_set_clock not set
[28544.330105] cz_send_msg_to_smc_async (0x0011) failed
[28544.947054] cz_send_msg_to_smc_async (0x026e) failed
[28545.564013] cz_send_msg_to_smc_async (0x002f) failed
[28545.564251] amdgpu: [powerplay] min_core_set_clock not set
[28546.179695] cz_send_msg_to_smc_async (0x0011) failed
[28546.794880] cz_send_msg_to_smc_async (0x026e) failed
[28547.409986] cz_send_msg_to_smc_async (0x002f) failed

Apart from that the machine behaves the same after these
"cz_send_msg_to_smc_async (0x002f) failed" - CPU permanently downclocked to 800
MHz, desktop 'freezing' issues with display going black after some time. Access
via ssh still works.

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
