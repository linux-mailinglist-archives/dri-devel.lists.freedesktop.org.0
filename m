Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46907EF22D
	for <lists+dri-devel@lfdr.de>; Tue,  5 Nov 2019 01:43:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 329446E8D3;
	Tue,  5 Nov 2019 00:43:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 3ABDB6E8D6
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Nov 2019 00:43:46 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 3622B720E2; Tue,  5 Nov 2019 00:43:46 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111482] Sapphire Pulse RX 5700 XT power consumption
Date: Tue, 05 Nov 2019 00:43:46 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: DRI git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: shtetldik@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-111482-502-b7Cmrh0GMC@http.bugs.freedesktop.org/>
In-Reply-To: <bug-111482-502@http.bugs.freedesktop.org/>
References: <bug-111482-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1297164283=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1297164283==
Content-Type: multipart/alternative; boundary="15729146262.0AEf8.10543"
Content-Transfer-Encoding: 7bit


--15729146262.0AEf8.10543
Date: Tue, 5 Nov 2019 00:43:46 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111482

--- Comment #36 from Shmerl <shtetldik@gmail.com> ---
OK, I recorded some data after different steps.

Sapphire Pulse RX 5700 XT, LG 27GL85-B (2560x1440, 144 Hz), DisplayPort 1.4
connection enabled in the monitor, DP 1.4 cable used.

1. After normal, boot:

auto

GFX Clocks and Power:
        875 MHz (MCLK)
        800 MHz (SCLK)
        300 MHz (PSTATE_SCLK)
        100 MHz (PSTATE_MCLK)
        750 mV (VDDGFX)
        30.0 W (average GPU)

no flickering.

2. Doing:

echo "high" > /sys/class/drm/card0/device/power_dpm_force_performance_level

GFX Clocks and Power:
        875 MHz (MCLK)
        2045 MHz (SCLK)
        300 MHz (PSTATE_SCLK)
        100 MHz (PSTATE_MCLK)
        1200 mV (VDDGFX)
        33.0 W (average GPU)=20=20=20=20=20=20=20=20

no flickering

3. Doing:

echo "low" > /sys/class/drm/card0/device/power_dpm_force_performance_level

GFX Clocks and Power:
        875 MHz (MCLK)
        300 MHz (SCLK)
        300 MHz (PSTATE_SCLK)
        100 MHz (PSTATE_MCLK)
        750 mV (VDDGFX)
        30.0 W (average GPU)

no flickering

4. Then, before suspending:

echo "auto" > /sys/class/drm/card0/device/power_dpm_force_performance_level

5. Suspend, and resume:

auto

GFX Clocks and Power:
        100 MHz (MCLK)
        800 MHz (SCLK)
        300 MHz (PSTATE_SCLK)
        100 MHz (PSTATE_MCLK)
        750 mV (VDDGFX)
        10.0 W (average GPU)

strong flickering

6. After that doing:

echo 'high' > power_dpm_force_performance_level

GFX Clocks and Power:
        875 MHz (MCLK)
        2045 MHz (SCLK)
        300 MHz (PSTATE_SCLK)
        100 MHz (PSTATE_MCLK)
        1200 mV (VDDGFX)
        33.0 W (average GPU)
no flickering

7. Doing:

echo 'low' > power_dpm_force_performance_level

GFX Clocks and Power:
        100 MHz (MCLK)
        300 MHz (SCLK)
        300 MHz (PSTATE_SCLK)
        100 MHz (PSTATE_MCLK)
        750 mV (VDDGFX)
        10.0 W (average GPU)

no flickering!

8. And then:

echo 'auto' > power_dpm_force_performance_level

GFX Clocks and Power:
        100 MHz (MCLK)
        800 MHz (SCLK)
        300 MHz (PSTATE_SCLK)
        100 MHz (PSTATE_MCLK)
        750 mV (VDDGFX)
        10.0 W (average GPU)

flickering again!

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15729146262.0AEf8.10543
Date: Tue, 5 Nov 2019 00:43:46 +0000
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
   title=3D"NEW - Sapphire Pulse RX 5700 XT power consumption"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111482#c36">Comme=
nt # 36</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Sapphire Pulse RX 5700 XT power consumption"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111482">bug 11148=
2</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
shtetldik&#64;gmail.com" title=3D"Shmerl &lt;shtetldik&#64;gmail.com&gt;"> =
<span class=3D"fn">Shmerl</span></a>
</span></b>
        <pre>OK, I recorded some data after different steps.

Sapphire Pulse RX 5700 XT, LG 27GL85-B (2560x1440, 144 Hz), DisplayPort 1.4
connection enabled in the monitor, DP 1.4 cable used.

1. After normal, boot:

auto

GFX Clocks and Power:
        875 MHz (MCLK)
        800 MHz (SCLK)
        300 MHz (PSTATE_SCLK)
        100 MHz (PSTATE_MCLK)
        750 mV (VDDGFX)
        30.0 W (average GPU)

no flickering.

2. Doing:

echo &quot;high&quot; &gt; /sys/class/drm/card0/device/power_dpm_force_perf=
ormance_level

GFX Clocks and Power:
        875 MHz (MCLK)
        2045 MHz (SCLK)
        300 MHz (PSTATE_SCLK)
        100 MHz (PSTATE_MCLK)
        1200 mV (VDDGFX)
        33.0 W (average GPU)=20=20=20=20=20=20=20=20

no flickering

3. Doing:

echo &quot;low&quot; &gt; /sys/class/drm/card0/device/power_dpm_force_perfo=
rmance_level

GFX Clocks and Power:
        875 MHz (MCLK)
        300 MHz (SCLK)
        300 MHz (PSTATE_SCLK)
        100 MHz (PSTATE_MCLK)
        750 mV (VDDGFX)
        30.0 W (average GPU)

no flickering

4. Then, before suspending:

echo &quot;auto&quot; &gt; /sys/class/drm/card0/device/power_dpm_force_perf=
ormance_level

5. Suspend, and resume:

auto

GFX Clocks and Power:
        100 MHz (MCLK)
        800 MHz (SCLK)
        300 MHz (PSTATE_SCLK)
        100 MHz (PSTATE_MCLK)
        750 mV (VDDGFX)
        10.0 W (average GPU)

strong flickering

6. After that doing:

echo 'high' &gt; power_dpm_force_performance_level

GFX Clocks and Power:
        875 MHz (MCLK)
        2045 MHz (SCLK)
        300 MHz (PSTATE_SCLK)
        100 MHz (PSTATE_MCLK)
        1200 mV (VDDGFX)
        33.0 W (average GPU)
no flickering

7. Doing:

echo 'low' &gt; power_dpm_force_performance_level

GFX Clocks and Power:
        100 MHz (MCLK)
        300 MHz (SCLK)
        300 MHz (PSTATE_SCLK)
        100 MHz (PSTATE_MCLK)
        750 mV (VDDGFX)
        10.0 W (average GPU)

no flickering!

8. And then:

echo 'auto' &gt; power_dpm_force_performance_level

GFX Clocks and Power:
        100 MHz (MCLK)
        800 MHz (SCLK)
        300 MHz (PSTATE_SCLK)
        100 MHz (PSTATE_MCLK)
        750 mV (VDDGFX)
        10.0 W (average GPU)

flickering again!</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15729146262.0AEf8.10543--

--===============1297164283==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1297164283==--
