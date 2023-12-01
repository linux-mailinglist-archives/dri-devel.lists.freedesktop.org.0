Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D6368004F8
	for <lists+dri-devel@lfdr.de>; Fri,  1 Dec 2023 08:46:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAF4010E056;
	Fri,  1 Dec 2023 07:45:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com
 [IPv6:2607:f8b0:4864:20::b34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B97A10E808
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Dec 2023 07:45:14 +0000 (UTC)
Received: by mail-yb1-xb34.google.com with SMTP id
 3f1490d57ef6-db632fef2dcso114555276.1
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Nov 2023 23:45:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701416713; x=1702021513; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=bAyzCXYFTtB/vr3pXCQx6aGmKFlokRzACie3Yxs1gkk=;
 b=CZZQHVw6aMt9wyIkm7z3ucPIB85gl+IbSMzWtnF8VXBcPzOSJGohNy8emhuGcN4DMU
 2Sfb2SrEgaSu9UfTCH87Id6QVfIetGNObRg500lve9kApc07wHh7Q95AB9Uh8unrqgcR
 Y5wmVqAq/l9buScTGsAqWxFsaibD3nAW9I5MaWH7P12DLIjcph2dcNFQIQwfzCOCZu+Z
 rYvjkxMdzQrHSk+XZ6Xg9yYcqF781cDdAwr5SJ+VnXri7veSA1W525imymqYDSeKnily
 uhKfORM0ImOoNUqrVdc79tKlrvBeIBzb3GGIRA2sBCYqkLu+kGSYwqNBor1sc/eYgoJ9
 IuSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701416713; x=1702021513;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bAyzCXYFTtB/vr3pXCQx6aGmKFlokRzACie3Yxs1gkk=;
 b=VYCBCwgbVDTVXNR6TwHMjxqnT+vGilNvIaKY+fHoVFtuYEOXkLhmHl1L1goNMGIKyP
 z6bw/we8VKeJpa/9Dld1VhPWn/g1KKTnWKmcUbSX/If1r60aTZ8f0IXOF0ZewbKm04gW
 K0/uzZJiR7E5G07N6qZ6Z6aepKy13JWW8jrFiZ8hyEutzq0AkfKgNKhlQpJCXUhDJ8Y6
 hsgMHq6Xhzwa4pKSSXtDmSyhlBE9vrs85tbwy7kjQxxJBrEvMjqHzoufiaCgxsN8UwYH
 nPABDUCMZBBJvBGhqRTSHzOERc8HWhvZf/IKHUwtGY/i+xd+OLRDKsfoo6B8grraynBN
 6zew==
X-Gm-Message-State: AOJu0Ywg5P/6QZo0QbC6/V7rd3XtvMgDruxw6NW5WZLyw1j5YgVjiA1R
 Fz8WPRIcqs+J0vuYei65VYsPi7CqprLlEcXMNG2wpw==
X-Google-Smtp-Source: AGHT+IFS4C7LCzDwL4Hj38KGzIxRLCyE0RQvsnn0ZgHweV0zxG/M0rJEcXuB5HAkf+D7lbK/o5D4Z747vtaw3IpSu0M=
X-Received: by 2002:a25:f44d:0:b0:d9a:e397:3b4 with SMTP id
 p13-20020a25f44d000000b00d9ae39703b4mr22927544ybe.46.1701416713218; Thu, 30
 Nov 2023 23:45:13 -0800 (PST)
MIME-Version: 1.0
References: <20231201014101.15802-1-quic_parellan@quicinc.com>
 <20231201014101.15802-2-quic_parellan@quicinc.com>
In-Reply-To: <20231201014101.15802-2-quic_parellan@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 1 Dec 2023 09:45:02 +0200
Message-ID: <CAA8EJpqGx3eQ3o6bJhv3OBmHqtp67x8ODupZgKfSLSfFcRRmHQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] drm/msm/dpu: Modify vblank_refcount if error in
 callback
To: Paloma Arellano <quic_parellan@quicinc.com>
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
Cc: linux-arm-msm@vger.kernel.org, quic_abhinavk@quicinc.com,
 dri-devel@lists.freedesktop.org, swboyd@chromium.org, seanpaul@chromium.org,
 steev@kali.org, marijn.suijten@somainline.org, quic_jesszhan@quicinc.com,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 1 Dec 2023 at 03:41, Paloma Arellano <quic_parellan@quicinc.com> wrote:
>
> When the irq callback returns a value other than zero,
> modify vblank_refcount by performing the inverse
> operation of its corresponding if-else condition.

I think it might be better to follow Bjorn's suggestion: once we have
the lock, we don't need atomics at all.
Then you rearrange the code to set the new value after getting return
code from dpu_core_irq_register_callback() /
dpu_core_irq_unregister_callback().

>
> Signed-off-by: Paloma Arellano <quic_parellan@quicinc.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c | 9 +++++++--
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c | 9 +++++++--
>  2 files changed, 14 insertions(+), 4 deletions(-)

-- 
With best wishes
Dmitry
