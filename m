Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F09924A92E
	for <lists+dri-devel@lfdr.de>; Thu, 20 Aug 2020 00:22:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4693A6E861;
	Wed, 19 Aug 2020 22:22:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BB8C6E861
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Aug 2020 22:22:12 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: dri-devel@lists.freedesktop.org
Subject: [Bug 208947] amdgpu DisplayPort won't recognize all display modes
 after 5.9 merges
Date: Wed, 19 Aug 2020 22:22:11 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: ckane@colemankane.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-208947-2300-Grh0GknLve@https.bugzilla.kernel.org/>
In-Reply-To: <bug-208947-2300@https.bugzilla.kernel.org/>
References: <bug-208947-2300@https.bugzilla.kernel.org/>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

https://bugzilla.kernel.org/show_bug.cgi?id=208947

--- Comment #8 from Coleman Kane (ckane@colemankane.org) ---
Update - below is the finding from git bisect:

471c1dd9546df81d259664ac3e2ab0e99169f755 is the first bad commit
commit 471c1dd9546df81d259664ac3e2ab0e99169f755
Author: Reza Amini <Reza.Amini@amd.com>
Date:   Wed Jul 15 11:33:23 2020 -0400

    drm/amd/display: Allow asic specific FSFT timing optimization

    [Why]
    Each asic can optimize best based on its capabilities

    [How]
    Optimizing timing for a new pixel clock

    Signed-off-by: Reza Amini <Reza.Amini@amd.com>
    Reviewed-by: Anthony Koo <Anthony.Koo@amd.com>
    Acked-by: Eryk Brol <eryk.brol@amd.com>
    Signed-off-by: Alex Deucher <alexander.deucher@amd.com>

 drivers/gpu/drm/amd/display/dc/core/dc_stream.c    | 18 +++++++--------
 drivers/gpu/drm/amd/display/dc/dc_stream.h         |  4 ++--
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hwseq.c | 27 ++++++++++++++++++++++
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hwseq.h |  5 ++++
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_init.c  |  3 +++
 drivers/gpu/drm/amd/display/dc/dcn21/dcn21_init.c  |  3 +++
 drivers/gpu/drm/amd/display/dc/inc/hw_sequencer.h  |  5 ++++
 .../drm/amd/display/modules/freesync/freesync.c    |  5 +++-
 8 files changed, 57 insertions(+), 13 deletions(-)

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
