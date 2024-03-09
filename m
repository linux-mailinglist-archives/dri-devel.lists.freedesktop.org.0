Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BDBA3877485
	for <lists+dri-devel@lfdr.de>; Sun, 10 Mar 2024 00:38:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D08E010F3C5;
	Sat,  9 Mar 2024 23:38:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="ymG6ksrF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
 [209.85.167.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0353910F405
 for <dri-devel@lists.freedesktop.org>; Sat,  9 Mar 2024 23:38:46 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id
 2adb3069b0e04-512bde3d197so2862995e87.0
 for <dri-devel@lists.freedesktop.org>; Sat, 09 Mar 2024 15:38:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1710027524; x=1710632324; darn=lists.freedesktop.org;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=phSgHCnESSBMbSXFjnxT9fxXfI6/8r34AJetjYd2J/w=;
 b=ymG6ksrFBiU1tnzNMW6lpxhxj/MdQzTo51Z8BBw468EcBh/Gf3CmTfDFHkukz+dWg0
 LjultujyreuLeikQ4BrpMPTIzUc0fyY+6hILbgn/BEElbJEQCU5dS/abSWOqtoEe7je0
 o/61raSd1HW68fPVtY1OZAsU/+wv60RkQPgXD9ajiDLrjLyF4xHq1MXDnULPCq8ktMU+
 ibGxYnazvR/xolDXjbeY0B0CJ3zLEKWZ+KliGj0BB+hEFHD06g5Xoy2ZggBTpRdgxa7m
 W0RI2N1UTJnvx5G4+3dyfBXiIyWKputNjy9SKln9bgKWrIABetorOqOHATFx2+7agk8M
 3jzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710027524; x=1710632324;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=phSgHCnESSBMbSXFjnxT9fxXfI6/8r34AJetjYd2J/w=;
 b=aO70vw1utlpiGsLbLk287ek/inh/ZGgCM0z3Q2GDMraoEOD48YtxiE1CREgHKY3nZo
 ywftEiQ2uWzZPjGM9LvhNcWawkknyIUh+mFnMLEqfC9mbiHJ5Ui0frhgZo0x3ocVVqfh
 6uKGj4l5YRBoPaNer/uNGErJapTP1vzGai7MB4mFTQXOTbyNPwo/NfTVrG1zKBWlqEor
 58y7jyqL/81zdBE9uuj5uBViCr15Gww3EWAccHsR1d8629KVvODwB1fbXLLLzZeP8bZB
 fDt2tIsSxbU44ZpPai4ajw8uFakoUh8AmxFIHgOqQJzDX+T/nCYNko6pgiseN4bAURm1
 7zZw==
X-Gm-Message-State: AOJu0Ywr7Qc6r7ovcbhORK+b9tjcN0FPVgSdiK7EjzfJGmKBU/vKiPgz
 6C4zN6ODVDy+fF/GBST9dY+mVCq13moj5wYIwqPTewDRKyZLRqpDEa/G9aIFQgA=
X-Google-Smtp-Source: AGHT+IGjNB0oaznkuwU//YTxzoZ3DWFgN/YSRcl3S1noHChB3JhQyLVmphgYZefBSgg3lqXBh2anYg==
X-Received: by 2002:a05:6512:3986:b0:513:588a:262f with SMTP id
 j6-20020a056512398600b00513588a262fmr2574567lfu.39.1710027524485; 
 Sat, 09 Mar 2024 15:38:44 -0800 (PST)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 g34-20020a0565123ba200b005118c726711sm466576lfv.302.2024.03.09.15.38.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 Mar 2024 15:38:43 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 10 Mar 2024 01:38:43 +0200
Subject: [PATCH] drm/bridge: correct DRM_BRIDGE_OP_EDID documentation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240310-drm-bridge-fix-docs-v1-1-70d3d741cb7a@linaro.org>
X-B4-Tracking: v=1; b=H4sIAALz7GUC/x2MuwqAMAwAf0UyG0irOPgr4qBNqhl8kIII4r8bH
 I/j7oEiplKgrx4wubTosTuEuoK0TvsiqOwMkWJLTSBk23A2ZTdZb+QjFaTMIc6pm6gN4OVp4u6
 /DuP7fvZ+dv9lAAAA
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Jani Nikula <jani.nikula@intel.com>
Cc: dri-devel@lists.freedesktop.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1732;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=H9T0yYRNQIYeKn0k1zcpHzzOtiMRIligvnTJOpgQa6c=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBl7PMDIbSagcQQQIdhjtW7B94ce5TcvTpOl8tJZ
 kfskKdz+yGJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZezzAwAKCRCLPIo+Aiko
 1aPUB/9x2Ki9djSIW8L7SRwESb2CsGGUK9hKYSUGxUrQNsNuC0mpj8y80hfpZ/lmmF3Ylrjdf1u
 V6khODKRaq1SMifrcYyl6klge1ZWdKzkLLGvMlMlv59JiVYh0/WcBm+2OLdABz49gB8PYNqTxwH
 WMCT0cVWgNAG9U/xLRmvFFUHhZ0gZHUmT5SMu3BLqfjstjrI0pGTDDve5ss99pDJLl6nB7OS/yc
 3J8+6XYUG2jx7LFiGqNZYnMZQS5LQ+psd9lDlsNtlkROTCVnYDnhMBGsjbbwMqUpVQCzE9p825A
 +oHbs26Ia6nqUxRruIWbMdF2QpR2Zuz6v1EAfdsspKwo6mPK
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

While the commit d807ad80d811 ("drm/bridge: add ->edid_read hook and
drm_bridge_edid_read()") and the commit 27b8f91c08d9 ("drm/bridge:
remove ->get_edid callback") replaced ->get_edid() callback with the
->edid_read(), they failed to update documentation. Fix the drm_bridge
docs to point to edid_read().

Fixes: 27b8f91c08d9 ("drm/bridge: remove ->get_edid callback")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 include/drm/drm_bridge.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index 3606e1a7f965..4baca0d9107b 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -541,7 +541,7 @@ struct drm_bridge_funcs {
 	 * The @get_modes callback is mostly intended to support non-probeable
 	 * displays such as many fixed panels. Bridges that support reading
 	 * EDID shall leave @get_modes unimplemented and implement the
-	 * &drm_bridge_funcs->get_edid callback instead.
+	 * &drm_bridge_funcs->edid_read callback instead.
 	 *
 	 * This callback is optional. Bridges that implement it shall set the
 	 * DRM_BRIDGE_OP_MODES flag in their &drm_bridge->ops.
@@ -687,7 +687,7 @@ enum drm_bridge_ops {
 	/**
 	 * @DRM_BRIDGE_OP_EDID: The bridge can retrieve the EDID of the display
 	 * connected to its output. Bridges that set this flag shall implement
-	 * the &drm_bridge_funcs->get_edid callback.
+	 * the &drm_bridge_funcs->edid_read callback.
 	 */
 	DRM_BRIDGE_OP_EDID = BIT(1),
 	/**

---
base-commit: 1843e16d2df9d98427ef8045589571749d627cf7
change-id: 20240310-drm-bridge-fix-docs-0fd12bc6a041

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

