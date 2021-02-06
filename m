Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D9501311B9E
	for <lists+dri-devel@lfdr.de>; Sat,  6 Feb 2021 06:34:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CA416E3DB;
	Sat,  6 Feb 2021 05:34:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 353096E3EF
 for <dri-devel@lists.freedesktop.org>; Sat,  6 Feb 2021 05:34:26 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id D777F64FB8
 for <dri-devel@lists.freedesktop.org>; Sat,  6 Feb 2021 05:34:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612589665;
 bh=+1hid2jatsqgNNvQstYiJ+cgVUnmLueMXb8HmINkQzA=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=j1k6AF6q6yJ2KssswplPSaGX8NGFdvlASl9xugRKCudydL/DGWfCeBsqxyqs+qi8n
 ayYxXz5KlztJGXyE1tEkTg3dWRB0vkbYDy3OcQVWiAHYvqFnXgBMxr0G6wSXlXAXZn
 rYBJVxOd9iwDR3r3xnNrQSkfGb/D0zx7PyRhbSFtuybYkn+zoQEr1MqwryPAwVnqZi
 0i+GrIod/wid4a5je+LOXlYBciuarlc1ndE1DdhE2z+RzrlNy0SL3Q52lYPdvoHkh/
 3HuFrHy/07aWoFnWitl/S2O6I3a0pf6x4QtBcYC5lefmtzKez8Ff5iyLEmzbrDSFd+
 3OnbY/RpYBGYQ==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id D339665346; Sat,  6 Feb 2021 05:34:25 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 201539] AMDGPU R9 390 automatic fan speed control in Linux
 4.19/4.20/5.0
Date: Sat, 06 Feb 2021 05:34:25 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: lkbugs@deegan.id.au
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-201539-2300-64xWQHBLA7@https.bugzilla.kernel.org/>
In-Reply-To: <bug-201539-2300@https.bugzilla.kernel.org/>
References: <bug-201539-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=201539

--- Comment #75 from michael (lkbugs@deegan.id.au) ---
An update. Now on 5.10.0-2-amd64.

Fresh boot, with amdgpu.dc=1, everything is mostly fine. pwm1_enable=2. Except
that after resuming from suspend, pwm1_enable=1 and pwm1=255, resulting in
maxxed out fans. Subsequently setting pwm1_enable=2 results in old buggy
behaviour (2000RPM until 96C). However, if I suspend and resume again, it
sometimes goes back to behaving!

amdgpu.dc=0 is a bit of a non-starter, as while fan speeds remain low, so does
performance.

In all cases temp1_crit and temp1_crit_hyst still have crazy values (104000000
and -273).

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
