Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F14FA663569
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jan 2023 00:36:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEFE910E0BE;
	Mon,  9 Jan 2023 23:36:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3919910E0CF
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Jan 2023 23:36:15 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id d30so10676397lfv.8
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Jan 2023 15:36:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fbCC4/NAEi7QL8GVYq6w9KKB1sHLRdN0BAnnJp4jmt8=;
 b=QUKkUjDYxkCANV7FXFWAUCbtNdYq7o1JAGSF4bdCRRd+7kq/ye4HIqfKqFkbneK00c
 BymCCO9DjFleTxh1kCUZWRJ5Hr+MJPLl0o1QA9RWghyCoG+3jV9foyHNvqaV4Z7kzPIL
 M6hWDW2Qta7LfB4uv0UMyrjdCRSdR6Fm+Pa+mbRkvCDxR6Tx63ihqBvWRcOJzQ+PXRoI
 WJHjYhSO7bqZYzEFL0aKbfO5aFs3K7AEdMNxyYJ7zOIsf2uXabjIyuDj2HIQB/xuGikh
 qQw+/j8VXo8/cwOponk2G9YKEssaKTA3BVqo8efaRfd5bRYnXjgRFMRq9PYq1jTjCmRQ
 9yDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fbCC4/NAEi7QL8GVYq6w9KKB1sHLRdN0BAnnJp4jmt8=;
 b=edloBRpvKhkt/yrsRb2yJCsKVQmjV5dP9uMtv4YVoiGQve83MhyejbkKTRrTrl3hFE
 ZMiap/pL2+/cDKOdQ5fsMVFJmIGrAT+PedWKt+oLw5o/dBn0W+luK1xQartCLlDiQGmq
 LuiDzs01OWxbWXyLMea3rTm6VjQWs2+CpJ3yHP3GcXsYl7mNzHVXZ980zU3YPQqtYEy4
 lbe6xWHplmYRLyIQ2nwjSC+kj5NRuUG/jWmHW7pDoCQsoAxp7v3JGdFrfY0cR1NojPb6
 Dz2PP/+rpk7PEOyIh8FIuia+nkTdH9JooVUTl3DsV5mPXDSdcmI6DMkZNUa8/ui0URsx
 JC3g==
X-Gm-Message-State: AFqh2krPIwR0FhLg69JNZYsWRN0YEdKV3Jz/3Izp851FcDWosyfcE8VI
 qwQIVGmWGErIev/I1LI7HS76Lg==
X-Google-Smtp-Source: AMrXdXvXjSjyrWinT0Qx1C/ylFYva16KNvkPkx496D30fxTHNGVyv8d6IUO8gZU9xBTAzAKNI4S9pg==
X-Received: by 2002:a05:6512:32d2:b0:4cc:8375:701d with SMTP id
 f18-20020a05651232d200b004cc8375701dmr1559796lfg.44.1673307373497; 
 Mon, 09 Jan 2023 15:36:13 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 4-20020ac25f44000000b00492e3a8366esm1841307lfz.9.2023.01.09.15.36.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Jan 2023 15:36:12 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH] drm/msm/dpu: disable DSC blocks for SM8350
Date: Tue, 10 Jan 2023 01:36:12 +0200
Message-Id: <167330637780.615458.8361646864456567493.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230109214309.586130-1-dmitry.baryshkov@linaro.org>
References: <20230109214309.586130-1-dmitry.baryshkov@linaro.org>
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

On Mon, 09 Jan 2023 23:43:09 +0200, Dmitry Baryshkov wrote:
> SM8350 has newer version of DSC blocks, which are not supported by the
> driver yet. Remove them for now until these blocks are supported by the
> driver.
> 
> 

Applied, thanks!

[1/1] drm/msm/dpu: disable DSC blocks for SM8350
      https://gitlab.freedesktop.org/lumag/msm/-/commit/3b2551eaeac3

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
