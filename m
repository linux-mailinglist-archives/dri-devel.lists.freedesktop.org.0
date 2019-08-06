Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 34FDE82F8F
	for <lists+dri-devel@lfdr.de>; Tue,  6 Aug 2019 12:15:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 484AD6E34B;
	Tue,  6 Aug 2019 10:15:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id E18A46E34B
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Aug 2019 10:15:16 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id DB92072167; Tue,  6 Aug 2019 10:15:16 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111305] `ttm_bo_handle_move_mem` sometimes takes more than 50 ms
Date: Tue, 06 Aug 2019 10:15:16 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: XOrg git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: pmenzel+bugs.freedesktop.org@molgen.mpg.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 attachments.created
Message-ID: <bug-111305-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1031688716=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1031688716==
Content-Type: multipart/alternative; boundary="15650865162.fa3Ee.5675"
Content-Transfer-Encoding: 7bit


--15650865162.fa3Ee.5675
Date: Tue, 6 Aug 2019 10:15:16 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111305

            Bug ID: 111305
           Summary: `ttm_bo_handle_move_mem` sometimes takes more than 50
                    ms
           Product: DRI
           Version: XOrg git
          Hardware: Other
                OS: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: DRM/AMDgpu
          Assignee: dri-devel@lists.freedesktop.org
          Reporter: pmenzel+bugs.freedesktop.org@molgen.mpg.de

Created attachment 144954
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D144954&action=3Dedit
Screenshot from callgraph excerpt

With Linux 5.3-rc3 and pm-graph=E2=80=99s `sleepgraph.py` [1] measuring sus=
pend times
on the Dell OptiPlex 5040 with an external AMD graphics card, the driver ne=
eds
2.1 seconds to suspend the device, which is too long.

    $ lspci -nn -s 01:
    01:00.0 VGA compatible controller [0300]: Advanced Micro Devices, Inc.
[AMD/ATI] Oland XT [Radeon HD 8670 / R7 250/350] [1002:6610] (rev 81)
    01:00.1 Audio device [0403]: Advanced Micro Devices, Inc. [AMD/ATI] Cape
Verde/Pitcairn HDMI Audio [Radeon HD 7700/7800 Series] [1002:aab0]

Here is the time:

    0000:01:00.0 suspend (2170.017 ms @ 5037.143762 to 5039.313779)

Looking into the call graph, 1.4 s are spent in `ttm_bo_evict_mm`.

    ttm_bo_evict_mm [ttm] (1438.050 ms @ 5037.601941)

As you can see in the attached screenshot, there are some
`ttm_bo_handle_move_mem` call which take several milliseconds adding up to =
the
long time.

    - ttm_mem_evict_first [ttm] (304.860 ms @ 5037.705809)
        _raw_spin_lock
        mutex_trylock (0.000 ms @ 5037.705809)
        + ttm_bo_del_from_lru [ttm]
        - ttm_bo_evict [ttm] (304.857 ms @ 5037.705810)
            amdgpu_evict_flags [amdgpu] (0.000 ms @ 5037.705810)
            ttm_bo_mem_space [ttm] (0.001 ms @ 5037.705811)
            ttm_bo_handle_move_mem [ttm] (304.853 ms @ 5037.705812)

[1]: https://github.com/intel/pm-graph

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15650865162.fa3Ee.5675
Date: Tue, 6 Aug 2019 10:15:16 +0000
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
   title=3D"NEW - `ttm_bo_handle_move_mem` sometimes takes more than 50 ms"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111305">111305</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>`ttm_bo_handle_move_mem` sometimes takes more than 50 ms
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>DRI
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>XOrg git
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
          <td>DRM/AMDgpu
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>dri-devel&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Reporter</th>
          <td>pmenzel+bugs.freedesktop.org&#64;molgen.mpg.de
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D144954=
" name=3D"attach_144954" title=3D"Screenshot from callgraph excerpt">attach=
ment 144954</a> <a href=3D"attachment.cgi?id=3D144954&amp;action=3Dedit" ti=
tle=3D"Screenshot from callgraph excerpt">[details]</a></span>
Screenshot from callgraph excerpt

With Linux 5.3-rc3 and pm-graph=E2=80=99s `sleepgraph.py` [1] measuring sus=
pend times
on the Dell OptiPlex 5040 with an external AMD graphics card, the driver ne=
eds
2.1 seconds to suspend the device, which is too long.

    $ lspci -nn -s 01:
    01:00.0 VGA compatible controller [0300]: Advanced Micro Devices, Inc.
[AMD/ATI] Oland XT [Radeon HD 8670 / R7 250/350] [1002:6610] (rev 81)
    01:00.1 Audio device [0403]: Advanced Micro Devices, Inc. [AMD/ATI] Cape
Verde/Pitcairn HDMI Audio [Radeon HD 7700/7800 Series] [1002:aab0]

Here is the time:

    0000:01:00.0 suspend (2170.017 ms &#64; 5037.143762 to 5039.313779)

Looking into the call graph, 1.4 s are spent in `ttm_bo_evict_mm`.

    ttm_bo_evict_mm [ttm] (1438.050 ms &#64; 5037.601941)

As you can see in the attached screenshot, there are some
`ttm_bo_handle_move_mem` call which take several milliseconds adding up to =
the
long time.

    - ttm_mem_evict_first [ttm] (304.860 ms &#64; 5037.705809)
        _raw_spin_lock
        mutex_trylock (0.000 ms &#64; 5037.705809)
        + ttm_bo_del_from_lru [ttm]
        - ttm_bo_evict [ttm] (304.857 ms &#64; 5037.705810)
            amdgpu_evict_flags [amdgpu] (0.000 ms &#64; 5037.705810)
            ttm_bo_mem_space [ttm] (0.001 ms &#64; 5037.705811)
            ttm_bo_handle_move_mem [ttm] (304.853 ms &#64; 5037.705812)

[1]: <a href=3D"https://github.com/intel/pm-graph">https://github.com/intel=
/pm-graph</a></pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15650865162.fa3Ee.5675--

--===============1031688716==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1031688716==--
