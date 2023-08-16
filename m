Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 56D9377E7EC
	for <lists+dri-devel@lfdr.de>; Wed, 16 Aug 2023 19:55:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D363A10E39C;
	Wed, 16 Aug 2023 17:54:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2263B10E398
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Aug 2023 17:54:51 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5FC8A61244
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Aug 2023 17:54:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C7121C433C7
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Aug 2023 17:54:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1692208489;
 bh=5OOVsJVVKlODD3I4L7yW4iRl4tm0O85KX0p/UzMEgx4=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=MwW+lpOKZgoKT/KQOOXHVRCToW9uBEEQJf0oPMLpGPYZJAH9ij67J/1kWNIxptg4M
 +sG0UDXC+tSjxtW3+AbQNwCDBczTmWtm/sKaPIecOK3TgRmDOvkFDa8yA76m/bFgoe
 H2RK3k6cCdAJaWB6Ix2289+8Dcr7nSDErpGn3inc7gR0owCHP8s783tU7aLMn5kkxW
 3jYti9h+xy2X2yzNo4MTEr042Q73ZnD6QjccHWW56EjiUeL6MCz48QgL0zRHG7NrI+
 8pe02Lll22VdwCxk8ijCnQpIoAl9Ym8aNfSAp8jVB0kYAF9wTA1NuvJWWqkU0Mqg18
 ZP6pd4M8obF0Q==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id AB535C53BD3; Wed, 16 Aug 2023 17:54:49 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 217664] Laptop doesnt wake up from suspend mode.
Date: Wed, 16 Aug 2023 17:54:49 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: ACPI
X-Bugzilla-Component: Power-Sleep-Wake
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: alexdeucher@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-217664-2300-J1x9TM5zfe@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217664-2300@https.bugzilla.kernel.org/>
References: <bug-217664-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D217664

--- Comment #12 from Alex Deucher (alexdeucher@gmail.com) ---
The display mux is a switch that controls what GPU the built in display is
routed to (dGPU or APU).  If it's not set correctly it can route the displa=
y to
the wrong GPU.  AFAIK, it should be handled by the nvidia driver.  I'm not =
sure
if they support this or not on Linux.  You indicated that the system is sti=
ll
accessible after resume, can you get the dmesg output after resume?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
