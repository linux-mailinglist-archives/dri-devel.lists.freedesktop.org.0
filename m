Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 120CA85A341
	for <lists+dri-devel@lfdr.de>; Mon, 19 Feb 2024 13:30:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EFBE10E39B;
	Mon, 19 Feb 2024 12:30:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="PXWy7PQw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
 [209.85.167.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21DD510E38D
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Feb 2024 12:30:48 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id
 2adb3069b0e04-512be87a0f3so179780e87.3
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Feb 2024 04:30:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708345846; x=1708950646; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qwFeD2TW/uU5GumRv4G8ieakQTAHSUrEMIKHabcQhzc=;
 b=PXWy7PQwoaR+I/7Fsfdr1n9/n2AkX/k1wRJl3qX9dSd4J+XPGkZOEnjSpNrBbHU0/a
 KUPXUKylE82/H6/UB/DDutHgHwob6H57FOgXpblVSKRZGG4Dmr+ioeuucr2FsKOIhix9
 /6AfcWt6e8AxrHc5iBHhwxNIs0Pu1DG0XojqYdqaVFNtOinDYGu4ILc1f3IsJg1XMAj2
 eRVfEoCDFv8TKalQWrD/ArM6R6k85L/YxS0rfzuxqRPayjRocFL9e8oCwloOUw8hlHYK
 mh3O4W5YFk8DrL+SkbQE7ppFPMRDh235VmlFINA4W6nVsdI9QcczZ7Uqho9pT0BgV6rh
 CUCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708345846; x=1708950646;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qwFeD2TW/uU5GumRv4G8ieakQTAHSUrEMIKHabcQhzc=;
 b=oxGz8Bh8kAinbNV58VUgWMM1XlWQ7OyAAH9wI40LTbThf8Fok3zUp4bj+6viJWWd5N
 OW+8JF295Ai+D+ceOPXsPLiNVqR5WTwufkiv/9UTLRKdYpI1Uc05KF7i3YVqmkSajiVv
 SY8ne5lM2gFO0UbQ/C6pYFpzhauc11GUp/9v0Ds7DFu8j95CBMW/2XEk3bNmmxeaFqwM
 QhhmEJx4Jp/nWmwcLCoWRlt4kE5NK65/QwlkZrLtmYuTkTM6DwF9lAmTFj81vrIbGQTc
 duo24BosnEB6VuhfPGG1zyHEL6vrN43MAGu6gt9hg9ZsSgO+GwruZMUaMGIGaWpa6kxz
 PsTg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUBJd9Vz4tYjQqCDMRipVsFO1jUa5ZYTVrT5EBjJNRDYGtn3C65JR77YgR1OCsswCgCmGkOAPdYxRsCNuZ5oTNkaBsasI/zqCZihTD4sl9Q
X-Gm-Message-State: AOJu0Yxyb8A7Ws8Ruuyc/j7vojxdZugE8MNMQvbmeukefBUR76hWhYdT
 gFhORPUPv95Q22s7TxG/c5uj0gaO00hMY/eHgCoBJ8CoTeWu0n1qw1/KMiBhq3I=
X-Google-Smtp-Source: AGHT+IGYJUPA8wfDjcJd31kJrR8PkED01i9VHPCaeoY4fbeqiJYl09s4pUBmXAHjIBppQ1CCqeCkiw==
X-Received: by 2002:ac2:4c14:0:b0:512:a820:3767 with SMTP id
 t20-20020ac24c14000000b00512a8203767mr3128533lfq.43.1708345846188; 
 Mon, 19 Feb 2024 04:30:46 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 i6-20020ac25226000000b00512bde4cddfsm90466lfl.148.2024.02.19.04.30.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Feb 2024 04:30:45 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Stephen Boyd <swboyd@chromium.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Bjorn Andersson <andersson@kernel.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Subject: Re: [PATCH 0/5] drm/msm/dsi: remove unused fields
Date: Mon, 19 Feb 2024 14:30:32 +0200
Message-Id: <170834569499.2610898.10326330561075740550.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231009205727.2781802-1-dmitry.baryshkov@linaro.org>
References: <20231009205727.2781802-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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


On Mon, 09 Oct 2023 23:57:22 +0300, Dmitry Baryshkov wrote:
> As a followup to [1], as suggested by Abhinav drop unused fields from
> struct msm_dsi.
> 
> [1] https://patchwork.freedesktop.org/series/120125/
> 
> Dmitry Baryshkov (5):
>   drm/msm/dsi: do not store internal bridge pointer
>   drm/msm/dsi: drop msm_dsi_device_connected() function
>   drm/msm/dsi: stop calling set_split_display
>   drm/msm/dsi: remove msm_dsi::encoder
>   drm/msm/mdp5: drop split display support
> 
> [...]

Applied, thanks!

[1/5] drm/msm/dsi: do not store internal bridge pointer
      https://gitlab.freedesktop.org/lumag/msm/-/commit/ec97f371895f
[2/5] drm/msm/dsi: drop msm_dsi_device_connected() function
      https://gitlab.freedesktop.org/lumag/msm/-/commit/891a8d83c11d
[3/5] drm/msm/dsi: stop calling set_split_display
      https://gitlab.freedesktop.org/lumag/msm/-/commit/51c139615b33
[4/5] drm/msm/dsi: remove msm_dsi::encoder
      https://gitlab.freedesktop.org/lumag/msm/-/commit/89cdd4dee1f0
[5/5] drm/msm/mdp5: drop split display support
      https://gitlab.freedesktop.org/lumag/msm/-/commit/df3c7899946c

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
