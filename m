Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81F947474E1
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jul 2023 17:04:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7974610E2EE;
	Tue,  4 Jul 2023 15:04:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B745F10E2E3
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Jul 2023 15:04:06 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-2b6f52e1c5cso12876651fa.1
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Jul 2023 08:04:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688483045; x=1691075045;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pieIq/XM9siLESliq0xx7Knpb1NBYGOxDjjAn9WsS/M=;
 b=CWlijt14kw2HIgnQK5fxNHhe+kXCKIcLqH+lH3+4nCKfIfyt8Q85XYKpvnrHYWsGQW
 0eeMiibs8whB3yOosB12jxDpa5fEDY7JX3wOm+xoPOmrD8FvQbjWgoK0OuE9ODoHhvEH
 5cg5adZyJUOzOBXMfRmvm7qZGE13T4HeF+mjhissQNfvIxkdIlyav/tDLbU+jMY+woMn
 wJnDi5e/nPb671x4tAtytsUTaMYRwxQIZjtwfUchi7QTL/Aj0huOmjgzogBLLGpN0rG1
 JtXm8rgkZsDrxzE+BDfIrQkHBjPrNNIsfsfAHiOE8mD6VwidFfAieBKVVXsxFUtX8b/Z
 ZHgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688483045; x=1691075045;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pieIq/XM9siLESliq0xx7Knpb1NBYGOxDjjAn9WsS/M=;
 b=A3ZVUsZv8Pl8KcW3FXYqDDCTsBUrJz9JNJ+v4JTB40MD2vlL49NwY337z+bdhED1F1
 l+lFNv0PfXr+b+zQW+4tTft7V6D7RHEslRW5YdG/ztxSOD8jtIkTZlrRv0x5JyXdOUxA
 QjyAW1oG9tqwnfSRrO/rcQwt5DTjPX0a+oXBjKk2bTFkwXEquo5Cq90UqY8kg7KXPmlo
 3qKh5FUiCccuUVjV/hN+LEhiETFvl481kmwO52i2Wa9NGlGfAw7ZvM5qAsVbfDiZLa8l
 aq5Jsw3tYYgkVZUPc+AHlTtkXF6CkUfLKL1RxDU4ajtOjxpLtdYNVJvcYNw581mnFwAN
 42Cw==
X-Gm-Message-State: ABy/qLZflU74m2EnZSHSxwoGOBiw0k8+moDwJ/Idlt6iM6TruUSuls1j
 u6/4lkjxmg+bZcR8qrOmgD8DqA==
X-Google-Smtp-Source: APBJJlFpjYVEzi31is0y37Cyyn8jOydRM6m4hsZ/CgTlRBLNAm9swggAuLlZTFcFc8ekiEyNjB3zig==
X-Received: by 2002:a2e:8605:0:b0:2b6:df71:cff1 with SMTP id
 a5-20020a2e8605000000b002b6df71cff1mr7082394lji.52.1688483044987; 
 Tue, 04 Jul 2023 08:04:04 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 j10-20020a2e850a000000b002b6ca539d92sm3337354lji.138.2023.07.04.08.04.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Jul 2023 08:04:04 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH v2 12/14] drm/msm/dpu: core_perf: remove extra
 clk_round_rate() call
Date: Tue,  4 Jul 2023 18:03:52 +0300
Message-Id: <20230704150354.159882-13-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230704150354.159882-1-dmitry.baryshkov@linaro.org>
References: <20230704150354.159882-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
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

The dev_pm_opp_set_rate() already contains a call for clk_round_rate for
the passed value. Stop calling it manually from
_dpu_core_perf_get_core_clk_rate(). It is slightly incorrect to call it
this way, as we should round the final calculated clock rate rather than
rounding all the intermediate values.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
index 906611f6b879..d533b63f90f6 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
@@ -274,8 +274,6 @@ static u64 _dpu_core_perf_get_core_clk_rate(struct dpu_kms *kms)
 			dpu_cstate = to_dpu_crtc_state(crtc->state);
 			clk_rate = max(dpu_cstate->new_perf.core_clk_rate,
 							clk_rate);
-			clk_rate = clk_round_rate(kms->perf.core_clk,
-					clk_rate);
 		}
 	}
 
-- 
2.39.2

