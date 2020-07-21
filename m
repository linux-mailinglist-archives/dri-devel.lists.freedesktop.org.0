Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 75226228A27
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jul 2020 22:49:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A3B089458;
	Tue, 21 Jul 2020 20:49:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9ED2B89458
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jul 2020 20:49:37 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: dri-devel@lists.freedesktop.org
Subject: [Bug 207383] [Regression] 5.7 amdgpu/polaris11 gpf:
 amdgpu_atomic_commit_tail
Date: Tue, 21 Jul 2020 20:49:36 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: kees@outflux.net
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-207383-2300-MmvKSPXnF9@https.bugzilla.kernel.org/>
In-Reply-To: <bug-207383-2300@https.bugzilla.kernel.org/>
References: <bug-207383-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=207383

--- Comment #77 from Kees Cook (kees@outflux.net) ---
(Midair collision... you saw the same about the structure layout as I did.
Here's my comment...)

(In reply to mnrzk from comment #30)
> I've been looking at this bug for a while now and I'll try to share what
> I've found about it.
> 
> In some conditions, when amdgpu_dm_atomic_commit_tail calls
> dm_atomic_get_new_state, dm_atomic_get_new_state returns a struct
> dm_atomic_state* with an garbage context pointer.

It looks like when amdgpu_dm_atomic_commit_tail() walks the private objects
list with for_each_new_private_obj_in_state(), it'll return the first object's
state when the function pointer tables match. This is a struct dm_atomic_state
allocation, which is 16 bytes:

struct drm_private_state {
        struct drm_atomic_state *state;
};

struct dm_atomic_state {
        struct drm_private_state base;
        struct dc_state *context;
};

If struct dm_atomic_state is being freed early, this would match the behavior
seen: before 3202fa62f, .base.state would be overwritten with a freelist
pointer. After 3202fa62f, .context will be overwritten.

In looking for all "kfree(.*state" patterns in
drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c, I see a few suspicious
things, maybe. dm_crtc_destroy_state() and amdgpu_dm_connector_funcs_reset() do
an explicit kfree(state) -- should they use dm_atomic_destroy_state() instead?
Or nothing at all, since I'd expect "state" to be managed by the drm layer via
the .atomic_destroy_state callback?


> I've also found that this bug exclusively occurs when commit_work is on the
> workqueue. After forcing drm_atomic_helper_commit to run all of the commits
> without adding to the workqueue and running the OS, the issue seems to have
> disappeared. The system was stable for at least 1.5 hours before I manually
> shut it down (meanwhile it has usually crashed within 30-45 minutes).

Is this the async call to "commit_work" in drm_atomic_helper_commit()?

There's a big warning in there:

        /*
         * Everything below can be run asynchronously without the need to grab
         * any modeset locks at all under one condition: It must be guaranteed
         * that the asynchronous work has either been cancelled (if the driver
         * supports it, which at least requires that the framebuffers get
         * cleaned up with drm_atomic_helper_cleanup_planes()) or completed
         * before the new state gets committed on the software side with
         * drm_atomic_helper_swap_state().
         ...

I'm not sure how to determine if amdgpu_dm.c is doing this correctly?

I can't tell what can interfere with drm_atomic_helper_commit() -- I would
guess the race is between that and something else causing a kfree(), but I
don't know the APIs here at all...

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
