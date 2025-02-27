Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BEC1AA474AF
	for <lists+dri-devel@lfdr.de>; Thu, 27 Feb 2025 05:38:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1478310EA35;
	Thu, 27 Feb 2025 04:38:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="kHvMsi0a";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
 [209.85.167.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1374D10EA2F
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2025 04:38:09 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id
 2adb3069b0e04-5485646441cso497240e87.2
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Feb 2025 20:38:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740631087; x=1741235887; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7NuhwZJbo550PrQsjB4y/he3bzDbUt6ahCDwi8PkPv8=;
 b=kHvMsi0aVYXxIW9YwgJtgEnVKHpdGIY+LqvynU6K5FASZ4HpmfTuLhndk8Qvpy7ArF
 fmL4pnPMBZePk0Zou2KkhhfhGqwUDwSJiJ2ZJowTF1oVXKWFwvTjYGN09WmkAnLYG/yB
 h+UOj+iFgUg7DtF7bFNKSYDVGlQPnuMMEGsNKwiqbwnb7tW9gxEniGKp9XkfKO1wQ+TP
 vyfoZ5zQOnx3XIvU/Q4bs0iRcAz6WXDUNJ6PF/aDtZlJxdSIelY5o7IAEWZwScqG2kln
 AGtRKVzwt60PxbW+W6XETXkArPNdeIJyA9JYLpQItUH1FdOKTNuoNSPErAf/Ka40ftNo
 vkBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740631087; x=1741235887;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7NuhwZJbo550PrQsjB4y/he3bzDbUt6ahCDwi8PkPv8=;
 b=Ma+jjlwFxDY0Iyyc354G/S4mpMA1+WpheZoODkb3G1HQFGAWVyG+i6ghcTXFAuL+AE
 lSvmU6RpJ2x+UKk6JrolHzonHcHPkpK9d9hDl9KqQk8l2zQK+cknLKtHoyRjN62KLpUO
 lG/pzgL0Dubqzo4E0LoNPrKwF0fG9ioZGkjyQBo8iQRi2fp/sjM1rQLzVZfobvmsVH/v
 pGZ5xKI98CfvQU4HkBhHdWQSqx83o4boo6gK0zPqYiw1d8pVmln6qZcS+F1s7RLGmwQx
 /kRhQ0Zr39F2BS5gfLMSZgdNyJ3VDmECbgih6c/RrC2RoEoQZT4PjjY84idzBYm4lerQ
 jgHA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVIRFf7seuSXI4+PtcxCN0AbSypn9ctBx02D0ggZlGqDE0Z2PFaOqNQwihZgTG5YU2TVb/rE5v1R6I=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxfEm6pDupUTs6EFIzKntHjhaIdgl9IuQCuo1+sCP7h+HK62yCF
 4t3XLDA9CWIYxvuPETH1GxIlwrls2wZWKGQNPxeQEO1qWLqoFu33iy99tRb26LE=
X-Gm-Gg: ASbGncvGsttbQdqR0QNz9jfRCXSHgPG80zuvHF2dM5Maepb5zt5hS7ZJ1TN6l78MmvO
 T5ZeRRnZwd7J09VjLZPwC8smiYGRLkx8oTKSTJHkI66u3vBFvWJfilgsuvJz0HvCSWJQg5x7tr4
 rgT/hYcS04YwvkZZGhjYV+xyFznOWYhGVtDg6TL0j2HMkdStp8BVoiq7USqU53x70WhiKaXMqZD
 qk/1UaUgE1ocYaUJdS+9RRg5Uh/1WmMYS9upOUP6PkIPLQKvkLq6wi5yn5k6FuioOy4Hsn/eWpO
 D9g66BxT+LE76sH876/MFduW/p7eD+du++2dQP/7Eg==
X-Google-Smtp-Source: AGHT+IGRIdnpgZp6aVSnIAMxXRNTRhCc98UJKotB+jjdDT229PrZTyGg2gjdq/20fQUotbRi1XPCKQ==
X-Received: by 2002:a05:6512:3f19:b0:545:81b:1510 with SMTP id
 2adb3069b0e04-548510ce665mr5171090e87.2.1740631087427; 
 Wed, 26 Feb 2025 20:38:07 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.90])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-549443ccf45sm63485e87.229.2025.02.26.20.38.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Feb 2025 20:38:06 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Fange Zhang <quic_fangez@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Li Liu <quic_lliu6@quicinc.com>, Xiangxu Yin <quic_xiangxuy@quicinc.com>
Subject: Re: [PATCH v2] drm/msm/dpu: Add writeback support for SM6150
Date: Thu, 27 Feb 2025 06:37:34 +0200
Message-Id: <174063096236.3733075.3181882897632312941.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250114-add-writeback-support-for-sm6150-v2-1-d707b31aad5c@quicinc.com>
References: <20250114-add-writeback-support-for-sm6150-v2-1-d707b31aad5c@quicinc.com>
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


On Tue, 14 Jan 2025 16:55:24 +0800, Fange Zhang wrote:
> On the SM6150 platform there is WB_2 block. Add it to the SM6150 catalog.
> 
> 

Applied, thanks!

[1/1] drm/msm/dpu: Add writeback support for SM6150
      https://gitlab.freedesktop.org/lumag/msm/-/commit/23c0a9d36f78

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
