Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E7C92482488
	for <lists+dri-devel@lfdr.de>; Fri, 31 Dec 2021 16:10:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B841089CB3;
	Fri, 31 Dec 2021 15:10:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34B6089CB3
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Dec 2021 15:10:53 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id DB22AB81D7D
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Dec 2021 15:10:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A6784C36AEC
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Dec 2021 15:10:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1640963450;
 bh=r3AhGrObIQiiVRtUM49x+0+W/Kd0BY+XDq2X3mDI1zQ=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=tNhw3RbowlXQ38NnCqedXLQ4Wt6fZOiprwsjysTqOve6EGW2Q5RPyGMW2fNfLl1df
 6Gw8sYZj1Gd21BB5mRs3NF+nq7hc18F+aDojEMxibfVi2BfVlVMSWnrERc2lXAzamJ
 JktzER7EOqz1jmic48MYw8aFs/VnfUL/zP27Uya20+iV7XsCesXwIm4FXz4lz7UMnu
 +JV089d24jHN75tnuy29SYIuRFI18iKN8nP+ZV5TxnxitRbvMd735F1+gSe04VnsNk
 85RxAIWe4pZtiVw4Oan5b4jJ7+CPYcl86b0y+gbEasDIPwnPwLfFr/UvQSgqL7TKFp
 vg/G9LXia5LqQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 887DBC05FC8; Fri, 31 Dec 2021 15:10:50 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 215436] admgpu: suspend and resuming from suspend don't work
Date: Fri, 31 Dec 2021 15:10:50 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: spasswolf@web.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-215436-2300-XpVkDfsMO0@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215436-2300@https.bugzilla.kernel.org/>
References: <bug-215436-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D215436

--- Comment #8 from spasswolf@web.de ---
Just did a bit of experimentation and changed dc_get_hpd_state_dcn21 (in
5.16-rc7) to

uint32_t dc_get_hpd_state_dcn21(struct irq_service *irq_service, enum
dc_irq_source source)
{
        const struct irq_source_info *info;
        uint32_t addr;
        uint32_t value;
        uint32_t current_status;

        info =3D find_irq_source_info(irq_service, source);
        if (!info)
                return 0;

        addr =3D info->status_reg;
        if (!addr)
                return 0;

        value =3D dm_read_reg(irq_service->ctx, addr);
        //current_status =3D
        //      get_reg_field_value(
        //              value,
        //              HPD0_DC_HPD_INT_STATUS,
        //              DC_HPD_SENSE);

        //return current_status;
        return 0;
}
This also leads to working suspend resume, the get_reg_field_value seems to
trigger the problems.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
