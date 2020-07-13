Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 476A021E980
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jul 2020 09:06:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E54766E91D;
	Tue, 14 Jul 2020 07:03:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 791AD6E82C
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jul 2020 22:55:16 +0000 (UTC)
Received: by mail-qt1-x841.google.com with SMTP id o38so11407575qtf.6
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jul 2020 15:55:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=marek-ca.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GsatskZeu6cROzCdokNou7WazNDARulkKT+Df6GvP/E=;
 b=he9usAeaaAWYBNYbwqBs57KtvsMI8J2WQf55xuXlU8oSJyWCF2IdPgt/yKkmTsfzjO
 yTCyDKME1sqmwOx7tmm+X629+8z+0VkZlU06Ltb1qrh+15GJcr+5EoBEpoW/9Qei6E/8
 I04ExgRm46UjR3xyYnaBur78tmPWJi+3sdNJx4jUWKfOiwsAP/+ffAxGR7VgD/GfhKlv
 OAaZ0Iz57cKe8j1NvKOfV6YF57tPi+UKa/wgrI391aASyfypLXF3TaPgXyny7k71dPcr
 LEHOC97z4rbnZCu67PQmeC5vLTIqgdWyBlAi0wsa9EN283JNABDYmimPPaQVRcZmqxlK
 XMXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GsatskZeu6cROzCdokNou7WazNDARulkKT+Df6GvP/E=;
 b=kur+i//LHIpW33g52FcVQTHW+tmJzxEr7zDSLI4JJsEDOidgnt2lJ0XGtQx8E19B/9
 HLA+zxdg4/7qHCpNBPP7fzs46rmkr/DYdCUoUQVU2JqBYp+NAew6nNLC/M9pqXXotmXa
 rpnsM8aQOWxYeMyNY/nKNUO+bFfUL1uWH6py3+SA3UTcqK8SWp3tpucvxhassGPWm7Rh
 8y5R29bgJfCGwaqzfso1bt/QEqFkJIu2kodkjtkrIdGf2MDZkt/VnsQasRjl1XhiyDqn
 Wn5dbuEYqqaktTEFh7IjpN8b8xo1/L5Fq4jVLCLfm2/V2e21EnmSG8speM+H45a98rpx
 64Iw==
X-Gm-Message-State: AOAM5304e1g+TXBMfX/EKWl/tqcIQ+FMbiV48nNYMiEw8Bp+FOt06vW9
 +AM2L++txaDN+fkjQoN1iauQ+g==
X-Google-Smtp-Source: ABdhPJwEhNUhM0Sdref5tidyi4ZWkR4rO2FHbelarbgx64sfy4MEmxKm6XdqIsIIguOYsf0aC+fozQ==
X-Received: by 2002:ac8:311d:: with SMTP id g29mr1789673qtb.54.1594680915659; 
 Mon, 13 Jul 2020 15:55:15 -0700 (PDT)
Received: from localhost.localdomain ([147.253.86.153])
 by smtp.gmail.com with ESMTPSA id f54sm22405752qte.76.2020.07.13.15.55.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jul 2020 15:55:15 -0700 (PDT)
From: Jonathan Marek <jonathan@marek.ca>
To: freedreno@lists.freedesktop.org
Subject: [PATCH v4 2/3] drm/msm: reset devfreq freq_table/max_state before
 devfreq_add_device
Date: Mon, 13 Jul 2020 18:53:41 -0400
Message-Id: <20200713225345.20556-3-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200713225345.20556-1-jonathan@marek.ca>
References: <20200713225345.20556-1-jonathan@marek.ca>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 14 Jul 2020 07:02:44 +0000
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
Cc: David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

These never get set back to 0 when probing fails, so an attempt to probe
again results in broken behavior. Fix the problem by setting thse to zero
before they are used.

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
---
 drivers/gpu/drm/msm/msm_gpu.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
index a22d30622306..aa9775ab52f0 100644
--- a/drivers/gpu/drm/msm/msm_gpu.c
+++ b/drivers/gpu/drm/msm/msm_gpu.c
@@ -93,7 +93,11 @@ static void msm_devfreq_init(struct msm_gpu *gpu)
 	/*
 	 * Don't set the freq_table or max_state and let devfreq build the table
 	 * from OPP
+	 * After a deferred probe, these may have be left to non-zero values,
+	 * so set them back to zero before creating the devfreq device
 	 */
+	msm_devfreq_profile.freq_table = NULL;
+	msm_devfreq_profile.max_state = 0;
 
 	gpu->devfreq.devfreq = devm_devfreq_add_device(&gpu->pdev->dev,
 			&msm_devfreq_profile, DEVFREQ_GOV_SIMPLE_ONDEMAND,
-- 
2.26.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
