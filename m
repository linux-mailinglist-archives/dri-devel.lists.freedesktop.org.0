Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CGybHWZigmnfTQMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Feb 2026 22:02:30 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF9CBDEB4F
	for <lists+dri-devel@lfdr.de>; Tue, 03 Feb 2026 22:02:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30EC910E15D;
	Tue,  3 Feb 2026 21:02:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="NlxSVjeU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82EA810E15D
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Feb 2026 21:02:26 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 4D78D4033C
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Feb 2026 21:02:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2BAABC116D0
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Feb 2026 21:02:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1770152546;
 bh=s8VaEikElmNmFWDMP1t9ube6Czgx4JANJeiWg8iaAZ8=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=NlxSVjeUXK2SG0W1hGrDufpZxmxtDsLowPsW2f1po4fHFgXE/SgCJ+RlP+UHTAOY+
 8IuRe6nLdEnwDy2WVDc+eChe0SDuF1lP827On9OkMVbXIvtVXt/WRS/UzFO3yguqds
 rXevs3J6ZbJDweVv5oK3g42c7SVsXm9EH6mTdQLXTKYfYKs7iuiW9iADw5bV0NKGpT
 v0tYcEj5tGKMnV6WYRtFGS5THmcMDrwxmq+qxqdNJp9SlFV16QTDDVpw5+wb4NJNnI
 P3WBF+NWi2rw3aMjsDmrI4BAD5oo7wK0G1J8mFl4ev1+dx1S5s/73Nzj+1oiiU9IGR
 rLjHx42xmtCSA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 1F7E6C41613; Tue,  3 Feb 2026 21:02:26 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 221040] AMD Ryzen 5700G (Renoir/Cezanne): Second suspend hangs
 after "PM: suspend entry (deep)" - xhci_hcd and asus_wmi LPS0 involvement
Date: Tue, 03 Feb 2026 21:02:25 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: s93nesua@bote.unbox.at
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221040-2300-5UHUOkj06F@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221040-2300@https.bugzilla.kernel.org/>
References: <bug-221040-2300@https.bugzilla.kernel.org/>
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
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	ARC_NA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_NO_DN(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FROM_NEQ_ENVFROM(0.00)[bugzilla-daemon@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_ONE(0.00)[1];
	RCVD_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[reddit.com:url,unbox.at:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	DKIM_TRACE(0.00)[kernel.org:+]
X-Rspamd-Queue-Id: EF9CBDEB4F
X-Rspamd-Action: no action

https://bugzilla.kernel.org/show_bug.cgi?id=3D221040

--- Comment #3 from Bertram Ganz (s93nesua@bote.unbox.at) ---
Cross-posted to:
- Reddit r/AMDHelp:
https://www.reddit.com/r/AMDHelp/comments/1qv40fo/amd_ryzen_5700g_renoir_as=
us_b450i_second_suspend/

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
