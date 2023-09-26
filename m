Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E99A7AEA3B
	for <lists+dri-devel@lfdr.de>; Tue, 26 Sep 2023 12:21:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17A5310E389;
	Tue, 26 Sep 2023 10:21:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x112d.google.com (mail-yw1-x112d.google.com
 [IPv6:2607:f8b0:4864:20::112d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E188B10E39A
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Sep 2023 10:20:59 +0000 (UTC)
Received: by mail-yw1-x112d.google.com with SMTP id
 00721157ae682-59f82ad1e09so41409947b3.0
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Sep 2023 03:20:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1695723659; x=1696328459; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=a7cJFhOb7t5Ix8iaURWtIsSLoskJCiWsX4e1QNdB7IE=;
 b=ahZT8bYcer1BTlz9XvGlJqf3ymCD3MxohurH6ryDDnbWrG/RYEx/TsLsXKjESMgYEx
 YP8UWiXaO5TyKkELFujgJboi2AY1gFOW1YWBYQ5EbyeKFWJKF1rpP1U/y+K2MaxdkwZ8
 LdatbY9gzxZ+eZrh7FTTN0Qn9tDP/NezLYsUvthgx32moU4goe/VI6l3z+tCg+Ll4q7Z
 EN9oPlBwE9GbCgdkhBX9DkZIhANe0Fpxzr2bWeEmqtbnkjRb8WugD4Cj+7L4btZ5L44X
 jC0z9oZHk69GLUo/vNL+vBgyRVDdO+UUaU80sazAXdB04RAr6EdMI+hH6Dd4Q76Ybxcw
 OfGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695723659; x=1696328459;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=a7cJFhOb7t5Ix8iaURWtIsSLoskJCiWsX4e1QNdB7IE=;
 b=owiy3Z7isr84ccnkczOphUlW8rb2lYbHvxn1Dju6N8THlACZJG4xAzO5td6UivOAXq
 iGFOEtbuHXJI/T6SuYj2QnORoQLzCMiQLHmW+gc5Hv5EEvavcDBLcvZ+d1KqEPkp4MmA
 PVl8/w77blLLXvfkbIN3LuDvLKpwbLfGhfcbXbGdl+Hsap7Ovkhpp0wWrYDV/u+4NJl2
 cK6wafrC8y/kWskjMspQR0WrURoJvlJaKtD5u4O85Yo92YtIXrZdmR2GZYOiJTJ1P2rE
 v8sYosfzqKZWLMvBNAZ2Il6y04Wc9u2kOEL5Xhu/iBoQG7aasZ3xvSO/eRYQWnI4mtcG
 sS6Q==
X-Gm-Message-State: AOJu0YyCWMPSyEjHauHwx2ACnFadiM4DhlW4eR6e4EWCwyk64SyRAIVa
 HntaZZGoSF+HDRYNcDTY300UglUecVBCyyosJ1tOlw==
X-Google-Smtp-Source: AGHT+IEWYOJ9taaGh0PkabxpCEUGNezaZuflzZehi3vKviCYxKZE7piisyJy7s6QgSXcRkCOW+2l/NpKDudM3y/juvU=
X-Received: by 2002:a0d:fb83:0:b0:592:9035:8356 with SMTP id
 l125-20020a0dfb83000000b0059290358356mr10373886ywf.26.1695723658832; Tue, 26
 Sep 2023 03:20:58 -0700 (PDT)
MIME-Version: 1.0
References: <20230911221627.9569-1-quic_abhinavk@quicinc.com>
 <20230911221627.9569-2-quic_abhinavk@quicinc.com>
In-Reply-To: <20230911221627.9569-2-quic_abhinavk@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 26 Sep 2023 13:19:52 +0300
Message-ID: <CAA8EJpq+rDGoC43F=S6Xb=N-V0J-4xB8gdB+M+dpK=USoA8D8w@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] drm/msm/dpu: try multirect based on mdp clock
 limits
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 quic_parellan@quicinc.com, quic_jesszhan@quicinc.com,
 Marijn Suijten <marijn.suijten@somainline.org>, Sean Paul <sean@poorly.run>,
 nespera@igalia.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 12 Sept 2023 at 01:16, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
> It's certainly possible that for large resolutions a single DPU SSPP
> cannot process the image without exceeding the MDP clock limits but
> it can still process it in multirect mode because the source rectangles
> will get divided and can fall within the MDP clock limits.
>
> If the SSPP cannot process the image even in multirect mode, then it
> will be rejected in dpu_plane_atomic_check_pipe().
>
> Hence try using multirect for resolutions which cannot be processed
> by a single SSPP without exceeding the MDP clock limits.
>
> changes in v2:
>         - use crtc_state's adjusted_mode instead of mode
>         - fix the UBWC condition to check maxlinewidth
>
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Tested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry
