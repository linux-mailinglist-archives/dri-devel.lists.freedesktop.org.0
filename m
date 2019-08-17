Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A19E912E7
	for <lists+dri-devel@lfdr.de>; Sat, 17 Aug 2019 22:59:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FC966E4CD;
	Sat, 17 Aug 2019 20:59:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id EF3AE6E4CD
 for <dri-devel@lists.freedesktop.org>; Sat, 17 Aug 2019 20:59:33 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id E9A4572161; Sat, 17 Aug 2019 20:59:33 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111414] [REGRESSION] [BISECTED] Segmentation fault in
 si_bind_blend_state after removal of the blend state NULL check
Date: Sat, 17 Aug 2019 20:59:33 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Mesa
X-Bugzilla-Component: Drivers/Gallium/radeonsi
X-Bugzilla-Version: git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: edmondo.tommasina@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 qa_contact attachments.created
Message-ID: <bug-111414-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1547057420=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1547057420==
Content-Type: multipart/alternative; boundary="15660755731.533dFCf.12075"
Content-Transfer-Encoding: 7bit


--15660755731.533dFCf.12075
Date: Sat, 17 Aug 2019 20:59:33 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111414

            Bug ID: 111414
           Summary: [REGRESSION] [BISECTED] Segmentation fault in
                    si_bind_blend_state after removal of the blend state
                    NULL check
           Product: Mesa
           Version: git
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Drivers/Gallium/radeonsi
          Assignee: dri-devel@lists.freedesktop.org
          Reporter: edmondo.tommasina@gmail.com
        QA Contact: dri-devel@lists.freedesktop.org

Created attachment 145084
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D145084&action=3Dedit
Backtrace

vlc using vdpau received signal SIGSEGV after the removal of the blend state
NULL check.

Bisected to:

https://gitlab.freedesktop.org/mesa/mesa/commit/b758eed9c373db14a5acc04d952=
2ec9d74e51f1b

commit b758eed9c373db14a5acc04d9522ec9d74e51f1b (HEAD, refs/bisect/bad)
Author: Marek Ol=C5=A1=C3=A1k <marek.olsak@amd.com>
Date:   Tue Jul 30 17:43:41 2019 -0400

    radeonsi: make sure that blend state !=3D NULL and remove all NULL chec=
king

    Reviewed-by: Pierre-Eric Pelloux-Prayer
<pierre-eric.pelloux-prayer@amd.com>




The backtrace shows old_blend =3D 0x0 where the new code doesn't check old_=
blend
anymore:
+       if (old_blend->cb_target_mask !=3D blend->cb_target_mask ||


Full backtrace attached, here an extract:

0x00007fff60e6497b in si_bind_blend_state (ctx=3D0x7fff58468f20, state=3D<o=
ptimized
out>) at ../mesa-9999/src/gallium/drivers/radeonsi/si_state.c:686
686     ../mesa-9999/src/gallium/drivers/radeonsi/si_state.c: No such file =
or
directory.
(gdb) bt full
#0  0x00007fff60e6497b in si_bind_blend_state (ctx=3D0x7fff58468f20,
state=3D<optimized out>) at
../mesa-9999/src/gallium/drivers/radeonsi/si_state.c:686
        sctx =3D 0x7fff58468f20
        old_blend =3D 0x0
        blend =3D 0x7fff584f2220
#1  0x00007fff60cea216 in draw_layers (dirty=3D0x7fff584099b8, s=3D0x7fff58=
4fbf60,
c=3D0x7fff58409788) at
../mesa-9999/src/gallium/auxiliary/vl/vl_compositor_gfx.c:662
        layer =3D 0x7fff584fbf98
        samplers =3D 0x7fff584fbfe8
        num_sampler_views =3D 1
        blend =3D <optimized out>
        vb_index =3D 0
        i =3D 0
        vb_index =3D <optimized out>
        i =3D <optimized out>
        layer =3D <optimized out>
        samplers =3D <optimized out>
        num_sampler_views =3D <optimized out>
        blend =3D <optimized out>
        drawn =3D <optimized out>
#2  vl_compositor_gfx_render (s=3Ds@entry=3D0x7fff584fbf60,
c=3Dc@entry=3D0x7fff58409788, dst_surface=3Ddst_surface@entry=3D0x7fff58530=
980,
dirty_area=3D0x7fff584099b8, dirty_area@entry=3D0x1, clear_dirty=3D<optimiz=
ed out>)
    at ../mesa-9999/src/gallium/auxiliary/vl/vl_compositor_gfx.c:725
No locals.
#3  0x00007fff60ce462c in vl_compositor_render (clear_dirty=3Dtrue,
dirty_area=3D0x1, dst_surface=3D0x7fff58530980, c=3D0x7fff58409788, s=3D0x7=
fff584fbf60)
at ../mesa-9999/src/gallium/auxiliary/vl/vl_compositor.c:755
No locals.
#4  vl_compositor_render (s=3Ds@entry=3D0x7fff584fbf60, c=3Dc@entry=3D0x7ff=
f58409788,
dst_surface=3Ddst_surface@entry=3D0x7fff5866b060,
dirty_area=3Ddirty_area@entry=3D0x7fff584099b8, clear_dirty=3Dclear_dirty@e=
ntry=3Dtrue)
    at ../mesa-9999/src/gallium/auxiliary/vl/vl_compositor.c:744
No locals.
#5  0x00007fff60cda6ae in vlVdpPresentationQueueDisplay
(presentation_queue=3D<optimized out>, surface=3D4, clip_width=3D<optimized=
 out>,
clip_height=3D0, earliest_presentation_time=3D36232721127000)
    at ../mesa-9999/src/gallium/state_trackers/vdpau/presentation.c:262
        dump_window =3D -1
        pq =3D 0x7fff584fbf50
        surf =3D 0x7fff585043d0
        pipe =3D 0x7fff58468f20
        tex =3D 0x7fff58530980
        surf_templ =3D {reference =3D {count =3D 0}, format =3D
PIPE_FORMAT_B8G8R8X8_UNORM, writable =3D 0, texture =3D 0x0, context =3D 0x=
0, width =3D
0, height =3D 0, nr_samples =3D 0, u =3D {tex =3D {level =3D 0, first_layer=
 =3D 0,
last_layer =3D 0}, buf =3D {
              first_element =3D 0, last_element =3D 0}}}
        surf_draw =3D 0x7fff5866b060
        src_rect =3D {x0 =3D 0, x1 =3D 1658, y0 =3D 0, y1 =3D 933}
        dst_clip =3D {x0 =3D 0, x1 =3D 1658, y0 =3D 0, y1 =3D 933}
        dirty_area =3D 0x7fff584099b8
        compositor =3D 0x7fff58409788
        cstate =3D 0x7fff584fbf60
        vscreen =3D 0x7fff58409900

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15660755731.533dFCf.12075
Date: Sat, 17 Aug 2019 20:59:33 +0000
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
   title=3D"NEW - [REGRESSION] [BISECTED] Segmentation fault in si_bind_ble=
nd_state after removal of the blend state NULL check"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111414">111414</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>[REGRESSION] [BISECTED] Segmentation fault in si_bind_blend_s=
tate after removal of the blend state NULL check
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
          <td>x86-64 (AMD64)
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
          <td>edmondo.tommasina&#64;gmail.com
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>dri-devel&#64;lists.freedesktop.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D145084=
" name=3D"attach_145084" title=3D"Backtrace">attachment 145084</a> <a href=
=3D"attachment.cgi?id=3D145084&amp;action=3Dedit" title=3D"Backtrace">[deta=
ils]</a></span>
Backtrace

vlc using vdpau received signal SIGSEGV after the removal of the blend state
NULL check.

Bisected to:

<a href=3D"https://gitlab.freedesktop.org/mesa/mesa/commit/b758eed9c373db14=
a5acc04d9522ec9d74e51f1b">https://gitlab.freedesktop.org/mesa/mesa/commit/b=
758eed9c373db14a5acc04d9522ec9d74e51f1b</a>

commit b758eed9c373db14a5acc04d9522ec9d74e51f1b (HEAD, refs/bisect/bad)
Author: Marek Ol=C5=A1=C3=A1k &lt;<a href=3D"mailto:marek.olsak&#64;amd.com=
">marek.olsak&#64;amd.com</a>&gt;
Date:   Tue Jul 30 17:43:41 2019 -0400

    radeonsi: make sure that blend state !=3D NULL and remove all NULL chec=
king

    Reviewed-by: Pierre-Eric Pelloux-Prayer
&lt;<a href=3D"mailto:pierre-eric.pelloux-prayer&#64;amd.com">pierre-eric.p=
elloux-prayer&#64;amd.com</a>&gt;




The backtrace shows old_blend =3D 0x0 where the new code doesn't check old_=
blend
anymore:
+       if (old_blend-&gt;cb_target_mask !=3D blend-&gt;cb_target_mask ||


Full backtrace attached, here an extract:

0x00007fff60e6497b in si_bind_blend_state (ctx=3D0x7fff58468f20, state=3D&l=
t;optimized
out&gt;) at ../mesa-9999/src/gallium/drivers/radeonsi/si_state.c:686
686     ../mesa-9999/src/gallium/drivers/radeonsi/si_state.c: No such file =
or
directory.
(gdb) bt full
#0  0x00007fff60e6497b in si_bind_blend_state (ctx=3D0x7fff58468f20,
state=3D&lt;optimized out&gt;) at
../mesa-9999/src/gallium/drivers/radeonsi/si_state.c:686
        sctx =3D 0x7fff58468f20
        old_blend =3D 0x0
        blend =3D 0x7fff584f2220
#1  0x00007fff60cea216 in draw_layers (dirty=3D0x7fff584099b8, s=3D0x7fff58=
4fbf60,
c=3D0x7fff58409788) at
../mesa-9999/src/gallium/auxiliary/vl/vl_compositor_gfx.c:662
        layer =3D 0x7fff584fbf98
        samplers =3D 0x7fff584fbfe8
        num_sampler_views =3D 1
        blend =3D &lt;optimized out&gt;
        vb_index =3D 0
        i =3D 0
        vb_index =3D &lt;optimized out&gt;
        i =3D &lt;optimized out&gt;
        layer =3D &lt;optimized out&gt;
        samplers =3D &lt;optimized out&gt;
        num_sampler_views =3D &lt;optimized out&gt;
        blend =3D &lt;optimized out&gt;
        drawn =3D &lt;optimized out&gt;
#2  vl_compositor_gfx_render (s=3Ds&#64;entry=3D0x7fff584fbf60,
c=3Dc&#64;entry=3D0x7fff58409788, dst_surface=3Ddst_surface&#64;entry=3D0x7=
fff58530980,
dirty_area=3D0x7fff584099b8, dirty_area&#64;entry=3D0x1, clear_dirty=3D&lt;=
optimized out&gt;)
    at ../mesa-9999/src/gallium/auxiliary/vl/vl_compositor_gfx.c:725
No locals.
#3  0x00007fff60ce462c in vl_compositor_render (clear_dirty=3Dtrue,
dirty_area=3D0x1, dst_surface=3D0x7fff58530980, c=3D0x7fff58409788, s=3D0x7=
fff584fbf60)
at ../mesa-9999/src/gallium/auxiliary/vl/vl_compositor.c:755
No locals.
#4  vl_compositor_render (s=3Ds&#64;entry=3D0x7fff584fbf60, c=3Dc&#64;entry=
=3D0x7fff58409788,
dst_surface=3Ddst_surface&#64;entry=3D0x7fff5866b060,
dirty_area=3Ddirty_area&#64;entry=3D0x7fff584099b8, clear_dirty=3Dclear_dir=
ty&#64;entry=3Dtrue)
    at ../mesa-9999/src/gallium/auxiliary/vl/vl_compositor.c:744
No locals.
#5  0x00007fff60cda6ae in vlVdpPresentationQueueDisplay
(presentation_queue=3D&lt;optimized out&gt;, surface=3D4, clip_width=3D&lt;=
optimized out&gt;,
clip_height=3D0, earliest_presentation_time=3D36232721127000)
    at ../mesa-9999/src/gallium/state_trackers/vdpau/presentation.c:262
        dump_window =3D -1
        pq =3D 0x7fff584fbf50
        surf =3D 0x7fff585043d0
        pipe =3D 0x7fff58468f20
        tex =3D 0x7fff58530980
        surf_templ =3D {reference =3D {count =3D 0}, format =3D
PIPE_FORMAT_B8G8R8X8_UNORM, writable =3D 0, texture =3D 0x0, context =3D 0x=
0, width =3D
0, height =3D 0, nr_samples =3D 0, u =3D {tex =3D {level =3D 0, first_layer=
 =3D 0,
last_layer =3D 0}, buf =3D {
              first_element =3D 0, last_element =3D 0}}}
        surf_draw =3D 0x7fff5866b060
        src_rect =3D {x0 =3D 0, x1 =3D 1658, y0 =3D 0, y1 =3D 933}
        dst_clip =3D {x0 =3D 0, x1 =3D 1658, y0 =3D 0, y1 =3D 933}
        dirty_area =3D 0x7fff584099b8
        compositor =3D 0x7fff58409788
        cstate =3D 0x7fff584fbf60
        vscreen =3D 0x7fff58409900</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15660755731.533dFCf.12075--

--===============1547057420==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1547057420==--
