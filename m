Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5579D4B7D74
	for <lists+dri-devel@lfdr.de>; Wed, 16 Feb 2022 03:23:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 245FF10E60C;
	Wed, 16 Feb 2022 02:23:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com
 [IPv6:2607:f8b0:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 301EE10E60C
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Feb 2022 02:23:40 +0000 (UTC)
Received: by mail-oi1-x229.google.com with SMTP id ay7so1024817oib.8
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Feb 2022 18:23:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=do3u6/z7zCvazn6dB/lB4uze72AW50adozCDD+3nWC0=;
 b=dep0T2pIMIu4ZF68LVowfSkCS8ZxQieF9CH5b7wOgc6Hbtao27n1EOb5gWMqPlEMfa
 JiEQvMfO6kYPEG7VAJpoKpE9tDR/A51kcdFDr1K9rHtgnUghJNtKQ8Yq9eBG76imN3Cb
 3/j8kY2ujmHBAmJxqCl+dko0CccdxK4Ygv8rk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=do3u6/z7zCvazn6dB/lB4uze72AW50adozCDD+3nWC0=;
 b=Db25e/ZMSz2ogayZHX+E+uGpzYhkH2XmJ0axVv16PBg904YK2bZs3ILdrCfFZAaN8E
 XTJwElCWFp2kKPiKecZzBp2zeIY8pPTyAGAs+3+aipI7OG5qCbCx8Y/KGFRLTew5chvM
 0OXhf57vbW8A1rUyyAhCNNlHl4Qbw6ONKkhK0bMkoz5AzQWjN9D8nNd8lu407a5fEq5l
 cI775rXJFNSRJn8k6zHH3h2z4T770XgSLUk7EBUYd0oYhmsroV3JTtMfF6X5okrNtOpo
 kFH+OWgtOAfJwLcCjAICIiLpqZ1VHDhIT5nkCpsGIoAYXcbq5D9/4svnYr4B2jwIveB2
 u1EA==
X-Gm-Message-State: AOAM5317hjXyy0/nBZcZsM7I14iaz2W+2EU0qCIPjxud0B0lV+NmyLjQ
 1RpdWjfENM2j7U0Y0aPDm2UhlFey/bGQ1mqHOJ8lb218wcg=
X-Google-Smtp-Source: ABdhPJxTadsQFl0F265Dj7oAXJyj6RI9yKfL/VD6n7bVCUqdLXYuh0mXfZ6jUdzpa9lfmUtffEGDanBYPorC556NV2I=
X-Received: by 2002:aca:df44:0:b0:2ce:285f:cb99 with SMTP id
 w65-20020acadf44000000b002ce285fcb99mr2980915oig.40.1644978219565; Tue, 15
 Feb 2022 18:23:39 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 15 Feb 2022 18:23:39 -0800
MIME-Version: 1.0
In-Reply-To: <20220201151056.2480055-7-dmitry.baryshkov@linaro.org>
References: <20220201151056.2480055-1-dmitry.baryshkov@linaro.org>
 <20220201151056.2480055-7-dmitry.baryshkov@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Tue, 15 Feb 2022 18:23:39 -0800
Message-ID: <CAE-0n53sC=vfEtV=h9bDJgHoTi7z4fSLvqNmUDkBfWsXk1u_pA@mail.gmail.com>
Subject: Re: [PATCH 6/6] drm/msm/dpu: pass irq to
 dpu_encoder_helper_wait_for_irq()
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

Quoting Dmitry Baryshkov (2022-02-01 07:10:56)
> Pass IRQ number directly rather than passing an index in the dpu_encoder's irq table.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
