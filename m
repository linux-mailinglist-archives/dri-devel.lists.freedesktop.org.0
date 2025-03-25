Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 27ADAA7092D
	for <lists+dri-devel@lfdr.de>; Tue, 25 Mar 2025 19:42:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4329D10E3B1;
	Tue, 25 Mar 2025 18:42:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="fSl0vgav";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com
 [209.85.128.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00F9D10E293;
 Tue, 25 Mar 2025 18:42:33 +0000 (UTC)
Received: by mail-yw1-f173.google.com with SMTP id
 00721157ae682-6febf391132so52576457b3.1; 
 Tue, 25 Mar 2025 11:42:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742928152; x=1743532952; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PeUoecMq8P9nHeIOh/xIrCNU1yJBHCZceaN06+7PEC4=;
 b=fSl0vgavuB3iu4dNR0lNEVwSQ4pR828QYNB5AYGXfHCvmpHBMlmjAsmAiYeFSwMclX
 AiAlkprSMNBtOuSxwSosYckl6g4VJPDcKmDDXrPuy9SPemmhVeu+h4sCaYrYZ0I2DkfZ
 ej3ELXh10KqCRdmGN7/cADTsygCvdmaMKaRsDw0ThnMzKC/nlzC7n5wLG7NwCtQiqCsi
 889NdJnXw9TzvtVEpGORG8jqOM612y4PMrSiaMf/kHw2j0THtAYkTy37O3+IYRhqqfm8
 gEznnAcOmNYY50vRnbjgq/9RZS12adwnrqiI3yjLV/6RemlnDV+c72/rArNgyPNtlIMD
 vCkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742928152; x=1743532952;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PeUoecMq8P9nHeIOh/xIrCNU1yJBHCZceaN06+7PEC4=;
 b=QljArczqgo7hDDAlzLvdOkOvgIMtBxIcP91SWo2aq/yoRrFxD7D8nRrTX4EQAzEHYl
 ssikcZs2CUREzXoF7AvM34H983+mKgJGVBNkXGsLdugyAV325YG/GAnO+INfwEPH3qiv
 S5Kdi7r0xk6o821OgO6siPb6wo3YLu1A/bpc2gMW8oM1G9BvA0savVA+sy0Cq1B/oEoF
 Fei8lqcuRCQHaEI3lfww21AVYu+yYAxmA/qnJ1qxBDAvzYNJ0DGrxcaA4gftjoQGGKD6
 NT3bIyVWYomedikPqpVtOE/fru5tmyYybKxE6LNFITBvFE2lMlxlZ1mmX+duNnGOrvYM
 DDzQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUKzkOMJSD1fc5+eiuqCyU03sEMpN5Cp32yYgcO4TaDGoWgQCPI93d6hPTtnmZNDOK1FVMKBnS4w+XuYJy/LA==@lists.freedesktop.org,
 AJvYcCUNzUHy1f7pYtN9nXz9eS4B4CUYSm9bL+MTFxVI80/3Ps5Pz35TDJp8j06nhcEx4M5J9O9E4GBHkObn@lists.freedesktop.org,
 AJvYcCUiy1Bq6iG313mWuD+AYVBPNGNYATvxcZIKyqvuaCaAwiHNH2ie9qfEjgKnhWjhA5gdAyJ1IdFnJPK+S6CdfeeRbQ==@lists.freedesktop.org,
 AJvYcCVKJsf33ovGu0jLdBlTfabTUOXyFxe4MH/Nm5MK+Zm2H3FP2MYpljx1iNEsPseu8+uaz2/2NscftR5w@lists.freedesktop.org,
 AJvYcCW2nRzfCC66JeNBgtPPPr7Hm2eKrraH9H/W5fxyLTcuE3jc3IMjL2odvvSF2/mjN1pIgkhy0DZj@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw57xTMOk8tpT7egdE4Ob0S1JwWgIx/J9OXHLXrxFrIV7fpdu1C
 j/ixKvFP090oGsznLSyKnFJW9Tkbq2k1U1QUp7giIgEtR8gLaUd5NO+y/o+D+1ewC+Nb/m4SjSz
 ZBAdr+9B25ay8gON8T0MXA6L8Lq4=
X-Gm-Gg: ASbGncv27Z42jc2CvBK5juhkB2JFcOF6c5H0xvMogo8FxoLzWsSNcep5DrCJVbxFxwT
 5GYYV7YbH/G5kcZGNcZPVkHo29W94i7Dtn++OaSnOPMTOhcKNm1JoH92yU3P0h37ZldnzA/PwE4
 aOBqvhej9o/leSyDOhW8YlSfZo
X-Google-Smtp-Source: AGHT+IEYJVEdhxBYqC+vn+T0V878WmSY+Hkd8JEVzl5vnSfQjiTFWsv1pJ/9u3CtXGZJrGgT7+9EyoeQDEqXNs0ITcY=
X-Received: by 2002:a05:690c:4d49:b0:6f9:aecf:ab34 with SMTP id
 00721157ae682-700bad42af9mr237984777b3.38.1742928151983; Tue, 25 Mar 2025
 11:42:31 -0700 (PDT)
MIME-Version: 1.0
References: <20250320185238.447458-1-jim.cromie@gmail.com>
 <20250320185238.447458-34-jim.cromie@gmail.com>
 <2dffcb05-1c31-4704-9081-91107b3ce165@bootlin.com>
In-Reply-To: <2dffcb05-1c31-4704-9081-91107b3ce165@bootlin.com>
From: jim.cromie@gmail.com
Date: Tue, 25 Mar 2025 12:42:05 -0600
X-Gm-Features: AQ5f1JonfOJIFA8uirzWISL6HB1CZ8tZUdwOAeNYz4kp6Txu9CT7sVkQi1xw55c
Message-ID: <CAJfuBxwHQOqDobL-FZiMA81OaccWw9RRJp2gL__CrQVnM+z33w@mail.gmail.com>
Subject: Re: [PATCH v2 33/59] docs/dyndbg: add classmap info to howto (TBD)
To: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org, 
 intel-gfx@lists.freedesktop.org, intel-gfx-trybot@lists.freedesktop.org, 
 jbaron@akamai.com, gregkh@linuxfoundation.org, ukaszb@chromium.org, 
 daniel.vetter@ffwll.ch, tvrtko.ursulin@linux.intel.com, jani.nikula@intel.com, 
 ville.syrjala@linux.intel.com, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Mon, Mar 24, 2025 at 9:23=E2=80=AFAM Louis Chauvet <louis.chauvet@bootli=
n.com> wrote:
>
>
>
> Le 20/03/2025 =C3=A0 19:52, Jim Cromie a =C3=A9crit :
> > Describe the 3 API macros providing dynamic_debug's classmaps
> >
> > DYNDBG_CLASSMAP_DEFINE - create & export a classmap
...
> > +Dynamic Debug classmaps
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +
> > +The "class" keyword selects prdbgs based on author supplied,
> > +domain-oriented names.  This complements the nested-scope keywords:
> > +module, file, function, line.
> > +
> > +The main difference from the others: class'd prdbgs must be named to
> > +be changed.  This protects them from generic overwrite:
> > +
> > +  # IOW this cannot undo any DRM.debug settings
> > +  :#> ddcmd -p
>
> Patch 30/59 just dropped this behavior no?

Yes, that chunk is obsolete, given my capitulation :-/


>
> > +So each class must be enabled individually (no wildcards):
> > +
> > +  :#> ddcmd class DRM_UT_CORE +p
> > +  :#> ddcmd class DRM_UT_KMS +p
> > +  # or more selectively
> > +  :#> ddcmd class DRM_UT_CORE module drm +p
> > +
> > +Or the legacy/normal (more convenient) way:
> > +
> > +  :#> echo 0x1ff > /sys/module/drm/parameters/debug
> > +
> > +Dynamic Debug Classmap API
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> > +
> > +DRM.debug is built upon:
> > +  ~23 macros, all passing a DRM_UT_* constant as arg-1.
> > +  ~5000 calls to them, across drivers/gpu/drm/*
> > +  bits in /sys/module/drm/parameters/debug control all DRM_UT_* togeth=
er
> > +
> > +The const short ints are good for optimizing compilers; a classmaps
> > +design goal was to keep that.  So basically .classid =3D=3D=3D categor=
y.
> > +
> > +And since prdbgs are cataloged with just a DRM_UT_* to identify them,
> > +the "class" keyword maps known classnames to those reserved IDs, and
> > +by explicitly requiring "class FOO" in queries, we protect FOO class'd
> > +debugs from overwrite by generic queries.
> > +
> > +Its expected that other classmap users will also provide debug-macros
> > +using an enum-defined categorization scheme like DRM's, and dyndbg can
> > +be adapted under them similarly.
> > +
> > +DYNAMIC_DEBUG_CLASSMAP_DEFINE(var,type,_base,classnames) - this maps
> > +classnames onto class-ids consecutively, starting at _base, it also
> > +maps the names onto CLASSMAP_PARAM bits 0..N.
> > +
> > +DYNAMIC_DEBUG_CLASSMAP_USE(var) - modules call this to refer to the
> > +var _DEFINEd elsewhere (and exported).
> > +
> > +Classmaps are opt-in: modules invoke _DEFINE or _USE to authorize
> > +dyndbg to update those classes.  "class FOO" queries are validated
> > +against the classes, this finds the classid to alter; classes are not
> > +directly selectable by their classid.
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
> > +classmaps, as long as they share the limited 0..62 per-module-group
> > +_class_id range, without overlap.
>
> Maybe clarify that a driver using _USE macro should take care that he
> only use distinct non-overlaping classmaps?

ack

>
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
