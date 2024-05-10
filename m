Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC7DC8C2C20
	for <lists+dri-devel@lfdr.de>; Fri, 10 May 2024 23:54:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4869710E2AD;
	Fri, 10 May 2024 21:54:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="Ew8CfFgA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com
 [209.85.128.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D09710E2AD
 for <dri-devel@lists.freedesktop.org>; Fri, 10 May 2024 21:54:09 +0000 (UTC)
Received: by mail-yw1-f171.google.com with SMTP id
 00721157ae682-620390308e5so23096217b3.3
 for <dri-devel@lists.freedesktop.org>; Fri, 10 May 2024 14:54:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1715378048; x=1715982848;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rt6iJAjgKn/wqu2ZEGbXptum/Kwuofy0xQtcrLEeDd0=;
 b=Ew8CfFgAYEOy7UQn9dL/KKEHGm969BQ9E5FgDLsKL0xt3cAJI1oxFFnrmOyXqWASOG
 BLlOt2gHmh36hDZIS6KYzopRnWLKT7+dWL3B9F4/m2rlBVGjOeymFTbAkvTA+0366Q6V
 21pjdr6zErafjY+eMLYLSq7odMBIYqS8bi+2E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715378048; x=1715982848;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rt6iJAjgKn/wqu2ZEGbXptum/Kwuofy0xQtcrLEeDd0=;
 b=Ep7iTnYCMHPFnP59/Uaf4/Od79wGPXGc3SjPHmHdWIbbFDAWxuq3yjnJKBafPjqsSz
 kvI4DVKSMeEerkuBs6lUrcUli8B1MiPiSOOiuEejXd8OjzzgxHHb2qlriiYczYazrX+I
 qMhLMBTXDxk0Fz8ivIgof9A2ehEzfgpQRIWyUP4Bt+P2Dgl9U6ndhHdJyWS8GPpjy2KV
 sNdCj/LV2/4dkzJ0ThYGCYZhCQyF8zFOZxHCGSzaKMjloK3J1WVTzpfrVguC7lLYWbBt
 RZff2xe6DVoQY67DJb0KShrT5OwCunMhdl0CwsrAZ8nioa70fRE55DbK3VJ3udeC7K3D
 zDLQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWkxJmKisvqoCdmJ0gcc1SR0G9LMk8ivyJAgAJKV6kibfS2UODXSbRLd7YYkYVaw9iY3scPGVgoHxP3RoCvgmM8JpiUOwqB6FHmpY6CDUbe
X-Gm-Message-State: AOJu0YzfeRWoHC4Xgp4zqPWTKLZeyZ9Agt0QKOYbBSJ7zMYjXu1ARTOo
 by9phRzkJ9qxXhcUnwuBLSCsnjdbC39gQUmi9J6cIkHyjc6WpbPtJ/vyKLslaZcMzFZVkankom8
 =
X-Google-Smtp-Source: AGHT+IFZZ6p22fUmViszt22UYL1wQT/sEQBsLEJ7xiRKdcVuCnO9YgYvI9r/PzttOCwv3Fll2N7iDQ==
X-Received: by 2002:a81:4e06:0:b0:61a:b7c8:ea05 with SMTP id
 00721157ae682-622b001ec63mr43501417b3.35.1715378047412; 
 Fri, 10 May 2024 14:54:07 -0700 (PDT)
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com.
 [209.85.160.171]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-43df569f78bsm25339091cf.61.2024.05.10.14.54.07
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 May 2024 14:54:07 -0700 (PDT)
Received: by mail-qt1-f171.google.com with SMTP id
 d75a77b69052e-43dfe020675so144551cf.0
 for <dri-devel@lists.freedesktop.org>; Fri, 10 May 2024 14:54:07 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCWFQAF7WP5ApwS+/4bnWBuKHLmo3omB5E6JjH21HKsxAd+lc3KVadt0tB9b1A03j/pwBcsgpCh28OzyJJzhh+hRznHPuyJ4zLP/lTfTZdGM
X-Received: by 2002:a05:622a:2610:b0:437:c4ae:f3b4 with SMTP id
 d75a77b69052e-43e09557d5bmr805221cf.26.1715377642591; Fri, 10 May 2024
 14:47:22 -0700 (PDT)
MIME-Version: 1.0
References: <20240510-dsi-panels-upd-api-v1-0-317c78a0dcc8@linaro.org>
 <20240510-dsi-panels-upd-api-v1-7-317c78a0dcc8@linaro.org>
In-Reply-To: <20240510-dsi-panels-upd-api-v1-7-317c78a0dcc8@linaro.org>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 10 May 2024 14:47:10 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Vs4-vWby5YXxzbb1881DjeFWm0fRQCkPTDJYzTX61wSA@mail.gmail.com>
Message-ID: <CAD=FV=Vs4-vWby5YXxzbb1881DjeFWm0fRQCkPTDJYzTX61wSA@mail.gmail.com>
Subject: Re: [PATCH RFC 7/7] drm/panel: lg-sw43408: use new streamlined MIPI
 DSI API
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Sam Ravnborg <sam@ravnborg.org>, Sumit Semwal <sumit.semwal@linaro.org>, 
 Caleb Connolly <caleb.connolly@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Vinod Koul <vkoul@kernel.org>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
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

On Thu, May 9, 2024 at 3:37=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> Use newer mipi_dsi_*_multi() functions in order to simplify and cleanup
> panel's prepare() and unprepare() functions.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/gpu/drm/panel/panel-lg-sw43408.c | 95 +++++++++++++-------------=
------
>  1 file changed, 37 insertions(+), 58 deletions(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
