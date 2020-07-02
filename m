Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 76EF8212CBD
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jul 2020 21:03:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7641D6E060;
	Thu,  2 Jul 2020 19:03:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 523FE6E060
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Jul 2020 19:03:50 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: dri-devel@lists.freedesktop.org
Subject: [Bug 207901] Nouveau: In a 4 monitor setup, 1-2 displays remains
 black after boot
Date: Thu, 02 Jul 2020 19:03:49 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: lyude@redhat.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-207901-2300-EAZlplY29q@https.bugzilla.kernel.org/>
In-Reply-To: <bug-207901-2300@https.bugzilla.kernel.org/>
References: <bug-207901-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=207901

--- Comment #22 from Lyude Paul (lyude@redhat.com) ---
Hi! Sorry this took me a little bit to reply to. So-it looks like we did indeed
fix the i2c timeout issue that I was seeing on your board, so the next
suspicious thing in your log seems to be the fact one of your DP ports (DP-7 in
particular) appears to think it's being continuously hotplugged:

[   90.996867] nouveau 0000:01:00.0: DRM: unplugged DP-7
[   91.191704] [drm:drm_add_display_info [drm]] non_desktop set to 0
[   91.191711] [drm:drm_add_display_info [drm]] HDMI: DVI dual 0, max TMDS
clock 300000 kHz
[   91.297638] [drm:drm_dp_dpcd_access [drm_kms_helper]] Too many retries,
giving up. First error: -110
[   91.297642] [drm:drm_helper_hpd_irq_event [drm_kms_helper]]
[CONNECTOR:73:DP-4] status updated from connected to connected
[   91.493173] [drm:drm_add_display_info [drm]] non_desktop set to 0
[   91.493179] [drm:drm_add_display_info [drm]] HDMI: DVI dual 0, max TMDS
clock 300000 kHz
[   91.599120] [drm:drm_dp_dpcd_access [drm_kms_helper]] Too many retries,
giving up. First error: -110
[   91.599123] [drm:drm_helper_hpd_irq_event [drm_kms_helper]]
[CONNECTOR:76:DP-5] status updated from connected to connected
[   91.599335] nouveau 0000:01:00.0: DRM: display: 4x540000 dpcd 0x12
[   91.599336] nouveau 0000:01:00.0: DRM: encoder: 4x810000
[   91.599336] nouveau 0000:01:00.0: DRM: maximum: 4x540000
[   91.605980] [drm:drm_add_display_info [drm]] non_desktop set to 0
[   91.605986] [drm:drm_add_display_info [drm]] HDMI: DVI dual 0, max TMDS
clock 0 kHz
[   91.606300] [drm:drm_helper_hpd_irq_event [drm_kms_helper]]
[CONNECTOR:79:DP-6] status updated from connected to connected
[   91.606518] nouveau 0000:01:00.0: DRM: display: 4x540000 dpcd 0x12
[   91.606519] nouveau 0000:01:00.0: DRM: encoder: 4x810000
[   91.606519] nouveau 0000:01:00.0: DRM: maximum: 4x540000
[   91.613389] [drm:drm_add_display_info [drm]] non_desktop set to 0
[   91.613394] [drm:drm_add_display_info [drm]] HDMI: DVI dual 0, max TMDS
clock 0 kHz
[   91.613722] [drm:drm_helper_hpd_irq_event [drm_kms_helper]]
[CONNECTOR:82:DP-7] status updated from connected to connected
[   91.614016] nouveau 0000:01:00.0: DRM: plugged DP-7

What kind of setup do you have your monitors hooked up through? Are they on any
laptop docks/standalone MST hubs, do they go through any video adaptors, what
models/brands and what kind of connectors do they use, etc.

As well, do you think you can grab another log from your system but using:

log_buf_len=50M drm.debug=0x116 nouveau.debug=disp=trace

(include the full log from your boot if you can and don't trim it, since it's
likely going to be a big log)

I have a feeling one of your MST devices is doing some weird out-of-spec
behavior that we might need to teach nouveau to handle

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
