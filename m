Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3873288D0C3
	for <lists+dri-devel@lfdr.de>; Tue, 26 Mar 2024 23:25:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0420D10F3FD;
	Tue, 26 Mar 2024 22:25:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Gb2kdBWp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com
 [209.85.219.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B72CE10F3FC
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Mar 2024 22:25:31 +0000 (UTC)
Received: by mail-yb1-f180.google.com with SMTP id
 3f1490d57ef6-dc6dcd9124bso5919233276.1
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Mar 2024 15:25:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1711491930; x=1712096730; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=3dOnXvDtR1ZmPGDB+HPKB5I6v7/354f5+TzY/Xk/FFQ=;
 b=Gb2kdBWpYPDgOzAdgVG/YCrlUnPxDetbAZe+TiSC4aRjX/Up7SqP5U5yOESrEY9OSY
 J7wDKvFBP/LEZgYAU3M33n2dK4QV9KRQAI7VODiuXq1NOX5Ejgt8sEAZkAQ7ZjhixfSF
 kqh9BPUWgQwAgrT6OusCdYivqQnBRyDRpecsFMMcuVY5Pzz/cKGcGYXfG33VoQuCjl2w
 /vnJBPpphaceNfFUiU20YId5MQN4Y7pWRU7dE2938awCoknvOWVRON8eve0onsS2LoJU
 d9gjIwE8rTnfNQTWA06vzItgdmkGY1X+3fHvqpF5T1/9yBitmAas/a0BktKjgjT6J2Dg
 ZiCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711491930; x=1712096730;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3dOnXvDtR1ZmPGDB+HPKB5I6v7/354f5+TzY/Xk/FFQ=;
 b=jmmLuzu3C1k3jpCsGcMyaLgnPfkR0mUBS+Nc6ypxD5BQIlDuUJEzGxrSg0gvtp2Tkb
 HsGDckzcQZYxppPkNjIdbGDHZTwFzvGlKhZR+DZMFtEmTyuPo19JFNgT4HnwW7ng9IR9
 SdtM+Gp+sbMLjxL7atS5gsWQBTaKIZcn+C6HVVUhKSPm7PE6x44UdYDvTrCgeASNjeTZ
 Sb7KaFaLDbhwUk7+3ZIinKfjPKhn/84P/hx6w7l6zHnK4O728VQK3UlRQNCa+hMmLP/j
 ltaKiohUqsuX9186JOyjYqvRPXSYfTrsWYvPwVGmJ6OTQFD+49Modxf/Zuh9vlijDto1
 DMDQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUgqIDbhln4nwoSh2hqEb/ug2AQGyiniZtJf5SDD7+J1a0S1osRJIwv2ilJ1STAboa9giXb06ixo7JDNwZ4sipfHa2QWSYRDnglZUilkCC+
X-Gm-Message-State: AOJu0Yx8OW04F6U/dj2KhFkROZO3LOwyzKkaHuiBXkGLY1JscAv1eaZS
 lZCVad/EM/W4rsGBGBre/8G/bMayjIIX38izgfJX7M8Eps3SJyk2kIELE6UXvoRs8EEOQCmUgF5
 CdLB/I9Py8/W0hzkaYJ/DeqNSH2Gd3JZo5MKlwg==
X-Google-Smtp-Source: AGHT+IHwP/VQYXSJY8boUvlnYpU9XYRDMYCIvQHPAfNdssF4udkpcZrs+Wcd7aiGb0FDo2fOx1SpFfj5CMA+/MWpqcU=
X-Received: by 2002:a25:df54:0:b0:dcd:4878:1f9 with SMTP id
 w81-20020a25df54000000b00dcd487801f9mr1108120ybg.8.1711491930685; Tue, 26 Mar
 2024 15:25:30 -0700 (PDT)
MIME-Version: 1.0
References: <20240323-fd-xml-shipped-v4-0-cca5e8457b9e@linaro.org>
 <20240323-fd-xml-shipped-v4-9-cca5e8457b9e@linaro.org>
 <510de518-da75-f0c4-479d-c5f95c7c72b6@quicinc.com>
In-Reply-To: <510de518-da75-f0c4-479d-c5f95c7c72b6@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 27 Mar 2024 00:25:19 +0200
Message-ID: <CAA8EJpry2dHyBF4wyXeFAyLu+9_tYg3xyP6eAM7RzJzOiOqypA@mail.gmail.com>
Subject: Re: [PATCH v4 09/16] drm/msm: import gen_header.py script from Mesa
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>, 
 Nicolas Schier <nicolas@fjasle.eu>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, linux-kbuild@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
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

On Wed, 27 Mar 2024 at 00:19, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 3/22/2024 3:57 PM, Dmitry Baryshkov wrote:
> > Import the gen_headers.py script from Mesa, commit FIXME. This script
> > will be used to generate MSM register files on the fly during
> > compilation.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >   drivers/gpu/drm/msm/registers/gen_header.py | 957 ++++++++++++++++++++++++++++
> >   1 file changed, 957 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/msm/registers/gen_header.py b/drivers/gpu/drm/msm/registers/gen_header.py
> > new file mode 100644
> > index 000000000000..ae39b7e6cde8
> > --- /dev/null
> > +++ b/drivers/gpu/drm/msm/registers/gen_header.py
> > @@ -0,0 +1,957 @@
> > +#!/usr/bin/python3
> > +
>
> We need a licence and copyright here.

Yes, this is going to be fixed in the next revision. Mesa already got
the proper SPDX header here.

>
> Also is something like a "based on" applicable here?
>
> <snip>
>
> > +import xml.parsers.expat
> > +import sys
> > +import os
> > +import collections
> > +import argparse
> > +import time
> > +import datetime
> > +
> > +class Error(Exception):
> > +This file was generated by the rules-ng-ng gen_header.py tool in this git repository:
> > +http://gitlab.freedesktop.org/mesa/mesa/
> > +git clone https://gitlab.freedesktop.org/mesa/mesa.git
> > +
> > +The rules-ng-ng source files this header was generated from are:
>
> Is this still applicable ?
>
> Now gen_header.py is moved to kernel.
>

Copied, not moved. So Mesa remains the primary source for Adreno
headers and gen_header.py


-- 
With best wishes
Dmitry
