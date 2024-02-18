Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 823ED859476
	for <lists+dri-devel@lfdr.de>; Sun, 18 Feb 2024 05:12:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B26A10E048;
	Sun, 18 Feb 2024 04:12:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="EqUaQtLg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
 [209.85.167.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0051B10E098
 for <dri-devel@lists.freedesktop.org>; Sun, 18 Feb 2024 04:12:07 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id
 2adb3069b0e04-5118290fcd8so4097801e87.3
 for <dri-devel@lists.freedesktop.org>; Sat, 17 Feb 2024 20:12:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708229526; x=1708834326; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HJ0AlyUQ24AScSzyP2Jwsr0HXFViYWPhLiEbf8CI7BY=;
 b=EqUaQtLghDc3Jh8qMRFrNLLXZ/3RgQ+yR6kwSqdzm8KjleEqCJjtBFirL/6hXOsgeV
 h/5d8uHWbksKZa8Qjj7yTJIR8/XFOd62BIcxkshGz0/p24YcyU8VjlVgymqOtKXJV1zw
 CC3OWbahppwDdiqO1/wTn0jRuzRdbqWmn2dlC+LZbTWRJ+eo2w+La/Wygbq9XpwnGQKq
 K+JrnsLK5HqibXGfdUT5Fm0UhGMzS+dWpjvct+iupMifoXeU77/OW6wj8fyWnRyngA/P
 qs4R3bkXLIt1kKD9B8j0sjNIbMZtFfGcxlInf27C57oUZrxXekJNCDRXKVwJj2AnIJJy
 9Vog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708229526; x=1708834326;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HJ0AlyUQ24AScSzyP2Jwsr0HXFViYWPhLiEbf8CI7BY=;
 b=b85q+Iocnyp03nIAfNBjweGFCZGU5Y4dA7TRF1l35oaDFGvKSU1M2QNIPFU2LzDSci
 3UhrACvfDTWRZFT43uRrsveFNNav4oVFbIVunY3+LmnNZpIJh2c9mSevmmHWhwND3jUV
 dllvqeCs8vb6A13lGQcvAJkd25XFtqPa0fcmxi9mqlomc4a6W72AR8vsXytiB2/odacj
 JqFom/j8Tyu6zcvrnMemjdraeDhI7Yjdyn18i6uczz03KQENRNBE88+VTOWyTPMIOXsW
 o/fonNEWIpnVMkDBVSHQ3ZKveldKnWB+wA9Tpnja9zmWTZdNkeyqYfCI30zG6C6VoypX
 Lohg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUskcNWwLIC66SvWIW/xpV8mJjUTL3FMN6MWCBtNSS6+KdNbwfs2nzKhMqvUVSgtN5frXfGOPoodeDYG9y9DcTpPIETV8l5xg7H3doB/XM3
X-Gm-Message-State: AOJu0YyZY8xUFsgjLOZwS0+Y5qqsBz6Nq6iGkn+5W9y7yvd+0DsV8GSv
 Dbx49rbeUsnm90Lf3snaBhpxx0gUrc9WnszJfWz8n5JzrTROhRjbdE7NUmh7aws=
X-Google-Smtp-Source: AGHT+IGaObtYAwf2B6E4d5QEZ3t8Or1YYvcKAJYExCLh99x+7IIvKvWQApCIyAmKh7hRwECgDd3y2A==
X-Received: by 2002:a05:6512:52f:b0:512:afcc:3fe8 with SMTP id
 o15-20020a056512052f00b00512afcc3fe8mr203657lfc.23.1708229526182; 
 Sat, 17 Feb 2024 20:12:06 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 e20-20020ac25474000000b00511aad978dfsm436606lfn.121.2024.02.17.20.12.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 17 Feb 2024 20:12:05 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Helen Koike <helen.koike@collabora.com>
Cc: Stephen Boyd <swboyd@chromium.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Bjorn Andersson <andersson@kernel.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Subject: [PATCH 2/3] drm/ci: update msm-apq8096-fails list
Date: Sun, 18 Feb 2024 06:12:03 +0200
Message-Id: <20240218041204.2522828-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240218041204.2522828-1-dmitry.baryshkov@linaro.org>
References: <20240218041204.2522828-1-dmitry.baryshkov@linaro.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Mark two tests as passing on the APQ8096 / db820c platform.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/ci/xfails/msm-apq8096-fails.txt | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/ci/xfails/msm-apq8096-fails.txt b/drivers/gpu/drm/ci/xfails/msm-apq8096-fails.txt
index 2cd49e8ee47f..88a1fc0a3b0d 100644
--- a/drivers/gpu/drm/ci/xfails/msm-apq8096-fails.txt
+++ b/drivers/gpu/drm/ci/xfails/msm-apq8096-fails.txt
@@ -1,4 +1,2 @@
 kms_3d,Fail
 kms_addfb_basic@addfb25-bad-modifier,Fail
-kms_force_connector_basic@force-edid,Fail
-kms_hdmi_inject@inject-4k,Fail
-- 
2.39.2

