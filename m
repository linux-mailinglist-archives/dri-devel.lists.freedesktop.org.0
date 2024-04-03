Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CFDC8968D1
	for <lists+dri-devel@lfdr.de>; Wed,  3 Apr 2024 10:35:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B61D112869;
	Wed,  3 Apr 2024 08:35:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="JSPYZoDe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9313911288D
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Apr 2024 08:35:42 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id A0E4DCE210D
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Apr 2024 08:35:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id DDAF5C433B1
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Apr 2024 08:35:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1712133339;
 bh=rPUhPxJzq/3ehhhDMa75WYQCK5E6aQGY7olC2rf0mLw=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=JSPYZoDei61chtaRe9HOLsZ//Vz/GSB2fuJKExok7OdhMoalB1cAM+QHtiuYM4HdK
 Rx48c0NUHPlnh0juH/qtgg3HGhwnoRfna11IYnmFfkAdH3jHUX+4C53myMX7QjDarL
 OTjlzyhepiDyebNFdVGGRu5hSSiTXt/LKwjWhyMyy9qmsVyKNJAQErlehdO705G0CZ
 bLHeEPgtHtpOm7VOGGNzpsWN2m/Cpgff5vDxtIRKYQ6PlAH8n/7oLBqiPIqGuMeqPL
 wSkn9di3ARDqaCTMToxXjVHF977eDTg+5cGi9ZNsIyneE/ecVyEQOiOJhZK7fI8E/g
 hDa5E9nBBup6A==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id D07D7C53BD9; Wed,  3 Apr 2024 08:35:39 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 119211] amdgpu disables fan by default
Date: Wed, 03 Apr 2024 08:35:39 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: stsp2@yandex.ru
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cf_kernel_version
Message-ID: <bug-119211-2300-u4eMqxsgFF@https.bugzilla.kernel.org/>
In-Reply-To: <bug-119211-2300@https.bugzilla.kernel.org/>
References: <bug-119211-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D119211

Stas Sergeev (stsp2@yandex.ru) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
     Kernel Version|4.5.5                       |6.7.7

--- Comment #18 from Stas Sergeev (stsp2@yandex.ru) ---
I figured out something very interesting
regarding this bug.

Writing 2 to pwm1_enable causes the
fan to rotate for about 10 seconds.
Note that the old value of pwm1_enable
is also 2, so it doesn't change, but
the mere fact of writing has an effect!

And this is not all!
Now if you periodically READ from pwm1,
then the fan doesn't stop! I can do:
while :; do cat /sys/class/hwmon/hwmon0/pwm1; sleep 1; done
And with this, the fan keeps rotating
forever! But if you stop that script
for something like 10 seconds, then
the fan stops and pwm1 reads always
return 0. You need to start again by
writing 2 to pwm1_enable (even if there
is already 2!), and quickly start reading
from pwm1, and you have your fan finally
rotating. :)
A bit of a hand-written fancontrol script. :)

Alex Deucher can you make any sense
out of that?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
