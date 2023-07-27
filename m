Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB340765EF4
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jul 2023 00:09:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C07410E624;
	Thu, 27 Jul 2023 22:09:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2a.google.com (mail-yb1-xb2a.google.com
 [IPv6:2607:f8b0:4864:20::b2a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 383AA10E618
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jul 2023 22:09:08 +0000 (UTC)
Received: by mail-yb1-xb2a.google.com with SMTP id
 3f1490d57ef6-d07c535377fso1421868276.1
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jul 2023 15:09:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1690495747; x=1691100547;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=h0wVom04GMDKcuNzd42eSW5osukOzn074rAOX4nx/mE=;
 b=EbmuNAaDXyGwbqCD/muQimOyfxSBpvYN2K/FI3F/GVaLDlGWZ/WWenFJOc49qWfLXc
 lX91OHbiBodLskrvE2qqx1NxiZRh9RWmJrRtWp00NgMiaHSkSS2NBg9b3NMnWsRAJv6v
 URClsMUaG4yp/jB18PvhV6cQ/lPe5IpPlAFSnCjx94dTqbYXjHH2hvUwudMiJx5LR3F+
 XiGJpRXmOn4+wbFdJJlCoKJX+k2HeUIg21EzInhCCYkLQQc5r9tN9IGmXUYq50DYjMiM
 6Zbmmg/HIgNcci3XV0lGjvcVFbWaTDw1fuZJLJpjOwhAVbkOfg5Ksp+kOzJITxz1HATM
 2I1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690495747; x=1691100547;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=h0wVom04GMDKcuNzd42eSW5osukOzn074rAOX4nx/mE=;
 b=d4ShHuG3s47oYEm2xz6z/MmpRMXNeRVN7ekPFBJuAaSH4uXMLfmwGIBRWawV4P7UwX
 gMluoCX0bYp2RuNVlYmbzb+LO70lI2lZBtdFBgJnuigW2x/erybpEjRjwz4qILJQ2h75
 o1n20XjOe/UIgkNY1o/t1Rh7dXe6FcEcpNiNw0pW6Bh2UUh1Jhs7xvWCwrBiWRB887dv
 DN0PEh/loL3B7D2FOGXojOMMwzSMKl8RetT6l2Qb8kYrvFwkYxA0kjPy4+D1qf6+T7zm
 1npsBSwIQwojb9EZ3Vfs6MiFHyB1v7EzBk5k02VUdwTwRJuOtli6FcNUfL0cY8I9m3yQ
 yMXA==
X-Gm-Message-State: ABy/qLautDIjmlhS3SnpszjzEAlUdNIePzNn9DgmmBqvWrH94V3/X9iJ
 ChCyKFNLA0OZ4SXkzSMeNyLxQuVGFXPJuhIqrSs+zA==
X-Google-Smtp-Source: APBJJlFAi5tghS8JIzpHOdP9kRkZXKZ+m78Uiw0vg8yIxL/6rMQxbJPtoScEb5cP0QoPnCFHOhj9pdrGaDCxg6YHpK0=
X-Received: by 2002:a25:ad9c:0:b0:d12:1094:2036 with SMTP id
 z28-20020a25ad9c000000b00d1210942036mr650769ybi.43.1690495747368; Thu, 27 Jul
 2023 15:09:07 -0700 (PDT)
MIME-Version: 1.0
References: <20230727212208.102501-1-robdclark@gmail.com>
 <20230727212208.102501-6-robdclark@gmail.com>
In-Reply-To: <20230727212208.102501-6-robdclark@gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 28 Jul 2023 01:08:56 +0300
Message-ID: <CAA8EJprc-6i7LWMk+ptXfRRfiv4_WoGc=cwWwuFdS5d+ZAnH-A@mail.gmail.com>
Subject: Re: [PATCH v2 05/13] drm/msm/adreno: Use quirk to identify
 cached-coherent support
To: Rob Clark <robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 open list <linux-kernel@vger.kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org, Johan Hovold <johan+linaro@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 28 Jul 2023 at 00:23, Rob Clark <robdclark@gmail.com> wrote:
>
> From: Rob Clark <robdclark@chromium.org>
>
> It is better to explicitly list it.  With the move to opaque chip-id's
> for future devices, we should avoid trying to infer things like
> generation from the numerical value.
>
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>  drivers/gpu/drm/msm/adreno/adreno_device.c | 23 +++++++++++++++-------
>  drivers/gpu/drm/msm/adreno/adreno_gpu.h    |  1 +
>  2 files changed, 17 insertions(+), 7 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry
