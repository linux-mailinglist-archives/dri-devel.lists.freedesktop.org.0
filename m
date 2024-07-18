Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B453B937101
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jul 2024 01:10:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 370C410EB3F;
	Thu, 18 Jul 2024 23:10:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="NXS+Pu4m";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com
 [209.85.160.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D281010EB3F
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jul 2024 23:10:32 +0000 (UTC)
Received: by mail-qt1-f174.google.com with SMTP id
 d75a77b69052e-449537c62d1so3976161cf.1
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jul 2024 16:10:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1721344228; x=1721949028;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Y8/jfrbQkF4NocC2ktC4TuqIHUerHtNF+x1nkqsRqBY=;
 b=NXS+Pu4mT/l8vNx3AH9sCDWlxVfckvv0Uc/B+D69j4+/DoL0fMjgoxckHEkyVrSZIT
 t2t1kIzIMtVeHi799h/XaQlg+heq+i+V2+/gPLtSI/C5585hu4tQlVyB31Xxtyg1Tcd1
 yXhmKp7c+MI3/imC1cIlo7rk9Yn1QapJOLLOo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721344228; x=1721949028;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Y8/jfrbQkF4NocC2ktC4TuqIHUerHtNF+x1nkqsRqBY=;
 b=hYFF4LQW+HCipUp4VZRQaRXgkq1h/RpVG3tHv9apHQN6EGSef36zoOLUWbNFn1TIvb
 uUntWbWX3hgdZ3RdpQwHeZAxFogvFBS9jaL1t/IF0JdtOzC9OvWdZJgdwJuBltWFmrBf
 /neaiQ+2gC+c+11KOtmV/QUJKCEfKxxwI8sqQHbmcx0tJ9XIyP5e52NGUSgIJs4/NhDE
 URKBuQKzRjbOX6espYwxL5bI9SlfOd2+MiyjQqTdd5RwVQnIxrVPNvZeK58NT3fiz6Q4
 l9IPZESB9JNGxWESF8GeHzlo8HvWvb3WPwOIoRIiyk48rJ3EAVremYTSD52osXdijnTm
 AIyw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUXPa0hDFsLbHe7NtgBm61FfVsco3K1KxMGmHnkF35IhFhPQSPkz3HhL9S4WGs/2Bv6E+QqpN9MyUyUWAtnwyiTp2Y4aWzfEAMb3nz3tDSm
X-Gm-Message-State: AOJu0YxZfjAikJixc+M4MzlSKdL0h47x0wCKIFz9bI5dhAmAcDRtp3nz
 0vx2EXBk77i58KAwkIx4d9fVhQPVrcLMgTWZW3A73Vq8+TZyeNnu5A5BETPzvCge2iCdd+mfoN8
 =
X-Google-Smtp-Source: AGHT+IGJvoRYMssqpBFblRQ/MTgLuRF3iDsEdMJTKWUsppS/IP/tkTYRsJT70z1hIektK/b2h2jovA==
X-Received: by 2002:ac8:590b:0:b0:447:ecb5:3876 with SMTP id
 d75a77b69052e-44f96ac5b8bmr34195501cf.52.1721344228368; 
 Thu, 18 Jul 2024 16:10:28 -0700 (PDT)
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com.
 [209.85.160.180]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-44f9cd032e5sm871341cf.25.2024.07.18.16.10.27
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Jul 2024 16:10:27 -0700 (PDT)
Received: by mail-qt1-f180.google.com with SMTP id
 d75a77b69052e-44e534a1fbeso52011cf.1
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jul 2024 16:10:27 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCXAXyAjsc4eX3xEpY0VAXM9L3AvcBvLBjZDPu+CAUIsVEchp0a1IaZagErBKZqw7TOGvLp250P3kvpG48joy1h387Sd/G5bptCI1+FJqGip
X-Received: by 2002:ac8:4cc6:0:b0:447:e0a6:9163 with SMTP id
 d75a77b69052e-44f9ac92860mr946841cf.14.1721344226869; Thu, 18 Jul 2024
 16:10:26 -0700 (PDT)
MIME-Version: 1.0
References: <20240718184434.6307-1-robdclark@gmail.com>
 <20240718184434.6307-2-robdclark@gmail.com>
In-Reply-To: <20240718184434.6307-2-robdclark@gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 18 Jul 2024 16:10:15 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VmM=Qgm8e-uTF4OMk5-qnpdgb=6fFDFt3v=WCAujUU3w@mail.gmail.com>
Message-ID: <CAD=FV=VmM=Qgm8e-uTF4OMk5-qnpdgb=6fFDFt3v=WCAujUU3w@mail.gmail.com>
Subject: Re: [PATCH 2/3] drm/panel: samsung,
 atna33xc20: Add compatible for ATNA45DC02
To: Rob Clark <robdclark@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Abel Vesa <abel.vesa@linaro.org>, 
 Rob Clark <robdclark@chromium.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>
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

On Thu, Jul 18, 2024 at 11:44=E2=80=AFAM Rob Clark <robdclark@gmail.com> wr=
ote:
>
> From: Rob Clark <robdclark@chromium.org>
>
> The Samsung ATNA45DC02 panel needs the same power sequencing as the
> ATNA45AF01 and ATNA33XC20.
>
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  drivers/gpu/drm/panel/panel-samsung-atna33xc20.c | 1 +
>  1 file changed, 1 insertion(+)

I believe this patch should be dropped and, until there is special
logic needed for "samsung,atna45dc02" we can just rely on the fallback
compatible ("samsung,atna33xc20") matching.

-Doug
