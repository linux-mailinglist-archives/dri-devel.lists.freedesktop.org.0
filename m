Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E42574F1D2
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jul 2023 16:22:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C4DE10E096;
	Tue, 11 Jul 2023 14:22:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49E8C10E096
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jul 2023 14:21:59 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-2b6f0508f54so89816091fa.3
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jul 2023 07:21:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1689085317; x=1691677317;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TPRZ+gd8UyrWIYMJdwLBfos9PmPvdWfLdvBP4AoMWik=;
 b=crfdsHFj0xaJim4f+GzG8D2ffkOD45sszrYOHqXmgHMac00P6Gdb1mH5pxVN5+CXdM
 h+ifOScpGauercsDe60g+l06HnEkqVt5c6aThrwHISqCO0Tqs8dGPU5PzycJkqabMm9L
 dcBgnFBCVQllEjUa5ZCfvQMO1ZIYton2blV5yCceyzVTTY4ZUzBegb+f9KPd9CML51uG
 2GGGQR7eNt0jH1akdTmO72HeqqLNaWi4KZKKOH11RxAKBww1PUJpAKs49I42ya0kewcD
 Rjc+ioCzX/t6LCBs3UHX10dB3I9LEe4DSATNtMgosBMkSQuimBCwqUE1rt1Pv4AlbtpT
 hOXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689085317; x=1691677317;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TPRZ+gd8UyrWIYMJdwLBfos9PmPvdWfLdvBP4AoMWik=;
 b=XC/Au9BkbEuOCI2jNdAtnSh3ao0MTvmtQFDP5n18nM4MJBC43p6RFjyb2ETtJUhp/L
 NPKLOUKUgU3XMQo5+PhZDSKBEn9TY4Ti3qVRFriTUKLoUXeqACCIXx3J18e8yu3Yb8cL
 k6l1SgsCjDE8iSeeK895WqKHkzqC11u16C27a1purEqp7h2QADP2A0JCwTluBIxpnRx6
 dlNaR3dMPYEcraJFJ2CSNUFevHcKdmeDYSfD7LKQlQFP3M6jchGo1YmshUxAQCntA4CQ
 hEntakPd1iMGx664uR20JdM6SGjmTZ+/0D2Gql8sQJJU0ohmDzXp30vdtP98/6N2b3Gw
 86iA==
X-Gm-Message-State: ABy/qLaDESIQNSGFrv3obtYZWh3hvzXSA9OxkZdJo8RI+YbgOSMZRL17
 pkesP0HBA+JKSAhw/NIpxlJSEQ==
X-Google-Smtp-Source: APBJJlFTDurkN21u+ewNMfSVswNiBS2LAEXhbF16OXkIr3d4myzfZtu9l6vxO2mrXrfETYbDSQcMmQ==
X-Received: by 2002:a2e:8e89:0:b0:2b5:828c:bfc7 with SMTP id
 z9-20020a2e8e89000000b002b5828cbfc7mr12544465ljk.19.1689085317129; 
 Tue, 11 Jul 2023 07:21:57 -0700 (PDT)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a0db:1f00::8a5]) by smtp.gmail.com with ESMTPSA id
 v9-20020a2e87c9000000b002b6b4424a28sm487934ljj.13.2023.07.11.07.21.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Jul 2023 07:21:56 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v7] drm/msm: stop storing the array of CRTCs in struct
 msm_drm_private
Date: Tue, 11 Jul 2023 17:21:46 +0300
Message-Id: <168908465045.1869384.13676671787620421284.b4-ty@linaro.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230519150734.3879916-1-dmitry.baryshkov@linaro.org>
References: <20230519150734.3879916-1-dmitry.baryshkov@linaro.org>
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


On Fri, 19 May 2023 18:07:34 +0300, Dmitry Baryshkov wrote:
> The array of CRTC in the struct msm_drm_private duplicates a list of
> CRTCs in the drm_device. Drop it and use the existing list for CRTC
> enumeration.
> 
> 

Applied, thanks!

[1/1] drm/msm: stop storing the array of CRTCs in struct msm_drm_private
      https://gitlab.freedesktop.org/lumag/msm/-/commit/274f16147462

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
