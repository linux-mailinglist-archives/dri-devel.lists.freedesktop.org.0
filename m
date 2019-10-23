Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CBECDE14BE
	for <lists+dri-devel@lfdr.de>; Wed, 23 Oct 2019 10:51:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A6BD6E9EC;
	Wed, 23 Oct 2019 08:51:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 7B04C6E9F2
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Oct 2019 08:51:29 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 78283720E2; Wed, 23 Oct 2019 08:51:29 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 109955] amdgpu [RX Vega 64] system freeze while gaming
Date: Wed, 23 Oct 2019 08:51:29 +0000
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
Message-ID: <bug-109955-502-51UcIrkY3Z@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1908157518=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1908157518==
Content-Type: multipart/alternative; boundary="15718206896.da3e5.29017"
Content-Transfer-Encoding: 7bit


--15718206896.da3e5.29017
Date: Wed, 23 Oct 2019 08:51:29 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D109955

--- Comment #119 from haro41@gmx.de ---
bellow is a simple script, i use to record dpm data in the background:

######################################################
#!/bin/bash

# adapt this sample inverval (seconds)
SLEEP_INTERVAL=3D0.05

# adapt the paths to your need
FILE_SCLK=3D/sys/class/drm/card0/device/hwmon/hwmon0/freq1_input
FILE_MCLK=3D/sys/class/drm/card0/device/hwmon/hwmon0/freq2_input
FILE_PWM=3D/sys/class/drm/card0/device/hwmon/hwmon0/pwm1
FILE_TEMP=3D/sys/class/drm/card0/device/hwmon/hwmon0/temp1_input
FILE_FAN=3D/sys/class/drm/card0/device/hwmon/hwmon0/fan1_input
FILE_GFXVDD=3D/sys/class/drm/card0/device/hwmon/hwmon0/in0_input
FILE_POW=3D/sys/class/drm/card0/device/hwmon/hwmon0/power1_average
FILE_BUS=3D/sys/class/drm/card0/device/gpu_busy_percent

# checking for privileges
if [ $UID -ne 0 ]
then
  echo "Writing to sysfs requires privileges, relaunch as root"
  exit 1
fi

function read_output {

  SCLK=3D$(cat $FILE_SCLK)
  MCLK=3D$(cat $FILE_MCLK)
  TEMP=3D$(cat $FILE_TEMP)
  FAN=3D$(cat $FILE_FAN)
  GFXVDD=3D$(cat $FILE_GFXVDD)
  POW=3D$(cat $FILE_POW)
  BUS=3D$(cat $FILE_BUS)

#  echo "sclk: $SCLK mclk: $MCLK gfx_vdd: $GFXVDD"
  echo "sclk: $SCLK mclk: $MCLK temp: $TEMP fan: $FAN gfx_vdd: $GFXVDD pow:
$POW bus: $BUS"
}

function run_daemon {
  while :; do
    read_output
    sleep $SLEEP_INTERVAL
  done
}

# finally start the loop
run_daemon

######################################################

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15718206896.da3e5.29017
Date: Wed, 23 Oct 2019 08:51:29 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109955#c119">Comm=
ent # 119</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - amdgpu [RX Vega 64] system freeze while gaming"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109955">bug 10995=
5</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
haro41&#64;gmx.de" title=3D"haro41&#64;gmx.de">haro41&#64;gmx.de</a>
</span></b>
        <pre>bellow is a simple script, i use to record dpm data in the bac=
kground:

######################################################
#!/bin/bash

# adapt this sample inverval (seconds)
SLEEP_INTERVAL=3D0.05

# adapt the paths to your need
FILE_SCLK=3D/sys/class/drm/card0/device/hwmon/hwmon0/freq1_input
FILE_MCLK=3D/sys/class/drm/card0/device/hwmon/hwmon0/freq2_input
FILE_PWM=3D/sys/class/drm/card0/device/hwmon/hwmon0/pwm1
FILE_TEMP=3D/sys/class/drm/card0/device/hwmon/hwmon0/temp1_input
FILE_FAN=3D/sys/class/drm/card0/device/hwmon/hwmon0/fan1_input
FILE_GFXVDD=3D/sys/class/drm/card0/device/hwmon/hwmon0/in0_input
FILE_POW=3D/sys/class/drm/card0/device/hwmon/hwmon0/power1_average
FILE_BUS=3D/sys/class/drm/card0/device/gpu_busy_percent

# checking for privileges
if [ $UID -ne 0 ]
then
  echo &quot;Writing to sysfs requires privileges, relaunch as root&quot;
  exit 1
fi

function read_output {

  SCLK=3D$(cat $FILE_SCLK)
  MCLK=3D$(cat $FILE_MCLK)
  TEMP=3D$(cat $FILE_TEMP)
  FAN=3D$(cat $FILE_FAN)
  GFXVDD=3D$(cat $FILE_GFXVDD)
  POW=3D$(cat $FILE_POW)
  BUS=3D$(cat $FILE_BUS)

#  echo &quot;sclk: $SCLK mclk: $MCLK gfx_vdd: $GFXVDD&quot;
  echo &quot;sclk: $SCLK mclk: $MCLK temp: $TEMP fan: $FAN gfx_vdd: $GFXVDD=
 pow:
$POW bus: $BUS&quot;
}

function run_daemon {
  while :; do
    read_output
    sleep $SLEEP_INTERVAL
  done
}

# finally start the loop
run_daemon

######################################################</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15718206896.da3e5.29017--

--===============1908157518==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1908157518==--
