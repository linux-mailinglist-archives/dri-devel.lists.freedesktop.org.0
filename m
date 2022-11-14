Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 561A8628CD1
	for <lists+dri-devel@lfdr.de>; Tue, 15 Nov 2022 00:00:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5835010E340;
	Mon, 14 Nov 2022 23:00:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24C5B10E340
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Nov 2022 23:00:29 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 941376148C
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Nov 2022 23:00:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 01208C433C1
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Nov 2022 23:00:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1668466828;
 bh=JpNFOlmGvD8mvtcqfCgYhSxVIHsEXyxitdgS3I+4kOc=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=ufVkWRv7XQTaPXQXeRWQ9EfQZqOZ1dOT7NTHW09WPcHArlzMYYkyJtU406+HkQ4S1
 Q8C/uLEAGKZZHyFN2PiR/l9sukV+aj+kRes7L8ObhOUGE/8TiYj2Wxk/Ls56OMMcPE
 nFzAnC3Vapv1O5yxR5OzSbrdBrKiJgB3GVQhAOpE2WYlhgILMKkqubCZSortcX1HcU
 L6liuB3vO2I85zIhDkbARqIM4mx4JIzo7ZxoAVhDfrcqg1DQpA51FQ37FK21oMxhY4
 95/YX89fW4A5r3O0aE7YG7KWsxoWOxpq7i7PEOrWOV6cek9tDoKKpKjM8bZMfv5/gA
 wOogSBqQCG6FA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id DE798C433EA; Mon, 14 Nov 2022 23:00:27 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 216143] [bisected] garbled screen when starting X + dmesg
 cluttered with "[drm:amdgpu_cs_ioctl [amdgpu]] *ERROR* Failed in the
 dependencies handling -1431655766!"
Date: Mon, 14 Nov 2022 23:00:27 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: erhard_f@mailbox.org
X-Bugzilla-Status: REOPENED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-216143-2300-9PbjqUPuEs@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216143-2300@https.bugzilla.kernel.org/>
References: <bug-216143-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216143

--- Comment #17 from Erhard F. (erhard_f@mailbox.org) ---
Created attachment 303181
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D303181&action=3Dedit
kernel .config (kernel 6.1-rc5, AMD Ryzen 9 5950X)

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
