Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5778B946C36
	for <lists+dri-devel@lfdr.de>; Sun,  4 Aug 2024 07:40:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F13A10E067;
	Sun,  4 Aug 2024 05:40:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="QSNGajKf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com
 [209.85.218.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D51610E071
 for <dri-devel@lists.freedesktop.org>; Sun,  4 Aug 2024 05:40:21 +0000 (UTC)
Received: by mail-ej1-f47.google.com with SMTP id
 a640c23a62f3a-a7d26c2297eso1178617966b.2
 for <dri-devel@lists.freedesktop.org>; Sat, 03 Aug 2024 22:40:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1722750020; x=1723354820; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=ysYzFvs5nz+WvJxUYQ+2QczfFsuOxY/5HM9LuZLHg+Q=;
 b=QSNGajKfv8DWedys4zsb4CL2gudKbvriciBc6EvTxbSs+IB6tNMl7BDiG5zBaLKH0/
 iOdOS6sxWvw9eThTil56/6tVpvy/6Dap+j8XpHFSHyvMv87fkZqc9CBtqrUr3fyNPANv
 PyoCqWVWa4jrxxGXc4hkfrm4iFGq5kIK7/VibJN0iQRTWPe9Q/QtaHWczZ3dKezaQwiI
 630O0jaNh1mDSppjE9QELmFGjYBnj0s5qQ5D9pFbwbfqSps+MfFBhqQwTZqqNEwJ1iIN
 w6VNNtbetBarUUr0tiU1pj655131/AGbXK/1AEdDHSYjbQgVXsbDVuQERmWNrz0LO8si
 6KAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722750020; x=1723354820;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ysYzFvs5nz+WvJxUYQ+2QczfFsuOxY/5HM9LuZLHg+Q=;
 b=D4f3+tdui2unqKU82x1vfX9MwOWYF38dTmYjf+Hb7BtvqBEsk/SobMcjRWwbAwjJnV
 odCkH5lDy9zzNrzxeYraAf03ZfvprpZtxor4YxIAambhlVAo4qqQtEaUK9jvW8AhgFZQ
 zNMLuR2gWaFmGJwGESdkWHM5vLH6R71/e6ygjPvZUxFE9gXt8H73b5NBwK88rYkcz8ll
 LWBwppylZ++ugGW62+ECiVETuUw3KKNwDYFD1frg3ZqgprGGpuo+zieiRUlCPI+MyOTf
 O9U9GWszlVNSe1L9yDTwZdjzjTLad7QcPUCG80oqOs+OpgM4afjpbmE+sZdvUg3dowlY
 j6bw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWzi5qK1uiMkLIp9b0WPSrLjVxaSgjUT2k6NTO2lWHY4CLN/d1iBVIBEobyia3p6jHCI8H5PEsd5Nh6NeggHgdY5FFyPilumVMCamE2Q015
X-Gm-Message-State: AOJu0YyLkRjKSkeeq4C4BBjm0uSjv8laGhFlWift/8Fiac/s3aLYWScW
 JWYemQtXSfmofRR0/wSmtY/iTCXA81nPnVQUNWGTMOCz/QAFqKOg7vNg8Wy87WI=
X-Google-Smtp-Source: AGHT+IHJn6+1jqc0ahvJHM7K4NrLWHr1zsbLKGyqs6RoLVAK1GPH/qUlqIcWAn4yddgy8+w8Ih8egQ==
X-Received: by 2002:a17:907:97c9:b0:a7a:aa35:4089 with SMTP id
 a640c23a62f3a-a7dc4e87671mr627357466b.24.1722750019793; 
 Sat, 03 Aug 2024 22:40:19 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7dc9bc3bd7sm292248466b.34.2024.08.03.22.40.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 Aug 2024 22:40:19 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 04 Aug 2024 08:40:05 +0300
Subject: [PATCH 01/11] clk: qcom: dispcc-sm8250: use CLK_SET_RATE_PARENT
 for branch clocks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240804-sm8350-fixes-v1-1-1149dd8399fe@linaro.org>
References: <20240804-sm8350-fixes-v1-0-1149dd8399fe@linaro.org>
In-Reply-To: <20240804-sm8350-fixes-v1-0-1149dd8399fe@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Jonathan Marek <jonathan@marek.ca>, 
 Robert Foss <rfoss@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Georgi Djakov <djakov@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Mike Tipton <quic_mdtipton@quicinc.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-pm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, stable@vger.kernel.org
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1328;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=t+tMTzX+SM35TGMLlS8U+3Typ2b9GAQHOxtHcxsEDtY=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmrxQ+Ojq+KjeMNpaJEqMBBa4cusWyrZKtW0x0l
 Gg26p9OB/SJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZq8UPgAKCRCLPIo+Aiko
 1fR3B/4uCLNre4w7YVTFSx9cfyW6gnVvsmmbvpOvS3ZzLKsqrob+fkNOW4zMQe0FdXktkSgd/ty
 QOPkK0yjPxHlDNC4x3MivgMr0PyMCbeiuZkXk/MZjtfYf4ly3ii6+gT2rx+640bkdPyxKWtv0/L
 NW6g13t7c2O1nFd/0i7HXwEqjoVVikW2RrENql/AR7LUMjRWpQTqdUoBTo+gBK0L9oUspLHwu1D
 4EyfBP0KcHkIo4OQdBh7juAQD/ltGj9MCDZd/ym3bjWKI1dpWcXXuMHIUfc1pjLyj2YIZVUpige
 dvqeT18Z3ZEoxYL/dN2CfoEsxZ3S/DSJpub48/+FxE6bKSzy
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
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

Add CLK_SET_RATE_PARENT for several branch clocks. Such clocks don't
have a way to change the rate, so set the parent rate instead.

Fixes: 80a18f4a8567 ("clk: qcom: Add display clock controller driver for SM8150 and SM8250")
Cc: stable@vger.kernel.org
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/dispcc-sm8250.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/clk/qcom/dispcc-sm8250.c b/drivers/clk/qcom/dispcc-sm8250.c
index 5a09009b7289..eb78cd5439d0 100644
--- a/drivers/clk/qcom/dispcc-sm8250.c
+++ b/drivers/clk/qcom/dispcc-sm8250.c
@@ -849,6 +849,7 @@ static struct clk_branch disp_cc_mdss_dp_link1_intf_clk = {
 				&disp_cc_mdss_dp_link1_div_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
 		},
 	},
@@ -884,6 +885,7 @@ static struct clk_branch disp_cc_mdss_dp_link_intf_clk = {
 				&disp_cc_mdss_dp_link_div_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
 		},
 	},
@@ -1009,6 +1011,7 @@ static struct clk_branch disp_cc_mdss_mdp_lut_clk = {
 				&disp_cc_mdss_mdp_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
 		},
 	},

-- 
2.39.2

