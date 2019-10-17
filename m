Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 62B21DABC6
	for <lists+dri-devel@lfdr.de>; Thu, 17 Oct 2019 14:13:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F3B86EA64;
	Thu, 17 Oct 2019 12:12:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 4C7266EA60
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Oct 2019 12:12:57 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 492197296E; Thu, 17 Oct 2019 12:12:57 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 107296] WARNING: CPU: 0 PID: 370 at
 drivers/gpu/drm/amd/amdgpu/../display/dc/calcs/dcn_calcs.c:1355
 dcn_bw_update_from_pplib+0x16b/0x280 [amdgpu]
Date: Thu, 17 Oct 2019 12:12:56 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: DRI git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: janpieter.sollie@dommel.be
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.isobsolete attachments.created
Message-ID: <bug-107296-502-FyfUiPHpIG@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1674320961=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1674320961==
Content-Type: multipart/alternative; boundary="15713143772.b2FDC3Be.5399"
Content-Transfer-Encoding: 7bit


--15713143772.b2FDC3Be.5399
Date: Thu, 17 Oct 2019 12:12:57 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D107296

Janpieter Sollie <janpieter.sollie@dommel.be> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
 Attachment #144689|0                           |1
        is obsolete|                            |

--- Comment #21 from Janpieter Sollie <janpieter.sollie@dommel.be> ---
Created attachment 145764
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D145764&action=3Dedit
dmesg of PPLIB error

still present on linux 5.3, with the following exceptions:
- the values in mV seem to be initialized,
- DRM does not complain about 'Cannot find any crtc or sizes' after GPU add=
ing
- DRM: construct error is gone

So it's going the good way, I guess ...
I investigated the source around dcn_bw_update_from_pplib

And I saw the following code in gpu/drm/amd/display/dc/calcs/dcn_calcs.c

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
        bool res;

        /* TODO: This is not the proper way to obtain
fabric_and_dram_bandwidth, should be min(fclk, memclk) */
        res =3D dm_pp_get_clock_levels_by_type_with_voltage(
                        ctx, DM_PP_CLOCK_TYPE_FCLK, &fclks);

        kernel_fpu_begin();

        if (res)
                res =3D verify_clock_values(&fclks);

        if (res) {
//unimportant, left out
        } else
                BREAK_TO_DEBUGGER();
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

which probably explains what happens: fclks gets a number of clock values f=
rom
dm_pp_get_clock_levels_by_type_with_voltage, setting res to true.
It tries to validate the clock values then, which fails because of the inva=
lid
numbers
After that, it breaks to debugger.

Is it possible the vega11 needs more time to initialize its clock limits?

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15713143772.b2FDC3Be.5399
Date: Thu, 17 Oct 2019 12:12:57 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body><span class=3D"vcard"><a class=3D"email" href=3D"mailto:janpieter=
.sollie&#64;dommel.be" title=3D"Janpieter Sollie &lt;janpieter.sollie&#64;d=
ommel.be&gt;"> <span class=3D"fn">Janpieter Sollie</span></a>
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
           <td style=3D"text-align:right;">Attachment #144689 is obsolete</=
td>
           <td>
               &nbsp;
           </td>
           <td>1
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - WARNING: CPU: 0 PID: 370 at drivers/gpu/drm/amd/amdgpu/..=
/display/dc/calcs/dcn_calcs.c:1355 dcn_bw_update_from_pplib+0x16b/0x280 [am=
dgpu]"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D107296#c21">Comme=
nt # 21</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - WARNING: CPU: 0 PID: 370 at drivers/gpu/drm/amd/amdgpu/..=
/display/dc/calcs/dcn_calcs.c:1355 dcn_bw_update_from_pplib+0x16b/0x280 [am=
dgpu]"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D107296">bug 10729=
6</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
janpieter.sollie&#64;dommel.be" title=3D"Janpieter Sollie &lt;janpieter.sol=
lie&#64;dommel.be&gt;"> <span class=3D"fn">Janpieter Sollie</span></a>
</span></b>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D145764=
" name=3D"attach_145764" title=3D"dmesg of PPLIB error">attachment 145764</=
a> <a href=3D"attachment.cgi?id=3D145764&amp;action=3Dedit" title=3D"dmesg =
of PPLIB error">[details]</a></span>
dmesg of PPLIB error

still present on linux 5.3, with the following exceptions:
- the values in mV seem to be initialized,
- DRM does not complain about 'Cannot find any crtc or sizes' after GPU add=
ing
- DRM: construct error is gone

So it's going the good way, I guess ...
I investigated the source around dcn_bw_update_from_pplib

And I saw the following code in gpu/drm/amd/display/dc/calcs/dcn_calcs.c

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
        bool res;

        /* TODO: This is not the proper way to obtain
fabric_and_dram_bandwidth, should be min(fclk, memclk) */
        res =3D dm_pp_get_clock_levels_by_type_with_voltage(
                        ctx, DM_PP_CLOCK_TYPE_FCLK, &amp;fclks);

        kernel_fpu_begin();

        if (res)
                res =3D verify_clock_values(&amp;fclks);

        if (res) {
//unimportant, left out
        } else
                BREAK_TO_DEBUGGER();
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

which probably explains what happens: fclks gets a number of clock values f=
rom
dm_pp_get_clock_levels_by_type_with_voltage, setting res to true.
It tries to validate the clock values then, which fails because of the inva=
lid
numbers
After that, it breaks to debugger.

Is it possible the vega11 needs more time to initialize its clock limits?</=
pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15713143772.b2FDC3Be.5399--

--===============1674320961==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1674320961==--
