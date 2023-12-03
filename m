Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC7088022D5
	for <lists+dri-devel@lfdr.de>; Sun,  3 Dec 2023 12:26:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21EC710E27D;
	Sun,  3 Dec 2023 11:26:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3DEB10E150
 for <dri-devel@lists.freedesktop.org>; Sun,  3 Dec 2023 11:26:37 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-50bf37fd2bbso234212e87.0
 for <dri-devel@lists.freedesktop.org>; Sun, 03 Dec 2023 03:26:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701602796; x=1702207596; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=koAqGh0cj+nLPUz5qL1jbnlsGU4HEcI7UrtOHweSbBA=;
 b=usa3RM1anp2vj84jaiahFWLYQVTkLH8XrgDlXm0JhA29tshjs/6IRurQiml5d7a150
 /91qrA0bZvUNHShVlAMcPntzyYVF4RZFBnHdfD0gPHPwzMp2t1jLKUl06y3JXDwKLJ1q
 NAvw7VX0YsyfOCJnpQERoe4VUDRDn7eHWQ6neaVvskY3EqgdGhlwa/liU+9SCx7FhgZ1
 YA+bS6ymxlJNo7Cnb29M7VHX++/1R51xpEXVgnC5kgBDvmbIUMrLtIg+gozcYGZHnVXU
 SVxuv2gWmZJiYVaV7ZtUoBeC+gMtwFZYu/clMyX33FdqXX+tnE25LBQKJ7vp/XKSSSY7
 22tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701602796; x=1702207596;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=koAqGh0cj+nLPUz5qL1jbnlsGU4HEcI7UrtOHweSbBA=;
 b=AFitWqTbJAuEuMmQiTbuehzVfAdBmqmqsaokGLOlFdJL5EWVGEz6D0D6Wz+QBRor1p
 DnmO0yVhVf7ns2yS4HKzUjD1GUKaatUyqhpxNcQzwgg8tJD4FM/a1I6V8dzsFHDkM5SC
 v8sZG9oYynbC9t1AzmRkaOzdUJL/qoEd3rg61Ek+BLkaebT0dkztapvNhVTOWRxJSpwO
 pw0JhKD9KWgYMOxihGo47I7loKPfe8Sr9GqU/F9h7unupsY7L9tGc95s3IEuPbcW21H7
 v7JtO2h2Xekw4V2WmqLxg6wmiNfArAnsIKFBDoG0kPaSGE7LrLJmNW2ydjUfMMAR3r+F
 iIJA==
X-Gm-Message-State: AOJu0YwsHZj+Axxe6CBrl/GYHK64Cw3tbATwQA2zExToQhS2hkXjoBs5
 CeByz1V9QBqj0/3mlcQ7zzejhQ==
X-Google-Smtp-Source: AGHT+IFz1UZg+IADQFOUUwTq97nEaOdVnYEhDmuOk4ptxlXnCGzHfkwjiJBilMQGd4g08msgpAUxKg==
X-Received: by 2002:a05:6512:15a5:b0:50b:f3fc:1261 with SMTP id
 bp37-20020a05651215a500b0050bf3fc1261mr235997lfb.1.1701602795987; 
 Sun, 03 Dec 2023 03:26:35 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 b9-20020ac25629000000b0050bf01760a1sm241224lff.295.2023.12.03.03.26.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Dec 2023 03:26:35 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH] drm/msm/dpu: enable SmartDMA on SM8450
Date: Sun,  3 Dec 2023 14:26:20 +0300
Message-Id: <170160265548.1305159.2635502754416345095.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231009165627.2691015-1-dmitry.baryshkov@linaro.org>
References: <20231009165627.2691015-1-dmitry.baryshkov@linaro.org>
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Mon, 09 Oct 2023 19:56:27 +0300, Dmitry Baryshkov wrote:
> Enable the SmartDMA / multirect support on the SM8450 platform to
> support higher resoltion modes.
> 
> 

Applied, thanks!

[1/1] drm/msm/dpu: enable SmartDMA on SM8450
      https://gitlab.freedesktop.org/lumag/msm/-/commit/a9bd555de5e9

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
