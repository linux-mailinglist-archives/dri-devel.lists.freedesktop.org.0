Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5A5A481458
	for <lists+dri-devel@lfdr.de>; Wed, 29 Dec 2021 16:10:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31D6410E17E;
	Wed, 29 Dec 2021 15:10:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BC3010E17D
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Dec 2021 15:10:34 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id CAC2CB817F3
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Dec 2021 15:10:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8480BC36AE9
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Dec 2021 15:10:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1640790631;
 bh=llZ2HgRsGO4lFRNvAFnOz3tHMwFRS2lXKEK0jfrEaQc=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=kdz7/v2h3qKfFxn0onIVW+hbh6C+XjLWHeO6BfN5W5/BUpWZUszAB13iqOom09mcd
 48ZYbre7xSrvkTSoEk6XelBgSCq0d/5CBjpslD+eQzwRRln6wCbL8BwnsWzbTo7P84
 UP0MbFrDUL0KJZfnqxsp+FlAa2vgSVguAl4VtMCZFyf97YRqZ+LFpRPGh9ttucO5eg
 uZbgib3mIBKkjjgFcvSCYlbygvJ3A/o9ezehcV4Yx7rT3A8NNi/w8V8oxgB6rLU8Fs
 cpmD9v0ZDO8bmXpSd0hNLhqHGockge187qRd89I16HE7mYQUGDp4D/f8sjczjv4UAX
 atMsHz3akhYAw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 6BA10C05FC8; Wed, 29 Dec 2021 15:10:31 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 215436] admgpu: suspend and resuming from suspend don't work
Date: Wed, 29 Dec 2021 15:10:31 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: alexdeucher@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-215436-2300-iXYwcAiofy@https.bugzilla.kernel.org/>
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

--- Comment #2 from Alex Deucher (alexdeucher@gmail.com) ---
Could you please help add some prints and confirm that the commit doesn't
change the code sequence in rn_update_clocks() especially for the following
part in suspend and wake sequence:
if (display_count =3D=3D 0 && !hpd_state) {
rn_vbios_smu_set_dcn_low_power_state(clk_mgr, DCN_PWR_STATE_LOW_POWER);
/* update power state */
clk_mgr_base->clks.pwr_state =3D DCN_PWR_STATE_LOW_POWER;
It would also be appreciated if you could print out the time that was spent=
 in
the function rn_update_clocks() with and w/o the commit.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
