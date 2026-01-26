Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ODw2KHHfd2n1mAEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jan 2026 22:41:05 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F1AE68DB16
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jan 2026 22:41:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE48510E265;
	Mon, 26 Jan 2026 21:41:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Uvh5MhqY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 145AA10E265
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jan 2026 21:41:01 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 1B52D60051
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jan 2026 21:41:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C61BEC19422
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jan 2026 21:40:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1769463659;
 bh=6tf9knWeOV04XomUGTKDYNXE08AEtmErODAiYhZLgQw=;
 h=From:To:Subject:Date:From;
 b=Uvh5MhqYmieJpD8G70yIvxszcG4NEwQUG8TF4jMNtF2G02h0sv6QXmSj2PvwdnNUK
 1Z3eRPAPbWbSciPzY3ihwFYnu8dkvpGrQft8ukZ4zBjUX0WyIFYbrlqW+o5E8CjKlw
 sFW7BjafplUztHPW/vt3UaCZfwlfGEp2Ox36W7t3CTr4msW1xgVy7P6lvW221ykoK3
 1uK1uUHQULV0yKPhbyPuTroF6pfaTU2bPLBEni5rww+s9sw6SCbsALvxGbg0M5XPG4
 hYx2WkMrDo6zB+yLFVD2My0ThXl+oTL8KNi5yVqme0T2GZEIi470kfyUTHtR28Ij8W
 VW7Oj7xXUCPGA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id C10DAC41612; Mon, 26 Jan 2026 21:40:59 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 221012] New: GPU page fault on AMD RX 7600 XT after commit
 bf2084a7b1d75d093b6a79df4c10142d49fbaa0e
Date: Mon, 26 Jan 2026 21:40:59 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: geschw@pm.me
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression attachments.created
Message-ID: <bug-221012-2300@https.bugzilla.kernel.org/>
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_NO_DN(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[osdl.org:email,pm.me:email];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[bugzilla-daemon@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	DKIM_TRACE(0.00)[kernel.org:+]
X-Rspamd-Queue-Id: F1AE68DB16
X-Rspamd-Action: no action

https://bugzilla.kernel.org/show_bug.cgi?id=3D221012

            Bug ID: 221012
           Summary: GPU page fault on AMD RX 7600 XT after commit
                    bf2084a7b1d75d093b6a79df4c10142d49fbaa0e
           Product: Drivers
           Version: 2.5
          Hardware: AMD
                OS: Linux
            Status: NEW
          Severity: high
          Priority: P3
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: geschw@pm.me
        Regression: No

Created attachment 309237
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D309237&action=3Dedit
dmesg, lspci

GPU page fault occurs when running HIP/ROCm workloads on the AMD Radeon RX =
7600
XT with kernel version 6.18.2. This issue is introduced by commit
bf2084a7b1d75d093b6a79df4c10142d49fbaa0e, which modifies the alignment logic
for split SVM ranges and introduces the use of huge pages. The error can be
resolved by reverting this commit.

The fault is reproducible under consistent workloads, and it prevents
successful execution of HIP-based tasks, such as PyTorch model training, on
this GPU. The error manifests as permission faults in the GPU driver logs.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
