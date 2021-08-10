Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8B943E8551
	for <lists+dri-devel@lfdr.de>; Tue, 10 Aug 2021 23:32:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 268F189BF4;
	Tue, 10 Aug 2021 21:32:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com
 [IPv6:2607:f8b0:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6333789C0A
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Aug 2021 21:32:19 +0000 (UTC)
Received: by mail-ot1-x330.google.com with SMTP id
 v10-20020a9d604a0000b02904fa9613b53dso804543otj.6
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Aug 2021 14:32:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=2TEOQGiAQW3LJuAkSRtxbwnZcRI4cSybco52ZSAwzug=;
 b=WVkAnSE/ZGx5+Eaqx1oMrPKB2m9ZEuZle+H2fzP31C8LKJ7blO9okOvrJLCQngLMh1
 AYEXnqpEZNMcpoVL3zyjTy+UEMJ3ccQBkrS02f0R78bJPpVcVDwPjIUFcZFhCKtFnaMy
 x8wkpt8HDoL6UpxGKAo7IzrZcHaADNQahWkyo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=2TEOQGiAQW3LJuAkSRtxbwnZcRI4cSybco52ZSAwzug=;
 b=YWOwTQ2cT/Zh6sZVZv03I2DQ5djwfFTLG2NSFWeMaCTjWIyEh+PbImS/HW8BV7E/AC
 W2OPhEaM7NXSBimIPUFPE6WUTERRWhd5w1pPcbSvbqJBXfv0T4+Qjgb7fSmnMz/NLLOh
 KnA1RhGKZJrhUDufvmYDkJjEDhadnAt3LNNXw5BTMUdjGwhxlZ+D4m/eDGV8lF/OsG33
 WArTcbHY1XspkjngocrC576nKQl+pSct9i14PkeGbpEPcfQcjuIQlqHUobg37JlAa1Mf
 SuQ4clHkATcah6LMSj2Q8Mr0cTjt+/tcgJ0V1i+PERcU6IJsswDSuiLHyeWh4XCEaPnN
 NlUg==
X-Gm-Message-State: AOAM531VW9A6SZdAq/ac9baV673vz4L4uNTB+xe7DR061Hxm/0gnTB2+
 7eeN79VXwi6yfU0OlVD/pihpuEIgLsPRPS5kuH9qUQ==
X-Google-Smtp-Source: ABdhPJzKuHGG5SEuOgiuv6zSynYUbXFakY1O5WFVDqIOV8i6nqaif26ZzTNpPcImURd0czHpta4tzT+W1oQ71p7UW1g=
X-Received: by 2002:a05:6830:44a7:: with SMTP id
 r39mr22526030otv.25.1628631138739; 
 Tue, 10 Aug 2021 14:32:18 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 10 Aug 2021 14:32:18 -0700
MIME-Version: 1.0
In-Reply-To: <1628196295-7382-3-git-send-email-khsieh@codeaurora.org>
References: <1628196295-7382-1-git-send-email-khsieh@codeaurora.org>
 <1628196295-7382-3-git-send-email-khsieh@codeaurora.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Tue, 10 Aug 2021 14:32:18 -0700
Message-ID: <CAE-0n52xzaGKd=5fdXFnqixekRYHf8pfvcp+K3eEZk=+siPH1w@mail.gmail.com>
Subject: Re: [PATCH v3 2/6] drm/msm/dp: reduce link rate if failed at link
 training 1
To: Kuogee Hsieh <khsieh@codeaurora.org>, dri-devel@lists.freedesktop.org, 
 robdclark@gmail.com, sean@poorly.run
Cc: abhinavk@codeaurora.org, aravindh@codeaurora.org, airlied@linux.ie, 
 daniel@ffwll.ch, bjorn.andersson@linaro.org, linux-arm-msm@vger.kernel.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Kuogee Hsieh (2021-08-05 13:44:51)
> Reduce link rate and re start link training if link training 1
> failed due to loss of clock recovery done to fix Link Layer
> CTS case 4.3.1.7.  Also only update voltage and pre-emphasis
> swing level after link training started to fix Link Layer CTS
> case 4.3.1.6.
>
> Changes in V2:
> -- replaced cr_status with link_status[DP_LINK_STATUS_SIZE]
> -- replaced dp_ctrl_any_lane_cr_done() with dp_ctrl_colco_recovery_any_ok()
> -- replaced dp_ctrl_any_ane_cr_lose() with !drm_dp_clock_recovery_ok()
>
> Changes in V3:
> -- return failed if lane_count <= 1
>
> Signed-off-by: Kuogee Hsieh <khsieh@codeaurora.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
