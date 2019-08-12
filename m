Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E78C89705
	for <lists+dri-devel@lfdr.de>; Mon, 12 Aug 2019 07:58:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19E186E49A;
	Mon, 12 Aug 2019 05:58:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 127DB6E49F
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Aug 2019 05:58:56 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 0F4D372167; Mon, 12 Aug 2019 05:58:56 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110674] Crashes / Resets From AMDGPU / Radeon VII
Date: Mon, 12 Aug 2019 05:58:56 +0000
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
Message-ID: <bug-110674-502-MKtlMikinj@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1912540333=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1912540333==
Content-Type: multipart/alternative; boundary="15655895360.fa81.15868"
Content-Transfer-Encoding: 7bit


--15655895360.fa81.15868
Date: Mon, 12 Aug 2019 05:58:56 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110674

--- Comment #79 from ReddestDream <reddestdream@gmail.com> ---
>I tried something like that before but a huge portion of the commits in th=
at range won't build kernels that can boot (at least on my system).

It's interesting that you found d1a3e239a6016f2bb42a91696056e223982e8538 to
improve the issue:

https://github.com/torvalds/linux/commit/d1a3e239a6016f2bb42a91696056e22398=
2e8538#diff-0bc07842bc28283d64ffa6dd2ed716de

From Tom B.'s and my review of the code, it seems very likely that somehow a
failure to set a hard minimum properly is at the heart of the issue.=20

>This brings me to the second thing: When looking through the commits, I no=
ticed that there were multiple commits that claim to prevent or reduce cras=
hing in high-resolution situations (one references 5k displays, another ref=
erences 3+ 4k displays).

Yeah. I have 2 4K displays as well. But I don't think it should really be
straining the card. These commits are probably overzealous for Radeon VII.
Rather it could be that at least part of the issue, especially the excessive
power draw at idle, is just due to these commits artificially setting minim=
ums
very high. In fact, that could be why it's stable at all with just one moni=
tor,
since the code to set the minimums up is only being triggered when there are
more monitors connected.

I'd suspect a boottime configuration issue too, but others have reported
instability even when the monitors are hotplugged later on. So, it seems li=
ke
maybe the monitor detect might at least partially be okay, but the
follow-through with raising the clock minimums is broken. I suspect the iss=
ue
is in the code calculating the minimum to set, so the driver gets stuck try=
ing
to send incomplete/incorrect values to the card.

https://bbs.archlinux.org/viewtopic.php?id=3D247733

It does make me wonder if it's worth testing like 2 simple 1080p 60 Hz
displays. Maybe that wouldn't trigger this issue. Not that that would reall=
y be
of use to me. But it might help distinguish between just monitor detect
generally being broken and "high monitor load" being broken . . .

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15655895360.fa81.15868
Date: Mon, 12 Aug 2019 05:58:56 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110674#c79">Comme=
nt # 79</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Crashes / Resets From AMDGPU / Radeon VII"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110674">bug 11067=
4</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
reddestdream&#64;gmail.com" title=3D"ReddestDream &lt;reddestdream&#64;gmai=
l.com&gt;"> <span class=3D"fn">ReddestDream</span></a>
</span></b>
        <pre><span class=3D"quote">&gt;I tried something like that before b=
ut a huge portion of the commits in that range won't build kernels that can=
 boot (at least on my system).</span >

It's interesting that you found d1a3e239a6016f2bb42a91696056e223982e8538 to
improve the issue:

<a href=3D"https://github.com/torvalds/linux/commit/d1a3e239a6016f2bb42a916=
96056e223982e8538#diff-0bc07842bc28283d64ffa6dd2ed716de">https://github.com=
/torvalds/linux/commit/d1a3e239a6016f2bb42a91696056e223982e8538#diff-0bc078=
42bc28283d64ffa6dd2ed716de</a>

From Tom B.'s and my review of the code, it seems very likely that somehow a
failure to set a hard minimum properly is at the heart of the issue.=20

<span class=3D"quote">&gt;This brings me to the second thing: When looking =
through the commits, I noticed that there were multiple commits that claim =
to prevent or reduce crashing in high-resolution situations (one references=
 5k displays, another references 3+ 4k displays).</span >

Yeah. I have 2 4K displays as well. But I don't think it should really be
straining the card. These commits are probably overzealous for Radeon VII.
Rather it could be that at least part of the issue, especially the excessive
power draw at idle, is just due to these commits artificially setting minim=
ums
very high. In fact, that could be why it's stable at all with just one moni=
tor,
since the code to set the minimums up is only being triggered when there are
more monitors connected.

I'd suspect a boottime configuration issue too, but others have reported
instability even when the monitors are hotplugged later on. So, it seems li=
ke
maybe the monitor detect might at least partially be okay, but the
follow-through with raising the clock minimums is broken. I suspect the iss=
ue
is in the code calculating the minimum to set, so the driver gets stuck try=
ing
to send incomplete/incorrect values to the card.

<a href=3D"https://bbs.archlinux.org/viewtopic.php?id=3D247733">https://bbs=
.archlinux.org/viewtopic.php?id=3D247733</a>

It does make me wonder if it's worth testing like 2 simple 1080p 60 Hz
displays. Maybe that wouldn't trigger this issue. Not that that would reall=
y be
of use to me. But it might help distinguish between just monitor detect
generally being broken and &quot;high monitor load&quot; being broken . . .=
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

--15655895360.fa81.15868--

--===============1912540333==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1912540333==--
