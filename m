Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BBEBDA63622
	for <lists+dri-devel@lfdr.de>; Sun, 16 Mar 2025 15:47:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7416E10E16D;
	Sun, 16 Mar 2025 14:47:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="kZh5OJoI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0D8810E16D
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Mar 2025 14:47:00 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 5B9DA5C49A0
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Mar 2025 14:44:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E1B92C4CEE3
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Mar 2025 14:46:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1742136419;
 bh=UYnEBeeQ74437QloQxtlXOUV9hq1aU7jdrplbvmcRy0=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=kZh5OJoIzuAffRCIxX6vASgbY+jHGI/Gb7LSCuRJL68Eo1Wb49EVU3KRLQAdVc+Db
 8duUmbF50LvBok3mv3DU5XJpmJF1jY42XKMfO4MqkwWZfMB/rbS5ykUUw/sG0pq46p
 KZVMDfnvN5lWqIFBIQVXtKV97K0HwfsrG+izwgKfJJi3Mya5aqyoxL6Bcv1vf2ACOY
 sFox8qnxV6cpD/8GaArfGmGthByZY3heuhnjxB/FiIDwE416Fsbrs8Eqcr1RSmeY4+
 RviAEyg6jt6W1PwF17dkMvKZqeixOFThD7Ln5eEMLDvX9f4PZw/7LtZgtFNaDIkqy4
 QFltOWGrxD+oQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id D0A5CC41613; Sun, 16 Mar 2025 14:46:59 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 219888] amdgpu: Oops connecting HDMI/DVI/DP on HD 7850
 (Pitcairn) when connected as secondary GPU
Date: Sun, 16 Mar 2025 14:46:59 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: alexandre.f.demers@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-219888-2300-brKESnR1BW@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219888-2300@https.bugzilla.kernel.org/>
References: <bug-219888-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219888

--- Comment #1 from Alexandre Demers (alexandre.f.demers@gmail.com) ---
Since I had not encountered this problem until recently (the HD7850 was sit=
ting
as the primary GPU until my secondary GPU had to be replaced), I tried to
inverse the primary GPU (RX 5500 XT) with the secondary GPU (HD7850).

So, when the HD7850 sits as the primary GPU, it still doesn't output any vi=
deo
on 6.13.7 and it freezes.=20

However, it works properly on 6.10.2 when sitting as primary (the HD7850 st=
ill
doesn't output anything when sitting as the secondary GPU, but it doesn't
crash. Thus, this seems be a different issue).

I'll try to narrow it down a bit more to figure out if it was introduced
between 6.10 and 6.13.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
