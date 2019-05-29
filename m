Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B9DB2E187
	for <lists+dri-devel@lfdr.de>; Wed, 29 May 2019 17:49:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA3016E0F2;
	Wed, 29 May 2019 15:49:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id C353C6E0F2
 for <dri-devel@lists.freedesktop.org>; Wed, 29 May 2019 15:49:01 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id B94A872167; Wed, 29 May 2019 15:49:01 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110781] Radeon: heavy r300 performance drop regression between
 11.x and 19.x
Date: Wed, 29 May 2019 15:49:02 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Mesa
X-Bugzilla-Component: Drivers/Gallium/r300
X-Bugzilla-Version: git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: major
X-Bugzilla-Who: u9vata@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-110781-502-POTlwEXOzk@http.bugs.freedesktop.org/>
In-Reply-To: <bug-110781-502@http.bugs.freedesktop.org/>
References: <bug-110781-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0349011079=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0349011079==
Content-Type: multipart/alternative; boundary="15591449410.EffFE324.3939"
Content-Transfer-Encoding: 7bit


--15591449410.EffFE324.3939
Date: Wed, 29 May 2019 15:49:01 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110781

--- Comment #5 from Richard Thier <u9vata@gmail.com> ---
Still fast with mesa 17.2.8 and X.Org X Server 1.19.5

The problem is somewhere between 17.x and 19.x mesa versions (and correspon=
ding
xorg).

Also I have made an strace when it is good in one older system to see numbe=
r of
CREATE and CLOSE ioctl calls (also the number of CS ioctl calls) are a
magnitude smaller than in case of 19.x!

For example 10-20 seconds of glxgears running leads to 9-10 calls to
DRM_IOCTL_RADEON_GEM_CREATE on mesa 17.2.8 while it leads to 708 (!!!) numb=
er
of same calls in the same time period on mesa 19.x! This is surely a quite =
big
of a difference!

The similar pattern in 17.x is never creating a new gem object:

  ...
  ioctl(6, DRM_IOCTL_RADEON_GEM_WAIT_IDLE, 0xbfcf9f04) =3D 0 <0.000055>
  ioctl(6, DRM_IOCTL_RADEON_GEM_BUSY, 0xbfcf9d44) =3D 0 <0.000022>
  ioctl(6, DRM_IOCTL_RADEON_CS, 0xb307d03c) =3D 0 <0.000089>
  ioctl(6, DRM_IOCTL_RADEON_GEM_WAIT_IDLE, 0xbfcf9f04) =3D 0 <0.000053>
  ioctl(6, DRM_IOCTL_RADEON_GEM_BUSY, 0xbfcf9d44) =3D 0 <0.000023>
  ioctl(6, DRM_IOCTL_RADEON_CS, 0xb30910d0) =3D 0 <0.000095>
  ioctl(6, DRM_IOCTL_RADEON_GEM_WAIT_IDLE, 0xbfcf9f04) =3D 0 <0.000054>
  ioctl(6, DRM_IOCTL_RADEON_GEM_BUSY, 0xbfcf9d44) =3D 0 <0.000023>
  ioctl(6, DRM_IOCTL_RADEON_CS, 0xb307d03c) =3D 0 <0.000090>
  ...

Sometimes when the *_BUSY ioctl call returns -1, it issues a CREATE, but
otherwise not.

I think GEM is some kind of memory handler for the GPU (just like "ttm" in =
the
perf output) and I think something have messed up with memory handling sche=
mes
for Mobility Radeon 200M (r300) at some mesa update between 17.x and 19.x.

Will try to bisect a closer version as 17.2.8 is from 2017.12.22 in time...

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15591449410.EffFE324.3939
Date: Wed, 29 May 2019 15:49:01 +0000
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
   title=3D"NEW - Radeon: heavy r300 performance drop regression between 11=
.x and 19.x"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110781#c5">Commen=
t # 5</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Radeon: heavy r300 performance drop regression between 11=
.x and 19.x"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110781">bug 11078=
1</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
u9vata&#64;gmail.com" title=3D"Richard Thier &lt;u9vata&#64;gmail.com&gt;">=
 <span class=3D"fn">Richard Thier</span></a>
</span></b>
        <pre>Still fast with mesa 17.2.8 and X.Org X Server 1.19.5

The problem is somewhere between 17.x and 19.x mesa versions (and correspon=
ding
xorg).

Also I have made an strace when it is good in one older system to see numbe=
r of
CREATE and CLOSE ioctl calls (also the number of CS ioctl calls) are a
magnitude smaller than in case of 19.x!

For example 10-20 seconds of glxgears running leads to 9-10 calls to
DRM_IOCTL_RADEON_GEM_CREATE on mesa 17.2.8 while it leads to 708 (!!!) numb=
er
of same calls in the same time period on mesa 19.x! This is surely a quite =
big
of a difference!

The similar pattern in 17.x is never creating a new gem object:

  ...
  ioctl(6, DRM_IOCTL_RADEON_GEM_WAIT_IDLE, 0xbfcf9f04) =3D 0 &lt;0.000055&g=
t;
  ioctl(6, DRM_IOCTL_RADEON_GEM_BUSY, 0xbfcf9d44) =3D 0 &lt;0.000022&gt;
  ioctl(6, DRM_IOCTL_RADEON_CS, 0xb307d03c) =3D 0 &lt;0.000089&gt;
  ioctl(6, DRM_IOCTL_RADEON_GEM_WAIT_IDLE, 0xbfcf9f04) =3D 0 &lt;0.000053&g=
t;
  ioctl(6, DRM_IOCTL_RADEON_GEM_BUSY, 0xbfcf9d44) =3D 0 &lt;0.000023&gt;
  ioctl(6, DRM_IOCTL_RADEON_CS, 0xb30910d0) =3D 0 &lt;0.000095&gt;
  ioctl(6, DRM_IOCTL_RADEON_GEM_WAIT_IDLE, 0xbfcf9f04) =3D 0 &lt;0.000054&g=
t;
  ioctl(6, DRM_IOCTL_RADEON_GEM_BUSY, 0xbfcf9d44) =3D 0 &lt;0.000023&gt;
  ioctl(6, DRM_IOCTL_RADEON_CS, 0xb307d03c) =3D 0 &lt;0.000090&gt;
  ...

Sometimes when the *_BUSY ioctl call returns -1, it issues a CREATE, but
otherwise not.

I think GEM is some kind of memory handler for the GPU (just like &quot;ttm=
&quot; in the
perf output) and I think something have messed up with memory handling sche=
mes
for Mobility Radeon 200M (r300) at some mesa update between 17.x and 19.x.

Will try to bisect a closer version as 17.2.8 is from 2017.12.22 in time...=
</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15591449410.EffFE324.3939--

--===============0349011079==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0349011079==--
