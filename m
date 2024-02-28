Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D26486BAC6
	for <lists+dri-devel@lfdr.de>; Wed, 28 Feb 2024 23:32:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5CFD10E0DB;
	Wed, 28 Feb 2024 22:32:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="Zq+wRQXn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
 [209.85.167.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8C3E10E0DB
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Feb 2024 22:32:40 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id
 2adb3069b0e04-513235b5975so224596e87.2
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Feb 2024 14:32:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1709159558; x=1709764358;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:from:to:cc:subject:date:message-id
 :reply-to; bh=4heZpp/8xaL9FF64v4iIiRVohxYlLTlgxw9EvqHEm0U=;
 b=Zq+wRQXn7Rcp1GlejbMknHlRNnI/TI3hTWP6ovSOBovDXBZR+nznSFb9vcrbpbHfvP
 RfNzXpZ+HTbMthZLFevCfczXk3pgd+I8jhJVHLqxqGHP1Yi//UwNNwd2bRHqT5s8B/vU
 97JAmbo49O4vOakAGTaSTu5tSnIgShu0yKhVU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709159558; x=1709764358;
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4heZpp/8xaL9FF64v4iIiRVohxYlLTlgxw9EvqHEm0U=;
 b=wCKSc93OdCm3hO3O/YfzK5SMuFhfO/AS6C6QkDIpLiyuixAr2E7eVLWAhmt0CFH2PX
 cox68JCIiGjEUT8eyw/zTkHl1rbldi0p/gs93KJo8bnBmsvQS15P2RoJlffBQgRH0UOz
 NAdjlsqQ37FOb7LvHmxF2l0ydcDLa2WwZ2nnijhHzvcAsWu2jvcuHWJWW1NmRysRv+Ve
 qAtccSdhBWpqDZTv8dxxLUTgqYlseXXITVduTjzMtcXo7s4to7EVKK7WAeqkmd9Tr9ss
 DTa8CUQOIeB3ubqOdkK1r7MENznlxboaFP/Q3S4IPwA777NhsZlOJ6aks5HmqlXU2hnr
 sd5A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVzvcAwr43o+UYgGkInNi38qFHmo9yVzaT7HEjF5uONQNY4YSRqlxRiyzsgfsYxpGAXXthhglmau/fdqgwGJC0f89hOCsGxkTdBwPXfdxbd
X-Gm-Message-State: AOJu0Yx6DBHSeS91YH89ltwMcM4DggOCg3m/FByWFKJ/onNPP9rrqytU
 B5xyxABAWr0Ch+yeQQaoncNbaYppjasxPQ+3By5XDpjzxZH/2vxwLt+3zkS21+F5ihw634m7R47
 tI06tS7GC5tkUDtdYdLdb75W0VW2nD4N2V4Xo
X-Google-Smtp-Source: AGHT+IF8m5eUpgTa0zbHHmuuse1uPPlb5cH3BKyK6w6U3t5iw9hTZuDz5U5AYc4RAvuOLPpkAFPsDX9RoXeg8idDs9k=
X-Received: by 2002:ac2:544f:0:b0:512:b3ef:350f with SMTP id
 d15-20020ac2544f000000b00512b3ef350fmr151977lfn.49.1709159558498; Wed, 28 Feb
 2024 14:32:38 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 28 Feb 2024 14:32:37 -0800
MIME-Version: 1.0
In-Reply-To: <20240226223446.4194079-1-dmitry.baryshkov@linaro.org>
References: <20240226223446.4194079-1-dmitry.baryshkov@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Wed, 28 Feb 2024 14:32:37 -0800
Message-ID: <CAE-0n522_pS0ructcKgbNY6gNpfn=s+83ha94N7A16adq0OoRg@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dp: fix runtime_pm handling in
 dp_wait_hpd_asserted
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Rob Clark <robdclark@gmail.com>,
 Sankeerth Billakanti <quic_sbillaka@quicinc.com>, 
 Sean Paul <sean@poorly.run>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
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

Quoting Dmitry Baryshkov (2024-02-26 14:34:45)
> The function dp_wait_hpd_asserted() uses pm_runtime_get_sync() and
> doesn't care about the return value. Potentially this can lead to
> unclocked access if for some reason resuming of the DP controller fails.
>
> Change the function to use pm_runtime_resume_and_get() and return an
> error if resume fails.
>
> Fixes: e2969ee30252 ("drm/msm/dp: move of_dp_aux_populate_bus() to eDP probe()")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
