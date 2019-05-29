Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B7942E6CA
	for <lists+dri-devel@lfdr.de>; Wed, 29 May 2019 22:56:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2694890F9;
	Wed, 29 May 2019 20:56:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 58F8A890F9
 for <dri-devel@lists.freedesktop.org>; Wed, 29 May 2019 20:56:40 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 4E3FF72167; Wed, 29 May 2019 20:56:40 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110659] pageflipping seems to cause jittering on mouse input
 when running Hitman 2 in Wine/DXVK with amdgpu.dc=1
Date: Wed, 29 May 2019 20:56:40 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: tempel.julian@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-110659-502-oqke5tWnhD@http.bugs.freedesktop.org/>
In-Reply-To: <bug-110659-502@http.bugs.freedesktop.org/>
References: <bug-110659-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1147148940=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1147148940==
Content-Type: multipart/alternative; boundary="15591634000.4fDc.12745"
Content-Transfer-Encoding: 7bit


--15591634000.4fDc.12745
Date: Wed, 29 May 2019 20:56:40 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110659

--- Comment #20 from tempel.julian@gmail.com ---
I forgot that I patched this PR into my Xserver:
https://gitlab.freedesktop.org/xorg/xserver/merge_requests/36
It is responsible for the blocked gamma adjustment and the better desktop
window performance of the modesetting Xorg driver with the experimental ato=
mic
modesetting kernel patches vs. the xf86-video-amdgpu driver.

So, since everything got a bit messy, let me recap the results and add a few
more details:

-The experimental atomic modesetting kernel patches actually improve the
performance for desktop window usage for one aspect: When I open
www.vsynctester.com in Chromium and quickly hover the mouse cursor over my
system tray to trigger popup windows, this doesn't result in stuttering
anymore. The same applies to little text popups (e.g. URLs of links) during
regular web browsing. This is the case with both modesetting and
xf86-video-amdgpu, window compositing is enabled and 100% free of tearing at
the same time.

-But there is still stutter on www.vsynctester.com in Chromium (please don't
use Firefox for this, it even stutters on MS Windows when doing this...) wh=
en I
hide and show any other window, e.g. of running Dolphin file browser by
clicking its starter icon in the taskbar. It's just the window that is shown
and hidden, the program itself continues running all the time. This applies=
 to
both modesetting and xf86-video-amdgpu driver.

-But when I apply the aforementioned "WIP: modesetting: Use atomic more
atomically" patch to Xserver (additionally to the experimental atomic
modesetting kernel patches), the modesetting driver is also 100% free of
stutter in this situation, while the xf86-video-amdgpu-driver is not.
Question is: Can this also be incorporated into the xf86-video-amdgpu drive=
r?
This would be a VAST improvement, the stuttering during gamma adjustments i=
mho
is not close to being as important.

-Now back to the stutter in games when moving the mouse: This is completely
untouched by all this. The xf86-video-amdgpu driver always show stuttering =
in
the mentioned games (as long as amdgpu.dc=3D1), while modesetting and also
xwayland don't.


Oof, I hope I didn't forget anything. ;)

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15591634000.4fDc.12745
Date: Wed, 29 May 2019 20:56:40 +0000
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
   title=3D"NEW - pageflipping seems to cause jittering on mouse input when=
 running Hitman 2 in Wine/DXVK with amdgpu.dc=3D1"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110659#c20">Comme=
nt # 20</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - pageflipping seems to cause jittering on mouse input when=
 running Hitman 2 in Wine/DXVK with amdgpu.dc=3D1"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110659">bug 11065=
9</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
tempel.julian&#64;gmail.com" title=3D"tempel.julian&#64;gmail.com">tempel.j=
ulian&#64;gmail.com</a>
</span></b>
        <pre>I forgot that I patched this PR into my Xserver:
<a href=3D"https://gitlab.freedesktop.org/xorg/xserver/merge_requests/36">h=
ttps://gitlab.freedesktop.org/xorg/xserver/merge_requests/36</a>
It is responsible for the blocked gamma adjustment and the better desktop
window performance of the modesetting Xorg driver with the experimental ato=
mic
modesetting kernel patches vs. the xf86-video-amdgpu driver.

So, since everything got a bit messy, let me recap the results and add a few
more details:

-The experimental atomic modesetting kernel patches actually improve the
performance for desktop window usage for one aspect: When I open
www.vsynctester.com in Chromium and quickly hover the mouse cursor over my
system tray to trigger popup windows, this doesn't result in stuttering
anymore. The same applies to little text popups (e.g. URLs of links) during
regular web browsing. This is the case with both modesetting and
xf86-video-amdgpu, window compositing is enabled and 100% free of tearing at
the same time.

-But there is still stutter on www.vsynctester.com in Chromium (please don't
use Firefox for this, it even stutters on MS Windows when doing this...) wh=
en I
hide and show any other window, e.g. of running Dolphin file browser by
clicking its starter icon in the taskbar. It's just the window that is shown
and hidden, the program itself continues running all the time. This applies=
 to
both modesetting and xf86-video-amdgpu driver.

-But when I apply the aforementioned &quot;WIP: modesetting: Use atomic more
atomically&quot; patch to Xserver (additionally to the experimental atomic
modesetting kernel patches), the modesetting driver is also 100% free of
stutter in this situation, while the xf86-video-amdgpu-driver is not.
Question is: Can this also be incorporated into the xf86-video-amdgpu drive=
r?
This would be a VAST improvement, the stuttering during gamma adjustments i=
mho
is not close to being as important.

-Now back to the stutter in games when moving the mouse: This is completely
untouched by all this. The xf86-video-amdgpu driver always show stuttering =
in
the mentioned games (as long as amdgpu.dc=3D1), while modesetting and also
xwayland don't.


Oof, I hope I didn't forget anything. ;)</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15591634000.4fDc.12745--

--===============1147148940==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1147148940==--
