Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B18854FE84
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jun 2022 22:48:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C034A10E3C6;
	Fri, 17 Jun 2022 20:48:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2d.google.com (mail-oa1-x2d.google.com
 [IPv6:2001:4860:4864:20::2d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20A938905A
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jun 2022 20:48:47 +0000 (UTC)
Received: by mail-oa1-x2d.google.com with SMTP id
 586e51a60fabf-1016409cf0bso6902792fac.12
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jun 2022 13:48:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=Y4XNPPOTHcGQua89ehLw74GJaEq7bj+hezmlX6AJcYE=;
 b=Oax+hb9jz11E80qid8APuomKpd1AiYADh5Zfb5n+Y6a/her9EiKju+LU3dKDEjr8lY
 YhYXxlHkYUMfxRzIzmOJT0EvN55leGg8E8A/L0+zVd5ny2ZP8DEsXr1aI88AF5zDhvzM
 DLkNe7+ayYWePHOAQW6WVD8xdAjTCgjqXOdqc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=Y4XNPPOTHcGQua89ehLw74GJaEq7bj+hezmlX6AJcYE=;
 b=qOU5+wdQ3UqfSb7XsnkPzGELbK8rsRWn2WKfKkc26sz1jFQ7b/5F8S9cDTUFU/dVOs
 qKKPECGidUd+p51EW5WF4ik7k0YOkASxBd1Jpi6z2cQ6Jmxa6gFtNBoLwjnwsNge4FXe
 1Hqm1QlR1GoMiZebnaDaKgGlXlMGFwgbBZzbXNl5CvmSAw85PkqoUurJnDHYCjQyY+Zm
 3QxguocbLuOrsvwBIWcI2vlI7gP6gMb0n1AgwIQhLlV24vTmo0NlbnRoxeRocuo9ub4z
 HevlAMlBVDTm6q3AZvYwWZ2FnvkOI4oqm/WshdieDmPABYMW0FWrWFyt0CBlK7oCG2Ph
 E7Cw==
X-Gm-Message-State: AJIora9+ZEYedOZGJ5sk9qH+ArKlxOZXjfPuykdN0D6YykyvAV6p0eJ1
 ZP0bAMVXyIWzLdsE1XOYuS0wGum5D3ExKu+4UVeA2A==
X-Google-Smtp-Source: AGRyM1sBdyafzJaFAWXzzdqzqbJCmm4BoflbCmCwm6csBW+c/DYUEooGn1aPbS1QG/DhTZ9CKV43uKNzGz9cffP+yjM=
X-Received: by 2002:a05:6870:b381:b0:fe:2004:b3b5 with SMTP id
 w1-20020a056870b38100b000fe2004b3b5mr6548394oap.63.1655498926376; Fri, 17 Jun
 2022 13:48:46 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 17 Jun 2022 13:48:45 -0700
MIME-Version: 1.0
In-Reply-To: <20220617191429.1087634-2-dmitry.baryshkov@linaro.org>
References: <20220617191429.1087634-1-dmitry.baryshkov@linaro.org>
 <20220617191429.1087634-2-dmitry.baryshkov@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Fri, 17 Jun 2022 13:48:45 -0700
Message-ID: <CAE-0n51J5K_o=Mmt5aYiS6MMnHTfhPG28Pe6-9xZC0bn=zbK=A@mail.gmail.com>
Subject: Re: [PATCH v5 1/3] drm/msm/mdp4: convert to drm_crtc_handle_vblank()
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, 
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
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Dmitry Baryshkov (2022-06-17 12:14:27)
> Stop using deprecated drm_handle_vblank(), use drm_crtc_handle_vblank()
> instead.
>
> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
