Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D435810676
	for <lists+dri-devel@lfdr.de>; Wed, 13 Dec 2023 01:28:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F7F110E159;
	Wed, 13 Dec 2023 00:28:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x112f.google.com (mail-yw1-x112f.google.com
 [IPv6:2607:f8b0:4864:20::112f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E53D310E200
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Dec 2023 00:28:17 +0000 (UTC)
Received: by mail-yw1-x112f.google.com with SMTP id
 00721157ae682-5d33574f64eso64174117b3.3
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Dec 2023 16:28:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1702427296; x=1703032096; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Tb8aSVzncfyxWYm9ow9y0V7DPZwSdLYGXr8ZJbeVeXk=;
 b=L8N718WG2MXpQ3SV4JlfnEWwu1RGGJLtFqhBBW+NXOXBjhgPuL+KSkxrCAdoUj2Cq5
 4XUK6uPAzCcbY8vBVoJcSwZhlwowpBaEMA6T1KmaRSUmr6hx1LdzAf6j+X3w0FTodl6C
 vXnbaTiiySHqIpOQmsXgkIYqsquYltUMvru/5bynhpDyZpd4bzLrkZDCE2BQzHR/5+vg
 GXmwwJuPYtfIuqG/1BosK4M2dLXABacj3uQqCjWWmeiPw4bmgkWmVcdEvAV7DFdc4apJ
 uyjWvNnMeTiFL22NAROrUAN1dPmBl5a+yKsO5P3bVHnKJEusu2HPNfHJ/EbGNq38EIr1
 pvcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702427296; x=1703032096;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Tb8aSVzncfyxWYm9ow9y0V7DPZwSdLYGXr8ZJbeVeXk=;
 b=RD/2IWnpO97GzrJ/0hsZ/XJ8TXs22wc59L1EjTzk/95OrQtTO5uL1x6me3146mn4c9
 VyN/gtPPrXewLd/HrEgokdbVpI0oCVn80FUvVgIgllMByjBPiJCte7AUs23q3dncthNG
 zBAHn3GoR3fLdIgT7XQdXMSdn1JAGeszsde2XohuKk1lxFVZdGJmw50e0yM/eE1hy3Cp
 75rnsEQTV80rcYKfn0neLKBQDEVDJwxNZhp6+cNhyQ7r0nkctNDixl9M6H5BrwfNpQR3
 oXrE26uXd+xgaMoyQQdd7sXiiZIjl9VWPi70ptHPBDC9/wWlw0Mi7ZHVfWU9ikmhc0r4
 p7gA==
X-Gm-Message-State: AOJu0YyE7eBuGgI5hCmYFiQkoAeFux9bllkFHMmwrH556MkJ846zmp5/
 hd9oYGcXb2XjI3Z+fQ0639csULqHjqwpC287aS9Gfg==
X-Google-Smtp-Source: AGHT+IHG/jUedozgL5SGa448xXkNlA78a/sNsmuZlJogKjmEDh0VLDGbZPHcXZSz85VeopQiVm5cQCRmqKovzMN83i4=
X-Received: by 2002:a0d:cb0c:0:b0:5e2:bd18:b253 with SMTP id
 n12-20020a0dcb0c000000b005e2bd18b253mr87186ywd.24.1702427296677; Tue, 12 Dec
 2023 16:28:16 -0800 (PST)
MIME-Version: 1.0
References: <20231212231101.9240-1-quic_parellan@quicinc.com>
 <20231212231101.9240-2-quic_parellan@quicinc.com>
In-Reply-To: <20231212231101.9240-2-quic_parellan@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 13 Dec 2023 02:28:05 +0200
Message-ID: <CAA8EJprRknmPSh-7iYMp6vBxcbBDSyp4fyD3VtXUxeVzp-F2vg@mail.gmail.com>
Subject: Re: [PATCH v4 1/1] drm/msm/dpu: Add mutex lock in control vblank irq
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
Cc: quic_bjorande@quicinc.com, linux-arm-msm@vger.kernel.org,
 quic_abhinavk@quicinc.com, dri-devel@lists.freedesktop.org,
 swboyd@chromium.org, seanpaul@chromium.org, steev@kali.org,
 marijn.suijten@somainline.org, quic_jesszhan@quicinc.com,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 13 Dec 2023 at 01:11, Paloma Arellano <quic_parellan@quicinc.com> wrote:
>
> Add a mutex lock to control vblank irq to synchronize vblank
> enable/disable operations happening from different threads to prevent
> race conditions while registering/unregistering the vblank irq callback.
>
> v4: -Removed vblank_ctl_lock from dpu_encoder_virt, so it is only a
>     parameter of dpu_encoder_phys.
>     -Switch from atomic refcnt to a simple int counter as mutex has
>     now been added
> v3: Mistakenly did not change wording in last version. It is done now.
> v2: Slightly changed wording of commit message
>
> Signed-off-by: Paloma Arellano <quic_parellan@quicinc.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c   |  1 -
>  .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h  |  4 ++-
>  .../drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c  | 32 ++++++++++++------
>  .../drm/msm/disp/dpu1/dpu_encoder_phys_vid.c  | 33 ++++++++++++-------
>  4 files changed, 47 insertions(+), 23 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
