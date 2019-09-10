Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E019AF1DF
	for <lists+dri-devel@lfdr.de>; Tue, 10 Sep 2019 21:27:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAF2C6E125;
	Tue, 10 Sep 2019 19:27:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id B48786E125
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Sep 2019 19:27:42 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id B17C972167; Tue, 10 Sep 2019 19:27:42 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111482] Sapphire Pulse RX 5700 XT power consumption
Date: Tue, 10 Sep 2019 19:27:43 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: DRI git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: freedesktop@postfach.xyz
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-111482-502-0kOb17IuTR@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1258706304=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1258706304==
Content-Type: multipart/alternative; boundary="15681436621.5A6d5f2f.23120"
Content-Transfer-Encoding: 7bit


--15681436621.5A6d5f2f.23120
Date: Tue, 10 Sep 2019 19:27:42 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111482

--- Comment #17 from Robert <freedesktop@postfach.xyz> ---
Thanks Andrew! I played around a little bit with the refresh rates. Between
40-60Hz there is no difference in idle power consumption. The mem clock sta=
ys
at 875Mhz and can't be changed.

The best refresh rate with 8W idle power consumption I could get was at 39H=
z:

cvt12 5120 1440 39 -b
xrandr --output DisplayPort-2 --newmode "5120x1440_39.00_rb2" 297.51  5120 =
5128
5160 5200  1440 1453 1461 1467 +hsync -vsync
xrandr --output DisplayPort-2 --addmode DisplayPort-2 "5120x1440_39.00_rb2"
xrandr --output DisplayPort-2 --mode "5120x1440_39.00_rb2"

This causes the mem clock to go up to 625Mhz at first but it can be switched
back to 100Mhz with

echo "0" > /sys/class/drm/card0/device/pp_dpm_mclk

Regarding my statement when using 30Hz in the last comment:

"""
It basically works but moving windows a little bit faster or moving the mou=
se
pointer around looks "interesting".
"""

For this "flickering" that I saw and which was quite annoying I found a
workaround :-) It looked like something didn't refresh fast enough. So I
thought playing around with some frequencies would be a good idea... And the
mem clock was the obvious one to start with. So I was setting the mem clock=
 to
500Mhz with

echo "1" > /sys/class/drm/card0/device/pp_dpm_mclk

Then the "flickering" went away :-) But of course that brought idle power
consumption to 24W. So just for fun I switched back to 100Mhz with

echo "0" > /sys/class/drm/card0/device/pp_dpm_mclk

Funny enough the "flickering" stayed away :-))) So for now after I start KDE
plasma I enter Konsole and execute

echo "1" > /sys/class/drm/card0/device/pp_dpm_mclk
echo "0" > /sys/class/drm/card0/device/pp_dpm_mclk

and be happy :D

One final observation: I tried out kernel 5.3-rc8. With that kernel there i=
s no
way to reduce idle power consumption. It stays at 34W regardless what you d=
o.
But with this tag
https://cgit.freedesktop.org/~agd5f/linux/tag/?h=3Ddrm-next-5.4-2019-08-30 =
(which
basically is kernel 5.3-rc3 with the Navi10 patches for kernel 5.4 - if I g=
ot
it right ;-) ) idle power consumption is as expected.=20

So my whole issue basically comes down to this: If you have a resolution of
5120x1440 and a refresh rate of > 39Hz your idle power consumption stays at=
 max
and there is (at least until now) nothing you can do about it. So if I had =
used
a lower resolution or a smaller screen I wouldn't have had an issue at all =
;-)
S... happens :D

But anyways: Thanks so much for your help and also to Ilia! I'm now happy w=
ith
my setup so far. It would be very interesting if there is really some kind =
of a
cap with 5120x1444@39Hz or if this this "only" a firmware problem, a driver
problem, a config error or something completely different. Maybe we'll find=
 out
in our next lives :D

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15681436621.5A6d5f2f.23120
Date: Tue, 10 Sep 2019 19:27:42 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111482#c17">Comme=
nt # 17</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Sapphire Pulse RX 5700 XT power consumption"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111482">bug 11148=
2</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
freedesktop&#64;postfach.xyz" title=3D"Robert &lt;freedesktop&#64;postfach.=
xyz&gt;"> <span class=3D"fn">Robert</span></a>
</span></b>
        <pre>Thanks Andrew! I played around a little bit with the refresh r=
ates. Between
40-60Hz there is no difference in idle power consumption. The mem clock sta=
ys
at 875Mhz and can't be changed.

The best refresh rate with 8W idle power consumption I could get was at 39H=
z:

cvt12 5120 1440 39 -b
xrandr --output DisplayPort-2 --newmode &quot;5120x1440_39.00_rb2&quot; 297=
.51  5120 5128
5160 5200  1440 1453 1461 1467 +hsync -vsync
xrandr --output DisplayPort-2 --addmode DisplayPort-2 &quot;5120x1440_39.00=
_rb2&quot;
xrandr --output DisplayPort-2 --mode &quot;5120x1440_39.00_rb2&quot;

This causes the mem clock to go up to 625Mhz at first but it can be switched
back to 100Mhz with

echo &quot;0&quot; &gt; /sys/class/drm/card0/device/pp_dpm_mclk

Regarding my statement when using 30Hz in the last comment:

&quot;&quot;&quot;
It basically works but moving windows a little bit faster or moving the mou=
se
pointer around looks &quot;interesting&quot;.
&quot;&quot;&quot;

For this &quot;flickering&quot; that I saw and which was quite annoying I f=
ound a
workaround :-) It looked like something didn't refresh fast enough. So I
thought playing around with some frequencies would be a good idea... And the
mem clock was the obvious one to start with. So I was setting the mem clock=
 to
500Mhz with

echo &quot;1&quot; &gt; /sys/class/drm/card0/device/pp_dpm_mclk

Then the &quot;flickering&quot; went away :-) But of course that brought id=
le power
consumption to 24W. So just for fun I switched back to 100Mhz with

echo &quot;0&quot; &gt; /sys/class/drm/card0/device/pp_dpm_mclk

Funny enough the &quot;flickering&quot; stayed away :-))) So for now after =
I start KDE
plasma I enter Konsole and execute

echo &quot;1&quot; &gt; /sys/class/drm/card0/device/pp_dpm_mclk
echo &quot;0&quot; &gt; /sys/class/drm/card0/device/pp_dpm_mclk

and be happy :D

One final observation: I tried out kernel 5.3-rc8. With that kernel there i=
s no
way to reduce idle power consumption. It stays at 34W regardless what you d=
o.
But with this tag
<a href=3D"https://cgit.freedesktop.org/~agd5f/linux/tag/?h=3Ddrm-next-5.4-=
2019-08-30">https://cgit.freedesktop.org/~agd5f/linux/tag/?h=3Ddrm-next-5.4=
-2019-08-30</a> (which
basically is kernel 5.3-rc3 with the Navi10 patches for kernel 5.4 - if I g=
ot
it right ;-) ) idle power consumption is as expected.=20

So my whole issue basically comes down to this: If you have a resolution of
5120x1440 and a refresh rate of &gt; 39Hz your idle power consumption stays=
 at max
and there is (at least until now) nothing you can do about it. So if I had =
used
a lower resolution or a smaller screen I wouldn't have had an issue at all =
;-)
S... happens :D

But anyways: Thanks so much for your help and also to Ilia! I'm now happy w=
ith
my setup so far. It would be very interesting if there is really some kind =
of a
cap with 5120x1444&#64;39Hz or if this this &quot;only&quot; a firmware pro=
blem, a driver
problem, a config error or something completely different. Maybe we'll find=
 out
in our next lives :D</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15681436621.5A6d5f2f.23120--

--===============1258706304==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1258706304==--
