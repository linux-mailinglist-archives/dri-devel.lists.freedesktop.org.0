Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D0B85A3804
	for <lists+dri-devel@lfdr.de>; Sat, 27 Aug 2022 15:56:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22CF010EA1C;
	Sat, 27 Aug 2022 13:56:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE1D010EA1C
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Aug 2022 13:56:42 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id DE17EB80108
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Aug 2022 13:56:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 16F2AC43140
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Aug 2022 13:56:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1661608599;
 bh=6ZEWqP1pgEPTVdfDQyvTLPkMRGlNp8QBLFamydf6Q1w=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=SrmN6nhiD8pRL9EEKn/j0ZaYsJR0BP1e7NEBPtonHFF7KVnuDL5z5CZFV7ZgC2jjL
 k39u/srO9DY5x8bGj30xqf7KINfrqcvZx1TGf/nmxLEUCW06/HxlspMfv6ikOMsgFF
 UN54xBceiQpYa8C9Mj3uwtVq6LLbHj6nnuSQ3+E3Dw4ZktDBxpxQqzOsXRvaUKfPBL
 ydsafFNWyqKBVANP9xhDUczEHgEtJLme6O9bmQ/yg+prUQkgV3WOJ8a0gM1d3W1MSs
 f3qlp5Z5jXZdPMAr1JlXmjlDO5EzhtwpfeBYyYsdOAb9GXm+RwVy1uYJheqWSdsblU
 nOsXvP+VAYDOg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 051CBC433E6; Sat, 27 Aug 2022 13:56:39 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 216143] [bisected] garbled screen when starting X + dmesg
 cluttered with "[drm:amdgpu_cs_ioctl [amdgpu]] *ERROR* Failed in the
 dependencies handling -1431655766!"
Date: Sat, 27 Aug 2022 13:56:38 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: michel@daenzer.net
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: INVALID
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216143-2300-oomGZSh7Ok@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216143-2300@https.bugzilla.kernel.org/>
References: <bug-216143-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216143

--- Comment #14 from Michel D=C3=A4nzer (michel@daenzer.net) ---
(In reply to Erhard F. from comment #13)
> I'll close here as it's clear this is not strictly an AMD driver issue.

Not really clear; there could be buggy amdgpu driver code, which happens no=
t to
result in noticeable issues in practice when compiled by GCC.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
