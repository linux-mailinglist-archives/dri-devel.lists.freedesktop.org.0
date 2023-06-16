Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2159A7335C1
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jun 2023 18:17:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6CA010E661;
	Fri, 16 Jun 2023 16:17:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF1ED10E652
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jun 2023 16:17:51 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B1838619AF
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jun 2023 16:17:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2603AC433CB
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jun 2023 16:17:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1686932270;
 bh=Q6cf7hTq/x/Cqh6Cw9BOR7mwAL00wuQa47J+jRBFJ44=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=ruRTLOmVSOkM8Ck5rIM6u5P0NhC/UCIS6TBLSH4vr7HklxSb6OCNnWq2IMXhSLKiv
 bZjaCKB0vlJnVsMHu+iF4Kr8Cb+hULPTw477Lt36CC2eBbVoca5mTvBlPtj6Z4Wsfz
 W9HT6eBvL7vmU6da51ZdxA/r5OcnvSzGTDOTj0qlPh5qNQeRthhB7vwUpHNe03c3ex
 Dpz5BJqSwQra6WewQkjyZzKYcf6QEpTtb8Gysdi6bmxn8wf5phefb8Yq23BUuD0hKo
 BZGFgBG0YZs9EjubnZUgXQCWZ5ARfvuDrqSYVikUHO/447W4A3Fnh2TWOL00jBH8tL
 otq5xnw4DK0Kg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 112ACC4332E; Fri, 16 Jun 2023 16:17:50 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 217545] Serious regression on amdgpu
 (drm_display_helper/drm_dp_atomic_find_time_slots) with two DisplayPort
 connected via a HP G5 docking station
Date: Fri, 16 Jun 2023 16:17:49 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: bugzilla.kernel.bpeb@manchmal.in-ulm.de
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: ANSWERED
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-217545-2300-9anW1bw8sL@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217545-2300@https.bugzilla.kernel.org/>
References: <bug-217545-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D217545

--- Comment #5 from Christoph Biedl (bugzilla.kernel.bpeb@manchmal.in-ulm.d=
e) ---
Dear future reader, please be reminded this is still an ongoing issue, or as
written in the drm/amd ticket: "this patch is just papering over underlying
issues". So while it makes that specific setup usable, the ultimate fix is
still not available yet. Check on the other bug tracker, or re-try newer ke=
rnel
releases.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
