Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A1A6151211
	for <lists+dri-devel@lfdr.de>; Mon,  3 Feb 2020 22:48:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53AE66E447;
	Mon,  3 Feb 2020 21:48:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DA766E447
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Feb 2020 21:48:53 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: dri-devel@lists.freedesktop.org
Subject: [Bug 206393] amdgpu: garbled screen after resume
Date: Mon, 03 Feb 2020 21:48:53 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: bjo@nord-west.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-206393-2300-YvtB89E2Zn@https.bugzilla.kernel.org/>
In-Reply-To: <bug-206393-2300@https.bugzilla.kernel.org/>
References: <bug-206393-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=206393

--- Comment #5 from Bjoern Franke (bjo@nord-west.org) ---
Bisected to
1ea8751bd28d1ec2b36a56ec6bc1ac28903d09b4 is the first bad commit
commit 1ea8751bd28d1ec2b36a56ec6bc1ac28903d09b4
Author: Noah Abradjian <noah.abradjian@amd.com>
Date:   Fri Sep 27 16:30:57 2019 -0400

    drm/amd/display: Make clk mgr the only dto update point

    [Why]

    * Clk Mgr DTO update point did not cover all needed updates, as it included
a
      check for plane_state which does not exist yet when the updater is called
on
      driver startup
    * This resulted in another update path in the pipe programming sequence,
based
      on a dppclk update flag
    * However, this alternate path allowed for stray DTO updates, some of which
would
      occur in the wrong order during dppclk lowering and cause underflow

    [How]

    * Remove plane_state check and use of plane_res.dpp->inst, getting rid
      of sequence dependencies (this results in extra dto programming for
unused
      pipes but that doesn't cause issues and is a small cost)
    * Allow DTOs to be updated even if global clock is equal, to account for
      edge case exposed by diags tests
    * Remove update_dpp_dto call in pipe programming sequence (leave update to
      dppclk_control there, as that update is necessary and shouldn't occur in
clk
      mgr)
    * Remove call to optimize_bandwidth when committing state, as it is not
needed
      and resulted in sporadic underflows even with other fixes in place

    Signed-off-by: Noah Abradjian <noah.abradjian@amd.com>
    Reviewed-by: Jun Lei <Jun.Lei@amd.com>
    Acked-by: Leo Li <sunpeng.li@amd.com>
    Signed-off-by: Alex Deucher <alexander.deucher@amd.com>

 .../gpu/drm/amd/display/dc/clk_mgr/dcn20/dcn20_clk_mgr.c   | 14 +++++++++-----
 drivers/gpu/drm/amd/display/dc/clk_mgr/dcn21/rn_clk_mgr.c  |  3 ++-
 drivers/gpu/drm/amd/display/dc/core/dc.c                   |  4 ----
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hwseq.c         |  8 +-------
 4 files changed, 12 insertions(+), 17 deletions(-)

In contrast to #205915 it's not "fixable" via setting
dpm_force_performance_level to high or low.

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
