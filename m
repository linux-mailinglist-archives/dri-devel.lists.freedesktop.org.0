Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7103B8C3046
	for <lists+dri-devel@lfdr.de>; Sat, 11 May 2024 10:54:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D93910E04D;
	Sat, 11 May 2024 08:54:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="a5/pkPyu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com
 [209.85.208.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09ABE10E04D
 for <dri-devel@lists.freedesktop.org>; Sat, 11 May 2024 08:54:38 +0000 (UTC)
Received: by mail-lj1-f178.google.com with SMTP id
 38308e7fff4ca-2e2c70f0c97so32740191fa.0
 for <dri-devel@lists.freedesktop.org>; Sat, 11 May 2024 01:54:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1715417677; x=1716022477; darn=lists.freedesktop.org;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=zUvWAtUTM4Sm4FoN3R4b0S2PPHKLWOTANM8Xp+Goivg=;
 b=a5/pkPyuUVwjlhP+RSMu8IwRtQv2/WgDy2Pf+5D1eb7Ob+IPBNKzS2Sjv/4LEQwORz
 f70L/YpQppbloM12LqIwLx0cOZEFPftR8pWcLCUkMylZV1ikeRoAfSLhaE4su+/3lPu+
 pbhMfPcJKkKvjpQcnXOM2/NfbV4HBcTZGcVNTs8nkscasHba8PG+ZaPkKCoZZwbvUSgA
 +sPD7Ijh+Ad38RPWTdLqnoyUDmuhWnAP9ByCk/jWPTh0zcA3N/XjREtJevI+9ysdKLzB
 PtTpuUuUo5sYzKeayd9jwwJdEGAHtZFTK5t+gUYRHhdSixzPzHlmJCnT/QVJmqZGmhOH
 gsSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715417677; x=1716022477;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zUvWAtUTM4Sm4FoN3R4b0S2PPHKLWOTANM8Xp+Goivg=;
 b=Z/wfiMm22JYOAO8eZKCr5GWsp49zkS/nb8rhA9dYeXyXe5JHUkkv5NQKy1SqLe66vP
 32e5uxAJgLUn9UdprDd473mJ8+8fF2MBSXth+AT/xT5t8gJazaRPDqnQEaHAY5h3ySWq
 9QOFclu9A8LDjUc3H8Ab4755IXRs/3s5DjkP7+HpX1+Ks3RMeKRKQVc/gzcDaBPxWIxk
 pcSsYQT8gwmZ82tnFS2zBfAKJC2gMT1j30d2VZ6gJq4MiIlZgxfZJ2265Kjvs8Z0N40J
 eNHY91qeqR/5jz3qQgC6mmHh5VAB2BSp672L5izQI6z7DaiYMI3GPdbfh26OEff3YNRs
 WyPA==
X-Gm-Message-State: AOJu0YzTmLY5vZxQBc1R7PuldnYQokJCJDdS6xQbFIKjqvWJxjzS6nZO
 gjCTclfxNUTykwtv9EBlnSLBtEyIVR3n96yMFbNBxPGJ0ffBCdpukulE7SbMHbQ=
X-Google-Smtp-Source: AGHT+IFxmb3JASctmdQgt9BFaS012sf6ELNlLw2ZYBIT1wHgxOLuixLYpW87XXBjRRhFOdfcx5zcLQ==
X-Received: by 2002:a05:6512:23a0:b0:51b:e46c:19fd with SMTP id
 2adb3069b0e04-5220fc7acdcmr3641943e87.18.1715417676689; 
 Sat, 11 May 2024 01:54:36 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-521f38d3237sm961631e87.142.2024.05.11.01.54.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 May 2024 01:54:36 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 11 May 2024 11:54:30 +0300
Subject: [PATCH] drm/bridge: aux-hpd-bridge: correct
 devm_drm_dp_hpd_bridge_add() stub
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240511-fix-aux-hpd-stubs-v1-1-98dae71dfaec@linaro.org>
X-B4-Tracking: v=1; b=H4sIAEUyP2YC/x2MQQqAMAzAviI9W1hFGfgV8TBn53pRWZ0Iw787P
 AaSFFBOwgpjUyDxLSrHXoHaBnx0+8Yoa2XoTNebgQiDPOjyg/FcUa+8KBJZbyyFEKyF2p2Jq/Q
 /p/l9P/RDEjxjAAAA
To: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Johan Hovold <johan+linaro@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-usb@vger.kernel.org, kernel test robot <lkp@intel.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1323;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=qc1uu2w0hZF9sL0QGWbvDzG6Bu3Z4a6AXG0E9PYlt3w=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ5q9kYe6aNXtI9uPP/h+lZGvKur40WVdWf3e5YKzuEKq/
 Jakm0/qZDRmYWDkYpAVU2TxKWiZGrMpOezDjqn1MINYmUCmMHBxCsBETp1n/1+vXpY1L5jfRIil
 RMm/kSc3m0lj9nPrRKW4yijTH8YnQzQ3nt9YrlkbIWnducviIKfLlTM+exoz/OYmRPedeq1nUrh
 BUM1CnN3vXqnGurcH1qyvP30s3GsBw6TWnNnG7Vvj30VUr92rJOKxYsqyRKNm4YeuqlKX2GeWJ1
 hN0fvbcHr9V6M8ldlfvk6Jf6Uk/sj7MntQr+tVXdfNTP65a3WLpor+lmnawtskknm4++Kf2fc1N
 d7mt325tW3hTzteE654XS+2WYWpD0N6Htl9CJmQNDlXQ7vnxJ7kZzEud+QOWOiqH9rsfPiVbNmy
 icrPlCYW/jv2+P9RRqWXiRsDhH22rvrzw63/iKdxQ7sRAA==
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

If CONFIG_DRM_AUX_HPD_BRIDGE is not enabled, the aux-bridge.h header
provides a stub for the bridge's functions. Correct the arguments list
of one of those stubs to match the argument list of the non-stubbed
function.

Fixes: e5ca263508f7 ("drm/bridge: aux-hpd: separate allocation and registration")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202405110428.TMCfb1Ut-lkp@intel.com/
Cc: Johan Hovold <johan+linaro@kernel.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 include/drm/bridge/aux-bridge.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/drm/bridge/aux-bridge.h b/include/drm/bridge/aux-bridge.h
index 4453906105ca..c2f5a855512f 100644
--- a/include/drm/bridge/aux-bridge.h
+++ b/include/drm/bridge/aux-bridge.h
@@ -33,7 +33,7 @@ static inline struct auxiliary_device *devm_drm_dp_hpd_bridge_alloc(struct devic
 	return NULL;
 }
 
-static inline int devm_drm_dp_hpd_bridge_add(struct auxiliary_device *adev)
+static inline int devm_drm_dp_hpd_bridge_add(struct device *dev, struct auxiliary_device *adev)
 {
 	return 0;
 }

---
base-commit: 713a75079f37b92835db48b27699e540657e3c5a
change-id: 20240511-fix-aux-hpd-stubs-117c071fff77

Best regards,
-- 
With best wishes
Dmitry

