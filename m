Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B77664B7D1D
	for <lists+dri-devel@lfdr.de>; Wed, 16 Feb 2022 03:20:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97A5A10E608;
	Wed, 16 Feb 2022 02:20:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com
 [IPv6:2607:f8b0:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F68410E608
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Feb 2022 02:20:10 +0000 (UTC)
Received: by mail-oi1-x230.google.com with SMTP id i5so1056434oih.1
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Feb 2022 18:20:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=XAfwp7j7WHoPgTggKUVHhjFZruqxqm2zyO1xWp3l9wk=;
 b=a/efTqnqJvKpAM+8MzMGUZIgMNN3UU2Xkp6YQHELWkg3ORnsO/0ZSYogApRAXnopbX
 iS7HSbQLbddTq9dUa6yHmNSWHpTSRX3fxTM9FXrGo339L8URZstD06L2Q3OwV7zctTgf
 28B56I0HpqR4HR4lc8WThUn/1obYmxpncCJ3Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=XAfwp7j7WHoPgTggKUVHhjFZruqxqm2zyO1xWp3l9wk=;
 b=Hh8aG4/R3MZwQsAkGX3kwEvniXujrxOrCmWHo/+tG/JzLXP4LrQ/5o7doyTv9bHyVG
 5nkIjLP9r4eLyOYzKAUsPeJdy0880EO4mufJrLNiytD3V83H/oKd6X3so5YqJYiEglzH
 Z6JNsoUPCENaqR/SMOQKrMiZ0/4dyqJL3YFwaQ+xVibfHIGzNIO/Okj4Rz6yV1W3psQS
 1mdxoSLaG715Si80cFdRjr22RKGbFBUVB7UhHSEzXykTFUaLYvHsij1bPdRDKWXC3uw2
 yf/EsIcZAG4WjF0ydPFK1bWLSZrOzUjDv86MJ7q5EuFchyjzBhkUl/RF2k6FrSdwTVui
 XrRw==
X-Gm-Message-State: AOAM5326CY2c0Z7fERUMA7YzhJT/oQLy034nKGqLdeoJUfm1bShE05l8
 L0Vcbga2s4Y2RU+BepFBsrYuj+pXqrShNeS5uDH1Ew==
X-Google-Smtp-Source: ABdhPJyxPyJO6OqJE+BDPaGZkFjijQe/mgb97dL7c6jiU3sz1MQvlSq/GF3c8TGS3LIMqD2nycVdiz9/0kfTz/Jv2ik=
X-Received: by 2002:aca:df44:0:b0:2ce:285f:cb99 with SMTP id
 w65-20020acadf44000000b002ce285fcb99mr2976794oig.40.1644978009506; Tue, 15
 Feb 2022 18:20:09 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 15 Feb 2022 18:20:09 -0800
MIME-Version: 1.0
In-Reply-To: <20220201151056.2480055-5-dmitry.baryshkov@linaro.org>
References: <20220201151056.2480055-1-dmitry.baryshkov@linaro.org>
 <20220201151056.2480055-5-dmitry.baryshkov@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Tue, 15 Feb 2022 18:20:09 -0800
Message-ID: <CAE-0n51xcCdHjjq_S4h_4HhF88czSDDqi4qk=3LrLxchC0MY5A@mail.gmail.com>
Subject: Re: [PATCH 4/6] drm/msm/dpu: get rid of
 dpu_encoder_helper_(un)register_irq
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
 dri-devel@lists.freedesktop.org, Abhinav Kumar <abhinavk@codeaurora.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Dmitry Baryshkov (2022-02-01 07:10:54)
> Get rid of dpu_encoder_helper_register_irq/unregister_irq helpers, call
> dpu_core_register/unregister_callback directly, without surrounding them
> with helpers.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
