Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF6B39A3EB7
	for <lists+dri-devel@lfdr.de>; Fri, 18 Oct 2024 14:49:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C3E410E194;
	Fri, 18 Oct 2024 12:49:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="o8zSCyWV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 025BC10E194
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Oct 2024 12:49:45 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id
 ffacd0b85a97d-37ed3bd6114so243018f8f.2
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Oct 2024 05:49:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1729255784; x=1729860584; darn=lists.freedesktop.org;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=wNoX5IHrzAxgidozBILlAFDudMpJyA8374WuU9SBpdg=;
 b=o8zSCyWVbUchRTf9QUJdL4d85dzGsG3Tppa3/nS+vEte4Xoluc6/HYXiQAqynGrhZ0
 L3MuTytI0UgNjYvFZdOP6XThOxIVqcwWqIfAbuw36MNL8dHy635osBOcgpAzdeJZb5ow
 83bzfBT75u12/UHQonOPMO3qsLdXncJnoEd/wE2A2KG7roXWh/dkgN6IUQAF92TZuZXG
 ui1G4nxjJoUkbjIlASoiHCg6E3eCwJgVIjz43+1rmjanpVPhKNqbNCP5weBHNDwSAwv8
 r0zjKicdT3ebkUMlWben9JYlV1mSRvYj0wdcJDrWt3Y20PjctIqaH02mlOPnMaAm6J1H
 i19A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729255784; x=1729860584;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wNoX5IHrzAxgidozBILlAFDudMpJyA8374WuU9SBpdg=;
 b=K8QDFGkS75d0ebVGbCVfIPzGa7UjravyeeGoaaR15IwFVaEBUooN5Ko258OjgsW2oe
 dIwQd86xrHbIkB4M3jlf24KaYoehdq/85cqY2Ucbxgs0nUSJOsW/K7NfO9QnPeu+mNB9
 IAghSlkHni2IEQJkOVPFMftGh5phm3qABvyG5kf9nRE6UHQn4XVYclxvfvwG2QNYytXH
 lVbZZTybS6vyX/t/QBWP8hzjanVFMclKVW4N7MBU1IBYma0OlfF4zMyfj58hjTUoRgVc
 +3j/16dQJiIGB+VSMpaanyDmPniBWaFAXCCXpkTd01iBZD/0jyl4n2ruuvcF3/b1FWQw
 C83Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXQ6XH17I0Zb5KHirXA/bnchKnHd7uexVw3g0uYz205YNBZDe9pn9lxdVty/3MGO4lC/B/RbPk5E0s=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyOEoEFq3GTpXH+E9UswssYD+qmFf36A+3aG0bOswDSqnVaemjW
 yFuHj/Q1BIL5gEZGZRqXCg5umhmmsFWouSy9TV99BUTMxCgSmRaGx73dVh8Nn/s=
X-Google-Smtp-Source: AGHT+IE0g5FUhbZpxx/i7vohMC6D1yREIsPBdB29vyxyl4XkKH0dXnNvgXo8WwLLiI1oQb6uoUq09A==
X-Received: by 2002:adf:ffc5:0:b0:37d:5338:872c with SMTP id
 ffacd0b85a97d-37ea2136f6emr1545159f8f.1.1729255784024; 
 Fri, 18 Oct 2024 05:49:44 -0700 (PDT)
Received: from [127.0.1.1] ([82.76.168.176]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4316067dc56sm26751725e9.3.2024.10.18.05.49.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Oct 2024 05:49:43 -0700 (PDT)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Fri, 18 Oct 2024 15:49:34 +0300
Subject: [PATCH v2] drm/bridge: Fix assignment of the of_node of the parent
 to aux bridge
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241018-drm-aux-bridge-mark-of-node-reused-v2-1-aeed1b445c7d@linaro.org>
X-B4-Tracking: v=1; b=H4sIAF1ZEmcC/5WNQQ6CMBBFr0Jm7Zi2gTS68h6GRaFTmCitmQrBE
 O5u5QYu3//JextkEqYM12oDoYUzp1jAnCroRxcHQvaFwShTa6UtepnQzSt2wr68k5MHpoAxeUK
 hOZPHpjdEtlYh6AsU0Uso8HpE7m3hkfM7yedoLvq3/qVfNGq0vW+sMl1XB3N7cnSSzkkGaPd9/
 wLdUh+W1QAAAA==
X-Change-ID: 20241017-drm-aux-bridge-mark-of-node-reused-5c2ee740ff19
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Johan Hovold <johan@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>
X-Mailer: b4 0.15-dev-dedf8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1833; i=abel.vesa@linaro.org; 
 h=from:subject:message-id;
 bh=kfWulNWqB4gXHg5uFx3b3lXmDfL4uoz1uwfWItgVKtM=; 
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBnEllg/6+luv/EDjB6p7bP/2XwiFNKKUBTqWE/k
 gyey9MA9L+JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZxJZYAAKCRAbX0TJAJUV
 Viq2D/4ogi9WzQdFvO605u37JteTykuywyIuZKo4ul7KwGW2DSVO7LZ1vaYl5FU9HiS/EBcv6RY
 bah13DqPLIq88p5509alQOJbS2wIRVDYywa2NbUR0ZyVFQbjzWXpvN/8Du2K6F8j18pnnvJLXIE
 9os5LVxYeBjawUIFuDvdt5MUj1vxpYrdpcDtG5LCfKus6vjET03/hvebfcNx2tsNp3aeZR6F90w
 lWt2r833KeBE/QCFdUC0eKtor3U/rr8cQPKpDI5XhuJXkQsfZMVErhk9aLOhfQAGtP6Gy36t++u
 uBkQ4OAPSGbGkdqfSAP7ZsScfKEm0veOjXLUdsYkcUknoizIhlRgZjQ8sYi7WU1lrfUE9sFrhAX
 Hlf63ITK382waV1tQd9zd1ylpQJhetrl64HyYLNwXaenjtHoPL/Vi1jX2YX3EbQBNRKDOsI5ir/
 dWQNJLeRy1exV6vQuaE8jlceCe795hDdGL26FvHce9QP7sLVfkvRbDQkcySesq9MhpuAGHaQ8ZQ
 7bwXCHdyILO9dTa0U1//fMaOpmsruQFnqte+buQpTi4OtjKaXCj2hyG+ils+9O7FfDMa8YDTh02
 YpRNb5UOxLTKJdbcW05MWShGfs3gUtpJ6W/Ep9aaulkt6WYvwESX99S9O+uLKZVd/QsGrkuDYs5
 wK1rlN6/xHnaHMw==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
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

The assignment of the of_node to the aux bridge needs to mark the
of_node as reused as well, otherwise resource providers like pinctrl will
report a gpio as already requested by a different device when both pinconf
and gpios property are present.
Fix that by using the device_set_of_node_from_dev() helper instead.

Fixes: 6914968a0b52 ("drm/bridge: properly refcount DT nodes in aux bridge drivers")
Cc: stable@vger.kernel.org      # 6.8
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
Changes in v2:
- Re-worded commit to be more explicit of what it fixes, as Johan suggested
- Used device_set_of_node_from_dev() helper, as per Johan's suggestion
- Added Fixes tag and cc'ed stable
- Link to v1: https://lore.kernel.org/r/20241017-drm-aux-bridge-mark-of-node-reused-v1-1-7cd5702bb4f2@linaro.org
---
 drivers/gpu/drm/bridge/aux-bridge.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/aux-bridge.c b/drivers/gpu/drm/bridge/aux-bridge.c
index b29980f95379ec7af873ed6e0fb79a9abb663c7b..295e9d031e2dc86cbfd2a7350718fca181c99487 100644
--- a/drivers/gpu/drm/bridge/aux-bridge.c
+++ b/drivers/gpu/drm/bridge/aux-bridge.c
@@ -58,9 +58,10 @@ int drm_aux_bridge_register(struct device *parent)
 	adev->id = ret;
 	adev->name = "aux_bridge";
 	adev->dev.parent = parent;
-	adev->dev.of_node = of_node_get(parent->of_node);
 	adev->dev.release = drm_aux_bridge_release;
 
+	device_set_of_node_from_dev(&adev->dev, parent);
+
 	ret = auxiliary_device_init(adev);
 	if (ret) {
 		ida_free(&drm_aux_bridge_ida, adev->id);

---
base-commit: d61a00525464bfc5fe92c6ad713350988e492b88
change-id: 20241017-drm-aux-bridge-mark-of-node-reused-5c2ee740ff19

Best regards,
-- 
Abel Vesa <abel.vesa@linaro.org>

