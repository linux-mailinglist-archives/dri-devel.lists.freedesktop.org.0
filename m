Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C059D217F6
	for <lists+dri-devel@lfdr.de>; Fri, 17 May 2019 13:58:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD2B0898AF;
	Fri, 17 May 2019 11:58:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id B076E898A8
 for <dri-devel@lists.freedesktop.org>; Fri, 17 May 2019 11:58:27 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id A5F4C72167; Fri, 17 May 2019 11:58:27 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110701] GPU faults in in Unigine Valley 1.0
Date: Fri, 17 May 2019 11:58:27 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Mesa
X-Bugzilla-Component: Drivers/Gallium/radeonsi
X-Bugzilla-Version: git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: eero.t.tamminen@intel.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 qa_contact
Message-ID: <bug-110701-502@http.bugs.freedesktop.org/>
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Content-Type: multipart/mixed; boundary="===============1602207337=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1602207337==
Content-Type: multipart/alternative; boundary="15580943070.13a1A388.31709"
Content-Transfer-Encoding: 7bit


--15580943070.13a1A388.31709
Date: Fri, 17 May 2019 11:58:27 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110701

            Bug ID: 110701
           Summary: GPU faults in in Unigine Valley 1.0
           Product: Mesa
           Version: git
          Hardware: Other
                OS: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Drivers/Gallium/radeonsi
          Assignee: dri-devel@lists.freedesktop.org
          Reporter: eero.t.tamminen@intel.com
        QA Contact: dri-devel@lists.freedesktop.org

Setup:
- FullHD monitor (through HDMI KVM)
- HadesCanyon KBL i7-8809G ([AMD/ATI] Vega [Radeon RX Vega M] (rev c0))
- Ubuntu 18.04
- drm-tip git kernel v5.1
- Last VegaM firmware from kernel git
- X server git version
- Unigine Valley 1.0
- Mesa:
OpenGL renderer string: AMD VEGAM (DRM 3.32.0, 5.1.0, LLVM 7.0.0)
OpenGL core profile version string: 4.5 (Core Profile) Mesa 19.2.0-devel
(git-d65b160e6a)

Test-cases:
* Several runs of:
  bin/valley_x64 -project_name Valley -data_path ../ -engine_config
../data/valley_1.0.cfg -system_script valley/unigine.cpp -video_app opengl
-sound_app null -video_mode -1 -video_fullscreen 1 -video_multisample 0
-video_width 1920 -video_height 1080 -extern_define
,BENCHMARK,RELEASE,LANGUAGE_EN,QUALITY_HIGH=20

Expected outcome:
* No GPU issues (same as earlier, e.g. with yesterday's Mesa a9cef4f0e5)

Actual outcome:
* On last of 3 runs:
-----------------------------------------------
[  451.020091] amdgpu 0000:01:00.0: GPU fault detected: 147 0x0b618802 for
process valley_x64 pid 2048 thread valley_x64:cs0 pid 2066
[  451.020093] amdgpu 0000:01:00.0:   VM_CONTEXT1_PROTECTION_FAULT_ADDR=20=
=20
0x00044F6C
[  451.020093] amdgpu 0000:01:00.0:   VM_CONTEXT1_PROTECTION_FAULT_STATUS
0x06188002
[  451.020095] amdgpu 0000:01:00.0: VM fault (0x02, vmid 3, pasid 32772) at
page 282476, read from 'TC0' (0x54433000) (392)
[  451.020101] amdgpu 0000:01:00.0: GPU fault detected: 147 0x0b610402 for
process valley_x64 pid 2048 thread valley_x64:cs0 pid 2066
[  451.020102] amdgpu 0000:01:00.0:   VM_CONTEXT1_PROTECTION_FAULT_ADDR=20=
=20
0x00000000
[  451.020102] amdgpu 0000:01:00.0:   VM_CONTEXT1_PROTECTION_FAULT_STATUS
0x0608400C
[  451.020103] amdgpu 0000:01:00.0: VM fault (0x0c, vmid 3, pasid 32772) at
page 0, read from 'TC5' (0x54433500) (132)
[  451.020109] amdgpu 0000:01:00.0: GPU fault detected: 147 0x0b698402 for
process valley_x64 pid 2048 thread valley_x64:cs0 pid 2066
[  451.020110] amdgpu 0000:01:00.0:   VM_CONTEXT1_PROTECTION_FAULT_ADDR=20=
=20
0x00000002
[  451.020110] amdgpu 0000:01:00.0:   VM_CONTEXT1_PROTECTION_FAULT_STATUS
0x0618800C
[  451.020111] amdgpu 0000:01:00.0: VM fault (0x0c, vmid 3, pasid 32772) at
page 2, read from 'TC0' (0x54433000) (392)
[  451.020468] amdgpu 0000:01:00.0: GPU fault detected: 147 0x0ac90802 for
process valley_x64 pid 2048 thread valley_x64:cs0 pid 2066
[  451.020469] amdgpu 0000:01:00.0:   VM_CONTEXT1_PROTECTION_FAULT_ADDR=20=
=20
0x00000000
[  451.020470] amdgpu 0000:01:00.0:   VM_CONTEXT1_PROTECTION_FAULT_STATUS
0x06104002
[  451.020471] amdgpu 0000:01:00.0: VM fault (0x02, vmid 3, pasid 32772) at
page 0, read from 'TC3' (0x54433300) (260)
[  451.020476] amdgpu 0000:01:00.0: GPU fault detected: 147 0x00108402 for
process valley_x64 pid 2048 thread valley_x64:cs0 pid 2066
[  451.020477] amdgpu 0000:01:00.0:   VM_CONTEXT1_PROTECTION_FAULT_ADDR=20=
=20
0x00046DD2
[  451.020477] amdgpu 0000:01:00.0:   VM_CONTEXT1_PROTECTION_FAULT_STATUS
0x06088002
[  451.020478] amdgpu 0000:01:00.0: VM fault (0x02, vmid 3, pasid 32772) at
page 290258, read from 'TC4' (0x54433400) (136)
[  451.020484] amdgpu 0000:01:00.0: GPU fault detected: 147 0x0ad90402 for
process valley_x64 pid 2048 thread valley_x64:cs0 pid 2066
[  451.020484] amdgpu 0000:01:00.0:   VM_CONTEXT1_PROTECTION_FAULT_ADDR=20=
=20
0x000460A8
[  451.020485] amdgpu 0000:01:00.0:   VM_CONTEXT1_PROTECTION_FAULT_STATUS
0x06008002
[  451.020486] amdgpu 0000:01:00.0: VM fault (0x02, vmid 3, pasid 32772) at
page 286888, read from 'TC6' (0x54433600) (8)
[  451.020491] amdgpu 0000:01:00.0: GPU fault detected: 147 0x0c380402 for
process valley_x64 pid 2048 thread valley_x64:cs0 pid 2066
[  451.020492] amdgpu 0000:01:00.0:   VM_CONTEXT1_PROTECTION_FAULT_ADDR=20=
=20
0x00046A0F
[  451.020493] amdgpu 0000:01:00.0:   VM_CONTEXT1_PROTECTION_FAULT_STATUS
0x06104002
[  451.020494] amdgpu 0000:01:00.0: VM fault (0x02, vmid 3, pasid 32772) at
page 289295, read from 'TC3' (0x54433300) (260)
[  451.020499] amdgpu 0000:01:00.0: GPU fault detected: 147 0x0ac98402 for
process valley_x64 pid 2048 thread valley_x64:cs0 pid 2066
[  451.020500] amdgpu 0000:01:00.0:   VM_CONTEXT1_PROTECTION_FAULT_ADDR=20=
=20
0x00045EAA
[  451.020500] amdgpu 0000:01:00.0:   VM_CONTEXT1_PROTECTION_FAULT_STATUS
0x06108002
[  451.020501] amdgpu 0000:01:00.0: VM fault (0x02, vmid 3, pasid 32772) at
page 286378, read from 'TC2' (0x54433200) (264)
[  451.020507] amdgpu 0000:01:00.0: GPU fault detected: 147 0x0ed88802 for
process valley_x64 pid 2048 thread valley_x64:cs0 pid 2066
[  451.020507] amdgpu 0000:01:00.0:   VM_CONTEXT1_PROTECTION_FAULT_ADDR=20=
=20
0x000454BD
[  451.020508] amdgpu 0000:01:00.0:   VM_CONTEXT1_PROTECTION_FAULT_STATUS
0x06108002
[  451.020509] amdgpu 0000:01:00.0: VM fault (0x02, vmid 3, pasid 32772) at
page 283837, read from 'TC2' (0x54433200) (264)
[  451.020514] amdgpu 0000:01:00.0: GPU fault detected: 147 0x0be80402 for
process valley_x64 pid 2048 thread valley_x64:cs0 pid 2066
[  451.020515] amdgpu 0000:01:00.0:   VM_CONTEXT1_PROTECTION_FAULT_ADDR=20=
=20
0x0004732D
[  451.020516] amdgpu 0000:01:00.0:   VM_CONTEXT1_PROTECTION_FAULT_STATUS
0x06088002
[  451.020516] amdgpu 0000:01:00.0: VM fault (0x02, vmid 3, pasid 32772) at
page 291629, read from 'TC4' (0x54433400) (136)
[  451.025291] amdgpu 0000:01:00.0: IH ring buffer overflow (0x0008D420,
0x00006CE0, 0x0000D430)
[  451.521948] [drm] Fence fallback timer expired on ring sdma0
-----------------------------------------------

This is only time I've seen this so far -> it's possible that it requires
specific Mesa & kernel version.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15580943070.13a1A388.31709
Date: Fri, 17 May 2019 11:58:27 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body><table border=3D"1" cellspacing=3D"0" cellpadding=3D"8">
        <tr>
          <th>Bug ID</th>
          <td><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - GPU faults in in Unigine Valley 1.0"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110701">110701</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>GPU faults in in Unigine Valley 1.0
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>Mesa
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>git
          </td>
        </tr>

        <tr>
          <th>Hardware</th>
          <td>Other
          </td>
        </tr>

        <tr>
          <th>OS</th>
          <td>All
          </td>
        </tr>

        <tr>
          <th>Status</th>
          <td>NEW
          </td>
        </tr>

        <tr>
          <th>Severity</th>
          <td>normal
          </td>
        </tr>

        <tr>
          <th>Priority</th>
          <td>medium
          </td>
        </tr>

        <tr>
          <th>Component</th>
          <td>Drivers/Gallium/radeonsi
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>dri-devel&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Reporter</th>
          <td>eero.t.tamminen&#64;intel.com
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>dri-devel&#64;lists.freedesktop.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Setup:
- FullHD monitor (through HDMI KVM)
- HadesCanyon KBL i7-8809G ([AMD/ATI] Vega [Radeon RX Vega M] (rev c0))
- Ubuntu 18.04
- drm-tip git kernel v5.1
- Last VegaM firmware from kernel git
- X server git version
- Unigine Valley 1.0
- Mesa:
OpenGL renderer string: AMD VEGAM (DRM 3.32.0, 5.1.0, LLVM 7.0.0)
OpenGL core profile version string: 4.5 (Core Profile) Mesa 19.2.0-devel
(git-d65b160e6a)

Test-cases:
* Several runs of:
  bin/valley_x64 -project_name Valley -data_path ../ -engine_config
../data/valley_1.0.cfg -system_script valley/unigine.cpp -video_app opengl
-sound_app null -video_mode -1 -video_fullscreen 1 -video_multisample 0
-video_width 1920 -video_height 1080 -extern_define
,BENCHMARK,RELEASE,LANGUAGE_EN,QUALITY_HIGH=20

Expected outcome:
* No GPU issues (same as earlier, e.g. with yesterday's Mesa a9cef4f0e5)

Actual outcome:
* On last of 3 runs:
-----------------------------------------------
[  451.020091] amdgpu 0000:01:00.0: GPU fault detected: 147 0x0b618802 for
process valley_x64 pid 2048 thread valley_x64:cs0 pid 2066
[  451.020093] amdgpu 0000:01:00.0:   VM_CONTEXT1_PROTECTION_FAULT_ADDR=20=
=20
0x00044F6C
[  451.020093] amdgpu 0000:01:00.0:   VM_CONTEXT1_PROTECTION_FAULT_STATUS
0x06188002
[  451.020095] amdgpu 0000:01:00.0: VM fault (0x02, vmid 3, pasid 32772) at
page 282476, read from 'TC0' (0x54433000) (392)
[  451.020101] amdgpu 0000:01:00.0: GPU fault detected: 147 0x0b610402 for
process valley_x64 pid 2048 thread valley_x64:cs0 pid 2066
[  451.020102] amdgpu 0000:01:00.0:   VM_CONTEXT1_PROTECTION_FAULT_ADDR=20=
=20
0x00000000
[  451.020102] amdgpu 0000:01:00.0:   VM_CONTEXT1_PROTECTION_FAULT_STATUS
0x0608400C
[  451.020103] amdgpu 0000:01:00.0: VM fault (0x0c, vmid 3, pasid 32772) at
page 0, read from 'TC5' (0x54433500) (132)
[  451.020109] amdgpu 0000:01:00.0: GPU fault detected: 147 0x0b698402 for
process valley_x64 pid 2048 thread valley_x64:cs0 pid 2066
[  451.020110] amdgpu 0000:01:00.0:   VM_CONTEXT1_PROTECTION_FAULT_ADDR=20=
=20
0x00000002
[  451.020110] amdgpu 0000:01:00.0:   VM_CONTEXT1_PROTECTION_FAULT_STATUS
0x0618800C
[  451.020111] amdgpu 0000:01:00.0: VM fault (0x0c, vmid 3, pasid 32772) at
page 2, read from 'TC0' (0x54433000) (392)
[  451.020468] amdgpu 0000:01:00.0: GPU fault detected: 147 0x0ac90802 for
process valley_x64 pid 2048 thread valley_x64:cs0 pid 2066
[  451.020469] amdgpu 0000:01:00.0:   VM_CONTEXT1_PROTECTION_FAULT_ADDR=20=
=20
0x00000000
[  451.020470] amdgpu 0000:01:00.0:   VM_CONTEXT1_PROTECTION_FAULT_STATUS
0x06104002
[  451.020471] amdgpu 0000:01:00.0: VM fault (0x02, vmid 3, pasid 32772) at
page 0, read from 'TC3' (0x54433300) (260)
[  451.020476] amdgpu 0000:01:00.0: GPU fault detected: 147 0x00108402 for
process valley_x64 pid 2048 thread valley_x64:cs0 pid 2066
[  451.020477] amdgpu 0000:01:00.0:   VM_CONTEXT1_PROTECTION_FAULT_ADDR=20=
=20
0x00046DD2
[  451.020477] amdgpu 0000:01:00.0:   VM_CONTEXT1_PROTECTION_FAULT_STATUS
0x06088002
[  451.020478] amdgpu 0000:01:00.0: VM fault (0x02, vmid 3, pasid 32772) at
page 290258, read from 'TC4' (0x54433400) (136)
[  451.020484] amdgpu 0000:01:00.0: GPU fault detected: 147 0x0ad90402 for
process valley_x64 pid 2048 thread valley_x64:cs0 pid 2066
[  451.020484] amdgpu 0000:01:00.0:   VM_CONTEXT1_PROTECTION_FAULT_ADDR=20=
=20
0x000460A8
[  451.020485] amdgpu 0000:01:00.0:   VM_CONTEXT1_PROTECTION_FAULT_STATUS
0x06008002
[  451.020486] amdgpu 0000:01:00.0: VM fault (0x02, vmid 3, pasid 32772) at
page 286888, read from 'TC6' (0x54433600) (8)
[  451.020491] amdgpu 0000:01:00.0: GPU fault detected: 147 0x0c380402 for
process valley_x64 pid 2048 thread valley_x64:cs0 pid 2066
[  451.020492] amdgpu 0000:01:00.0:   VM_CONTEXT1_PROTECTION_FAULT_ADDR=20=
=20
0x00046A0F
[  451.020493] amdgpu 0000:01:00.0:   VM_CONTEXT1_PROTECTION_FAULT_STATUS
0x06104002
[  451.020494] amdgpu 0000:01:00.0: VM fault (0x02, vmid 3, pasid 32772) at
page 289295, read from 'TC3' (0x54433300) (260)
[  451.020499] amdgpu 0000:01:00.0: GPU fault detected: 147 0x0ac98402 for
process valley_x64 pid 2048 thread valley_x64:cs0 pid 2066
[  451.020500] amdgpu 0000:01:00.0:   VM_CONTEXT1_PROTECTION_FAULT_ADDR=20=
=20
0x00045EAA
[  451.020500] amdgpu 0000:01:00.0:   VM_CONTEXT1_PROTECTION_FAULT_STATUS
0x06108002
[  451.020501] amdgpu 0000:01:00.0: VM fault (0x02, vmid 3, pasid 32772) at
page 286378, read from 'TC2' (0x54433200) (264)
[  451.020507] amdgpu 0000:01:00.0: GPU fault detected: 147 0x0ed88802 for
process valley_x64 pid 2048 thread valley_x64:cs0 pid 2066
[  451.020507] amdgpu 0000:01:00.0:   VM_CONTEXT1_PROTECTION_FAULT_ADDR=20=
=20
0x000454BD
[  451.020508] amdgpu 0000:01:00.0:   VM_CONTEXT1_PROTECTION_FAULT_STATUS
0x06108002
[  451.020509] amdgpu 0000:01:00.0: VM fault (0x02, vmid 3, pasid 32772) at
page 283837, read from 'TC2' (0x54433200) (264)
[  451.020514] amdgpu 0000:01:00.0: GPU fault detected: 147 0x0be80402 for
process valley_x64 pid 2048 thread valley_x64:cs0 pid 2066
[  451.020515] amdgpu 0000:01:00.0:   VM_CONTEXT1_PROTECTION_FAULT_ADDR=20=
=20
0x0004732D
[  451.020516] amdgpu 0000:01:00.0:   VM_CONTEXT1_PROTECTION_FAULT_STATUS
0x06088002
[  451.020516] amdgpu 0000:01:00.0: VM fault (0x02, vmid 3, pasid 32772) at
page 291629, read from 'TC4' (0x54433400) (136)
[  451.025291] amdgpu 0000:01:00.0: IH ring buffer overflow (0x0008D420,
0x00006CE0, 0x0000D430)
[  451.521948] [drm] Fence fallback timer expired on ring sdma0
-----------------------------------------------

This is only time I've seen this so far -&gt; it's possible that it requires
specific Mesa &amp; kernel version.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15580943070.13a1A388.31709--

--===============1602207337==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1602207337==--
