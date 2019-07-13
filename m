Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AB25367BAA
	for <lists+dri-devel@lfdr.de>; Sat, 13 Jul 2019 20:30:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED5F389CF5;
	Sat, 13 Jul 2019 18:30:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id B30A789CE0
 for <dri-devel@lists.freedesktop.org>; Sat, 13 Jul 2019 18:30:40 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id AFBE172167; Sat, 13 Jul 2019 18:30:40 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 107296] WARNING: CPU: 0 PID: 370 at
 drivers/gpu/drm/amd/amdgpu/../display/dc/calcs/dcn_calcs.c:1355
 dcn_bw_update_from_pplib+0x16b/0x280 [amdgpu]
Date: Sat, 13 Jul 2019 18:30:40 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: DRI git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: paulepanter@users.sourceforge.net
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-107296-502-1S4BvxTZfG@http.bugs.freedesktop.org/>
In-Reply-To: <bug-107296-502@http.bugs.freedesktop.org/>
References: <bug-107296-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1609811963=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1609811963==
Content-Type: multipart/alternative; boundary="15630426402.aeE7.28276"
Content-Transfer-Encoding: 7bit


--15630426402.aeE7.28276
Date: Sat, 13 Jul 2019 18:30:40 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D107296

Paul Menzel <paulepanter@users.sourceforge.net> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |paulepanter@users.sourcefor
                   |                            |ge.net

--- Comment #16 from Paul Menzel <paulepanter@users.sourceforge.net> ---
Could some AMD developer please comment, on how to fix this? Tables(?)
containing =E2=80=9C0 kHz=E2=80=9D are apparently shipped by vendors, so wh=
at to do?

```
static bool verify_clock_values(struct dm_pp_clock_levels_with_voltage *clk=
s)
{
        int i;

        if (clks->num_levels =3D=3D 0)
                return false;

        for (i =3D 0; i < clks->num_levels; i++)
                /* Ensure that the result is sane */
                if (clks->data[i].clocks_in_khz =3D=3D 0)
                        return false;

        return true;
}
```

Should commit 00893681a0ff4 (drm/amd/display: Reject PPLib clock values if =
they
are invalid) [1] be reverted? Andrew, Tony, Harry?

> drm/amd/display: Reject PPLib clock values if they are invalid
>
> We should be sticking with the default clock values if the values
> obtained from PPLib are bogus.
>
> Signed-off-by: Andrew Jiang <Andrew.Jiang@amd.com>
> Reviewed-by: Tony Cheng <Tony.Cheng@amd.com>
> Acked-by: Harry Wentland <harry.wentland@amd.com>
> Signed-off-by: Alex Deucher <alexander.deucher@amd.com>

PS: AMDGPU=E2=80=99s commit messages are too terse, and should be more elab=
orate.

[1]:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?=
id=3D00893681a0ff41cacecabc3dafe0987593a3d5c5

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15630426402.aeE7.28276
Date: Sat, 13 Jul 2019 18:30:40 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body><span class=3D"vcard"><a class=3D"email" href=3D"mailto:paulepant=
er&#64;users.sourceforge.net" title=3D"Paul Menzel &lt;paulepanter&#64;user=
s.sourceforge.net&gt;"> <span class=3D"fn">Paul Menzel</span></a>
</span> changed
          <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - WARNING: CPU: 0 PID: 370 at drivers/gpu/drm/amd/amdgpu/..=
/display/dc/calcs/dcn_calcs.c:1355 dcn_bw_update_from_pplib+0x16b/0x280 [am=
dgpu]"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D107296">bug 10729=
6</a>
          <br>
             <table border=3D"1" cellspacing=3D"0" cellpadding=3D"8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style=3D"text-align:right;">CC</td>
           <td>
               &nbsp;
           </td>
           <td>paulepanter&#64;users.sourceforge.net
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - WARNING: CPU: 0 PID: 370 at drivers/gpu/drm/amd/amdgpu/..=
/display/dc/calcs/dcn_calcs.c:1355 dcn_bw_update_from_pplib+0x16b/0x280 [am=
dgpu]"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D107296#c16">Comme=
nt # 16</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - WARNING: CPU: 0 PID: 370 at drivers/gpu/drm/amd/amdgpu/..=
/display/dc/calcs/dcn_calcs.c:1355 dcn_bw_update_from_pplib+0x16b/0x280 [am=
dgpu]"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D107296">bug 10729=
6</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
paulepanter&#64;users.sourceforge.net" title=3D"Paul Menzel &lt;paulepanter=
&#64;users.sourceforge.net&gt;"> <span class=3D"fn">Paul Menzel</span></a>
</span></b>
        <pre>Could some AMD developer please comment, on how to fix this? T=
ables(?)
containing =E2=80=9C0 kHz=E2=80=9D are apparently shipped by vendors, so wh=
at to do?

```
static bool verify_clock_values(struct dm_pp_clock_levels_with_voltage *clk=
s)
{
        int i;

        if (clks-&gt;num_levels =3D=3D 0)
                return false;

        for (i =3D 0; i &lt; clks-&gt;num_levels; i++)
                /* Ensure that the result is sane */
                if (clks-&gt;data[i].clocks_in_khz =3D=3D 0)
                        return false;

        return true;
}
```

Should commit 00893681a0ff4 (drm/amd/display: Reject PPLib clock values if =
they
are invalid) [1] be reverted? Andrew, Tony, Harry?

<span class=3D"quote">&gt; drm/amd/display: Reject PPLib clock values if th=
ey are invalid</span >
&gt;
<span class=3D"quote">&gt; We should be sticking with the default clock val=
ues if the values
&gt; obtained from PPLib are bogus.</span >
&gt;
<span class=3D"quote">&gt; Signed-off-by: Andrew Jiang &lt;<a href=3D"mailt=
o:Andrew.Jiang&#64;amd.com">Andrew.Jiang&#64;amd.com</a>&gt;
&gt; Reviewed-by: Tony Cheng &lt;<a href=3D"mailto:Tony.Cheng&#64;amd.com">=
Tony.Cheng&#64;amd.com</a>&gt;
&gt; Acked-by: Harry Wentland &lt;<a href=3D"mailto:harry.wentland&#64;amd.=
com">harry.wentland&#64;amd.com</a>&gt;
&gt; Signed-off-by: Alex Deucher &lt;<a href=3D"mailto:alexander.deucher&#6=
4;amd.com">alexander.deucher&#64;amd.com</a>&gt;</span >

PS: AMDGPU=E2=80=99s commit messages are too terse, and should be more elab=
orate.

[1]:
<a href=3D"https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.g=
it/commit/?id=3D00893681a0ff41cacecabc3dafe0987593a3d5c5">https://git.kerne=
l.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=3D00893681a0ff=
41cacecabc3dafe0987593a3d5c5</a></pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15630426402.aeE7.28276--

--===============1609811963==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1609811963==--
