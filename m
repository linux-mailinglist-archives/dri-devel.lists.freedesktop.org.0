Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F055E77D0AD
	for <lists+dri-devel@lfdr.de>; Tue, 15 Aug 2023 19:11:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D94410E088;
	Tue, 15 Aug 2023 17:11:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C72C10E088
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Aug 2023 17:11:37 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A37C860C41
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Aug 2023 17:11:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 16070C433C7
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Aug 2023 17:11:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1692119496;
 bh=aCUGqeoEV2KRwNqz/H5b7KiaTh2hBh/yesGG2fKtOg4=;
 h=From:To:Subject:Date:From;
 b=tVsHPmRsG7xBE1Nvd34qNU5niWfnbigZKRJa+8eAiZTXOoxUlQ33GTnooh15PRcrV
 XZT3qyjEx/mOQcic83msL0lFrXxSnYXX+YZqZQNFa5XGgPmn0YiFctqLZA6eBMriWq
 NHN5E1EAdcNUhz2BB5n8PmwYa6+1Eu1bD9oVECSPOq1+DXSsajz89VBADHd6wE7v7o
 UePa8div0ESlc805YSnkPIOAIAdA8PVwwPzxx7czQpcT0k9/ggummeK9YBSlJAQTGF
 93+hV5ZSz/3yOsbLN8vexDsnvyZoKC35VFeJG5JmG22SQS+mJqvOCp3VubRRyl7WWY
 vtAiETXKU8v7w==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id E84C5C53BC6; Tue, 15 Aug 2023 17:11:35 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 217797] New: [amdgpu/mm?] HSA_AMD_SVM=y causes/triggers PAT
 issues
Date: Tue, 15 Aug 2023 17:11:35 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: zaltys@natrix.lt
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression
Message-ID: <bug-217797-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D217797

            Bug ID: 217797
           Summary: [amdgpu/mm?] HSA_AMD_SVM=3Dy causes/triggers PAT issues
           Product: Drivers
           Version: 2.5
          Hardware: AMD
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P3
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: zaltys@natrix.lt
        Regression: No

I have a hunch this might be MM/HMM issue, but I am reporting this as amdgpu
bug just because problematic behavior is triggered by loading amdgpu, which=
 was
compiled with HSA_AMD_SVM=3Dy. I checked problematic behavior on kernels 6.=
4 and
6.5-rc6, however I have seen people saying it started with 5.14.

My system is on X99 platform with Intel Broadwell-E CPU. It has multiple GP=
Us:
AMD W6600 (which drives display) and NVIDIA RTX 3080 (used for compute and
vfio). iommu is on and not in PT mode. HSA_AMD_SVM=3Dy somehow messes PAT e=
ntries
for NVIDIA card. Example follows.

NVIDIA card has two relevant BARs:
Region 1: Memory at 380000000000 (64-bit, prefetchable) [size=3D16G]
Region 3: Memory at 380400000000 (64-bit, prefetchable) [size=3D32M]

example supposes "cat /sys/kernel/debug/x86/pat_memtype_list | grep 380" is
used check PAT entries.

1) fresh system start, amdgpu is loaded (blacklisting it prevents the issue=
),
NVIDIA card is deliberately not bound to any driver on boot. No PAT entries=
 for
it is visible - good.
2) card is bound to vfio-pci and passed to VM, multiple PAT entries are vis=
ible
- good.
3) VM is stopped, card is unbound from vfio-pci. This is where difference is
seen. If HSA_AMD_SVM=3Dn, then there is no PAT entries visible - good, howe=
ver
with HSA_AMD_SVM=3Dy two PAT entries remain - BAD. In addition, the amount =
of
these entries depend on how many times the card has been passed-through. It=
 is
like some clean up routine fails.

The above example is made to avoid requiring out of tree drivers for NVIDIA,
however same (and probably with less hassle) can be repeated with just boun=
ding
card to nvidia driver, running compute/render task, unbinding it and then
checking for left over PAT entries. This also shows it is not vfio-pci only
issue.

It looks benign at first, but in real use case that card has to be switched
from nvidia driver to vfio-pci and back without restarting the system. This=
 PAT
issue breaks it, because  left over PAT entries from one driver are not
compatible with the other. vfio-pci needs UC-, otherwise VM throws lots of
ioremap/memtype errors; and nvidia driver prefers WC entries for performance
reasons.

If amdgpu is just a trigger, and issue is in general MM part of kernel, ple=
ase
CC relevant people.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
