Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3914932F73B
	for <lists+dri-devel@lfdr.de>; Sat,  6 Mar 2021 01:26:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30E5A6ECB3;
	Sat,  6 Mar 2021 00:26:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com
 [IPv6:2607:f8b0:4864:20::52c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBBCF6ECB1
 for <dri-devel@lists.freedesktop.org>; Sat,  6 Mar 2021 00:26:43 +0000 (UTC)
Received: by mail-pg1-x52c.google.com with SMTP id n9so1487517pgi.7
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Mar 2021 16:26:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SnpC6f7BpJ8tZNLRp5Cw3z8Kw07+oTU7VTtXi15iO+E=;
 b=jq1Lw6tgvNAk9hkISI/vE38aIwoYVIf0ldffXAOzjjMLMAFsY1E1xwsn5sYNYhJMXv
 w+f+/HJ96aPz1nGb/W0K4TmbIx1yzm+KrATFMa5hlXh7tqsf2F9sdUJOVcnJ8AetWJAY
 frywgkx4ti1iVC19r6plKwgpfS8LySG8CkUb4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SnpC6f7BpJ8tZNLRp5Cw3z8Kw07+oTU7VTtXi15iO+E=;
 b=uTiak1R/CvmtMH+WSBzIchCYBghzGS0fT+eEMPsbgGYsWytDdNZkqYZReQ/K82YX46
 wRH7PgmWy3obggY4+55uL4llfFF7bwLeY2yxCFqLmBo6QQFTvfCQCDGTLMaH/HahgG9T
 sSWIKZdDA9AE4m581SuRMm1GsHqjysw88g1VSczpmjKglyrHPAV0Pmo3aVdBMsG4bjYp
 nM7/a0qu9SIjiDoDCDH/SgEI5JkpUhKRFIMSfwnUpJjNpR/6M0i/cd+LaXHEl6BOIzGd
 8In9DE4n1K65wKDd8pTyzHMsIALUFkfu9Y3DO2FFqe0tB2ITiVKj87hk7oKH2WGywEQW
 1yXA==
X-Gm-Message-State: AOAM531VSiMWEcYA0kmLWORfQZwmG+lrfOvw3MbCGWqCh2Q4KCyMvogp
 DkJIBFJRi4G6cC9ZMLlNEwvT0A==
X-Google-Smtp-Source: ABdhPJzBIFwqkw60RxxzGbz2ZZTXuBOwt5iqDwSUgfGViCIoDu5mwu/y3DnzPCgRutYL0MesqDnn2Q==
X-Received: by 2002:a63:cf06:: with SMTP id j6mr10633599pgg.195.1614990403493; 
 Fri, 05 Mar 2021 16:26:43 -0800 (PST)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:1:48f0:8f48:7388:d921])
 by smtp.gmail.com with ESMTPSA id 192sm3608905pfa.122.2021.03.05.16.26.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Mar 2021 16:26:42 -0800 (PST)
From: Douglas Anderson <dianders@chromium.org>
To: "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
 Rob Clark <robdclark@gmail.com>, Jordan Crouse <jcrouse@codeaurora.org>
Subject: [PATCH 2/3] drm/msm: Use nvmem_cell_read_variable_le_u32() to read
 speed bin
Date: Fri,  5 Mar 2021 16:26:21 -0800
Message-Id: <20210305162546.2.Id496c6fea0cb92ff6ea8ef1faf5d468eb09465e3@changeid>
X-Mailer: git-send-email 2.30.1.766.gb4fecdf3b7-goog
In-Reply-To: <20210305162546.1.I323dad4343256b48af2be160b84b1e87985cc9be@changeid>
References: <20210305162546.1.I323dad4343256b48af2be160b84b1e87985cc9be@changeid>
MIME-Version: 1.0
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
Cc: freedreno@lists.freedesktop.org, Ulf Hansson <ulf.hansson@linaro.org>,
 Douglas Anderson <dianders@chromium.org>, Jonathan Marek <jonathan@marek.ca>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Sharat Masetty <smasetty@codeaurora.org>,
 Akhil P Oommen <akhilpo@codeaurora.org>, dri-devel@lists.freedesktop.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 Niklas Cassel <niklas.cassel@linaro.org>,
 Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>, swboyd@chromium.org,
 Sean Paul <sean@poorly.run>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Let's use the newly-added nvmem_cell_read_variable_le_u32() to future
proof ourselves a little bit.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---
This is based on my previous patch ("drm/msm: Fix speed-bin support
not to access outside valid memory") which has already landed in
msm-next. In case it's not obvious, this patch has a strong dependency
on my previous patch and also on patch #1 in this series.

 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 0e2024defd79..e34705d17559 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -1351,17 +1351,16 @@ static int a6xx_set_supported_hw(struct device *dev, struct a6xx_gpu *a6xx_gpu,
 {
 	struct opp_table *opp_table;
 	u32 supp_hw = UINT_MAX;
-	u16 speedbin;
+	u32 speedbin;
 	int ret;
 
-	ret = nvmem_cell_read_u16(dev, "speed_bin", &speedbin);
+	ret = nvmem_cell_read_variable_le_u32(dev, "speed_bin", &speedbin);
 	if (ret) {
 		DRM_DEV_ERROR(dev,
 			      "failed to read speed-bin (%d). Some OPPs may not be supported by hardware",
 			      ret);
 		goto done;
 	}
-	speedbin = le16_to_cpu(speedbin);
 
 	supp_hw = fuse_to_supp_hw(dev, revn, speedbin);
 
-- 
2.30.1.766.gb4fecdf3b7-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
