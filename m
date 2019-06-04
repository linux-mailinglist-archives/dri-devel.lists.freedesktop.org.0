Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 002DE340D6
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jun 2019 09:56:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F222897B4;
	Tue,  4 Jun 2019 07:56:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 3956D897B4
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Jun 2019 07:56:23 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 3659272167; Tue,  4 Jun 2019 07:56:23 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110781] Radeon: heavy r300 performance drop regression between
 11.x and 19.x
Date: Tue, 04 Jun 2019 07:56:23 +0000
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
Message-ID: <bug-110781-502-mSMvic6Vp5@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1109850710=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1109850710==
Content-Type: multipart/alternative; boundary="15596349832.16367c1D8.20649"
Content-Transfer-Encoding: 7bit


--15596349832.16367c1D8.20649
Date: Tue, 4 Jun 2019 07:56:23 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110781

--- Comment #25 from Richard Thier <u9vata@gmail.com> ---
In the assert problem this is the domain and flag meanings in case of only =
my
hack is in place:

domain(6) =3D=3D RADEON_DOMAIN_GTT(2) | RADEON_DOMAIN_VRAM(4)
flags(1) =3D=3D RADEON_FLAG_GTT_WC (1 << 0)

So I get -1 even if I "outcomment" this check in radeon_get_heap_index(..):

    /* Resources with interprocess sharing don't use any winsys allocators.=
=20
    if (!(flags & RADEON_FLAG_NO_INTERPROCESS_SHARING))
        return -1;*/

There is a switch statement in this function where they switch based on the
domain parameter:

    switch (domain) {
    case RADEON_DOMAIN_VRAM:
      ...
    case RADEON_DOMAIN_GTT:
      ...
    default:
        break;
    }
    return -1;

I suspect we return -1 here because we go into the "default" case. I think =
that
is right because domain is: 6 =3D=3D 2 | 4 =3D=3D GTT+VRAM at the same time.

Maybe once it was meaningful to have both GTT (is that GART?) and VRAM at t=
he
same time being or-ed together but not anymore?

I will try to add a hack to make the domain always just VRAM to see what
happens... I know that is bad, but just for the analysis.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15596349832.16367c1D8.20649
Date: Tue, 4 Jun 2019 07:56:23 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110781#c25">Comme=
nt # 25</a>
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
        <pre>In the assert problem this is the domain and flag meanings in =
case of only my
hack is in place:

domain(6) =3D=3D RADEON_DOMAIN_GTT(2) | RADEON_DOMAIN_VRAM(4)
flags(1) =3D=3D RADEON_FLAG_GTT_WC (1 &lt;&lt; 0)

So I get -1 even if I &quot;outcomment&quot; this check in radeon_get_heap_=
index(..):

    /* Resources with interprocess sharing don't use any winsys allocators.=
=20
    if (!(flags &amp; RADEON_FLAG_NO_INTERPROCESS_SHARING))
        return -1;*/

There is a switch statement in this function where they switch based on the
domain parameter:

    switch (domain) {
    case RADEON_DOMAIN_VRAM:
      ...
    case RADEON_DOMAIN_GTT:
      ...
    default:
        break;
    }
    return -1;

I suspect we return -1 here because we go into the &quot;default&quot; case=
. I think that
is right because domain is: 6 =3D=3D 2 | 4 =3D=3D GTT+VRAM at the same time.

Maybe once it was meaningful to have both GTT (is that GART?) and VRAM at t=
he
same time being or-ed together but not anymore?

I will try to add a hack to make the domain always just VRAM to see what
happens... I know that is bad, but just for the analysis.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15596349832.16367c1D8.20649--

--===============1109850710==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1109850710==--
