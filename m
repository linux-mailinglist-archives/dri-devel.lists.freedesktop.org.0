Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9B14522353
	for <lists+dri-devel@lfdr.de>; Tue, 10 May 2022 20:08:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E54F10EB4C;
	Tue, 10 May 2022 18:08:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com
 [IPv6:2607:f8b0:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 827F610EB5F
 for <dri-devel@lists.freedesktop.org>; Tue, 10 May 2022 18:08:03 +0000 (UTC)
Received: by mail-oi1-x230.google.com with SMTP id q10so4248326oia.9
 for <dri-devel@lists.freedesktop.org>; Tue, 10 May 2022 11:08:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=PBkBGj9Wm+vqScoe3rXf56OJq4tLpJWe7pdFIsGR7f8=;
 b=m7/KE9hL4p0V34eJ5CG5gGQ7DBSHi8qVI0yoATdKhsJkfVe5nQTKMLYYHsuqRS/YRA
 5ea2LelxM0XZNjHjHHJfhc3mu4Rxb1PndcumidEOGMhdgylteyqyxUAMTwG/QDFXsEwY
 FbD95wZFveFO4CMVdlxSfo4qPwUHJCZ+n+IRk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=PBkBGj9Wm+vqScoe3rXf56OJq4tLpJWe7pdFIsGR7f8=;
 b=Lp66j9ot9uniT5g3eTCDK4yLQ8QeSnWhrOjDToMNQtdOQDVPd+QinjZXPtM41ET5K2
 oP3amnFWKz677rt1GRNVFIHovbM96UXANciuPHEBSSbTg4AMVltWUsn5xlHEA9ooKurg
 2/nyWaFWKfsUQdXokAkD1fRpCXB1Kr/0Jnkic2P9hwrMiA4ANC0fX4Gz32xJFv5Xo8xD
 DeAzFkJjGcWb9v8H8XI1xdiIinB7y+4RJ45WIvkixvq57D9rQREdonovbrYPgex4V5Pl
 /E+vnVOzYRDFx/W+Kjib1cIL4JTwZbm42nQVkaWKx+lyXqsanSbyqyqaSs/i1Tkdinuq
 MeJw==
X-Gm-Message-State: AOAM5333Cm74MxKwcUUAmXjlcMAqV3HsNYQNBjEBbAoEmyb95oY5yfGV
 VFjvwZn8eYVGZVJqDY/x3P+oJYr2sy9ylxUeUR5yZw==
X-Google-Smtp-Source: ABdhPJwDubvKYE7hKn9RJqYmmvSUB6eZFEeHBr9soKfiUdvHF1qRxJgLuav4mDD81e+i0CrUgZhvbbnCOoGW8sOaAaw=
X-Received: by 2002:a05:6808:14c2:b0:326:c129:d308 with SMTP id
 f2-20020a05680814c200b00326c129d308mr633893oiw.193.1652206082707; Tue, 10 May
 2022 11:08:02 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 10 May 2022 11:08:02 -0700
MIME-Version: 1.0
In-Reply-To: <20220510165216.3577068-1-robdclark@gmail.com>
References: <20220510165216.3577068-1-robdclark@gmail.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Tue, 10 May 2022 11:08:02 -0700
Message-ID: <CAE-0n52TCi-Vy8WUqCQdbcoqLCX6j4_mkM_1pBQC072DdqC-Wg@mail.gmail.com>
Subject: Re: [PATCH] drm/msm: Fix fb plane offset calculation
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
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, linux-kernel@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Rob Clark (2022-05-10 09:52:16)
> From: Rob Clark <robdclark@chromium.org>
>
> The offset got dropped by accident.
>
> Fixes: d413e6f97134 ("drm/msm: Drop msm_gem_iova()")
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
Tested-by: Stephen Boyd <swboyd@chromium.org> # CoachZ
