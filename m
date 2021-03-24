Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A80773484F3
	for <lists+dri-devel@lfdr.de>; Wed, 24 Mar 2021 23:57:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A2236EABA;
	Wed, 24 Mar 2021 22:57:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A63F66EABA
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Mar 2021 22:57:25 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 7A03361A0A
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Mar 2021 22:57:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1616626645;
 bh=NpWEBT37qDOuiSCJUpDEL0W8gYSbLuFkvQ1VTsIkjOg=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=OwqtyFyMLF5Bb6AeBCoCldh3rwwJsKWZgEh+euCf/zhuqWhGksARqZ/8Z9hYIPTDv
 gyONEetmCopP+I1SrjoRl08iBusLqx6PJbNfrA28dT9+qQotH9hHOx8PyJwojJKMCT
 OdHOezD2awLtnWvxFr+b1YRC7fYDwluihnzmEQZQ4Zur36soSJHkfCTS24dbynhcic
 uXe2CJnjIaCUOh5vGG4lJAT436nACJtqrWqYVqc53Ca8wlBi2ov1BTmiEf9P0c2Ome
 gansWKYTHpEqbS9Bsxns+Luu1rXuN+e+I1kpDDPA8XNnNB5JWfL64H4Daj1jT1ZESo
 4BT6sFdKjNNzA==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 6807462AC2; Wed, 24 Mar 2021 22:57:25 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 212427] [AMDGPU] Multiple ttm_bo_release warnings
Date: Wed, 24 Mar 2021 22:57:25 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: rankincj@yahoo.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cf_regression
Message-ID: <bug-212427-2300-dze23BGeD4@https.bugzilla.kernel.org/>
In-Reply-To: <bug-212427-2300@https.bugzilla.kernel.org/>
References: <bug-212427-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=212427

Chris Rankin (rankincj@yahoo.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
         Regression|No                          |Yes

--- Comment #1 from Chris Rankin (rankincj@yahoo.com) ---
I am assuming that these warnings are all due to this one patch:

diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index 22073e77fdf9a..a76eb2c14e8c5 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -514,7 +514,7 @@ static void ttm_bo_release(struct kref *kref)
                 * shrinkers, now that they are queued for
                 * destruction.
                 */
-               if (bo->pin_count) {
+               if (WARN_ON(bo->pin_count)) {
                        bo->pin_count = 0;
                        ttm_bo_del_from_lru(bo);
                        ttm_bo_add_mem_to_lru(bo, &bo->mem);

which would imply that the only real difference between 5.11.8 and 5.11.9 is
"noise". Is this warning highlighting a real problem?

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
