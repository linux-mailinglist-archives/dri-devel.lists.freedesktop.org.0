Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73E32ACCBD
	for <lists+dri-devel@lfdr.de>; Sun,  8 Sep 2019 14:37:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34F8F898C4;
	Sun,  8 Sep 2019 12:37:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 23F41898C4
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Sep 2019 12:37:39 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id D08C672167; Sun,  8 Sep 2019 12:37:38 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111588] Framebuffer corruption when a fb which is not being
 scanned out gets removed
Date: Sun, 08 Sep 2019 12:37:39 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: DRI git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: not set
X-Bugzilla-Who: jwrdegoede@fedoraproject.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: not set
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-111588-502-P17e7JOWRm@http.bugs.freedesktop.org/>
In-Reply-To: <bug-111588-502@http.bugs.freedesktop.org/>
References: <bug-111588-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============2087299110=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============2087299110==
Content-Type: multipart/alternative; boundary="15679462580.F8DFE.7972"
Content-Transfer-Encoding: 7bit


--15679462580.F8DFE.7972
Date: Sun, 8 Sep 2019 12:37:38 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111588

--- Comment #1 from Hans de Goede <jwrdegoede@fedoraproject.org> ---
I just realized I left out one bit of info which might be useful, to debug =
this
I added the following change to the kernel:

diff --git a/drivers/gpu/drm/drm_framebuffer.c
b/drivers/gpu/drm/drm_framebuffer.c
index 57564318ceea..4712bfb9ae05 100644
--- a/drivers/gpu/drm/drm_framebuffer.c
+++ b/drivers/gpu/drm/drm_framebuffer.c
@@ -464,6 +464,7 @@ int drm_mode_rmfb(struct drm_device *dev, u32 fb_id,
        if (drm_framebuffer_read_refcount(fb) > 1) {
                struct drm_mode_rmfb_work arg;

+               pr_err("drm_modr_rmfb calling drm_framebuffer_remove\n");
                INIT_WORK_ONSTACK(&arg.work, drm_mode_rmfb_work_fn);
                INIT_LIST_HEAD(&arg.fbs);
                list_add_tail(&fb->filp_head, &arg.fbs);
@@ -471,8 +472,10 @@ int drm_mode_rmfb(struct drm_device *dev, u32 fb_id,
                schedule_work(&arg.work);
                flush_work(&arg.work);
                destroy_work_on_stack(&arg.work);
-       } else
+       } else {
+               pr_err("drm_modr_rmfb calling drm_framebuffer_put\n");
                drm_framebuffer_put(fb);
+       }

        return 0;

@@ -669,11 +672,13 @@ void drm_fb_release(struct drm_file *priv)
         */
        list_for_each_entry_safe(fb, tfb, &priv->fbs, filp_head) {
                if (drm_framebuffer_read_refcount(fb) > 1) {
+                       pr_err("drm_fb_release calling
drm_framebuffer_remove\n");
                        list_move_tail(&fb->filp_head, &arg.fbs);
                } else {
                        list_del_init(&fb->filp_head);

                        /* This drops the fpriv->fbs reference. */
+                       pr_err("drm_fb_release calling drm_framebuffer_put\=
n");
                        drm_framebuffer_put(fb);
                }
        }
@@ -863,6 +868,8 @@ static int atomic_remove_fb(struct drm_framebuffer *fb)
                if (plane->state->fb !=3D fb)
                        continue;

+               pr_err("atomic_remove_fb found plane still using fb\n");
+
                plane_state =3D drm_atomic_get_plane_state(state, plane);
                if (IS_ERR(plane_state)) {
                        ret =3D PTR_ERR(plane_state);


In the working case, so where we let the kernel do the fb cleanup itself, I
see:

Plymouth removes fb it creates to test for 32bpp support:
kernel: drm_modr_rmfb calling drm_framebuffer_put

gdm starts, does page-flipping, resulting in a number of:

kernel: drm_modr_rmfb calling drm_framebuffer_put
kernel: drm_modr_rmfb calling drm_framebuffer_put
...

lines

And then plymouth exits without any cleanup, so we get:
kernel: drm_fb_release calling drm_framebuffer_put

Followed by more:

kernel: drm_modr_rmfb calling drm_framebuffer_put
kernel: drm_modr_rmfb calling drm_framebuffer_put
...

From gdm.

In the broken case, where ply_renderer_buffer_free() gets called on
plymouth-quit, I only see:

kernel: drm_modr_rmfb calling drm_framebuffer_put
kernel: drm_modr_rmfb calling drm_framebuffer_put
...

lines, wihch is expected as the fb is rmfb-ed before the fd is closed.

Note that we never hit:

@@ -863,6 +868,8 @@ static int atomic_remove_fb(struct drm_framebuffer *fb)
                if (plane->state->fb !=3D fb)
                        continue;

+               pr_err("atomic_remove_fb found plane still using fb\n");
+
                plane_state =3D drm_atomic_get_plane_state(state, plane);
                if (IS_ERR(plane_state)) {
                        ret =3D PTR_ERR(plane_state);


So AFAICT userspace is doing everything correctly even in the broken case.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15679462580.F8DFE.7972
Date: Sun, 8 Sep 2019 12:37:38 +0000
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
   title=3D"NEW - Framebuffer corruption when a fb which is not being scann=
ed out gets removed"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111588#c1">Commen=
t # 1</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Framebuffer corruption when a fb which is not being scann=
ed out gets removed"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111588">bug 11158=
8</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
jwrdegoede&#64;fedoraproject.org" title=3D"Hans de Goede &lt;jwrdegoede&#64=
;fedoraproject.org&gt;"> <span class=3D"fn">Hans de Goede</span></a>
</span></b>
        <pre>I just realized I left out one bit of info which might be usef=
ul, to debug this
I added the following change to the kernel:

diff --git a/drivers/gpu/drm/drm_framebuffer.c
b/drivers/gpu/drm/drm_framebuffer.c
index 57564318ceea..4712bfb9ae05 100644
--- a/drivers/gpu/drm/drm_framebuffer.c
+++ b/drivers/gpu/drm/drm_framebuffer.c
&#64;&#64; -464,6 +464,7 &#64;&#64; int drm_mode_rmfb(struct drm_device *de=
v, u32 fb_id,
        if (drm_framebuffer_read_refcount(fb) &gt; 1) {
                struct drm_mode_rmfb_work arg;

+               pr_err(&quot;drm_modr_rmfb calling drm_framebuffer_remove\n=
&quot;);
                INIT_WORK_ONSTACK(&amp;arg.work, drm_mode_rmfb_work_fn);
                INIT_LIST_HEAD(&amp;arg.fbs);
                list_add_tail(&amp;fb-&gt;filp_head, &amp;arg.fbs);
&#64;&#64; -471,8 +472,10 &#64;&#64; int drm_mode_rmfb(struct drm_device *d=
ev, u32 fb_id,
                schedule_work(&amp;arg.work);
                flush_work(&amp;arg.work);
                destroy_work_on_stack(&amp;arg.work);
-       } else
+       } else {
+               pr_err(&quot;drm_modr_rmfb calling drm_framebuffer_put\n&qu=
ot;);
                drm_framebuffer_put(fb);
+       }

        return 0;

&#64;&#64; -669,11 +672,13 &#64;&#64; void drm_fb_release(struct drm_file *=
priv)
         */
        list_for_each_entry_safe(fb, tfb, &amp;priv-&gt;fbs, filp_head) {
                if (drm_framebuffer_read_refcount(fb) &gt; 1) {
+                       pr_err(&quot;drm_fb_release calling
drm_framebuffer_remove\n&quot;);
                        list_move_tail(&amp;fb-&gt;filp_head, &amp;arg.fbs);
                } else {
                        list_del_init(&amp;fb-&gt;filp_head);

                        /* This drops the fpriv-&gt;fbs reference. */
+                       pr_err(&quot;drm_fb_release calling drm_framebuffer=
_put\n&quot;);
                        drm_framebuffer_put(fb);
                }
        }
&#64;&#64; -863,6 +868,8 &#64;&#64; static int atomic_remove_fb(struct drm_=
framebuffer *fb)
                if (plane-&gt;state-&gt;fb !=3D fb)
                        continue;

+               pr_err(&quot;atomic_remove_fb found plane still using fb\n&=
quot;);
+
                plane_state =3D drm_atomic_get_plane_state(state, plane);
                if (IS_ERR(plane_state)) {
                        ret =3D PTR_ERR(plane_state);


In the working case, so where we let the kernel do the fb cleanup itself, I
see:

Plymouth removes fb it creates to test for 32bpp support:
kernel: drm_modr_rmfb calling drm_framebuffer_put

gdm starts, does page-flipping, resulting in a number of:

kernel: drm_modr_rmfb calling drm_framebuffer_put
kernel: drm_modr_rmfb calling drm_framebuffer_put
...

lines

And then plymouth exits without any cleanup, so we get:
kernel: drm_fb_release calling drm_framebuffer_put

Followed by more:

kernel: drm_modr_rmfb calling drm_framebuffer_put
kernel: drm_modr_rmfb calling drm_framebuffer_put
...

From gdm.

In the broken case, where ply_renderer_buffer_free() gets called on
plymouth-quit, I only see:

kernel: drm_modr_rmfb calling drm_framebuffer_put
kernel: drm_modr_rmfb calling drm_framebuffer_put
...

lines, wihch is expected as the fb is rmfb-ed before the fd is closed.

Note that we never hit:

&#64;&#64; -863,6 +868,8 &#64;&#64; static int atomic_remove_fb(struct drm_=
framebuffer *fb)
                if (plane-&gt;state-&gt;fb !=3D fb)
                        continue;

+               pr_err(&quot;atomic_remove_fb found plane still using fb\n&=
quot;);
+
                plane_state =3D drm_atomic_get_plane_state(state, plane);
                if (IS_ERR(plane_state)) {
                        ret =3D PTR_ERR(plane_state);


So AFAICT userspace is doing everything correctly even in the broken case.<=
/pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15679462580.F8DFE.7972--

--===============2087299110==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============2087299110==--
