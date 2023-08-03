Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 500CA76E6A2
	for <lists+dri-devel@lfdr.de>; Thu,  3 Aug 2023 13:18:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13B1610E5EB;
	Thu,  3 Aug 2023 11:18:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 099B010E5EB
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Aug 2023 11:18:36 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-4fe457ec6e7so1483195e87.3
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Aug 2023 04:18:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1691061514; x=1691666314;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yVMtPnE0Jb/J9QxlUytkL4duX4FZWHFBp/OP8kiAwAA=;
 b=kal3dk9nda2u/3tB1viAQMR0L+3pUMGDhUd2QCFVid4mUMGAdEKYuavISSPyIKokFD
 TgC/qi7ryRCd9vbKYXe34j0lFy5wG2FzNyEGiT//5VEW3KsPlLqEinqDhh0pu8tALa4k
 itRxbwI6lzjTXRBckCh4wCZU8FZJubZKt4TN3ga8ZIY1dWZYv54f3hKxAQhozdag9pKw
 NjPXZuM2ErBdtqp2Ac5BfFjAqIa6GRSgOZlNXihJpqxdPuOfMl7muoxEpHau7j6mmewH
 glCZas8+O4ga/Lxx4jIWsYZr3aD4Q1alTWeeUUrGbvWIQdINQ2CaAkxCU9TeqBktG/9P
 V3gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691061514; x=1691666314;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yVMtPnE0Jb/J9QxlUytkL4duX4FZWHFBp/OP8kiAwAA=;
 b=d6bq2gXx8JNJIhm/w0imNbVZisGy6CdWlh10XKncg5hdSykJEETTavCOb8BagKP7JI
 Jv0FpdHw0p3k9xTNCjk6wzDozksek+OQXf/yybSBrP/FVsKyq4+NXWd4QyYVTsVdbBuA
 e+JPffuwvlfWcV2WSQIwrONEn/3DoYU5xkQYMnbVyANP5MmgBAVpGgUg2v8wLY50s54A
 x+7wiwB6GjeLbXO1c2Dr+g4poBfZX4pNf+kTJ1OOcJxFaHqVRR/uOMB2RgVWfwOpKTEM
 NODuGuQu2oab6uu/Cp9t1qIflFSq69M2CzF+om42HaTZsTcvNKPS/jKRwkjQTRF4zsxQ
 UkuA==
X-Gm-Message-State: ABy/qLZqdHILNxyOJtfS+EZaFSFxS+TF/h3hfy1pFUa9eTEk2X6ZYtpm
 YfxhTnBRXYBige04H/UzD4NnCA==
X-Google-Smtp-Source: APBJJlH0pAA+7qtJlp2hvnz725PBTJoYabs1TKO9v3OgLTpxg8UmqkP9rCFsq0g7E9dMQnMgVshsdQ==
X-Received: by 2002:a19:e008:0:b0:4f8:8be4:8a82 with SMTP id
 x8-20020a19e008000000b004f88be48a82mr6449087lfg.22.1691061514124; 
 Thu, 03 Aug 2023 04:18:34 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 f14-20020a056512092e00b004edc72be17csm3296417lft.2.2023.08.03.04.18.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Aug 2023 04:18:33 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v2 1/2] drm/msm/dpu: fix DSC 1.2 block lengths
Date: Thu,  3 Aug 2023 14:18:32 +0300
Message-Id: <169106148046.4192382.8826688814736988415.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230802183655.4188640-1-dmitry.baryshkov@linaro.org>
References: <20230802183655.4188640-1-dmitry.baryshkov@linaro.org>
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
Cc: freedreno@lists.freedesktop.org, Ryan McCann <quic_rmccann@quicinc.com>,
 linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Wed, 02 Aug 2023 21:36:54 +0300, Dmitry Baryshkov wrote:
> All DSC_BLK_1_2 declarations incorrectly pass 0x29c as the block length.
> This includes the common block itself, enc subblocks and some empty
> space around. Change that to pass 0x4 instead, the length of common
> register block itself.
> 
> 

Applied, thanks!

[1/2] drm/msm/dpu: fix DSC 1.2 block lengths
      https://gitlab.freedesktop.org/lumag/msm/-/commit/e550ad0e5c3d
[2/2] drm/msm/dpu: fix DSC 1.2 enc subblock length
      https://gitlab.freedesktop.org/lumag/msm/-/commit/57a1ca6cf73b

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
