Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 892599A67D9
	for <lists+dri-devel@lfdr.de>; Mon, 21 Oct 2024 14:17:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A26A410E4B6;
	Mon, 21 Oct 2024 12:17:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="QuYxK2pt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
 [209.85.167.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A33210E4B5
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Oct 2024 12:17:53 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id
 2adb3069b0e04-539f72c913aso5086875e87.1
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Oct 2024 05:17:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1729513071; x=1730117871; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=a4XbVxeeKZbvEtWB+ooKpQYase0x2chrzmDf2sWa5VY=;
 b=QuYxK2ptteZ8BYe7asXouyKobnFrZs0Fw3+z7zusMxfO0FMinueYPI61Ja/YFUAA19
 QyqWRjRN9bxJwvEgn5/MAc6JLmDc4Zk7Phn9kMOxUhYxKsii/MbmeqIlLOw06id6iNwK
 WmuvkW5Y4R2JV6fXiKdKUh18QQ1/HOdXyVY3OOTIO9sBnq0xEgEPns6DLZp4VwhJq1pY
 xvQf5sJ7cAJo37KyEWaEhBbdZY/vnvFX4atBq2X5Fz72DlXiQsgeRx5nlL2AFXS13Pto
 uik+9qqbVdt8Z1Y8R+ySeea93konfvLyKpGLFXcCAztyBaUx9mxJF0BymhbWnNmN0Fbm
 Hj2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729513071; x=1730117871;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=a4XbVxeeKZbvEtWB+ooKpQYase0x2chrzmDf2sWa5VY=;
 b=ains5RMCIVwLT26z0Tae+DJp8qzS9o2U9v3MvhkZeP1x4XDzy41YBWDvXIBcNzTxW+
 VHOmNwdNGdpd/VODfH4+Ab19aS9+yHQo2RixILbStuqDjNQjeRxFyoMyo2MTkqon+HHk
 KSsQR+xskqeLg1BNezM1nG9sn8vJOB/Rvz6LrUD6XXFanIBGKufnAHBfbNSj7by9cqiu
 mhu4AQ96N5IlkrxPdG/sUXGuYX+ZJl6XpXyJEtHECKh9wXD9mijEpnHaoXIWmqoxFJjq
 bdgsuSyp9qk9E/+j4nsDyPZ0L6DAq7V/WxotRK6v8Y1hphEDpaYY/jhyp01FsZmyhDbl
 i6hg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV9Pvkk94WUxFg91tb9nYUoNZ0bHpxvfHWcx9GAJS7OE6qO5LuWW4Hx1103PQJW+MB5jHTtxiEdFT8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyYarOM0wcP7zebDZfNj5z+pe2lcI2m7XslNtLbwgJk4GWKLtm5
 /8LJ9OKOGxIoKOhvVy1Z8teZnDUpUVJFmwJpUWkDaVhwHz62V7MlA7IQd7uYOy8=
X-Google-Smtp-Source: AGHT+IHqv4mwsIjXZb0v6O893ub1mSBOA8nkk9+gOrcJG9wQN2aV6SmO6D5BhFYeJg15xKOKgafh2Q==
X-Received: by 2002:a05:6512:2356:b0:539:e317:b05f with SMTP id
 2adb3069b0e04-53a15229d00mr5612832e87.28.1729513071088; 
 Mon, 21 Oct 2024 05:17:51 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.90])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53a22431454sm464210e87.212.2024.10.21.05.17.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Oct 2024 05:17:50 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/5] dt-bindings: display/msm: dpu: merge bindings
Date: Mon, 21 Oct 2024 15:17:40 +0300
Message-Id: <172950935863.2053501.3423333346021124580.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241003-dt-binding-display-msm-merge-v1-0-91ab08fc76a2@linaro.org>
References: <20241003-dt-binding-display-msm-merge-v1-0-91ab08fc76a2@linaro.org>
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


On Thu, 03 Oct 2024 10:14:17 +0200, Krzysztof Kozlowski wrote:
> In 2022 the bindings were split each device per file, but this makes
> not much sense.  Devices are the same in many cases, same clocks, same IO
> register space.
> 
> Best regards,
> Krzysztof
> 
> [...]

Applied, thanks!

[1/5] dt-bindings: display/msm: merge SC8280XP DPU into SC7280
      https://gitlab.freedesktop.org/lumag/msm/-/commit/897ee967257a
[2/5] dt-bindings: display/msm: merge SM8250 DPU into SM8150
      https://gitlab.freedesktop.org/lumag/msm/-/commit/5a1f6295a434
[3/5] dt-bindings: display/msm: merge SM8350 DPU into SC7280
      https://gitlab.freedesktop.org/lumag/msm/-/commit/30c38fcd50d9
[4/5] dt-bindings: display/msm: merge SM8450 DPU into SC7280
      https://gitlab.freedesktop.org/lumag/msm/-/commit/abf0a19c493e
[5/5] dt-bindings: display/msm: merge SM8550 DPU into SC7280
      https://gitlab.freedesktop.org/lumag/msm/-/commit/342d48210577

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
