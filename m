Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E35B249E3
	for <lists+dri-devel@lfdr.de>; Tue, 21 May 2019 10:11:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54C2889254;
	Tue, 21 May 2019 08:11:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id CC23C89254
 for <dri-devel@lists.freedesktop.org>; Tue, 21 May 2019 08:11:34 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id C8AF472167; Tue, 21 May 2019 08:11:34 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110674] Crashes / Resets From AMDGPU / Radeon VII
Date: Tue, 21 May 2019 08:11:34 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: major
X-Bugzilla-Who: chris@hodapp.email
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-110674-502-gpXFTD03cA@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0145221271=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0145221271==
Content-Type: multipart/alternative; boundary="15584262943.1A9F9d1be.32260"
Content-Transfer-Encoding: 7bit


--15584262943.1A9F9d1be.32260
Date: Tue, 21 May 2019 08:11:34 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110674

--- Comment #30 from Chris Hodapp <chris@hodapp.email> ---
Some interesting findings:

First, I think I may have identified the problematic commit (or at least the
most-problematic one): d1a3e239a6016f2bb42a91696056e223982e8538
(drm/amd/powerplay: drop the unnecessary uclk hard min setting). I eventual=
ly
gave up on doing a normal bisect since so many of the commits between 5.0 a=
nd
5.1 were non-viable. Instead, I made a list of all the commits that touched
vega20-related files. I then started repeatedly picking out the non-tested
commit with the most related-sounding message, checking out the v5.1 tag, a=
nd
reverting the commit in order to test it as the culprit. When I revert that
one, my system boots reliably. I still see 133.0 watts of power draw, thoug=
h.

This brings me to the second thing: When looking through the commits, I not=
iced
that there were multiple commits that claim to prevent or reduce crashing in
high-resolution situations (one references 5k displays, another references =
3+
4k displays). I want to note that we all seem to have relatively demanding
display setups: Hameer has two 144hz 1440p displays, Tom B has two 60hz 4k
displays, and I have two 120hz 4k displays. Putting these together I decide=
d to
try unplugging one of my displays. Imagine my surprise when things booted
completely smoothly on a stock 5.1 kernel: glitch-free boot, *no powerplay
errors in the kernel log*, and 25 watts of power draw when usage is low. So=
 I
think it is safe to say that one "workaround" is to unplug a monitor if you=
 can
stand to work that way.

I actually have access to another Radeon VII so I may try running one per
monitor tomorrow.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15584262943.1A9F9d1be.32260
Date: Tue, 21 May 2019 08:11:34 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110674#c30">Comme=
nt # 30</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Crashes / Resets From AMDGPU / Radeon VII"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110674">bug 11067=
4</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
chris&#64;hodapp.email" title=3D"Chris Hodapp &lt;chris&#64;hodapp.email&gt=
;"> <span class=3D"fn">Chris Hodapp</span></a>
</span></b>
        <pre>Some interesting findings:

First, I think I may have identified the problematic commit (or at least the
most-problematic one): d1a3e239a6016f2bb42a91696056e223982e8538
(drm/amd/powerplay: drop the unnecessary uclk hard min setting). I eventual=
ly
gave up on doing a normal bisect since so many of the commits between 5.0 a=
nd
5.1 were non-viable. Instead, I made a list of all the commits that touched
vega20-related files. I then started repeatedly picking out the non-tested
commit with the most related-sounding message, checking out the v5.1 tag, a=
nd
reverting the commit in order to test it as the culprit. When I revert that
one, my system boots reliably. I still see 133.0 watts of power draw, thoug=
h.

This brings me to the second thing: When looking through the commits, I not=
iced
that there were multiple commits that claim to prevent or reduce crashing in
high-resolution situations (one references 5k displays, another references =
3+
4k displays). I want to note that we all seem to have relatively demanding
display setups: Hameer has two 144hz 1440p displays, Tom B has two 60hz 4k
displays, and I have two 120hz 4k displays. Putting these together I decide=
d to
try unplugging one of my displays. Imagine my surprise when things booted
completely smoothly on a stock 5.1 kernel: glitch-free boot, *no powerplay
errors in the kernel log*, and 25 watts of power draw when usage is low. So=
 I
think it is safe to say that one &quot;workaround&quot; is to unplug a moni=
tor if you can
stand to work that way.

I actually have access to another Radeon VII so I may try running one per
monitor tomorrow.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15584262943.1A9F9d1be.32260--

--===============0145221271==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0145221271==--
