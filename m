Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59576A709AB
	for <lists+dri-devel@lfdr.de>; Tue, 25 Mar 2025 19:57:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3080710E292;
	Tue, 25 Mar 2025 18:57:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="gSM0c41/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com
 [209.85.222.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8078110E00A;
 Tue, 25 Mar 2025 18:57:14 +0000 (UTC)
Received: by mail-qk1-f170.google.com with SMTP id
 af79cd13be357-7c542ffec37so633327185a.2; 
 Tue, 25 Mar 2025 11:57:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742929033; x=1743533833; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Wc1b/KonmqQlWVjQyIDNx1PB8OnyCz3qh1Tew/uSRf8=;
 b=gSM0c41/gQS3DbtE+08PualIVWp9K+vaME9sEwID+CaVsWrNT9qRanZhBuw1ybkKva
 tOFUbmrCddmFBxHOdzMeNKlfc5lrCp80ET80a1amO02NenolvpKHArJA1gFL8KMhdwG/
 B5JNvTf+Phj39iIQU22OYgOL2+GB/WVdIoODLgBOa7bIDUEPOHob4JHXu5GPTL+vu89V
 dEC0OAUD/9cRgwrG93UCKeTpt5+8fdzw/+YibLQjBgMDW2PeOdhmeBOZyY5UyzxHQtuc
 1d0No+pnHivDvJ3fZFi/hxt1pwSxeam4oMwJJo4elbbovSB9E2UUJ943eOpqY5h7bqKD
 oZAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742929033; x=1743533833;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Wc1b/KonmqQlWVjQyIDNx1PB8OnyCz3qh1Tew/uSRf8=;
 b=OeROdaA7TjFtqdrFXROneyRkEZgORwQh+zOn2+sK+xpS9axKIpzD/ScsVBM3lP+LFg
 lYfYwH+gY9Vwy3iBpyrpZhG3G0uaLZ0egysGIFCms1vTbc6b37OSBAiOkBKpi0I24VMN
 8+4t0nym4oq3pAHDCa6F4dg/kDXCV5FkHz6mPARwtu0c7YC4m2Bpq/aKfaEJx6uV59/m
 UfKIWTAKTaOYXJJ9dDa4gkkRNhEvp6J86Q70sI/bxUc0ZCZkrrwo11g5rhLFkNnh/0hh
 NAqnc7Kwp9V7VKGkD2B5yxCYsny102jdIhyR5xr1VLtL2hO3dZHdx7pvWkmV4xgs5odQ
 MTkg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU8fE6SwTPP/PUHYhy0CTSsp00263oxGBkTjMvMdgXBUmItrtUusFWc1LSVo3gPKZJR0NHnV7RD@lists.freedesktop.org,
 AJvYcCUJMnzJx8vgLb9QjsnoMEFwP/LuC3UEbJp5NzIJpRibdHVvw4MYeMrLxSfQ26i/PMPSDB7nQR7/f+9XQqJGVmxU8w==@lists.freedesktop.org,
 AJvYcCVAsC3EOtTox3jG0U1PfuWWzEmtRAOl5Dj3j5vzbdFbX0LEnzIzhmQGHA1zrpasW5gWIE6IF3GgPxgH@lists.freedesktop.org,
 AJvYcCVhDCp7jgjIlIppA30a6JdB1H7q6lisPdcQUzcvWZyRkAJg3oEhJG5eN97aI32VG/OYQ85H7VbsEzdU@lists.freedesktop.org,
 AJvYcCW68nnnPPqf6gnoJ7lLHuDN/IECj6dSrGA5RfOYsbGmNME1W7oo6pz7NL0zDc95uB93YLwMRTNnEkoOzlyRpg==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzUYjBcv2QL8ed/4eZNihXDD+Vkp+bVEW85qRKaQJKVrRkjHtY8
 Bt2CJOEsgZjKvFlDLQLCQ6KdgydGgUfdVCShv0P/SqVrSnL7ncCUmhEqT0SQzvS/sJX3Yk2eOBi
 KLSy5D5MTfhZLWJodeqSpgOoF/bmzksNp
X-Gm-Gg: ASbGncsYpnUXqUiGWlznx9tKAcZX66IdlWUszhr8R7u4OPs9iemoECHR7OcHzShRLmE
 skSAydTc1t/6+BmT/H+m8th3fPMnGTQRxRfZXrx7Nts/svluE4ZVSxEVQAreIVfkMLdsir6LglR
 u2ngva66HzYxM1edA7rxxpEmBs
X-Google-Smtp-Source: AGHT+IHZrxz76tlBAchwWlwvG1UO5HlgQQvC8bUrjtin9ky9DD1ICNaN0M4Dchd5qiDKedF02gvCDAitk2nLkn591/E=
X-Received: by 2002:a05:6122:251b:b0:520:61ee:c7f9 with SMTP id
 71dfb90a1353d-525a84c5e96mr14236045e0c.7.1742929022532; Tue, 25 Mar 2025
 11:57:02 -0700 (PDT)
MIME-Version: 1.0
References: <20250320185238.447458-1-jim.cromie@gmail.com>
 <20250320185238.447458-45-jim.cromie@gmail.com>
 <c3514758-5a22-4acb-8ff0-1f4ddade02f4@bootlin.com>
In-Reply-To: <c3514758-5a22-4acb-8ff0-1f4ddade02f4@bootlin.com>
From: jim.cromie@gmail.com
Date: Tue, 25 Mar 2025 12:56:36 -0600
X-Gm-Features: AQ5f1JqwCZoNQkWvPRC6s-f7lWQaMvaFRZI7Bln1P_k3mQTyHi7JUmVlxPTmisg
Message-ID: <CAJfuBxw_OixCp0KsoYu9nH6=hprKJpKt7dkPT0hL-32syCTJ7A@mail.gmail.com>
Subject: Re: [PATCH v2 44/59] drm-dyndbg: add DRM_CLASSMAP_USE to Xe driver
To: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org, 
 intel-gfx@lists.freedesktop.org, intel-gfx-trybot@lists.freedesktop.org, 
 jbaron@akamai.com, gregkh@linuxfoundation.org, ukaszb@chromium.org, 
 daniel.vetter@ffwll.ch, tvrtko.ursulin@linux.intel.com, jani.nikula@intel.com, 
 ville.syrjala@linux.intel.com
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

On Mon, Mar 24, 2025 at 9:24=E2=80=AFAM Louis Chauvet <louis.chauvet@bootli=
n.com> wrote:
>
>
>
> Le 20/03/2025 =C3=A0 19:52, Jim Cromie a =C3=A9crit :
> > Invoke DRM_CLASSMAP_USE from xe_drm_client.c.  When built with
> > CONFIG_DRM_USE_DYNAMIC_DEBUG=3Dy, this tells dydnbg that Xe uses
> > has drm.debug calls.
> >
> > Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
> > ---
> >   drivers/gpu/drm/xe/xe_drm_client.c | 2 ++
> >   1 file changed, 2 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/xe/xe_drm_client.c b/drivers/gpu/drm/xe/xe=
_drm_client.c
> > index 2d4874d2b922..756dba5c88f8 100644
> > --- a/drivers/gpu/drm/xe/xe_drm_client.c
> > +++ b/drivers/gpu/drm/xe/xe_drm_client.c
> > @@ -21,6 +21,8 @@
> >   #include "xe_pm.h"
> >   #include "xe_trace.h"
> >
> > +DRM_CLASSMAP_USE(drm_debug_classes);
> > +
>
> Is xe_drm_client.c the best place to do it? I think the module entry
> point is a bit better [1].
>

yes perhaps.  I was drawn by the _client in the file-name.
Im not sure Im fully consistent, iirc the drivers get it near driver-iinit =
ops.


> [1]:https://elixir.bootlin.com/linux/v6.13.7/source/drivers/gpu/drm/xe/xe=
_module.c
>
> >   /**
> >    * DOC: DRM Client usage stats
> >    *
>
> --
> Louis Chauvet, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>
>
