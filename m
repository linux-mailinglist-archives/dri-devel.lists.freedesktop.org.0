Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BB13D33DE43
	for <lists+dri-devel@lfdr.de>; Tue, 16 Mar 2021 20:54:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CDC26E43B;
	Tue, 16 Mar 2021 19:54:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A88FF6E43B
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Mar 2021 19:54:23 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id A2CE764F6D
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Mar 2021 19:54:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1615924462;
 bh=jugSYkuUF5Iu9G68yhR+qj5uqEb4A4FX9tkjRtQH1Ig=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=kipaiB9ad+GporXfydvsUUgj5j8rb7HwoyUXt5NglZdrleKqphX3nNIF2rPy4+O0Y
 YcHbv8VlV0bi60aRQ4RWXWWZ+LM/FpsUspYV3wZItPXtNLwq/Mm1pV6iZR7PBmcDKi
 B/3YPP2YpuavLGVdSGkvqVktNbjdfejsxGjVfVu5JzHkLiVF7sKJC+r+Q18B5+C/Md
 NY5/gVGtkBT9SWTd6eFvuyrt55dj7QGn9VzYxucPQ353zEQIek+rUa4i6m3A+7aXgP
 M3+fenE+vICEbJpLSxaeaFTzu+zIpZve9wXRoFpQtJhHYtFxQVkwwx5nhghB99YS9S
 WD3yMZSnGdciA==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 9F6FE6536D; Tue, 16 Mar 2021 19:54:22 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 212293] [amdgpu] divide error: 0000 on resume from S3
Date: Tue, 16 Mar 2021 19:54:22 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: contact@scrumplex.net
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-212293-2300-PVdAilT90S@https.bugzilla.kernel.org/>
In-Reply-To: <bug-212293-2300@https.bugzilla.kernel.org/>
References: <bug-212293-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=212293

--- Comment #6 from Sefa Eyeoglu (contact@scrumplex.net) ---
Okay I tried to debug it by printing.

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 573cf17262da..8e6b890ad611 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -9271,6 +9271,8 @@ static int dm_check_crtc_cursor(struct drm_atomic_state
*state,
                return 0;
        }

+       printk("SCRUMPLEX_DEBUG %d %d %d %d", new_cursor_state->src_w,
new_cursor_state->src_h, new_primary_state->src_w, new_primary_state->src_h);
+
        cursor_scale_w = new_cursor_state->crtc_w * 1000 /
                         (new_cursor_state->src_w >> 16);
        cursor_scale_h = new_cursor_state->crtc_h * 1000 /
-- 
2.31.0


This adds my very professional printk, which outputs all values that are used
to divide in any way later.


While reproducing the issue I got the following output

[   89.850437] SCRUMPLEX_DEBUG 8388608 8388608 0 0


So some weird state is causing the src_w and src_h values of
"new_primary_state" to be 0.

That would explain the issue to me. Now I don't know enough about
drm_plane_state and drm_atomic_get_new_plane_state to say why this is like
this. But as with most of these kinds of issues. A simple condition check
beforehand would solve this issue.

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
