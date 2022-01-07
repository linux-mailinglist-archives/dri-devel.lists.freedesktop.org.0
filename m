Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D4390486F2C
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jan 2022 01:55:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A62310E97E;
	Fri,  7 Jan 2022 00:55:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com
 [IPv6:2607:f8b0:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA80310E97E
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jan 2022 00:55:00 +0000 (UTC)
Received: by mail-oi1-x22a.google.com with SMTP id w80so6129730oie.9
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Jan 2022 16:55:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=0pYB0RbUQb+ZQoPYrHQZu7/mbDpmz+DgyrT9hvQMHLY=;
 b=Eiq2sMVpWWW2opwh1s3oSD+oaO/zGcn7FnlC2rBpA08jcz+kUVeafqwvNnJuMyuUqe
 9uGs/R9Fds44whRulyvtahDBqPz7smp88bIRpxpAz265T29JGxifo/nt/hHjFROtlIDX
 DsN9DptDMweVHlZ/nJxP1DklA36xVnYoAXjMU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=0pYB0RbUQb+ZQoPYrHQZu7/mbDpmz+DgyrT9hvQMHLY=;
 b=zzc7wnSEwIUD6mMw5HrgnmsJQqfCUvDHn69egXVfPSVWDw8r4oBrVzQraeQvpdp895
 sLLOez0PLE5v1dIsrJYZdabHZMMg9SO0lZ7yAa6T0MrIFksCh4TNkDOCKjzSjssmnkdI
 j3/YTLMEuRiOHGmOYczVuukASy3Jq+cevarOWz3Lpf9Zyl4ypl4EzRyOXYZasO2OjbMa
 BlaApK6LygDCfSD7NHOFIxkU9xLmvJxjekpenq0vLTGZUg+wAjhRG3iU8/u0C1Z/fLQj
 N2ymxGrcHEkJaOgbvxu6MAJ+7Rk53YP+PAQJ8UHrzSEx8nimMxWRC2zGJkn4OFSg7M2J
 pI9w==
X-Gm-Message-State: AOAM532UNG/sQUDpMLq4qNq06XVatONdydPlhEXQrccg3GNmFRnAixlr
 N9tTdRQOVK/2pnsx9Y6Md5nTjaFdrRfKsn4mrEPGgw==
X-Google-Smtp-Source: ABdhPJzYKjK4yEo/vzFZbZ8eeAgkwCnr5IK1Nsn86Bcg+g6fm4a6GbPnGoQH9r+nY1PYdtmE7DycRXW6TwBE0GwCX40=
X-Received: by 2002:a54:4710:: with SMTP id k16mr8059411oik.32.1641516900087; 
 Thu, 06 Jan 2022 16:55:00 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 6 Jan 2022 16:54:59 -0800
MIME-Version: 1.0
In-Reply-To: <20220105231031.436020-3-dmitry.baryshkov@linaro.org>
References: <20220105231031.436020-1-dmitry.baryshkov@linaro.org>
 <20220105231031.436020-3-dmitry.baryshkov@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Thu, 6 Jan 2022 16:54:59 -0800
Message-ID: <CAE-0n53OWdu7jdA-d_xr7LJunkZycjQE78Md+457_8=88uo2-Q@mail.gmail.com>
Subject: Re: [PATCH v4 2/5] drm/msm/dpu: add DSPP blocks teardown
To: Abhinav Kumar <abhinavk@codeaurora.org>,
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

Quoting Dmitry Baryshkov (2022-01-05 15:10:28)
> Add missing calls to dpu_hw_dspp_destroy() to free resources allocated
> for DSPP hardware blocks.
>
> Fixes: e47616df008b ("drm/msm/dpu: add support for color processing blocks in dpu driver")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
