Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C220B9D6188
	for <lists+dri-devel@lfdr.de>; Fri, 22 Nov 2024 16:51:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A09AE10EBF2;
	Fri, 22 Nov 2024 15:51:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="DGZ8nPDw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f43.google.com (mail-io1-f43.google.com
 [209.85.166.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40BC310EBF2;
 Fri, 22 Nov 2024 15:51:53 +0000 (UTC)
Received: by mail-io1-f43.google.com with SMTP id
 ca18e2360f4ac-83ac4dacaf9so79442639f.2; 
 Fri, 22 Nov 2024 07:51:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1732290712; x=1732895512; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=z3uDWbNNWfkF0p1VhsZQPfqHnOGEpm0encXAZ7Sy8g0=;
 b=DGZ8nPDw/1qWBvYVi0Gkler9WT6x8RqHgpT2MkC6txxnzcBIjxQ9Q2AV5vRe20wjwv
 ARL03AMrLOuyjSqvcO7iKj9nhvrvIcsuKWvS7noA5FEj+MU8VCk85zIsJqHv7B2P+k6H
 T3x5/i6GMeMDNguqThCPmYo99w8JtDITqlNFQTVqm8J0GHDUTo3iYtBDIrqKLEg5lLnG
 Dzx7QFB7rHG2GDbpie+tWMJmEV+4D9cMSoVIyC0WID7JxrusbfUsqagv9Xay8DJ63ZrK
 arAExc1mjU7F7H4mSczHXj9JJpr5p6yN9ZoUaP27Wv/RGc94+itA35NHUqihk3mCnX1r
 6Vag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732290712; x=1732895512;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=z3uDWbNNWfkF0p1VhsZQPfqHnOGEpm0encXAZ7Sy8g0=;
 b=ARRLd0n0Mxw2xfuzjKa3EaDuixD4undBJgY13UsjxlKuVlT+X1rIEHuBtz5XFcUka5
 LHGrg305aQgWqtkxrG8ib0UsaDTPHJj5Mj92kY0tDaKR1vb+n0L+WstYIwqwZMNsByqO
 dYBtZ53nYKhjvVZt09Jh9iUKeMmvXqRCZWOs6KQOPnHfFy/C/Aw+pdDu7ypWuJfAopaF
 +6RVrz6qJmeMxjnzorOUFrtolOdJgUmy9PJFcRpsalYhJYZff+X88DtaqAvnxOGQu4V2
 yQ41YZUdlPwjMNo3jwH2yxNTk45qHsH4XSbQjzZgtlWnPp0HUSztrGw9cLtElRbIx+Eg
 PCsQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUKPPVnEZSd/Rx+VP+Bt84GxINTBj2gjPA+J5vbePwmnUYZ51PHxAvB7DxC7j+OawdkiheUh5JJ71c=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyTjKE2dPj+4ZtLPd50hQDE+J4mfhh7sMP1XbX7F0vO2HIWYh9O
 DM1RZh1aQDoHm4vPiaRSReLcvo18+18nCI60zrkWkV9zXSyR8BupeRausDWOK+Ch9oZIdbhFyrN
 oZu+3bFCH0ezGo+LhZu7dpnjcYiw=
X-Gm-Gg: ASbGncuXzRcNs1+Bb1z2uHFRXAFhrPmoh7ht2J9bqAD3FhlCkuXQXuvtZZHOKQmQpeJ
 lhPE726/sjwwnDNKEJ1v7Zh/vnlvrFtfVCPjE2gQ2OmwiIs6VfrhXxaTFIKjfIQ==
X-Google-Smtp-Source: AGHT+IEmliz4spJROdLvbi9Jn1TCz/7JIiW2hFkXxCknMwyZDt+D+vscIFSEGuewCzsuk6Df/rQ+Qukh9F3P0iKGWrs=
X-Received: by 2002:a05:6602:2cd2:b0:83b:7164:ebb4 with SMTP id
 ca18e2360f4ac-83ecdd13818mr362392539f.14.1732290712314; Fri, 22 Nov 2024
 07:51:52 -0800 (PST)
MIME-Version: 1.0
References: <20241121164858.457921-1-robdclark@gmail.com>
 <54601d79-4156-41f4-b1b7-250c5c970641@oss.qualcomm.com>
In-Reply-To: <54601d79-4156-41f4-b1b7-250c5c970641@oss.qualcomm.com>
From: Rob Clark <robdclark@gmail.com>
Date: Fri, 22 Nov 2024 07:51:40 -0800
Message-ID: <CAF6AEGtafQM7-mYy163Krry3OHgPNH3e9A=9VEhBpiQTADtULQ@mail.gmail.com>
Subject: Re: [PATCH] drm/msm: UAPI error reporting
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
 freedreno@lists.freedesktop.org, Rob Clark <robdclark@chromium.org>, 
 Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, open list <linux-kernel@vger.kernel.org>
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

On Fri, Nov 22, 2024 at 4:21=E2=80=AFAM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 21.11.2024 5:48 PM, Rob Clark wrote:
> > From: Rob Clark <robdclark@chromium.org>
> >
> > Debugging incorrect UAPI usage tends to be a bit painful, so add a
> > helper macro to make it easier to add debug logging which can be enable=
d
> > at runtime via drm.debug.
> >
> > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > ---
>
> [...]
>
> > +/* Helper for returning a UABI error with optional logging which can m=
ake
> > + * it easier for userspace to understand what it is doing wrong.
> > + */
> > +#define UERR(err, drm, fmt, ...) \
> > +     ({ DRM_DEV_DEBUG_DRIVER((drm)->dev, fmt, ##__VA_ARGS__); -(err); =
})
> > +
> >  #define DBG(fmt, ...) DRM_DEBUG_DRIVER(fmt"\n", ##__VA_ARGS__)
> >  #define VERB(fmt, ...) if (0) DRM_DEBUG_DRIVER(fmt"\n", ##__VA_ARGS__)
>
> I'm generally not a fan of adding driver-specific debug prints..
>
> Maybe that's something that could be pushed to the drm-common layer
> or even deeper down the stack?

Even if we had something like DRM_DBG_UABI_ERROR() I'd probably still
just #define UERR() to be a wrapper for it, since line length/wrapping
tends to be a bit of a challenge.  And I have a fairly substantial
patch stack on top of this adding sparse/vm_bind support.  (Debugging
that was actually the motivation for this patch.)

I noticed that xe has something similar, but slightly different shape,
in the form of XE_IOCTL_DBG().. but that kinda just moves the line
length problem into the if() conditional.  (And doesn't provide the
benefit of being able to display the incorrect param.)

BR,
-R
