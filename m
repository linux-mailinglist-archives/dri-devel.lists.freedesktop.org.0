Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BD634658D
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2019 19:20:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24A8C89B57;
	Fri, 14 Jun 2019 17:20:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 4EDDC89B57
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2019 17:20:13 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 463BD72167; Fri, 14 Jun 2019 17:20:13 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110897] HyperZ is broken for r300 (bad z for some micro and
 macrotiles?)
Date: Fri, 14 Jun 2019 17:20:13 +0000
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
Message-ID: <bug-110897-502-XmDhf5iVUF@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1087879157=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1087879157==
Content-Type: multipart/alternative; boundary="15605328130.2cBebC.6773"
Content-Transfer-Encoding: 7bit


--15605328130.2cBebC.6773
Date: Fri, 14 Jun 2019 17:20:13 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110897

--- Comment #33 from Richard Thier <u9vata@gmail.com> ---
Created attachment 144548
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D144548&action=3Dedit
Working hack / quickfix

Pretty interesting but I just tried to change the "most logical" part of
r300_texture_desc.c and now it works - see quickfix patch.

I will tell you all what was my approach. I just started to ignore all my
previous attempts and go for a more "m=C3=A1gus" approach. That is is like =
"bogus"
approach, but "m=C3=A1gus" approach involves faith and magix haha.

The goal was to find a way to make the still non-erronous area of the image
grow. Just by trying around the code and possibly breaking law of the rules
(Judas Priest song should play in the background while readers read this for
best effect).

So this file seemed to be the good candidate for "breaking the law" and just
"m=C3=A1gus-approach" trying: r300_texture_desc.c

Then there was this part:

376             /* Get the ZMASK buffer size in dwords. */
377             zcomp_numdw =3D r300_pixels_to_dwords(stride, height,
378                     zmask_blocks_x_per_dw[pipes-1] * zcompsize,
379                     zmask_blocks_y_per_dw[pipes-1] * zcompsize);
380=20
381             /* Check whether we have enough ZMASK memory. */
382             if (util_format_get_blocksizebits(tex->b.b.format) =3D=3D 3=
2 &&
383                 zcomp_numdw <=3D screen->caps.zmask_ram * pipes) {
384                 tex->tex.zmask_dwords[i] =3D zcomp_numdw;
385                 tex->tex.zcomp8x8[i] =3D zcompsize =3D=3D 8;
386=20
387                 tex->tex.zmask_stride_in_pixels[i] =3D
388                    util_align_npot(stride, zmask_blocks_x_per_dw[pipes-=
1] *
zcompsize);

The "zcomp_numdw" seems to be "the number of dwords" in the zmask_ram - and=
 the
zmask ram is the compressed z-buffer itself. This "tex->tex.zmask_dwords[i]"
has multiple element because of the mip level. Of course I think only the f=
irst
element ever exists for zbuffer as I haven't seen mipmapped z ever just tel=
ling
you why there is indexing.

In short I saw earlier that this "zmask_dwords" get used later on even when
emitting but also at other places like in r300_blit.c for example. It is us=
ed
pretty much so this seemed to be the thing to change in my planned "m=C3=A1=
gus" way
;-)

I went and first doubled the value like this (please mind the "*2"):

376             /* Get the ZMASK buffer size in dwords. */
377             zcomp_numdw =3D r300_pixels_to_dwords(stride, height,
378                  zmask_blocks_x_per_dw[pipes-1] * zcompsize*2,
379                  zmask_blocks_y_per_dw[pipes-1] * zcompsize*2);

After that change the "still uneffected" area of the screen shrink roughly =
to
its 1/4th so I figured instead of multiplying the values I should divide th=
em
by two (just guessing):

376             /* Get the ZMASK buffer size in dwords. */
377             zcomp_numdw =3D r300_pixels_to_dwords(stride, height,
378                  zmask_blocks_x_per_dw[pipes-1] * zcompsize/2,
379                  zmask_blocks_y_per_dw[pipes-1] * zcompsize/2);

And indeed now the whole screen is good and performance is fast too.
It is a hack however - just pure magic so far, but it seems that somehow th=
is
value might be the one that can fix the problem.

My idea is that maybe that value of "pipes" is wrong???

This is where that variable is set:

357         if (screen->caps.family =3D=3D CHIP_RV530) {
358             pipes =3D screen->info.r300_num_z_pipes;
359         } else {
360             pipes =3D screen->info.r300_num_gb_pipes;
361         }

Also because my card is not CHIP_RV530 the value is the
screen->info.r300_num_gb_pipes

This is set in: radeon_drm_winsys.c / do_winsys_init(...)

385     if (ws->gen =3D=3D DRV_R300) {
386         if (!radeon_get_drm_value(ws->fd, RADEON_INFO_NUM_GB_PIPES,
387                                   "GB pipe count",
388                                   &ws->info.r300_num_gb_pipes))
389             return false;

I have no idea where this value comes from. Would need to see the other sid=
e in
the kernel modules I guess or some other places. If this is wrong it might
maybe cause other problems for me that I am not aware of while things still
generally work most of the time?

Also just a note for myself - the RC410 is R300 class / kind card not an R4=
00
it seems - but I saw places where is_rv350 returns true, so those things se=
em
to be on in the driver for me at least:

205     case CHIP_R300:
206     case CHIP_R350:
207     case CHIP_RV350:
208     case CHIP_RV370:
209     case CHIP_RV380:
210     case CHIP_RS400:
211     case CHIP_RC410:
212     case CHIP_RS480:
213         ws->info.chip_class =3D R300;

So gb_pipes is 3 for my case, but maybe it should be a different value and =
this
is set badly for some reason. Of course this would explain the problem bett=
er.

One more thing: I build mesa to my own prefix and after this hacky quickfix
patch things immediately started working - even if I run glxgears with HYPE=
RZ
from an other terminal that still runs with unchanged mesa!!! This is weird=
 a
bit, but it might give me some insights why yesterday the whole thing was
working without me touching the relevant parts of the source: it seems if a=
ny
apps start up with proper hyperZ then it becomes pretty easy for the card to
"get stuck" in the good state for whatever reasons unknown to me.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15605328130.2cBebC.6773
Date: Fri, 14 Jun 2019 17:20:13 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110897#c33">Comme=
nt # 33</a>
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
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D144548=
" name=3D"attach_144548" title=3D"Working hack / quickfix">attachment 14454=
8</a> <a href=3D"attachment.cgi?id=3D144548&amp;action=3Dedit" title=3D"Wor=
king hack / quickfix">[details]</a></span> <a href=3D'page.cgi?id=3Dsplinte=
r.html&amp;bug=3D110897&amp;attachment=3D144548'>[review]</a>
Working hack / quickfix

Pretty interesting but I just tried to change the &quot;most logical&quot; =
part of
r300_texture_desc.c and now it works - see quickfix patch.

I will tell you all what was my approach. I just started to ignore all my
previous attempts and go for a more &quot;m=C3=A1gus&quot; approach. That i=
s is like &quot;bogus&quot;
approach, but &quot;m=C3=A1gus&quot; approach involves faith and magix haha.

The goal was to find a way to make the still non-erronous area of the image
grow. Just by trying around the code and possibly breaking law of the rules
(Judas Priest song should play in the background while readers read this for
best effect).

So this file seemed to be the good candidate for &quot;breaking the law&quo=
t; and just
&quot;m=C3=A1gus-approach&quot; trying: r300_texture_desc.c

Then there was this part:

376             /* Get the ZMASK buffer size in dwords. */
377             zcomp_numdw =3D r300_pixels_to_dwords(stride, height,
378                     zmask_blocks_x_per_dw[pipes-1] * zcompsize,
379                     zmask_blocks_y_per_dw[pipes-1] * zcompsize);
380=20
381             /* Check whether we have enough ZMASK memory. */
382             if (util_format_get_blocksizebits(tex-&gt;b.b.format) =3D=
=3D 32 &amp;&amp;
383                 zcomp_numdw &lt;=3D screen-&gt;caps.zmask_ram * pipes) {
384                 tex-&gt;tex.zmask_dwords[i] =3D zcomp_numdw;
385                 tex-&gt;tex.zcomp8x8[i] =3D zcompsize =3D=3D 8;
386=20
387                 tex-&gt;tex.zmask_stride_in_pixels[i] =3D
388                    util_align_npot(stride, zmask_blocks_x_per_dw[pipes-=
1] *
zcompsize);

The &quot;zcomp_numdw&quot; seems to be &quot;the number of dwords&quot; in=
 the zmask_ram - and the
zmask ram is the compressed z-buffer itself. This &quot;tex-&gt;tex.zmask_d=
words[i]&quot;
has multiple element because of the mip level. Of course I think only the f=
irst
element ever exists for zbuffer as I haven't seen mipmapped z ever just tel=
ling
you why there is indexing.

In short I saw earlier that this &quot;zmask_dwords&quot; get used later on=
 even when
emitting but also at other places like in r300_blit.c for example. It is us=
ed
pretty much so this seemed to be the thing to change in my planned &quot;m=
=C3=A1gus&quot; way
;-)

I went and first doubled the value like this (please mind the &quot;*2&quot=
;):

376             /* Get the ZMASK buffer size in dwords. */
377             zcomp_numdw =3D r300_pixels_to_dwords(stride, height,
378                  zmask_blocks_x_per_dw[pipes-1] * zcompsize*2,
379                  zmask_blocks_y_per_dw[pipes-1] * zcompsize*2);

After that change the &quot;still uneffected&quot; area of the screen shrin=
k roughly to
its 1/4th so I figured instead of multiplying the values I should divide th=
em
by two (just guessing):

376             /* Get the ZMASK buffer size in dwords. */
377             zcomp_numdw =3D r300_pixels_to_dwords(stride, height,
378                  zmask_blocks_x_per_dw[pipes-1] * zcompsize/2,
379                  zmask_blocks_y_per_dw[pipes-1] * zcompsize/2);

And indeed now the whole screen is good and performance is fast too.
It is a hack however - just pure magic so far, but it seems that somehow th=
is
value might be the one that can fix the problem.

My idea is that maybe that value of &quot;pipes&quot; is wrong???

This is where that variable is set:

357         if (screen-&gt;caps.family =3D=3D CHIP_RV530) {
358             pipes =3D screen-&gt;info.r300_num_z_pipes;
359         } else {
360             pipes =3D screen-&gt;info.r300_num_gb_pipes;
361         }

Also because my card is not CHIP_RV530 the value is the
screen-&gt;info.r300_num_gb_pipes

This is set in: radeon_drm_winsys.c / do_winsys_init(...)

385     if (ws-&gt;gen =3D=3D DRV_R300) {
386         if (!radeon_get_drm_value(ws-&gt;fd, RADEON_INFO_NUM_GB_PIPES,
387                                   &quot;GB pipe count&quot;,
388                                   &amp;ws-&gt;info.r300_num_gb_pipes))
389             return false;

I have no idea where this value comes from. Would need to see the other sid=
e in
the kernel modules I guess or some other places. If this is wrong it might
maybe cause other problems for me that I am not aware of while things still
generally work most of the time?

Also just a note for myself - the RC410 is R300 class / kind card not an R4=
00
it seems - but I saw places where is_rv350 returns true, so those things se=
em
to be on in the driver for me at least:

205     case CHIP_R300:
206     case CHIP_R350:
207     case CHIP_RV350:
208     case CHIP_RV370:
209     case CHIP_RV380:
210     case CHIP_RS400:
211     case CHIP_RC410:
212     case CHIP_RS480:
213         ws-&gt;info.chip_class =3D R300;

So gb_pipes is 3 for my case, but maybe it should be a different value and =
this
is set badly for some reason. Of course this would explain the problem bett=
er.

One more thing: I build mesa to my own prefix and after this hacky quickfix
patch things immediately started working - even if I run glxgears with HYPE=
RZ
from an other terminal that still runs with unchanged mesa!!! This is weird=
 a
bit, but it might give me some insights why yesterday the whole thing was
working without me touching the relevant parts of the source: it seems if a=
ny
apps start up with proper hyperZ then it becomes pretty easy for the card to
&quot;get stuck&quot; in the good state for whatever reasons unknown to me.=
</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15605328130.2cBebC.6773--

--===============1087879157==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1087879157==--
