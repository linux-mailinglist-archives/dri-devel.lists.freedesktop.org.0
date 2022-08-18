Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AFCEE598BFB
	for <lists+dri-devel@lfdr.de>; Thu, 18 Aug 2022 20:49:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3639910F5CD;
	Thu, 18 Aug 2022 18:47:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC54010E1FE
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Aug 2022 18:47:09 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4DEB261762
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Aug 2022 18:47:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B4923C433B5
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Aug 2022 18:47:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1660848428;
 bh=X5GdThkHlv77XcaA2spesAqwTcn2YGPOOkslNAukgx0=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=mBIJWu3bmvUovCiVfc+F9Jr0oAlaunbAALTECqXtFTuXogGvSsusvPHDPmztR+oHy
 DV5bjqvElySm4/Woy/ZYqH/0lHUy2VgOjRqNhNG4csBQDkzrcm7Rd7y8n6tjeQkmz6
 3zZD+/nU66Hp2vdYcnXP16A7BFndj+4eZUz9Le1Fvuco37RobUe6VBAXLMk/uWeQCi
 7fLtRjFZXQpX9ONlneaPbhZogBuqIe19cjLQ4P8sXaq4GeTxBVX68c+fkbl3Yva1u9
 E/HXkHsazrsx0eGj/AvCWPL5tk+FyJSPoS5v9fSoBAmAT3rkohH2Rmp5LnAHrRzdF6
 8T/zcdOdT3zyw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 9815FC433E9; Thu, 18 Aug 2022 18:47:08 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 216376] AMDGPU: display output disables and quickly reenables
 when switching AVR into/from standby doing HDMI passthrough
Date: Thu, 18 Aug 2022 18:47:08 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: low
X-Bugzilla-Who: jlp.bugs@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216376-2300-IENq6mihAX@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216376-2300@https.bugzilla.kernel.org/>
References: <bug-216376-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216376

--- Comment #4 from Jure Repinc (jlp.bugs@gmail.com) ---
If I got it right, the hotplug events are all posted via udev? If so, is it
correct to use "udevadm monitor --environment --udev" to see these events
posted to userspace? Or is there somethign better? Just trying to make the =
best
sense out of it to try making a workaround and gather as much relevant
information to report a good bug/feature request with correct info to KDE
developers.


If I use "udevadm monitor --environment --udev" I get the output:

udevadm monitor --environment --udev
monitor will print the received events for:
UDEV - the event which udev sends out after rule processing


< switching AVR from on to standby mode >


UDEV  [35121.304457] change=20=20
/devices/pci0000:00/0000:00:01.0/0000:01:00.0/drm/card0 (drm)
ACTION=3Dchange
DEVPATH=3D/devices/pci0000:00/0000:00:01.0/0000:01:00.0/drm/card0
SUBSYSTEM=3Ddrm
HOTPLUG=3D1
CONNECTOR=3D74
DEVNAME=3D/dev/dri/card0
DEVTYPE=3Ddrm_minor
SEQNUM=3D12043
USEC_INITIALIZED=3D4651406
ID_PATH=3Dpci-0000:01:00.0
ID_PATH_TAG=3Dpci-0000_01_00_0
ID_FOR_SEAT=3Ddrm-pci-0000_01_00_0
MAJOR=3D226
MINOR=3D0
DEVLINKS=3D/dev/dri/by-path/pci-0000:01:00.0-card
TAGS=3D:uaccess:master-of-seat:seat:
CURRENT_TAGS=3D:uaccess:master-of-seat:seat:

UDEV  [35124.216717] change=20=20
/devices/pci0000:00/0000:00:01.0/0000:01:00.0/drm/card0 (drm)
ACTION=3Dchange
DEVPATH=3D/devices/pci0000:00/0000:00:01.0/0000:01:00.0/drm/card0
SUBSYSTEM=3Ddrm
HOTPLUG=3D1
CONNECTOR=3D74
DEVNAME=3D/dev/dri/card0
DEVTYPE=3Ddrm_minor
SEQNUM=3D12044
USEC_INITIALIZED=3D4651406
ID_PATH=3Dpci-0000:01:00.0
ID_PATH_TAG=3Dpci-0000_01_00_0
ID_FOR_SEAT=3Ddrm-pci-0000_01_00_0
MAJOR=3D226
MINOR=3D0
DEVLINKS=3D/dev/dri/by-path/pci-0000:01:00.0-card
TAGS=3D:uaccess:master-of-seat:seat:
CURRENT_TAGS=3D:uaccess:master-of-seat:seat:


< switching AVR from standby to on mode >


UDEV  [35155.373681] change=20=20
/devices/pci0000:00/0000:00:01.0/0000:01:00.0/drm/card0 (drm)
ACTION=3Dchange
DEVPATH=3D/devices/pci0000:00/0000:00:01.0/0000:01:00.0/drm/card0
SUBSYSTEM=3Ddrm
HOTPLUG=3D1
CONNECTOR=3D74
DEVNAME=3D/dev/dri/card0
DEVTYPE=3Ddrm_minor
SEQNUM=3D12048
USEC_INITIALIZED=3D4651406
ID_PATH=3Dpci-0000:01:00.0
ID_PATH_TAG=3Dpci-0000_01_00_0
ID_FOR_SEAT=3Ddrm-pci-0000_01_00_0
MAJOR=3D226
MINOR=3D0
DEVLINKS=3D/dev/dri/by-path/pci-0000:01:00.0-card
TAGS=3D:uaccess:master-of-seat:seat:
CURRENT_TAGS=3D:uaccess:master-of-seat:seat:

UDEV  [35158.196252] change=20=20
/devices/pci0000:00/0000:00:01.0/0000:01:00.0/drm/card0 (drm)
ACTION=3Dchange
DEVPATH=3D/devices/pci0000:00/0000:00:01.0/0000:01:00.0/drm/card0
SUBSYSTEM=3Ddrm
HOTPLUG=3D1
CONNECTOR=3D74
DEVNAME=3D/dev/dri/card0
DEVTYPE=3Ddrm_minor
SEQNUM=3D12049
USEC_INITIALIZED=3D4651406
ID_PATH=3Dpci-0000:01:00.0
ID_PATH_TAG=3Dpci-0000_01_00_0
ID_FOR_SEAT=3Ddrm-pci-0000_01_00_0
MAJOR=3D226
MINOR=3D0
DEVLINKS=3D/dev/dri/by-path/pci-0000:01:00.0-card
TAGS=3D:uaccess:master-of-seat:seat:
CURRENT_TAGS=3D:uaccess:master-of-seat:seat:

UDEV  [35158.953569] change=20=20
/devices/pci0000:00/0000:00:01.0/0000:01:00.0/drm/card0 (drm)
ACTION=3Dchange
DEVPATH=3D/devices/pci0000:00/0000:00:01.0/0000:01:00.0/drm/card0
SUBSYSTEM=3Ddrm
HOTPLUG=3D1
CONNECTOR=3D74
DEVNAME=3D/dev/dri/card0
DEVTYPE=3Ddrm_minor
SEQNUM=3D12050
USEC_INITIALIZED=3D4651406
ID_PATH=3Dpci-0000:01:00.0
ID_PATH_TAG=3Dpci-0000_01_00_0
ID_FOR_SEAT=3Ddrm-pci-0000_01_00_0
MAJOR=3D226
MINOR=3D0
DEVLINKS=3D/dev/dri/by-path/pci-0000:01:00.0-card
TAGS=3D:uaccess:master-of-seat:seat:
CURRENT_TAGS=3D:uaccess:master-of-seat:seat:

UDEV  [35161.036327] change=20=20
/devices/pci0000:00/0000:00:01.0/0000:01:00.0/drm/card0 (drm)
ACTION=3Dchange
DEVPATH=3D/devices/pci0000:00/0000:00:01.0/0000:01:00.0/drm/card0
SUBSYSTEM=3Ddrm
HOTPLUG=3D1
CONNECTOR=3D74
DEVNAME=3D/dev/dri/card0
DEVTYPE=3Ddrm_minor
SEQNUM=3D12051
USEC_INITIALIZED=3D4651406
ID_PATH=3Dpci-0000:01:00.0
ID_PATH_TAG=3Dpci-0000_01_00_0
ID_FOR_SEAT=3Ddrm-pci-0000_01_00_0
MAJOR=3D226
MINOR=3D0
DEVLINKS=3D/dev/dri/by-path/pci-0000:01:00.0-card
TAGS=3D:uaccess:master-of-seat:seat:
CURRENT_TAGS=3D:uaccess:master-of-seat:seat:

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
