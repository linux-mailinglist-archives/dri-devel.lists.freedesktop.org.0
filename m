Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 79653257F5
	for <lists+dri-devel@lfdr.de>; Tue, 21 May 2019 21:01:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA9588954A;
	Tue, 21 May 2019 19:01:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 9BB098954A
 for <dri-devel@lists.freedesktop.org>; Tue, 21 May 2019 19:01:38 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 9384472167; Tue, 21 May 2019 19:01:38 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110719] Crash in radeon_drv_video.so when attempting to convert
 rgb video data
Date: Tue, 21 May 2019 19:01:38 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Mesa
X-Bugzilla-Component: Drivers/Gallium/radeonsi
X-Bugzilla-Version: git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: oreaus@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 qa_contact
Message-ID: <bug-110719-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1122918249=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1122918249==
Content-Type: multipart/alternative; boundary="15584652980.5DAC4d.17698"
Content-Transfer-Encoding: 7bit


--15584652980.5DAC4d.17698
Date: Tue, 21 May 2019 19:01:38 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110719

            Bug ID: 110719
           Summary: Crash in radeon_drv_video.so when attempting to
                    convert rgb video data
           Product: Mesa
           Version: git
          Hardware: All
                OS: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Drivers/Gallium/radeonsi
          Assignee: dri-devel@lists.freedesktop.org
          Reporter: oreaus@gmail.com
        QA Contact: dri-devel@lists.freedesktop.org

Kernel 5.0.0
Mesa 19.2.0-devel (git-629806b55b)
OpenGL renderer string: AMD Radeon (TM) RX 460 Graphics (POLARIS11, DRM 3.2=
7.0,
5.0.0, LLVM 8.0.0)

I can reproduce the crash with this command:

`ffmpeg -hwaccel vaapi -vaapi_device /dev/dri/renderD128 -i input.mp4 -vf
'format=3Drgb0,hwupload' -vcodec h264_vaapi -bf 0 output.mp4`

The input video does not have to be rgb0 format, this command just tells it
that it is to demonstrate the problem. av_hwframe_transfer_get_formats()
reports rgb0 is supported but clearly there's a problem. This is the backtr=
ace
for h264_vaapi:

Thread 1 "ffmpeg" received signal SIGSEGV, Segmentation fault.
create (enc=3D0x555555ec73a0) at
../src/gallium/drivers/radeon/radeon_vce_52.c:188
188                     RVCE_CS(enc->chroma->u.legacy.level[0].nblk_x *
enc->chroma->bpe); // encRefPicChromaPitch
(gdb) bt full
#0  0x00007fffd740a407 in create (enc=3D0x555555ec73a0) at
../src/gallium/drivers/radeon/radeon_vce_52.c:188
        begin =3D 0x7fffc060102c
        sscreen =3D 0x555555812020
#1  0x00007fffd73bfe13 in rvce_begin_frame (encoder=3D0x555555ec73a0,
source=3D0x5555561c2ea0, picture=3D<optimized out>) at
../src/gallium/drivers/radeon/radeon_vce.c:291
        fb =3D {usage =3D 4, res =3D 0x555555ed02f0}
        enc =3D 0x555555ec73a0
        vid_buf =3D 0x5555561c2ea0
        pic =3D <optimized out>
        need_rate_control =3D true
#2  0x00007fffd72d32ed in vlVaEndPicture (ctx=3D<optimized out>,
context_id=3D<optimized out>) at ../src/gallium/state_trackers/va/picture.c=
:655
        drv =3D 0x55555580c6c0
        context =3D 0x555555ec3180
        coded_buf =3D 0x5555561e6360
        surf =3D 0x5555561f0320
        feedback =3D 0x555555a6eec0
        screen =3D <optimized out>
        supported =3D <optimized out>
        realloc =3D <optimized out>
        format =3D <optimized out>
#3  0x00007ffff085d820 in vaEndPicture () at
/usr/lib/x86_64-linux-gnu/libva.so.2
#4  0x00007ffff6212e53 in  () at /usr/lib/x86_64-linux-gnu/libavcodec.so.57
#5  0x00007ffff6213149 in  () at /usr/lib/x86_64-linux-gnu/libavcodec.so.57
#6  0x00007ffff62137be in  () at /usr/lib/x86_64-linux-gnu/libavcodec.so.57
#7  0x00007ffff5dbc6c7 in avcodec_encode_video2 () at
/usr/lib/x86_64-linux-gnu/libavcodec.so.57
#8  0x00007ffff5dbcaad in  () at /usr/lib/x86_64-linux-gnu/libavcodec.so.57
#9  0x00007ffff5dbcc5a in avcodec_send_frame () at
/usr/lib/x86_64-linux-gnu/libavcodec.so.57

and for hevc_vaapi:

Thread 1 "ffmpeg" received signal SIGSEGV, Segmentation fault.
0x00007fffd7406f4f in radeon_uvd_enc_encode_params_hevc (enc=3D0x555555ec70=
40) at
../src/gallium/drivers/radeon/radeon_uvd_enc_1_1.c:972
972        enc->enc_pic.enc_params.allowed_max_bitstream_size =3D enc->bs_s=
ize;
(gdb) bt full
#0  0x00007fffd7406f4f in radeon_uvd_enc_encode_params_hevc
(enc=3D0x555555ec7040) at ../src/gallium/drivers/radeon/radeon_uvd_enc_1_1.=
c:972
        sscreen =3D 0x555555812020
#1  0x00007fffd7406f4f in encode (enc=3D0x555555ec7040) at
../src/gallium/drivers/radeon/radeon_uvd_enc_1_1.c:1104
#2  0x00007fffd72d3304 in vlVaEndPicture (ctx=3D<optimized out>,
context_id=3D<optimized out>) at ../src/gallium/state_trackers/va/picture.c=
:656
        drv =3D 0x55555580c6c0
        context =3D 0x555555ec4420
        coded_buf =3D 0x555555ec6180
        surf =3D 0x5555561f0570
        feedback =3D 0x5555557bd0c0
        screen =3D <optimized out>
        supported =3D <optimized out>
        realloc =3D <optimized out>
        format =3D <optimized out>
#3  0x00007ffff085d820 in vaEndPicture () at
/usr/lib/x86_64-linux-gnu/libva.so.2
#4  0x00007ffff6212e53 in  () at /usr/lib/x86_64-linux-gnu/libavcodec.so.57
#5  0x00007ffff6213149 in  () at /usr/lib/x86_64-linux-gnu/libavcodec.so.57
#6  0x00007ffff62137be in  () at /usr/lib/x86_64-linux-gnu/libavcodec.so.57
#7  0x00007ffff5dbc6c7 in avcodec_encode_video2 () at
/usr/lib/x86_64-linux-gnu/libavcodec.so.57
#8  0x00007ffff5dbcaad in  () at /usr/lib/x86_64-linux-gnu/libavcodec.so.57
#9  0x00007ffff5dbcc5a in avcodec_send_frame () at
/usr/lib/x86_64-linux-gnu/libavcodec.so.57

It seems the driver should support this format or at least just report only=
 the
formats it actually supports.

Please note that this bug was discovered by a screen recorder implementing
vaapi. Passing rgb data to the intel vaapi driver works as expected.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15584652980.5DAC4d.17698
Date: Tue, 21 May 2019 19:01:38 +0000
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
   title=3D"NEW - Crash in radeon_drv_video.so when attempting to convert r=
gb video data"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110719">110719</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Crash in radeon_drv_video.so when attempting to convert rgb v=
ideo data
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>Mesa
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>git
          </td>
        </tr>

        <tr>
          <th>Hardware</th>
          <td>All
          </td>
        </tr>

        <tr>
          <th>OS</th>
          <td>All
          </td>
        </tr>

        <tr>
          <th>Status</th>
          <td>NEW
          </td>
        </tr>

        <tr>
          <th>Severity</th>
          <td>normal
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
          <td>oreaus&#64;gmail.com
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>dri-devel&#64;lists.freedesktop.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Kernel 5.0.0
Mesa 19.2.0-devel (git-629806b55b)
OpenGL renderer string: AMD Radeon (TM) RX 460 Graphics (POLARIS11, DRM 3.2=
7.0,
5.0.0, LLVM 8.0.0)

I can reproduce the crash with this command:

`ffmpeg -hwaccel vaapi -vaapi_device /dev/dri/renderD128 -i input.mp4 -vf
'format=3Drgb0,hwupload' -vcodec h264_vaapi -bf 0 output.mp4`

The input video does not have to be rgb0 format, this command just tells it
that it is to demonstrate the problem. av_hwframe_transfer_get_formats()
reports rgb0 is supported but clearly there's a problem. This is the backtr=
ace
for h264_vaapi:

Thread 1 &quot;ffmpeg&quot; received signal SIGSEGV, Segmentation fault.
create (enc=3D0x555555ec73a0) at
../src/gallium/drivers/radeon/radeon_vce_52.c:188
188                     RVCE_CS(enc-&gt;chroma-&gt;u.legacy.level[0].nblk_x=
 *
enc-&gt;chroma-&gt;bpe); // encRefPicChromaPitch
(gdb) bt full
#0  0x00007fffd740a407 in create (enc=3D0x555555ec73a0) at
../src/gallium/drivers/radeon/radeon_vce_52.c:188
        begin =3D 0x7fffc060102c
        sscreen =3D 0x555555812020
#1  0x00007fffd73bfe13 in rvce_begin_frame (encoder=3D0x555555ec73a0,
source=3D0x5555561c2ea0, picture=3D&lt;optimized out&gt;) at
../src/gallium/drivers/radeon/radeon_vce.c:291
        fb =3D {usage =3D 4, res =3D 0x555555ed02f0}
        enc =3D 0x555555ec73a0
        vid_buf =3D 0x5555561c2ea0
        pic =3D &lt;optimized out&gt;
        need_rate_control =3D true
#2  0x00007fffd72d32ed in vlVaEndPicture (ctx=3D&lt;optimized out&gt;,
context_id=3D&lt;optimized out&gt;) at ../src/gallium/state_trackers/va/pic=
ture.c:655
        drv =3D 0x55555580c6c0
        context =3D 0x555555ec3180
        coded_buf =3D 0x5555561e6360
        surf =3D 0x5555561f0320
        feedback =3D 0x555555a6eec0
        screen =3D &lt;optimized out&gt;
        supported =3D &lt;optimized out&gt;
        realloc =3D &lt;optimized out&gt;
        format =3D &lt;optimized out&gt;
#3  0x00007ffff085d820 in vaEndPicture () at
/usr/lib/x86_64-linux-gnu/libva.so.2
#4  0x00007ffff6212e53 in  () at /usr/lib/x86_64-linux-gnu/libavcodec.so.57
#5  0x00007ffff6213149 in  () at /usr/lib/x86_64-linux-gnu/libavcodec.so.57
#6  0x00007ffff62137be in  () at /usr/lib/x86_64-linux-gnu/libavcodec.so.57
#7  0x00007ffff5dbc6c7 in avcodec_encode_video2 () at
/usr/lib/x86_64-linux-gnu/libavcodec.so.57
#8  0x00007ffff5dbcaad in  () at /usr/lib/x86_64-linux-gnu/libavcodec.so.57
#9  0x00007ffff5dbcc5a in avcodec_send_frame () at
/usr/lib/x86_64-linux-gnu/libavcodec.so.57

and for hevc_vaapi:

Thread 1 &quot;ffmpeg&quot; received signal SIGSEGV, Segmentation fault.
0x00007fffd7406f4f in radeon_uvd_enc_encode_params_hevc (enc=3D0x555555ec70=
40) at
../src/gallium/drivers/radeon/radeon_uvd_enc_1_1.c:972
972        enc-&gt;enc_pic.enc_params.allowed_max_bitstream_size =3D enc-&g=
t;bs_size;
(gdb) bt full
#0  0x00007fffd7406f4f in radeon_uvd_enc_encode_params_hevc
(enc=3D0x555555ec7040) at ../src/gallium/drivers/radeon/radeon_uvd_enc_1_1.=
c:972
        sscreen =3D 0x555555812020
#1  0x00007fffd7406f4f in encode (enc=3D0x555555ec7040) at
../src/gallium/drivers/radeon/radeon_uvd_enc_1_1.c:1104
#2  0x00007fffd72d3304 in vlVaEndPicture (ctx=3D&lt;optimized out&gt;,
context_id=3D&lt;optimized out&gt;) at ../src/gallium/state_trackers/va/pic=
ture.c:656
        drv =3D 0x55555580c6c0
        context =3D 0x555555ec4420
        coded_buf =3D 0x555555ec6180
        surf =3D 0x5555561f0570
        feedback =3D 0x5555557bd0c0
        screen =3D &lt;optimized out&gt;
        supported =3D &lt;optimized out&gt;
        realloc =3D &lt;optimized out&gt;
        format =3D &lt;optimized out&gt;
#3  0x00007ffff085d820 in vaEndPicture () at
/usr/lib/x86_64-linux-gnu/libva.so.2
#4  0x00007ffff6212e53 in  () at /usr/lib/x86_64-linux-gnu/libavcodec.so.57
#5  0x00007ffff6213149 in  () at /usr/lib/x86_64-linux-gnu/libavcodec.so.57
#6  0x00007ffff62137be in  () at /usr/lib/x86_64-linux-gnu/libavcodec.so.57
#7  0x00007ffff5dbc6c7 in avcodec_encode_video2 () at
/usr/lib/x86_64-linux-gnu/libavcodec.so.57
#8  0x00007ffff5dbcaad in  () at /usr/lib/x86_64-linux-gnu/libavcodec.so.57
#9  0x00007ffff5dbcc5a in avcodec_send_frame () at
/usr/lib/x86_64-linux-gnu/libavcodec.so.57

It seems the driver should support this format or at least just report only=
 the
formats it actually supports.

Please note that this bug was discovered by a screen recorder implementing
vaapi. Passing rgb data to the intel vaapi driver works as expected.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15584652980.5DAC4d.17698--

--===============1122918249==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1122918249==--
