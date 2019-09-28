Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1590C11AC
	for <lists+dri-devel@lfdr.de>; Sat, 28 Sep 2019 20:04:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3A5E6E169;
	Sat, 28 Sep 2019 18:04:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id EEE4B6E169
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Sep 2019 18:04:23 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id E92FC72162; Sat, 28 Sep 2019 18:04:23 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110886] After S3 resume, kernel: [drm] psp command failed and
 response status is (-65529) at 27th time of S3. 28th time of S3 freeze the
 system.
Date: Sat, 28 Sep 2019 18:04:24 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: kai.heng.feng@canonical.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-110886-502-LZxkKzoMkj@http.bugs.freedesktop.org/>
In-Reply-To: <bug-110886-502@http.bugs.freedesktop.org/>
References: <bug-110886-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1278773797=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1278773797==
Content-Type: multipart/alternative; boundary="15696938632.072179.20854"
Content-Transfer-Encoding: 7bit


--15696938632.072179.20854
Date: Sat, 28 Sep 2019 18:04:23 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110886

--- Comment #22 from Kai-Heng Feng <kai.heng.feng@canonical.com> ---
(In reply to Andrey Grodzovsky from comment #21)
> In fact please rebase latest drm-next from here -
> https://cgit.freedesktop.org/~agd5f/linux/log/?h=3Damd-staging-drm-next, =
there
> are 2 changes by Alex in communication with PSP with might help=20
>=20
> drm/amdgpu/psp: invalidate the hdp read cache before reading the psp
> response=20=20=20
> drm/amdgpu/psp: flush HDP write fifo after submitting cmds to the psp=20=
=20
>=20
> See if the PSP errors go away with that.

The slightly different error message still popped out after 27th S3, and 28=
th
S3 attempt froze the system:
Sep 28 05:38:44 u-HP-ProBook-645-G4 kernel: [drm:psp_hw_start.cold [amdgpu]]
*ERROR* PSP load asd failed!
Sep 28 05:38:44 u-HP-ProBook-645-G4 kernel: [drm:psp_resume [amdgpu]] *ERRO=
R*
PSP resume failed
Sep 28 05:38:44 u-HP-ProBook-645-G4 kernel: [drm:amdgpu_device_fw_loading
[amdgpu]] *ERROR* resume of IP block <psp> failed -22
Sep 28 05:38:44 u-HP-ProBook-645-G4 kernel: [drm:amdgpu_device_resume [amdg=
pu]]
*ERROR* amdgpu_device_ip_resume failed (-22).
Sep 28 05:38:44 u-HP-ProBook-645-G4 kernel: PM: dpm_run_callback():
pci_pm_resume+0x0/0xa0 returns -22
Sep 28 05:38:44 u-HP-ProBook-645-G4 kernel: PM: Device 0000:04:00.0 failed =
to
resume async: error -22

$ journalctl -b -1 -k | grep "suspend entry (deep)" | wc -l
28

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15696938632.072179.20854
Date: Sat, 28 Sep 2019 18:04:23 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - After S3 resume, kernel: [drm] psp command failed and res=
ponse status is (-65529) at 27th time of S3. 28th time of S3 freeze the sys=
tem."
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110886#c22">Comme=
nt # 22</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - After S3 resume, kernel: [drm] psp command failed and res=
ponse status is (-65529) at 27th time of S3. 28th time of S3 freeze the sys=
tem."
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110886">bug 11088=
6</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
kai.heng.feng&#64;canonical.com" title=3D"Kai-Heng Feng &lt;kai.heng.feng&#=
64;canonical.com&gt;"> <span class=3D"fn">Kai-Heng Feng</span></a>
</span></b>
        <pre>(In reply to Andrey Grodzovsky from <a href=3D"show_bug.cgi?id=
=3D110886#c21">comment #21</a>)
<span class=3D"quote">&gt; In fact please rebase latest drm-next from here -
&gt; <a href=3D"https://cgit.freedesktop.org/~agd5f/linux/log/?h=3Damd-stag=
ing-drm-next">https://cgit.freedesktop.org/~agd5f/linux/log/?h=3Damd-stagin=
g-drm-next</a>, there
&gt; are 2 changes by Alex in communication with PSP with might help=20
&gt;=20
&gt; drm/amdgpu/psp: invalidate the hdp read cache before reading the psp
&gt; response=20=20=20
&gt; drm/amdgpu/psp: flush HDP write fifo after submitting cmds to the psp=
=20=20
&gt;=20
&gt; See if the PSP errors go away with that.</span >

The slightly different error message still popped out after 27th S3, and 28=
th
S3 attempt froze the system:
Sep 28 05:38:44 u-HP-ProBook-645-G4 kernel: [drm:psp_hw_start.cold [amdgpu]]
*ERROR* PSP load asd failed!
Sep 28 05:38:44 u-HP-ProBook-645-G4 kernel: [drm:psp_resume [amdgpu]] *ERRO=
R*
PSP resume failed
Sep 28 05:38:44 u-HP-ProBook-645-G4 kernel: [drm:amdgpu_device_fw_loading
[amdgpu]] *ERROR* resume of IP block &lt;psp&gt; failed -22
Sep 28 05:38:44 u-HP-ProBook-645-G4 kernel: [drm:amdgpu_device_resume [amdg=
pu]]
*ERROR* amdgpu_device_ip_resume failed (-22).
Sep 28 05:38:44 u-HP-ProBook-645-G4 kernel: PM: dpm_run_callback():
pci_pm_resume+0x0/0xa0 returns -22
Sep 28 05:38:44 u-HP-ProBook-645-G4 kernel: PM: Device 0000:04:00.0 failed =
to
resume async: error -22

$ journalctl -b -1 -k | grep &quot;suspend entry (deep)&quot; | wc -l
28</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15696938632.072179.20854--

--===============1278773797==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1278773797==--
