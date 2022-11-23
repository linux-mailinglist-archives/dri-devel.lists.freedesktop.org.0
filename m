Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B84DE63637A
	for <lists+dri-devel@lfdr.de>; Wed, 23 Nov 2022 16:27:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79C0710E577;
	Wed, 23 Nov 2022 15:27:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DFA610E577
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Nov 2022 15:27:15 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id ED0D2B820FE
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Nov 2022 15:27:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A66ABC43144
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Nov 2022 15:27:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1669217232;
 bh=6G3HlKjouKwKXFMzgLCPn6LkLiAS0HzsmxR8j+rizYQ=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=kBHW6vBiYiisPxDtT5OdyJbzzT7Xf0MyyOJMkmevMLBS7JjeZxljVsvP5uOAfKEXY
 FAkB0JIMlTmxVSaGMs2EaRdWjdM2qv3gb5RE73JWWQnrYZa5mZzMD7LhHeHUH3A0Kl
 7NJPIEci7r6ipkUf1Z9BU9QU8Fc0+lfzFULL+oMAI8xWXR40i+p1b7nmzDTwuqF4Uq
 fqanbhYWnoIX/tjOXLmAIDCBZKciqcg+xc0pepHcZGpqZjZdyislyNNxek+yCb9f4J
 B97udPkNJi3wohsm5IDcCA0pGYPjXtZx52aSEp6ldcQw7czWghMNtAna4eQX5aJvdi
 VeYgA2tTFQuhA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 95486C433E9; Wed, 23 Nov 2022 15:27:12 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 216727] Failure to wake up from suspend to RAM
Date: Wed, 23 Nov 2022 15:27:12 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: martin.tk@gmx.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216727-2300-bZqx4NNvJ0@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216727-2300@https.bugzilla.kernel.org/>
References: <bug-216727-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216727

--- Comment #3 from Martin (martin.tk@gmx.com) ---
(In reply to Alex Deucher from comment #1)
> Does this patch help?
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/
> ?id=3D8d4de331f1b24a22d18e3c6116aa25228cf54854

I think it helped.

I booted yesterday, managed to trigger OOM killer twice and suspended and
resumed three times.

I'm still getting those kind errors in the log:

kernfs: can not remove 'threshold_limit', no directory

but I think those can be something else.

Thank you.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
