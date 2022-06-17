Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B690454FF78
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jun 2022 23:45:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F174410E166;
	Fri, 17 Jun 2022 21:45:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC42810E166
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jun 2022 21:45:15 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 4AD5DB8282A
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jun 2022 21:45:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0EAFAC3411F
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jun 2022 21:45:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1655502313;
 bh=/6aiUG9hAkzZk/W4tkA0mMSMw/ssH5hu+xGJGCfjtp4=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=dv+bfjCRZ8sHDfzzRZjuUI2phQa1LSKOAgM2EgGtfKNDuBIDa3ah2TlKLEx9dQVc/
 hzZ1OnMTTaUCNRxZXcN09kLJXSHFRrMh6pD67XdaotSRg2zayvqlFuc5hTGpKxLReD
 T57D6hQ+E+pxNLNYtGZtN1ccK+50gHGlSaEcUH4cO8at7xUzVvb3fjeI/FHBqF1e2e
 f6xRVp5tkjtBt0e2GIHeUh9iNJ8XP5MnIZPQmVbunIkQgAB18egdk1/I6tG9Hn7PFI
 Vcg6sGbOkf5w6emkl0rmi1kNwe8q9O2rIAJaE7Ef6MWzsOa51plM4Nnn06GboPCM9t
 TERHhTRXWcC3A==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id F0AE9C05FD5; Fri, 17 Jun 2022 21:45:12 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 216143] [bisected] garbled screen when starting X + dmesg
 cluttered with "[drm:amdgpu_cs_ioctl [amdgpu]] *ERROR* Failed in the
 dependencies handling -1431655766!"
Date: Fri, 17 Jun 2022 21:45:12 +0000
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
Message-ID: <bug-216143-2300-2eahUEA8GK@https.bugzilla.kernel.org/>
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

--- Comment #1 from Erhard F. (erhard_f@mailbox.org) ---
Created attachment 301197
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D301197&action=3Dedit
kernel .config (kernel 5.19-rc2, AMD Ryzen 9 5950X)

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
