Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 177A0A474A2
	for <lists+dri-devel@lfdr.de>; Thu, 27 Feb 2025 05:38:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBCF110EA37;
	Thu, 27 Feb 2025 04:38:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="qFBsj8XZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
 [209.85.167.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AE3B10EA2C
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2025 04:38:04 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id
 2adb3069b0e04-54943bb8006so477877e87.0
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Feb 2025 20:38:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740631083; x=1741235883; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5mpbDw0Fet6YkuQYRz4hIjFDxEEh0ZsoMbrqLONn3kY=;
 b=qFBsj8XZRzDdHTtSFhvB9Pr/HFakJfTBNJup/R95lBii8lVB/lIjNjQmk0L3hR6Z6b
 8U7DdsNIlgrRFt0hQmVSArSWvHP9c2G7Mo/8mlATL/RBUM/Sn3u8DKLoxdUNBgUHlSs0
 cP1KkqRqazUPX5MddLH6v3ghZE72PGShPQx61bUgSnlgxrfAotTXBW7Na8ouDNNXuoEL
 D3h5j654of4qQ4FcekwX15ief4Ij5h7QTq0NmkR4KSyeSW5dDX1nkc8jctMfRLcUHVZJ
 myY55BVf5tuHyJhgrVde93F3ee8VQSv6pJ5GfbMAT4nb+XsmIS5+uuq9Qx4DyKhMwJLF
 wmxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740631083; x=1741235883;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5mpbDw0Fet6YkuQYRz4hIjFDxEEh0ZsoMbrqLONn3kY=;
 b=nfiZfTDqsbm1F/wwmeBnxPMyPVvajHe9rxhfOOeHiB069GXPDKm13PbOBQrcK45WrT
 GUhCNi2G6doI330ACc+EEUkYoxT5Jjc9Fj1BvvJWcwEJ2b+U7D8Fda1GFAryAOxtXqBQ
 qvLP/sl0CtnKZGeyclKw9Hpcj1/ZyBJ4kKXkB74x6UeaiIIgKnNvE0d/UKcXdYgmzxSL
 RyxDSwKX3ExjYVd5dA4o79X+UTISUYxgjs0YNGd5OT2wFmemTZGfYVjmvSyNvwHQUg8g
 zq+HuwZ5njF8nnhC4P+cnCR/PdqGMJ9n0KWltnK42rfApuw6zHbSdYxosLYyEJFcZJl4
 XUjw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWw/DrTVYu3mFnpSdPn4zFxq0MYw4vLPSbRHQez0iEnb3yHTuUvhtv+lP8MM2xj4lZz6mcKuG5nb+s=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx3nXGJK1bSUW1ZqQ/aTbvYGzhAaS0MvzRVj9vZ+ZUxHczV+KXi
 ElK+Nm7G3OEL4HiVn8Ti+3FPN19Oj7FU5m+hzRor3m1jhkSr4r3PwPrm25xQBhI=
X-Gm-Gg: ASbGncvPz5gVVJ1FhUTHJTBxz6I4XLUclPZDCkwPfwou4GTMjI4y4EUrAZM/m0jTkbL
 cXD8lzZIId0l1FxvyMcD3OuLNAudZzXbKvoRE5eZrzQEKmecP26UTOhc7ia14UEsR9Fc5xxk2WF
 8OmT69tS4j4vWOD8FnwOgoqawPHbgS7kvWs621qoUUm/tGlo2pPgHaXQ4bahAbC4+frBytJD9E9
 uozqZXgIo7lYZKrP1XXggg9xKbuT5UueWw2yCVc8YayAmJ/KyqvMeditk5Egzg+KmUC0QFqnm+X
 /W5WpWUw6po7pGFfymlicgeyEXpvRSbgpqv3qSXVDQ==
X-Google-Smtp-Source: AGHT+IFgxjAKrvkpIGrRkJYBcLkZa/TaKD/dJweGI7YYBbQ4EzNsK1UsZ/cS/Ce561pRPgFymoguLw==
X-Received: by 2002:a05:6512:3ca9:b0:546:2ff9:1539 with SMTP id
 2adb3069b0e04-54851109cfcmr5718647e87.52.1740631082596; 
 Wed, 26 Feb 2025 20:38:02 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.90])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-549443ccf45sm63485e87.229.2025.02.26.20.38.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Feb 2025 20:38:01 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
 Vinod Koul <vkoul@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Archit Taneja <architt@codeaurora.org>, Hai Li <hali@codeaurora.org>,
 Marijn Suijten <marijn.suijten@somainline.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 ~postmarketos/upstreaming@lists.sr.ht,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Martin Botka <martin.botka@somainline.org>,
 Jami Kettunen <jami.kettunen@somainline.org>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>
Subject: Re: [PATCH v3 0/3] drm/msm: Initial fixes for DUALPIPE (+DSC) topology
Date: Thu, 27 Feb 2025 06:37:32 +0200
Message-Id: <174063096231.3733075.12359628764026922067.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250217-drm-msm-initial-dualpipe-dsc-fixes-v3-0-913100d6103f@somainline.org>
References: <20250217-drm-msm-initial-dualpipe-dsc-fixes-v3-0-913100d6103f@somainline.org>
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


On Mon, 17 Feb 2025 12:17:40 +0100, Marijn Suijten wrote:
> This series covers a step-up towards supporting the DUALPIPE DSC
> topology, also known as 2:2:2 topology (on active-CTL hardware).  It
> involves 2 layer mixers, 2 DSC compression encoders, and 2 interfaces
> (on DSI, this is called bonded-DSI) where bandwidth constraints (e.g. 4k
> panels at 120Hz) require two interfaces to transmit pixel data.
> 
> Enabling this topology will be hard(er) than downstream as hacking a
> layout type in DTS won't be describing the hardware, but "dynamically"
> determining it at runtime may pose some of a challenge that is left to a
> future series.  Such changes will also involve the 1:1:1 topology needed
> for constrained hardware like the Fairphone 5 on SC7280 with access to
> only one DSC encoder and thus ruled out of the current 2:2:1 topology.
> 
> [...]

Applied, thanks!

[1/3] drm/msm/dsi: Use existing per-interface slice count in DSC timing
      https://gitlab.freedesktop.org/lumag/msm/-/commit/14ad809ceb66
[2/3] drm/msm/dsi: Set PHY usescase (and mode) before registering DSI host
      https://gitlab.freedesktop.org/lumag/msm/-/commit/660c396c98c0
[3/3] drm/msm/dpu: Remove arbitrary limit of 1 interface in DSC topology
      https://gitlab.freedesktop.org/lumag/msm/-/commit/d245ce568929

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
