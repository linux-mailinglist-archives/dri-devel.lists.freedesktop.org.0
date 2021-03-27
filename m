Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 77BB534B58E
	for <lists+dri-devel@lfdr.de>; Sat, 27 Mar 2021 09:45:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFEF26E104;
	Sat, 27 Mar 2021 08:45:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 086356E104
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Mar 2021 08:45:06 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id F0ABA61A1A
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Mar 2021 08:45:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1616834705;
 bh=eIQYb3pjrI9mPlnEbldXvYuEmDw3Y9VIPw46Cz2ripA=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=Glfxh+RNA0BGJWKcWN6KXSHh+skjbezz/+SOCat1DHcnHhRvgirM58TIoc1Bwqmth
 Z3wjLQXCGIl8b4FzXWjNZeOvb3kJ9YAbmKl4MNLYlS0pI41tKwWVI+/N12raMVFa8k
 dH+d97+1O5Yuhsv37d8rogREvVAr7rrotflfdxRWcVFjG1Ls5RbjT95jcFs0C2vIVi
 gB6oF3jy4ThoWYO7mLF2oW62o3Gf25H8tbS+LqK5rIkPf9ZONHn+1duS1a0Mbuudmr
 qujGUW3YXHo4L3XtOUrFXgLswBqbdquDvgudna4DDX8Uzb5oH/sj34GSxMpz7PW2u/
 9v7gplUpuPoMA==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id EE4AF62AC6; Sat, 27 Mar 2021 08:45:04 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 203905] amdgpu:actual_brightness has unreal/wrong value
Date: Sat, 27 Mar 2021 08:45:04 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: antonyjr000@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-203905-2300-ijZbVWIJ8a@https.bugzilla.kernel.org/>
In-Reply-To: <bug-203905-2300@https.bugzilla.kernel.org/>
References: <bug-203905-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=203905

--- Comment #28 from Antony J.R (antonyjr000@gmail.com) ---
(In reply to Paulo Nascimento from comment #26)
> laptop: Lenovo Legion 5, amd ryzen 5 4600h
> Graphics:  Device-1: NVIDIA TU116M [GeForce GTX 1660 Ti Mobile] driver:
> nouveau
>            Device-2: Advanced Micro Devices [AMD/ATI] Renoir driver: amdgpu
> Kernel 5.11.6-1
> Manjaro 21.1
> 
> I have tried all suggested workarounds:
> - systemctl start systemd-backlight@backlight:amdgpu_bl0
> 
> - mkinitcpio with MODULES=(amdgpu)
> 
> - acpi_backlight=vendor
> 
> - acpi_backlight=video
> 
> - /usr/lib/systemd/systemd-backlight save backlight:amdgpu_bl0
>   /usr/lib/systemd/systemd-backlight load backlight:amdgpu_bl0
> 
> Even echo 10 >/sys/class/backlight/amdgpu_bl0/brightness doesn't change the
> brightness.
> 
> Any suggestions?

Please read the entire thread here ->
https://bugzilla.opensuse.org/show_bug.cgi?id=1180749

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
