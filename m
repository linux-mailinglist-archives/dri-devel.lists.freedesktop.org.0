Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 208EB87CCAF
	for <lists+dri-devel@lfdr.de>; Fri, 15 Mar 2024 12:46:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AA9D1121DB;
	Fri, 15 Mar 2024 11:46:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="A3zb6xQ/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
 [209.85.167.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A8D11121D8
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Mar 2024 11:46:31 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id
 2adb3069b0e04-512f3e75391so1829599e87.2
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Mar 2024 04:46:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1710503189; x=1711107989; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=J8Y0RnqdkkNJT2IOUAgIJwE7VvEMel7kUBPozDnljrU=;
 b=A3zb6xQ/Hpkr9/3FOHlZAaWHRycYci8O0Bfw2JVSgO91lxHnsuVjgibUfKmWg6Vu+G
 Yt0LEAQxSRksvVooDPhBv8SL70PoeJZ+gbvDIi66s7BGQewP1MTYwfJ9H+Lbx4Di3Axj
 D1VlcZ+X7xkoW/4Y9IoUwb5cJlTlibwozZQGW3Lq0AlJceh6nU2ZGEF0v8r8CLgi9NbF
 CN6LABDrqjxw3qrY+C8JPRDT4H3oQcGFvSDl6+HIiI8Q1Ekhvknz3+2cUiHortD08v3q
 CwKQdhTCqt1+LB4k3GxNWjFUnyyoDbzEyCq/cpm2YvdHOTd8gqATEfdPTY3vv+K13XhQ
 nLAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710503189; x=1711107989;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=J8Y0RnqdkkNJT2IOUAgIJwE7VvEMel7kUBPozDnljrU=;
 b=SnwwUIC3X+TlVVPKamAhPYXdgvZw3hKZvZYs2xUesaj1iyU8MrrTlW9dQ1RzC5VGwJ
 A9pnt0AKbi2Pyl/ZQ7OK3oHxlckTiqKiqOvRfYv/2ThgtrwQTtJCPBo41g/H3vpSL62X
 WBMJ2zZEeK2aKGOJH5xffXQrmB8MZ+Y/u0sfFxT40BvIqQVVZLMsFFB6JumDZYc56rzp
 FMle5eXWeoX+U6huTb2X3MzMyDCMW9l/N2fwb3PTqZEw8nrMGAHE2ad6io4GQC0GO2D4
 nnuBGr2nP/GO13nnEZSzlbomYquaiLqUmjHMnfGdnvkYWzvRyavYps39cy687Qas/HRX
 J5NQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWM6RcnPeOgQuE6QcbbpuXPhzu0p3U0NkqYkFWiRPvNYiSa332UrCYuyGEBSx75HlhrrK7EJb005dDsBBdBnYgG5fbYRg6fdN07e7hyNHiJ
X-Gm-Message-State: AOJu0YzbfelUnymRd5t0zYhhIU3IK8ZZl/65VfPRWlt9o5ytGf7edTpO
 Lq0PzqEuPIsRwVqEv4d1kZjnveMXiA2lGHs8JQNml8v+wPLT53EicZId2s+DtP4=
X-Google-Smtp-Source: AGHT+IFvHmKzxUIFY76dv6GIA+LeCO8F/bh1rhpzPNmjrJjuJuj4/5FvAu2HjyJaibvuaPIRy0Rr2Q==
X-Received: by 2002:a19:9142:0:b0:513:d5b5:78e9 with SMTP id
 y2-20020a199142000000b00513d5b578e9mr1999251lfj.26.1710503189363; 
 Fri, 15 Mar 2024 04:46:29 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 l17-20020ac24a91000000b00513b024b232sm619987lfp.10.2024.03.15.04.46.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Mar 2024 04:46:28 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 15 Mar 2024 13:46:23 +0200
Subject: [PATCH RFC v3 01/12] drm/msm/mdp5: add writeback block bases
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240315-fd-xml-shipped-v3-1-0fc122e36c53@linaro.org>
References: <20240315-fd-xml-shipped-v3-0-0fc122e36c53@linaro.org>
In-Reply-To: <20240315-fd-xml-shipped-v3-0-0fc122e36c53@linaro.org>
To: Masahiro Yamada <masahiroy@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: linux-kbuild@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1223;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=Qgjc0zwou9fhsXbbN2p4ZWlMuaNpRr7RxW3B4yymOWk=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBl9DUQImGnbz7nOsTqodT0se82AQB3A8EYtQh11
 obHHUk4GRiJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZfQ1EAAKCRCLPIo+Aiko
 1V7yB/0XGKzg8zS5Tz1eog71yhF6z96DuLKN8UwYg8RvBiL5qYpDugWvlB1XfUKUANgSFkEAFir
 bqttMynucXaLYAbTp858g61l4BmU4aBOK0DR9JQl05C55JhhyUBBEr25F0eBEk/0MKC23fhJH11
 776CxdVTG7MFLem7OI4sKWEv1zWY935B3SyF8CpjZ97ltNOVhuhrhyfLCpsNxIzOR9rWa7FtaLy
 2PjURezJWYZuJXbrR/2gv/ORk5zuUp3KhwVbli3eM9snnTJ1HiPRNwSzo45u/CH63kIxcJElByu
 3ijGtDoMWI+FWTIrIqb81qN5K9T5+eOQ1eV2yaF9+JQ2ls3D
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

In order to stop patching the mdp5 headers, import definitions for the
writeback blocks. This part is extracted from the old Rob's patch.

Co-developed-by: Rob Clark <robdclark@gmail.com>
Signed-off-by: Rob Clark <robdclark@gmail.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.h | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.h b/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.h
index 26c5d8b4ab46..4b988e69fbfc 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.h
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.h
@@ -69,6 +69,16 @@ struct mdp5_mdp_block {
 	uint32_t caps;			/* MDP capabilities: MDP_CAP_xxx bits */
 };
 
+struct mdp5_wb_instance {
+	int id;
+	int lm;
+};
+
+struct mdp5_wb_block {
+	MDP5_SUB_BLOCK_DEFINITION;
+	struct mdp5_wb_instance instances[MAX_BASES];
+};
+
 #define MDP5_INTF_NUM_MAX	5
 
 struct mdp5_intf_block {
@@ -98,6 +108,7 @@ struct mdp5_cfg_hw {
 	struct mdp5_sub_block pp;
 	struct mdp5_sub_block dsc;
 	struct mdp5_sub_block cdm;
+	struct mdp5_wb_block wb;
 	struct mdp5_intf_block intf;
 	struct mdp5_perf_block perf;
 

-- 
2.39.2

