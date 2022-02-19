Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 91B564BC378
	for <lists+dri-devel@lfdr.de>; Sat, 19 Feb 2022 01:34:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6ADAF10EACF;
	Sat, 19 Feb 2022 00:34:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com
 [IPv6:2607:f8b0:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B016910EABE
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Feb 2022 00:34:02 +0000 (UTC)
Received: by mail-oi1-x22c.google.com with SMTP id j24so2682332oii.11
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Feb 2022 16:34:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=vKhJiLpJMNrNDVVoSI5LLnimpnVQVH6BtXENhzvuHFA=;
 b=HfSALada/6cdeAWOKMWVGJzL12lUov2M6fbxXPfW2tmBWRqARWU+NKd3/1Vy/kDmRb
 3p/eOHoOWPVhINTFz7+naFVDuNjT5wcLMkNyAt/SGqPvvJ7MXFxlsUxHTMT+UmgnGGDk
 qHyGd4NQRt6w1lA1Q0iPNMVDQadOxp/FbcvMU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=vKhJiLpJMNrNDVVoSI5LLnimpnVQVH6BtXENhzvuHFA=;
 b=O2Q+crZz3+LO9Q6VFI2F5bzY229jJrCtSsSaLUlCLPQtyii5Z7Xy65QT1WUIJTXDJj
 JSVFFbbD3W1qIuCnNwF1nDuGHpCDhPmH6kOoZ+3lThgfUOpTPPCeib7tQg1zol4r39s7
 x4xoCv1Wb7kKdKLwbQZEB0bQBPKLqt6XQBxPt3lpRO1ihSWj8hAxC8JD0RM1t5HWEGOd
 nDoBaFG7SpEL9Y3lQvid/d76AVE2hTPArjBfSly6/QRxc39obYyc8Ram0a08311oQ8Zt
 +Z1YXl6oQPwPXi5irtv2TSEkFtGJNn6Vw+6X3IE2N/YCTjvkaTMm3OeZBT3RUn7tAnd6
 MGtg==
X-Gm-Message-State: AOAM53106wGNkdbMhUl94Ti7O7ThWROQxJfQXV3L1NGN+nrwUjGwcQpx
 XGislD4ukjUr1nB4nEWMZNeJclj8siZLj12NQvWIEA==
X-Google-Smtp-Source: ABdhPJyLUHKLgsnFWoq7fgkInpdSdDIj0KpGrczwZENMDX/brDIe6HYXp+lshMaGOJ+HdFljHgy4t77LBqEvf2IZHBM=
X-Received: by 2002:a05:6808:f88:b0:2d4:c8c2:b898 with SMTP id
 o8-20020a0568080f8800b002d4c8c2b898mr445075oiw.112.1645230841936; Fri, 18 Feb
 2022 16:34:01 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 18 Feb 2022 16:34:01 -0800
MIME-Version: 1.0
In-Reply-To: <20220211224006.1797846-4-dmitry.baryshkov@linaro.org>
References: <20220211224006.1797846-1-dmitry.baryshkov@linaro.org>
 <20220211224006.1797846-4-dmitry.baryshkov@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Fri, 18 Feb 2022 16:34:01 -0800
Message-ID: <CAE-0n52NCAMXjEWtt_L-KcW0=FRw3o=fQOMBzX+9SkjH8BVhwQ@mail.gmail.com>
Subject: Re: [RFC PATCH v2 3/5] drm/msm/dp: support finding next bridge even
 for DP interfaces
To: Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
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

Quoting Dmitry Baryshkov (2022-02-11 14:40:04)
> It is possible to supply display-connector (bridge) to the DP interface,
> add support for parsing it too.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
