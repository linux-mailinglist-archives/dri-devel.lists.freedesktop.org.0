Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DCDBC48BA
	for <lists+dri-devel@lfdr.de>; Wed,  2 Oct 2019 09:44:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 004206E63B;
	Wed,  2 Oct 2019 07:44:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 5C9616E8D5
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Oct 2019 07:44:19 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 5926A72162; Wed,  2 Oct 2019 07:44:19 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111228] PRIME output screen stays black on 1002:15d8 with 128MB
 VRAM
Date: Wed, 02 Oct 2019 07:44:19 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: XOrg git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: hhfeuer@gmx.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-111228-502-zonX9THVuc@http.bugs.freedesktop.org/>
In-Reply-To: <bug-111228-502@http.bugs.freedesktop.org/>
References: <bug-111228-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1735738264=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1735738264==
Content-Type: multipart/alternative; boundary="15700022591.C5dFc.30383"
Content-Transfer-Encoding: 7bit


--15700022591.C5dFc.30383
Date: Wed, 2 Oct 2019 07:44:19 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111228

--- Comment #7 from Maik Freudenberg <hhfeuer@gmx.de> ---
Updating with info from other users with the same amd gpu with 128MB VRAM:
- one user was able to switch to VT and start a second Xserver which then
worked fine.
- another user found out that connecting an external monitor would work, was
able to log into gnome and in the monitor manager, the internal display sho=
wed
as disabled. So he could simply enable it and started working.

So this seems to be failing on xrandr --auto, not correctly adding the inte=
rnal
display to the config. Looking what Ubuntu does:
# Pass provider or sink and source
xrandr --setprovideroutputsource "$sink" "$src"

# Make sure xrandr sees all the outputs
xrandr --auto

# Do not move up. Only now xrandr shows the outputs
lvds=3D$(xrandr | grep -i -e "lvds" -e "edp" | head -n1 |cut -d " " -f 1)
xrandr --output "$lvds" --off
xrandr --output "$lvds" --auto

So it already disables and enables the internal display as a workaround for
something but this still isn't enough in this case.
Maybe this is some timing problem so that adding a "sleep 2" either before =
or
after xrandr --auto would make that work?

Doesn't explain why this is only happening on this specific model, though.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15700022591.C5dFc.30383
Date: Wed, 2 Oct 2019 07:44:19 +0000
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
   title=3D"NEW - PRIME output screen stays black on 1002:15d8 with 128MB V=
RAM"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111228#c7">Commen=
t # 7</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - PRIME output screen stays black on 1002:15d8 with 128MB V=
RAM"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111228">bug 11122=
8</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
hhfeuer&#64;gmx.de" title=3D"Maik Freudenberg &lt;hhfeuer&#64;gmx.de&gt;"> =
<span class=3D"fn">Maik Freudenberg</span></a>
</span></b>
        <pre>Updating with info from other users with the same amd gpu with=
 128MB VRAM:
- one user was able to switch to VT and start a second Xserver which then
worked fine.
- another user found out that connecting an external monitor would work, was
able to log into gnome and in the monitor manager, the internal display sho=
wed
as disabled. So he could simply enable it and started working.

So this seems to be failing on xrandr --auto, not correctly adding the inte=
rnal
display to the config. Looking what Ubuntu does:
# Pass provider or sink and source
xrandr --setprovideroutputsource &quot;$sink&quot; &quot;$src&quot;

# Make sure xrandr sees all the outputs
xrandr --auto

# Do not move up. Only now xrandr shows the outputs
lvds=3D$(xrandr | grep -i -e &quot;lvds&quot; -e &quot;edp&quot; | head -n1=
 |cut -d &quot; &quot; -f 1)
xrandr --output &quot;$lvds&quot; --off
xrandr --output &quot;$lvds&quot; --auto

So it already disables and enables the internal display as a workaround for
something but this still isn't enough in this case.
Maybe this is some timing problem so that adding a &quot;sleep 2&quot; eith=
er before or
after xrandr --auto would make that work?

Doesn't explain why this is only happening on this specific model, though.<=
/pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15700022591.C5dFc.30383--

--===============1735738264==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1735738264==--
