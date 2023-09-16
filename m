Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E841D7A2DEA
	for <lists+dri-devel@lfdr.de>; Sat, 16 Sep 2023 06:24:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21A4A10E06B;
	Sat, 16 Sep 2023 04:24:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0C4010E06B
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Sep 2023 04:24:43 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 4021FCE2DB7
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Sep 2023 04:24:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 93583C433C7
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Sep 2023 04:24:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1694838279;
 bh=bzhFsYXAiPl7AigWUr6gSj4JDzv/kjrKOEtDFE0duYQ=;
 h=From:To:Subject:Date:From;
 b=Of3L4e9SF/dWIoOrWC+ogxsVyjXO0PTEU55xS0U1Pjz9b6vuH2YZ5N4clCpH6iBrL
 OV06kafCR7TtPt4JqvPsbiW3TdsOTPAswFPzmIMpYNIIm2vgO7KygzSaAXOc3BBFLs
 fKKVs1QRgJIbt3T40PWzywPQ1YScKM+kNkfy7yRulc0i5Vb6hJlmpIitc3sGhgS3Vg
 svIhPEymNpEReH+dREImpzCzlPNvU04hlCYSk9gw40cuDGp8XJRp7ob8hkdZx7dD74
 0xtS3AmWTIW6eF4wHFlLbk3G5LAMKmLMRQzLlOZOmxmG4qkwz0iJxTsXoqA2OQz3YD
 L4QKHceJs0gYQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 7D234C53BCD; Sat, 16 Sep 2023 04:24:39 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 217916] New: amdgpu: ring gfx_low timeout (Google Maps zooming)
Date: Sat, 16 Sep 2023 04:24:39 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: warren@togami.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression
Message-ID: <bug-217916-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D217916

            Bug ID: 217916
           Summary: amdgpu: ring gfx_low timeout (Google Maps zooming)
           Product: Drivers
           Version: 2.5
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P3
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: warren@togami.com
        Regression: No

kernel: [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring gfx_low timeout,
signaled seq=3D3002, emitted seq=3D3004=20
kernel: [drm:amdgpu_job_timedout [amdgpu]] *ERROR* Process information: pro=
cess
chromium-browse pid 4034 thread chromium-b:cs0 pid 4074
kernel: amdgpu 0000:05:00.0: amdgpu: GPU reset begin!
kernel: amdgpu 0000:05:00.0: amdgpu: MODE2 reset
kernel: amdgpu 0000:05:00.0: amdgpu: GPU reset succeeded, trying to resume

Thinkpad T14s Gen 2 AMD
AMD Ryzen 7 PRO 5850U with Radeon Graphics

Fedora 38
mesa-23.1.7-1.fc38.x86_64
chromium-116.0.5845.187-1.fc38.x86_64
Working versions: kernel-6.4.16
Broken versions:  kernel-6.5.2 and 6.5.3

Reproduce Procedure
1) Boot into kernel-6.5.2 or 6.5.3.
2) Run Chromium browser
3) maps.google.com
4) Search for an address. Plot a driving route.
5) Something about the map zooming causing the amdgpu crash. Sometimes it t=
akes
2-3 attempts for the crash to occur.

It does not crash with kernel-6.4.x.

https://fedorapeople.org/~wtogami/a/2023/KERNEL-6.5.3-amdgpu-crash3.log
full dmesg log

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
