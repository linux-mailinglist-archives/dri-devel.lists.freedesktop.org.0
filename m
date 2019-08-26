Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B5D19D8A3
	for <lists+dri-devel@lfdr.de>; Mon, 26 Aug 2019 23:45:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69AE66E316;
	Mon, 26 Aug 2019 21:45:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 4C5566E2F9
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Aug 2019 21:45:45 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 3F37C72161; Mon, 26 Aug 2019 21:45:45 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110865] Rx480 consumes 20w more power in idle than under Windows
Date: Mon, 26 Aug 2019 21:45:45 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: DRI git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: enhancement
X-Bugzilla-Who: Dieter@nuetzel-hh.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-110865-502-TdsEGblj3V@http.bugs.freedesktop.org/>
In-Reply-To: <bug-110865-502@http.bugs.freedesktop.org/>
References: <bug-110865-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1658202122=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1658202122==
Content-Type: multipart/alternative; boundary="15668559450.aAACcA1.2572"
Content-Transfer-Encoding: 7bit


--15668559450.aAACcA1.2572
Date: Mon, 26 Aug 2019 21:45:45 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110865

--- Comment #22 from Dieter N=C3=BCtzel <Dieter@nuetzel-hh.de> ---
Hello Alex and Martin,

I've tried both on my

Polaris 20, RX580 8 GB Sapphire Technology Limited Nitro+ Radeon RX 580

- v2 patched into amd-staging-drm-next (before inclusion of v3)
- v3 with amd-staging-drm-next
https://cgit.freedesktop.org/~agd5f/linux/commit/?h=3Damd-staging-drm-next&=
id=3Dca82748783d8189a54a85f2ea1c2710182ba6138

Both flicker with green/black (?) horizontally lines over both screens.
Mostly during power level switch. For example during mouse movement/interac=
tion
(wheel) and mouse pointer traverse from konsole/etc. to desktop (KDE5 Plasma
5.xx, here).

UVD load (mplayer etc.) is not enough to fix it.
E.g. radv (vkcube) not.

But other gfx load (vkmark/glmark2, etc.).
When there is lower gfx demand during the above tests (glmark2 -b buffer) t=
he
flicker came up, again.

Martin's observation

[-]
If i do=20
"echo low > /sys/class/drm/card0/device/power_dpm_force_performance_level"
the flickering stops.
So the flickering is caused by the automatic powermanagement / reclocking.
[-]

Works here, too (tested with v3).

But I never could go below ~32 W !!!
Tested with both Nitro+ BIOS modes.

The PSTATE_xxxx wouldn't change on my card. They stay @ 600/1000 all the ti=
me!?

GFX Clocks and Power:
        300 MHz (MCLK)
        300 MHz (SCLK)
        600 MHz (PSTATE_SCLK)
        1000 MHz (PSTATE_MCLK)
        750 mV (VDDGFX)
        32.76 W (average GPU)

GPU Temperature: 31 C
GPU Load: 0 %
MEM Load: 3 %

Any hints?

And sorry for my bad English this time - my best friend from beginning of
German Gymnasium died after 6 years of fight against cancer. He aged only 5=
2.
Leaving a wife and two little girls...

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15668559450.aAACcA1.2572
Date: Mon, 26 Aug 2019 21:45:45 +0000
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
   title=3D"NEW - Rx480 consumes 20w more power in idle than under Windows"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110865#c22">Comme=
nt # 22</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Rx480 consumes 20w more power in idle than under Windows"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110865">bug 11086=
5</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
Dieter&#64;nuetzel-hh.de" title=3D"Dieter N=C3=BCtzel &lt;Dieter&#64;nuetze=
l-hh.de&gt;"> <span class=3D"fn">Dieter N=C3=BCtzel</span></a>
</span></b>
        <pre>Hello Alex and Martin,

I've tried both on my

Polaris 20, RX580 8 GB Sapphire Technology Limited Nitro+ Radeon RX 580

- v2 patched into amd-staging-drm-next (before inclusion of v3)
- v3 with amd-staging-drm-next
<a href=3D"https://cgit.freedesktop.org/~agd5f/linux/commit/?h=3Damd-stagin=
g-drm-next&amp;id=3Dca82748783d8189a54a85f2ea1c2710182ba6138">https://cgit.=
freedesktop.org/~agd5f/linux/commit/?h=3Damd-staging-drm-next&amp;id=3Dca82=
748783d8189a54a85f2ea1c2710182ba6138</a>

Both flicker with green/black (?) horizontally lines over both screens.
Mostly during power level switch. For example during mouse movement/interac=
tion
(wheel) and mouse pointer traverse from konsole/etc. to desktop (KDE5 Plasma
5.xx, here).

UVD load (mplayer etc.) is not enough to fix it.
E.g. radv (vkcube) not.

But other gfx load (vkmark/glmark2, etc.).
When there is lower gfx demand during the above tests (glmark2 -b buffer) t=
he
flicker came up, again.

Martin's observation

[-]
If i do=20
&quot;echo low &gt; /sys/class/drm/card0/device/power_dpm_force_performance=
_level&quot;
the flickering stops.
So the flickering is caused by the automatic powermanagement / reclocking.
[-]

Works here, too (tested with v3).

But I never could go below ~32 W !!!
Tested with both Nitro+ BIOS modes.

The PSTATE_xxxx wouldn't change on my card. They stay &#64; 600/1000 all th=
e time!?

GFX Clocks and Power:
        300 MHz (MCLK)
        300 MHz (SCLK)
        600 MHz (PSTATE_SCLK)
        1000 MHz (PSTATE_MCLK)
        750 mV (VDDGFX)
        32.76 W (average GPU)

GPU Temperature: 31 C
GPU Load: 0 %
MEM Load: 3 %

Any hints?

And sorry for my bad English this time - my best friend from beginning of
German Gymnasium died after 6 years of fight against cancer. He aged only 5=
2.
Leaving a wife and two little girls...</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15668559450.aAACcA1.2572--

--===============1658202122==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1658202122==--
