Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2086745D2A
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2019 14:52:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EAC8892B1;
	Fri, 14 Jun 2019 12:52:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id C18EE892B1
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2019 12:52:12 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id B52FA72167; Fri, 14 Jun 2019 12:52:12 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110897] HyperZ is broken for r300 (bad z for some micro and
 macrotiles?)
Date: Fri, 14 Jun 2019 12:52:13 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Mesa
X-Bugzilla-Component: Drivers/Gallium/r300
X-Bugzilla-Version: git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: u9vata@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-110897-502-ORkJRqQmcB@http.bugs.freedesktop.org/>
In-Reply-To: <bug-110897-502@http.bugs.freedesktop.org/>
References: <bug-110897-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0827437660=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0827437660==
Content-Type: multipart/alternative; boundary="15605167320.12b5ea1.1616"
Content-Transfer-Encoding: 7bit


--15605167320.12b5ea1.1616
Date: Fri, 14 Jun 2019 12:52:12 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110897

--- Comment #28 from Richard Thier <u9vata@gmail.com> ---
I still see the glitches with the following changes:

@@ -364,11 +369,21 @@ static void r300_clear(struct pipe_context* pipe,
     /* Clear. */
     if (buffers) {
         /* Clear using the blitter. */
+
+        /* FIXME: Twoline HACKZ TO SAVE FLAGS THAT blitter_clear clears */
+        bool tmp_zmask_clear_dirty =3D r300->zmask_clear.dirty;
+       bool tmp_hiz_clear_dirty =3D r300->hiz_clear.dirty;
+
         r300_blitter_begin(r300, R300_CLEAR);
         util_blitter_clear(r300->blitter, width, height, 1,
                            buffers, color, depth, stencil);
+       /* FIXME: two lines of hack! */
+       r300->zmask_clear.dirty =3D tmp_zmask_clear_dirty;
+       r300->hiz_clear.dirty =3D tmp_hiz_clear_dirty;
+
         r300_blitter_end(r300);
-    } else if (r300->zmask_clear.dirty ||
+/* TIPP: here maybe not else if, just an if should be present??? */
+    } /*else*/ if (r300->zmask_clear.dirty ||
                    r300->hiz_clear.dirty ||
                    r300->cmask_clear.dirty) {


Even though we are now entering the things after this if and go where the z=
ram
clear emit is. Maybe this is not the problem...

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15605167320.12b5ea1.1616
Date: Fri, 14 Jun 2019 12:52:12 +0000
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
   title=3D"NEW - HyperZ is broken for r300 (bad z for some micro and macro=
tiles?)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110897#c28">Comme=
nt # 28</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - HyperZ is broken for r300 (bad z for some micro and macro=
tiles?)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110897">bug 11089=
7</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
u9vata&#64;gmail.com" title=3D"Richard Thier &lt;u9vata&#64;gmail.com&gt;">=
 <span class=3D"fn">Richard Thier</span></a>
</span></b>
        <pre>I still see the glitches with the following changes:

&#64;&#64; -364,11 +369,21 &#64;&#64; static void r300_clear(struct pipe_co=
ntext* pipe,
     /* Clear. */
     if (buffers) {
         /* Clear using the blitter. */
+
+        /* FIXME: Twoline HACKZ TO SAVE FLAGS THAT blitter_clear clears */
+        bool tmp_zmask_clear_dirty =3D r300-&gt;zmask_clear.dirty;
+       bool tmp_hiz_clear_dirty =3D r300-&gt;hiz_clear.dirty;
+
         r300_blitter_begin(r300, R300_CLEAR);
         util_blitter_clear(r300-&gt;blitter, width, height, 1,
                            buffers, color, depth, stencil);
+       /* FIXME: two lines of hack! */
+       r300-&gt;zmask_clear.dirty =3D tmp_zmask_clear_dirty;
+       r300-&gt;hiz_clear.dirty =3D tmp_hiz_clear_dirty;
+
         r300_blitter_end(r300);
-    } else if (r300-&gt;zmask_clear.dirty ||
+/* TIPP: here maybe not else if, just an if should be present??? */
+    } /*else*/ if (r300-&gt;zmask_clear.dirty ||
                    r300-&gt;hiz_clear.dirty ||
                    r300-&gt;cmask_clear.dirty) {


Even though we are now entering the things after this if and go where the z=
ram
clear emit is. Maybe this is not the problem...</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15605167320.12b5ea1.1616--

--===============0827437660==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0827437660==--
