Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D09ECB409B
	for <lists+dri-devel@lfdr.de>; Wed, 10 Dec 2025 22:12:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEB7189EB1;
	Wed, 10 Dec 2025 21:12:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="l/QXdOt/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com
 [209.85.128.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1788089EB1
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Dec 2025 21:12:32 +0000 (UTC)
Received: by mail-yw1-f178.google.com with SMTP id
 00721157ae682-78c6957a327so2842307b3.3
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Dec 2025 13:12:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1765401151; x=1766005951; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=h+VVCGCpEM68y/Fa0i684zyfGuWlX4L9eEMpu8Qino4=;
 b=l/QXdOt/wpOOcDDNXXqclqIPsiAZn5xCesS7OYUTJ/6XvNWfweLmUS9Jy0vC6nlVyN
 tfXOVez+aVXAP2Pbnjl2uiqJI77LZ5Yc1B5fegl2dUv3831JFbmaoCJXpQW/sEWNJ1M1
 JdxL9EYAT9n9YPyCzCnHuGu473jbZFjPYaaLJWdQ0t/ucvFKhBPpllN8bRGh2cxOcI76
 W2FyKedtlpNUTVhdtURdALhM9e7UWC9IqBj7jxhXEnhuC9FSP/UDzqgWcJ/J1uHeDS/N
 MeM/WwX2KaYiz2KodFeSoQkxX5C1UT3YRYF8xjBqSl0vqFmjWOz4M+T06PauJxh0YAhE
 xVnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765401151; x=1766005951;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=h+VVCGCpEM68y/Fa0i684zyfGuWlX4L9eEMpu8Qino4=;
 b=ejZuw6ZhhHyTP4bk9kZ7A9eLrW/si+JRktTa8KSisBZl3obJEWl2wo5vd7133iMQKn
 yu4GL7ye8WYE0lKCLR+vVQMCMmk1MVSwr8zSHl1nr6B9J3xdPG9koMG1zVMg5NeTHJ0Q
 aYm2m3CI+CYtVBIw+QGgIH6VMvBlGJlhOEvfcRStpbtvEfcdgL3iAIMnr9WAP3OzDVwU
 zpvVhcYHe7DQ9J1cIXZ8W2ChLdzqfdfHogYpPl7hQ7kuLRWgJz7BITWFDWFC9jCVmBP1
 xtsh11oA/4s6QIuCCiCUygDtaBEN198Xjcu3C49g7WkXqUGYuN9c7cAe2gl7PYbbMzn1
 D/zw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWopePosgPmIVGGFRIy+zeknHoAqORpJ7e/OMSirPTYqTsANEPWptu24Iab2fjRtRdmJRs8C82Rbj0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzydGgO+SxIJnM3W/gH4DExcEvOylPPaJk0ke8gnGLtlyM+6o1+
 BELiCfoNmg9hcCcIas2WknpJtcM71ir4F4aX8RfDxGdtIlL1qmeXNqJNJNaiVwAKDPgWoncBA0Q
 7lKDVkKugVhdAG+bSaJOp94f2CGmpELo=
X-Gm-Gg: AY/fxX59/fcS+gy3VHC3F5LCbMnadhTcx1B3lu+s7RTgw2YHDzgWZTLs/p5o9V59px7
 Ub2YADLKZbJ4tT5GEbIfuHglz3orA+wTJNfuDNRzqlCjCuFK1fUw7BMRxneBNbQKqIFBW7bePyJ
 OktYRuSNEM1bpk8RvjLO2V4rOEMlfMz6pelmL5p3kDdbpYV465hwJ4HyaZzB6mq8Y3f6yj+4d+O
 SO4Tui9pJcE6uBnSVzL3//+qeNh1ukyI86CT3FGos0JfGfrhwyrfI97JNLTXLm0FBPaRWCo79Tp
 s422VvLm
X-Google-Smtp-Source: AGHT+IFE5YhLGjy9AbmQnangq4PdwbODTGQtBGKD5rrJ/HnxhxkDFVzncRu0zD0LApfncvp+/3xLIV0LjjqUKhqcjQM=
X-Received: by 2002:a05:690c:1e:b0:786:61c6:7e58 with SMTP id
 00721157ae682-78c9d7fa4aamr37291467b3.39.1765401150789; Wed, 10 Dec 2025
 13:12:30 -0800 (PST)
MIME-Version: 1.0
References: <20251118201842.1447666-1-jim.cromie@gmail.com>
 <76038c97-39ca-4672-adc0-4e8fe0e39fc8@akamai.com>
In-Reply-To: <76038c97-39ca-4672-adc0-4e8fe0e39fc8@akamai.com>
From: jim.cromie@gmail.com
Date: Thu, 11 Dec 2025 10:12:03 +1300
X-Gm-Features: AQt7F2qp1VDPDq1vwc6WAhPXZUsK-dYBYJX8-MXCkd3FjKDmeykNXLDy1890-7Y
Message-ID: <CAJfuBxxFWD0rEjm-va+Bjmf-m2nfOD_+ZEqKy22WX6QdugQCUw@mail.gmail.com>
Subject: Re: [PATCH v6 00/31] drm/dyndbg: Fix dynamic debug classmap regression
To: Jason Baron <jbaron@akamai.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 gregkh@linuxfoundation.org, ukaszb@chromium.org, louis.chauvet@bootlin.com
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

On Thu, Dec 11, 2025 at 8:09=E2=80=AFAM Jason Baron <jbaron@akamai.com> wro=
te:
>
>
>
> On 11/18/25 3:18 PM, Jim Cromie wrote:
> > !-------------------------------------------------------------------|
> >    This Message Is From an External Sender
> >    This message came from outside your organization.
> > |-------------------------------------------------------------------!
> >
> > hello all,
> >
> > commit aad0214f3026 ("dyndbg: add DECLARE_DYNDBG_CLASSMAP macro")
> >
> > added dyndbg's "classmaps" feature, which brought dyndbg's 0-off-cost
> > debug to DRM.  Dyndbg wired to /sys/module/drm/parameters/debug,
> > mapped its bits to classes named "DRM_UT_*", and effected the callsite
> > enablements only on updates to the sys-node (and underlying >control).
> >
> > Sadly, it hit a CI failure, resulting in:
> > commit bb2ff6c27bc9 ("drm: Disable dynamic debug as broken")
> >
> > The regression was that drivers, when modprobed, did not get the
> > drm.debug=3D0xff turn-on action, because that had already been done for
> > drm.ko itself.
> >
> > The core design bug is in the DECLARE_DYNDBG_CLASSMAP macro.  Its use
> > in both drm.ko (ie core) and all drivers.ko meant that they couldn't
> > fundamentally distinguish their respective roles.  They each
> > "re-defined" the classmap separately, breaking K&R-101.
> >
> > My ad-hoc test scripting helped to hide the error from me, by 1st
> > testing various combos of boot-time module.dyndbg=3D... and
> > drm.debug=3D... configurations, and then inadvertently relying upon
> > those initializations.
> >
> > This series addresses both failings:
> >
> > It replaces DECLARE_DYNDBG_CLASSMAP with
> >
> > - `DYNAMIC_DEBUG_CLASSMAP_DEFINE`: Used by core modules (e.g.,
> >    `drm.ko`) to define their classmaps.  Based upon DECLARE, it exports
> >    the classmap so USE can use it.
> >
> > - `DYNAMIC_DEBUG_CLASSMAP_USE`: this lets other "subsystem" users
> >    create a linkage to the classmap defined elsewhere (ie drm.ko).
> >    These users can then find their "parent" and apply its settings.
> >
> > It adds a selftest script, and a 2nd "sub-module" to recapitulate
> > DRM's multi-module "subsystem" use-case, including the specific
> > failure scenario.
> >
> > It also adds minor parsing enhancements, allowing easier construction
> > of multi-part debug configurations.  These enhancements are used to
> > test classmaps in particular, but are not otherwize required.
> >
> > Thank you for your review.
> >
> > P.S. Id also like to "tease" some other work:
> >
> > 1. patchset to send pr_debugs to tracefs on +T flag
> >
> >     allows 63 "private" tracebufs, 1 "common" one (at 0)
> >     "drm.debug_2trace=3D0x1ff" is possible
> >     from Lukas Bartoski
> >
> > 2. patchset to save 40% of DATA_DATA footprint
> >
> >     move (modname,filename,function) to struct _ddebug_site
> >     save their descriptor intervals to 3 maple-trees
> >     3 accessors fetch on descriptor, from trees
> >     move __dyndbg_sites __section to INIT_DATA
> >
> > 3. patchset to cache dynamic-prefixes
> >     should hide 2.s cost increase.
> >
> >
>
> Hi Jim,
>
> I just wanted to confirm my understanding that the class names here are
> 'global'. That is if say two different modules both used say the name
> "core" in their DYNAMIC_DEBUG_CLASSMAP_DEFINE() name array, then if the
> user did: echo "class core +p > control", then that would enable all the
> sites that had the class name "core" in both modules. One could add the
> "module" modifier to the request if needed.
>
> One could prepend the module name to the class names to make them unique
> but it's not much different from adding a separate 'module blah' in the
> request. So probably fine as is, but maybe worth calling out in the docs
> a bit?
>

Yes. that is correct. class CORE is global.
If 2 different DEFINE()s give that classname,
the defining modules will both respond to `class CORE +p > control`
but they will get independent int values (which could be the same, but
dont have to be)

DRM is our case in point.
I reused DRM_UT_CORE...
because I didnt have a good reason to change it
that said, Daniel Vetter noted that the _UT_ part doesnt have a real reason=
.
So theres some space for a discussion, when I resend that patchset.

`module drm class DRM_UT_CORE +p > control`
will narrow the query and avoid all the drivers/helpers,
which could be what someone wants.
class DRM_UT_CORE would select drivers and helpers too,
so the DRM_UT_  disambiguation is appropriate.

I'll reread the docs to see if theres a bit more I can add to further
explain this.
Do you have any suggestions for wording to achieve this ?

thx,
JIm



> Thanks,
>
> -Jason
