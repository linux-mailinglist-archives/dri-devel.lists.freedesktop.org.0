Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D282ACBDF
	for <lists+dri-devel@lfdr.de>; Sun,  8 Sep 2019 12:00:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1A20898E1;
	Sun,  8 Sep 2019 10:00:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id EF11C898E1
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Sep 2019 10:00:41 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id E697272167; Sun,  8 Sep 2019 10:00:41 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111588] Framebuffer corruption when a fb which is not being
 scanned out gets removed
Date: Sun, 08 Sep 2019 10:00:19 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: DRI git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: not set
X-Bugzilla-Who: jwrdegoede@fedoraproject.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: not set
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
Message-ID: <bug-111588-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0298157873=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0298157873==
Content-Type: multipart/alternative; boundary="15679368410.581f4E.17328"
Content-Transfer-Encoding: 7bit


--15679368410.581f4E.17328
Date: Sun, 8 Sep 2019 10:00:41 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111588

            Bug ID: 111588
           Summary: Framebuffer corruption when a fb which is not being
                    scanned out gets removed
           Product: DRI
           Version: DRI git
          Hardware: Other
                OS: All
            Status: NEW
          Severity: not set
          Priority: not set
         Component: DRM/AMDgpu
          Assignee: dri-devel@lists.freedesktop.org
          Reporter: jwrdegoede@fedoraproject.org

This is a weird issue, which I noticed when working on this plymouth fix:
https://gitlab.freedesktop.org/plymouth/plymouth/merge_requests/59

On boot to ensure a smooth handover of the framebuffer from plymouth to gdm=
 the
following happens:

1) plymouth starts, does an addfb, becomes master, set the fb as the fb the
crtc should scanout
2) gdm starts tells plymouth to "deactivate", plymouth drops master (but do=
es
not exit)
3) gdm becomes master, installs its own fb to scanout, the fb being scanned=
 out
is now owned by gdm
4) gdm tells plymouth it may quit now
5) plymouth exits, without calling rmfb or closing the /dev/dri/card0 fd,
relying on the kernel to cleanup
6) all is well

The bug fix from the above merge requests make plymouth actually cleanup be=
hind
itself, this is necessary to avoid issues with hotunplug (see the plymouth =
MR
for details). My first attempt at this simply made plymouth always do the
cleanup, both on hotunplug and exit as that was the most straight forward to
do.
This changes the sequence to:

1-4) Idem as above
5) Plymouth internally calls src/plugins/renderers/drm/plugin.c:
   ply_renderer_buffer_free() this does:
    drmModeRmFB(...);
    munmap (buffer->map_address, buffer->map_size);
    destroy_dumb_buffer_request.handle =3D buffer->handle;
    drmIoctl (fd, DRM_IOCTL_MODE_DESTROY_DUMB, &destroy_dumb_buffer_request=
);
   Followed by calling close() on the fd.
6) Plymouth exits
7) 5 and/or 6 cause the gdm framebuffer being all messed up, it looks like a
   wrong pitch or tiling setting

Note that when 5 is executed plymouth no longer is master and the fb being
removed is no longer being scanned out, so this really should not be able to
influence the current kms state, yet it does.

This is 100% reproducable for me with Fedora 30 + master plymouth + 5.3.0-r=
c7
on a R7 250E (SAPPHIRE Ultimate Radeon R7 250) using the amdgpu driver. I k=
now
that the default is to use the radeon driver with the R7 250E, but I was us=
ing
the amdgpu driver deliberately to reproduce:
https://bugzilla.redhat.com/show_bug.cgi?id=3D1490490

For now I've modified the plymouth fix to only call ply_renderer_buffer_fre=
e()
+ close() on hot-unplug and to still leave cleanup to the kernel on exit, b=
ut
it would be nice to get to the bottom of this.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15679368410.581f4E.17328
Date: Sun, 8 Sep 2019 10:00:41 +0000
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
   title=3D"NEW - Framebuffer corruption when a fb which is not being scann=
ed out gets removed"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111588">111588</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Framebuffer corruption when a fb which is not being scanned o=
ut gets removed
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>DRI
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>DRI git
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
          <td>not set
          </td>
        </tr>

        <tr>
          <th>Priority</th>
          <td>not set
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
          <td>jwrdegoede&#64;fedoraproject.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>This is a weird issue, which I noticed when working on this pl=
ymouth fix:
<a href=3D"https://gitlab.freedesktop.org/plymouth/plymouth/merge_requests/=
59">https://gitlab.freedesktop.org/plymouth/plymouth/merge_requests/59</a>

On boot to ensure a smooth handover of the framebuffer from plymouth to gdm=
 the
following happens:

1) plymouth starts, does an addfb, becomes master, set the fb as the fb the
crtc should scanout
2) gdm starts tells plymouth to &quot;deactivate&quot;, plymouth drops mast=
er (but does
not exit)
3) gdm becomes master, installs its own fb to scanout, the fb being scanned=
 out
is now owned by gdm
4) gdm tells plymouth it may quit now
5) plymouth exits, without calling rmfb or closing the /dev/dri/card0 fd,
relying on the kernel to cleanup
6) all is well

The bug fix from the above merge requests make plymouth actually cleanup be=
hind
itself, this is necessary to avoid issues with hotunplug (see the plymouth =
MR
for details). My first attempt at this simply made plymouth always do the
cleanup, both on hotunplug and exit as that was the most straight forward to
do.
This changes the sequence to:

1-4) Idem as above
5) Plymouth internally calls src/plugins/renderers/drm/plugin.c:
   ply_renderer_buffer_free() this does:
    drmModeRmFB(...);
    munmap (buffer-&gt;map_address, buffer-&gt;map_size);
    destroy_dumb_buffer_request.handle =3D buffer-&gt;handle;
    drmIoctl (fd, DRM_IOCTL_MODE_DESTROY_DUMB, &amp;destroy_dumb_buffer_req=
uest);
   Followed by calling close() on the fd.
6) Plymouth exits
7) 5 and/or 6 cause the gdm framebuffer being all messed up, it looks like a
   wrong pitch or tiling setting

Note that when 5 is executed plymouth no longer is master and the fb being
removed is no longer being scanned out, so this really should not be able to
influence the current kms state, yet it does.

This is 100% reproducable for me with Fedora 30 + master plymouth + 5.3.0-r=
c7
on a R7 250E (SAPPHIRE Ultimate Radeon R7 250) using the amdgpu driver. I k=
now
that the default is to use the radeon driver with the R7 250E, but I was us=
ing
the amdgpu driver deliberately to reproduce:
<a href=3D"https://bugzilla.redhat.com/show_bug.cgi?id=3D1490490">https://b=
ugzilla.redhat.com/show_bug.cgi?id=3D1490490</a>

For now I've modified the plymouth fix to only call ply_renderer_buffer_fre=
e()
+ close() on hot-unplug and to still leave cleanup to the kernel on exit, b=
ut
it would be nice to get to the bottom of this.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15679368410.581f4E.17328--

--===============0298157873==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0298157873==--
