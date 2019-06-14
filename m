Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ADD0145C21
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2019 14:06:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 020E989533;
	Fri, 14 Jun 2019 12:06:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 03E768955D
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2019 12:06:34 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 0032E72167; Fri, 14 Jun 2019 12:06:33 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110897] HyperZ is broken for r300 (bad z for some micro and
 macrotiles?)
Date: Fri, 14 Jun 2019 12:06:34 +0000
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
X-Bugzilla-Priority: low
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-110897-502-0M3DuZPX6N@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0997101796=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0997101796==
Content-Type: multipart/alternative; boundary="15605139932.cc7CF22C.22733"
Content-Transfer-Encoding: 7bit


--15605139932.cc7CF22C.22733
Date: Fri, 14 Jun 2019 12:06:33 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110897

--- Comment #26 from Richard Thier <u9vata@gmail.com> ---
Okay it is still bad now despite I have compiled with "-O0" flags actually.=
..
To be honest I have no idea actually why it started working last time.
Also now that I step with the debugger I see that a lot of code paths
that I imagine should be taken are never ever taken.=20

Also when going randomly in the code with gdb I have found the following
things. I just want to document my findings so far with gdb breakpoints in =
the
driver. These are maybe not general for everyone, but this is what happens =
on
my very machine and card when debugging r300 code with gdb...

WHAT HAPPENS IN r300_blit.c
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D

You can roughly follow this stuff here:

https://github.com/anholt/mesa/blob/master/src/gallium/drivers/r300/r300_bl=
it.c

0.) Setting of zmask_clear=3D1 and hiz_clear=3D0 always happen
----------------------------------------------------------

  262     /* Use fast Z clear.
  263      * The zbuffer must be in micro-tiled mode, otherwise it locks up=
. */
  264     if (buffers & PIPE_CLEAR_DEPTHSTENCIL) {
  265         boolean zmask_clear, hiz_clear;
  266=20
  267         /* If both depth and stencil are present, they must be cleared
together. */
  268         if (fb->zsbuf->texture->format =3D=3D PIPE_FORMAT_S8_UINT_Z24=
_UNORM
&&
  269             (buffers & PIPE_CLEAR_DEPTHSTENCIL) !=3D
PIPE_CLEAR_DEPTHSTENCIL) {
  270             zmask_clear =3D FALSE;
  271             hiz_clear =3D FALSE;
  272         } else { /* ALWAYS HAPPENS: */
  273             zmask_clear =3D r300_fast_zclear_allowed(r300, buffers);
  274             hiz_clear =3D r300_hiz_clear_allowed(r300);
  275             /* FIXME: only for testing! */
  276             /*zmask_clear =3D FALSE;*/
  277             /*zmask_clear =3D TRUE; // - this alone looks bad, bothfa=
lse
look good, zmaks_clear only false hiz_clear untouched is good */
  278             /*hiz_clear =3D FALSE;*/
  279             /*hiz_clear =3D TRUE; // enabling this and falsing zmask_=
clear
shows picture but FPS is lower in glxgears...*/

We always go where I marked it with "/* ALWAYS HAPPENS */".

  r300_fast_zclear_allowed(r300, buffers) return 1
  r300_hiz_clear_allowed(r300) returns 0

So:
zmask_clear =3D=3D 1
hiz_clear =3D=3D 0

ALWAYS. As I understand the hiz_clear is the thing that clears the
"hierarchical Z" buffer and I suspect this should be returning true instead.
The other for zmask clearn is the one that clears the compessed z-buffer. I=
 had
a bit of a hard time to figure out what these mean, but using the r5xx docs
(despite this card is r300) helped a lot. So zmask is a lossless compressed
z-buffer ram and hiz ram seem to be on the higher hiearchy level.

I have checked what is the body of the latter:

  return
300_resource(fb->zsbuf->texture)->tex.hiz_dwords[fb->zsbuf->u.tex.level] !=
=3D 0;

^^and this body never returns true for some reason. I think this should be
nonzero when HyperZ is properly going on isn't it? I am just running glxgea=
rs
and nothing fancy.

1.) "Enabling" HyperZ seem to happen properly
---------------------------------------------

  282         /* If we need Hyper-Z. */
  283         if (zmask_clear || hiz_clear) {
  284             /* Try to obtain the access to Hyper-Z buffers if we don't
have one. */
  285             if (!r300->hyperz_enabled &&
  286                 (r300->screen->caps.is_r500 ||
debug_get_option_hyperz())) {
  287                 r300->hyperz_enabled =3D
  288                     r300->rws->cs_request_feature(r300->cs,
  289=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
RADEON_FID_R300_HYPERZ_ACCESS,
  290                                                 TRUE);
  291                 if (r300->hyperz_enabled) {
  292                    /* Need to emit HyperZ buffer regs for the first t=
ime.
*/
  293                    r300_mark_fb_state_dirty(r300,
R300_CHANGED_HYPERZ_FLAG);
  294                 }
  295             }

On the first run we get into the cs_request_feature stuff and then the
r300_mark_fb_state_dirty function properly. hiz_clear is never true here, b=
ut
the zmask_clear boolean is - see above. The debug_get_option_hyperz() is the
cause why this happens as that is the one that checks the environment varia=
ble.

  297             /* Setup Hyper-Z clears. */
  298             if (r300->hyperz_enabled) {
  299                 if (zmask_clear) {
  300                     hyperz_dcv =3D hyperz->zb_depthclearvalue =3D
  301                         r300_depth_clear_value(fb->zsbuf->format, dep=
th,
stencil);
  302=20
  303                     r300_mark_atom_dirty(r300, &r300->zmask_clear);
  304                     r300_mark_atom_dirty(r300, &r300->gpu_flush);
  305                     buffers &=3D ~PIPE_CLEAR_DEPTHSTENCIL;
  306                 }
  307=20
  308                 if (hiz_clear) {
  309                     r300->hiz_clear_value =3D r300_hiz_clear_value(de=
pth);
  310                     r300_mark_atom_dirty(r300, &r300->hiz_clear);
  311                     r300_mark_atom_dirty(r300, &r300->gpu_flush);
  312                 }
  313                 r300->num_z_clears++;
  314             }

The zmask_clear part here also runs in every frame. I do not really know wh=
at
it means if the r300->zmask_clear atom is dirty. I might need to check if t=
his
actually really means that the clear commands will be sent out to the comma=
nd
stream of somewhere or not. The depth clear value was FF..FF00 so a lot of =
Fs
and two zeroes in the end. Sorry it is not in front of me while writing thi=
s so
I do not remember the number of Fs just that the upper bits are all ones and
the lowest byte was not.

2.) The CMASK path in the r300_clear(..) never seem to happen
-------------------------------------------------------------

  /* src/gallium/drivers/r300/r300_blit.c */
  318     /* Use fast color clear for an AA colorbuffer.
  319      * The CMASK is shared between all colorbuffers, so we use it
  320      * if there is only one colorbuffer bound. */
  321     if ((buffers & PIPE_CLEAR_COLOR) && fb->nr_cbufs =3D=3D 1 &&
fb->cbufs[0]&&
  322         r300_resource(fb->cbufs[0]->texture)->tex.cmask_dwords) { ...

Is always  false even if I run glxgears with "-samples 4" and adding
RADEUN_DEBUG=3Dmsaa showing that inded msaa is woking. Actually I can even =
see
it.

I do not know if CMASK should be used even without MSAA turned on, but it s=
eems
on my machine it is never used. I suspect if zmask is for compressed z-buff=
er
then cmask is for compressed color buffer?

This is also hinted here at this change:

https://gitlab.freedesktop.org/mesa/mesa/commit/ca2c28859eca83f8fbf1f43616f=
5ef861e95e8d6

Anyways, this is the part that is false always in the if:

      r300_resource(fb->cbufs[0]->texture)->tex.cmask_dwords

Actually this might be an issue on its own as in my understanding this code
path would cause a faster code paths when doing MSAA on this card, but I ra=
rely
ever use it anyways nowadays...

If this would happen, it could have lead to the code deflagging the color
channel clear as finished later in the body of the above if:

  347             if (r300->screen->cmask_resource =3D=3D fb->cbufs[0]->tex=
ture) {
  348                 r300_set_clear_color(r300, color);
  349                 r300_mark_atom_dirty(r300, &r300->cmask_clear);
  350                 r300_mark_atom_dirty(r300, &r300->gpu_flush);
  351                 buffers &=3D ~PIPE_CLEAR_COLOR;
  352             }

3.) CBZB clear code path is always taken
----------------------------------------

  355     /* Enable CBZB clear. */
  356     else if (r300_cbzb_clear_allowed(r300, buffers)) {
  357         struct r300_surface *surf =3D r300_surface(fb->cbufs[0]);
  358=20
  359         hyperz->zb_depthclearvalue =3D
  360                 r300_depth_clear_cb_value(surf->base.format, color->f=
);
  361=20
  362         width =3D surf->cbzb_width;
  363         height =3D surf->cbzb_height;
  364=20
  365         r300->cbzb_clear =3D TRUE;
  366         r300_mark_fb_state_dirty(r300, R300_CHANGED_HYPERZ_FLAG);
  367     }

As far as I understand this should just configure the Zbuffer unit to also
clear the color buffer and both of them clearing it half and half. I will of
course try forcing this to be off, just to see what happens, but it should =
not
have a side effect for my issue. I am just documenting what happens.

4.) Clearing using the blitter always happen
--------------------------------------------

  369     /* Clear. */
  370     if (buffers) {
  371         /* Clear using the blitter. */
  372         /* FIXME: HACKZ TO SAVE FLAGS THAT blitter_clear clears */
  373         // bool zdirty =3D //TODO save vars???
  374         r300_blitter_begin(r300, R300_CLEAR);
  375         util_blitter_clear(r300->blitter, width, height, 1,
  376                            buffers, color, depth, stencil);
  377         r300_blitter_end(r300);

Sorry for writing into the code randomly here but I am in the middle of try=
ing.
The point is that this is always happening and I think this means that the
blitter unit is always clearing the Z-buffer too and the color buffer is al=
so
cleared with the blitter.

Also the util_blitter_clear call also goes through all the atoms that are m=
ade
to be dirty and this makes them not dirty by sending stuff to the kernel pa=
rt
of the driver.

The r300_emit_zmask_clear is never called it seems
--------------------------------------------------

After this point we just finish the clear function. Originally there was an
"elseif" construct here so surely it could not go forwards after the blitter
was doing its work (only if CMASK kind of color clearing was in operation!)=
 but
even if I comment out the "else" word I am not getting into anything past t=
his:

  378 /* TIPP: here maybe not else if, just an if should be present??? */
  379     } /*else*/ if (r300->zmask_clear.dirty ||
  380                r300->hiz_clear.dirty ||
  381                r300->cmask_clear.dirty) {
  382         /* Just clear zmask and hiz now, this does not use the standa=
rd
draw
  383          * procedure. */
  384         /* Calculate zmask_clear and hiz_clear atom sizes. */

^^because the flags are not dirty anymore as the blitter had a side effect =
of
clearing any dirty atom.

Now I am trying to force this part to happen, by saving the values of the
dirtyness of the zmask and hiz atoms and setting the saved value back after=
 the
blitter clear. I wonder what will happen.

If the CMASK kind of color clearing would work, I guess we would end up here
and then call these:

  r300_emit_zmask_clear
  r300_emit_hiz_clear

I am wondering
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

- Why the CMASK-related code path not even seem to work even if I use MSAA?
- Why r300_hiz_clear_allowed(r300) always return false for my case?

Further directions
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

1.) I have found this to be interesting:

src/gallium/drivers/r300/r300_texture_desc.c / r300_setup_hyperz_properties=
(..)

2.) I will try "forcing" the above idea by saving and reloading the flags
before and after the blitter kind of clear.

3.) Might be a good idea to put a breakpoint in the r300_texture_desc.c her=
e:

402             /* Check whether we have enough HIZ memory. */
403             if (hiz_numdw <=3D screen->caps.hiz_ram * pipes) {
404                 tex->tex.hiz_dwords[i] =3D hiz_numdw;
405                 tex->tex.hiz_stride_in_pixels[i] =3D stride;
406             } else {
407                 tex->tex.hiz_dwords[i] =3D 0;
408                 tex->tex.hiz_stride_in_pixels[i] =3D 0;
409             }

It seems as if the hiz memory is "not enough"? Weird. I see many of the val=
ues
are depending on how many pipes the card have and such. I have no idea how =
to
get proper info about how many pixel and z pipes a specific card have, but
these latter codes I did not look through properly.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15605139932.cc7CF22C.22733
Date: Fri, 14 Jun 2019 12:06:33 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110897#c26">Comme=
nt # 26</a>
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
        <pre>Okay it is still bad now despite I have compiled with &quot;-O=
0&quot; flags actually...
To be honest I have no idea actually why it started working last time.
Also now that I step with the debugger I see that a lot of code paths
that I imagine should be taken are never ever taken.=20

Also when going randomly in the code with gdb I have found the following
things. I just want to document my findings so far with gdb breakpoints in =
the
driver. These are maybe not general for everyone, but this is what happens =
on
my very machine and card when debugging r300 code with gdb...

WHAT HAPPENS IN r300_blit.c
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D

You can roughly follow this stuff here:

<a href=3D"https://github.com/anholt/mesa/blob/master/src/gallium/drivers/r=
300/r300_blit.c">https://github.com/anholt/mesa/blob/master/src/gallium/dri=
vers/r300/r300_blit.c</a>

0.) Setting of zmask_clear=3D1 and hiz_clear=3D0 always happen
----------------------------------------------------------

  262     /* Use fast Z clear.
  263      * The zbuffer must be in micro-tiled mode, otherwise it locks up=
. */
  264     if (buffers &amp; PIPE_CLEAR_DEPTHSTENCIL) {
  265         boolean zmask_clear, hiz_clear;
  266=20
  267         /* If both depth and stencil are present, they must be cleared
together. */
  268         if (fb-&gt;zsbuf-&gt;texture-&gt;format =3D=3D PIPE_FORMAT_S8=
_UINT_Z24_UNORM
&amp;&amp;
  269             (buffers &amp; PIPE_CLEAR_DEPTHSTENCIL) !=3D
PIPE_CLEAR_DEPTHSTENCIL) {
  270             zmask_clear =3D FALSE;
  271             hiz_clear =3D FALSE;
  272         } else { /* ALWAYS HAPPENS: */
  273             zmask_clear =3D r300_fast_zclear_allowed(r300, buffers);
  274             hiz_clear =3D r300_hiz_clear_allowed(r300);
  275             /* FIXME: only for testing! */
  276             /*zmask_clear =3D FALSE;*/
  277             /*zmask_clear =3D TRUE; // - this alone looks bad, bothfa=
lse
look good, zmaks_clear only false hiz_clear untouched is good */
  278             /*hiz_clear =3D FALSE;*/
  279             /*hiz_clear =3D TRUE; // enabling this and falsing zmask_=
clear
shows picture but FPS is lower in glxgears...*/

We always go where I marked it with &quot;/* ALWAYS HAPPENS */&quot;.

  r300_fast_zclear_allowed(r300, buffers) return 1
  r300_hiz_clear_allowed(r300) returns 0

So:
zmask_clear =3D=3D 1
hiz_clear =3D=3D 0

ALWAYS. As I understand the hiz_clear is the thing that clears the
&quot;hierarchical Z&quot; buffer and I suspect this should be returning tr=
ue instead.
The other for zmask clearn is the one that clears the compessed z-buffer. I=
 had
a bit of a hard time to figure out what these mean, but using the r5xx docs
(despite this card is r300) helped a lot. So zmask is a lossless compressed
z-buffer ram and hiz ram seem to be on the higher hiearchy level.

I have checked what is the body of the latter:

  return
300_resource(fb-&gt;zsbuf-&gt;texture)-&gt;tex.hiz_dwords[fb-&gt;zsbuf-&gt;=
u.tex.level] !=3D 0;

^^and this body never returns true for some reason. I think this should be
nonzero when HyperZ is properly going on isn't it? I am just running glxgea=
rs
and nothing fancy.

1.) &quot;Enabling&quot; HyperZ seem to happen properly
---------------------------------------------

  282         /* If we need Hyper-Z. */
  283         if (zmask_clear || hiz_clear) {
  284             /* Try to obtain the access to Hyper-Z buffers if we don't
have one. */
  285             if (!r300-&gt;hyperz_enabled &amp;&amp;
  286                 (r300-&gt;screen-&gt;caps.is_r500 ||
debug_get_option_hyperz())) {
  287                 r300-&gt;hyperz_enabled =3D
  288                     r300-&gt;rws-&gt;cs_request_feature(r300-&gt;cs,
  289=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
RADEON_FID_R300_HYPERZ_ACCESS,
  290                                                 TRUE);
  291                 if (r300-&gt;hyperz_enabled) {
  292                    /* Need to emit HyperZ buffer regs for the first t=
ime.
*/
  293                    r300_mark_fb_state_dirty(r300,
R300_CHANGED_HYPERZ_FLAG);
  294                 }
  295             }

On the first run we get into the cs_request_feature stuff and then the
r300_mark_fb_state_dirty function properly. hiz_clear is never true here, b=
ut
the zmask_clear boolean is - see above. The debug_get_option_hyperz() is the
cause why this happens as that is the one that checks the environment varia=
ble.

  297             /* Setup Hyper-Z clears. */
  298             if (r300-&gt;hyperz_enabled) {
  299                 if (zmask_clear) {
  300                     hyperz_dcv =3D hyperz-&gt;zb_depthclearvalue =3D
  301                         r300_depth_clear_value(fb-&gt;zsbuf-&gt;forma=
t, depth,
stencil);
  302=20
  303                     r300_mark_atom_dirty(r300, &amp;r300-&gt;zmask_cl=
ear);
  304                     r300_mark_atom_dirty(r300, &amp;r300-&gt;gpu_flus=
h);
  305                     buffers &amp;=3D ~PIPE_CLEAR_DEPTHSTENCIL;
  306                 }
  307=20
  308                 if (hiz_clear) {
  309                     r300-&gt;hiz_clear_value =3D r300_hiz_clear_value=
(depth);
  310                     r300_mark_atom_dirty(r300, &amp;r300-&gt;hiz_clea=
r);
  311                     r300_mark_atom_dirty(r300, &amp;r300-&gt;gpu_flus=
h);
  312                 }
  313                 r300-&gt;num_z_clears++;
  314             }

The zmask_clear part here also runs in every frame. I do not really know wh=
at
it means if the r300-&gt;zmask_clear atom is dirty. I might need to check i=
f this
actually really means that the clear commands will be sent out to the comma=
nd
stream of somewhere or not. The depth clear value was FF..FF00 so a lot of =
Fs
and two zeroes in the end. Sorry it is not in front of me while writing thi=
s so
I do not remember the number of Fs just that the upper bits are all ones and
the lowest byte was not.

2.) The CMASK path in the r300_clear(..) never seem to happen
-------------------------------------------------------------

  /* src/gallium/drivers/r300/r300_blit.c */
  318     /* Use fast color clear for an AA colorbuffer.
  319      * The CMASK is shared between all colorbuffers, so we use it
  320      * if there is only one colorbuffer bound. */
  321     if ((buffers &amp; PIPE_CLEAR_COLOR) &amp;&amp; fb-&gt;nr_cbufs =
=3D=3D 1 &amp;&amp;
fb-&gt;cbufs[0]&amp;&amp;
  322         r300_resource(fb-&gt;cbufs[0]-&gt;texture)-&gt;tex.cmask_dwor=
ds) { ...

Is always  false even if I run glxgears with &quot;-samples 4&quot; and add=
ing
RADEUN_DEBUG=3Dmsaa showing that inded msaa is woking. Actually I can even =
see
it.

I do not know if CMASK should be used even without MSAA turned on, but it s=
eems
on my machine it is never used. I suspect if zmask is for compressed z-buff=
er
then cmask is for compressed color buffer?

This is also hinted here at this change:

<a href=3D"https://gitlab.freedesktop.org/mesa/mesa/commit/ca2c28859eca83f8=
fbf1f43616f5ef861e95e8d6">https://gitlab.freedesktop.org/mesa/mesa/commit/c=
a2c28859eca83f8fbf1f43616f5ef861e95e8d6</a>

Anyways, this is the part that is false always in the if:

      r300_resource(fb-&gt;cbufs[0]-&gt;texture)-&gt;tex.cmask_dwords

Actually this might be an issue on its own as in my understanding this code
path would cause a faster code paths when doing MSAA on this card, but I ra=
rely
ever use it anyways nowadays...

If this would happen, it could have lead to the code deflagging the color
channel clear as finished later in the body of the above if:

  347             if (r300-&gt;screen-&gt;cmask_resource =3D=3D fb-&gt;cbuf=
s[0]-&gt;texture) {
  348                 r300_set_clear_color(r300, color);
  349                 r300_mark_atom_dirty(r300, &amp;r300-&gt;cmask_clear);
  350                 r300_mark_atom_dirty(r300, &amp;r300-&gt;gpu_flush);
  351                 buffers &amp;=3D ~PIPE_CLEAR_COLOR;
  352             }

3.) CBZB clear code path is always taken
----------------------------------------

  355     /* Enable CBZB clear. */
  356     else if (r300_cbzb_clear_allowed(r300, buffers)) {
  357         struct r300_surface *surf =3D r300_surface(fb-&gt;cbufs[0]);
  358=20
  359         hyperz-&gt;zb_depthclearvalue =3D
  360                 r300_depth_clear_cb_value(surf-&gt;base.format, color=
-&gt;f);
  361=20
  362         width =3D surf-&gt;cbzb_width;
  363         height =3D surf-&gt;cbzb_height;
  364=20
  365         r300-&gt;cbzb_clear =3D TRUE;
  366         r300_mark_fb_state_dirty(r300, R300_CHANGED_HYPERZ_FLAG);
  367     }

As far as I understand this should just configure the Zbuffer unit to also
clear the color buffer and both of them clearing it half and half. I will of
course try forcing this to be off, just to see what happens, but it should =
not
have a side effect for my issue. I am just documenting what happens.

4.) Clearing using the blitter always happen
--------------------------------------------

  369     /* Clear. */
  370     if (buffers) {
  371         /* Clear using the blitter. */
  372         /* FIXME: HACKZ TO SAVE FLAGS THAT blitter_clear clears */
  373         // bool zdirty =3D //TODO save vars???
  374         r300_blitter_begin(r300, R300_CLEAR);
  375         util_blitter_clear(r300-&gt;blitter, width, height, 1,
  376                            buffers, color, depth, stencil);
  377         r300_blitter_end(r300);

Sorry for writing into the code randomly here but I am in the middle of try=
ing.
The point is that this is always happening and I think this means that the
blitter unit is always clearing the Z-buffer too and the color buffer is al=
so
cleared with the blitter.

Also the util_blitter_clear call also goes through all the atoms that are m=
ade
to be dirty and this makes them not dirty by sending stuff to the kernel pa=
rt
of the driver.

The r300_emit_zmask_clear is never called it seems
--------------------------------------------------

After this point we just finish the clear function. Originally there was an
&quot;elseif&quot; construct here so surely it could not go forwards after =
the blitter
was doing its work (only if CMASK kind of color clearing was in operation!)=
 but
even if I comment out the &quot;else&quot; word I am not getting into anyth=
ing past this:

  378 /* TIPP: here maybe not else if, just an if should be present??? */
  379     } /*else*/ if (r300-&gt;zmask_clear.dirty ||
  380                r300-&gt;hiz_clear.dirty ||
  381                r300-&gt;cmask_clear.dirty) {
  382         /* Just clear zmask and hiz now, this does not use the standa=
rd
draw
  383          * procedure. */
  384         /* Calculate zmask_clear and hiz_clear atom sizes. */

^^because the flags are not dirty anymore as the blitter had a side effect =
of
clearing any dirty atom.

Now I am trying to force this part to happen, by saving the values of the
dirtyness of the zmask and hiz atoms and setting the saved value back after=
 the
blitter clear. I wonder what will happen.

If the CMASK kind of color clearing would work, I guess we would end up here
and then call these:

  r300_emit_zmask_clear
  r300_emit_hiz_clear

I am wondering
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

- Why the CMASK-related code path not even seem to work even if I use MSAA?
- Why r300_hiz_clear_allowed(r300) always return false for my case?

Further directions
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

1.) I have found this to be interesting:

src/gallium/drivers/r300/r300_texture_desc.c / r300_setup_hyperz_properties=
(..)

2.) I will try &quot;forcing&quot; the above idea by saving and reloading t=
he flags
before and after the blitter kind of clear.

3.) Might be a good idea to put a breakpoint in the r300_texture_desc.c her=
e:

402             /* Check whether we have enough HIZ memory. */
403             if (hiz_numdw &lt;=3D screen-&gt;caps.hiz_ram * pipes) {
404                 tex-&gt;tex.hiz_dwords[i] =3D hiz_numdw;
405                 tex-&gt;tex.hiz_stride_in_pixels[i] =3D stride;
406             } else {
407                 tex-&gt;tex.hiz_dwords[i] =3D 0;
408                 tex-&gt;tex.hiz_stride_in_pixels[i] =3D 0;
409             }

It seems as if the hiz memory is &quot;not enough&quot;? Weird. I see many =
of the values
are depending on how many pipes the card have and such. I have no idea how =
to
get proper info about how many pixel and z pipes a specific card have, but
these latter codes I did not look through properly.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15605139932.cc7CF22C.22733--

--===============0997101796==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0997101796==--
