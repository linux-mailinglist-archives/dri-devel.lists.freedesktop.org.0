Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CAE777316A4
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jun 2023 13:31:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AAD410E4D4;
	Thu, 15 Jun 2023 11:31:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4139610E4CF
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jun 2023 11:31:36 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id
 38308e7fff4ca-2b4491aaf4dso3478251fa.1
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jun 2023 04:31:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686828694; x=1689420694;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3bQYiwI0riRd5ZPD263zPLo8B1Ez60Z4MDCuH7wIBjQ=;
 b=sWl8F2voBm4VFmhjOWk3Mvd56o9Q17pdEJv9OKmu6DX08C6AS4MlgML5SOfnv5fslC
 7qBZLjuUoIcOK9sSmwXsrygAORrMS4cr3gu6pxGmgED0Kf8eHW7QcCq6rkwN37PK0Qwi
 zmsQ40C4cNbcpmG44qwL8dILcT7HcqKRzcar6OU06XF3Mx9mMl1IA9floUpsxfa/Ba58
 yurRT51NVJOdVWVNUGIF7BzTv2+omNx+KlcDhPGSzDiHxOJz8M8GQgXVcD1dUxmAv0Ev
 cayZCZRY9fpfTyHgQbQzTeDYGNGXWiri7gr74KSNPDQaBD/difN/txZvGbWCawRXwur5
 Q1rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686828694; x=1689420694;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3bQYiwI0riRd5ZPD263zPLo8B1Ez60Z4MDCuH7wIBjQ=;
 b=NYgzrn54Dk2rTb370e69nUE3hIouU+QHORfS3Oj77eRShsjqNAMLt/kAOH4p4giPU3
 V8MA7rO9wWQnquAiK2a991C7gLVLX4E0yHOMDpKsjFTNxoJJmaPIN+eLzDlyP9m2cwjr
 ocVApGSBtA1q2pMKzRWoXL1DKvm0BEQ08xOa359ls68lxaTh6PS3ni2wSYykUO+2PLso
 kWR45w3ahKTXxXQ5mMSjXy9R/0I5GfItrrLPOqWFL/H/O/zt4+vB2h1MczV2FpZ5/xTJ
 icoG0KfTQJPbeWucR/DTXe8nQpRcIGe9cgglRCFMMQqvYVp67FtN+6OXgCZBRMABhU9v
 ax2w==
X-Gm-Message-State: AC+VfDyE/gshHJQixUGAUe+5vimpSe0DSrwygRvMAWnYr/4hdv3QMK96
 67CrF2WMxrmjIrPDGKIg0IvpVQ==
X-Google-Smtp-Source: ACHHUZ5BGFBfj8nOlWec9YJ6ShqiniydUBQo2/Y5PM4Qt962d9gXvqSB8hbe2V3q7OxfNlIF5NHy4Q==
X-Received: by 2002:a2e:9f16:0:b0:2af:32a7:4eef with SMTP id
 u22-20020a2e9f16000000b002af32a74eefmr7484463ljk.35.1686828694598; 
 Thu, 15 Jun 2023 04:31:34 -0700 (PDT)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a0db:1f00::8a5]) by smtp.gmail.com with ESMTPSA id
 y12-20020a2e320c000000b002b345f71039sm860525ljy.36.2023.06.15.04.31.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Jun 2023 04:31:34 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Bjorn Andersson <quic_bjorande@quicinc.com>
Subject: Re: [PATCH] drm/msm/dp: Free resources after unregistering them
Date: Thu, 15 Jun 2023 14:31:24 +0300
Message-Id: <168682860385.384026.4276167891794745473.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230612220259.1884381-1-quic_bjorande@quicinc.com>
References: <20230612220259.1884381-1-quic_bjorande@quicinc.com>
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
Cc: Sean Paul <sean@poorly.run>, freedreno@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Vinod Polimera <quic_vpolimer@quicinc.com>,
 Johan Hovold <johan+linaro@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Mon, 12 Jun 2023 15:02:59 -0700, Bjorn Andersson wrote:
> The DP component's unbind operation walks through the submodules to
> unregister and clean things up. But if the unbind happens because the DP
> controller itself is being removed, all the memory for those submodules
> has just been freed.
> 
> Change the order of these operations to avoid the many use-after-free
> that otherwise happens in this code path.
> 
> [...]

Applied, thanks!

[1/1] drm/msm/dp: Free resources after unregistering them
      https://gitlab.freedesktop.org/lumag/msm/-/commit/fa0048a4b1fa

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
