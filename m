Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 05C8F4F52FF
	for <lists+dri-devel@lfdr.de>; Wed,  6 Apr 2022 06:01:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D979410F102;
	Wed,  6 Apr 2022 04:01:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com
 [IPv6:2607:f8b0:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FCA910F102
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Apr 2022 04:01:31 +0000 (UTC)
Received: by mail-oi1-x22f.google.com with SMTP id k10so1287387oia.0
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Apr 2022 21:01:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=fIVejTEIid4k3Br38o3vOB4Nk9WqXrcCLUm7LB9wI3g=;
 b=IG5KZiqjlYqUD90FPrmnIgW+5KsruCkJ4uZoErUI/mKHOTGCUWeMFTYnc7WKctoNOP
 cYTd85rDYHam1mnYrEea4ubBLmeYxEsTtViLox71HIP/rXEZ7lIujl5B1vVbEX3a01el
 pfHVZE6Xtpql9NhpcOvG+eD92M4DdC2WqQQdc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=fIVejTEIid4k3Br38o3vOB4Nk9WqXrcCLUm7LB9wI3g=;
 b=JD7+UTfBa3RySW5peAvanPr87kJ2UaRT+WPAcjssM3aWAGNlFN4PWnaVQX4rdP+NO0
 avtYHE/NIG8Zh18U3H8vpff2cBtIYZfTdBWCelr4rH2zPVOuq9S5DzwiaFD0FPVRuvoh
 oJIMDLspYmv6OgjBYF3cZDLsDm8FuAhKcC/5wDahDX1Hgw/W2C3S8Q22auVjOAiKbL+t
 u6XaxxBp7xg67wQ5GiseP8TDuzio7Qni3JhdrudsE0Oc8zrG5GXvTi5i6mWaqYLQUMP4
 aXqpsBqZnwUxEI5RYKam+uTf7yci1Y7nLgnRect+dxpu12COlGNrG8c/3gjK0VgxaUsA
 pZHw==
X-Gm-Message-State: AOAM5300bo6r9CMTiLO1GgRTvoEEn8dLjsf/fwTHPzmhol3Vr1Py4mEC
 3yA9magj/iZPgpy/pgAzARyn5Di+DM+P/PmazsSyWg==
X-Google-Smtp-Source: ABdhPJy4kKtuxcG2c6xjt9MqzFhHOds4NrTsKjmMV009Br4gwIA2ZK4qn18tizd30AhF8wyIdheSb6Saw6YHfHoaFNg=
X-Received: by 2002:aca:a9c8:0:b0:2da:45b6:b796 with SMTP id
 s191-20020acaa9c8000000b002da45b6b796mr2653100oie.193.1649217690556; Tue, 05
 Apr 2022 21:01:30 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 5 Apr 2022 21:01:30 -0700
MIME-Version: 1.0
In-Reply-To: <20220405235059.359738-3-dmitry.baryshkov@linaro.org>
References: <20220405235059.359738-1-dmitry.baryshkov@linaro.org>
 <20220405235059.359738-3-dmitry.baryshkov@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Tue, 5 Apr 2022 21:01:30 -0700
Message-ID: <CAE-0n51ayjyfEdne_=R6FU-3+O91JiYz-GRg2C7jeXB_9HTiRA@mail.gmail.com>
Subject: Re: [PATCH 2/3] drm/msm: loop over encoders using
 drm_for_each_encoder()
To: Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark <robdclark@gmail.com>,
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Dmitry Baryshkov (2022-04-05 16:50:58)
> Rather than manually looping over encoders array, use standard
> drm_for_each_encoder() macro.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
