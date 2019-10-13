Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A82AD557D
	for <lists+dri-devel@lfdr.de>; Sun, 13 Oct 2019 11:34:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 700C46E029;
	Sun, 13 Oct 2019 09:34:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 00F1B6E029
 for <dri-devel@lists.freedesktop.org>; Sun, 13 Oct 2019 09:34:05 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id E5B057296E; Sun, 13 Oct 2019 09:34:05 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111987] Unstable performance (periodic and repeating patterns
 of fps change) and changing VDDGFX
Date: Sun, 13 Oct 2019 09:34:06 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: XOrg git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: witold.baryluk+freedesktop@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-111987-502-n9y7tRpdih@http.bugs.freedesktop.org/>
In-Reply-To: <bug-111987-502@http.bugs.freedesktop.org/>
References: <bug-111987-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============2134190358=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============2134190358==
Content-Type: multipart/alternative; boundary="15709592450.c40cF.15771"
Content-Transfer-Encoding: 7bit


--15709592450.c40cF.15771
Date: Sun, 13 Oct 2019 09:34:05 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111987

--- Comment #8 from Witold Baryluk <witold.baryluk+freedesktop@gmail.com> -=
--
My random guess is that it is due to some bug in calculating gpu_busy_perce=
nt
possibly, or SCLK_{UP,DOWN}_HYST parameters:

Here is a dump of various values, when running Talos:

Sun Oct 13 09:29:46 UTC 2019
/sys/class/drm/renderD128/device files:
gpu_busy_percent:5
pp_num_states:states: 2
pp_num_states:0 boot
pp_num_states:1 performance
pp_cur_state:1
pp_power_profile_mode:NUM        MODE_NAME     SCLK_UP_HYST   SCLK_DOWN_HYST
SCLK_ACTIVE_LEVEL     MCLK_UP_HYST   MCLK_DOWN_HYST MCLK_ACTIVE_LEVEL
pp_power_profile_mode:  0   BOOTUP_DEFAULT:        -                -=20=20=
=20=20=20=20=20=20=20=20
     -                -                -                -
pp_power_profile_mode:  1   3D_FULL_SCREEN:        0              100=20=20=
=20=20=20=20=20=20=20=20
    30                0              100               10
pp_power_profile_mode:  2     POWER_SAVING:       10                0=20=20=
=20=20=20=20=20=20=20=20
    30                -                -                -
pp_power_profile_mode:  3            VIDEO:        -                -=20=20=
=20=20=20=20=20=20=20=20
     -               10               16               31
pp_power_profile_mode:  4               VR:        0               11=20=20=
=20=20=20=20=20=20=20=20
    50                0              100               10
pp_power_profile_mode:  5        COMPUTE *:        0                5=20=20=
=20=20=20=20=20=20=20=20
    30                0              100               10
pp_power_profile_mode:  6           CUSTOM:        -                -=20=20=
=20=20=20=20=20=20=20=20
     -                -                -                -
vbios_version:113-C8800100-102
revision:0xc8
mem_info_gtt_total:4294967296
mem_info_gtt_used:364883968
mem_info_vis_vram_total:268435456
mem_info_vis_vram_used:50188288
mem_info_vram_total:4294967296
mem_info_vram_used:2290094080
power_dpm_force_performance_level:manual
power_dpm_state:performance
hwmon/hwmon0/freq1_label:sclk
hwmon/hwmon0/freq1_input:944000000
hwmon/hwmon0/freq2_label:mclk
hwmon/hwmon0/freq2_input:500000000
hwmon/hwmon0/temp1_input:31000
hwmon/hwmon0/power1_average:85182000
hwmon/hwmon0/fan1_input:3069
hwmon/hwmon0/pwm1:239
hwmon/hwmon0/in0_label:vddgfx
hwmon/hwmon0/in0_input:1100
pp_dpm_mclk:0: 500Mhz *
pp_dpm_sclk:0: 300Mhz=20
pp_dpm_sclk:1: 512Mhz=20
pp_dpm_sclk:2: 724Mhz=20
pp_dpm_sclk:3: 892Mhz=20
pp_dpm_sclk:4: 944Mhz *
pp_dpm_sclk:5: 984Mhz=20
pp_dpm_sclk:6: 1018Mhz=20
pp_dpm_sclk:7: 1050Mhz=20
pp_mclk_od:0
pp_sclk_od:0
d3cold_allowed:1
power_dpm_force_performance_level:manual
/sys/class/drm/ttm/buffer_objects/bo_count:2997
/sys/kernel/debug/dri/0/clients:             command   pid dev master a   u=
id=20=20
   magic
/sys/kernel/debug/dri/0/clients:                Xorg 118921   0   y    y   =
  0=20
        0
/sys/kernel/debug/dri/0/clients:                Xorg 118921 128   n    y   =
  0=20
        0
/sys/kernel/debug/dri/0/clients:                Xorg 118921 128   n    y   =
  0=20
        0
/sys/kernel/debug/dri/0/clients:                Xorg 118921 128   n    y   =
  0=20
        0
/sys/kernel/debug/dri/0/clients:                Xorg 118921 128   n    y   =
  0=20
        0
/sys/kernel/debug/dri/0/clients:                Xorg 118921 128   n    y   =
  0=20
        0
/sys/kernel/debug/dri/0/clients:                Xorg 118921 128   n    y   =
  0=20
        0
/sys/kernel/debug/dri/0/clients:                Xorg 118921 128   n    y   =
  0=20
        0
/sys/kernel/debug/dri/0/clients:                Xorg 118921 128   n    y   =
  0=20
        0
/sys/kernel/debug/dri/0/clients:                Xorg 118921 128   n    y   =
  0=20
        0
/sys/kernel/debug/dri/0/clients:                Xorg 118921 128   n    y   =
  0=20
        0
/sys/kernel/debug/dri/0/clients:               Talos 37263 128   n    n  10=
00=20=20
       0


The default pp_power_profile_mode was 1 (3D_FULL_SCREEN). I switched it just
now to 5 (COMPUTE), but results are the same.

The gpu_busy_percent switches every second between something close to 0 and
something close to 100. Despite the game constantly submitting the work and
rendering at ~200 FPS.

The pp_dpm_sclk starts high and slowly goes down step by step, and eventual=
ly
goes back to 7 (1050MHz), and process repeats.

I tried doing:

echo "7" >  /sys/class/drm/card0/device/pp_dpm_sclk
echo "manual" > /sys/class/drm/card0/device/power_dpm_force_performance_lev=
el

and I see no differences, still same effect.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15709592450.c40cF.15771
Date: Sun, 13 Oct 2019 09:34:05 +0000
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
   title=3D"NEW - Unstable performance (periodic and repeating patterns of =
fps change) and changing VDDGFX"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111987#c8">Commen=
t # 8</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Unstable performance (periodic and repeating patterns of =
fps change) and changing VDDGFX"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111987">bug 11198=
7</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
witold.baryluk+freedesktop&#64;gmail.com" title=3D"Witold Baryluk &lt;witol=
d.baryluk+freedesktop&#64;gmail.com&gt;"> <span class=3D"fn">Witold Baryluk=
</span></a>
</span></b>
        <pre>My random guess is that it is due to some bug in calculating g=
pu_busy_percent
possibly, or SCLK_{UP,DOWN}_HYST parameters:

Here is a dump of various values, when running Talos:

Sun Oct 13 09:29:46 UTC 2019
/sys/class/drm/renderD128/device files:
gpu_busy_percent:5
pp_num_states:states: 2
pp_num_states:0 boot
pp_num_states:1 performance
pp_cur_state:1
pp_power_profile_mode:NUM        MODE_NAME     SCLK_UP_HYST   SCLK_DOWN_HYST
SCLK_ACTIVE_LEVEL     MCLK_UP_HYST   MCLK_DOWN_HYST MCLK_ACTIVE_LEVEL
pp_power_profile_mode:  0   BOOTUP_DEFAULT:        -                -=20=20=
=20=20=20=20=20=20=20=20
     -                -                -                -
pp_power_profile_mode:  1   3D_FULL_SCREEN:        0              100=20=20=
=20=20=20=20=20=20=20=20
    30                0              100               10
pp_power_profile_mode:  2     POWER_SAVING:       10                0=20=20=
=20=20=20=20=20=20=20=20
    30                -                -                -
pp_power_profile_mode:  3            VIDEO:        -                -=20=20=
=20=20=20=20=20=20=20=20
     -               10               16               31
pp_power_profile_mode:  4               VR:        0               11=20=20=
=20=20=20=20=20=20=20=20
    50                0              100               10
pp_power_profile_mode:  5        COMPUTE *:        0                5=20=20=
=20=20=20=20=20=20=20=20
    30                0              100               10
pp_power_profile_mode:  6           CUSTOM:        -                -=20=20=
=20=20=20=20=20=20=20=20
     -                -                -                -
vbios_version:113-C8800100-102
revision:0xc8
mem_info_gtt_total:4294967296
mem_info_gtt_used:364883968
mem_info_vis_vram_total:268435456
mem_info_vis_vram_used:50188288
mem_info_vram_total:4294967296
mem_info_vram_used:2290094080
power_dpm_force_performance_level:manual
power_dpm_state:performance
hwmon/hwmon0/freq1_label:sclk
hwmon/hwmon0/freq1_input:944000000
hwmon/hwmon0/freq2_label:mclk
hwmon/hwmon0/freq2_input:500000000
hwmon/hwmon0/temp1_input:31000
hwmon/hwmon0/power1_average:85182000
hwmon/hwmon0/fan1_input:3069
hwmon/hwmon0/pwm1:239
hwmon/hwmon0/in0_label:vddgfx
hwmon/hwmon0/in0_input:1100
pp_dpm_mclk:0: 500Mhz *
pp_dpm_sclk:0: 300Mhz=20
pp_dpm_sclk:1: 512Mhz=20
pp_dpm_sclk:2: 724Mhz=20
pp_dpm_sclk:3: 892Mhz=20
pp_dpm_sclk:4: 944Mhz *
pp_dpm_sclk:5: 984Mhz=20
pp_dpm_sclk:6: 1018Mhz=20
pp_dpm_sclk:7: 1050Mhz=20
pp_mclk_od:0
pp_sclk_od:0
d3cold_allowed:1
power_dpm_force_performance_level:manual
/sys/class/drm/ttm/buffer_objects/bo_count:2997
/sys/kernel/debug/dri/0/clients:             command   pid dev master a   u=
id=20=20
   magic
/sys/kernel/debug/dri/0/clients:                Xorg 118921   0   y    y   =
  0=20
        0
/sys/kernel/debug/dri/0/clients:                Xorg 118921 128   n    y   =
  0=20
        0
/sys/kernel/debug/dri/0/clients:                Xorg 118921 128   n    y   =
  0=20
        0
/sys/kernel/debug/dri/0/clients:                Xorg 118921 128   n    y   =
  0=20
        0
/sys/kernel/debug/dri/0/clients:                Xorg 118921 128   n    y   =
  0=20
        0
/sys/kernel/debug/dri/0/clients:                Xorg 118921 128   n    y   =
  0=20
        0
/sys/kernel/debug/dri/0/clients:                Xorg 118921 128   n    y   =
  0=20
        0
/sys/kernel/debug/dri/0/clients:                Xorg 118921 128   n    y   =
  0=20
        0
/sys/kernel/debug/dri/0/clients:                Xorg 118921 128   n    y   =
  0=20
        0
/sys/kernel/debug/dri/0/clients:                Xorg 118921 128   n    y   =
  0=20
        0
/sys/kernel/debug/dri/0/clients:                Xorg 118921 128   n    y   =
  0=20
        0
/sys/kernel/debug/dri/0/clients:               Talos 37263 128   n    n  10=
00=20=20
       0


The default pp_power_profile_mode was 1 (3D_FULL_SCREEN). I switched it just
now to 5 (COMPUTE), but results are the same.

The gpu_busy_percent switches every second between something close to 0 and
something close to 100. Despite the game constantly submitting the work and
rendering at ~200 FPS.

The pp_dpm_sclk starts high and slowly goes down step by step, and eventual=
ly
goes back to 7 (1050MHz), and process repeats.

I tried doing:

echo &quot;7&quot; &gt;  /sys/class/drm/card0/device/pp_dpm_sclk
echo &quot;manual&quot; &gt; /sys/class/drm/card0/device/power_dpm_force_pe=
rformance_level

and I see no differences, still same effect.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15709592450.c40cF.15771--

--===============2134190358==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============2134190358==--
