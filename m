Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A7F8F6635B7
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jan 2023 00:44:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AB2310E52F;
	Mon,  9 Jan 2023 23:44:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53A7110E51C
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Jan 2023 23:44:14 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id g13so15615261lfv.7
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Jan 2023 15:44:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XHjEtNVaTqOtCpnB9ZP021rbETT/k+vzPdGSi2OKKbk=;
 b=KdluC5isYfGPedU/R2fjuuNpCoSuFF1Gex4PxTwA/N8jNDHS/AVQE5mKglBc1iQzkS
 PsYw3u+iVbQxMe+TjLhY/zIwy1l/27O2gFVrl2UK7tdwpA/NEej1wX+R514XKyLF+uSv
 xHsN/YuPfGmmfmBKCwj9zCYW+8Oc3ryiysNMANUaS+wodqw0J5mEFq3QoHYnY4t3Lzjg
 FeXOAW48fZW+o7VQhUl8UGSy3Ji3tHu//ALLLsKYTDdmCo9/IQWdubtGXEHiGiIXDctP
 vHyW137kiAwiwBvnxNWqh9LLcNkjZbml1VAWAHKK2831myR9iU3oxsy/g9IJ30OGHok9
 yLmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XHjEtNVaTqOtCpnB9ZP021rbETT/k+vzPdGSi2OKKbk=;
 b=vCuCGMDUUyiWz+veGFbpA96/wmbhSC12L42Q3ajb46YdvW9m4Eo+1fhoPrhrCkw+h/
 Tb4/gkOzqB6YyFNFb4ynATt6ethiAOaAmkLX8h9LapbCpq/SBFKDvY9hiva8sEFkewJn
 p440aVKT0bFsXD/6nce7rN6suHTg229pzXSg0f1pY7PjYaDRVYUcicJYXs6B/c1Fqdew
 aWY5WB7Oj9FvUMapDEtMFS3VfsCAEt6o9Ukv1k9DU3Yo2rR71h415Q7+hFha8Wrk0Sj1
 D3w7m1v8qbsa5WmuE7xNQNETDbuRHjVXOcX0ZyfAN8xD4BtICbiI3hPX0I96nhW2r4O/
 obxQ==
X-Gm-Message-State: AFqh2krZ+eGnBrSBwkAKjyzKPkZz6OQqFDmJGiyyVtDQNGSthyUtc128
 EqQkrIs/rA8KqGXrNtZ6yJG6dw==
X-Google-Smtp-Source: AMrXdXs4hWSrnGESPaDMiC7Skctx3mIanGzpIn+a29djjV3HrxocDoxhqI+rKdtTzMIxIdZgqlnGAg==
X-Received: by 2002:a05:6512:3b91:b0:4a4:68b8:f4e5 with SMTP id
 g17-20020a0565123b9100b004a468b8f4e5mr23148885lfv.43.1673307853915; 
 Mon, 09 Jan 2023 15:44:13 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 s9-20020a056512214900b004b5a4cf69dfsm1835255lfr.261.2023.01.09.15.44.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Jan 2023 15:44:13 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: robdclark@gmail.com, quic_abhinavk@quicinc.com, airlied@gmail.com,
 daniel@ffwll.ch, Hui Tang <tanghui20@huawei.com>
Subject: Re: [PATCH] drm/msm/dpu: check for null return of devm_kzalloc() in
 dpu_writeback_init()
Date: Tue, 10 Jan 2023 01:43:59 +0200
Message-Id: <167330408783.609993.13860899129914018447.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221119055518.179937-1-tanghui20@huawei.com>
References: <20221119055518.179937-1-tanghui20@huawei.com>
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
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 yusongping@huawei.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Sat, 19 Nov 2022 13:55:18 +0800, Hui Tang wrote:
> Because of the possilble failure of devm_kzalloc(), dpu_wb_conn might
> be NULL and will cause null pointer derefrence later.
> 
> Therefore, it might be better to check it and directly return -ENOMEM.
> 
> 

Applied, thanks!

[1/1] drm/msm/dpu: check for null return of devm_kzalloc() in dpu_writeback_init()
      https://gitlab.freedesktop.org/lumag/msm/-/commit/21e9a838f505

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
