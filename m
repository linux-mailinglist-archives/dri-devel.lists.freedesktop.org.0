Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7F022E0DC3
	for <lists+dri-devel@lfdr.de>; Tue, 22 Dec 2020 18:16:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BF246E150;
	Tue, 22 Dec 2020 17:16:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D2246E150
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Dec 2020 17:16:43 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id F02842313F
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Dec 2020 17:16:42 +0000 (UTC)
Received: by pdx-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
 id EA46C8673A; Tue, 22 Dec 2020 17:16:42 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 210429] AMDGPU - DRM connector force-probe after DPMS causes
 monitor to reconnect
Date: Tue, 22 Dec 2020 17:16:42 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: jordanleppert@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-210429-2300-2b4QwvBvhp@https.bugzilla.kernel.org/>
In-Reply-To: <bug-210429-2300@https.bugzilla.kernel.org/>
References: <bug-210429-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=210429

--- Comment #2 from jordanleppert@gmail.com ---
Here are logs using Wayfire (a wlroots compositor), note the disconnect
immediately after modesetting. The DPMS sleep happened at 15:46:45, and the
wakeup at 15:46:54.

DD 22-12-20 15:46:45.685 - [backend/drm/drm.c:1075] Reallocating CRTCs
DD 22-12-20 15:46:45.686 - [backend/drm/drm.c:1086] State before reallocation:
DD 22-12-20 15:46:45.686 - [backend/drm/drm.c:1092]   'DP-1' crtc=0 state=3
desired_enabled=0
DD 22-12-20 15:46:45.686 - [backend/drm/drm.c:1092]   'DP-2' crtc=1 state=3
desired_enabled=1
DD 22-12-20 15:46:45.686 - [backend/drm/drm.c:1092]   'HDMI-A-1' crtc=-1
state=0 desired_enabled=0
DD 22-12-20 15:46:45.686 - [backend/drm/drm.c:1092]   'HDMI-A-2' crtc=-1
state=0 desired_enabled=0
DD 22-12-20 15:46:45.686 - [backend/drm/drm.c:1143] State after reallocation:
DD 22-12-20 15:46:45.686 - [backend/drm/drm.c:1150]   'DP-1' crtc=0 state=3
desired_enabled=0
DD 22-12-20 15:46:45.686 - [backend/drm/drm.c:1150]   'DP-2' crtc=1 state=3
desired_enabled=1
DD 22-12-20 15:46:45.686 - [backend/drm/drm.c:1150]   'HDMI-A-1' crtc=-1
state=0 desired_enabled=0
DD 22-12-20 15:46:45.686 - [backend/drm/drm.c:1150]   'HDMI-A-2' crtc=-1
state=0 desired_enabled=0
DD 22-12-20 15:46:45.719 - [backend/drm/drm.c:1075] Reallocating CRTCs
DD 22-12-20 15:46:45.719 - [backend/drm/drm.c:1086] State before reallocation:
DD 22-12-20 15:46:45.719 - [backend/drm/drm.c:1092]   'DP-1' crtc=0 state=3
desired_enabled=0
DD 22-12-20 15:46:45.719 - [backend/drm/drm.c:1092]   'DP-2' crtc=1 state=3
desired_enabled=0
DD 22-12-20 15:46:45.719 - [backend/drm/drm.c:1092]   'HDMI-A-1' crtc=-1
state=0 desired_enabled=0
DD 22-12-20 15:46:45.719 - [backend/drm/drm.c:1092]   'HDMI-A-2' crtc=-1
state=0 desired_enabled=0
DD 22-12-20 15:46:45.719 - [backend/drm/drm.c:1143] State after reallocation:
DD 22-12-20 15:46:45.719 - [backend/drm/drm.c:1150]   'DP-1' crtc=0 state=3
desired_enabled=0
DD 22-12-20 15:46:45.719 - [backend/drm/drm.c:1150]   'DP-2' crtc=1 state=3
desired_enabled=0
DD 22-12-20 15:46:45.719 - [backend/drm/drm.c:1150]   'HDMI-A-1' crtc=-1
state=0 desired_enabled=0
DD 22-12-20 15:46:45.719 - [backend/drm/drm.c:1150]   'HDMI-A-2' crtc=-1
state=0 desired_enabled=0
II 22-12-20 15:46:54.467 - [backend/drm/drm.c:793] connector DP-1: Modesetting
with '3840x2160@59997mHz'
DD 22-12-20 15:46:54.467 - [backend/drm/drm.c:679] connector DP-1: Initializing
renderer
II 22-12-20 15:46:54.483 - [backend/drm/drm.c:793] connector DP-2: Modesetting
with '3840x2160@59997mHz'
DD 22-12-20 15:46:54.483 - [backend/drm/drm.c:679] connector DP-2: Initializing
renderer
II 22-12-20 15:46:56.808 - [backend/drm/drm.c:1219] Scanning DRM connectors on
/dev/dri/card0
II 22-12-20 15:46:56.810 - [backend/drm/drm.c:1388] 'DP-2' disconnected
DD 22-12-20 15:46:56.907 - [backend/drm/drm.c:1075] Reallocating CRTCs
DD 22-12-20 15:46:56.907 - [backend/drm/drm.c:1086] State before reallocation:
DD 22-12-20 15:46:56.907 - [backend/drm/drm.c:1092]   'DP-1' crtc=0 state=3
desired_enabled=1
DD 22-12-20 15:46:56.907 - [backend/drm/drm.c:1092]   'DP-2' crtc=1 state=3
desired_enabled=0
DD 22-12-20 15:46:56.907 - [backend/drm/drm.c:1092]   'HDMI-A-1' crtc=-1
state=0 desired_enabled=0
DD 22-12-20 15:46:56.907 - [backend/drm/drm.c:1092]   'HDMI-A-2' crtc=-1
state=0 desired_enabled=0
DD 22-12-20 15:46:56.907 - [backend/drm/drm.c:1143] State after reallocation:
DD 22-12-20 15:46:56.907 - [backend/drm/drm.c:1150]   'DP-1' crtc=0 state=3
desired_enabled=1
DD 22-12-20 15:46:56.907 - [backend/drm/drm.c:1150]   'DP-2' crtc=1 state=3
desired_enabled=0
DD 22-12-20 15:46:56.907 - [backend/drm/drm.c:1150]   'HDMI-A-1' crtc=-1
state=0 desired_enabled=0
DD 22-12-20 15:46:56.907 - [backend/drm/drm.c:1150]   'HDMI-A-2' crtc=-1
state=0 desired_enabled=0
DD 22-12-20 15:46:56.907 - [backend/drm/drm.c:1049] connector DP-2:
De-allocating CRTC 1
DD 22-12-20 15:46:56.908 - [backend/drm/drm.c:1075] Reallocating CRTCs
DD 22-12-20 15:46:56.908 - [backend/drm/drm.c:1086] State before reallocation:
DD 22-12-20 15:46:56.908 - [backend/drm/drm.c:1092]   'DP-1' crtc=0 state=3
desired_enabled=1
DD 22-12-20 15:46:56.908 - [backend/drm/drm.c:1092]   'DP-2' crtc=-1 state=0
desired_enabled=0
DD 22-12-20 15:46:56.908 - [backend/drm/drm.c:1092]   'HDMI-A-1' crtc=-1
state=0 desired_enabled=0
DD 22-12-20 15:46:56.908 - [backend/drm/drm.c:1092]   'HDMI-A-2' crtc=-1
state=0 desired_enabled=0
DD 22-12-20 15:46:56.908 - [backend/drm/drm.c:1143] State after reallocation:
DD 22-12-20 15:46:56.908 - [backend/drm/drm.c:1150]   'DP-1' crtc=0 state=3
desired_enabled=1
DD 22-12-20 15:46:56.908 - [backend/drm/drm.c:1150]   'DP-2' crtc=-1 state=0
desired_enabled=0
DD 22-12-20 15:46:56.908 - [backend/drm/drm.c:1150]   'HDMI-A-1' crtc=-1
state=0 desired_enabled=0
DD 22-12-20 15:46:56.908 - [backend/drm/drm.c:1150]   'HDMI-A-2' crtc=-1
state=0 desired_enabled=0
DD 22-12-20 15:46:56.908 - [backend/drm/drm.c:1442] No connector for CRTC 49
II 22-12-20 15:46:57.102 - [backend/drm/drm.c:1219] Scanning DRM connectors on
/dev/dri/card0
II 22-12-20 15:46:57.102 - [backend/drm/drm.c:1388] 'DP-1' disconnected
DD 22-12-20 15:46:57.173 - [backend/drm/drm.c:1075] Reallocating CRTCs
DD 22-12-20 15:46:57.173 - [backend/drm/drm.c:1086] State before reallocation:
DD 22-12-20 15:46:57.173 - [backend/drm/drm.c:1092]   'DP-1' crtc=0 state=3
desired_enabled=0
DD 22-12-20 15:46:57.173 - [backend/drm/drm.c:1092]   'DP-2' crtc=-1 state=0
desired_enabled=0
DD 22-12-20 15:46:57.173 - [backend/drm/drm.c:1092]   'HDMI-A-1' crtc=-1
state=0 desired_enabled=0
DD 22-12-20 15:46:57.173 - [backend/drm/drm.c:1092]   'HDMI-A-2' crtc=-1
state=0 desired_enabled=0
DD 22-12-20 15:46:57.174 - [backend/drm/drm.c:1143] State after reallocation:
DD 22-12-20 15:46:57.174 - [backend/drm/drm.c:1150]   'DP-1' crtc=0 state=3
desired_enabled=0
DD 22-12-20 15:46:57.174 - [backend/drm/drm.c:1150]   'DP-2' crtc=-1 state=0
desired_enabled=0
DD 22-12-20 15:46:57.174 - [backend/drm/drm.c:1150]   'HDMI-A-1' crtc=-1
state=0 desired_enabled=0
DD 22-12-20 15:46:57.174 - [backend/drm/drm.c:1150]   'HDMI-A-2' crtc=-1
state=0 desired_enabled=0
DD 22-12-20 15:46:57.174 - [backend/drm/drm.c:1049] connector DP-1:
De-allocating CRTC 0
DD 22-12-20 15:46:57.174 - [backend/drm/drm.c:1075] Reallocating CRTCs
DD 22-12-20 15:46:57.174 - [backend/drm/drm.c:1086] State before reallocation:
DD 22-12-20 15:46:57.174 - [backend/drm/drm.c:1092]   'DP-1' crtc=-1 state=0
desired_enabled=0
DD 22-12-20 15:46:57.174 - [backend/drm/drm.c:1092]   'DP-2' crtc=-1 state=0
desired_enabled=0
DD 22-12-20 15:46:57.174 - [backend/drm/drm.c:1092]   'HDMI-A-1' crtc=-1
state=0 desired_enabled=0
DD 22-12-20 15:46:57.174 - [backend/drm/drm.c:1092]   'HDMI-A-2' crtc=-1
state=0 desired_enabled=0
DD 22-12-20 15:46:57.175 - [backend/drm/drm.c:1143] State after reallocation:
DD 22-12-20 15:46:57.175 - [backend/drm/drm.c:1150]   'DP-1' crtc=-1 state=0
desired_enabled=0
DD 22-12-20 15:46:57.175 - [backend/drm/drm.c:1150]   'DP-2' crtc=-1 state=0
desired_enabled=0
DD 22-12-20 15:46:57.175 - [backend/drm/drm.c:1150]   'HDMI-A-1' crtc=-1
state=0 desired_enabled=0
DD 22-12-20 15:46:57.175 - [backend/drm/drm.c:1150]   'HDMI-A-2' crtc=-1
state=0 desired_enabled=0

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
