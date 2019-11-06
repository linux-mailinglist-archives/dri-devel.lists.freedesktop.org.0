Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1B81F1EB7
	for <lists+dri-devel@lfdr.de>; Wed,  6 Nov 2019 20:26:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32AB26ECFA;
	Wed,  6 Nov 2019 19:26:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 001D56EE2A
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Nov 2019 19:26:11 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id F10C7720E2; Wed,  6 Nov 2019 19:26:11 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 109955] amdgpu [RX Vega 64] system freeze while gaming
Date: Wed, 06 Nov 2019 19:26:11 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: me@jasondaigo.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-109955-502-HQffvYV0Qi@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0493811637=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0493811637==
Content-Type: multipart/alternative; boundary="157306837111.4eADc.19882"
Content-Transfer-Encoding: 7bit


--157306837111.4eADc.19882
Date: Wed, 6 Nov 2019 19:26:11 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D109955

--- Comment #131 from Wilko Bartels <me@jasondaigo.de> ---
(In reply to haro41 from comment #130)
> > >=20
> > > echo "manual" > /sys/class/drm/card0/device/power_dpm_force_performan=
ce_level
> > > echo "1 2 3" > /sys/class/drm/card0/device/pp_dpm_mclk
> > >=20
> >=20
> > do you have any suggestion to automate this? so far i can strictly run =
these
> > commands after su. not even sudo works with scripts running these comma=
nds.
> > or systemd files.
>=20
> Currently i use my patch (see above) to workaround the crashes.
> If you prefer not to touch your kernel, you could create a systemd servic=
e:=20
>=20
> # cat /etc/systemd/system/amd-pp.service:=20
>=20
> [Unit]
> Description=3DAMD PP adjust service
> [Service]
> User=3Droot
> Group=3Droot
> GuessMainPID=3Dno
> ExecStart=3D/srv/amdgpu-pp.sh
> [Install]
> WantedBy=3Dmulti-user.target
> ---------------------------------------------------------------
> # cat /srv/amdgpu-pp.sh:
>=20
> #!/bin/bash
> echo "manual" > /sys/class/drm/card0/device/power_dpm_force_performance_l=
evel
> echo "1 2 3" > /sys/class/drm/card0/device/pp_dpm_mclk
> ---------------------------------------------------------------
> #systemctl enable amd-pp.service
> #systemctl start amd-pp.service
> ---------------------------------------------------------------
>=20
> ... assuming you have 'amdgpu.ppfeaturemask=3D0xffffffff' set ...

Thank you. I already tried exactly that. And the unit unable to autostart
(permission denied). Only manual systemctl start works. Dont know why.=20

I would try to patch the kernel instead if i had any clue how to do the ste=
ps.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--157306837111.4eADc.19882
Date: Wed, 6 Nov 2019 19:26:11 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109955#c131">Comm=
ent # 131</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - amdgpu [RX Vega 64] system freeze while gaming"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109955">bug 10995=
5</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
me&#64;jasondaigo.de" title=3D"Wilko Bartels &lt;me&#64;jasondaigo.de&gt;">=
 <span class=3D"fn">Wilko Bartels</span></a>
</span></b>
        <pre>(In reply to haro41 from <a href=3D"show_bug.cgi?id=3D109955#c=
130">comment #130</a>)
<span class=3D"quote">&gt; &gt; &gt;=20
&gt; &gt; &gt; echo &quot;manual&quot; &gt; /sys/class/drm/card0/device/pow=
er_dpm_force_performance_level
&gt; &gt; &gt; echo &quot;1 2 3&quot; &gt; /sys/class/drm/card0/device/pp_d=
pm_mclk
&gt; &gt; &gt;=20
&gt; &gt;=20
&gt; &gt; do you have any suggestion to automate this? so far i can strictl=
y run these
&gt; &gt; commands after su. not even sudo works with scripts running these=
 commands.
&gt; &gt; or systemd files.
&gt;=20
&gt; Currently i use my patch (see above) to workaround the crashes.
&gt; If you prefer not to touch your kernel, you could create a systemd ser=
vice:=20
&gt;=20
&gt; # cat /etc/systemd/system/amd-pp.service:=20
&gt;=20
&gt; [Unit]
&gt; Description=3DAMD PP adjust service
&gt; [Service]
&gt; User=3Droot
&gt; Group=3Droot
&gt; GuessMainPID=3Dno
&gt; ExecStart=3D/srv/amdgpu-pp.sh
&gt; [Install]
&gt; WantedBy=3Dmulti-user.target
&gt; ---------------------------------------------------------------
&gt; # cat /srv/amdgpu-pp.sh:
&gt;=20
&gt; #!/bin/bash
&gt; echo &quot;manual&quot; &gt; /sys/class/drm/card0/device/power_dpm_for=
ce_performance_level
&gt; echo &quot;1 2 3&quot; &gt; /sys/class/drm/card0/device/pp_dpm_mclk
&gt; ---------------------------------------------------------------
&gt; #systemctl enable amd-pp.service
&gt; #systemctl start amd-pp.service
&gt; ---------------------------------------------------------------
&gt;=20
&gt; ... assuming you have 'amdgpu.ppfeaturemask=3D0xffffffff' set ...</spa=
n >

Thank you. I already tried exactly that. And the unit unable to autostart
(permission denied). Only manual systemctl start works. Dont know why.=20

I would try to patch the kernel instead if i had any clue how to do the ste=
ps.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--157306837111.4eADc.19882--

--===============0493811637==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0493811637==--
