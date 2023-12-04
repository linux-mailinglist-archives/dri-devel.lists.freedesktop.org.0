Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C2B2803EAC
	for <lists+dri-devel@lfdr.de>; Mon,  4 Dec 2023 20:46:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C32FF10E371;
	Mon,  4 Dec 2023 19:46:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67DB210E21C
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Dec 2023 19:45:45 +0000 (UTC)
Received: by mail-lj1-x22c.google.com with SMTP id
 38308e7fff4ca-2c9f559b82cso23698281fa.0
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Dec 2023 11:45:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701719143; x=1702323943; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OL0YCwWLeVAAaS8V6Q9QVlcCyCHJm88AKIY6T+RHXgI=;
 b=N499cnHt4MgsaGhx+GVO3wA3q+N9A18+rImdECGCMZy7F/hbpU015wFSuQ8fYR2lHp
 yoJSXgRdi29UMukhFJGZoqD/fgHClnOKODMeFCgnD1V8ZsTeOK6LfLYNLqeJJ7d1TpXW
 26z+H9n4td35/ZF7/yT5HO7gPWJjIWGR5aL9cOS2Jq92dojE4yEz1BTP41waHjTP3Ocr
 daWygrFGeZmKuT2tHX8tiSy+GUV8z4Q0GZVkZz6+R2h6vCHLZnO9XusJjET3aXlKaA0q
 OZj5dN6GdG6GUxhBsguc46PTMIVONoWcKJTd2Hn25EHIbALFe3JpPWQz3NcysQVMUXP2
 SEfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701719143; x=1702323943;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OL0YCwWLeVAAaS8V6Q9QVlcCyCHJm88AKIY6T+RHXgI=;
 b=Z/OrXJMfz8UvIqgTucq2Vg3lvxQAOLYmPn2MUy2P/G/+5K/yxBoWBsczq7NQuLc2c4
 3isSjHDB+y+OLJ5DcUFY4NjdRGJPuHk6alvvamaS1fXBvR3biKYbR6STLza1v0gGlJuh
 sFrupC6McuohHDVQ5vMsEFHAG38yhYiVZCpzvegpL4Mqsf2wfFNNr61BvrzJsfUSRquL
 r6K/jeXGTATdNA+c0FyQYa9abzMZhzqPWYQYx4hQoHeUXazT9b3MD3ZYXaeqnwC3dHU1
 egTfLgN19EL2/cVEm2yOl6tfQWrkFPn5IV6GExZRnEdt8PDrLPW8h7x7lN+cI9ZG/Abj
 +JWA==
X-Gm-Message-State: AOJu0Yz6DSDhUJgF/WpOBsq7gg3/fKO2m6zvpoUhoA+zKVD4QQ6eo/g9
 1hMH/XjVMa3zd0//Tf5/DyUUTA==
X-Google-Smtp-Source: AGHT+IGUU2+rL+VrrRankPr+xbpBILPjIFZNhDvGINb4xeFiR7O7TGptVO7yxax82e3WI1uhyyeE2Q==
X-Received: by 2002:a2e:9346:0:b0:2ca:1282:d61c with SMTP id
 m6-20020a2e9346000000b002ca1282d61cmr116222ljh.15.1701719143192; 
 Mon, 04 Dec 2023 11:45:43 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 f1-20020a05651c02c100b002ca02e43f40sm455120ljo.74.2023.12.04.11.45.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Dec 2023 11:45:42 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Bjorn Andersson <quic_bjorande@quicinc.com>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Vinod Polimera <quic_vpolimer@quicinc.com>,
 Stephen Boyd <swboyd@chromium.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
Subject: Re: [PATCH next] drm/msm/dp: add a missing unlock in
 dp_hpd_plug_handle()
Date: Mon,  4 Dec 2023 22:45:42 +0300
Message-Id: <170171913105.1455672.8865445448285442373.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231204171317.192427-1-harshit.m.mogalapalli@oracle.com>
References: <20231204171317.192427-1-harshit.m.mogalapalli@oracle.com>
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
Cc: kernel-janitors@vger.kernel.org, error27@gmail.com,
 dan.carpenter@linaro.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Mon, 04 Dec 2023 09:13:14 -0800, Harshit Mogalapalli wrote:
> When pm_runtime_resume_and_get() fails, unlock before returning.
> 
> 

Applied, thanks!

[1/1] drm/msm/dp: add a missing unlock in dp_hpd_plug_handle()
      https://gitlab.freedesktop.org/lumag/msm/-/commit/801207c18834

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
