Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iDAtEGcXcmksawAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jan 2026 13:26:15 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC3746699B
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jan 2026 13:26:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC13B10E0DE;
	Thu, 22 Jan 2026 12:26:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="BQc2jthH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 022B710E0DE
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jan 2026 12:26:09 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id E1141600C3
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jan 2026 12:26:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 97987C19423
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jan 2026 12:26:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1769084768;
 bh=XhIWtdBNp0KS5qzZgkp328zOoNbmXZQ/81VT1uie3w4=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=BQc2jthHmT7PMqFvwNH5I5RtACQ7/+r2tNwlzu1On90+5MrNTScTI9W/2f5knICMZ
 qVOfcnMWjRWfNdDWEtXEEjtJLQOoxipPDS3OL2oM/sjn7MbuOG6ukYumPmC443LqmP
 damckZH6FUsZMglYOiwOpsNcPb4J7S7hk/d9oD9vgGytLgihACBZLEsbH1gK4L0ML/
 bf1MQcrQMSSTW3oKUKKfR5dfpargw6DXBLGCtr5sb9jJCO5gCcBG+pOgwQM0NaoehQ
 kX9UUBe5ze6FaPlrRTkHQ4R1Iek7LagwrTI5Veb64lxAgNTjY9WJ0GAl2d5GM+oevA
 r6vAC3OpvS9kg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 8E747C53BBF; Thu, 22 Jan 2026 12:26:08 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 220428] UBSAN array-index-out-of-bounds warning in
 radeon_atombios.c on kernel 6.15.9 with AMD Radeon HD 6250
Date: Thu, 22 Jan 2026 12:26:08 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: dutra.astro@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-220428-2300-qQfw1NXi6s@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220428-2300@https.bugzilla.kernel.org/>
References: <bug-220428-2300@https.bugzilla.kernel.org/>
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
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	ARC_NA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FROM_NO_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bugzilla-daemon@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_ONE(0.00)[1];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[dri-devel];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	DKIM_TRACE(0.00)[kernel.org:+]
X-Rspamd-Queue-Id: BC3746699B
X-Rspamd-Action: no action

https://bugzilla.kernel.org/show_bug.cgi?id=3D220428

--- Comment #4 from Lucas (dutra.astro@gmail.com) ---
Awesome. Thanks for reporting. So, let's wait the 6.19 version be fully
released and stay a bit, so we can assure the problem will be solved for
everyone, then we the issue can be closed.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
