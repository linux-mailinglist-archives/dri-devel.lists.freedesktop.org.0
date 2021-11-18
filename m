Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B4BEE4554E5
	for <lists+dri-devel@lfdr.de>; Thu, 18 Nov 2021 07:51:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5EC76EE97;
	Thu, 18 Nov 2021 06:51:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C15606EE97
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Nov 2021 06:51:01 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 93CCC61A8B
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Nov 2021 06:51:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1637218261;
 bh=ZkU7naBYl6vg5CVl990hMyW8OMQh5FiLluYPzCdmCLs=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=mHaCp5QOiav5PDnS3TkWlFYnaE/Mtn9rv8z8COLnvnkO5rCg9f1wv3jvWxM+S0FJ7
 K9BtjXCx+4vRWYNbNA7vLFkJQccbFuongggFNGwt9VqEpdFZKU8AtHnJyXx2XOjSTA
 6lCWkSr9CRqXKsmbviTzP6bZjA4Mr9ZFPpizxy0A+E6jbo6bcrCMlacwCAygTEzAlM
 4fA6wwoJLbGeNN13ulF3TNb+faOfEcgvVoW1g616/NaFlUYEu4fFWqWyNgQnWS/nT6
 MkUwPjaxR886b1XNyL7rFsZLSpSdCBZN3IoOOxqSpz/hXJRsKmmOBFp0aTZapkjsEG
 4oz/nohCgyXtg==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 8AF0B60FC0; Thu, 18 Nov 2021 06:51:01 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 214991] VC4 DRM waiting for flip down makes UI freeze a while
 with kernel 5.15
Date: Thu, 18 Nov 2021 06:51:01 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: jhp@endlessos.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-214991-2300-VdQd7fvZMp@https.bugzilla.kernel.org/>
In-Reply-To: <bug-214991-2300@https.bugzilla.kernel.org/>
References: <bug-214991-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D214991

--- Comment #2 from Jian-Hong Pan (jhp@endlessos.org) ---
Created attachment 299625
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D299625&action=3Dedit
Full dmesg log with the v2 patch series "drm/vc4: kms: Misc fixes for HVS
commits"

Maxime sent v2 patch series at
https://www.spinics.net/lists/dri-devel/msg323342.html

System can boot into desktop environment now.  However, the UI still become
frozen  some times and shows the same error message:

[drm:drm_crtc_commit_wait] *ERROR* flip_done timed out
[drm:drm_atomic_helper_wait_for_flip_done] *ERROR* [CRTC:68:crtc-3] flip_do=
ne
timed out
[drm:drm_atomic_helper_wait_for_dependencies] *ERROR* [CRTC:68:crtc-3] comm=
it
wait timed out
[drm:drm_crtc_commit_wait] *ERROR* flip_done timed out
vc4-drm gpu: [drm] *ERROR* Timed out waiting for commit

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
