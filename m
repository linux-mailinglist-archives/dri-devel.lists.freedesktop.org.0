Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D3CAA8D3F7
	for <lists+dri-devel@lfdr.de>; Wed, 14 Aug 2019 14:56:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6488A6E5D4;
	Wed, 14 Aug 2019 12:56:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 62DCD6E5D4
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Aug 2019 12:56:48 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 5EF337215A; Wed, 14 Aug 2019 12:56:48 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111241] Shadertoy shader causing hang
Date: Wed, 14 Aug 2019 12:56:48 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Mesa
X-Bugzilla-Component: Drivers/Gallium/radeonsi
X-Bugzilla-Version: 19.1
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: pierre-eric.pelloux-prayer@amd.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-111241-502-9ooqm0hLQl@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0641818296=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0641818296==
Content-Type: multipart/alternative; boundary="15657874081.E51d.2135"
Content-Transfer-Encoding: 7bit


--15657874081.E51d.2135
Date: Wed, 14 Aug 2019 12:56:48 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111241

--- Comment #6 from Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@=
amd.com> ---
I've created a different shadertoy showing the problem:
https://www.shadertoy.com/view/Wt2SW1 (but this one doesn't hang the GPU).

The shader for "Buffer A" is:

  0: MOV TEMP[0], SV[0]
  1: MAD TEMP[0].y, SV[0], CONST[0][2].xxxx, CONST[0][2].yyyy
  2: MOV OUT[0], IMM[0].xxxx
  3: USEQ TEMP[1].x, CONST[0][1].xxxx, IMM[1].xxxx
  4: UIF TEMP[1].xxxx
  5:   ADD TEMP[2], TEMP[2], -TEMP[2]
  6: ELSE
  [...]
 13: MOV OUT[0], TEMP[2]
 14: END

TEMP[2] is used before being assigned a value, so I suppose that's what all=
ows
LLVM to turn line 5 in:

   v_mov_b32_e32 v3, 0x7fc00000
   v_mov_b32_e32 v2, 0x7fc00000
   v_mov_b32_e32 v1, 0x7fc00000
   v_mov_b32_e32 v0, 0x7fc00000

(ie: output is NaN)

A possible way to fix this is to transform "dst =3D x - x" operations in "d=
st =3D
0" which is what nir does in its nir_opt_algebraic pass.

I've open a MR to fix/discuss this issue:
https://gitlab.freedesktop.org/mesa/mesa/merge_requests/1681

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15657874081.E51d.2135
Date: Wed, 14 Aug 2019 12:56:48 +0000
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
   title=3D"NEW - Shadertoy shader causing hang"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111241#c6">Commen=
t # 6</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Shadertoy shader causing hang"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111241">bug 11124=
1</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
pierre-eric.pelloux-prayer&#64;amd.com" title=3D"Pierre-Eric Pelloux-Prayer=
 &lt;pierre-eric.pelloux-prayer&#64;amd.com&gt;"> <span class=3D"fn">Pierre=
-Eric Pelloux-Prayer</span></a>
</span></b>
        <pre>I've created a different shadertoy showing the problem:
<a href=3D"https://www.shadertoy.com/view/Wt2SW1">https://www.shadertoy.com=
/view/Wt2SW1</a> (but this one doesn't hang the GPU).

The shader for &quot;Buffer A&quot; is:

  0: MOV TEMP[0], SV[0]
  1: MAD TEMP[0].y, SV[0], CONST[0][2].xxxx, CONST[0][2].yyyy
  2: MOV OUT[0], IMM[0].xxxx
  3: USEQ TEMP[1].x, CONST[0][1].xxxx, IMM[1].xxxx
  4: UIF TEMP[1].xxxx
  5:   ADD TEMP[2], TEMP[2], -TEMP[2]
  6: ELSE
  [...]
 13: MOV OUT[0], TEMP[2]
 14: END

TEMP[2] is used before being assigned a value, so I suppose that's what all=
ows
LLVM to turn line 5 in:

   v_mov_b32_e32 v3, 0x7fc00000
   v_mov_b32_e32 v2, 0x7fc00000
   v_mov_b32_e32 v1, 0x7fc00000
   v_mov_b32_e32 v0, 0x7fc00000

(ie: output is NaN)

A possible way to fix this is to transform &quot;dst =3D x - x&quot; operat=
ions in &quot;dst =3D
0&quot; which is what nir does in its nir_opt_algebraic pass.

I've open a MR to fix/discuss this issue:
<a href=3D"https://gitlab.freedesktop.org/mesa/mesa/merge_requests/1681">ht=
tps://gitlab.freedesktop.org/mesa/mesa/merge_requests/1681</a></pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15657874081.E51d.2135--

--===============0641818296==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0641818296==--
