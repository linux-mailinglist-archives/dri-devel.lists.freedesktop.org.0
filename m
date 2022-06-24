Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AD0155A241
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jun 2022 22:00:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14FB810E366;
	Fri, 24 Jun 2022 20:00:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2f.google.com (mail-oa1-x2f.google.com
 [IPv6:2001:4860:4864:20::2f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA32610E366
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jun 2022 20:00:38 +0000 (UTC)
Received: by mail-oa1-x2f.google.com with SMTP id
 586e51a60fabf-101dc639636so5181800fac.6
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jun 2022 13:00:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=oSfiCBI6rADUaj04vQ0405OWvsI1kvVtIUHFA11oGr0=;
 b=AzTPUiC43Gj/6Z9t+n4i14I6mGkZI/39weVhrwvNGDiaTV4vwIKZbNSfRAN5wtW1nF
 oDCOsFoC7WQUkXmCGuGxCvYrus4LASoYLkbeuSQnfDmRtkfY21qyLZ2A/1TkZLVaBiKV
 io052kql7sg6+CHv5tGOG8Qn3PSb0td2XoY50=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=oSfiCBI6rADUaj04vQ0405OWvsI1kvVtIUHFA11oGr0=;
 b=ve3QrVvZaqxjl1hVM5pP9fHDJJ/PJqNV/Du0zMakL82FJdObwd/Eh3iX+5iVA7ICwG
 VwaWpQOqo31ZYE7s7Pqyr90J7q/aTNNg8k2SzjI4sYFHEvuVKZRF4JugtYn9gjfL/K+z
 NeAkmQ3oCuCq63EtgxTNrMSun8MaMLyf1d0CoOC8c4G8h67NEJkE7dFBe78B06XcLEtm
 XmDHidTlZTM58o7hnEH86uZH+KS9et13IlTDAb+yvVAd21aPmKPWYorgVph813mTWp7x
 3HIoyaz8ShynGUeyw98e/ZpTqX984RQGcx47r1y9PhhwHxQmzZrEsfdo+k3iKU9k40Uh
 wjBQ==
X-Gm-Message-State: AJIora+Z2bQf/2TpQge5h9OSucPHG5e3QL39A7VtdfzW85smYV/oDlt6
 p/JoSaB/XLyYCd1pSHQn0oqtrxozqTjifLf0810PWQ==
X-Google-Smtp-Source: AGRyM1vLrNlfEUnoqHSJ2ARj6K9GI68cyGAkEp1ju+dJRkgXCY63E4sSustNSy9m4JbTmpCAiuev4LGT2ZxCahAMIj0=
X-Received: by 2002:a05:6870:b381:b0:fe:2004:b3b5 with SMTP id
 w1-20020a056870b38100b000fe2004b3b5mr461990oap.63.1656100837975; Fri, 24 Jun
 2022 13:00:37 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 24 Jun 2022 13:00:37 -0700
MIME-Version: 1.0
In-Reply-To: <1656090912-18074-3-git-send-email-quic_khsieh@quicinc.com>
References: <1656090912-18074-1-git-send-email-quic_khsieh@quicinc.com>
 <1656090912-18074-3-git-send-email-quic_khsieh@quicinc.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Fri, 24 Jun 2022 13:00:37 -0700
Message-ID: <CAE-0n52RW+UFJ=hqMWjwR8qvEbww7QjzPW1nhL3Atd97QXAnYw@mail.gmail.com>
Subject: Re: [PATCH v1 2/3] drm/msm/dp: decoupling dp->id out of dp
 controller_id at scxxxx_dp_cfg table
To: Kuogee Hsieh <quic_khsieh@quicinc.com>, agross@kernel.org, airlied@linux.ie,
 bjorn.andersson@linaro.org, daniel@ffwll.ch, dianders@chromium.org, 
 dmitry.baryshkov@linaro.org, dri-devel@lists.freedesktop.org, 
 robdclark@gmail.com, sean@poorly.run, vkoul@kernel.org
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
Cc: quic_sbillaka@quicinc.com, linux-arm-msm@vger.kernel.org,
 quic_abhinavk@quicinc.com, linux-kernel@vger.kernel.org,
 quic_aravindh@quicinc.com, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Kuogee Hsieh (2022-06-24 10:15:11)
> Current the index (dp->id) of DP descriptor table (scxxxx_dp_cfg[]) are tightly
> coupled with DP controller_id. This means DP use controller id 0 must be placed
> at first entry of DP descriptor table (scxxxx_dp_cfg[]). Otherwise the internal
> INTF will mismatch controller_id. This will cause controller kickoff wrong
> interface timing engine and cause dpu_encoder_phys_vid_wait_for_commit_done
> vblank timeout error.
>
> This patch add controller_id field into struct msm_dp_desc to break the tightly
> coupled relationship between index (dp->id) of DP descriptor table with DP
> controller_id.

Please no. This reverts the intention of commit bb3de286d992
("drm/msm/dp: Support up to 3 DP controllers")

    A new enum is introduced to document the connection between the
    instances referenced in the dpu_intf_cfg array and the controllers in
    the DP driver and sc7180 is updated.

It sounds like the intent of that commit failed to make a strong enough
connection. Now it needs to match the INTF number as well? I can't
really figure out what is actually wrong, because this patch undoes that
intentional tight coupling. Is the next patch the important part that
flips the order of the two interfaces?
