Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 95A347BE901
	for <lists+dri-devel@lfdr.de>; Mon,  9 Oct 2023 20:11:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4B3D10E2BA;
	Mon,  9 Oct 2023 18:10:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D194810E2AE
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Oct 2023 18:10:52 +0000 (UTC)
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-2bff936e10fso70223381fa.1
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Oct 2023 11:10:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1696875051; x=1697479851; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LZwa0pFgCMFZxcM0RszFBciS+5iPHBS674kLGB71TRA=;
 b=aAjKPoUaC6MRR6H3antepPIDLZ/tMQyfkn4lB2JrkuxfbooNYh38pneR9lv+u9AZoH
 xQWnxOtLKSEGqH27OBFM8A/TCcejUujMENK4KgPv44ihecIGdrKPzpXTYLrgbFIomydX
 Pa/uBXuEzh/Cij5KQ+ix/runOjpnRjTGqONL7qxcjgx2+AAt8bzhjxFQ2CrFm62Iasxi
 PkQ2cwyCkeY/RCjCY3BzCJawDWzxyI/JgYwWRqDnCTqNb8JU5otojXYSGanQ09x5UT82
 PMoF5wHQ8s94qmh90p3K0Vy/NvjvmIBKylThNX+QX14FAOOaj+aUkm1BEIOujDLNIkLs
 l3tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696875051; x=1697479851;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LZwa0pFgCMFZxcM0RszFBciS+5iPHBS674kLGB71TRA=;
 b=P3cWI0i3jNjvU/II9x4QXrOI/lszpuEWqwRQUdmfNon1hbOSvdjRGMVU4jglodyDQf
 3JJjCpxNcsIsGY8NL/PzNnEwKywIRlpywDgY39Tpdy8AhZcJpIJ0+XUfyg48WQsEVFZy
 ChqCPDfrDWGtp/6kX0F23/M5aQ+kzDlTp8JgsP2qId9qPol3VJ4isgCcqEfCtFCds2mG
 n2FGyq/eVrY9Om1liyweIpDPppZcN6km+fGETyajDJSZtE+A+pEaCGgVSOCAEn1n9lxg
 yWzKiixj7nAf8qzEb07589Jj+xtgb0LJ760/MsRrgnzf3fPvC275siv3bTEuW5+S5HvQ
 UmIg==
X-Gm-Message-State: AOJu0YxmN9ol/Qfo41m8BzGg/mQgWcwDW6R4rMVu7oTqnT3u0anWbYgk
 /NulFoW4T58SqAkPpgZVlGGgkg==
X-Google-Smtp-Source: AGHT+IHB8Mlg9v9SxjoA3EGE5SW6POwWDALdsXrDXYH3reUJFjnex74mPryQPf10KoMTICNodeQdIA==
X-Received: by 2002:ac2:4d8a:0:b0:500:a93d:fc78 with SMTP id
 g10-20020ac24d8a000000b00500a93dfc78mr10614914lfe.31.1696875051018; 
 Mon, 09 Oct 2023 11:10:51 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 d6-20020ac25446000000b00505677e7a99sm1506963lfn.139.2023.10.09.11.10.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Oct 2023 11:10:50 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH v2 12/13] drm/msm: make fb debugfs file available only in KMS
 case
Date: Mon,  9 Oct 2023 21:10:39 +0300
Message-Id: <20231009181040.2743847-13-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231009181040.2743847-1-dmitry.baryshkov@linaro.org>
References: <20231009181040.2743847-1-dmitry.baryshkov@linaro.org>
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

Don't register the 'fb' debugfs file, if there is no KMS (and so no
framebuffers).

Reviewed-by: Rob Clark <robdclark@gmail.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/msm_debugfs.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_debugfs.c b/drivers/gpu/drm/msm/msm_debugfs.c
index 06fc632fd6f9..04d304eed223 100644
--- a/drivers/gpu/drm/msm/msm_debugfs.c
+++ b/drivers/gpu/drm/msm/msm_debugfs.c
@@ -266,6 +266,9 @@ static int msm_fb_show(struct seq_file *m, void *arg)
 static struct drm_info_list msm_debugfs_list[] = {
 		{"gem", msm_gem_show},
 		{ "mm", msm_mm_show },
+};
+
+static struct drm_info_list msm_kms_debugfs_list[] = {
 		{ "fb", msm_fb_show },
 };
 
@@ -314,9 +317,13 @@ void msm_debugfs_init(struct drm_minor *minor)
 	debugfs_create_file("gpu", S_IRUSR, minor->debugfs_root,
 		dev, &msm_gpu_fops);
 
-	if (priv->kms)
+	if (priv->kms) {
+		drm_debugfs_create_files(msm_kms_debugfs_list,
+					 ARRAY_SIZE(msm_kms_debugfs_list),
+					 minor->debugfs_root, minor);
 		debugfs_create_file("kms", S_IRUSR, minor->debugfs_root,
 				    dev, &msm_kms_fops);
+	}
 
 	debugfs_create_u32("hangcheck_period_ms", 0600, minor->debugfs_root,
 		&priv->hangcheck_period);
-- 
2.39.2

