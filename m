Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C964E4FCD95
	for <lists+dri-devel@lfdr.de>; Tue, 12 Apr 2022 06:24:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3790A10FE31;
	Tue, 12 Apr 2022 04:24:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com
 [IPv6:2607:f8b0:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2931110FE32
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Apr 2022 04:24:20 +0000 (UTC)
Received: by mail-oi1-x234.google.com with SMTP id b188so17844726oia.13
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Apr 2022 21:24:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=wT1ipJ+z6nc0cV5pPdBgKr4CL6t1pZ10f3e64vOVaAk=;
 b=IzYw+aFrZYlAA3irCMBEMNlVetWN6Cvq/bEgM3Lo/0TkezivNTRXdVhVaADc9HZagw
 4pwlOwWufF8wBtrEoYbXfGM6mTBkfxWbVM9SgTIM6FeBIeCD/4yH/v8NP/e5h6CL/mis
 I6N7CIwas+HFuSJTLS2XUNrOdtf1d/DFTwtuk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=wT1ipJ+z6nc0cV5pPdBgKr4CL6t1pZ10f3e64vOVaAk=;
 b=ZAcoY3Os46Hx2uFpxpAXsplvGX3Pvt1em3hJwqohtMpYiI2KujyWa8T4TwmHcwmkn8
 tAlQeut6yTay357yYwc+haGPJTDVgT0KQGgUtvpohReJzoX9iTiWWrbU08a1De2d7WBh
 ivytEimuGMUYpY6pCC25tkNd+6S1+lnipZGbr9RzKgWzZLsXo1dcWTlB1WXGdsDWi/KF
 uYO4V9hzA2085UDssEd1CJRU+Ip7fdpost/f/2q45bbC2CDyw9MDKuMxAiF6RDBwieFN
 SwPKWYeS+SMzEwSwBh5/UA+nJl84K4mmmJ9jp5EJFv+S/z8HuENnEmIqodBEutvFDMRZ
 f1sg==
X-Gm-Message-State: AOAM530SjyARp1IOAW1xpW1ncfe/mtlX707+Dq9XWAIoB4sFeaZJAgv5
 e8wo+efWlevQpKfrIokbGJmhf0d6KbtS6ikU/Muf6A==
X-Google-Smtp-Source: ABdhPJwQbxRfXrEl+yilyKFLG7gYsvTkWk6/J2NgE5ytQbVcrhyDZVAFL6sku9A05Sz3mgEknv8z6X2l0idsd9GHrnE=
X-Received: by 2002:aca:a9c8:0:b0:2da:45b6:b796 with SMTP id
 s191-20020acaa9c8000000b002da45b6b796mr922783oie.193.1649737459493; Mon, 11
 Apr 2022 21:24:19 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 12 Apr 2022 00:24:19 -0400
MIME-Version: 1.0
In-Reply-To: <1649451894-554-1-git-send-email-quic_khsieh@quicinc.com>
References: <1649451894-554-1-git-send-email-quic_khsieh@quicinc.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Tue, 12 Apr 2022 00:24:19 -0400
Message-ID: <CAE-0n514Cv1ruTO_dN9mSBtjbYNzscty479QJ2tyXt=q8WNE-Q@mail.gmail.com>
Subject: Re: [PATCH v2] drm/msm/dp: add fail safe mode outside of event_mutex
 context
To: Kuogee Hsieh <quic_khsieh@quicinc.com>, agross@kernel.org, airlied@linux.ie,
 bjorn.andersson@linaro.org, daniel@ffwll.ch, dmitry.baryshkov@linaro.org, 
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
 quic_abhinavk@quicinc.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, quic_aravindh@quicinc.com,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Kuogee Hsieh (2022-04-08 14:04:54)
> There is possible circular locking dependency detected on event_mutex
> (see below logs). This is due to set fail safe mode is done at
> dp_panel_read_sink_caps() within event_mutex scope. To break this
> possible circular locking, this patch move setting fail safe mode
> out of event_mutex scope.
>

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
