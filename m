Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44676861003
	for <lists+dri-devel@lfdr.de>; Fri, 23 Feb 2024 12:02:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7004C10EBB5;
	Fri, 23 Feb 2024 11:02:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="qqkSgiqT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com
 [209.85.208.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1C1910EBB1
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Feb 2024 11:02:22 +0000 (UTC)
Received: by mail-lj1-f175.google.com with SMTP id
 38308e7fff4ca-2d275e63590so1135031fa.2
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Feb 2024 03:02:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708686141; x=1709290941; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bvppDhK0MZnY3jxpyEm3NEhvlxl2cwohWdYTB048HdY=;
 b=qqkSgiqTyUY8PEyks5tyvf503lNNAeBHHuleoqDA0EOw0yH+WYRq2krtgYga8AP4sk
 vvse2sjCgE0A8vAYM6+gVlBjEspKDl+uGK/dkWlqFwkv21cjqZdZ43ecqsIYZ6RC1pCr
 xwM2r/54xDmZwQhsInd1xLNdsuChRjolE63rtm16HcmNtmTUE6H9AebWShSc82up9zxq
 iBbVdb7iLtVqnI+5nuVz+zcuVkUOHrdmhPmYe51rhud4AxFScJxqqm/HWHphUy7rl22k
 atYdzqVPCrLV7/Uz6MfiW1jbQKz9poe7MbkfglFD22w+6nxq1YOWYK46yxm7yXugjXM4
 1dDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708686141; x=1709290941;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bvppDhK0MZnY3jxpyEm3NEhvlxl2cwohWdYTB048HdY=;
 b=Y/sj51nphADARKMNbmeVBRXug4BlPg3rC+ZQC3wHYqiYdKNrOFp2YVzg/j/HTeCRZ5
 VArmC1nlCz/rzt2HQgSr4ybbuPCgEPDDyFwZaDLEMb0JiF1cA8052Zl7ePZrf44QJVaR
 k4/hPFpqwIYJHqmRVVDr4xAAEV4hBAxN3OZSZlqcytOajLjyFofVAh4bY4wWlbQ6adNq
 I2E/d1JmN4PxZ04ue9wiJQ0svyaeQZhK+/MeMsrvPnO1JQQ5gw5Sl3H4OwAbQqsz6fsf
 cvEYnU4Nf6FWE0Nb13mA8wBu6Hfb2JVCmgk6cJo/3O4Oj01c2aKrsdKvSUY1YvqIF/EU
 hmgw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXua4hxopO7DwsiUvoXu1VNlDiUNW5HwvE2yaN5QflcktOx94NxKaya9jITDMyvd2ZcqbA0PrH8srKnd5PQvVvaAT3cY+ohZR6bjApr+i1f
X-Gm-Message-State: AOJu0Yy5eXDlzb7I+29hhkgFaP+R+W6EU1wwKF2+ZWYjGx337jHRT+ln
 NCiDeZDRpzbDKm5860B7r7zjczHQvT934w3EmAoTiLmULfCwJ3GCAx69YCTrXyE=
X-Google-Smtp-Source: AGHT+IHe13buZN2Z7XrUYfFH4yqhm26u3xIH5iaX49WfRIDSgqwB8o5s9c1/EMHFIlWHOBSHytQA6Q==
X-Received: by 2002:a2e:969a:0:b0:2d2:402d:2239 with SMTP id
 q26-20020a2e969a000000b002d2402d2239mr1063430lji.25.1708686140304; 
 Fri, 23 Feb 2024 03:02:20 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 r8-20020a05600c35c800b0041214ff06cesm1990363wmq.42.2024.02.23.03.02.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Feb 2024 03:02:19 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Vinod Koul <vkoul@kernel.org>, Johan Hovold <johan+linaro@kernel.org>
Cc: Jonas Karlman <jonas@kwiboo.se>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Kuogee Hsieh <quic_khsieh@quicinc.com>, freedreno@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org
In-Reply-To: <20240217150228.5788-1-johan+linaro@kernel.org>
References: <20240217150228.5788-1-johan+linaro@kernel.org>
Subject: Re: [PATCH 0/6] soc: qcom: pmic_glink_altmode: fix drm bridge
 use-after-free
Message-Id: <170868613914.4029284.5549880672870201262.b4-ty@linaro.org>
Date: Fri, 23 Feb 2024 12:02:19 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
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

Hi,

On Sat, 17 Feb 2024 16:02:22 +0100, Johan Hovold wrote:
> Starting with 6.8-rc1 the internal display sometimes fails to come up on
> machines like the Lenovo ThinkPad X13s and the logs indicate that this
> is due to a regression in the DRM subsystem [1].
> 
> This series fixes a race in the pmic_glink_altmode driver which was
> exposed / triggered by the transparent DRM bridges rework that went into
> 6.8-rc1 and that manifested itself as a bridge failing to attach and
> sometimes triggering a NULL-pointer dereference.
> 
> [...]

Thanks, Applied to https://anongit.freedesktop.org/git/drm/drm-misc.git (drm-misc-fixes)

[1/6] drm/bridge: aux-hpd: fix OF node leaks
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=9ee485bdda68d6d3f5728cbe3150eb9013d7d22b
[2/6] drm/bridge: aux-hpd: separate allocation and registration
      (no commit info)
[3/6] soc: qcom: pmic_glink_altmode: fix drm bridge use-after-free
      (no commit info)
[4/6] soc: qcom: pmic_glink: Fix boot when QRTR=m
      (no commit info)
[5/6] phy: qcom-qmp-combo: fix drm bridge registration
      (no commit info)
[6/6] phy: qcom-qmp-combo: fix type-c switch registration
      (no commit info)

-- 
Neil

