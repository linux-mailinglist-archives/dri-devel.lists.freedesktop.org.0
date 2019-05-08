Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A520B1707E
	for <lists+dri-devel@lfdr.de>; Wed,  8 May 2019 07:48:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EBFC6E872;
	Wed,  8 May 2019 05:48:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 91EA56E872
 for <dri-devel@lists.freedesktop.org>; Wed,  8 May 2019 05:48:53 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 8ACB27215A; Wed,  8 May 2019 05:48:53 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110639] enc->enc_pic.enc_pic_order_cnt_type always zero even if
 pic->pic_order_cnt_type non-zero that application set
Date: Wed, 08 May 2019 05:48:53 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Mesa
X-Bugzilla-Component: Drivers/Gallium/radeonsi
X-Bugzilla-Version: 18.0
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: major
X-Bugzilla-Who: wangfengjuan3@huawei.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 qa_contact attachments.created
Message-ID: <bug-110639-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1089647878=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1089647878==
Content-Type: multipart/alternative; boundary="15572945330.530e19bDd.23440"
Content-Transfer-Encoding: 7bit


--15572945330.530e19bDd.23440
Date: Wed, 8 May 2019 05:48:53 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110639

            Bug ID: 110639
           Summary: enc->enc_pic.enc_pic_order_cnt_type always zero even
                    if  pic->pic_order_cnt_type non-zero that application
                    set
           Product: Mesa
           Version: 18.0
          Hardware: ARM
                OS: Linux (All)
            Status: NEW
          Severity: major
          Priority: medium
         Component: Drivers/Gallium/radeonsi
          Assignee: dri-devel@lists.freedesktop.org
          Reporter: wangfengjuan3@huawei.com
        QA Contact: dri-devel@lists.freedesktop.org

Created attachment 144193
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D144193&action=3Dedit
glxinfo

when process yuv encode to h264, player set pic_order_cnt_type non-zero val=
ue,
but h264 SPS pic_order_cnt_type member always zero.

I have found that enc->enc_pic.pc.enc_pic_order_cnt_type always print zero =
in
mesa/src/gallium/drivers/radeon/radeon_vce_52.c:452.

but add enc->enc_pic.pc.enc_pic_order_cnt_type =3D pic->pic_order_cnt_type;=
at fun
get_pic_control_param in mesa/src/gallium/drivers/radeon/radeon_vce_52.c:92=
 can
resove the bug.

Please help to check and commit if the above method is right.

ps:
(gdb) bt
#0  pic_control (enc=3D0xaaaaaacc2d30) at radeon_vce_52.c:527
#1  0x0000ffffbf1620b0 in config (enc=3D0xaaaaaacc2d30) at radeon_vce_52.c:=
452
#2  0x0000ffffbf164d34 in rvce_begin_frame (encoder=3D0xaaaaaacc2d30,
source=3D0xaaaaaabfbc50, picture=3D0xaaaaaabe2828) at radeon_vce.c:292
#3  0x0000ffffbef076f0 in vlVaEndPicture (ctx=3D0xaaaaaaae0c80, context_id=
=3D2) at
picture.c:700
#4  0x0000ffffbf695cb8 in vaEndPicture (dpy=3D0xaaaaaaae0b10, context=3D2) =
at
va.c:1520
#5  0x0000aaaaaaaaf258 in avcenc_render_picture () at
src/va_encode_impl.cpp:831
#6  0x0000aaaaaaab1030 in encode_picture (is_idr=3D1, slice_type=3D2) at
src/va_encode_impl.cpp:1482
#7  0x0000aaaaaaab16e0 in vaapi_encode_yuv_to_h264 (frame_index=3D0) at
src/va_encode_impl.cpp:1613
#8  0x0000aaaaaaab17a4 in vaapi_encode_frame (frame_index=3D0) at
src/va_encode_impl.cpp:1640
#9  0x0000aaaaaaaabba4 in va_encode_frame (frame_index=3D0) at
src/va_encode_api2.cpp:118
#10 0x0000aaaaaaab26dc in main (argc=3D5, argv=3D0xfffffffff678) at
demo/test_va_encode.cpp:164

Thanks.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15572945330.530e19bDd.23440
Date: Wed, 8 May 2019 05:48:53 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body><table border=3D"1" cellspacing=3D"0" cellpadding=3D"8">
        <tr>
          <th>Bug ID</th>
          <td><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - enc-&gt;enc_pic.enc_pic_order_cnt_type always zero even i=
f pic-&gt;pic_order_cnt_type non-zero that application set"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110639">110639</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>enc-&gt;enc_pic.enc_pic_order_cnt_type always zero even if  p=
ic-&gt;pic_order_cnt_type non-zero that application set
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>Mesa
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>18.0
          </td>
        </tr>

        <tr>
          <th>Hardware</th>
          <td>ARM
          </td>
        </tr>

        <tr>
          <th>OS</th>
          <td>Linux (All)
          </td>
        </tr>

        <tr>
          <th>Status</th>
          <td>NEW
          </td>
        </tr>

        <tr>
          <th>Severity</th>
          <td>major
          </td>
        </tr>

        <tr>
          <th>Priority</th>
          <td>medium
          </td>
        </tr>

        <tr>
          <th>Component</th>
          <td>Drivers/Gallium/radeonsi
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>dri-devel&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Reporter</th>
          <td>wangfengjuan3&#64;huawei.com
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>dri-devel&#64;lists.freedesktop.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D144193=
" name=3D"attach_144193" title=3D"glxinfo">attachment 144193</a> <a href=3D=
"attachment.cgi?id=3D144193&amp;action=3Dedit" title=3D"glxinfo">[details]<=
/a></span>
glxinfo

when process yuv encode to h264, player set pic_order_cnt_type non-zero val=
ue,
but h264 SPS pic_order_cnt_type member always zero.

I have found that enc-&gt;enc_pic.pc.enc_pic_order_cnt_type always print ze=
ro in
mesa/src/gallium/drivers/radeon/radeon_vce_52.c:452.

but add enc-&gt;enc_pic.pc.enc_pic_order_cnt_type =3D pic-&gt;pic_order_cnt=
_type;at fun
get_pic_control_param in mesa/src/gallium/drivers/radeon/radeon_vce_52.c:92=
 can
resove the bug.

Please help to check and commit if the above method is right.

ps:
(gdb) bt
#0  pic_control (enc=3D0xaaaaaacc2d30) at radeon_vce_52.c:527
#1  0x0000ffffbf1620b0 in config (enc=3D0xaaaaaacc2d30) at radeon_vce_52.c:=
452
#2  0x0000ffffbf164d34 in rvce_begin_frame (encoder=3D0xaaaaaacc2d30,
source=3D0xaaaaaabfbc50, picture=3D0xaaaaaabe2828) at radeon_vce.c:292
#3  0x0000ffffbef076f0 in vlVaEndPicture (ctx=3D0xaaaaaaae0c80, context_id=
=3D2) at
picture.c:700
#4  0x0000ffffbf695cb8 in vaEndPicture (dpy=3D0xaaaaaaae0b10, context=3D2) =
at
va.c:1520
#5  0x0000aaaaaaaaf258 in avcenc_render_picture () at
src/va_encode_impl.cpp:831
#6  0x0000aaaaaaab1030 in encode_picture (is_idr=3D1, slice_type=3D2) at
src/va_encode_impl.cpp:1482
#7  0x0000aaaaaaab16e0 in vaapi_encode_yuv_to_h264 (frame_index=3D0) at
src/va_encode_impl.cpp:1613
#8  0x0000aaaaaaab17a4 in vaapi_encode_frame (frame_index=3D0) at
src/va_encode_impl.cpp:1640
#9  0x0000aaaaaaaabba4 in va_encode_frame (frame_index=3D0) at
src/va_encode_api2.cpp:118
#10 0x0000aaaaaaab26dc in main (argc=3D5, argv=3D0xfffffffff678) at
demo/test_va_encode.cpp:164

Thanks.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15572945330.530e19bDd.23440--

--===============1089647878==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1089647878==--
