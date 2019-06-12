Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 326C1419EF
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jun 2019 03:22:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42E45891E1;
	Wed, 12 Jun 2019 01:22:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id B789E891E1
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2019 01:22:39 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id B43D472167; Wed, 12 Jun 2019 01:22:39 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110897] HyperZ is broken for r300 (bad z for some micro and
 macrotiles?)
Date: Wed, 12 Jun 2019 01:22:39 +0000
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
Message-ID: <bug-110897-502-wGrybNBhtl@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0805987366=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0805987366==
Content-Type: multipart/alternative; boundary="15603025591.CADc.9906"
Content-Transfer-Encoding: 7bit


--15603025591.CADc.9906
Date: Wed, 12 Jun 2019 01:22:39 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110897

--- Comment #9 from Richard Thier <u9vata@gmail.com> ---
So these does not seem to happen at any time:

        /* Emit clear packets. */
        r300_emit_gpu_flush(r300, r300->gpu_flush.size, r300->gpu_flush.sta=
te);
        r300->gpu_flush.dirty =3D FALSE;

        if (r300->zmask_clear.dirty) {
            fprintf(stderr, "KUL-AKVA\n");
            r300_emit_zmask_clear(r300, r300->zmask_clear.size,
                                  r300->zmask_clear.state);
            r300->zmask_clear.dirty =3D FALSE;
        }=20=20=20
        if (r300->hiz_clear.dirty) {
            fprintf(stderr, "KUL-AKVA2\n");
            r300_emit_hiz_clear(r300, r300->hiz_clear.size,
                                r300->hiz_clear.state);
            r300->hiz_clear.dirty =3D FALSE;
        }=20=20=20
        if (r300->cmask_clear.dirty) {
            r300_emit_cmask_clear(r300, r300->cmask_clear.size,
                                  r300->cmask_clear.state);
            r300->cmask_clear.dirty =3D FALSE;
        }

At least not with glxgears. But I kind of get the impression that the inten=
tion
of the code is to end up here as earlier we set things as dirty:

            /* Setup Hyper-Z clears. */
            if (r300->hyperz_enabled) {
                if (zmask_clear) {
                    hyperz_dcv =3D hyperz->zb_depthclearvalue =3D
                        r300_depth_clear_value(fb->zsbuf->format, depth,
stencil);
                    r300_mark_atom_dirty(r300, &r300->zmask_clear);
                    r300_mark_atom_dirty(r300, &r300->gpu_flush);
                    buffers &=3D ~PIPE_CLEAR_DEPTHSTENCIL;
/* FIXME: REMOVE KUL* LOGS: */
                    fprintf(stderr, "KUL-A\n");
                }

                if (hiz_clear) {
                    r300->hiz_clear_value =3D r300_hiz_clear_value(depth);
                    r300_mark_atom_dirty(r300, &r300->hiz_clear);
                    r300_mark_atom_dirty(r300, &r300->gpu_flush);
                }
                r300->num_z_clears++;
            }

Looking at mark_atom_dirty it seems to set the flag. I do not know who dele=
tes
it but it got deleted. Also I have printed what is the value of "buffers" w=
here
we enter the "KUL-C" code path (according to my log scheme) and the value is
buffers=3D4 which is the first (0th) color buffer. It is not some new kind,=
 but
above this check I see only one place where this could get zeroed and maybe
that is not happening for this card but for others it does.

What bugs me is that the dirtyness of zmask_clear and hiz_clear also go away
somewhere, but I am too tired to see where. Just wanted to write down all t=
he
stuff so far and at least provide the logs and insights.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15603025591.CADc.9906
Date: Wed, 12 Jun 2019 01:22:39 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110897#c9">Commen=
t # 9</a>
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
        <pre>So these does not seem to happen at any time:

        /* Emit clear packets. */
        r300_emit_gpu_flush(r300, r300-&gt;gpu_flush.size, r300-&gt;gpu_flu=
sh.state);
        r300-&gt;gpu_flush.dirty =3D FALSE;

        if (r300-&gt;zmask_clear.dirty) {
            fprintf(stderr, &quot;KUL-AKVA\n&quot;);
            r300_emit_zmask_clear(r300, r300-&gt;zmask_clear.size,
                                  r300-&gt;zmask_clear.state);
            r300-&gt;zmask_clear.dirty =3D FALSE;
        }=20=20=20
        if (r300-&gt;hiz_clear.dirty) {
            fprintf(stderr, &quot;KUL-AKVA2\n&quot;);
            r300_emit_hiz_clear(r300, r300-&gt;hiz_clear.size,
                                r300-&gt;hiz_clear.state);
            r300-&gt;hiz_clear.dirty =3D FALSE;
        }=20=20=20
        if (r300-&gt;cmask_clear.dirty) {
            r300_emit_cmask_clear(r300, r300-&gt;cmask_clear.size,
                                  r300-&gt;cmask_clear.state);
            r300-&gt;cmask_clear.dirty =3D FALSE;
        }

At least not with glxgears. But I kind of get the impression that the inten=
tion
of the code is to end up here as earlier we set things as dirty:

            /* Setup Hyper-Z clears. */
            if (r300-&gt;hyperz_enabled) {
                if (zmask_clear) {
                    hyperz_dcv =3D hyperz-&gt;zb_depthclearvalue =3D
                        r300_depth_clear_value(fb-&gt;zsbuf-&gt;format, dep=
th,
stencil);
                    r300_mark_atom_dirty(r300, &amp;r300-&gt;zmask_clear);
                    r300_mark_atom_dirty(r300, &amp;r300-&gt;gpu_flush);
                    buffers &amp;=3D ~PIPE_CLEAR_DEPTHSTENCIL;
/* FIXME: REMOVE KUL* LOGS: */
                    fprintf(stderr, &quot;KUL-A\n&quot;);
                }

                if (hiz_clear) {
                    r300-&gt;hiz_clear_value =3D r300_hiz_clear_value(depth=
);
                    r300_mark_atom_dirty(r300, &amp;r300-&gt;hiz_clear);
                    r300_mark_atom_dirty(r300, &amp;r300-&gt;gpu_flush);
                }
                r300-&gt;num_z_clears++;
            }

Looking at mark_atom_dirty it seems to set the flag. I do not know who dele=
tes
it but it got deleted. Also I have printed what is the value of &quot;buffe=
rs&quot; where
we enter the &quot;KUL-C&quot; code path (according to my log scheme) and t=
he value is
buffers=3D4 which is the first (0th) color buffer. It is not some new kind,=
 but
above this check I see only one place where this could get zeroed and maybe
that is not happening for this card but for others it does.

What bugs me is that the dirtyness of zmask_clear and hiz_clear also go away
somewhere, but I am too tired to see where. Just wanted to write down all t=
he
stuff so far and at least provide the logs and insights.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15603025591.CADc.9906--

--===============0805987366==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0805987366==--
