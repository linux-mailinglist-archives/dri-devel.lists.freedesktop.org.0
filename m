Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E09BDA37FB5
	for <lists+dri-devel@lfdr.de>; Mon, 17 Feb 2025 11:17:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75C5810E407;
	Mon, 17 Feb 2025 10:17:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Xsmuea3A";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D5DF10E40A
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Feb 2025 10:17:46 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id
 ffacd0b85a97d-38f2f748128so1225800f8f.1
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Feb 2025 02:17:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739787465; x=1740392265; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sjnizhfij0DxrLOw16h1FTCOX0FfuFrLDYVy7emG8Tk=;
 b=Xsmuea3As6aZ+Y6TSZZ6vKgn0KJct8ddD4a5SgPOeu/y9IY1TToif3Fx0pMmzbfRct
 2dZUWTjZvnJp9j4zpqdLjKKylVv/uGsvpp+Ri8o7/+Ddi37WtRs59Q8EapbWZ6tSBCvB
 2/mWk1xXgyEHKY34/NHsCnNeUrdDhvjb9MRXjguaOQFK3c7ST2wQStba3YS9RCY+eVYZ
 l8oOTWckxsbOk1fcVuOpluemPKCK8KRckzZDGDOaGT/k5MJC+U510aL5KQ5v9bifGfpH
 CcT5t2mQP8O+w7UyjZ9ZYbj7B0DOtWA4mhTVqX8xsSdAZ5FB+MBFahVk0YgfSFvsjQDa
 K/Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739787465; x=1740392265;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sjnizhfij0DxrLOw16h1FTCOX0FfuFrLDYVy7emG8Tk=;
 b=jfZ8F/aVHKvNrNCNQ8UdZOnLidMsK4xxBaQdSuuKwsyd/Y9MC8ayJm53r6B4/KhoRf
 kMMURJa7BNmpPmOvBhp3SHkKUKf51+VNONmMWc37JI+IG9OvtQ0Cbk78egRG/8qS55Uk
 BQeyu23hTO0VOSRu8Mboexn0MNiTc7WQ5fFmTOJ6m0OJLATx/J+T7Y/8KM2csmQcAmzk
 KZuHSWGFd9fmyJei4Yf0cf2gFhls0dGWuw+cNKBt869VvCVIJqythiESQPxK/CaNcCkj
 zb+ow1i3nD+JJeTQHrpvU57xuGeeXArBONlLjN/bKB7XvC1YsmYBlsjSVVGE1TOcR3w6
 f9Vw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW2H5PA6NKNz0SjSCiNszqr9Q6QJ2jP6j6asspZ0Dd3e90jL8pMsVJzh1CM5L81pHGSnn9EqKKmH+I=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz2rv4vg0isVT6LY6asGrNeUByVFdRs7my9q9u+XtLB1sgMnKsh
 cBFwDB6TwtZlXVIh2sEcN9pwXj690IiVZr9FL/1pwHexGblRxO2oTM4fvbsLWmY=
X-Gm-Gg: ASbGncvxJ2NT39EYCBYXt3OEY0jNQHSeWOIeTXCfh8yUkMaI+57e9xFVmz46E4N+BUW
 Ae2gWF9DiTrpXS1PHs8pBQ3+EB3diis05P1LLdYzQSaW2lb/vovC15WiRewvTiN4G6V8o5tsVNd
 u8IxsyjJcDXToZz7wLILX5wWLdw9uYNs7v/+fBYBzTjPyvjrDTF6QidmFTba8CgttMfz/0tiEb5
 C4kfY70VWnbzHPgKDeh7KbN7wqH6JTA3ALplprFEKa+YpVkVo2nsNaIUVPeOnsxiwtRj8x/5u1V
 4XY26QxRHfDKIPNiuGBW4MMlBAwpV0rIhw==
X-Google-Smtp-Source: AGHT+IF7XwyAqsyVybUOb+YT3My0TlrSfzZx4U/CaLhTm/XLeIcngPTFZD0Vb4ytwztWX6MVo98cdg==
X-Received: by 2002:a05:6000:402c:b0:38f:3a5d:e62f with SMTP id
 ffacd0b85a97d-38f3a5dea23mr6895087f8f.33.1739787464671; 
 Mon, 17 Feb 2025 02:17:44 -0800 (PST)
Received: from [192.168.68.111] ([5.133.47.210])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38f258dcc50sm12046297f8f.34.2025.02.17.02.17.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Feb 2025 02:17:44 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Akhil P Oommen <quic_akhilpo@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org
In-Reply-To: <20250109-x1e-speedbin-b4-v1-0-009e812b7f2a@quicinc.com>
References: <20250109-x1e-speedbin-b4-v1-0-009e812b7f2a@quicinc.com>
Subject: Re: (subset) [PATCH RFC 0/4] Support for Adreno X1-85 Speedbin
 along with new OPP levels
Message-Id: <173978746391.27110.17465291668859357570.b4-ty@linaro.org>
Date: Mon, 17 Feb 2025 10:17:43 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.2
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


On Thu, 09 Jan 2025 04:12:37 +0530, Akhil P Oommen wrote:
> This series adds gpu speedbin support for Adreno X1-85 GPU along with
> additional OPP levels. Because the higher OPPs require GPU ACD feature,
> this series has dependency on the GPU ACD support series [1]. Also,
> there is dependency on dimtry's series which fixes dword alignment in
> nvmem driver [2]. We need a small fix up on top of that and that is
> being discussed there. Hence, the RFC tag.
> 
> [...]

Applied, thanks!

[3/4] dt-bindings: nvmem: qfprom: Add X1E80100 compatible
      commit: 3419bdfd88e314bc5f80b02fa4651c81a0a85b57

Best regards,
-- 
Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

