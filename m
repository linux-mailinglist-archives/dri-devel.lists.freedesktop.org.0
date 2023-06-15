Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AAC02730CFE
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jun 2023 04:02:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3ED9C10E0FE;
	Thu, 15 Jun 2023 02:02:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83DE110E0FE
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jun 2023 02:02:24 +0000 (UTC)
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-2b344476313so19649501fa.3
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jun 2023 19:02:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1686794540; x=1689386540;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yWURV6WhlNOJavnCVMftL3VNvBn19BVJFQP7jTmgUlQ=;
 b=ArrfkEDaBmcPXNaVY2jSil6n5a1beS0dAzgKkhBM9DC8N/08MJzw7c4Vdjex1oLRgW
 ZHZuQf9OyQfy+YmkO37VuHCF9erYw0MMt4L29trmfFWzKvCjSqyrFydWbyZvIbk4Jk/O
 9xO8n7rlmzfHs/7qtUkvGNfBqct8kuaZNFWHk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686794540; x=1689386540;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yWURV6WhlNOJavnCVMftL3VNvBn19BVJFQP7jTmgUlQ=;
 b=DOXczsijVH4mrU53tCIq6+hucl++Xh2PV0BH3wtJAQ46qjh6Plrhful34QKmHb5OPP
 JlYPgWEzOykPdz3H4Wn+x9umL7RBBYkimJX1z1qzAUzBR1snbK4IohHMLmOpUNv3RlDW
 WKUMu2dTD1axSY8+wBqT+gOK5liIsfJb7/UYKUdBOsRxt7JTWL4fQ4Y5NIzE/JkGhq4O
 +ahsNPnk16SHlSJaU0UU+GH84U5LydfKN3IgSo1Ws3SYImMAAS4vPqqvMaOn6UwxoQBM
 wVBHi6B5Audml0YsOJgbb/KOXF65bs4du1ktfn2U1CdNjN26x0q18cZrnnQJISsrNZ+F
 G/IA==
X-Gm-Message-State: AC+VfDz9s9rtl4g884bvzf0rZl8QWRLEF6/jkHlJC/Ckgg26qO8vKwz5
 ntYgZURdsQrMTkLccL8sdpmx+rEhC39gu7T4GF4EQYk+
X-Google-Smtp-Source: ACHHUZ4ZmvBmwivFkx4kKevIc4t/LOgpt6ZcIAK/Zv+edVffeoy8cG6P4XjDnTTKXe8I0hlKu48oLw==
X-Received: by 2002:a2e:8e91:0:b0:2b4:44fe:a6d7 with SMTP id
 z17-20020a2e8e91000000b002b444fea6d7mr248819ljk.21.1686794539793; 
 Wed, 14 Jun 2023 19:02:19 -0700 (PDT)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com.
 [209.85.167.42]) by smtp.gmail.com with ESMTPSA id
 i1-20020a2e9401000000b002b323126037sm1874322ljh.81.2023.06.14.19.02.18
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Jun 2023 19:02:18 -0700 (PDT)
Received: by mail-lf1-f42.google.com with SMTP id
 2adb3069b0e04-4f76386e0daso918e87.1
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jun 2023 19:02:18 -0700 (PDT)
X-Received: by 2002:a05:6512:79:b0:4f7:5f7d:2f9b with SMTP id
 i25-20020a056512007900b004f75f7d2f9bmr35250lfo.1.1686794538084; Wed, 14 Jun
 2023 19:02:18 -0700 (PDT)
MIME-Version: 1.0
References: <20230612182527.3345786-1-dmitry.baryshkov@linaro.org>
In-Reply-To: <20230612182527.3345786-1-dmitry.baryshkov@linaro.org>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 14 Jun 2023 19:02:05 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VoF0TKnC5Yuwmt90UZORCZonO3mS74T3X50Oz22TwT2A@mail.gmail.com>
Message-ID: <CAD=FV=VoF0TKnC5Yuwmt90UZORCZonO3mS74T3X50Oz22TwT2A@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/adreno: make adreno_is_a690()'s argument const
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
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
Cc: Sean Paul <sean@poorly.run>, Bjorn Andersson <andersson@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, linux-arm-msm@vger.kernel.org,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Mon, Jun 12, 2023 at 11:25=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> Change adreno_is_a690() prototype to accept the const struct adreno_gpu
> pointer instead of a non-const one. This fixes the following warning:
>
> In file included from drivers/gpu/drm/msm/msm_drv.c:33:
> drivers/gpu/drm/msm/adreno/adreno_gpu.h: In function =E2=80=98adreno_is_a=
660_family=E2=80=99:
> drivers/gpu/drm/msm/adreno/adreno_gpu.h:303:54: warning: passing argument=
 1 of =E2=80=98adreno_is_a690=E2=80=99 discards =E2=80=98const=E2=80=99 qua=
lifier from pointer target type [-Wdiscarded-qualifiers]
>   303 |         return adreno_is_a660(gpu) || adreno_is_a690(gpu) || adre=
no_is_7c3(gpu);
>
> Fixes: 1b90e8f8879c ("drm/msm/adreno: change adreno_is_* functions to acc=
ept const argument")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/gpu/drm/msm/adreno/adreno_gpu.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
