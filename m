Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FC969C803
	for <lists+dri-devel@lfdr.de>; Mon, 26 Aug 2019 05:47:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EED96E167;
	Mon, 26 Aug 2019 03:47:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id D871E6E16B
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Aug 2019 03:47:41 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id D2BF772161; Mon, 26 Aug 2019 03:47:41 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110674] Crashes / Resets From AMDGPU / Radeon VII
Date: Mon, 26 Aug 2019 03:47:41 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: major
X-Bugzilla-Who: reddestdream@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-110674-502-lmE0RWAfFY@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0494438840=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0494438840==
Content-Type: multipart/alternative; boundary="15667912613.C1c00.13995"
Content-Transfer-Encoding: 7bit


--15667912613.C1c00.13995
Date: Mon, 26 Aug 2019 03:47:41 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110674

--- Comment #121 from ReddestDream <reddestdream@gmail.com> ---
Some observations:

1. Nothing at all seems to be up with cur_speed and cur_width. They get set
several times in a row in both runs, but the values are all the same in bot=
h.

2. I can't really see anything up with msg/parameter either. When I compare
them to each other nothing seems particularly wacky. And we also have an
instance in my AMD+iGPU run where we see msg/parameter after "[drm] Initial=
ized
amdgpu", so the theory that all messages have to be sent before Initializat=
ion
is complete must be wrong.

Now the real question is if we can decode what these msg/parameter values m=
ean.
But it looks more likely to me that vega20_hwmgr.c and vega20_ppt.c are just
bugged somewhere (probably in the same way since they seem to be alternate
versions of each) and that the rest of the amdgpu code is (relatively) fine.

I'm thinking we'll have to go through and knock out/debug pretty much
everything in those files until we figure out where the breakage is. That's
about 3000-4000 lines of code in each of those two files tho. So any though=
ts
anyone has about where we should start would be helpful. My focus will prob=
ably
be on UCLK (since it seems to break first), SCLK (since it gets set to 0 MHz
when there's multiple displays), DCEFCLK, and basically anything else that
smells like it might control the memory clock and/or be affected by multiple
monitors.

Thanks!

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15667912613.C1c00.13995
Date: Mon, 26 Aug 2019 03:47:41 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110674#c121">Comm=
ent # 121</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Crashes / Resets From AMDGPU / Radeon VII"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110674">bug 11067=
4</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
reddestdream&#64;gmail.com" title=3D"ReddestDream &lt;reddestdream&#64;gmai=
l.com&gt;"> <span class=3D"fn">ReddestDream</span></a>
</span></b>
        <pre>Some observations:

1. Nothing at all seems to be up with cur_speed and cur_width. They get set
several times in a row in both runs, but the values are all the same in bot=
h.

2. I can't really see anything up with msg/parameter either. When I compare
them to each other nothing seems particularly wacky. And we also have an
instance in my AMD+iGPU run where we see msg/parameter after &quot;[drm] In=
itialized
amdgpu&quot;, so the theory that all messages have to be sent before Initia=
lization
is complete must be wrong.

Now the real question is if we can decode what these msg/parameter values m=
ean.
But it looks more likely to me that vega20_hwmgr.c and vega20_ppt.c are just
bugged somewhere (probably in the same way since they seem to be alternate
versions of each) and that the rest of the amdgpu code is (relatively) fine.

I'm thinking we'll have to go through and knock out/debug pretty much
everything in those files until we figure out where the breakage is. That's
about 3000-4000 lines of code in each of those two files tho. So any though=
ts
anyone has about where we should start would be helpful. My focus will prob=
ably
be on UCLK (since it seems to break first), SCLK (since it gets set to 0 MHz
when there's multiple displays), DCEFCLK, and basically anything else that
smells like it might control the memory clock and/or be affected by multiple
monitors.

Thanks!</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15667912613.C1c00.13995--

--===============0494438840==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0494438840==--
