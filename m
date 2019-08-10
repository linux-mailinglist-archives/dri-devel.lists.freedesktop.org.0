Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6185288C4D
	for <lists+dri-devel@lfdr.de>; Sat, 10 Aug 2019 18:39:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF0B26E444;
	Sat, 10 Aug 2019 16:39:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 883786E444
 for <dri-devel@lists.freedesktop.org>; Sat, 10 Aug 2019 16:39:55 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 84ADB72167; Sat, 10 Aug 2019 16:39:55 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110674] Crashes / Resets From AMDGPU / Radeon VII
Date: Sat, 10 Aug 2019 16:39:55 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: major
X-Bugzilla-Who: tom@r.je
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-110674-502-OjvxdmaYeJ@http.bugs.freedesktop.org/>
In-Reply-To: <bug-110674-502@http.bugs.freedesktop.org/>
References: <bug-110674-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1066066277=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1066066277==
Content-Type: multipart/alternative; boundary="15654551956.72ceC.891"
Content-Transfer-Encoding: 7bit


--15654551956.72ceC.891
Date: Sat, 10 Aug 2019 16:39:55 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110674

--- Comment #67 from Tom B <tom@r.je> ---
I had a look around at similar bugs and came across this:

https://bugs.freedesktop.org/show_bug.cgi?id=3D110822

It's for a 580, not a VII but the problems started at 5.1 and gives a simil=
ar
powerplay related crash.

The suggested fix there is to revert ad51c46eec739c18be24178a30b47801b10e03=
57.

I just tried this and after 4 reboots I can report it has two effects:

1. I don't have any crashing at all and my card boosts GPU clocks, voltages=
 and
wattages. I can run unigine-heaven for several minutes without the system
freezing.

2. The memory is forced to 351mhz, limiting performance.

If I run=20

cat /sys/class/drm/card0/device/pp_dpm_mclk=20

it shows:

0: 351Mhz *
1: 801Mhz=20
2: 1001Mhz=20


Which looks correct for idle, but it never, even under load, boosts to the =
next
memory clock. It also can't be set manually:


echo manual > /sys/class/drm/card0/device/power_dpm_force_performance_level
echo 2 >  /sys/class/drm/card0/device/pp_dpm_mclk
-bash: echo: write error: Invalid argument


While this isn't a proper fix it does give us some valuable insight. If any=
one
wants to run at 351mhz memory with a stable card and 2 screens they can. It
would be nice if someone can verify my findings as my card seemed to behave
differently to others for some reason.

This bug may be related to https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
10822
alternatively, it's possible the crash occurs when the memory clock changes
(which might mean it's related to
https://bugs.freedesktop.org/show_bug.cgi?id=3D102646 as there are issues w=
ith
memory clock changes there) There seem to be several powerplay related issu=
es
which may have the same root cause.


I'm now going to:

1. Revert to the stock kernel and set the mclk to 1001 manually before star=
ting
SDDM and see if the crash occurs.

2. See if I can manage to get stability and the mclk stuck at 1001mhz as th=
is
would be an acceptable compromise, even if not ideal.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15654551956.72ceC.891
Date: Sat, 10 Aug 2019 16:39:55 +0000
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
   title=3D"NEW - Crashes / Resets From AMDGPU / Radeon VII"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110674#c67">Comme=
nt # 67</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Crashes / Resets From AMDGPU / Radeon VII"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110674">bug 11067=
4</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
tom&#64;r.je" title=3D"Tom B &lt;tom&#64;r.je&gt;"> <span class=3D"fn">Tom =
B</span></a>
</span></b>
        <pre>I had a look around at similar bugs and came across this:

<a class=3D"bz_bug_link=20
          bz_status_REOPENED "
   title=3D"REOPENED - [Bisected]Booting with kernel version 5.1.0 or highe=
r on RX 580 hangs"
   href=3D"show_bug.cgi?id=3D110822">https://bugs.freedesktop.org/show_bug.=
cgi?id=3D110822</a>

It's for a 580, not a VII but the problems started at 5.1 and gives a simil=
ar
powerplay related crash.

The suggested fix there is to revert ad51c46eec739c18be24178a30b47801b10e03=
57.

I just tried this and after 4 reboots I can report it has two effects:

1. I don't have any crashing at all and my card boosts GPU clocks, voltages=
 and
wattages. I can run unigine-heaven for several minutes without the system
freezing.

2. The memory is forced to 351mhz, limiting performance.

If I run=20

cat /sys/class/drm/card0/device/pp_dpm_mclk=20

it shows:

0: 351Mhz *
1: 801Mhz=20
2: 1001Mhz=20


Which looks correct for idle, but it never, even under load, boosts to the =
next
memory clock. It also can't be set manually:


echo manual &gt; /sys/class/drm/card0/device/power_dpm_force_performance_le=
vel
echo 2 &gt;  /sys/class/drm/card0/device/pp_dpm_mclk
-bash: echo: write error: Invalid argument


While this isn't a proper fix it does give us some valuable insight. If any=
one
wants to run at 351mhz memory with a stable card and 2 screens they can. It
would be nice if someone can verify my findings as my card seemed to behave
differently to others for some reason.

This bug may be related to <a class=3D"bz_bug_link=20
          bz_status_REOPENED "
   title=3D"REOPENED - [Bisected]Booting with kernel version 5.1.0 or highe=
r on RX 580 hangs"
   href=3D"show_bug.cgi?id=3D110822">https://bugs.freedesktop.org/show_bug.=
cgi?id=3D110822</a>
alternatively, it's possible the crash occurs when the memory clock changes
(which might mean it's related to
<a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Screen flickering under amdgpu-experimental [buggy auto p=
ower profile]"
   href=3D"show_bug.cgi?id=3D102646">https://bugs.freedesktop.org/show_bug.=
cgi?id=3D102646</a> as there are issues with
memory clock changes there) There seem to be several powerplay related issu=
es
which may have the same root cause.


I'm now going to:

1. Revert to the stock kernel and set the mclk to 1001 manually before star=
ting
SDDM and see if the crash occurs.

2. See if I can manage to get stability and the mclk stuck at 1001mhz as th=
is
would be an acceptable compromise, even if not ideal.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15654551956.72ceC.891--

--===============1066066277==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1066066277==--
