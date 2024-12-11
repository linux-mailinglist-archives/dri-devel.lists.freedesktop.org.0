Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D6ED9ED9B9
	for <lists+dri-devel@lfdr.de>; Wed, 11 Dec 2024 23:32:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EE7C10E636;
	Wed, 11 Dec 2024 22:31:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="LFUEqPJM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x829.google.com (mail-qt1-x829.google.com
 [IPv6:2607:f8b0:4864:20::829])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F1C610E636
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Dec 2024 22:31:58 +0000 (UTC)
Received: by mail-qt1-x829.google.com with SMTP id
 d75a77b69052e-46677ef6920so10791561cf.0
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Dec 2024 14:31:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1733956317; x=1734561117;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:from:to:cc:subject:date:message-id
 :reply-to; bh=NHbSAVasy0M5518vl1c8RnaP4kK4Vq9FshCC3WUmEd8=;
 b=LFUEqPJMG+ifD32aB29ngTT2TxfbrFqC4+NyCIyurZHEj2rCMqIVuHB1Nw2MPADOLb
 s+V358uWjEMK+kYhu5HxbVLyAazqzrWjzzAb8w/LZlYwQLTIajZPatxm55hybxZk95Kp
 mO1U5737uIgz6ArxhlIP2dNnWPd3hb6ka8in8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733956317; x=1734561117;
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NHbSAVasy0M5518vl1c8RnaP4kK4Vq9FshCC3WUmEd8=;
 b=gQhcFHqnhhQ2S6c6k/AjE8jqAy+yNFqdXhWtgZob36B6hIx0VCGHN1Fxw7+E6akizJ
 UvWZboNgtsosGBOkg59l+C7zDT6Tp1uR1OiuEcKmJ5aHkHLdRKpJqB2mfZ8rD507fw8s
 wGU3Fmufq+HLbe82BgJ30SdgxPr4LDbS2VhD0SgUuEVzw6vrv70/X2vTaWzRGAqISFLu
 cAeyy4+71h3qOTma9Ewxh9wbC3OO7XAh5bCVe+l6Q3Eum3EOL9K9i31ZJFUpE3ksp8WK
 eNwbYM2hCroD/wxk+Rko+fnXGCC++rME6OBcGMi8c5R4ijSVHBzX2ZvDTxi1cGZQ1b6z
 qRAw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX/NNE9SOqn+5/iS4/m756AnkBHDoRYd9aXsD06SLhDCj63kS5m2FE2WXB3BL2Zvd+UOo2RuwnKvrw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwefkqGHHP8INDFc9wVTctfuFF2pM7G+1rbS5BOCkhUnNsBKZXs
 YfD7aJVGmwG8h9qR4vWQe+W5j3E/otjEC5AWHrIr/qMbvoh9sZxQvTMpzKd4vcdVCgb5T3xDHBk
 80+A7vSJn2gY3nzbzMsSsiZSMlzjD4qEzAAGha9ORJE+k1p0=
X-Gm-Gg: ASbGncsTGoyD2Vz9kWFjEUzRnCrBW+alOWJH5fjKFSUZA1z0zvWuVqvo2BSAIJa4z75
 LjCnd1ieUgULDBGB/+6AiDphX1aKQ9gyGVhJu2mSEqb3H/3EuduvdPsy6lwI/Kqg=
X-Google-Smtp-Source: AGHT+IH0phbrtePElXJxDxj9HI12gSYY0Q06etMElvaeqdDYhA8EkdDjpS2cR8ruv8dvm22YKh6KLSLREA129gVkVUA=
X-Received: by 2002:ac8:7d95:0:b0:466:93b9:8356 with SMTP id
 d75a77b69052e-467968a1451mr15126531cf.22.1733956317709; Wed, 11 Dec 2024
 14:31:57 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 11 Dec 2024 14:31:57 -0800
MIME-Version: 1.0
In-Reply-To: <20241202-fd-dp-audio-fixup-v2-10-d9187ea96dad@linaro.org>
References: <20241202-fd-dp-audio-fixup-v2-0-d9187ea96dad@linaro.org>
 <20241202-fd-dp-audio-fixup-v2-10-d9187ea96dad@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.12.dev1+gaa8c22fdeedb
Date: Wed, 11 Dec 2024 14:31:57 -0800
Message-ID: <CAE-0n50T1yJEhx+NbcoNbEZ6Q8Bx7asOHHx=bOY_uKNaQ-y8xQ@mail.gmail.com>
Subject: Re: [PATCH v2 10/14] drm/msm/dp: drop obsolete audio headers access
 through catalog
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, David Airlie <airlied@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 Paloma Arellano <quic_parellan@quicinc.com>, 
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Simona Vetter <simona@ffwll.ch>
Cc: Douglas Anderson <dianders@chromium.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
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

Quoting Dmitry Baryshkov (2024-12-02 02:06:40)
> Drop obsolete functions to access audio packet headers. The dp_audio.c
> now writes them using msm_dp_write_link() directly.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
