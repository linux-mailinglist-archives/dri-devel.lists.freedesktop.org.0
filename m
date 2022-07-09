Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B1DE756C78D
	for <lists+dri-devel@lfdr.de>; Sat,  9 Jul 2022 08:33:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A66689341;
	Sat,  9 Jul 2022 06:32:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D4C389048
 for <dri-devel@lists.freedesktop.org>; Sat,  9 Jul 2022 06:32:42 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id D4D89B82A55
 for <dri-devel@lists.freedesktop.org>; Sat,  9 Jul 2022 06:32:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8F11EC3411C
 for <dri-devel@lists.freedesktop.org>; Sat,  9 Jul 2022 06:32:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1657348359;
 bh=gvy4SLBVj33Tk1IL9x1gs0LzzhxmoBRlHVB35UbRY+0=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=fCDAyOnCojaWQh+bBZp+ujYkT79tStjpqyWsNFJ4fZj7nueZR3xD1GgfZDwZntGlO
 ZxJyvu8omfFc0k8T8Sz/o+SnnCpVCOYcd4J/f1BCWbouqMDWQ8okzel1ytU8sugfLY
 3/HCcDPz+ZALTVoajco7B68BYCIJF9F6AO28d+n4xfNYgpU5Flrwh0vFfqCX2FZIpR
 cW4L2GPCBIwSi3eIz27tvMR9YoI04NIaTMs/jwwfGCSdypL4NQ0XlyNTjKHoAJuOsR
 pe+h5qx0Q3JbDDb4P2FZUx1U6wUVun7r2b6tYUb9X88kNYlYTW58lEPnqq/G6RG/NA
 eKn+tDIwG+DRw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 79E31CC13B6; Sat,  9 Jul 2022 06:32:39 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 216224] AMDGPU fails to reset RX 480 after Ring GFX timeout
Date: Sat, 09 Jul 2022 06:32:39 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: happysmash27@protonmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-216224-2300-RhvvzTF3sj@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216224-2300@https.bugzilla.kernel.org/>
References: <bug-216224-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216224

--- Comment #3 from happysmash27@protonmail.com ---
Created attachment 301377
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D301377&action=3Dedit
GPU crash 2022-05-24

Was most likely from lolMiner and on kernel 5.17.4, as I upgraded to 5.18.0=
 on
the same day as this log was produced, most likely via SSH to take advantag=
e of
the reboot opportunity.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
