Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 693EA313D32
	for <lists+dri-devel@lfdr.de>; Mon,  8 Feb 2021 19:22:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B08C36E16D;
	Mon,  8 Feb 2021 18:22:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B78B6E16D
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Feb 2021 18:22:10 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 2802764E8A
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Feb 2021 18:22:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612808530;
 bh=rOJ4oCkz7P/ppImf29ONzlygcpjq2nGh8etNOSAdy7A=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=Ne8wNXKL7Gf3lvjFdaPlo65+1foAEwiPD0IDwG4l78EtLtt8K53O2kgUS/vuUdW6w
 c1LXaPglbcCQtR5eiLCGEGvJj5gaHiIfIlGoD999ZF5uhkW07NNYglzlhq3SVBtZh5
 8oYhD4Mv1fwC87CSIXTk3S0qVSlTE3ApATcuex/PCOFV8l67pTTpVSPxdZWK9tA8Cv
 xDVuQ1eMVRKfTpdg+n3AIKh2I/6d3ry5bqjNXazQ9bUlu1mgCwExxXqPkaz+iQCFs9
 rQuFb0TsegCLtFNGGRYoMvO2Mp6FbUzSpJKE4I/JI5BwuEYoaLR9v3hf+p0L4ZHCkt
 n3zwN9HNpTrlw==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 21B0965328; Mon,  8 Feb 2021 18:22:10 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 202043] amdgpu: Vega 56 SCLK drops to 700 Mhz when undervolting
Date: Mon, 08 Feb 2021 18:22:09 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: maxijac@free.fr
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-202043-2300-WVBVtSZMnG@https.bugzilla.kernel.org/>
In-Reply-To: <bug-202043-2300@https.bugzilla.kernel.org/>
References: <bug-202043-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=202043

Bruno Jacquet (maxijac@free.fr) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |maxijac@free.fr

--- Comment #10 from Bruno Jacquet (maxijac@free.fr) ---
I am seeing the same behaviors with vega 64 on 5.4.96 (LTS) and also newer
kernels.

From my testing, it seems that amdgpu is simply not able to properly apply the
od table to the GPU. As soon as a clock change or voltage change is sent to
GPU, it disturbs the PM and it can only be fixed by rebooting.

(In reply to mistarzy from comment #6)
> Same issue here with Vega 64. From watching
> /sys/kernel/debug/dri/0/amdgpu_pm_info my conclusion is that basically
> driver gets max voltage applied even though tables in
> /sys/class/drm/card0/device/pp_od_clk_voltage suggest otherwise.

From my testing, I'd say that the voltages are just broken once a change to od
is sent to GPU.
After booting, if you monitor amdgpu_pm_info you will see some "uneven" VDD
values (825, 831, 918mV, etc...) which lets me think some kind of curve is
applied between voltage values of the initial sclk table.
Once any single change to the od table is sent, you will see that now the VDD
steps are just big chunks of the VDD steps, like incrementing by 50mV each up
to maximum value (1000, 1050, 1100, 1200mV...)

It seems using the voltage curve feature of pp_od_clk_voltage ("vc") _could_
fix the issue but it is not supported on cards older than VEGA20...
Not sure if this is a SW limitation in the driver or a GPU limitation.

Unexpectedly, the same effect can be seen when sending a full PP table.


(In reply to haro41 from comment #9)
> https://bugzilla.kernel.org/show_bug.cgi?id=205277
> 
> Should be fixed 5.4 release.

No, it's not fixed.

(In reply to mistarzy from comment #7)
> Best results performance wise had with following setup:
> 
> echo 275000000 >> /sys/class/drm/card0/device/hwmon/hwmon0/power1_cap
> echo "m 3 1100 1000" > /sys/class/drm/card0/device/pp_od_clk_voltage

Caution, if just changing the MCLK without committing (sending "c") it seems
the change is not actually sent to GPU even though all the other tables and
info files report the updated value.

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
