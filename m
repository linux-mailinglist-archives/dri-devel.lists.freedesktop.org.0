Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 795054A7C6A
	for <lists+dri-devel@lfdr.de>; Thu,  3 Feb 2022 01:10:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4208A10E681;
	Thu,  3 Feb 2022 00:10:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C23CF10E67E
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Feb 2022 00:10:53 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 8775CB81038
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Feb 2022 00:10:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5DDDCC36AE3
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Feb 2022 00:10:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643847049;
 bh=GhTfssG+BnDFacTD9NcQJBtHuPtC97YDNph0OlmA/eI=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=ZK0ExrEffFyZb/Yos38xfU9KGFZwC1M1wkZJvQLU1ii4ny0ynN/3KYjpmYmiiPqDV
 ltJ0Rav3BIIpPrsxSN5OeKUqRYp/K8dpSkDCMkZyMUX0x6iU7S7jijCiYc3rKWv1cO
 qvwoR/lsHVHFc2Vx2CmjLFZj/bwwSi2RWVNGgezbFqkIJL0kQN/CVgvTb5YckOQkTA
 CNddqiaVrLLe/7NuOlk4h+8iivgfYW+gUERrIfyC2tAFgU7+VMVorTiTchhIBCpHsc
 r2hVOsA0YYoA2AzAmbjlckO9si/B54ScVXDVbXtGyotCa93N+E1A/7FSLB5uJsD8dW
 ITJUpaTkwFH6w==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 3E6A1C05FD5; Thu,  3 Feb 2022 00:10:49 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 215511] Dual monitor with amd 5700 causes system to hang at
 startup.
Date: Thu, 03 Feb 2022 00:10:49 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: pmestre@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-215511-2300-fUxHqFjNi2@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215511-2300@https.bugzilla.kernel.org/>
References: <bug-215511-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D215511

--- Comment #4 from Jose Mestre (pmestre@gmail.com) ---
0f591d17e36e08313b0c440b99b0e57b47e01a9a is the first bad commit
commit 0f591d17e36e08313b0c440b99b0e57b47e01a9a
Author: Angus Wang <angus.wang@amd.com>
Date:   Thu Dec 9 17:27:01 2021 -0500

    drm/amd/display: Changed pipe split policy to allow for multi-display p=
ipe
split

    commit ee2698cf79cc759a397c61086c758d4cc85938bf upstream.

    [WHY]
    Current implementation of pipe split policy prevents pipe split with
    multiple displays connected, which caused the MCLK speed to be stuck at
    max

    [HOW]
    Changed the pipe split policies so that pipe split is allowed for
    multi-display configurations

    Bug: https://gitlab.freedesktop.org/drm/amd/-/issues/1522
    Bug: https://gitlab.freedesktop.org/drm/amd/-/issues/1709
    Bug: https://gitlab.freedesktop.org/drm/amd/-/issues/1655
    Bug: https://gitlab.freedesktop.org/drm/amd/-/issues/1403

    Note this is a backport of this commit from amdgpu drm-next for 5.16.

    Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
    Reviewed-by: Aric Cyr <Aric.Cyr@amd.com>
    Acked-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
    Signed-off-by: Angus Wang <angus.wang@amd.com>
    Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
    Cc: stable@vger.kernel.org
    Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.c   | 2 +-
 drivers/gpu/drm/amd/display/dc/dcn21/dcn21_resource.c   | 2 +-
 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_resource.c   | 2 +-
 drivers/gpu/drm/amd/display/dc/dcn301/dcn301_resource.c | 2 +-
 drivers/gpu/drm/amd/display/dc/dcn302/dcn302_resource.c | 2 +-
 drivers/gpu/drm/amd/display/dc/dcn303/dcn303_resource.c | 2 +-
 drivers/gpu/drm/amd/display/dc/dcn31/dcn31_resource.c   | 2 +-
 7 files changed, 7 insertions(+), 7 deletions(-)

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
