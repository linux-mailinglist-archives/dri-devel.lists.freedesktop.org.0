Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E1962B49B1C
	for <lists+dri-devel@lfdr.de>; Mon,  8 Sep 2025 22:32:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4100C10E5D1;
	Mon,  8 Sep 2025 20:32:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="UaYg/ztb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com
 [209.85.160.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B63BF10E5CE;
 Mon,  8 Sep 2025 20:32:13 +0000 (UTC)
Received: by mail-qt1-f174.google.com with SMTP id
 d75a77b69052e-4b61161c32eso15549881cf.3; 
 Mon, 08 Sep 2025 13:32:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1757363533; x=1757968333; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=TEXn0VonFGZjiOSBUC+NQ1DPAGBZB46LrclAaBj+qTI=;
 b=UaYg/ztbDQarPr7bIiVkURvVNyspm60mHRrDL6qNagk3BJAITpnwI+dWsbnjpvmfNZ
 gR6abba7m5x3P4+jaJIdlFnqtK45+Bx2cj9XVjpogPtLdT1wwlmhzSvhlYPAPi//Sjrk
 KSRiQLAe1AvDfBr3euoMmgPULy0hEduL5jFfWqKxPjYpG8FoJYHioRFtk41KN9EUDv82
 UPUQmjsX0f+mzHJTlA2Fp5+4EUn6AHy7D4gZs1dUJTL6xJsbGcdyfLacUMYmJRDyEFME
 mgWsuVytCWj60nr25Q7Zo1YfRLbMazv1I6lkfo1cndVIVudaDfE1yC94rN3QVB5T5vT6
 NFVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757363533; x=1757968333;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=TEXn0VonFGZjiOSBUC+NQ1DPAGBZB46LrclAaBj+qTI=;
 b=Ay0HtTv0WDY1TihMxZQgWwjHxeqEGydfO62h93WolG+NmS8yr8WV7bGvAhnzEFYVvg
 uQs9B8SMxtdJP4JbRxKNHol9pB0XcUXINNHYi0CBogndZStE9+YBSlbeeM7cLR+NhvMH
 8VY/fK5Ug15cf2GWNLjhl52iWNRjkvFxS6hZYmx+c8VKDew2rf1n4jcNvAVdEKVjspG3
 /D0pNpCqtrH4iFtZsrqDQMyNOiOPAb6438voCaG1Xd0SOBLnCjs4dAMOoMO9TEKDKSLz
 1Rb1zjCZY/ziT/C0gw25Igfa/H/HSoyyaCSZyMKtPs1FdIqlxSwCZnRsWgatRSqdP1wc
 QEQg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVFqHN/7Ofpdu/AImn+ezM5vLseqDGj0KQVZw7Zt0CkDd949CV16I2EQsonptZGWSHfrCbjk5MKg+CSgL6Lyg==@lists.freedesktop.org,
 AJvYcCVw//yWvrKNWswqhu17knvIYVNMFRk3DTDUmkTUh0jRonNTAYLA1314ZidxqrrHkteBWj8MAeVb@lists.freedesktop.org,
 AJvYcCWTqOCzQFmIqQDS1atvN2jPro9eqGxDLRVe4HWZIJxWiHCUOJK6ojB/ejfY65G4BTRm2Gcu7zCTF0An@lists.freedesktop.org,
 AJvYcCXDZwQr5dQ5rn5lvCsQAG1vHYUw4apAbfs9FDfuFLtIYGPHDb9kLIAAHAYq/USUZHeztbBAoyuNHmy2@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzIFSOq+tV+7U8YL3dGXYYbWFVufW5zz86IedfopaNnb0gV6f9N
 +hePMI4qD+lDwmjGZhBiAxZeL3So2xOhOrhWhnmuQ/omqpjVHZZ79JwPMeCecW1I3dgV4TfAxxb
 wignAm5nt0sx5DV4WlMLQOXF6oY8ad/MgGmZ2
X-Gm-Gg: ASbGnctnnGtLADLudRUR/f5lAoYEJpJJ34D0oFf4zC3GYBiGpP306XwJZDL6j0obwKP
 q55n/7zmjnMEkNSLtUVekyZ4sQOxRWyyz/5NDWTeQO1Ya8xdmJ8KXx+rjJ+r/2VE7wIUd8SrKJ/
 06BrIuBT97r4RC+JIb/mApcFEWKLcOUtxVABCYy3M/hNRPoW/RdK3Pjv7OoLuJdH8bABTamrROR
 6le
X-Google-Smtp-Source: AGHT+IGSJp2aXhTyk6sqQ/R1QHPbQ2mSNSQXfFUGY0QCJAQA3tiPeM4vv3TdnTCZ0xv7U3r0VWMOh7PZlVp37vbdAj4=
X-Received: by 2002:a05:690e:251a:10b0:601:62f5:5755 with SMTP id
 956f58d0204a3-61022a5bb93mr6550017d50.7.1757363108960; Mon, 08 Sep 2025
 13:25:08 -0700 (PDT)
MIME-Version: 1.0
References: <20250803035816.603405-1-jim.cromie@gmail.com>
 <20250803035816.603405-30-jim.cromie@gmail.com>
 <ea069c8f-b724-409c-9dc6-345b3f9d6d85@bootlin.com>
In-Reply-To: <ea069c8f-b724-409c-9dc6-345b3f9d6d85@bootlin.com>
From: jim.cromie@gmail.com
Date: Mon, 8 Sep 2025 14:24:42 -0600
X-Gm-Features: Ac12FXwyXU2IBiFoYQeMREDq9_yqq9WDvsDYmK5y_tiNBMm3U6hYdXRJfXTlhPs
Message-ID: <CAJfuBxwR8xhz3EWvcdk1_JcQRkq7uq4AKqrqxZLMyuPZU8Wh6g@mail.gmail.com>
Subject: Re: [PATCH v4 29/58] docs/dyndbg: add classmap info to howto
To: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: linux-kernel@vger.kernel.org, jbaron@akamai.com, 
 gregkh@linuxfoundation.org, ukaszb@chromium.org, 
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org, 
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 daniel.vetter@ffwll.ch, tvrtko.ursulin@linux.intel.com, jani.nikula@intel.com, 
 ville.syrjala@linux.intel.com, seanpaul@chromium.org, robdclark@gmail.com, 
 groeck@google.com, yanivt@google.com, bleung@google.com, 
 quic_saipraka@quicinc.com, will@kernel.org, catalin.marinas@arm.com, 
 quic_psodagud@quicinc.com, maz@kernel.org, arnd@arndb.de, 
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
 mingo@redhat.com, linux-doc@vger.kernel.org
Content-Type: multipart/alternative; boundary="000000000000d9df49063e4ffb70"
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--000000000000d9df49063e4ffb70
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

hi Louis, thx for the nudge.

On Mon, Sep 8, 2025 at 8:38=E2=80=AFAM Louis Chauvet <louis.chauvet@bootlin=
.com>
wrote:

> \
>
> Le 03/08/2025 =C3=A0 05:57, Jim Cromie a =C3=A9crit :
> > Describe the 3 API macros providing dynamic_debug's classmaps
> >
> > DYNDBG_CLASSMAP_DEFINE - create & export a classmap
> > DYNDBG_CLASSMAP_USE    - refer to exported map
> > DYNDBG_CLASSMAP_PARAM  - bind control param to the classmap
> > DYNDBG_CLASSMAP_PARAM_REF + use module's storage - __drm_debug
> >


I should note:

classmaps-v1 made some bad-taste naming choices,
1st was the shortening: DYNDBG_
These are invoked once per module, so we can afford full names.

So series drops DYNDBG_ prefix, replaces it with DYNAMIC_DEBUG_,
and this commit-msg is now corrected


> > TBD: some of this might be over-specification, or just over-talked.
> >
> > NB: The _DEFINE & _USE model makes the user dependent on the definer,
> > just like EXPORT_SYMBOL(__drm_debug) already does.
> >
> > cc: linux-doc@vger.kernel.org
> > Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
>
> Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
>
> > ---
> > v3- rework protection around PARAM
> >
> > v0.5 adjustments per Randy Dunlap
> > v0.7 checkpatch fixes
> > v0.8 more
> > v0.9 rewords
> >
> > fixup-howto
> > ---
> >   .../admin-guide/dynamic-debug-howto.rst       | 137 ++++++++++++++++-=
-
> >   1 file changed, 126 insertions(+), 11 deletions(-)
> >
> > diff --git a/Documentation/admin-guide/dynamic-debug-howto.rst
> b/Documentation/admin-guide/dynamic-debug-howto.rst
> > index 1ceadf4f28f9f..556e00299ed35 100644
> > --- a/Documentation/admin-guide/dynamic-debug-howto.rst
> > +++ b/Documentation/admin-guide/dynamic-debug-howto.rst
> > @@ -146,7 +146,9 @@ keywords are:::
> >     "1-30" is valid range but "1 - 30" is not.
> >
> >
> > -The meanings of each keyword are:
> > +Keywords:::
> > +
> > +The meanings of each keyword are::
> >
> >   func
> >       The given string is compared against the function name
> > @@ -194,16 +196,6 @@ format
> >       format "nfsd: SETATTR"  // a neater way to match a format with
> whitespace
> >       format 'nfsd: SETATTR'  // yet another way to match a format with
> whitespace
> >
> > -class
> > -    The given class_name is validated against each module, which may
> > -    have declared a list of known class_names.  If the class_name is
> > -    found for a module, callsite & class matching and adjustment
> > -    proceeds.  Examples::
> > -
> > -     class DRM_UT_KMS        # a DRM.debug category
> > -     class JUNK              # silent non-match
> > -     // class TLD_*          # NOTICE: no wildcard in class names
> > -
> >   line
> >       The given line number or range of line numbers is compared
> >       against the line number of each ``pr_debug()`` callsite.  A singl=
e
> > @@ -218,6 +210,24 @@ line
> >       line -1605          // the 1605 lines from line 1 to line 1605
> >       line 1600-          // all lines from line 1600 to the end of the
> file
> >
> > +class
> > +
> > +    The given class_name is validated against each module, which may
> > +    have declared a list of class_names it accepts.  If the class_name
> > +    accepted by a module, callsite & class matching and adjustment
> > +    proceeds.  Examples::
> > +
> > +     class DRM_UT_KMS        # a DRM.debug category
> > +     class JUNK              # silent non-match
> > +     // class TLD_*          # NOTICE: no wildcard in class names
> > +
> > +.. note ::
> > +
> > +    Unlike other keywords, classes are "name-to-change", not
> > +    "omitting-constraint-allows-change".  See Dynamic Debug Classmaps
> > +
> > +Flags:::
> > +
> >   The flags specification comprises a change operation followed
> >   by one or more flag characters.  The change operation is one
> >   of the characters::
> > @@ -394,3 +404,108 @@ just a shortcut for ``print_hex_dump(KERN_DEBUG)`=
`.
> >   For ``print_hex_dump_debug()``/``print_hex_dump_bytes()``, format
> string is
> >   its ``prefix_str`` argument, if it is constant string; or ``hexdump``
> >   in case ``prefix_str`` is built dynamically.
> > +
> > +Dynamic Debug Classmaps
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +
> > +The "class" keyword selects prdbgs based on author supplied,
> > +domain-oriented names.  This complements the nested-scope keywords:
> > +module, file, function, line.
> > +
> > +The main difference from the others: classes must be named to be
> > +changed.  This protects them from generic overwrite:
> > +
> > +  # IOW this cannot undo any DRM.debug settings
> > +  :#> ddcmd -p
> > +
> > +This protection is needed; /sys/module/drm/parameters/debug is ABI.
> > +DRM.debug is authoritative when dyndbg is not used, dyndbg's PARAM
> > +cannot undermine that guarantee just because its optional for DRM to
> > +use it.
> > +
> > +  :#> echo 0x1ff > /sys/module/drm/parameters/debug
> > +
> > +So each class must be enabled individually (no wildcards):
> > +
> > +  :#> ddcmd class DRM_UT_CORE +p
> > +  :#> ddcmd class DRM_UT_KMS +p
> > +  # or more selectively
> > +  :#> ddcmd class DRM_UT_CORE module drm +p
> > +
> > +That makes direct >control wordy and annoying, but it is a secondary
> > +interface; it is not intended to replace the ABI, just slide in
> > +underneath and reimplement it.
> > +
> > +However, since the sysfs/kparam is the ABI, if a classmap DEFINEr
> > +doesn't also add a _CLASSMAP_PARAM, there is no ABI, and no protection
> > +is needed.  In that case, class'd prdbgs would be enabled/disabled by
> > +legacy (class-less) queries, as a convenience, and because there's no
> > +need to enforce irrelevant rules.
> > +
> > +
> > +Dynamic Debug Classmap API
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> > +
> > +DRM.debug is built upon:
> > +
> > +- enum drm_debug_category: DRM_UT_<*> - <T> for short
> > +- 23 categorized api macros: drm_dbg_<T>(), DRM_DEBUG_<T>()
> > +- 5000 calls to them
> > +- all calling to __pr_debug_cls(<T>, ...)
> > +
> > +Those compile-time const short ints are good for optimizing compilers;
> > +a primary classmaps design goal was to keep that property.
> > +So basically .class_id =3D=3D=3D category.
> > +
> > +Then we use the drm_categories DRM_UT_* enum for both the classnames
> > +(stringified enum symbols) and their numeric values.
> > +
> > +Its expected that future users will also use categorized macros and an
> > +enum-defined categorization scheme like DRM's, with dyndbg inserted in
> > +similarly.
> > +
> > +DYNAMIC_DEBUG_CLASSMAP_DEFINE(var,type,_base,classnames) - this maps
> > +classnames (a list of strings) onto class-ids consecutively, starting
> > +at _base, it also maps the names onto CLASSMAP_PARAM bits 0..N.
> > +
> > +DYNAMIC_DEBUG_CLASSMAP_USE(var) - modules call this to refer to the
> > +var _DEFINEd elsewhere (and exported).
> > +
> > +Classmaps are opt-in: modules invoke _DEFINE or _USE to authorize
> > +dyndbg to update those classes.  "class FOO" queries are validated
> > +against the classes, this finds the classid to alter; classes are not
> > +directly selectable by their classid.
> > +
> > +NB: It is an inherent API limitation that the following are possible:
> > +
> > +  // these would be caught in review
> > +  __pr_debug_cls(0, "fake DRM_UT_CORE msg");  // this works
> > +  __pr_debug_cls(62, "un-known classid msg"); // this compiles, does
> nothing
> > +
> > +There are 2 types of classmaps:
> > +
> > + DD_CLASS_TYPE_DISJOINT_BITS: classes are independent, like DRM.debug
> > + DD_CLASS_TYPE_LEVEL_NUM: classes are relative, ordered (V3 > V2)
> > +
> > +DYNAMIC_DEBUG_CLASSMAP_PARAM - modelled after module_param_cb, it
> > +refers to a DEFINEd classmap, and associates it to the param's
> > +data-store.  This state is then applied to DEFINEr and USEr modules
> > +when they're modprobed.
> > +
> > +The PARAM interface also enforces the DD_CLASS_TYPE_LEVEL_NUM relation
> > +amongst the contained classnames; all classes are independent in the
> > +control parser itself; there is no implied meaning in names like "V4".
> > +
> > +Modules or module-groups (drm & drivers) can define multiple
> > +classmaps, as long as they (all the classmaps) share the limited 0..62
> > +per-module-group _class_id range, without overlap.
> > +
> > +If a module encounters a conflict between 2 classmaps its USEing, we
> > +can extend the _USE macro with an offset to allow de-conflicting the
> > +respective ranges.  Or they use the DEFINErs macro-api, but with new
> > +enum symbols.
> > +
> > +``#define DEBUG`` will enable all pr_debugs in scope, including any
> > +class'd ones.  This won't be reflected in the PARAM readback value,
> > +but the class'd pr_debug callsites can be forced off by toggling the
> > +classmap-kparam all-on then all-off.
>
> --
> Louis Chauvet, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>
>

--000000000000d9df49063e4ffb70
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>hi Louis, thx for the nudge.</div><br><div class=3D"g=
mail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On =
Mon, Sep 8, 2025 at 8:38=E2=80=AFAM Louis Chauvet &lt;<a href=3D"mailto:lou=
is.chauvet@bootlin.com">louis.chauvet@bootlin.com</a>&gt; wrote:<br></div><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex">\<br>
<br>
Le 03/08/2025 =C3=A0 05:57, Jim Cromie a =C3=A9crit=C2=A0:<br>
&gt; Describe the 3 API macros providing dynamic_debug&#39;s classmaps<br>
&gt; <br>
&gt; DYNDBG_CLASSMAP_DEFINE - create &amp; export a classmap<br>
&gt; DYNDBG_CLASSMAP_USE=C2=A0 =C2=A0 - refer to exported map<br>
&gt; DYNDBG_CLASSMAP_PARAM=C2=A0 - bind control param to the classmap<br>
&gt; DYNDBG_CLASSMAP_PARAM_REF + use module&#39;s storage - __drm_debug<br>
&gt;</blockquote><div><br></div><div>I should note:</div><div><br></div><di=
v>classmaps-v1 made some bad-taste naming choices,</div><div>1st was the sh=
ortening: DYNDBG_=C2=A0=C2=A0</div><div><div>These are invoked once per mod=
ule, so we can afford full names.</div><br class=3D"gmail-Apple-interchange=
-newline"></div><div>So series drops DYNDBG_ prefix, replaces it with DYNAM=
IC_DEBUG_,</div><div>and this commit-msg is now corrected</div><div><br></d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left:1px solid rgb(204,204,204);padding-left:1ex"><br>
&gt; TBD: some of this might be over-specification, or just over-talked.<br=
>
&gt; <br>
&gt; NB: The _DEFINE &amp; _USE model makes the user dependent on the defin=
er,<br>
&gt; just like EXPORT_SYMBOL(__drm_debug) already does.<br>
&gt; <br>
&gt; cc: <a href=3D"mailto:linux-doc@vger.kernel.org" target=3D"_blank">lin=
ux-doc@vger.kernel.org</a><br>
&gt; Signed-off-by: Jim Cromie &lt;<a href=3D"mailto:jim.cromie@gmail.com" =
target=3D"_blank">jim.cromie@gmail.com</a>&gt;<br>
<br>
Reviewed-by: Louis Chauvet &lt;<a href=3D"mailto:louis.chauvet@bootlin.com"=
 target=3D"_blank">louis.chauvet@bootlin.com</a>&gt;<br>
<br>
&gt; ---<br>
&gt; v3- rework protection around PARAM<br>
&gt; <br>
&gt; v0.5 adjustments per Randy Dunlap<br>
&gt; v0.7 checkpatch fixes<br>
&gt; v0.8 more<br>
&gt; v0.9 rewords<br>
&gt; <br>
&gt; fixup-howto<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0.../admin-guide/dynamic-debug-howto.rst=C2=A0 =C2=A0 =C2=
=A0 =C2=A0| 137 ++++++++++++++++--<br>
&gt;=C2=A0 =C2=A01 file changed, 126 insertions(+), 11 deletions(-)<br>
&gt; <br>
&gt; diff --git a/Documentation/admin-guide/dynamic-debug-howto.rst b/Docum=
entation/admin-guide/dynamic-debug-howto.rst<br>
&gt; index 1ceadf4f28f9f..556e00299ed35 100644<br>
&gt; --- a/Documentation/admin-guide/dynamic-debug-howto.rst<br>
&gt; +++ b/Documentation/admin-guide/dynamic-debug-howto.rst<br>
&gt; @@ -146,7 +146,9 @@ keywords are:::<br>
&gt;=C2=A0 =C2=A0 =C2=A0&quot;1-30&quot; is valid range but &quot;1 - 30&qu=
ot; is not.<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0<br>
&gt; -The meanings of each keyword are:<br>
&gt; +Keywords:::<br>
&gt; +<br>
&gt; +The meanings of each keyword are::<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0func<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0The given string is compared against the fun=
ction name<br>
&gt; @@ -194,16 +196,6 @@ format<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0format &quot;nfsd: SETATTR&quot;=C2=A0 // a =
neater way to match a format with whitespace<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0format &#39;nfsd: SETATTR&#39;=C2=A0 // yet =
another way to match a format with whitespace<br>
&gt;=C2=A0 =C2=A0<br>
&gt; -class<br>
&gt; -=C2=A0 =C2=A0 The given class_name is validated against each module, =
which may<br>
&gt; -=C2=A0 =C2=A0 have declared a list of known class_names.=C2=A0 If the=
 class_name is<br>
&gt; -=C2=A0 =C2=A0 found for a module, callsite &amp; class matching and a=
djustment<br>
&gt; -=C2=A0 =C2=A0 proceeds.=C2=A0 Examples::<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0class DRM_UT_KMS=C2=A0 =C2=A0 =C2=A0 =C2=A0 # a D=
RM.debug category<br>
&gt; -=C2=A0 =C2=A0 =C2=A0class JUNK=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 # silent non-match<br>
&gt; -=C2=A0 =C2=A0 =C2=A0// class TLD_*=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
# NOTICE: no wildcard in class names<br>
&gt; -<br>
&gt;=C2=A0 =C2=A0line<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0The given line number or range of line numbe=
rs is compared<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0against the line number of each ``pr_debug()=
`` callsite.=C2=A0 A single<br>
&gt; @@ -218,6 +210,24 @@ line<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0line -1605=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 // the 1605 lines from line 1 to line 1605<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0line 1600-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 // all lines from line 1600 to the end of the file<br>
&gt;=C2=A0 =C2=A0<br>
&gt; +class<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 The given class_name is validated against each module, =
which may<br>
&gt; +=C2=A0 =C2=A0 have declared a list of class_names it accepts.=C2=A0 I=
f the class_name<br>
&gt; +=C2=A0 =C2=A0 accepted by a module, callsite &amp; class matching and=
 adjustment<br>
&gt; +=C2=A0 =C2=A0 proceeds.=C2=A0 Examples::<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0class DRM_UT_KMS=C2=A0 =C2=A0 =C2=A0 =C2=A0 # a D=
RM.debug category<br>
&gt; +=C2=A0 =C2=A0 =C2=A0class JUNK=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 # silent non-match<br>
&gt; +=C2=A0 =C2=A0 =C2=A0// class TLD_*=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
# NOTICE: no wildcard in class names<br>
&gt; +<br>
&gt; +.. note ::<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 Unlike other keywords, classes are &quot;name-to-change=
&quot;, not<br>
&gt; +=C2=A0 =C2=A0 &quot;omitting-constraint-allows-change&quot;.=C2=A0 Se=
e Dynamic Debug Classmaps<br>
&gt; +<br>
&gt; +Flags:::<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0The flags specification comprises a change operation follo=
wed<br>
&gt;=C2=A0 =C2=A0by one or more flag characters.=C2=A0 The change operation=
 is one<br>
&gt;=C2=A0 =C2=A0of the characters::<br>
&gt; @@ -394,3 +404,108 @@ just a shortcut for ``print_hex_dump(KERN_DEBUG)=
``.<br>
&gt;=C2=A0 =C2=A0For ``print_hex_dump_debug()``/``print_hex_dump_bytes()``,=
 format string is<br>
&gt;=C2=A0 =C2=A0its ``prefix_str`` argument, if it is constant string; or =
``hexdump``<br>
&gt;=C2=A0 =C2=A0in case ``prefix_str`` is built dynamically.<br>
&gt; +<br>
&gt; +Dynamic Debug Classmaps<br>
&gt; +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
<br>
&gt; +<br>
&gt; +The &quot;class&quot; keyword selects prdbgs based on author supplied=
,<br>
&gt; +domain-oriented names.=C2=A0 This complements the nested-scope keywor=
ds:<br>
&gt; +module, file, function, line.<br>
&gt; +<br>
&gt; +The main difference from the others: classes must be named to be<br>
&gt; +changed.=C2=A0 This protects them from generic overwrite:<br>
&gt; +<br>
&gt; +=C2=A0 # IOW this cannot undo any DRM.debug settings<br>
&gt; +=C2=A0 :#&gt; ddcmd -p<br>
&gt; +<br>
&gt; +This protection is needed; /sys/module/drm/parameters/debug is ABI.<b=
r>
&gt; +DRM.debug is authoritative when dyndbg is not used, dyndbg&#39;s PARA=
M<br>
&gt; +cannot undermine that guarantee just because its optional for DRM to<=
br>
&gt; +use it.<br>
&gt; +<br>
&gt; +=C2=A0 :#&gt; echo 0x1ff &gt; /sys/module/drm/parameters/debug<br>
&gt; +<br>
&gt; +So each class must be enabled individually (no wildcards):<br>
&gt; +<br>
&gt; +=C2=A0 :#&gt; ddcmd class DRM_UT_CORE +p<br>
&gt; +=C2=A0 :#&gt; ddcmd class DRM_UT_KMS +p<br>
&gt; +=C2=A0 # or more selectively<br>
&gt; +=C2=A0 :#&gt; ddcmd class DRM_UT_CORE module drm +p<br>
&gt; +<br>
&gt; +That makes direct &gt;control wordy and annoying, but it is a seconda=
ry<br>
&gt; +interface; it is not intended to replace the ABI, just slide in<br>
&gt; +underneath and reimplement it.<br>
&gt; +<br>
&gt; +However, since the sysfs/kparam is the ABI, if a classmap DEFINEr<br>
&gt; +doesn&#39;t also add a _CLASSMAP_PARAM, there is no ABI, and no prote=
ction<br>
&gt; +is needed.=C2=A0 In that case, class&#39;d prdbgs would be enabled/di=
sabled by<br>
&gt; +legacy (class-less) queries, as a convenience, and because there&#39;=
s no<br>
&gt; +need to enforce irrelevant rules.<br>
&gt; +<br>
&gt; +<br>
&gt; +Dynamic Debug Classmap API<br>
&gt; +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D<br>
&gt; +<br>
&gt; +DRM.debug is built upon:<br>
&gt; +<br>
&gt; +- enum drm_debug_category: DRM_UT_&lt;*&gt; - &lt;T&gt; for short<br>
&gt; +- 23 categorized api macros: drm_dbg_&lt;T&gt;(), DRM_DEBUG_&lt;T&gt;=
()<br>
&gt; +- 5000 calls to them<br>
&gt; +- all calling to __pr_debug_cls(&lt;T&gt;, ...)<br>
&gt; +<br>
&gt; +Those compile-time const short ints are good for optimizing compilers=
;<br>
&gt; +a primary classmaps design goal was to keep that property.<br>
&gt; +So basically .class_id =3D=3D=3D category.<br>
&gt; +<br>
&gt; +Then we use the drm_categories DRM_UT_* enum for both the classnames<=
br>
&gt; +(stringified enum symbols) and their numeric values.<br>
&gt; +<br>
&gt; +Its expected that future users will also use categorized macros and a=
n<br>
&gt; +enum-defined categorization scheme like DRM&#39;s, with dyndbg insert=
ed in<br>
&gt; +similarly.<br>
&gt; +<br>
&gt; +DYNAMIC_DEBUG_CLASSMAP_DEFINE(var,type,_base,classnames) - this maps<=
br>
&gt; +classnames (a list of strings) onto class-ids consecutively, starting=
<br>
&gt; +at _base, it also maps the names onto CLASSMAP_PARAM bits 0..N.<br>
&gt; +<br>
&gt; +DYNAMIC_DEBUG_CLASSMAP_USE(var) - modules call this to refer to the<b=
r>
&gt; +var _DEFINEd elsewhere (and exported).<br>
&gt; +<br>
&gt; +Classmaps are opt-in: modules invoke _DEFINE or _USE to authorize<br>
&gt; +dyndbg to update those classes.=C2=A0 &quot;class FOO&quot; queries a=
re validated<br>
&gt; +against the classes, this finds the classid to alter; classes are not=
<br>
&gt; +directly selectable by their classid.<br>
&gt; +<br>
&gt; +NB: It is an inherent API limitation that the following are possible:=
<br>
&gt; +<br>
&gt; +=C2=A0 // these would be caught in review<br>
&gt; +=C2=A0 __pr_debug_cls(0, &quot;fake DRM_UT_CORE msg&quot;);=C2=A0 // =
this works<br>
&gt; +=C2=A0 __pr_debug_cls(62, &quot;un-known classid msg&quot;); // this =
compiles, does nothing<br>
&gt; +<br>
&gt; +There are 2 types of classmaps:<br>
&gt; +<br>
&gt; + DD_CLASS_TYPE_DISJOINT_BITS: classes are independent, like DRM.debug=
<br>
&gt; + DD_CLASS_TYPE_LEVEL_NUM: classes are relative, ordered (V3 &gt; V2)<=
br>
&gt; +<br>
&gt; +DYNAMIC_DEBUG_CLASSMAP_PARAM - modelled after module_param_cb, it<br>
&gt; +refers to a DEFINEd classmap, and associates it to the param&#39;s<br=
>
&gt; +data-store.=C2=A0 This state is then applied to DEFINEr and USEr modu=
les<br>
&gt; +when they&#39;re modprobed.<br>
&gt; +<br>
&gt; +The PARAM interface also enforces the DD_CLASS_TYPE_LEVEL_NUM relatio=
n<br>
&gt; +amongst the contained classnames; all classes are independent in the<=
br>
&gt; +control parser itself; there is no implied meaning in names like &quo=
t;V4&quot;.<br>
&gt; +<br>
&gt; +Modules or module-groups (drm &amp; drivers) can define multiple<br>
&gt; +classmaps, as long as they (all the classmaps) share the limited 0..6=
2<br>
&gt; +per-module-group _class_id range, without overlap.<br>
&gt; +<br>
&gt; +If a module encounters a conflict between 2 classmaps its USEing, we<=
br>
&gt; +can extend the _USE macro with an offset to allow de-conflicting the<=
br>
&gt; +respective ranges.=C2=A0 Or they use the DEFINErs macro-api, but with=
 new<br>
&gt; +enum symbols.<br>
&gt; +<br>
&gt; +``#define DEBUG`` will enable all pr_debugs in scope, including any<b=
r>
&gt; +class&#39;d ones.=C2=A0 This won&#39;t be reflected in the PARAM read=
back value,<br>
&gt; +but the class&#39;d pr_debug callsites can be forced off by toggling =
the<br>
&gt; +classmap-kparam all-on then all-off.<br>
<br>
-- <br>
Louis Chauvet, Bootlin<br>
Embedded Linux and Kernel engineering<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a><br>
<br>
</blockquote></div></div>

--000000000000d9df49063e4ffb70--
