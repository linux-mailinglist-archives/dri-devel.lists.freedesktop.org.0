Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 497A89E2B19
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2024 19:39:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A281210EB17;
	Tue,  3 Dec 2024 18:39:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="apLcM6/1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com
 [209.85.208.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4C7A10E480;
 Tue,  3 Dec 2024 17:40:16 +0000 (UTC)
Received: by mail-lj1-f176.google.com with SMTP id
 38308e7fff4ca-2f7657f9f62so57433331fa.3; 
 Tue, 03 Dec 2024 09:40:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1733247615; x=1733852415; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=o45TGeBjwffMHzroCW3wP027izyDAOnE5VUTAs6kvFc=;
 b=apLcM6/1N2jQVYM91N2Kf8tKyTaxUFN3ay4EVzvMcNR8vQ44D3Ul2pqNdlwf6uPsci
 6Lwsj7cLON6S+msDNTf2E+TzZc/UY1V2i9Bgbi0PtInej/2WeyCWpeZh656KjJgblNx9
 vycSD9UgQS1PzYAr9JBl1MVKt777rpU/BzUHWT6LloBvryltMaTaKQd3oUOZSG9LigLe
 FvdHpMfe0neNU4rkjTiydgE+Hz+8s1WyT1hMh6Ro3iKVnt/+HddE6/NZ1TXq9RQwFhp+
 X+KvG9CLTLfGFBf2g2qvPWeyiKZzDhOlp+CPwx4VwkTbUZTOVWFhpJ94H3bUuJ0P5Ups
 vS9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733247615; x=1733852415;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=o45TGeBjwffMHzroCW3wP027izyDAOnE5VUTAs6kvFc=;
 b=hMRk4BlHKaDiJdUjvA8jfhYdFKrq0rULG/cMPo6xxSsp1Ztas1pCgidSynYZiBmszC
 TUjOnwBcpBU+xG68Ts/lL0ZnIZ8R7+O1qD5qWwIMgViNnHDRfM2Ux3DB0nwEQsKWagDi
 pmjnGfGkAbOPLx5OZvV/nWFtnZuR0huHIlD+iIZS1lSpjGT4n7fOoqbj1HS+t/C9K/T4
 FOEKum/ciaPM53m40Tt/8JLMIPqbHdtwms4swoCCBKyd1dCqrB8KtvcluPxXqL4nEVIp
 nzh1wUVrReDX7IpPS652bz2o44LLEWUngsS7IOolKsELG7hZv7HAy7atH0P4xCLUADle
 uULw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUh/9noCN0VHC7mtkoLBydD0Y7UBTUlxpS16xsPbfzyM9ZsC9m2YQWUt4cYg5w+EcUxYPkNDI2jQf1A@lists.freedesktop.org,
 AJvYcCWNz6qdDmUxUVo4yGE8Pm0UmOzNNf84UPei2XKiSoxbejIPWt49hrWwaFcyGf2TLqmek0c/3URSuJI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzbNePs7SrJa0xAkyqI0d2dgTGJd0UC/GBb2JbzpmuvWUe7EmeJ
 CtBCTR/q6UYpN/xTTzk0UYtaaIYuP4qe4sG10qVHF/V4lvTa2dlQ
X-Gm-Gg: ASbGncu3vTzF7v7ugi5kbtWbvivXzKof9D82qjsUWDGNgitDecuD8nxCFYc1RLsx+I3
 i8Wd4vuDfdkKo5nElRj6RPKvVSZsgdBn6imuGsEazEhAgwrWGBhY6pYMULXxpkM5hubjKWgMkVW
 ZQH93TGZiWKI8vi6WhjQh/5eSahPOyZR9clYDJsWfGvRi3D/wwz1NL7qNOMl3iRmjWcyzVEJrWI
 h1Jz/2yOmnrvnv9Nux9VyYcAiZYWOFasaRLKk3tXknhroEH/cqZdIEXeYSc0z/H0On1cQ==
X-Google-Smtp-Source: AGHT+IHyfyc9zXaTnCOmMl6VbehAO96siV58POqRcngPBtFnWCrliNbdFWBpVUngW+czn7b1hA2Hyw==
X-Received: by 2002:a05:6512:10d6:b0:53d:cd25:4a61 with SMTP id
 2adb3069b0e04-53e12a22fd7mr2111831e87.42.1733247613145; 
 Tue, 03 Dec 2024 09:40:13 -0800 (PST)
Received: from archlinux.tail7f7b1.ts.net ([195.136.68.87])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53df644aab7sm1912115e87.106.2024.12.03.09.40.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Dec 2024 09:40:12 -0800 (PST)
From: Danylo Piliaiev <danylo.piliaiev@gmail.com>
X-Google-Original-From: Danylo Piliaiev <dpiliaiev@igalia.com>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, danylo.piliaiev@gmail.com
Subject: [PATCH v2 0/1] Expose UCHE_TRAP_BASE value via uapi
Date: Tue,  3 Dec 2024 18:40:10 +0100
Message-ID: <20241203174011.731980-1-dpiliaiev@igalia.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20241203095920.505018-1-dpiliaiev@igalia.com>
References: <20241203095920.505018-1-dpiliaiev@igalia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 03 Dec 2024 18:39:38 +0000
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

Depends on https://patchwork.freedesktop.org/series/141667/

The parameter would be used in [1] to implement VK_KHR_shader_clock
and GL_ARB_shader_clock. On at least a6xx+, shader could read 64b
ALWAYSON counter from UCHE_TRAP_BASE+0 address.

Downstream driver exposes uche trap base via uapi only on A7XX+.
However, from testing, we could get correct shader clock on A6XX.
The uche trap base value is not used by Mesa for A4XX and A5XX.

[1] https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/29860

Danylo Piliaiev (1):
  drm/msm: Expose uche trap base via uapi

 drivers/gpu/drm/msm/adreno/a4xx_gpu.c   |  6 ++++--
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c   | 10 ++++++----
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c   | 12 +++++++-----
 drivers/gpu/drm/msm/adreno/adreno_gpu.c |  5 +++++
 drivers/gpu/drm/msm/adreno/adreno_gpu.h |  2 ++
 include/uapi/drm/msm_drm.h              |  1 +
 6 files changed, 25 insertions(+), 11 deletions(-)

-- 
2.46.2

