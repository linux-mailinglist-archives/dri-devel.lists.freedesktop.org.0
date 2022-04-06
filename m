Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA3C34F62A7
	for <lists+dri-devel@lfdr.de>; Wed,  6 Apr 2022 17:09:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF31810E1AB;
	Wed,  6 Apr 2022 15:09:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com
 [IPv6:2607:f8b0:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EAFF10E1AB
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Apr 2022 15:09:16 +0000 (UTC)
Received: by mail-ot1-x334.google.com with SMTP id
 w17-20020a056830111100b005b22c584b93so1885009otq.11
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Apr 2022 08:09:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=n0YAsSJflCGF17Y0CR0O5w5xtp+VT/eBUOzd06C/67A=;
 b=nt6HFrO6S4nJO5qShNjR/7i7MnFB2r+0qZ7G8mTuqwFw7QqpnlX7iOCRWBtKU9dmWN
 02o4oH2sKqTiuuOMFcHpXVZpAHLAYJB0cPL+gY9LCvFyYHfatrW/QowE2xVkXKDcFh6N
 PcDJys37DNbIh1Ivdt8hT6c7TqNwvLPrVRfrg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=n0YAsSJflCGF17Y0CR0O5w5xtp+VT/eBUOzd06C/67A=;
 b=PKWmO9jrgIcP4TWzY8DaZK/npk+aEXMy+qMOTFivlKE9koiFrPfcZFFY7bV061SF/K
 1uTOtedtlepG7B32NiQxW4JhQi/rkt99DLTUfxf0C8UvkJfvHlEtSbMbNsv3vAoKbLGu
 DIZxXJwUcdf5no/5NHjHzKk7vkz96GtxD/YfclcVixrPWMHh9rpn7pyad76xJR5ehOkO
 pBnUvtKpP7EnMgp4SNOU7n+9L5d3tpkFVgHrZ3QBFppqgpucTyKzjHIyXuA2rofIUfeS
 JdFWD2KmSrJ6oOQhLYn4MrksrbGlE4rFGKn4z3wgvt/nYYIi8xTDKM+N0FCJEHhJYDY0
 +cLA==
X-Gm-Message-State: AOAM530j+/OmzpjPdUycNciLUFEz3v7XBPUsNaur9jMKVVkSs4t7dxDd
 XooaoNIUCWxeCsIB3mpEPR0Qfu/CvzZ6JUQrpfcF6w==
X-Google-Smtp-Source: ABdhPJwY2K8gzH413UXm6KXC3GBFZaVngaMQK8CtDE8wz/y+//wltFYxSuFffZiD4gecnGqEKCSEQx3687G9pOM0Q30=
X-Received: by 2002:a9d:b85:0:b0:5cb:3eeb:d188 with SMTP id
 5-20020a9d0b85000000b005cb3eebd188mr3142392oth.77.1649257755820; Wed, 06 Apr
 2022 08:09:15 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 6 Apr 2022 08:09:15 -0700
MIME-Version: 1.0
In-Reply-To: <9868aa33-c423-5338-6205-ec61c18c67c1@linaro.org>
References: <20220405234551.359453-1-dmitry.baryshkov@linaro.org>
 <20220405234551.359453-2-dmitry.baryshkov@linaro.org>
 <CAE-0n53p7MsvwzqzzyHdRzX2XV9_Lv7poTuZMQowha0=f=QZSA@mail.gmail.com>
 <9868aa33-c423-5338-6205-ec61c18c67c1@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Wed, 6 Apr 2022 08:09:15 -0700
Message-ID: <CAE-0n519eqMMzv0HXmnYob4RUtdmMbdTn=T5EPc5pDQHNHcGsA@mail.gmail.com>
Subject: Re: [PATCH 1/4] drm/msm/hdmi: properly add and remove created bridges
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

Quoting Dmitry Baryshkov (2022-04-06 03:21:25)
> On 06/04/2022 05:51, Stephen Boyd wrote:
> >
> > Is there any Fixes tag for this? Still seems worthwhile to have one even
> > if this is a lockdep warning.
> I thought about this before sending v1, but ended up not doing so. Each
> of these changes is not atomic. A call to drm_bridge_add() without final
> drm_bridge_remove() in the core msm code would leave dangling pointers
> in the drm core. A drm_bridge_remove() is not sensible without
> converting _all_ users.
>
> So there are two alternatives:
> - leave this patch series as is w/o a Fixes tag
> - squash four patches into a single patch and add 'Fixes: a3376e3ec81c
> ("drm/msm: convert to drm_bridge")' tag
>

The atomic change. That's because bisection could trip over these
patches and then break because it picked the middle of the patch series.
One atomic commit fixes that.
