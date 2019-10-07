Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 798AACDD5C
	for <lists+dri-devel@lfdr.de>; Mon,  7 Oct 2019 10:31:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FF736E4D4;
	Mon,  7 Oct 2019 08:31:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 2D1406E4D4
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Oct 2019 08:31:25 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 2A27472162; Mon,  7 Oct 2019 08:31:25 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111482] Sapphire Pulse RX 5700 XT power consumption
Date: Mon, 07 Oct 2019 08:31:25 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: DRI git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: asheldon55@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-111482-502-s7fvQ8kUlF@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1477752564=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1477752564==
Content-Type: multipart/alternative; boundary="15704370850.5A9afcF4.4858"
Content-Transfer-Encoding: 7bit


--15704370850.5A9afcF4.4858
Date: Mon, 7 Oct 2019 08:31:25 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111482

--- Comment #26 from Andrew Sheldon <asheldon55@gmail.com> ---
(In reply to Eduardo from comment #25)=20
> I have a PowerColor RedDevil 5700XT and for me, Kernel 5.4-rc1 just works=
.=20=20
> Memory clocks always at 100Mhz when idle,
even using KDE (Plasma 5.16).

> I'm using Display Port, with FreeSync ON, on a 75HZ monitor, with 2560x10=
80
> resolution.

It works for you because your resolution is below a certain threshold in
resolution and refresh rate, and not a multi-monitor setup.

Anyway, I think I have a clearer picture of things now.

Firstly, Navi does still have a few additional power consumption issues (as
compared to Vega). One such issue is that if during the boot sequence the
monitor switches to 144hz (the default on one of my monitors), than that's =
it,
it's impossible to clock down from the maximum mclk at any point. One
workaround is to boot with the monitor unplugged, then plug it in after. It
seems to happen later in the boot sequence (but before X) so it's possible =
this
can be worked around by changing framebuffer settings.  Furthermore,
2560x1440@144hz in general forces the card to the maximum clock (even with =
the
workaround, although you can switch down to a different mode at least), whe=
reas
Vega stays at a lower mclk.

Secondly, multi-monitor configurations will force the card to the maximum
clock, by design (on all GPUs). You can workaround this by setting both car=
ds
to the same resolution/refresh rate, provided you have a newer kernel. Howe=
ver,
this doesn't work with Navi. Another hacky workaround is to write data to t=
he
powerplay tables while in dual-monitor setup with mismatched modes, but thi=
s is
just a hack, and I can't promise stability (although it worked for me, agai=
n,
only with Vega).

Thirdly, Navi uses a lot more power at idle compared to Vega, even when both
are
in the maximum mclk.  E.g. Vega uses around 15W, in a multi-monitor
configuration (2560x1440@90 + 2560x1440@144).
Whereas Navi will use 36W for pretty much any configuration that hits the
maximum mclk. It could be that HBM is more efficient, lower voltages, or ev=
en a
reporting error (I haven't tested at the wall, yet).

So in short:
- Navi + 144hz at boot completely breaks mclk switching=20
- Navi + 144hz uses unnecessarily high mclk (compared to Vega)
- Multi-monitor high mclk is by design (all GPUs)
- Navi uses a lot more power at idle than Vega, when at the same mclk

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15704370850.5A9afcF4.4858
Date: Mon, 7 Oct 2019 08:31:25 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111482#c26">Comme=
nt # 26</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Sapphire Pulse RX 5700 XT power consumption"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111482">bug 11148=
2</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
asheldon55&#64;gmail.com" title=3D"Andrew Sheldon &lt;asheldon55&#64;gmail.=
com&gt;"> <span class=3D"fn">Andrew Sheldon</span></a>
</span></b>
        <pre>(In reply to Eduardo from <a href=3D"show_bug.cgi?id=3D111482#=
c25">comment #25</a>)=20
<span class=3D"quote">&gt; I have a PowerColor RedDevil 5700XT and for me, =
Kernel 5.4-rc1 just works.=20=20
&gt; Memory clocks always at 100Mhz when idle,</span >
even using KDE (Plasma 5.16).

<span class=3D"quote">&gt; I'm using Display Port, with FreeSync ON, on a 7=
5HZ monitor, with 2560x1080
&gt; resolution.</span >

It works for you because your resolution is below a certain threshold in
resolution and refresh rate, and not a multi-monitor setup.

Anyway, I think I have a clearer picture of things now.

Firstly, Navi does still have a few additional power consumption issues (as
compared to Vega). One such issue is that if during the boot sequence the
monitor switches to 144hz (the default on one of my monitors), than that's =
it,
it's impossible to clock down from the maximum mclk at any point. One
workaround is to boot with the monitor unplugged, then plug it in after. It
seems to happen later in the boot sequence (but before X) so it's possible =
this
can be worked around by changing framebuffer settings.  Furthermore,
2560x1440&#64;144hz in general forces the card to the maximum clock (even w=
ith the
workaround, although you can switch down to a different mode at least), whe=
reas
Vega stays at a lower mclk.

Secondly, multi-monitor configurations will force the card to the maximum
clock, by design (on all GPUs). You can workaround this by setting both car=
ds
to the same resolution/refresh rate, provided you have a newer kernel. Howe=
ver,
this doesn't work with Navi. Another hacky workaround is to write data to t=
he
powerplay tables while in dual-monitor setup with mismatched modes, but thi=
s is
just a hack, and I can't promise stability (although it worked for me, agai=
n,
only with Vega).

Thirdly, Navi uses a lot more power at idle compared to Vega, even when both
are
in the maximum mclk.  E.g. Vega uses around 15W, in a multi-monitor
configuration (2560x1440&#64;90 + 2560x1440&#64;144).
Whereas Navi will use 36W for pretty much any configuration that hits the
maximum mclk. It could be that HBM is more efficient, lower voltages, or ev=
en a
reporting error (I haven't tested at the wall, yet).

So in short:
- Navi + 144hz at boot completely breaks mclk switching=20
- Navi + 144hz uses unnecessarily high mclk (compared to Vega)
- Multi-monitor high mclk is by design (all GPUs)
- Navi uses a lot more power at idle than Vega, when at the same mclk</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15704370850.5A9afcF4.4858--

--===============1477752564==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1477752564==--
