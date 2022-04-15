Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 13883502DAC
	for <lists+dri-devel@lfdr.de>; Fri, 15 Apr 2022 18:20:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A6D910E1E6;
	Fri, 15 Apr 2022 16:20:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A088710E1E6
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Apr 2022 16:20:42 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 42201B82CCB
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Apr 2022 16:20:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E4D74C385A6
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Apr 2022 16:20:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650039639;
 bh=6l19fl5+1dovjCaQb+ed4UYGLN727asg6MSKrNIYGV0=;
 h=From:To:Subject:Date:From;
 b=szzVOLfeBiK3mi4tvPROYZ1tnaxPhNQCh9eoDrJIYxwaq3mI29wY8+DuEi3ldncDT
 LblcdtSldnimX+5F6qoV5D3MY1hSF6WrHiBb4KFS65c0bLZ5ONIFpNDXXEuDEZ5Gv/
 0FJjvZ0SekjCyAp8VJynMq/ZfvuF1HkCh/UexRE6TtIyzRAijXMJpr504X1KG4KhT2
 jYa4BgxgErsjiB6cfmSHwucBSQzYXRleKGHjpdHt3SSs5m8GKUZh/ocuXTnhCa7SUA
 MmlIXWgEYaW47FxEcYu6yqVeJmodzz4pCz8H4BwYDeYA/eJ73ISQWEf1CR4yqqkt9l
 2urpUYq6vCA9Q==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id C9182C05FD6; Fri, 15 Apr 2022 16:20:39 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 215839] New: distorted video playback with hybrid GPU
 (DRI_PRIME=1, Radeon HD 6470M and Intel-GPU)
Date: Fri, 15 Apr 2022 16:20:39 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: kolAflash@kolahilft.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression
Message-ID: <bug-215839-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D215839

            Bug ID: 215839
           Summary: distorted video playback with hybrid GPU (DRI_PRIME=3D1,
                    Radeon HD 6470M and Intel-GPU)
           Product: Drivers
           Version: 2.5
    Kernel Version: 5.15.28
          Hardware: All
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: kolAflash@kolahilft.de
        Regression: No

At least Kodi and VLC show garbage when being run with DRI_PRIME=3D1

I guess this is either a bug in the "radeon" kernel module or in Mesa3D /
Gallium.



Hardware:
HP Notebook
Product: LR294EA#ABD
Model: Pavilion g6-1024sg
CPU + integrated graphics: Intel=C2=AE Core=E2=84=A2 i5 ("i915" driver)
Dedicated GPU: Radeon HD 6470M ("radeon" driver)
https://icecat.biz/de-at/p/hp/lr294ea/pavilion-notebooks-0886111633067-g6-1=
024sg-8025113.html

OS:
Tested Debian-11 (Linux-5.10.106)
manjaro-xfce-21.2.5-minimal-220314-linux515.iso (Linux-5.15.28)
(both running X)

$ cat /sys/kernel/debug/vgaswitcheroo/switch
0:DIS: :DynOff:0000:01:00.0
1:IGD:+:Pwr:0000:00:02.0

Console output (both VLC and Kodi):
radeon: The kernel rejected CS, see dmesg for more information (-22).

dmesg:
[ 2210.372308] radeon 0000:01:00.0: evergreen_surface_check_linear_aligned:=
214
texture pitch 1920 invalid must be aligned with 256
[ 2210.372320] radeon 0000:01:00.0: evergreen_cs_track_validate_texture:829
texture invalid 0x1dfc3bc1 0x10000437 0x0b200000 0x00000000 0x00000000
0x80020001
[ 2210.372327] [drm:radeon_cs_ioctl [radeon]] *ERROR* Invalid command strea=
m !



I connected an external full HD (1920x1080) monitor and disabled the notebo=
oks
internal monitor via xrandr.
(especially in Kodi you may not be able to reproduce slow rendering without=
 an
1920x1080 monitor)
(I want to use the notebook as media computer for my TV)

When running Kodi-19.4 or VLC-3.0.17.3 without specific settings, full HD
(1920x1080 H264) videos don't render smoothly.
On Debian-11 additionally Firefox-ESR-91.8 also becomes slow (all CPU cores
under heavy load) when playing full HD videos with JavaScript controls.
Try these:
https://www.ardmediathek.de/video/seehund-puma-und-co/fuenf-mann-ueber-bord=
-215/das-erste/Y3JpZDovL2Rhc2Vyc3RlLmRlL3NlZWh1bmQsIHB1bWEgJmFtcDsgY28uLzI1=
MDdkNTZlLWI0ZjYtNDAxNS1iYTI1LTE1N2FjOWNjZTE3NA
https://pdvideosdaserste-a.akamaihd.net/int/2021/06/10/6528b8d0-72d0-45b4-9=
e7c-29dce5bb796a/1920-1_917111.mp4
(caution: baby seals shown compete hard with baby kittens ;-))
In Kodi install the "ARDundZDF" add-on from repo.kodinerds.net and open:
ARDundZDF -> TV-Livestreams -> =C3=9Cberregional (second option) -> Das Ers=
te ->
1920x1080



To solve this for Firefox I simply added "export DRI_PRIME=3D1" to ~/.profi=
le
Now Firefox-ESR-91.8 on Debian-11 works fine!
But the issue wasn't fixed for Kodi and VLC. Instead they now show complete
garbage :-(

For VLC I was able to nail down the problem:
When running VLC without specific settings, video output "OpenGL" and decod=
ing
via "VA-API" (without DRM) are being chosen.
So when running VLC with these settings and with DRI_PRIME=3D1 the output is
distorted.

So for VLC the workaround is pretty easy:
Choose any other video decoder (VDPAU, "VA-API video decoder via DRM" or si=
mply
"Disable").
In this case the video will playback fine and smooth with and without setti=
ng
DRI_PRIME=3D1.
Some other video output methods like "XVideo output (XCB)" also solve the
problem while keeping VA-API as video decoder. Actually I also reported a b=
ug
to VLC about the questionable default settings:
https://code.videolan.org/videolan/vlc/-/issues/26831

Until now I found no solution for Kodi!



=3D Notes =3D

ffplay renders smoothly without further settings. (with and without
DRI_PRIME=3D1)

Maybe related:
https://bugzilla.kernel.org/show_bug.cgi?id=3D89331

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
