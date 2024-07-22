Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE9779392E2
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jul 2024 18:59:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5C5910E222;
	Mon, 22 Jul 2024 16:59:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="UXb4iTjV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com
 [209.85.219.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0B3D10E20A
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jul 2024 16:59:30 +0000 (UTC)
Received: by mail-qv1-f52.google.com with SMTP id
 6a1803df08f44-6b5d3113168so26763226d6.2
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jul 2024 09:59:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1721667568; x=1722272368;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6Z5Ir7rhiBPr3RRCCNoLO7VsrsAMZfPkRGLwL8wNXLI=;
 b=UXb4iTjVJuG07mSHp2n9zBq1ZT7O2XZdkQtOtC1LCkDMEldMiPfEdXyOfVhI6gHMvA
 Uk+/rR+beXHHPkz0SF4rl88CrRiN1l2vNsxZO2jnU3XkZb5XnaseOQRMut9BvGc+AhWc
 OQ2wRHhjipc9oqm3bqIaXj8e3+KCpzZRx4WQI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721667568; x=1722272368;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6Z5Ir7rhiBPr3RRCCNoLO7VsrsAMZfPkRGLwL8wNXLI=;
 b=eJur95390eBPSCmci6SLP1RZ+lUy9MZNGHeULzTU6T5kDeveKgAyJ3Pmr7VETqTaN+
 lsYhemCU5HobLSTDnzRHvciu8UDLHjJ6p6c8k1CCivFmToI3YGKJNVfS+9IP9IZlcBQ1
 r8hsDkvCOL/g2xUzQrFvab92B8VC3YnAm0p/9HzrTuTW9ItCqYCP6fCaoFZFX/Q+aZEt
 N/h1ca7gI1IG71bAzjL6ZspS61+oTbfpGzbmx7TuKPc4FFnCFhewdhZejqRe8ukfFkCp
 kGD+NKyZUt6oZswXbMEtk5t2YEobrLcVVyCB2Uxlb4O5QGlqDmnmk5JmoXc9qLq3JdiZ
 6R0A==
X-Forwarded-Encrypted: i=1;
 AJvYcCW5n/IYY1FkAoU7vD30wbIm91MvMkUxfCUTS4/xbWr9E+agCMKK8lVaJHEqE6bl1x7roK0yLcQy/2tYMWH6Cn1PM3tqjim26Mr9os375VxQ
X-Gm-Message-State: AOJu0Yx6CDOunueRajbsZX2JMkyRe6tb4myUWkaoOlfeA14K7JJYcwmp
 UrNi7QBo/KU+jNi+iWoI2jFAuB5uY/NkTaLM8Gbe5vo0xYNOrDHOYeuoGjR5OHRe6ZvCLyCtS40
 =
X-Google-Smtp-Source: AGHT+IGnd5+x2/hMc9yeh//cA1U7sPi0ZWlBxf+4nlh7Dtg8tdR52sKU/S9dYPJ2yGPkIQlLa7LfHw==
X-Received: by 2002:a05:6214:1947:b0:6b7:b441:8fdf with SMTP id
 6a1803df08f44-6b981b6053fmr4828656d6.56.1721667568422; 
 Mon, 22 Jul 2024 09:59:28 -0700 (PDT)
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com.
 [209.85.160.171]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6b9743e0d5fsm12055236d6.114.2024.07.22.09.59.27
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Jul 2024 09:59:27 -0700 (PDT)
Received: by mail-qt1-f171.google.com with SMTP id
 d75a77b69052e-44e534a1fbeso768011cf.1
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jul 2024 09:59:27 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUONpSYsyfhha6vx3Gnsi1f1lZvDV80pj/6tXh0l+n7yPVq+okzTLSp24HkP1mnIYhLpZllI1vAhzKHcmalvpQscBYgBtFt7RnpR4l1suEw
X-Received: by 2002:ac8:5e4e:0:b0:447:d81a:9320 with SMTP id
 d75a77b69052e-44fa7da9b77mr4941551cf.20.1721667567117; Mon, 22 Jul 2024
 09:59:27 -0700 (PDT)
MIME-Version: 1.0
References: <20240716133117.483514-1-tejasvipin76@gmail.com>
 <p7fahem6egnooi5org4lv3gtz2elafylvlnyily7buvzcpv2qh@vssvpfci3lwn>
 <a05b4e6e-272a-43be-8202-2b81049a41a4@gmail.com>
 <CAA8EJpoRd3ooMnH8Z38yNH0M-L_CUd+H4WoYydd2AEmpXGeU8Q@mail.gmail.com>
 <CAD=FV=XDpEfTjTQbO-fZKKwgHCMUmCrb+FBr=3DMzVfs3on9XQ@mail.gmail.com>
 <758b3f44-5c8f-46b5-8f02-103601eae278@gmail.com>
In-Reply-To: <758b3f44-5c8f-46b5-8f02-103601eae278@gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 22 Jul 2024 09:58:53 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WiRfyteOKwhDm6-bP1yrRWqggDqqPr5=Exw6x9zzPYFg@mail.gmail.com>
Message-ID: <CAD=FV=WiRfyteOKwhDm6-bP1yrRWqggDqqPr5=Exw6x9zzPYFg@mail.gmail.com>
Subject: Re: [PATCH] drm/mipi-dsi: Introduce macros to create mipi_dsi_*_multi
 functions
To: Tejas Vipin <tejasvipin76@gmail.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 maarten.lankhorst@linux.intel.com, 
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

On Fri, Jul 19, 2024 at 10:19=E2=80=AFPM Tejas Vipin <tejasvipin76@gmail.co=
m> wrote:
>
> On 7/19/24 10:29 PM, Doug Anderson wrote:
> > Hi,
> >
> > On Wed, Jul 17, 2024 at 3:07=E2=80=AFAM Dmitry Baryshkov
> > <dmitry.baryshkov@linaro.org> wrote:
> >>
> >>>> However it might be better to go other way arround.
> >>>> Do we want for all the drivers to migrate to _multi()-kind of API? I=
f
> >>>> so, what about renaming the multi and non-multi functions accordingl=
y
> >>>> and making the old API a wrapper around the multi() function?
> >>>>
> >>>
> >>> I think this would be good. For the wrapper to make a multi() functio=
n
> >>> non-multi, what do you think about a macro that would just pass a
> >>> default dsi_ctx to the multi() func and return on error? In this case
> >>> it would also be good to let the code fill inline instead of generati=
ng
> >>> a whole new function imo.
> >>>
> >>> So in this scenario all the mipi dsi functions would be multi functio=
ns,
> >>> and a function could be called non-multi like MACRO_NAME(func) at the
> >>> call site.
> >>
> >> Sounds good to me. I'd suggest to wait for a day or two for further
> >> feedback / comments from other developers.
> >
> > I don't totally hate the idea of going full-multi and just having
> > macros to wrap anyone who hasn't converted, but I'd be curious how
> > much driver bloat this will cause for drivers that aren't converted.
> > Would the compiler do a good job optimizing here? Maybe we don't care
> > if we just want everyone to switch over? If nothing else, it might
> > make sense to at least keep both versions for the very generic
> > functions (mipi_dsi_generic_write_multi and
> > mipi_dsi_dcs_write_buffer_multi)
> >
> > ...oh, but wait. We probably have the non-multi versions wrap the
> > _multi ones. One of the things about the _multi functions is that they
> > are also "chatty" and print errors. They're designed for the use case
> > of a pile of init code where any error is fatal and needs to be
> > printed. I suspect that somewhere along the way someone will want to
> > be able to call these functions and not have them print errors...
> >
>
> I think what would be interesting is if we had "chatty" member as a
> part of mipi_dsi_multi_context as a check for if dev_err should run.
> That way, we could make any function not chatty. If we did this, is
> there any reason for a driver to not switch over to using the multi
> functions?

I'd be OK with that. My preference would be that "chatty" would be the
zero-initialized value just to make that slightly more efficient and
preserve existing behavior. So I guess the member would be something
like "quiet" and when 0 (false) it wouldn't be quiet.


> > Maybe going with Dmitry's suggested syntax is the best option here?
> > Depending on how others feel, we could potentially even get rid of the
> > special error message and just stringify the function name for the
> > error message?
> >
> The problem with any macro solution that defines new multi functions is
> that it creates a lot of bloat. Defining the function through macros
> might be smaller than defining them manually, but there are still twice
> as many function declarations as there would be if we went all multi.
> The generated code is still just as big as if we manually defined
> everything. I think a macro that defines functions should be more of a
> last resort if we don't have any other options.

Ah, somehow I was thinking that Dmitry's solution was conflated with
switching back to a macro. I haven't prototyped it, but I thought
Dmitry's primary complaint was that the syntax for declaring the
"_multi" function was a bit dodgy and I'd expect that using a macro
would solve that.

In any case, I'm good with keeping away from macros / bloating things.

-Doug
