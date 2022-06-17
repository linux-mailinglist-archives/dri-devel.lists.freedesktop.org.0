Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB7BF54FE86
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jun 2022 22:49:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41D5010E1C6;
	Fri, 17 Jun 2022 20:49:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com
 [IPv6:2607:f8b0:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E8EE10E152
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jun 2022 20:49:15 +0000 (UTC)
Received: by mail-ot1-x332.google.com with SMTP id
 h15-20020a9d600f000000b0060c02d737ecso3936548otj.1
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jun 2022 13:49:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=ncffjMc6pHw+1TPZJcdmZRbDOOjSZwLTD4p2la+PTH8=;
 b=cXyQwuNm1l97LCMQPezs5DpJvLDKFJzjiMFByco8CrTW/jzSpYa0/rV/YQpbg3pZYb
 vtN81MpEtREytzC6e3+GGQR+cO+soSsil9doGetmYfLBZR3kuWBOgHF9vHUe+F82jV6G
 Eea0+GAe8yUqj84/f6ya8kLfVNs2g2hjf65so=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=ncffjMc6pHw+1TPZJcdmZRbDOOjSZwLTD4p2la+PTH8=;
 b=W8c8l+LPXmgW6T0GMrDg/SydMqDa8KWMVhmL1BpFDzKJRwRlvuAtMQfajbkMtpLK/m
 P7Ba7rtedjlkGEZey3VdnfyFpgO3DPakSlP4AmgXh+S20cFYdxpDko3AA3WzBkWp5kVk
 lNOAewJPVZuLZ+KzQRDwKQJslGPCrnD7hokMiWdXDNfUTF7pAdrgzOJ7VVRfllF0BHTM
 Smaz6DSQhBxXs5sNDqMI0Qj5ysniYdFtkRFxX+byXdX+ySo1Vok4oHdHY6Yc3zk0KM6I
 E/X6fRm7b55yHCxFF3fjofL8KbwsLOtynimxLdM0BFAnCTiIgnv2GdE860tnRdBKFL3l
 d3bA==
X-Gm-Message-State: AJIora8ui+900U2juhhnLi6ffjgfnjNI3m958sRJ/mDZjF83xnlBX/eA
 nsvSzfBCSHFfxkk/sofQpixUdmvwdCO6ATzme4etiw==
X-Google-Smtp-Source: AGRyM1sDSnZUoLLGbHCAG3IXX1ilQUucxGfAWqMdpU5HLS7fZO3FziKUMpoNMk+vpIK9DLsLFLCnmcinX7IgEZO7Wus=
X-Received: by 2002:a9d:6484:0:b0:60b:eb0b:4054 with SMTP id
 g4-20020a9d6484000000b0060beb0b4054mr4750400otl.159.1655498954413; Fri, 17
 Jun 2022 13:49:14 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 17 Jun 2022 13:49:14 -0700
MIME-Version: 1.0
In-Reply-To: <20220617191429.1087634-3-dmitry.baryshkov@linaro.org>
References: <20220617191429.1087634-1-dmitry.baryshkov@linaro.org>
 <20220617191429.1087634-3-dmitry.baryshkov@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Fri, 17 Jun 2022 13:49:13 -0700
Message-ID: <CAE-0n51yaN=CfveKwFcqv7bgBBzU1fTcDWMcvUYJJgZ=Z3cXdw@mail.gmail.com>
Subject: Re: [PATCH v5 2/3] drm/msm/mdp5: convert to drm_crtc_handle_vblank()
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

Quoting Dmitry Baryshkov (2022-06-17 12:14:28)
> Stop using deprecated drm_handle_vblank(), use drm_crtc_handle_vblank()
> instead.
>
> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
