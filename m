Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7CE7482FDB
	for <lists+dri-devel@lfdr.de>; Mon,  3 Jan 2022 11:21:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97A8D8946E;
	Mon,  3 Jan 2022 10:20:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7F028929D
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Jan 2022 10:20:54 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5133460FD3
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Jan 2022 10:20:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B7FB7C36AF1
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Jan 2022 10:20:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1641205253;
 bh=YAm0fnAC/Zh8UIlp2wXzRJtqeD8qpsF8+/k+EtVpEvk=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=LyNIu/llfLhhW5Kh7PJvPN5PiDvZnopo4OggPP1G9P0bNbRYg6xMENpewhD3S/xGc
 w91JKC1ueefjgvshtfr9NRoGrqrpXcZ97Gf0tv9+48VkTY6gR1mPWMEQDbB4RdrV2f
 QWkE9Eb9a52aO4nvA37+8PkZcBm0Sa7NOYn5MwIgq9RP4OAfxSFDUs9gMhdk3Fx0sc
 1ZIXMWziN7O88ZPHl3j5mZGf9oNrxBEZ0PeD5KuCPcPb+/iUp8oK3Vo4AG4/HF4SL1
 4GYDWvfFGglx5okPmXl6/EHozvgaD286YGdhuOpFQHqbvM39FP+M5qMqe79LS9SDhC
 3xNrNHdpFPQrQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 9BAF2C05FF4; Mon,  3 Jan 2022 10:20:53 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 215436] admgpu: suspend and resuming from suspend don't work
Date: Mon, 03 Jan 2022 10:20:53 +0000
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
Message-ID: <bug-215436-2300-zE2BtsKuxf@https.bugzilla.kernel.org/>
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

--- Comment #13 from spasswolf@web.de ---
I added a some dev_info calls:

static int amdgpu_pmops_suspend(struct device *dev)
{
        struct drm_device *drm_dev =3D dev_get_drvdata(dev);
        struct amdgpu_device *adev =3D drm_to_adev(drm_dev);
        int r;

        if (amdgpu_acpi_is_s0ix_active(adev))
                adev->in_s0ix =3D true;
        adev->in_s3 =3D true;
        r =3D amdgpu_device_suspend(drm_dev, true);
        dev_info(adev->dev, "amdgpu_device_suspend(...) =3D %d\n", r);
        adev->in_s3 =3D false;
        if (r)
                return r;
        dev_info(adev->dev, "adev->in_s0ix =3D %d\n", adev->in_s0ix);
        if (!adev->in_s0ix)
                r =3D amdgpu_asic_reset(adev);
        return r;
}

which gives

Jan  3 11:13:40 lisa kernel: [   38.792335] amdgpu 0000:08:00.0: amdgpu:
amdgpu_device_suspend(...) =3D 0
Jan  3 11:13:40 lisa kernel: [   38.792341] amdgpu 0000:08:00.0: amdgpu:
adev->in_s0ix =3D 1

So the gpu is not actually reset ...

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
