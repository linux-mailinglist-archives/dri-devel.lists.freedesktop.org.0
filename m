Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AFF82790E4F
	for <lists+dri-devel@lfdr.de>; Sun,  3 Sep 2023 23:42:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC1F110E218;
	Sun,  3 Sep 2023 21:41:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F21710E219
 for <dri-devel@lists.freedesktop.org>; Sun,  3 Sep 2023 21:41:55 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-4ff8f2630e3so1429636e87.1
 for <dri-devel@lists.freedesktop.org>; Sun, 03 Sep 2023 14:41:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693777313; x=1694382113; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=f4CGlwIh3CaiNYfDE8T4/N3NKVw9L1KuLHleXxMGA8k=;
 b=KNA+iMyUQFJUdz/HiCbUktzZqZCX9ilawVn7nJ9pdABcuhwtHH5a9L7GC2Tsqqx026
 9bidKpanLs41y+2KRIqYubg1VHaQZAOaRuvpD8c4S2j+ZguquVtEIraWsqpyN9gv34Lb
 KqhEA7hQ9IAwfEpwMsPIZncyJoMbLYHw5YeJJf6pvKzTUhAIqoN9Vf4Dave/y91g0tU2
 A1YNg9pPGTEMHw6GlW0eR2/kSPA8FzYBCS2OEhS7U+QXIbnAdwWaY6nC71zDSKLnEMsw
 YtdV/YG+fj1Mrd9RRQ59I5/9TK98nD6Sdwx53wmkmjo4rF6k7TzRrQpJu11+0RcmSsB7
 Pcxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693777313; x=1694382113;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=f4CGlwIh3CaiNYfDE8T4/N3NKVw9L1KuLHleXxMGA8k=;
 b=bb/TRANVM4UNuxiFb01Am1E7Iwli8VzV3i3HEysD9U1Q6eZnvkizrs0iJ7jxIGfmh/
 VGOG849DbqsILjoE8Z31gyEIFb++aZMtfZYnrSycLXt88gQ8ZKgyiHhjkfyNvxCt+tTM
 sbsstvIZjrj8HRZIlVf3QG7JLsivMc9HJGPr49lcxFOHIuqr4S4WXjcB/Q+5qxsYsYs5
 BdcxzMOo4aiyQOX6bHk93VBLnp+ufYgCyE1TrH6OgC6oIxc5yAIcAaB1p1uE0k47taHx
 aPLacfvR/cFiulX3C1FGPG1e8cNSq+RUqOW8R6kMONEL/MlGXvrY+HefoaM8hhIBN6kE
 OlmA==
X-Gm-Message-State: AOJu0YyLQvXBvbw7hZ50MMYwlBN8UFhYRQetevpG+3BTa8rqQCI1M0OV
 +4YFZDarSslNN6kbT5sgBIX3OA==
X-Google-Smtp-Source: AGHT+IHZcZHwPmZz/G9GJYrJdaFt/yh7kFkMispc1XECmMNIp6Mo7eyJQIJfgGNG8gZdXS8BoslEpA==
X-Received: by 2002:a05:6512:3444:b0:4fb:911b:4e19 with SMTP id
 j4-20020a056512344400b004fb911b4e19mr3890157lfr.35.1693777313473; 
 Sun, 03 Sep 2023 14:41:53 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 x17-20020ac25dd1000000b004f8555f7aa1sm1422506lfq.52.2023.09.03.14.41.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Sep 2023 14:41:53 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
 Guenter Roeck <linux@roeck-us.net>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Janne Grunau <j@jannau.net>, Simon Ser <contact@emersion.fr>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [RFC PATCH v1 03/12] drm/connector: extend PATH property to covert
 Type-C case
Date: Mon,  4 Sep 2023 00:41:41 +0300
Message-Id: <20230903214150.2877023-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230903214150.2877023-1-dmitry.baryshkov@linaro.org>
References: <20230903214150.2877023-1-dmitry.baryshkov@linaro.org>
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
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Userspace needs to identify whether the DisplayPort connector is a
native one or it is wrapped into the USB-C port. Moreover the userspace
might need to point user to the exact location of this Type-C port on
the laptop case.

Existing USB-C altmode implementations (i915, amdgpu) have used the
DRM_MODE_CONNECTOR_DisplayPort even for such ports. To keep backwards
compatibility we can not change this to DRM_MODE_CONNECTOR_USB.
Therefore the kernel needs some other way to represent this information.

To facilitate this, reuse the 'PATH' property, which was used to
describe the DP port in the DP MST configuration. Use either
'typec:portN' to point out to the Type-C port class device, or just
'typec:' if the corresponding port can not be identified.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/drm_connector.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index 05fc29a54801..a326782e936e 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -1185,10 +1185,14 @@ static const u32 dp_colorspaces =
  * 	never read back the value of "DPMS" because it can be incorrect.
  * PATH:
  * 	Connector path property to identify how this sink is physically
- * 	connected. Used by DP MST. This should be set by calling
- * 	drm_connector_set_path_property(), in the case of DP MST with the
- * 	path property the MST manager created. Userspace cannot change this
+ * 	connected. This should be set by calling
+ * 	drm_connector_set_path_property(). Userspace cannot change this
  * 	property.
+ * 	In the case of DP MST this is equal to the path property the MST
+ * 	manager created. It is equal to 'mst:baseID-port-port...'.
+ * 	In the case of DP USB-C connector this is equal to the 'typec:portN',
+ * 	pointing to the corresponding Type-C port device or just 'typec' if the
+ * 	corresponding Type-C port can not be identified.
  * TILE:
  * 	Connector tile group property to indicate how a set of DRM connector
  * 	compose together into one logical screen. This is used by both high-res
-- 
2.39.2

