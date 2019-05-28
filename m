Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49B3A2C5C2
	for <lists+dri-devel@lfdr.de>; Tue, 28 May 2019 13:51:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DD936E20B;
	Tue, 28 May 2019 11:51:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 843C16E20B
 for <dri-devel@lists.freedesktop.org>; Tue, 28 May 2019 11:51:35 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 8140D72167; Tue, 28 May 2019 11:51:35 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110781] Radeon: heavy r300 performance drop regression between
 11.x and 19.x
Date: Tue, 28 May 2019 11:51:35 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Mesa
X-Bugzilla-Component: Drivers/Gallium/r300
X-Bugzilla-Version: git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: u9vata@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 qa_contact
Message-ID: <bug-110781-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1438585353=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1438585353==
Content-Type: multipart/alternative; boundary="15590442951.08684.22348"
Content-Transfer-Encoding: 7bit


--15590442951.08684.22348
Date: Tue, 28 May 2019 11:51:35 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110781

            Bug ID: 110781
           Summary: Radeon: heavy r300 performance drop regression between
                    11.x and 19.x
           Product: Mesa
           Version: git
          Hardware: x86 (IA32)
                OS: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Drivers/Gallium/r300
          Assignee: dri-devel@lists.freedesktop.org
          Reporter: u9vata@gmail.com
        QA Contact: dri-devel@lists.freedesktop.org

Dear mesa/freedesktop team!

I am a happy user of the open source radeon r300 driver for my Mobility rad=
eon
200M card in my (pretty old, but good-enough) laptop.

I have updated my system + changed distro and got a complete slowdown. I ha=
ve
checked if it is the kernel or the distro and found that I can get back my
performance if I revert to mesa 11.x and corresponding xorg while still usi=
ng
the latest linux kernel. This seems to be some kind of performance regressi=
on.

The performance drop is heavy: 50%..100% slowdown and very high CPU usage. =
For
example now extreme tux racer reports 100% CPU usage and before it reports
25-50% at maximum (including any spikes) and mostly around 30% actually when
averaging.

I have used the perf tool to locate what causes the heavy CPU usage and I f=
ind
that there is a lot of memory movements in a create_bo call.

  See this log:
  Samples: 171K of event 'cycles', Event count (approx.): 67632101793=20=20=
=20=20=20=20=20=20=20=20=20
    Children      Self  Command      Shared Object              Symbol=20=
=20=20=20=20=20=20=20=20=20
  -   61,12%     0,09%  etr          [kernel.vmlinux]           [k]
entry_SYSENTER_32                                                          =
   =E2=97=86
   - 61,07% entry_SYSENTER_32=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20
    - 60,94% do_fast_syscall_32=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20
     - 57,92% sys_ioctl=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
      - 57,84% do_vfs_ioctl=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20
       - 57,43% radeon_drm_ioctl=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20
        - 57,04% drm_ioctl=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20
         - 56,81% drm_ioctl_kernel=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20
          - 55,86% radeon_gem_create_ioctl=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20
           - 55,46% radeon_gem_object_create=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20
            - 55,36% radeon_bo_create=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20
             - 55,20% ttm_bo_init=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20
              - 55,14% ttm_bo_init_reserved=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20
               - 54,75% ttm_bo_validate=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20
                - 54,42% ttm_bo_handle_move_mem=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
                 - 54,07% ttm_tt_bind=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20
                  - 53,36% radeon_ttm_tt_populate=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
                   + 53,33% ttm_populate_and_map_pages=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
                     0,62% radeon_ttm_backend_bind

I see these are code paths in the kernel, but the same happens regardless I=
 use
an old kernel (and modules) or the newest one, while this gets a near compl=
ete
disappear when I revert to old mesa and X.

I do not see anything related to bo (buffer object??) creation in mesa sour=
ces
below the gallium/r300 directory, but I have found things that make ioctl i=
n:

gallium/winsys/radeon/drm/radeon_drm_bo.c

^^Is this also used for r300 cards? The "source tree" documentation page se=
ems
to tell me this is a "shared code for r600 and radeonsi", but where is r300
doing calls to the ioctls then?

Something happened in the last 1-3 years that changed stuff to move memory
around crazily for some reason and use more CPU for that. Surely it was not
having this heavy slowdown before. Now it is nearly as slow as llvmpipe for
practical cases (but not slower!).

Can anyone help me with this? I am a developer myself, but I am not well ve=
rsed
in the source code of mesa and in how to analyse its performance bottleneck=
s.

PS.: On phoronix I was already analysing the problem for long:=20

https://www.phoronix.com/forums/forum/linux-graphics-x-org-drivers/open-sou=
rce-amd-linux/1099745-how-to-tell-if-a-driver-is-gallium-or-just-mesa-slow-=
renderng-with-radeon

^^There the whole process of what I was trying is written with every step, =
but
maybe only perf outputs are of interest from there...

Feel free to ask me anything about the issue. If I would be able to help
solving this myself I will be happy too, but I have never really did any
patches to these kind of core system libraries and I am quite rookie for gpu
drivers...

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15590442951.08684.22348
Date: Tue, 28 May 2019 11:51:35 +0000
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
   title=3D"NEW - Radeon: heavy r300 performance drop regression between 11=
.x and 19.x"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110781">110781</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Radeon: heavy r300 performance drop regression between 11.x a=
nd 19.x
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
          <td>x86 (IA32)
          </td>
        </tr>

        <tr>
          <th>OS</th>
          <td>Linux (All)
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
          <td>Drivers/Gallium/r300
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>dri-devel&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Reporter</th>
          <td>u9vata&#64;gmail.com
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>dri-devel&#64;lists.freedesktop.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Dear mesa/freedesktop team!

I am a happy user of the open source radeon r300 driver for my Mobility rad=
eon
200M card in my (pretty old, but good-enough) laptop.

I have updated my system + changed distro and got a complete slowdown. I ha=
ve
checked if it is the kernel or the distro and found that I can get back my
performance if I revert to mesa 11.x and corresponding xorg while still usi=
ng
the latest linux kernel. This seems to be some kind of performance regressi=
on.

The performance drop is heavy: 50%..100% slowdown and very high CPU usage. =
For
example now extreme tux racer reports 100% CPU usage and before it reports
25-50% at maximum (including any spikes) and mostly around 30% actually when
averaging.

I have used the perf tool to locate what causes the heavy CPU usage and I f=
ind
that there is a lot of memory movements in a create_bo call.

  See this log:
  Samples: 171K of event 'cycles', Event count (approx.): 67632101793=20=20=
=20=20=20=20=20=20=20=20=20
    Children      Self  Command      Shared Object              Symbol=20=
=20=20=20=20=20=20=20=20=20
  -   61,12%     0,09%  etr          [kernel.vmlinux]           [k]
entry_SYSENTER_32                                                          =
   =E2=97=86
   - 61,07% entry_SYSENTER_32=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20
    - 60,94% do_fast_syscall_32=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20
     - 57,92% sys_ioctl=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
      - 57,84% do_vfs_ioctl=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20
       - 57,43% radeon_drm_ioctl=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20
        - 57,04% drm_ioctl=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20
         - 56,81% drm_ioctl_kernel=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20
          - 55,86% radeon_gem_create_ioctl=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20
           - 55,46% radeon_gem_object_create=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20
            - 55,36% radeon_bo_create=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20
             - 55,20% ttm_bo_init=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20
              - 55,14% ttm_bo_init_reserved=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20
               - 54,75% ttm_bo_validate=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20
                - 54,42% ttm_bo_handle_move_mem=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
                 - 54,07% ttm_tt_bind=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20
                  - 53,36% radeon_ttm_tt_populate=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
                   + 53,33% ttm_populate_and_map_pages=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
                     0,62% radeon_ttm_backend_bind

I see these are code paths in the kernel, but the same happens regardless I=
 use
an old kernel (and modules) or the newest one, while this gets a near compl=
ete
disappear when I revert to old mesa and X.

I do not see anything related to bo (buffer object??) creation in mesa sour=
ces
below the gallium/r300 directory, but I have found things that make ioctl i=
n:

gallium/winsys/radeon/drm/radeon_drm_bo.c

^^Is this also used for r300 cards? The &quot;source tree&quot; documentati=
on page seems
to tell me this is a &quot;shared code for r600 and radeonsi&quot;, but whe=
re is r300
doing calls to the ioctls then?

Something happened in the last 1-3 years that changed stuff to move memory
around crazily for some reason and use more CPU for that. Surely it was not
having this heavy slowdown before. Now it is nearly as slow as llvmpipe for
practical cases (but not slower!).

Can anyone help me with this? I am a developer myself, but I am not well ve=
rsed
in the source code of mesa and in how to analyse its performance bottleneck=
s.

PS.: On phoronix I was already analysing the problem for long:=20

<a href=3D"https://www.phoronix.com/forums/forum/linux-graphics-x-org-drive=
rs/open-source-amd-linux/1099745-how-to-tell-if-a-driver-is-gallium-or-just=
-mesa-slow-renderng-with-radeon">https://www.phoronix.com/forums/forum/linu=
x-graphics-x-org-drivers/open-source-amd-linux/1099745-how-to-tell-if-a-dri=
ver-is-gallium-or-just-mesa-slow-renderng-with-radeon</a>

^^There the whole process of what I was trying is written with every step, =
but
maybe only perf outputs are of interest from there...

Feel free to ask me anything about the issue. If I would be able to help
solving this myself I will be happy too, but I have never really did any
patches to these kind of core system libraries and I am quite rookie for gpu
drivers...</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15590442951.08684.22348--

--===============1438585353==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1438585353==--
