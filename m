Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F14F98A286
	for <lists+dri-devel@lfdr.de>; Mon, 12 Aug 2019 17:42:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 082DC6E556;
	Mon, 12 Aug 2019 15:42:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 7B9056E56A
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Aug 2019 15:42:17 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 786A272167; Mon, 12 Aug 2019 15:42:17 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110674] Crashes / Resets From AMDGPU / Radeon VII
Date: Mon, 12 Aug 2019 15:42:17 +0000
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
Message-ID: <bug-110674-502-mnTEgFpvUJ@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0268449509=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0268449509==
Content-Type: multipart/alternative; boundary="15656245375.2D6Ec5.13339"
Content-Transfer-Encoding: 7bit


--15656245375.2D6Ec5.13339
Date: Mon, 12 Aug 2019 15:42:17 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110674

--- Comment #83 from ReddestDream <reddestdream@gmail.com> ---
> Here's what I found: The value of hard_min_level is 1001 in both 5.0.13 a=
nd 5.2.7 so the issue is not the value from the dpm table. The dpm table is=
 probably correct.=20

Fantastic! Glad you tested this. I had suspected the hard_min_level was bog=
us
and that's why it was failing. Card was rejecting the bogus value. Glad to =
know
that's not the case.

> However, what is interesting is that it doesn't always fail.

Yeah. I've had boots where I have my 2 4K DP monitors in and I don't get
powerplay error on boot. In fact, it can go a bit and seem stable. But then=
 the
powerplay errors suddenly (not related to some high load on the card) start
showing up again and the graphics become unstable. Similarly others have
reported that on hotplugging a second monitor after boot, the powerplay err=
ors
will start showing up.

So, maybe there is a timing problem involved with sending the message. It's
generally a question of when rather than if it's going to fail.

> 1. vega20_set_fclk_to_highest_dpm_level is called twice between the "ring=
 vce2" line and "Initialized"

Is it always called twice? Even on 5.2.7? Because it looks like it might get
called two times right before "Initialized" on 5.0.13 but then only once on
5.2.7 before "Initialized" kicks in. Maybe "Initialized" is interrupting on
5.2.7 but not on 5.0.13. It's possible that Initialization of the card is
messing up values that powerplay needs to read off the card or making the c=
ard
unavailable for receiving messages or something . . .

> So initialization is happening between (and possibly a result of) sending=
 the message and getting the response

Yeah. Something is definitely happening while
vega20_set_uclk_to_highest_dpm_level is running . . . Not 100% sure that's
really problematic tho . . .  But it could be an atomicity issue. Need to
figure out what exactly what is generating the line "[drm] Initialized amdg=
pu
3.27.0 20150101 for 0000:44:00.0 on minor 0." Looks like it's coming from t=
he
drm core rather than amdgpu specifically.

> I'm going to see if I can disable/revert BACO entirely to at least rule i=
t out.

I thought BACO was reverted for Vega 20 here:

https://github.com/torvalds/linux/commit/7db329e57b90ddebcb58fc88eedbb3082d=
22a957#diff-8a4d25be8ad5d9c3ff27bb54b678dab2

Your commit seems to have been introduced in 5.2-rc1, not 5.1.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15656245375.2D6Ec5.13339
Date: Mon, 12 Aug 2019 15:42:17 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110674#c83">Comme=
nt # 83</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Crashes / Resets From AMDGPU / Radeon VII"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110674">bug 11067=
4</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
reddestdream&#64;gmail.com" title=3D"ReddestDream &lt;reddestdream&#64;gmai=
l.com&gt;"> <span class=3D"fn">ReddestDream</span></a>
</span></b>
        <pre><span class=3D"quote">&gt; Here's what I found: The value of h=
ard_min_level is 1001 in both 5.0.13 and 5.2.7 so the issue is not the valu=
e from the dpm table. The dpm table is probably correct. </span >

Fantastic! Glad you tested this. I had suspected the hard_min_level was bog=
us
and that's why it was failing. Card was rejecting the bogus value. Glad to =
know
that's not the case.

<span class=3D"quote">&gt; However, what is interesting is that it doesn't =
always fail.</span >

Yeah. I've had boots where I have my 2 4K DP monitors in and I don't get
powerplay error on boot. In fact, it can go a bit and seem stable. But then=
 the
powerplay errors suddenly (not related to some high load on the card) start
showing up again and the graphics become unstable. Similarly others have
reported that on hotplugging a second monitor after boot, the powerplay err=
ors
will start showing up.

So, maybe there is a timing problem involved with sending the message. It's
generally a question of when rather than if it's going to fail.

<span class=3D"quote">&gt; 1. vega20_set_fclk_to_highest_dpm_level is calle=
d twice between the &quot;ring vce2&quot; line and &quot;Initialized&quot;<=
/span >

Is it always called twice? Even on 5.2.7? Because it looks like it might get
called two times right before &quot;Initialized&quot; on 5.0.13 but then on=
ly once on
5.2.7 before &quot;Initialized&quot; kicks in. Maybe &quot;Initialized&quot=
; is interrupting on
5.2.7 but not on 5.0.13. It's possible that Initialization of the card is
messing up values that powerplay needs to read off the card or making the c=
ard
unavailable for receiving messages or something . . .

<span class=3D"quote">&gt; So initialization is happening between (and poss=
ibly a result of) sending the message and getting the response</span >

Yeah. Something is definitely happening while
vega20_set_uclk_to_highest_dpm_level is running . . . Not 100% sure that's
really problematic tho . . .  But it could be an atomicity issue. Need to
figure out what exactly what is generating the line &quot;[drm] Initialized=
 amdgpu
3.27.0 20150101 for 0000:44:00.0 on minor 0.&quot; Looks like it's coming f=
rom the
drm core rather than amdgpu specifically.

<span class=3D"quote">&gt; I'm going to see if I can disable/revert BACO en=
tirely to at least rule it out.</span >

I thought BACO was reverted for Vega 20 here:

<a href=3D"https://github.com/torvalds/linux/commit/7db329e57b90ddebcb58fc8=
8eedbb3082d22a957#diff-8a4d25be8ad5d9c3ff27bb54b678dab2">https://github.com=
/torvalds/linux/commit/7db329e57b90ddebcb58fc88eedbb3082d22a957#diff-8a4d25=
be8ad5d9c3ff27bb54b678dab2</a>

Your commit seems to have been introduced in 5.2-rc1, not 5.1.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15656245375.2D6Ec5.13339--

--===============0268449509==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0268449509==--
