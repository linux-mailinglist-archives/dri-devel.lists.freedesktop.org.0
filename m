Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D71C937B67
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jul 2024 18:59:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14BDF10EC69;
	Fri, 19 Jul 2024 16:59:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="mkvv+zul";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com
 [209.85.222.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A7B210EC69
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jul 2024 16:59:39 +0000 (UTC)
Received: by mail-qk1-f172.google.com with SMTP id
 af79cd13be357-79ef810bd4fso103887085a.2
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jul 2024 09:59:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1721408376; x=1722013176;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mNij9BWdWuGcrQHVif28kluwUpobJruqp79+yQUhfZQ=;
 b=mkvv+zul9jvD3/T+zR3OYdQsVFavp7s/kTV+fjprg490RGhmgje/0VfuV7v8FQU6DZ
 5/s8YfFMDT11nfHQ6ELavbZIzSpAncTD4qn4ufxoZDycCVW+ReZgk6DMi//v2aHNOJ5h
 9FePxeQwdecqFBiwZtBfxceT2X3oMdwdaIaYI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721408376; x=1722013176;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mNij9BWdWuGcrQHVif28kluwUpobJruqp79+yQUhfZQ=;
 b=xUdzTo+4BIkpLix/eQprzmfAsjrz17Mq+e7w5f1Qz6dCvBpSDdvJfHs79fQwC5HRq7
 yWbxN7Li8ujJJrpW9tNqRDrXfScZUKFOlx0DGgslm8CVjeo+8ItrG2SYb00zeJGSHMzh
 Z144CD4VKoCf2IpnWni3R1k4JnEYwE/u92lBOg63VzwGQDOPWDVsx/Xw6Ptyq+gIPJeP
 mTig6njzP6DF3a9L1oPZv1/F+0WWtjEIxBB4iooqDBI/MIpMUdfv+cIFEcu2ZlakDMvy
 L1cfjIle3IrH3ZpPWcK8oRuX+sKFtrViEAqZQLndCyqTmhWMrRck1DN0SPeXK8+cv7bD
 tE8w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVSKClLnkFBaVzAKDcFFI4mq5koMo+0JhMNkSNApw6FTARNKu8R7ey3jLVsyaq7JEbeOJRzsA4mlz6ER+hBPCcJDvLRyPiQs7vmyY5dsH1s
X-Gm-Message-State: AOJu0YwF7wpnqk3B43iEWo3PomM7MVchv/HXy/FpQqZW+jMuFcV/bvTI
 6MsQ/C2/Ps2IQ5scZWCqyiE1BIkoIQNmLFktm9VC3TblUo9IL5CIpuyW7r3ug/Sxt3e7nHnh6BQ
 =
X-Google-Smtp-Source: AGHT+IG8JtlxpjcLZjPezB2OXVz3/pU6jWCYuwfvs7+YIT9WCVkta9gDhbkgUw3CBibe7DV6C5Up+A==
X-Received: by 2002:a05:620a:448a:b0:79d:6cb6:a7b8 with SMTP id
 af79cd13be357-7a187446f13mr939795485a.1.1721408376295; 
 Fri, 19 Jul 2024 09:59:36 -0700 (PDT)
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com.
 [209.85.160.169]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7a19905a909sm107733385a.73.2024.07.19.09.59.35
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Jul 2024 09:59:35 -0700 (PDT)
Received: by mail-qt1-f169.google.com with SMTP id
 d75a77b69052e-44e534a1fbeso252071cf.1
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jul 2024 09:59:35 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCU3c760kOhL5WQTTgYsuI2/cWEXBYzXJzea20WKIWi4usIqt2/anWUkHMMvWg72UlPzx4GD9ZWF85wV5avtEXcpTRDpXx7ycsYB5CfdGLqt
X-Received: by 2002:a05:622a:4c8c:b0:444:ccc5:f4c0 with SMTP id
 d75a77b69052e-44f9c8061a9mr3439471cf.15.1721408374666; Fri, 19 Jul 2024
 09:59:34 -0700 (PDT)
MIME-Version: 1.0
References: <20240716133117.483514-1-tejasvipin76@gmail.com>
 <p7fahem6egnooi5org4lv3gtz2elafylvlnyily7buvzcpv2qh@vssvpfci3lwn>
 <a05b4e6e-272a-43be-8202-2b81049a41a4@gmail.com>
 <CAA8EJpoRd3ooMnH8Z38yNH0M-L_CUd+H4WoYydd2AEmpXGeU8Q@mail.gmail.com>
In-Reply-To: <CAA8EJpoRd3ooMnH8Z38yNH0M-L_CUd+H4WoYydd2AEmpXGeU8Q@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 19 Jul 2024 09:59:22 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XDpEfTjTQbO-fZKKwgHCMUmCrb+FBr=3DMzVfs3on9XQ@mail.gmail.com>
Message-ID: <CAD=FV=XDpEfTjTQbO-fZKKwgHCMUmCrb+FBr=3DMzVfs3on9XQ@mail.gmail.com>
Subject: Re: [PATCH] drm/mipi-dsi: Introduce macros to create mipi_dsi_*_multi
 functions
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Tejas Vipin <tejasvipin76@gmail.com>, maarten.lankhorst@linux.intel.com, 
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
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

Hi,

On Wed, Jul 17, 2024 at 3:07=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> > > However it might be better to go other way arround.
> > > Do we want for all the drivers to migrate to _multi()-kind of API? If
> > > so, what about renaming the multi and non-multi functions accordingly
> > > and making the old API a wrapper around the multi() function?
> > >
> >
> > I think this would be good. For the wrapper to make a multi() function
> > non-multi, what do you think about a macro that would just pass a
> > default dsi_ctx to the multi() func and return on error? In this case
> > it would also be good to let the code fill inline instead of generating
> > a whole new function imo.
> >
> > So in this scenario all the mipi dsi functions would be multi functions=
,
> > and a function could be called non-multi like MACRO_NAME(func) at the
> > call site.
>
> Sounds good to me. I'd suggest to wait for a day or two for further
> feedback / comments from other developers.

I don't totally hate the idea of going full-multi and just having
macros to wrap anyone who hasn't converted, but I'd be curious how
much driver bloat this will cause for drivers that aren't converted.
Would the compiler do a good job optimizing here? Maybe we don't care
if we just want everyone to switch over? If nothing else, it might
make sense to at least keep both versions for the very generic
functions (mipi_dsi_generic_write_multi and
mipi_dsi_dcs_write_buffer_multi)

...oh, but wait. We probably have the non-multi versions wrap the
_multi ones. One of the things about the _multi functions is that they
are also "chatty" and print errors. They're designed for the use case
of a pile of init code where any error is fatal and needs to be
printed. I suspect that somewhere along the way someone will want to
be able to call these functions and not have them print errors...

Maybe going with Dmitry's suggested syntax is the best option here?
Depending on how others feel, we could potentially even get rid of the
special error message and just stringify the function name for the
error message?

-Doug
