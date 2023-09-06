Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 448357945EA
	for <lists+dri-devel@lfdr.de>; Thu,  7 Sep 2023 00:04:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4046310E204;
	Wed,  6 Sep 2023 22:04:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9596410E02C
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Sep 2023 22:04:22 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-500b0f06136so435746e87.0
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Sep 2023 15:04:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1694037861; x=1694642661;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:from:to:cc:subject:date:message-id
 :reply-to; bh=hOxKwJOqWAb69rm6x/gQT98m4juYI2Q0oOscr22POkg=;
 b=Hg6jOYhniJ5W6Uupks+KKOzLfyFoNMhDMeu39rTaydFaG6YiWPjoWbaTcfx2vsg8tw
 wxKwNTneTjXfU842/PNjmCBU/bsUQzSZqYwbCTwjO5EXN+nhAQqeVbLMKi2s/4yubYg6
 tMSPV2mM8r66slrUUVq8v/1ZKknRIcXWWP1Kk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1694037861; x=1694642661;
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hOxKwJOqWAb69rm6x/gQT98m4juYI2Q0oOscr22POkg=;
 b=Aa3B6AD8mpbwZDx7djKqAGuLjV6pSnNf6FlH+/D+eVBj3yc9mLBuBSiipTxaZDYnaO
 f5LxfPPDvJjILCy+WTMCN1x61yUvVyIewOYEOIVmdyHJvluLLn9zNh1uw62k0EQQ9brT
 /eB4FKjGEPYXRdgmKTtwGsgRmpBvKSYizRu62oNxS5z2I0I1FpUw9xkstiw2nCdDAopf
 aMx2YvW6QH/cIi78HTaHZ99+U4P0HQ/0yPRwuGr7CkB93LD+xcX76YCCUDYxzWCm057M
 Rw8B4Uq3tjxLwg0AflKwanTjkogYi8SIifnxaNgZDXtSuTuVjUkGtLv6Zbloy04yUZT3
 turQ==
X-Gm-Message-State: AOJu0YwFmRACmXre+p03SEhIN14uYiFTqsj1qzn8lXEKNKMv5jI/yb7g
 uA/8YEd25EoTuwtBhhLwP8rjzXs9Y15gVIHqXHy+vA==
X-Google-Smtp-Source: AGHT+IFsds0W1nef7yYZh8sAvGm/Eh1+DoJ/z/zG1cykY5DoSMrR/hVmw5xZPpms3LSzxp1q4GyB0lRiQ3W3GTk7DvU=
X-Received: by 2002:ac2:5f52:0:b0:4fe:5133:1213 with SMTP id
 18-20020ac25f52000000b004fe51331213mr3072268lfz.12.1694037860795; Wed, 06 Sep
 2023 15:04:20 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 6 Sep 2023 17:04:20 -0500
MIME-Version: 1.0
In-Reply-To: <20230904020454.2945667-9-dmitry.baryshkov@linaro.org>
References: <20230904020454.2945667-1-dmitry.baryshkov@linaro.org>
 <20230904020454.2945667-9-dmitry.baryshkov@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Wed, 6 Sep 2023 17:04:20 -0500
Message-ID: <CAE-0n538jr7DV2XHzjqBdQt1LcTeFXcGcALP0T7xSc4=-bzpWw@mail.gmail.com>
Subject: Re: [PATCH v3 8/8] drm/msm/dpu: move INTF tearing checks to
 dpu_encoder_phys_cmd_init
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>
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
Cc: linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Dmitry Baryshkov (2023-09-03 19:04:54)
> As the INTF is fixed at the encoder creation time, we can move the
> check whether INTF supports tearchck to dpu_encoder_phys_cmd_init().
> This function can return an error if INTF doesn't have required feature.
> Performing this check in dpu_encoder_phys_cmd_tearcheck_config() is less
> useful, as this function returns void.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
