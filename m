Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 20C949CB40
	for <lists+dri-devel@lfdr.de>; Mon, 26 Aug 2019 10:08:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C37E6E10C;
	Mon, 26 Aug 2019 08:08:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 34B356E10C
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Aug 2019 08:08:52 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 2837B72161; Mon, 26 Aug 2019 08:08:52 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111455] DMAR: [INTR-REMAP] Blocked an interrupt request due to
 source-id verification failure
Date: Mon, 26 Aug 2019 08:08:52 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: XOrg git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: not set
X-Bugzilla-Who: nikolay@oldum.net
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: not set
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-111455-502-k5CQXXvcwd@http.bugs.freedesktop.org/>
In-Reply-To: <bug-111455-502@http.bugs.freedesktop.org/>
References: <bug-111455-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0638913004=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0638913004==
Content-Type: multipart/alternative; boundary="15668069320.7D9cD.24642"
Content-Transfer-Encoding: 7bit


--15668069320.7D9cD.24642
Date: Mon, 26 Aug 2019 08:08:52 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111455

--- Comment #1 from Nikolay Kichukov <nikolay@oldum.net> ---
Not much seems to have been captured by running the kernel with:
'drm.debug=3D0x1e log_buf_len=3D4M'

...snip...
Aug 25 19:03:44 localhost kernel: [283823.907593][T15386]
[drm:amdgpu_display_flip_work_func [amdgpu]] crtc:1[00000000c905a8f5],
pflip_stat:AMDGPU_FLIP_SUBMITTED, work: 00000000c841325d,
Aug 25 19:03:44 localhost kernel: [283823.922605][ T8596]
[drm:amdgpu_display_crtc_page_flip_target [amdgpu]] crtc:0[00000000cc62eb17=
],
pflip_stat:AMDGPU_FLIP_PENDING, work: 0000000019340169,
Aug 25 19:03:44 localhost kernel: [283823.922640][ T8596]
[drm:amdgpu_display_crtc_page_flip_target [amdgpu]] crtc:1[00000000c905a8f5=
],
pflip_stat:AMDGPU_FLIP_PENDING, work: 00000000b4d9949b,
Aug 25 19:03:44 localhost kernel: [283823.924283][T15386]
[drm:amdgpu_display_flip_work_func [amdgpu]] crtc:0[00000000cc62eb17],
pflip_stat:AMDGPU_FLIP_SUBMITTED, work: 0000000019340169,
Aug 25 19:03:44 localhost kernel: [283823.924316][T15386]
[drm:amdgpu_display_flip_work_func [amdgpu]] crtc:1[00000000c905a8f5],
pflip_stat:AMDGPU_FLIP_SUBMITTED, work: 00000000b4d9949b,
Aug 25 19:03:44 localhost kernel: [283823.939256][ T8596]
[drm:amdgpu_display_crtc_page_flip_target [amdgpu]] crtc:0[00000000cc62eb17=
],
pflip_stat:AMDGPU_FLIP_PENDING, work: 00000000a8e63b00,
Aug 25 19:03:44 localhost kernel: [283823.939292][ T8596]
[drm:amdgpu_display_crtc_page_flip_target [amdgpu]] crtc:1[00000000c905a8f5=
],
pflip_stat:AMDGPU_FLIP_PENDING, work: 00000000b1a1f198,
Aug 25 19:03:44 localhost kernel: [283823.940944][T15386]
[drm:amdgpu_display_flip_work_func [amdgpu]] crtc:0[00000000cc62eb17],
pflip_stat:AMDGPU_FLIP_SUBMITTED, work: 00000000a8e63b00,
Aug 25 19:03:44 localhost kernel: [283823.940975][T15386]
[drm:amdgpu_display_flip_work_func [amdgpu]] crtc:1[00000000c905a8f5],
pflip_stat:AMDGPU_FLIP_SUBMITTED, work: 00000000b1a1f198,
Aug 25 19:03:44 localhost kernel: [283823.955946][ T8596]
[drm:amdgpu_display_crtc_page_flip_target [amdgpu]] crtc:0[00000000cc62eb17=
],
pflip_stat:AMDGPU_FLIP_PENDING, work: 00000000614cee44,
Aug 25 19:03:44 localhost kernel: [283823.955982][ T8596]
[drm:amdgpu_display_crtc_page_flip_target [amdgpu]] crtc:1[00000000c905a8f5=
],
pflip_stat:AMDGPU_FLIP_PENDING, work: 00000000df74fb67,
Aug 25 19:03:44 localhost kernel: [283823.957643][T15386]
[drm:amdgpu_display_flip_work_func [amdgpu]] crtc:0[00000000cc62eb17],
pflip_stat:AMDGPU_FLIP_SUBMITTED, work: 00000000614cee44,
Aug 25 19:03:44 localhost kernel: [283823.957673][T15386]
[drm:amdgpu_display_flip_work_func [amdgpu]] crtc:1[00000000c905a8f5],
pflip_stat:AMDGPU_FLIP_SUBMITTED, work: 00000000df74fb67,
Aug 25 19:03:45 localhost kernel: [283824.053148][    C0] DMAR: DRHD: handl=
ing
fault status reg 2
Aug 25 19:03:45 localhost kernel: [283824.053153][    C0] DMAR: [INTR-REMAP]
Request device [00:00.0] fault index 26 [fault reason 38] Blocked an interr=
upt
request due to source-id verification failure
...end...

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15668069320.7D9cD.24642
Date: Mon, 26 Aug 2019 08:08:52 +0000
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
   title=3D"NEW - DMAR: [INTR-REMAP] Blocked an interrupt request due to so=
urce-id verification failure"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111455#c1">Commen=
t # 1</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - DMAR: [INTR-REMAP] Blocked an interrupt request due to so=
urce-id verification failure"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111455">bug 11145=
5</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
nikolay&#64;oldum.net" title=3D"Nikolay Kichukov &lt;nikolay&#64;oldum.net&=
gt;"> <span class=3D"fn">Nikolay Kichukov</span></a>
</span></b>
        <pre>Not much seems to have been captured by running the kernel wit=
h:
'drm.debug=3D0x1e log_buf_len=3D4M'

...snip...
Aug 25 19:03:44 localhost kernel: [283823.907593][T15386]
[drm:amdgpu_display_flip_work_func [amdgpu]] crtc:1[00000000c905a8f5],
pflip_stat:AMDGPU_FLIP_SUBMITTED, work: 00000000c841325d,
Aug 25 19:03:44 localhost kernel: [283823.922605][ T8596]
[drm:amdgpu_display_crtc_page_flip_target [amdgpu]] crtc:0[00000000cc62eb17=
],
pflip_stat:AMDGPU_FLIP_PENDING, work: 0000000019340169,
Aug 25 19:03:44 localhost kernel: [283823.922640][ T8596]
[drm:amdgpu_display_crtc_page_flip_target [amdgpu]] crtc:1[00000000c905a8f5=
],
pflip_stat:AMDGPU_FLIP_PENDING, work: 00000000b4d9949b,
Aug 25 19:03:44 localhost kernel: [283823.924283][T15386]
[drm:amdgpu_display_flip_work_func [amdgpu]] crtc:0[00000000cc62eb17],
pflip_stat:AMDGPU_FLIP_SUBMITTED, work: 0000000019340169,
Aug 25 19:03:44 localhost kernel: [283823.924316][T15386]
[drm:amdgpu_display_flip_work_func [amdgpu]] crtc:1[00000000c905a8f5],
pflip_stat:AMDGPU_FLIP_SUBMITTED, work: 00000000b4d9949b,
Aug 25 19:03:44 localhost kernel: [283823.939256][ T8596]
[drm:amdgpu_display_crtc_page_flip_target [amdgpu]] crtc:0[00000000cc62eb17=
],
pflip_stat:AMDGPU_FLIP_PENDING, work: 00000000a8e63b00,
Aug 25 19:03:44 localhost kernel: [283823.939292][ T8596]
[drm:amdgpu_display_crtc_page_flip_target [amdgpu]] crtc:1[00000000c905a8f5=
],
pflip_stat:AMDGPU_FLIP_PENDING, work: 00000000b1a1f198,
Aug 25 19:03:44 localhost kernel: [283823.940944][T15386]
[drm:amdgpu_display_flip_work_func [amdgpu]] crtc:0[00000000cc62eb17],
pflip_stat:AMDGPU_FLIP_SUBMITTED, work: 00000000a8e63b00,
Aug 25 19:03:44 localhost kernel: [283823.940975][T15386]
[drm:amdgpu_display_flip_work_func [amdgpu]] crtc:1[00000000c905a8f5],
pflip_stat:AMDGPU_FLIP_SUBMITTED, work: 00000000b1a1f198,
Aug 25 19:03:44 localhost kernel: [283823.955946][ T8596]
[drm:amdgpu_display_crtc_page_flip_target [amdgpu]] crtc:0[00000000cc62eb17=
],
pflip_stat:AMDGPU_FLIP_PENDING, work: 00000000614cee44,
Aug 25 19:03:44 localhost kernel: [283823.955982][ T8596]
[drm:amdgpu_display_crtc_page_flip_target [amdgpu]] crtc:1[00000000c905a8f5=
],
pflip_stat:AMDGPU_FLIP_PENDING, work: 00000000df74fb67,
Aug 25 19:03:44 localhost kernel: [283823.957643][T15386]
[drm:amdgpu_display_flip_work_func [amdgpu]] crtc:0[00000000cc62eb17],
pflip_stat:AMDGPU_FLIP_SUBMITTED, work: 00000000614cee44,
Aug 25 19:03:44 localhost kernel: [283823.957673][T15386]
[drm:amdgpu_display_flip_work_func [amdgpu]] crtc:1[00000000c905a8f5],
pflip_stat:AMDGPU_FLIP_SUBMITTED, work: 00000000df74fb67,
Aug 25 19:03:45 localhost kernel: [283824.053148][    C0] DMAR: DRHD: handl=
ing
fault status reg 2
Aug 25 19:03:45 localhost kernel: [283824.053153][    C0] DMAR: [INTR-REMAP]
Request device [00:00.0] fault index 26 [fault reason 38] Blocked an interr=
upt
request due to source-id verification failure
...end...</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15668069320.7D9cD.24642--

--===============0638913004==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0638913004==--
