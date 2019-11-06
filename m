Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1461EF1D94
	for <lists+dri-devel@lfdr.de>; Wed,  6 Nov 2019 19:32:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4AD96E283;
	Wed,  6 Nov 2019 18:32:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 3DBCF6ECCD
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Nov 2019 18:32:32 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 3A878720E2; Wed,  6 Nov 2019 18:32:32 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 109955] amdgpu [RX Vega 64] system freeze while gaming
Date: Wed, 06 Nov 2019 18:32:31 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: haro41@gmx.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-109955-502-76CnARG1uk@http.bugs.freedesktop.org/>
In-Reply-To: <bug-109955-502@http.bugs.freedesktop.org/>
References: <bug-109955-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0896081434=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0896081434==
Content-Type: multipart/alternative; boundary="15730651523.aEE9bf.8137"
Content-Transfer-Encoding: 7bit


--15730651523.aEE9bf.8137
Date: Wed, 6 Nov 2019 18:32:32 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D109955

--- Comment #130 from haro41@gmx.de ---
> >=20
> > echo "manual" > /sys/class/drm/card0/device/power_dpm_force_performance=
_level
> > echo "1 2 3" > /sys/class/drm/card0/device/pp_dpm_mclk
> >=20
>=20
> do you have any suggestion to automate this? so far i can strictly run th=
ese
> commands after su. not even sudo works with scripts running these command=
s.
> or systemd files.

Currently i use my patch (see above) to workaround the crashes.
If you prefer not to touch your kernel, you could create a systemd service:=
=20

# cat /etc/systemd/system/amd-pp.service:=20

[Unit]
Description=3DAMD PP adjust service
[Service]
User=3Droot
Group=3Droot
GuessMainPID=3Dno
ExecStart=3D/srv/amdgpu-pp.sh
[Install]
WantedBy=3Dmulti-user.target
---------------------------------------------------------------
# cat /srv/amdgpu-pp.sh:

#!/bin/bash
echo "manual" > /sys/class/drm/card0/device/power_dpm_force_performance_lev=
el
echo "1 2 3" > /sys/class/drm/card0/device/pp_dpm_mclk
---------------------------------------------------------------
#systemctl enable amd-pp.service
#systemctl start amd-pp.service
---------------------------------------------------------------

... assuming you have 'amdgpu.ppfeaturemask=3D0xffffffff' set ...

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15730651523.aEE9bf.8137
Date: Wed, 6 Nov 2019 18:32:32 +0000
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
   title=3D"NEW - amdgpu [RX Vega 64] system freeze while gaming"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109955#c130">Comm=
ent # 130</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - amdgpu [RX Vega 64] system freeze while gaming"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109955">bug 10995=
5</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
haro41&#64;gmx.de" title=3D"haro41&#64;gmx.de">haro41&#64;gmx.de</a>
</span></b>
        <pre><span class=3D"quote">&gt; &gt;=20
&gt; &gt; echo &quot;manual&quot; &gt; /sys/class/drm/card0/device/power_dp=
m_force_performance_level
&gt; &gt; echo &quot;1 2 3&quot; &gt; /sys/class/drm/card0/device/pp_dpm_mc=
lk
&gt; &gt;=20
&gt;=20
&gt; do you have any suggestion to automate this? so far i can strictly run=
 these
&gt; commands after su. not even sudo works with scripts running these comm=
ands.
&gt; or systemd files.</span >

Currently i use my patch (see above) to workaround the crashes.
If you prefer not to touch your kernel, you could create a systemd service:=
=20

# cat /etc/systemd/system/amd-pp.service:=20

[Unit]
Description=3DAMD PP adjust service
[Service]
User=3Droot
Group=3Droot
GuessMainPID=3Dno
ExecStart=3D/srv/amdgpu-pp.sh
[Install]
WantedBy=3Dmulti-user.target
---------------------------------------------------------------
# cat /srv/amdgpu-pp.sh:

#!/bin/bash
echo &quot;manual&quot; &gt; /sys/class/drm/card0/device/power_dpm_force_pe=
rformance_level
echo &quot;1 2 3&quot; &gt; /sys/class/drm/card0/device/pp_dpm_mclk
---------------------------------------------------------------
#systemctl enable amd-pp.service
#systemctl start amd-pp.service
---------------------------------------------------------------

... assuming you have 'amdgpu.ppfeaturemask=3D0xffffffff' set ...</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15730651523.aEE9bf.8137--

--===============0896081434==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0896081434==--
