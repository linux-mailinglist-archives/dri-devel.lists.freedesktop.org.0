Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iOs/LocFg2njggMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 04 Feb 2026 09:38:31 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 41329E33DB
	for <lists+dri-devel@lfdr.de>; Wed, 04 Feb 2026 09:38:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 832F710E56A;
	Wed,  4 Feb 2026 08:38:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="bDRWTRjX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5B4A10E56A
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Feb 2026 08:38:28 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 9B3464419D
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Feb 2026 08:38:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7F0DDC2BCB0
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Feb 2026 08:38:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1770194308;
 bh=rS+SZduxqW6eqjPTVae/nM4M6tyzY9fLviRLJE8YXnk=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=bDRWTRjXQ7MUXQBKLVN48X0aSnonMl60pQUfW2Rer8gfgEQR9tdttdLjHjQdEsbAe
 cRgq0JWlbkWOjQkrRbnio8rufKyFD4B+DC+N8RT6HKCKLCbK1ITq+/JTN+fRww4m2h
 7oCD4MiRU32ByXuU16tgIMS/SYmDtDR+LAqnqfRVc5WM2fFaLaRBIiQs2Umq5SbZta
 UOFacaPloignvQbVvVzH6IcvbxnDzyGQiyNw8xECB4p4RoMY+mCd6d9pmavwKmaKn9
 CjmWXdM0BTwBZ4eL68/z5GU4tihUNw1KJWyl8IhSzhxMJKvWwXI7n2O49rD863IaVj
 JDxUK4m8XLlWg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 73FCFC53BBF; Wed,  4 Feb 2026 08:38:28 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 221040] AMD Ryzen 5700G (Renoir/Cezanne): Second suspend hangs
 after "PM: suspend entry (deep)" - xhci_hcd and asus_wmi LPS0 involvement
Date: Wed, 04 Feb 2026 08:38:28 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: aros@gmx.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: ANSWERED
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-221040-2300-f8iytnQv6Q@https.bugzilla.kernel.org/>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,gitlab.freedesktop.org:url,gmx.com:email];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	DKIM_TRACE(0.00)[kernel.org:+]
X-Rspamd-Queue-Id: 41329E33DB
X-Rspamd-Action: no action

https://bugzilla.kernel.org/show_bug.cgi?id=3D221040

Artem S. Tashkinov (aros@gmx.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |ANSWERED

--- Comment #4 from Artem S. Tashkinov (aros@gmx.com) ---
> Cross-posted to:
> - AMD DRM GitLab: https://gitlab.freedesktop.org/drm/amd/-/issues/4927

This is where it belongs.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
