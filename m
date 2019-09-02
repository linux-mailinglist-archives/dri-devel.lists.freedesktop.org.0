Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C0E57A5E42
	for <lists+dri-devel@lfdr.de>; Tue,  3 Sep 2019 01:47:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA39A89949;
	Mon,  2 Sep 2019 23:47:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 15A91898BC
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Sep 2019 23:47:12 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 0C04172161; Mon,  2 Sep 2019 23:47:12 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111241] Shadertoy shader causing hang
Date: Mon, 02 Sep 2019 23:47:12 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Mesa
X-Bugzilla-Component: Drivers/Gallium/radeonsi
X-Bugzilla-Version: 19.1
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: t_arceri@yahoo.com.au
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: FIXED
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-111241-502-E6PgZpRYJw@http.bugs.freedesktop.org/>
In-Reply-To: <bug-111241-502@http.bugs.freedesktop.org/>
References: <bug-111241-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1391691096=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1391691096==
Content-Type: multipart/alternative; boundary="15674680310.E5af.22215"
Content-Transfer-Encoding: 7bit


--15674680310.E5af.22215
Date: Mon, 2 Sep 2019 23:47:11 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111241

Timothy Arceri <t_arceri@yahoo.com.au> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |FIXED

--- Comment #13 from Timothy Arceri <t_arceri@yahoo.com.au> ---
(In reply to Dieter N=C3=BCtzel from comment #12)
> (In reply to Pierre-Eric Pelloux-Prayer from comment #11)
> > (In reply to Dieter N=C3=BCtzel from comment #8)
> > > BTW
> > >=20
> > > Pierre-Eric can you look into this
> > >=20
> > > Shadertoy shader corruption, too?
> > > https://www.shadertoy.com/view/Xt3cWS
> > >
> >=20
> > The "Buffer A" shader doesn't write fragColor when uv.y is < 0.1 or > 0=
.9.
> >=20
> > So the content is undefined and may be black on some platform or random.
> >=20
> > radeonsi is correct here, but we might want to replace undef values wit=
h 0x0
> > to get a default value instead of random.
>=20
> Cool to have you around for bug hunting...;-)
>=20
> Any hints where I shoud change 'undef values with 0x0' for testing?
>=20
> And sorry that I 'hijacked' this thread - should I open a new ticket?

I don't think you need to open a bug for it at all. As its not a bug in Mesa
its a shader bug.

Closing this bug report as it should be fixed by:

commit  47cc660d9c19572e5ef2dce7c8ae1766a2ac9885
glsl: replace 'x + (-x)' with constant 0
   This fixes a hang in shadertoy for radeonsi where a buffer was initializ=
ed
with:

   value -=3D value

   with value being undefined.
   In this case LLVM replace the operation with an assignment to NaN.

   Cc: 19.1 19.2 <mesa-stable@lists.freedesktop.org>
   Bugzilla: https://bugs.freedesktop.org/show_bug.cgi?id=3D111241
   Reviewed-by: Marek Ol=C5=A1=C3=A1k <marek.olsak@amd.com>

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15674680310.E5af.22215
Date: Mon, 2 Sep 2019 23:47:11 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body><span class=3D"vcard"><a class=3D"email" href=3D"mailto:t_arceri&=
#64;yahoo.com.au" title=3D"Timothy Arceri &lt;t_arceri&#64;yahoo.com.au&gt;=
"> <span class=3D"fn">Timothy Arceri</span></a>
</span> changed
          <a class=3D"bz_bug_link=20
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED FIXED - Shadertoy shader causing hang"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111241">bug 11124=
1</a>
          <br>
             <table border=3D"1" cellspacing=3D"0" cellpadding=3D"8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style=3D"text-align:right;">Status</td>
           <td>NEW
           </td>
           <td>RESOLVED
           </td>
         </tr>

         <tr>
           <td style=3D"text-align:right;">Resolution</td>
           <td>---
           </td>
           <td>FIXED
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED FIXED - Shadertoy shader causing hang"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111241#c13">Comme=
nt # 13</a>
              on <a class=3D"bz_bug_link=20
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED FIXED - Shadertoy shader causing hang"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111241">bug 11124=
1</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
t_arceri&#64;yahoo.com.au" title=3D"Timothy Arceri &lt;t_arceri&#64;yahoo.c=
om.au&gt;"> <span class=3D"fn">Timothy Arceri</span></a>
</span></b>
        <pre>(In reply to Dieter N=C3=BCtzel from <a href=3D"show_bug.cgi?i=
d=3D111241#c12">comment #12</a>)
<span class=3D"quote">&gt; (In reply to Pierre-Eric Pelloux-Prayer from <a =
href=3D"show_bug.cgi?id=3D111241#c11">comment #11</a>)
&gt; &gt; (In reply to Dieter N=C3=BCtzel from <a href=3D"show_bug.cgi?id=
=3D111241#c8">comment #8</a>)
&gt; &gt; &gt; BTW
&gt; &gt; &gt;=20
&gt; &gt; &gt; Pierre-Eric can you look into this
&gt; &gt; &gt;=20
&gt; &gt; &gt; Shadertoy shader corruption, too?
&gt; &gt; &gt; <a href=3D"https://www.shadertoy.com/view/Xt3cWS">https://ww=
w.shadertoy.com/view/Xt3cWS</a>
&gt; &gt; &gt;
&gt; &gt;=20
&gt; &gt; The &quot;Buffer A&quot; shader doesn't write fragColor when uv.y=
 is &lt; 0.1 or &gt; 0.9.
&gt; &gt;=20
&gt; &gt; So the content is undefined and may be black on some platform or =
random.
&gt; &gt;=20
&gt; &gt; radeonsi is correct here, but we might want to replace undef valu=
es with 0x0
&gt; &gt; to get a default value instead of random.
&gt;=20
&gt; Cool to have you around for bug hunting...;-)
&gt;=20
&gt; Any hints where I shoud change 'undef values with 0x0' for testing?
&gt;=20
&gt; And sorry that I 'hijacked' this thread - should I open a new ticket?<=
/span >

I don't think you need to open a bug for it at all. As its not a bug in Mesa
its a shader bug.

Closing this bug report as it should be fixed by:

commit  47cc660d9c19572e5ef2dce7c8ae1766a2ac9885
glsl: replace 'x + (-x)' with constant 0
   This fixes a hang in shadertoy for radeonsi where a buffer was initializ=
ed
with:

   value -=3D value

   with value being undefined.
   In this case LLVM replace the operation with an assignment to NaN.

   Cc: 19.1 19.2 &lt;<a href=3D"mailto:mesa-stable&#64;lists.freedesktop.or=
g">mesa-stable&#64;lists.freedesktop.org</a>&gt;
   Bugzilla: <a class=3D"bz_bug_link=20
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED FIXED - Shadertoy shader causing hang"
   href=3D"show_bug.cgi?id=3D111241">https://bugs.freedesktop.org/show_bug.=
cgi?id=3D111241</a>
   Reviewed-by: Marek Ol=C5=A1=C3=A1k &lt;<a href=3D"mailto:marek.olsak&#64=
;amd.com">marek.olsak&#64;amd.com</a>&gt;</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15674680310.E5af.22215--

--===============1391691096==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1391691096==--
