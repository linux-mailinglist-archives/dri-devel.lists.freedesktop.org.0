Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1486A77D9A
	for <lists+dri-devel@lfdr.de>; Sun, 28 Jul 2019 06:04:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7F9B6E8B8;
	Sun, 28 Jul 2019 04:04:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 696E76E8B8
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Jul 2019 04:04:55 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 618E972167; Sun, 28 Jul 2019 04:04:55 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111236] VA-API radeonsi SIGSEGV __memmove_avx_unaligned
Date: Sun, 28 Jul 2019 04:04:55 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Mesa
X-Bugzilla-Component: Drivers/Gallium/radeonsi
X-Bugzilla-Version: 19.1
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: liewkj@yahoo.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-111236-502-xFX0v0mZHF@http.bugs.freedesktop.org/>
In-Reply-To: <bug-111236-502@http.bugs.freedesktop.org/>
References: <bug-111236-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1428050014=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1428050014==
Content-Type: multipart/alternative; boundary="15642866950.762Eae.16017"
Content-Transfer-Encoding: 7bit


--15642866950.762Eae.16017
Date: Sun, 28 Jul 2019 04:04:55 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111236

--- Comment #5 from KJ Liew <liewkj@yahoo.com> ---
Here's the gdb stack-trace with debug build. If you need the same test video
clip, this is what I used
Test h264 clip:
$ youtube-dl -f mp4 https://www.youtube.com/watch?v=3DazvR__GRQic

Thread 4 "multiqueue0:src" received signal SIGSEGV, Segmentation fault.
[Switching to Thread 0x7ffff5cc3700 (LWP 2173)]
0x00007ffff7f42c05 in __memmove_avx_unaligned () from /usr/lib/libc.so.6
(gdb) bt
#0  0x00007ffff7f42c05 in __memmove_avx_unaligned () from /usr/lib/libc.so.6
#1  0x00007fffda0ce432 in util_copy_rect (dst=3D0x7ffff53e6000
"_base_parse_set_passthrough", format=3DPIPE_FORMAT_R8_UNORM, dst_stride=3D=
0x100,=20
    dst_x=3D0x0, dst_y=3D0x0, width=3D0x20, height=3D0x20, src=3D0x7fffec07=
d850 "",
src_stride=3D0x20, src_x=3D0x0, src_y=3D0x0)
    at ../mesa-19.1.3/src/gallium/auxiliary/util/u_surface.c:105
#2  0x00007fffda0ce4c6 in util_copy_box (dst=3D0x7ffff53e6000
"_base_parse_set_passthrough", format=3DPIPE_FORMAT_R8_UNORM, dst_stride=3D=
0x100,=20
    dst_slice_stride=3D0x2000, dst_x=3D0x0, dst_y=3D0x0, dst_z=3D0x0, width=
=3D0x20,
height=3D0x20, depth=3D0x1, src=3D0x7fffec07d850 "", src_stride=3D0x20,=20
    src_slice_stride=3D0x0, src_x=3D0x0, src_y=3D0x0, src_z=3D0x0) at
../mesa-19.1.3/src/gallium/auxiliary/util/u_surface.c:131
#3  0x00007fffdad7d8f5 in u_default_texture_subdata (pipe=3D0x7fffe82ff760,
resource=3D0x7fffec073f20, level=3D0x0, usage=3D0x102, box=3D0x7ffff5cc1550=
,=20
    data=3D0x7fffec07d850, stride=3D0x20, layer_stride=3D0x0) at
../mesa-19.1.3/src/gallium/auxiliary/util/u_transfer.c:67
#4  0x00007fffe74b7c56 in vlVaPutImage (ctx=3D0x7fffe82f2400, surface=3D0xc,
image=3D0xd, src_x=3D0x0, src_y=3D0x0, src_width=3D0x40, src_height=3D0x40,=
=20
    dest_x=3D0x0, dest_y=3D0x0, dest_width=3D0x40, dest_height=3D0x40) at
../mesa-19.1.3/src/gallium/state_trackers/va/image.c:607
#5  0x00007ffff4976ffd in vaPutImage () from /usr/lib/libva.so.2
#6  0x00007ffff49f4c1e in ?? () from /usr/lib/gstreamer-1.0/libgstvaapi.so
#7  0x00007ffff4a2ecf3 in ?? () from /usr/lib/gstreamer-1.0/libgstvaapi.so
#8  0x00007ffff4a2f2bf in ?? () from /usr/lib/gstreamer-1.0/libgstvaapi.so
#9  0x00007ffff4a2703b in ?? () from /usr/lib/gstreamer-1.0/libgstvaapi.so
#10 0x00007ffff782fe53 in ?? () from /usr/lib/libgstbase-1.0.so.0
#11 0x00007ffff7835ee1 in ?? () from /usr/lib/libgstbase-1.0.so.0
#12 0x00007ffff7a3bcca in gst_pad_query () from /usr/lib/libgstreamer-1.0.s=
o.0
#13 0x00007ffff7a3c3de in gst_pad_peer_query () from
/usr/lib/libgstreamer-1.0.so.0
#14 0x00007ffff7a0a887 in gst_pad_peer_query_caps () from
/usr/lib/libgstreamer-1.0.so.0
#15 0x00007ffff7835cd1 in ?? () from /usr/lib/libgstbase-1.0.so.0

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15642866950.762Eae.16017
Date: Sun, 28 Jul 2019 04:04:55 +0000
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
   title=3D"NEW - VA-API radeonsi SIGSEGV __memmove_avx_unaligned"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111236#c5">Commen=
t # 5</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - VA-API radeonsi SIGSEGV __memmove_avx_unaligned"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111236">bug 11123=
6</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
liewkj&#64;yahoo.com" title=3D"KJ Liew &lt;liewkj&#64;yahoo.com&gt;"> <span=
 class=3D"fn">KJ Liew</span></a>
</span></b>
        <pre>Here's the gdb stack-trace with debug build. If you need the s=
ame test video
clip, this is what I used
Test h264 clip:
$ youtube-dl -f mp4 <a href=3D"https://www.youtube.com/watch?v=3DazvR__GRQi=
c">https://www.youtube.com/watch?v=3DazvR__GRQic</a>

Thread 4 &quot;multiqueue0:src&quot; received signal SIGSEGV, Segmentation =
fault.
[Switching to Thread 0x7ffff5cc3700 (LWP 2173)]
0x00007ffff7f42c05 in __memmove_avx_unaligned () from /usr/lib/libc.so.6
(gdb) bt
#0  0x00007ffff7f42c05 in __memmove_avx_unaligned () from /usr/lib/libc.so.6
#1  0x00007fffda0ce432 in util_copy_rect (dst=3D0x7ffff53e6000
&quot;_base_parse_set_passthrough&quot;, format=3DPIPE_FORMAT_R8_UNORM, dst=
_stride=3D0x100,=20
    dst_x=3D0x0, dst_y=3D0x0, width=3D0x20, height=3D0x20, src=3D0x7fffec07=
d850 &quot;&quot;,
src_stride=3D0x20, src_x=3D0x0, src_y=3D0x0)
    at ../mesa-19.1.3/src/gallium/auxiliary/util/u_surface.c:105
#2  0x00007fffda0ce4c6 in util_copy_box (dst=3D0x7ffff53e6000
&quot;_base_parse_set_passthrough&quot;, format=3DPIPE_FORMAT_R8_UNORM, dst=
_stride=3D0x100,=20
    dst_slice_stride=3D0x2000, dst_x=3D0x0, dst_y=3D0x0, dst_z=3D0x0, width=
=3D0x20,
height=3D0x20, depth=3D0x1, src=3D0x7fffec07d850 &quot;&quot;, src_stride=
=3D0x20,=20
    src_slice_stride=3D0x0, src_x=3D0x0, src_y=3D0x0, src_z=3D0x0) at
../mesa-19.1.3/src/gallium/auxiliary/util/u_surface.c:131
#3  0x00007fffdad7d8f5 in u_default_texture_subdata (pipe=3D0x7fffe82ff760,
resource=3D0x7fffec073f20, level=3D0x0, usage=3D0x102, box=3D0x7ffff5cc1550=
,=20
    data=3D0x7fffec07d850, stride=3D0x20, layer_stride=3D0x0) at
../mesa-19.1.3/src/gallium/auxiliary/util/u_transfer.c:67
#4  0x00007fffe74b7c56 in vlVaPutImage (ctx=3D0x7fffe82f2400, surface=3D0xc,
image=3D0xd, src_x=3D0x0, src_y=3D0x0, src_width=3D0x40, src_height=3D0x40,=
=20
    dest_x=3D0x0, dest_y=3D0x0, dest_width=3D0x40, dest_height=3D0x40) at
../mesa-19.1.3/src/gallium/state_trackers/va/image.c:607
#5  0x00007ffff4976ffd in vaPutImage () from /usr/lib/libva.so.2
#6  0x00007ffff49f4c1e in ?? () from /usr/lib/gstreamer-1.0/libgstvaapi.so
#7  0x00007ffff4a2ecf3 in ?? () from /usr/lib/gstreamer-1.0/libgstvaapi.so
#8  0x00007ffff4a2f2bf in ?? () from /usr/lib/gstreamer-1.0/libgstvaapi.so
#9  0x00007ffff4a2703b in ?? () from /usr/lib/gstreamer-1.0/libgstvaapi.so
#10 0x00007ffff782fe53 in ?? () from /usr/lib/libgstbase-1.0.so.0
#11 0x00007ffff7835ee1 in ?? () from /usr/lib/libgstbase-1.0.so.0
#12 0x00007ffff7a3bcca in gst_pad_query () from /usr/lib/libgstreamer-1.0.s=
o.0
#13 0x00007ffff7a3c3de in gst_pad_peer_query () from
/usr/lib/libgstreamer-1.0.so.0
#14 0x00007ffff7a0a887 in gst_pad_peer_query_caps () from
/usr/lib/libgstreamer-1.0.so.0
#15 0x00007ffff7835cd1 in ?? () from /usr/lib/libgstbase-1.0.so.0</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15642866950.762Eae.16017--

--===============1428050014==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1428050014==--
