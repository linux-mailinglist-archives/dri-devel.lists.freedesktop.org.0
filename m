Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 533C047615B
	for <lists+dri-devel@lfdr.de>; Wed, 15 Dec 2021 20:10:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 435F610F84D;
	Wed, 15 Dec 2021 19:10:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com
 [IPv6:2607:f8b0:4864:20::236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C3F110F84C
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Dec 2021 19:10:35 +0000 (UTC)
Received: by mail-oi1-x236.google.com with SMTP id bk14so33033308oib.7
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Dec 2021 11:10:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=o4GFUJfnOn1MqDWBxKCcYXZhEN4oa41+4/hNAuhMnEQ=;
 b=FDnhrOp05KzmGqeixp4fuYb6yNyFnun02Y9PQN9byiYvDKsyxwM1injIQXFUyzVn9V
 MSvrGkVCX8251BsU+94oW9TYQiiL/ePZhhqB9PpQYiv9AbyREhBGlC7AGo8FCClTx6sb
 PSJUfLRM+Rq1QNw59ufxqempEPKQijigi3K5I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=o4GFUJfnOn1MqDWBxKCcYXZhEN4oa41+4/hNAuhMnEQ=;
 b=rNB1Fsw07kuqIqfPUZgA3lytQdgwRbMemERQI6XaAomgwUoG/k9mGL/R6OBUJhIfQD
 uTHnJCHBIxs2TGzoG90IHfFnpjD0bL1bSYszQoorT2anYHBdQR++ZuUhb0wAojL2oKO8
 RWQ8a+6BxZjZkMPiUW4M4g1eMvZ1RUw+rD0BJ0KNGU9FoCorP6NLkYmeYWgkDuJDzzpf
 6518hN/N6ZtWVs7tkjPyJ8jMM+zy7tRVJEjpNeVycYAbE05hY0YuOdbuKGUoiJDEtRWv
 1nz6IvM328dHUf7oruIPPytzFS1ogrje1HJ0cy/qTq+uCec3nK5Aopq3N7YRdMJiaiqR
 VrzA==
X-Gm-Message-State: AOAM530G0XCk8o2cjOII95SE/x1WNSOcwDd40gbbwKVZ7mvVwzaBV462
 t+qulJT0Cj+k0SICOyCAROqrmqYFS7+11d+aNyn+yA==
X-Google-Smtp-Source: ABdhPJylPPGqcI6i5Kd0ZwAXgrXkSHaQcXt5Yx/hOTY43OO1Fv2rztkYwFETiHyR1NlHtEbQThfQbHh0h6fpGYQHPfM=
X-Received: by 2002:a54:4506:: with SMTP id l6mr1230341oil.32.1639595434600;
 Wed, 15 Dec 2021 11:10:34 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 15 Dec 2021 11:10:34 -0800
MIME-Version: 1.0
In-Reply-To: <20211215175910.1744151-1-robdclark@gmail.com>
References: <20211215175910.1744151-1-robdclark@gmail.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Wed, 15 Dec 2021 11:10:34 -0800
Message-ID: <CAE-0n52CHwYAEwAC0Hthgbamjj2x4K3B2w=kTRw_AFLzVgDF-Q@mail.gmail.com>
Subject: Re: [PATCH] drm/msm: Don't use autosuspend for display
To: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
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
Cc: Rob Clark <robdclark@chromium.org>, freedreno@lists.freedesktop.org,
 Jonathan Marek <jonathan@marek.ca>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Vladimir Lypak <vladimir.lypak@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rajeev Nandan <quic_rajeevny@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sean Paul <sean@poorly.run>,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Rob Clark (2021-12-15 09:59:02)
> From: Rob Clark <robdclark@chromium.org>
>
> No functional change, as we only actually enable autosuspend for the GPU
> device.  But lets not encourage thinking that autosuspend is a good idea
> for anything display related.

I'd prefer to see a small blurb about why it's not a good idea to use
autosuspend for display things. Then this commit can be dug out of the
history and someone new can quickly understand the reasoning behind it.
Just saying it's not a good idea doesn't really help.

>
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
