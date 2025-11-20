Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CFA3DC71EDE
	for <lists+dri-devel@lfdr.de>; Thu, 20 Nov 2025 04:08:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30E8810E28C;
	Thu, 20 Nov 2025 03:08:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="N2j26XpK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com
 [209.85.214.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B71410E28C
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Nov 2025 03:08:53 +0000 (UTC)
Received: by mail-pl1-f170.google.com with SMTP id
 d9443c01a7336-2981f9ce15cso4891265ad.1
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Nov 2025 19:08:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1763608133; x=1764212933; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=obhMPXIkkdooRW9j/Fgg6xtfxvhQxt5QkqAkScu5Ygg=;
 b=N2j26XpKcRpP7jhV08+7ua+xCfcNOB/BJIszcZ6g53MD1FFGxv5frmMQ372YBdVLwN
 yeGMxvuFRNDpqKLE+SSK/0aMGqaX+SRAkqVuxuhRpSJqYtD87KHwXy4QO61WuaR/Eu/K
 kyU2ButaZearII7WD+SGKSE7czxj4pzGdFoTbUFovY7UUPWMbF5FFUDVUHwKOPFuHL3V
 fy7pQR74knjzDACNoVrg+W8+nRW5MZ8CuBi62dQzQXZdcwhXxggKDWuGWhjXpLmSYuBv
 UiWON4ZY9YL+yssFJLFOJscDasQ7g+3uPsFaJI3roysKJ0/8lvIIrq3AAe6piueBTiIS
 il7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763608133; x=1764212933;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=obhMPXIkkdooRW9j/Fgg6xtfxvhQxt5QkqAkScu5Ygg=;
 b=exhsjLRUbkzqWGiAP4Tdn0BxzFKl8nRfhAmp+dfy+5qkKo49doMh60krcyTYUPPcIm
 2urKcF3/VC0fEODfRdfOKQLLcssj4AxSHP0p63emnScX7c1UttnGv5rXIgArEKrGT0IB
 Zj7M00O+7AN/y4263CsGVZ1ea1QZIzIvi4JWcSKcL8odQqsXcQDRqdJVuTWzFKzZfp1l
 CoZ2kF5Zp3OFbu6yK3V0UW2dWZekZ1asTTn1TYyQRTUZjmoVoMOAzuMbt0DfLJnmtZdj
 9xiqKIxsKIG+U32mo+ws5DedsO6YItkBI7V1PUDSmexNT35aMY1LLTYzTBP7ZJNMKu01
 6fjw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXPLB+OMVhATT9ftg8C4sc5yZWkA59JxHiGfZT8PMprM3lPiMnoDzrFCeHE4XU9DxzCovCmFMDzi1A=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzT73nzEAvF1drqmZIHofupwSx+HTlaRr3JHefzgeY8hyyl5He/
 Ybaa8KkpIEVaTw9EUsF2vrDif97AXEKZX8zTwTkhrCphr9dxTHNwta/J
X-Gm-Gg: ASbGncthodirY9pMDIIgeD8sZ836PAgXlN82rB6SbdFgJoss51ocA1geaTMt1oO26DU
 HL47g+aVyEYG8oeoBgVBJyn6cIy1uTKzbGPr7plph36ZlVw6cMVGMR46AzQMN/30CET2fhf1HD8
 M2HALm7gE8zQGBgMHgqSKPeztj8UzsSdEy8NSY5Pm0UtmjybKczHDJ6lF/MRm5YegRlpk8QC9mY
 K6ucnb2LpjK/WPd8DKeUn/TstZVxOZADxbVEGGoWOMMC/zsDD2uKIZkfvSue20n2Iy+x4ALTJGr
 MWP7zKJqg2RevIOMW4AQFXHvAyBB4tprwL87/HUWRu1xbrvQv/qKnKgbXLVY746XjqW7sOQ5RJF
 bU5zVGukdRdhrtIPzpwNo7hFAF5qm39bpX/pQ2MMK3naSToWfK0fs0WgBhorlLn7IKkedKmXIcA
 eSAHkLRh/6U40=
X-Google-Smtp-Source: AGHT+IF+i7eRVDL93AayD7pCpjsON/H/qC8/CmYibw5k9KhxkFq0GDgTD2VE7/kyvTrhs6frphltCQ==
X-Received: by 2002:a17:903:40cb:b0:297:df17:54cd with SMTP id
 d9443c01a7336-29b5ebe28a2mr7905725ad.27.1763608132801; 
 Wed, 19 Nov 2025 19:08:52 -0800 (PST)
Received: from archie.me ([210.87.74.117]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-29b5b29d706sm8451995ad.80.2025.11.19.19.08.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Nov 2025 19:08:51 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
 id AAB3D41D96E5; Thu, 20 Nov 2025 10:08:49 +0700 (WIB)
Date: Thu, 20 Nov 2025 10:08:49 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Jim Cromie <jim.cromie@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, gregkh@linuxfoundation.org,
 jbaron@akamai.com
Cc: ukaszb@chromium.org, louis.chauvet@bootlin.com, linux-doc@vger.kernel.org
Subject: Re: [PATCH v6 31/31] docs/dyndbg: add classmap info to howto
Message-ID: <aR6GQeLW-sh9-A3W@archie.me>
References: <20251118201842.1447666-1-jim.cromie@gmail.com>
 <20251118201842.1447666-32-jim.cromie@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="HVQbqimanuPfAVD/"
Content-Disposition: inline
In-Reply-To: <20251118201842.1447666-32-jim.cromie@gmail.com>
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


--HVQbqimanuPfAVD/
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 18, 2025 at 01:18:41PM -0700, Jim Cromie wrote:
> diff --git a/Documentation/admin-guide/dynamic-debug-howto.rst b/Document=
ation/admin-guide/dynamic-debug-howto.rst
> index 1ceadf4f28f9..adac32a5cd23 100644
> --- a/Documentation/admin-guide/dynamic-debug-howto.rst
> +++ b/Documentation/admin-guide/dynamic-debug-howto.rst
> @@ -146,7 +146,9 @@ keywords are:::
>    "1-30" is valid range but "1 - 30" is not.
> =20
> =20
> -The meanings of each keyword are:
> +Keywords:::
> +
> +The meanings of each keyword are::
> =20
>  func
>      The given string is compared against the function name
> @@ -194,16 +196,6 @@ format
>  	format "nfsd: SETATTR"  // a neater way to match a format with whitespa=
ce
>  	format 'nfsd: SETATTR'  // yet another way to match a format with white=
space
> =20
> -class
> -    The given class_name is validated against each module, which may
> -    have declared a list of known class_names.  If the class_name is
> -    found for a module, callsite & class matching and adjustment
> -    proceeds.  Examples::
> -
> -	class DRM_UT_KMS	# a DRM.debug category
> -	class JUNK		# silent non-match
> -	// class TLD_*		# NOTICE: no wildcard in class names
> -
>  line
>      The given line number or range of line numbers is compared
>      against the line number of each ``pr_debug()`` callsite.  A single
> @@ -218,6 +210,24 @@ line
>  	line -1605          // the 1605 lines from line 1 to line 1605
>  	line 1600-          // all lines from line 1600 to the end of the file
> =20
> +class
> +
> +    The given class_name is validated against each module, which may
> +    have declared a list of class_names it accepts.  If the class_name
> +    accepted by a module, callsite & class matching and adjustment
> +    proceeds.  Examples::
> +
> +	class DRM_UT_KMS	# a drm.debug category
> +	class JUNK		# silent non-match
> +	// class TLD_*		# NOTICE: no wildcard in class names
> +
> +.. note ::
> +
> +    Unlike other keywords, classes are "name-to-change", not
> +    "omitting-constraint-allows-change".  See Dynamic Debug Classmaps
> +
> +Flags:::
> +
>  The flags specification comprises a change operation followed
>  by one or more flag characters.  The change operation is one
>  of the characters::
> @@ -238,11 +248,15 @@ The flags are::
>    s    Include the source file name
>    l    Include line number
> =20
> +Notes:
> +
> +To query without changing	``+_`` or ``-_``.
> +To clear all flags		``=3D_`` or ``-fslmpt``.
> +
>  For ``print_hex_dump_debug()`` and ``print_hex_dump_bytes()``, only
>  the ``p`` flag has meaning, other flags are ignored.
> =20
> -Note the regexp ``^[-+=3D][fslmpt_]+$`` matches a flags specification.
> -To clear all flags at once, use ``=3D_`` or ``-fslmpt``.
> +The regexp ``^[-+=3D][fslmpt_]+$`` matches a flags specification.
> =20
> =20
>  Debug messages during Boot Process
> @@ -394,3 +408,92 @@ just a shortcut for ``print_hex_dump(KERN_DEBUG)``.
>  For ``print_hex_dump_debug()``/``print_hex_dump_bytes()``, format string=
 is
>  its ``prefix_str`` argument, if it is constant string; or ``hexdump``
>  in case ``prefix_str`` is built dynamically.
> +
> +Dynamic Debug Classmaps
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +The "class" keyword selects prdbgs based on author supplied,
> +domain-oriented names.  This complements the nested-scope keywords:
> +module, file, function, line.
> +
> +The main difference from the others: classes must be named to be
> +changed.  This protects them from unintended overwrite:
> +
> +  # IOW this cannot undo any drm.debug settings
> +  :#> ddcmd -p
> +
> +This protection is needed; /sys/module/drm/parameters/debug is ABI.
> +drm.debug is authoritative when dyndbg is not used, dyndbg-under-DRM
> +is an implementation detail, and must not behave erratically, just
> +because another admin fed >control something unrelated.
> +
> +So each class must be enabled individually (no wildcards):
> +
> +  :#> ddcmd class DRM_UT_CORE +p
> +  :#> ddcmd class DRM_UT_KMS +p
> +  # or more selectively
> +  :#> ddcmd class DRM_UT_CORE module drm +p
> +
> +That makes direct >control wordy and annoying, but it is a secondary
> +interface; it is not intended to replace the ABI, just slide in
> +underneath and reimplement the guaranteed behavior.  So DRM would keep
> +using the convenient way, and be able to trust it.
> +
> +  :#> echo 0x1ff > /sys/module/drm/parameters/debug
> +
> +That said, since the sysfs/kparam is the ABI, if the author omits the
> +CLASSMAP_PARAM, theres no ABI to guard, and he probably wants a less
> +pedantic >control interface.  In this case, protection is dropped.
> +
> +Dynamic Debug Classmap API
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
> +
> +DYNAMIC_DEBUG_CLASSMAP_DEFINE(clname,type,_base,classnames) - this maps
> +classnames (a list of strings) onto class-ids consecutively, starting
> +at _base.
> +
> +DYNAMIC_DEBUG_CLASSMAP_USE(clname) & _USE_(clname,_base) - modules
> +call this to refer to the var _DEFINEd elsewhere (and exported).
> +
> +DYNAMIC_DEBUG_CLASSMAP_PARAM(clname) - creates the sysfs/kparam,
> +maps/exposes bits 0..N as class-names.
> +
> +Classmaps are opt-in: modules invoke _DEFINE or _USE to authorize
> +dyndbg to update those classes.  "class FOO" queries are validated
> +against the classes, this finds the classid to alter; classes are not
> +directly selectable by their classid.
> +
> +NB: It is an inherent API limitation (due to int class_id defn) that
> +the following are possible:
> +
> +  // these errors should be caught in review
> +  __pr_debug_cls(0, "fake DRM_UT_CORE msg");  // this works
> +  __pr_debug_cls(62, "un-known classid msg"); // this compiles, does not=
hing
> +
> +There are 2 types of classmaps:
> +
> + DD_CLASS_TYPE_DISJOINT_BITS: classes are independent, like drm.debug
> + DD_CLASS_TYPE_LEVEL_NUM: classes are relative, ordered (V3 > V2)
> +
> +DYNAMIC_DEBUG_CLASSMAP_PARAM - modelled after module_param_cb, it
> +refers to a DEFINEd classmap, and associates it to the param's
> +data-store.  This state is then applied to DEFINEr and USEr modules
> +when they're modprobed.
> +
> +The PARAM interface also enforces the DD_CLASS_TYPE_LEVEL_NUM relation
> +amongst the contained classnames; all classes are independent in the
> +control parser itself.  There is no implied meaning in names like "V4"
> +or "PL_ERROR" vs "PL_WARNING".
> +
> +Modules or module-groups (drm & drivers) can define multiple
> +classmaps, as long as they (all the classmaps) share the limited 0..62
> +per-module-group _class_id range, without overlap.
> +
> +If a module encounters a conflict between 2 classmaps its _USEing or
> +_DEFINEing, it can invoke the extended _USE_(name,_base) macro to
> +de-conflict the respective ranges.
> +
> +``#define DEBUG`` will enable all pr_debugs in scope, including any
> +class'd ones.  This won't be reflected in the PARAM readback value,
> +but the class'd pr_debug callsites can be forced off by toggling the
> +classmap-kparam all-on then all-off.

Hmmm... the resulting htmldocs looks messy so I clean it up:

---- >8 ----
diff --git a/Documentation/admin-guide/dynamic-debug-howto.rst b/Documentat=
ion/admin-guide/dynamic-debug-howto.rst
index adac32a5cd232d..fd3dbae00cfc60 100644
--- a/Documentation/admin-guide/dynamic-debug-howto.rst
+++ b/Documentation/admin-guide/dynamic-debug-howto.rst
@@ -146,9 +146,10 @@ keywords are:::
   "1-30" is valid range but "1 - 30" is not.
=20
=20
-Keywords:::
+Keywords
+--------
=20
-The meanings of each keyword are::
+The meanings of each keyword are:
=20
 func
     The given string is compared against the function name
@@ -221,12 +222,13 @@ class
 	class JUNK		# silent non-match
 	// class TLD_*		# NOTICE: no wildcard in class names
=20
-.. note ::
+.. note::
=20
     Unlike other keywords, classes are "name-to-change", not
-    "omitting-constraint-allows-change".  See Dynamic Debug Classmaps
+    "omitting-constraint-allows-change".  See :ref:`dyndbg-classmaps`.
=20
-Flags:::
+Flags
+-----
=20
 The flags specification comprises a change operation followed
 by one or more flag characters.  The change operation is one
@@ -248,10 +250,10 @@ The flags are::
   s    Include the source file name
   l    Include line number
=20
-Notes:
+.. note::
=20
-To query without changing	``+_`` or ``-_``.
-To clear all flags		``=3D_`` or ``-fslmpt``.
+   * To query without changing:	``+_`` or ``-_``.
+   * To clear all flags:	``=3D_`` or ``-fslmpt``.
=20
 For ``print_hex_dump_debug()`` and ``print_hex_dump_bytes()``, only
 the ``p`` flag has meaning, other flags are ignored.
@@ -409,6 +411,8 @@ For ``print_hex_dump_debug()``/``print_hex_dump_bytes()=
``, format string is
 its ``prefix_str`` argument, if it is constant string; or ``hexdump``
 in case ``prefix_str`` is built dynamically.
=20
+.. _dyndbg-classmaps:
+
 Dynamic Debug Classmaps
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
=20
@@ -417,7 +421,7 @@ domain-oriented names.  This complements the nested-sco=
pe keywords:
 module, file, function, line.
=20
 The main difference from the others: classes must be named to be
-changed.  This protects them from unintended overwrite:
+changed.  This protects them from unintended overwrite::
=20
   # IOW this cannot undo any drm.debug settings
   :#> ddcmd -p
@@ -427,7 +431,7 @@ drm.debug is authoritative when dyndbg is not used, dyn=
dbg-under-DRM
 is an implementation detail, and must not behave erratically, just
 because another admin fed >control something unrelated.
=20
-So each class must be enabled individually (no wildcards):
+So each class must be enabled individually (no wildcards)::
=20
   :#> ddcmd class DRM_UT_CORE +p
   :#> ddcmd class DRM_UT_KMS +p
@@ -437,7 +441,7 @@ So each class must be enabled individually (no wildcard=
s):
 That makes direct >control wordy and annoying, but it is a secondary
 interface; it is not intended to replace the ABI, just slide in
 underneath and reimplement the guaranteed behavior.  So DRM would keep
-using the convenient way, and be able to trust it.
+using the convenient way, and be able to trust it::
=20
   :#> echo 0x1ff > /sys/module/drm/parameters/debug
=20
@@ -464,7 +468,7 @@ against the classes, this finds the classid to alter; c=
lasses are not
 directly selectable by their classid.
=20
 NB: It is an inherent API limitation (due to int class_id defn) that
-the following are possible:
+the following are possible::
=20
   // these errors should be caught in review
   __pr_debug_cls(0, "fake DRM_UT_CORE msg");  // this works
@@ -472,8 +476,8 @@ the following are possible:
=20
 There are 2 types of classmaps:
=20
- DD_CLASS_TYPE_DISJOINT_BITS: classes are independent, like drm.debug
- DD_CLASS_TYPE_LEVEL_NUM: classes are relative, ordered (V3 > V2)
+* DD_CLASS_TYPE_DISJOINT_BITS: classes are independent, like drm.debug
+* DD_CLASS_TYPE_LEVEL_NUM: classes are relative, ordered (V3 > V2)
=20
 DYNAMIC_DEBUG_CLASSMAP_PARAM - modelled after module_param_cb, it
 refers to a DEFINEd classmap, and associates it to the param's

Thanks.

--=20
An old man doll... just what I always wanted! - Clara

--HVQbqimanuPfAVD/
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCaR6GPAAKCRD2uYlJVVFO
o82NAP9o9bKdHzQr2WUnsmQEo2y9z1jOdX8J+HgUei4iaKFGoAEA7aYmQOKNkEme
AThPfWzYb2VtrLEG2zkxC0iPslgWTAg=
=vmiO
-----END PGP SIGNATURE-----

--HVQbqimanuPfAVD/--
