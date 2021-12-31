Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0733C4824BE
	for <lists+dri-devel@lfdr.de>; Fri, 31 Dec 2021 17:14:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E144789C27;
	Fri, 31 Dec 2021 16:14:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF66089C27
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Dec 2021 16:14:04 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id F08D5617A6
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Dec 2021 16:14:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 57AB8C36AEB
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Dec 2021 16:14:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1640967243;
 bh=VCQJ0gTyqKsjqojuxxxN4DHb3razLECaOrge161oXyk=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=cusn9LSdN0vFWknkRAPLbU5oASpnCy3Ifb4mzQiMc/CHpxpKWNwvoVkJseATZPlTn
 9QiQyhi+jY/7jhil3isKkOSRr+c2mGPAVwsYxZ6MLcVKTcyoAanP2N8S33nh5OQatC
 ncWOLOsI0gX3onHp2a7rT/iQcVoqg6rsbV7mLCzeUSYVpEq1HTh3S+OzrpO31akQsu
 chP6TErVXJ61QedW5KfaP0PMK/GHfz24W0wmAIfvTNBOpUXh5+mooKmsrdUe2jVN7R
 Ot/ZeNAyxZA+ZOuosUU2caCzClr3BWQK/lMyYtkw/zq5k4btXimBvTJ6LU+73FuutP
 hu7xj4KL1sIXQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 3FA14C05FCA; Fri, 31 Dec 2021 16:14:03 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 215436] admgpu: suspend and resuming from suspend don't work
Date: Fri, 31 Dec 2021 16:14:03 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: spasswolf@web.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-215436-2300-L15ibbR9Wq@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215436-2300@https.bugzilla.kernel.org/>
References: <bug-215436-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D215436

--- Comment #9 from spasswolf@web.de ---
get_reg_field_value(value, HPD0_DC_HPD_INT_STATUS, DC_HPD_SENSE)
is just a macro expanding to an inline function, i.e.
current_status =3D (value & HPD0_DC_HPD_INT_STATUS__DC_HPD_SENSE_MASK) >>
HPD0_DC_HPD_IN_STATUS__DC_HPD_SENSE__SHIFT;
with ..._MASK =3D 0x2 being 0x2 and ...__SHIFT =3D 0x1, problems seem to oc=
cur when
current_status !=3D 0.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
