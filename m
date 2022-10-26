Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FAC660DAD1
	for <lists+dri-devel@lfdr.de>; Wed, 26 Oct 2022 07:58:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C1C510E41F;
	Wed, 26 Oct 2022 05:58:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FE3110E41F
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Oct 2022 05:58:41 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C0C0761D03
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Oct 2022 05:58:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2FF76C433C1
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Oct 2022 05:58:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1666763920;
 bh=hOpyInyqd8Nv/+kA3lgIU6T/1JGgh/9JDNh7ghcukR0=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=aX0IC0i/RoFY+auANDZDd7t+Cb93MDb+sFl3O4SdeCibKXwenb+O6bTdqkY1V4/9K
 e341a5wgDU+SOnRI6oAymqRl6W/ZIURj7Xg3k8vAiqjdiOm2htUXLMFtLM/avlGZNG
 ++ZtMlRYCs+/sP0fRkoLkwWZzHyMQUjeYFa4xnwEenyKeRo2Ttu78GwgV4surw+EpZ
 oaAWpaOmAJYTkKte12RBLCWcRE3Ncl59BSsMMaYGkXgqoR/YlgMu2Jh4iyco/CwAJg
 xdpiSM1eV6CCR2QNqdn+0LcuyLjQVRBQiydYyrzENwPu/HsiMj1GyP9xfh8QZ4u5DS
 rOs6z70EFu/xA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 18EC9C433E9; Wed, 26 Oct 2022 05:58:40 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 216625] [regression] GPU lockup on Radeon R7 Kaveri
Date: Wed, 26 Oct 2022 05:58:39 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: pierre-bugzilla@ossman.eu
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216625-2300-3whiQSvUqt@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216625-2300@https.bugzilla.kernel.org/>
References: <bug-216625-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216625

--- Comment #3 from Pierre Ossman (pierre-bugzilla@ossman.eu) ---
This is wrong, I checked the wrong lines in dnf's history:

> Last working system:
>=20
>   kernel-5.13.8-100.fc33.x86_64

The last working kernel is actually 5.17.12-100.fc34.x86_64. So if it's the
kernel it's likely 5.18 or 5.19 that regressed. I'll give 5.18.1 a spin.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
