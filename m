Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4A3585A347
	for <lists+dri-devel@lfdr.de>; Mon, 19 Feb 2024 13:31:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04A3910E3AA;
	Mon, 19 Feb 2024 12:30:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="h0hVlqCx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com
 [209.85.167.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5921E10E382
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Feb 2024 12:30:47 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id
 2adb3069b0e04-50eac018059so6059338e87.0
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Feb 2024 04:30:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708345845; x=1708950645; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TU3RgHxGlzb++qXf2E7iGo81GOpfMcen8bTfd0uPCOw=;
 b=h0hVlqCxQokU7UAWxqciUAMv6k22X8kEZk1+u+M6lP6tMxGAcmfa+eUkPGggxFRMwO
 6M51yW0MLPiVbB3BAQkeBZQ5KwS5Yah3GPmWDz+lypH9NXlTdRmNGFOA8SHQNU3N23Zn
 Apg2rF7eVGAB4r85IdfHCJOsxkxvuoyeRuRFdtnw2tAudM71K+AjDUUNSl3jvs7wahQf
 9ePyqU5C23KbYpCzksJPhdJGpcBMs/sT2RgJH2+BwZ1nyOFJ7kcJEE4zvVTlsLXnkaWS
 gZcy5s+VPIOSv6dLZ7+vZfJSpu4ArPC63WKwHXUN/R4G2Q806HmCOaFmPAic8IXbrOD0
 aHuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708345845; x=1708950645;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TU3RgHxGlzb++qXf2E7iGo81GOpfMcen8bTfd0uPCOw=;
 b=wcos01OIeKHi2e9ShZ8cxeoryRH2NUuwv3UUXQlsW0K38R1lVXtQlyT6/EHsVewSDy
 gxPNSkOoOp1MqPg5AeVBhFxFLiOiTz4/yA47k+6JIO+o3fWfwgRarHA/dBU5PaKYsEhd
 FWaxWcDubK6BEtN5bd071m8/zXu4+ORPf3C4yFWsu56scT0tX+u3N7wXipKOcQo7UuVo
 dtrHzU9uapxQeuv6mOqgHBwMssqweOr0ip6LFbUFyFav5g0txu7DapnZjlR6oMNKAvHL
 hpT/yohj+lA7l43wBMP6KroBLHTLXyn9ODuGimvZvmJfL+LL1ZT75GatmM4iiWwerwAw
 q7Ag==
X-Forwarded-Encrypted: i=1;
 AJvYcCXRaBgFTPSyf+VS/7r2VXKUMdH0lQ69jMrvlPY5ydCFg2IkN3vzTFzJ5S+/oXnKWO0zH5uDlvXdkCPOMj/9TIeBebFCzaPjAu6q/7qqsQkS
X-Gm-Message-State: AOJu0YwnDUFx6qAvSKKCx+9UzTfmcZz6i1I7xJp2rAxKZdbitfIeCwl0
 Tt+qpAZyKolGfjV3WuQB3Xya7W9r1qkaQ44iP4J4E6zFNss4csgwbkN863ykiUw=
X-Google-Smtp-Source: AGHT+IHLK/rYF6Py4Eo3rBlxE89glGNXj0zjcGYdPTtAeNi/U0O/DpqKeN1TdI78YmnZYby2duc5vA==
X-Received: by 2002:a19:5513:0:b0:511:b3fd:76b0 with SMTP id
 n19-20020a195513000000b00511b3fd76b0mr7566336lfe.23.1708345845307; 
 Mon, 19 Feb 2024 04:30:45 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 i6-20020ac25226000000b00512bde4cddfsm90466lfl.148.2024.02.19.04.30.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Feb 2024 04:30:44 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 Colin Ian King <colin.i.king@gmail.com>
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH][next] drm/msm/dp: Fix spelling mistake "enale" -> "enable"
Date: Mon, 19 Feb 2024 14:30:31 +0200
Message-Id: <170834569502.2610898.13062983632738279958.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240212091639.2397424-1-colin.i.king@gmail.com>
References: <20240212091639.2397424-1-colin.i.king@gmail.com>
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


On Mon, 12 Feb 2024 09:16:39 +0000, Colin Ian King wrote:
> There is a spelling mistake in a drm_dbg_dp message. Fix it.
> 
> 

Applied, thanks!

[1/1] drm/msm/dp: Fix spelling mistake "enale" -> "enable"
      https://gitlab.freedesktop.org/lumag/msm/-/commit/fb750eefc492

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
