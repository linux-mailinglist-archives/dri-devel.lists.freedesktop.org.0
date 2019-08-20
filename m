Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 37300961A2
	for <lists+dri-devel@lfdr.de>; Tue, 20 Aug 2019 15:53:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE41C6E7CA;
	Tue, 20 Aug 2019 13:53:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id D963B6E7CA
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Aug 2019 13:53:21 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id D634072161; Tue, 20 Aug 2019 13:53:21 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111432] [bisected][tonga] Boot failures on agd5f's drm-next
 branch
Date: Tue, 20 Aug 2019 13:53:22 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: DRI git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mike@fireburn.co.uk
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-111432-502-heYPsKUiEo@http.bugs.freedesktop.org/>
In-Reply-To: <bug-111432-502@http.bugs.freedesktop.org/>
References: <bug-111432-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1406130082=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1406130082==
Content-Type: multipart/alternative; boundary="15663092011.414cB.24538"
Content-Transfer-Encoding: 7bit


--15663092011.414cB.24538
Date: Tue, 20 Aug 2019 13:53:21 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111432

--- Comment #2 from Mike Lothian <mike@fireburn.co.uk> ---
I've bisected this to:

9adc8050bf3ca3e49c65e13259a4c310640542f1 is the first bad commit
commit 9adc8050bf3ca3e49c65e13259a4c310640542f1
Author: Dmytro Laktyushkin <Dmytro.Laktyushkin@amd.com>
Date:   Fri Jul 12 15:06:06 2019 -0400

    drm/amd/display: make firmware info only load once during dc_bios create

    Currently every time DC wants to access firmware info we make a call
    into VBIOS. This makes no sense as there is nothing that can change
    runtime inside fw info and can cause issues when calling unstable
    bios during bringup.

    This change eliminate this behavior by only calling bios once for fw
    info and keeping it stored as part of dc_bios.

    Signed-off-by: Dmytro Laktyushkin <Dmytro.Laktyushkin@amd.com>
    Reviewed-by: Chris Park <Chris.Park@amd.com>
    Acked-by: Leo Li <sunpeng.li@amd.com>
    Signed-off-by: Alex Deucher <alexander.deucher@amd.com>

 drivers/gpu/drm/amd/display/dc/bios/bios_parser.c  |  3 +-
 drivers/gpu/drm/amd/display/dc/bios/bios_parser2.c |  3 +-
 .../amd/display/dc/clk_mgr/dce100/dce_clk_mgr.c    | 17 ++++--------
 .../drm/amd/display/dc/clk_mgr/dcn10/rv1_clk_mgr.c |  6 ++--
 drivers/gpu/drm/amd/display/dc/core/dc_resource.c  |  7 ++---
 drivers/gpu/drm/amd/display/dc/dc_bios_types.h     |  5 ++--
 .../gpu/drm/amd/display/dc/dce/dce_clock_source.c  | 32 ++++++++----------=
----
 drivers/gpu/drm/amd/display/dc/dce/dce_i2c_hw.c    | 13 +--------
 .../drm/amd/display/dc/dce100/dce100_resource.c    |  4 +--
 .../drm/amd/display/dc/dce110/dce110_resource.c    |  4 +--
 .../gpu/drm/amd/display/dc/dce80/dce80_resource.c  | 12 ++------
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hwseq.c |  9 +++---
 12 files changed, 36 insertions(+), 79 deletions(-)

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15663092011.414cB.24538
Date: Tue, 20 Aug 2019 13:53:21 +0000
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
   title=3D"NEW - [bisected][tonga] Boot failures on agd5f's drm-next branc=
h"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111432#c2">Commen=
t # 2</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [bisected][tonga] Boot failures on agd5f's drm-next branc=
h"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111432">bug 11143=
2</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
mike&#64;fireburn.co.uk" title=3D"Mike Lothian &lt;mike&#64;fireburn.co.uk&=
gt;"> <span class=3D"fn">Mike Lothian</span></a>
</span></b>
        <pre>I've bisected this to:

9adc8050bf3ca3e49c65e13259a4c310640542f1 is the first bad commit
commit 9adc8050bf3ca3e49c65e13259a4c310640542f1
Author: Dmytro Laktyushkin &lt;<a href=3D"mailto:Dmytro.Laktyushkin&#64;amd=
.com">Dmytro.Laktyushkin&#64;amd.com</a>&gt;
Date:   Fri Jul 12 15:06:06 2019 -0400

    drm/amd/display: make firmware info only load once during dc_bios create

    Currently every time DC wants to access firmware info we make a call
    into VBIOS. This makes no sense as there is nothing that can change
    runtime inside fw info and can cause issues when calling unstable
    bios during bringup.

    This change eliminate this behavior by only calling bios once for fw
    info and keeping it stored as part of dc_bios.

    Signed-off-by: Dmytro Laktyushkin &lt;<a href=3D"mailto:Dmytro.Laktyush=
kin&#64;amd.com">Dmytro.Laktyushkin&#64;amd.com</a>&gt;
    Reviewed-by: Chris Park &lt;<a href=3D"mailto:Chris.Park&#64;amd.com">C=
hris.Park&#64;amd.com</a>&gt;
    Acked-by: Leo Li &lt;<a href=3D"mailto:sunpeng.li&#64;amd.com">sunpeng.=
li&#64;amd.com</a>&gt;
    Signed-off-by: Alex Deucher &lt;<a href=3D"mailto:alexander.deucher&#64=
;amd.com">alexander.deucher&#64;amd.com</a>&gt;

 drivers/gpu/drm/amd/display/dc/bios/bios_parser.c  |  3 +-
 drivers/gpu/drm/amd/display/dc/bios/bios_parser2.c |  3 +-
 .../amd/display/dc/clk_mgr/dce100/dce_clk_mgr.c    | 17 ++++--------
 .../drm/amd/display/dc/clk_mgr/dcn10/rv1_clk_mgr.c |  6 ++--
 drivers/gpu/drm/amd/display/dc/core/dc_resource.c  |  7 ++---
 drivers/gpu/drm/amd/display/dc/dc_bios_types.h     |  5 ++--
 .../gpu/drm/amd/display/dc/dce/dce_clock_source.c  | 32 ++++++++----------=
----
 drivers/gpu/drm/amd/display/dc/dce/dce_i2c_hw.c    | 13 +--------
 .../drm/amd/display/dc/dce100/dce100_resource.c    |  4 +--
 .../drm/amd/display/dc/dce110/dce110_resource.c    |  4 +--
 .../gpu/drm/amd/display/dc/dce80/dce80_resource.c  | 12 ++------
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hwseq.c |  9 +++---
 12 files changed, 36 insertions(+), 79 deletions(-)</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15663092011.414cB.24538--

--===============1406130082==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1406130082==--
