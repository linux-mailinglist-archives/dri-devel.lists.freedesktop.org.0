Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5505751FAEB
	for <lists+dri-devel@lfdr.de>; Mon,  9 May 2022 13:08:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3E1F10EC5E;
	Mon,  9 May 2022 11:08:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 847A610EC5E
 for <dri-devel@lists.freedesktop.org>; Mon,  9 May 2022 11:08:11 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6BF0261126
 for <dri-devel@lists.freedesktop.org>; Mon,  9 May 2022 11:08:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D62DFC385B0
 for <dri-devel@lists.freedesktop.org>; Mon,  9 May 2022 11:08:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652094489;
 bh=P4X5syCMbDJZpoHnFVkzUAou0Enp4YS/1KkIv0Hwq4s=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=gK5/57c6Ggu/Px3AAoNOydUBp3Fo+rRN9q5chjmkh1tFwUgJmZUQrH3C9BHfHlmJL
 Lxaa7KMT7m/HkrqHT/xLQ8JIemqwCkehqq/B3lbzefEs4dv4lR6VF+DIOOJmUXy9WE
 ab/6XXIhiXiEZW46C4B61TF0cGCF+ddehULMFnRNerkVAORtt1VG85L0ov1XweSeD2
 TnRMjpTbIcgUid5C4jhQKhUrpfYSZmsbtVDVucsD4yIbxzN8CLAx9tbDb3RqE2jnaA
 qyfwkFXzl2IReA2BAp/DkiQCdpyZPqDVCqRllGihJz7aAxO/xqaQ1DiJrurkvehBl8
 FJyPIwUcRD2kQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id BFA46C05FE2; Mon,  9 May 2022 11:08:09 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 214853] [amdgpu] UBSAN shows several null-ptr-deref in
 ../dc/bios/command_table2.c some array-index-out-of-bounds in
 ../dc/bios/bios_parser2.c and an invalid-load in ../amdgpu_dm/amdgpu_dm.c
Date: Mon, 09 May 2022 11:08:09 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: erhard_f@mailbox.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-214853-2300-m6TWENOmPV@https.bugzilla.kernel.org/>
In-Reply-To: <bug-214853-2300@https.bugzilla.kernel.org/>
References: <bug-214853-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D214853

--- Comment #3 from Erhard F. (erhard_f@mailbox.org) ---
Created attachment 300912
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D300912&action=3Dedit
kernel .config (kernel 5.18-rc6, AMD Ryzen 9 5950X)

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
