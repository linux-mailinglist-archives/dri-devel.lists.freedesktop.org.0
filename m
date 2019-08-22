Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8D46999B3
	for <lists+dri-devel@lfdr.de>; Thu, 22 Aug 2019 19:00:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DA5D6E556;
	Thu, 22 Aug 2019 17:00:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 5CC266E55C
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Aug 2019 17:00:27 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 4DDC1721AA; Thu, 22 Aug 2019 17:00:27 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110659] pageflipping seems to cause jittering on mouse input
 when running Hitman 2 in Wine/DXVK with amdgpu.dc=1
Date: Thu, 22 Aug 2019 17:00:27 +0000
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
X-Bugzilla-Priority: high
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-110659-502-u8BLNyPfVF@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1340351897=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1340351897==
Content-Type: multipart/alternative; boundary="15664932271.bCed77.18517"
Content-Transfer-Encoding: 7bit


--15664932271.bCed77.18517
Date: Thu, 22 Aug 2019 17:00:27 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110659

--- Comment #42 from tempel.julian@gmail.com ---
(In reply to Nicholas Kazlauskas from comment #39)
> Disabling the compositor doesn't make a difference as far as stuttering g=
oes
> for Hitman 2's DXVK - I don't see any commits in the log that are lock the
> connector and all the planes.

Thanks for trying!

> I don't have Oblivion on my machine to test, but I tried running the DX9
> version of Heaven under proton and I don't see stuttering or any gamma/co=
lor
> adjustment commits under that either. No issues with FreeSync when running
> it either from what I can tell with vsync both on/off.

I've given Heaven a try, it doesn't show the issue for me either (DX9 via
D9VK).

> Those commits are definitely what's causing your stuttering, but I'm not
> sure what's actually creating them. My initial guess was something in the
> compatibility layer for DX9 games, but I don't see that on my setup.

I've attached a debug dmesg log after triggering the issue in Hitman 2. It =
is
also what is shown in the new video capture I've provided. As you can see,
there are no rendering spikes, but instead the mouse input (and perhaps
partially also keyboard) seems to be discarded a lot, causing such jumps. T=
his
is also there without vsync enabled, but less obvious. Just like the render
spikes in Oblivion/Skyrim, this issue completely disappears by turning off
pageflipping in xorg config, switching to modesetting DDX or disabling atom=
ic
modesetting via amdgpu.dc=3D0. I wonder if the log confirms that it's the s=
ame
issue (or the issue has the same roots)?

> Is it only Oblivion that has this issue for you?

I found out that also the native OpenGL renderer of Doom 2016 (which also h=
as a
free demo on Steam) shows the same behavior as Oblivion/Skyrim, despite of =
no
3D API wrapper involved.
For whatever reason, the Vulkan renderer of the game doesn't show the issue=
, it
seems to run flawlessly with both pageflipping + vsync.

> I'm not sure how much of this can be a kernel level fix - I think we need=
 to
> lock all the planes whenever gamma or color adjustments have been made and
> that probably includes the cursor plane as well. If the cursor plane is
> included that will block asynchronous cursor updates from occurring until
> the color adjustments have been done. This is why the cursor causes
> stuttering.

Would it be possible to provide a test patch that completely blocks any gam=
ma
adjustment either in Xorg or the kernel? Then we'd have ultimate proof. :)

> A check could potentially be made to not lock all the planes for redundant
> color management commits, but I'm not sure if the color adjustments
> requested are redundant or not. It could be the case that the application=
 is
> requesting different color adjustments every single time.

It seems some suboptimal behavior of Wine can trigger this issue, but I sup=
pose
it would automatically be fixed together with this issue which I reported
regarding gamma adjustment performance and atomic modesetting:
https://bugs.freedesktop.org/show_bug.cgi?id=3D108917
I btw. can reproduce that issue by simply booting Fedora 30 Workstation Gno=
me
Live and enable the nightlight feature, the color grading phase makes
everything stutter.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15664932271.bCed77.18517
Date: Thu, 22 Aug 2019 17:00:27 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110659#c42">Comme=
nt # 42</a>
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
        <pre>(In reply to Nicholas Kazlauskas from <a href=3D"show_bug.cgi?=
id=3D110659#c39">comment #39</a>)
<span class=3D"quote">&gt; Disabling the compositor doesn't make a differen=
ce as far as stuttering goes
&gt; for Hitman 2's DXVK - I don't see any commits in the log that are lock=
 the
&gt; connector and all the planes.</span >

Thanks for trying!

<span class=3D"quote">&gt; I don't have Oblivion on my machine to test, but=
 I tried running the DX9
&gt; version of Heaven under proton and I don't see stuttering or any gamma=
/color
&gt; adjustment commits under that either. No issues with FreeSync when run=
ning
&gt; it either from what I can tell with vsync both on/off.</span >

I've given Heaven a try, it doesn't show the issue for me either (DX9 via
D9VK).

<span class=3D"quote">&gt; Those commits are definitely what's causing your=
 stuttering, but I'm not
&gt; sure what's actually creating them. My initial guess was something in =
the
&gt; compatibility layer for DX9 games, but I don't see that on my setup.</=
span >

I've attached a debug dmesg log after triggering the issue in Hitman 2. It =
is
also what is shown in the new video capture I've provided. As you can see,
there are no rendering spikes, but instead the mouse input (and perhaps
partially also keyboard) seems to be discarded a lot, causing such jumps. T=
his
is also there without vsync enabled, but less obvious. Just like the render
spikes in Oblivion/Skyrim, this issue completely disappears by turning off
pageflipping in xorg config, switching to modesetting DDX or disabling atom=
ic
modesetting via amdgpu.dc=3D0. I wonder if the log confirms that it's the s=
ame
issue (or the issue has the same roots)?

<span class=3D"quote">&gt; Is it only Oblivion that has this issue for you?=
</span >

I found out that also the native OpenGL renderer of Doom 2016 (which also h=
as a
free demo on Steam) shows the same behavior as Oblivion/Skyrim, despite of =
no
3D API wrapper involved.
For whatever reason, the Vulkan renderer of the game doesn't show the issue=
, it
seems to run flawlessly with both pageflipping + vsync.

<span class=3D"quote">&gt; I'm not sure how much of this can be a kernel le=
vel fix - I think we need to
&gt; lock all the planes whenever gamma or color adjustments have been made=
 and
&gt; that probably includes the cursor plane as well. If the cursor plane is
&gt; included that will block asynchronous cursor updates from occurring un=
til
&gt; the color adjustments have been done. This is why the cursor causes
&gt; stuttering.</span >

Would it be possible to provide a test patch that completely blocks any gam=
ma
adjustment either in Xorg or the kernel? Then we'd have ultimate proof. :)

<span class=3D"quote">&gt; A check could potentially be made to not lock al=
l the planes for redundant
&gt; color management commits, but I'm not sure if the color adjustments
&gt; requested are redundant or not. It could be the case that the applicat=
ion is
&gt; requesting different color adjustments every single time.</span >

It seems some suboptimal behavior of Wine can trigger this issue, but I sup=
pose
it would automatically be fixed together with this issue which I reported
regarding gamma adjustment performance and atomic modesetting:
<a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - gamma adjustments cause stuttering with amdgpu.dc=3D1, es=
pecially problematic with RedShift etc."
   href=3D"show_bug.cgi?id=3D108917">https://bugs.freedesktop.org/show_bug.=
cgi?id=3D108917</a>
I btw. can reproduce that issue by simply booting Fedora 30 Workstation Gno=
me
Live and enable the nightlight feature, the color grading phase makes
everything stutter.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15664932271.bCed77.18517--

--===============1340351897==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1340351897==--
