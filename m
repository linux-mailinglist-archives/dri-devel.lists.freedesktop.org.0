Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C5133D559
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jun 2019 20:18:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9295891DD;
	Tue, 11 Jun 2019 18:18:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 2F309891DD
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jun 2019 18:18:53 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 2903D72167; Tue, 11 Jun 2019 18:18:53 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110897] HyperZ is broken for r300 (bad z for some micro and
 macrotiles?)
Date: Tue, 11 Jun 2019 18:18:53 +0000
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
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-110897-502-GRTIxZV3jc@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0463112292=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0463112292==
Content-Type: multipart/alternative; boundary="15602771330.CacA53.13042"
Content-Transfer-Encoding: 7bit


--15602771330.CacA53.13042
Date: Tue, 11 Jun 2019 18:18:53 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110897

--- Comment #2 from Richard Thier <u9vata@gmail.com> ---
Created attachment 144512
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D144512&action=3Dedit
Error gone patch - but it is slow

If I understand it well, HyperZ can be owned by only one process / owner and
the ownership is transferred in the r300_blit.c file when clearing the buff=
ers.

I guess this is why closing an app having HyperZ can transfer it to an other
one without restart. I have figured that this is also the place where buffer
clearing takes place so I played around a bit here.

Other releant files I have found are these:

[code]
src/gallium/drivers/r300/r300_context.c
src/gallium/drivers/r300/r300_emit.c
 Update is in here - this sends stuff to card according to how docs say it:=
=20
src/gallium/drivers/r300/r300_hyperz.c
 This is where hyperZ gets first activated:
src/gallium/drivers/r300/r300_blit.c
src/gallium/drivers/r300/r300_context.h
 Register naming (closely resembles r300 and 500 docs):
src/gallium/drivers/r300/r300_reg.h
[/code]

See the attachment about what I am trying. With this attachment I do not see
the issue anymore. I made this change by just looking at what the code does=
 and
how it sets the zmask_clear and hiz_clear variables. As you can see first I=
 was
just trying to set them myself, but later just commented out the part you s=
ee.

Interestingly there is a performance drop now - I mean a drop from an uncha=
nged
mesa without HYPERZ enabled to the changed one WITH hiz being enabled with =
the
environment variable. Does the fast clear or some things work even if the f=
lag
is not added?

I am not sure what I do if I comment out the part that I did, but will look
into the HyperZ update function to know what is being sent to the card
registers. I see the registers and can see them in the docs, but I am somet=
imes
puzzled. Does the API between the kernel and user level send the enable Hyp=
erZ
bit in a different var and other parts of the same register in a different =
var
for example? I can also find it on my own I guess, but I need to compare ke=
rnel
and mesa side of the things and maybe someone just knows.

This is how long I went so far - but I am still very much started only a bi=
t.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15602771330.CacA53.13042
Date: Tue, 11 Jun 2019 18:18:53 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110897#c2">Commen=
t # 2</a>
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
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D144512=
" name=3D"attach_144512" title=3D"Error gone patch - but it is slow">attach=
ment 144512</a> <a href=3D"attachment.cgi?id=3D144512&amp;action=3Dedit" ti=
tle=3D"Error gone patch - but it is slow">[details]</a></span> <a href=3D'p=
age.cgi?id=3Dsplinter.html&amp;bug=3D110897&amp;attachment=3D144512'>[revie=
w]</a>
Error gone patch - but it is slow

If I understand it well, HyperZ can be owned by only one process / owner and
the ownership is transferred in the r300_blit.c file when clearing the buff=
ers.

I guess this is why closing an app having HyperZ can transfer it to an other
one without restart. I have figured that this is also the place where buffer
clearing takes place so I played around a bit here.

Other releant files I have found are these:

[code]
src/gallium/drivers/r300/r300_context.c
src/gallium/drivers/r300/r300_emit.c
 Update is in here - this sends stuff to card according to how docs say it:=
=20
src/gallium/drivers/r300/r300_hyperz.c
 This is where hyperZ gets first activated:
src/gallium/drivers/r300/r300_blit.c
src/gallium/drivers/r300/r300_context.h
 Register naming (closely resembles r300 and 500 docs):
src/gallium/drivers/r300/r300_reg.h
[/code]

See the attachment about what I am trying. With this attachment I do not see
the issue anymore. I made this change by just looking at what the code does=
 and
how it sets the zmask_clear and hiz_clear variables. As you can see first I=
 was
just trying to set them myself, but later just commented out the part you s=
ee.

Interestingly there is a performance drop now - I mean a drop from an uncha=
nged
mesa without HYPERZ enabled to the changed one WITH hiz being enabled with =
the
environment variable. Does the fast clear or some things work even if the f=
lag
is not added?

I am not sure what I do if I comment out the part that I did, but will look
into the HyperZ update function to know what is being sent to the card
registers. I see the registers and can see them in the docs, but I am somet=
imes
puzzled. Does the API between the kernel and user level send the enable Hyp=
erZ
bit in a different var and other parts of the same register in a different =
var
for example? I can also find it on my own I guess, but I need to compare ke=
rnel
and mesa side of the things and maybe someone just knows.

This is how long I went so far - but I am still very much started only a bi=
t.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15602771330.CacA53.13042--

--===============0463112292==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0463112292==--
