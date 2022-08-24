Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F0F935A0036
	for <lists+dri-devel@lfdr.de>; Wed, 24 Aug 2022 19:18:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3B6FBD46C;
	Wed, 24 Aug 2022 17:18:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com
 [IPv6:2607:f8b0:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D93ABD455
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Aug 2022 17:17:49 +0000 (UTC)
Received: by mail-ot1-x32b.google.com with SMTP id
 92-20020a9d0be5000000b0063946111607so2920068oth.10
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Aug 2022 10:17:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:from:to:cc;
 bh=MHYuEVNrNq6xOFLpayXIejomNu0GT0DBxEs7vGrd158=;
 b=WZmQ7PLNtEHmn6SJrYb0tXJV3lUfaM74pbLSdSKR9LMnaK5kGCvh1f3QY7J38pSoIB
 ik74LCQK95MUwF5xTdiHJ3JJ/wd36IqnmQneCLEzyFZ4ghGmFUX4vvXUG+dSM9XM77Nv
 lk/NSNsGdkxOFaxjdiv4zfitg8B6AUUzfSsrc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:x-gm-message-state:from:to:cc;
 bh=MHYuEVNrNq6xOFLpayXIejomNu0GT0DBxEs7vGrd158=;
 b=7I7NeY372uIJEIFksprJCjn4U6RVBRzhyotydg+U+kZIJqSMj5dwGWm/MNseFdSTPG
 oU+yVVx1u6XDc7UdWPDD9oeZTHgQteJEfKR+ifDEymzqggEo9uC9En15GwUUTvnGld+B
 L37xxrGxMLtBGhVaRIWMRkp/DemBb5IO0TZi5mGzqu9EKLXxNR7YIvEzNk0GLEoU019z
 0F3lvINtTf8aV3YrpgVtNKab0q/iH6YOpNhuY0PXWNiMi20vw7GCAV+kiQveQF1TjjsP
 KevJbksjbjrNCI7TiMAJ06RTS7Dgnf3JLRRnLUAkkmez/tJUFDeBTAKTWxRDU90hlV/j
 F48Q==
X-Gm-Message-State: ACgBeo1U8/LYfV1THnYCyVbvmqjKdYtrLL3Np7Z4aeVT4nFW+Tzlh/KM
 pCCO0plOfWrr2DFTPIgpA09sMrxhe5pPH3bVtIq0Sw==
X-Google-Smtp-Source: AA6agR4zBshr+gUc3WgavtY1TB1LNAO6aNOk9NTWdc2ol+fbKgwzW7gL98pe4oEy1a7xXcIHJjx4KwfdSoBCPBzli14=
X-Received: by 2002:a9d:738c:0:b0:638:9962:8cb6 with SMTP id
 j12-20020a9d738c000000b0063899628cb6mr11204441otk.73.1661361468554; Wed, 24
 Aug 2022 10:17:48 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 24 Aug 2022 12:17:47 -0500
MIME-Version: 1.0
In-Reply-To: <1661360356-21948-1-git-send-email-quic_khsieh@quicinc.com>
References: <1661360356-21948-1-git-send-email-quic_khsieh@quicinc.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Wed, 24 Aug 2022 12:17:47 -0500
Message-ID: <CAE-0n52Mqv-qqb4n_Q4iO-reSncNikWd-2xNVG7pgwvx2ThTHw@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dp: correct 1.62G link rate at
 dp_catalog_ctrl_config_msa()
To: Kuogee Hsieh <quic_khsieh@quicinc.com>, agross@kernel.org, airlied@linux.ie,
 bjorn.andersson@linaro.org, daniel@ffwll.ch, dianders@chromium.org, 
 dmitry.baryshkov@linaro.org, robdclark@gmail.com, sean@poorly.run, 
 vkoul@kernel.org
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
 linux-kernel@vger.kernel.org, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Kuogee Hsieh (2022-08-24 09:59:16)
> At current implementation there is an extra 0 at 1.62G link rate which cause
> no correct pixel_div selected for 1.62G link rate to calculate mvid and nvid.
> This patch delete the extra 0 to have mvid and nvid be calculated correctly.
>
> Fixes: 937f941ca06f  "drm/msm/dp: Use qmp phy for DP PLL and PHY"

Should be

Fixes: 937f941ca06f ("drm/msm/dp: Use qmp phy for DP PLL and PHY")

> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---

Good catch! Thanks for fixing it.

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
