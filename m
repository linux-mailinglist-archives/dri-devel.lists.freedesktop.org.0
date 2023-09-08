Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A1547980CB
	for <lists+dri-devel@lfdr.de>; Fri,  8 Sep 2023 05:05:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B63F10E857;
	Fri,  8 Sep 2023 03:05:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29A8088D18
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Sep 2023 03:05:25 +0000 (UTC)
Received: by mail-lj1-x235.google.com with SMTP id
 38308e7fff4ca-2bc63e0d8cdso26102261fa.2
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Sep 2023 20:05:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1694142323; x=1694747123; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=o883M3C8fvtCGweIidn/6JBt/oAPnlfkI17tGXxBy4Q=;
 b=G35MY/2RINyIx9c/rruvbfI1RXixAN4uO++0gTTMYFqrNuxalf4LMySTZUjZtlzO2A
 6WtiQFjMHackXn0yBn/SBEF+v3Lyy368BWt3cUyKCQp5UdI57ZgfjBrD6nnb1rahbwwI
 rx9Fajzu9KHE5HlAw8qaiwII6Mn39sVRdkZtSoI/HcC6cGdsdOn1SfnuCDe8XIc1shFg
 sYanytUc7lx9ObDq/+i5kqc/lt4ZHGNHXKipwa4ag+0TXuaHr/we9KPq8/0F9/nXx4yp
 fPFQ+H4D90oNF7njghuwzrzrPUR/zlf3izITNMFk/omtV6HIKHnm4gsVRhPmN4F/buHO
 JGNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694142323; x=1694747123;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=o883M3C8fvtCGweIidn/6JBt/oAPnlfkI17tGXxBy4Q=;
 b=NATvf4uae5Phc+enJl5Yt+eRlIOK9JVPbao1yKsyAL8gqwg0QVssfry8vQhZK8Sg2j
 A7KxGbcM/B3YnSuEpwqXgVzEpLr7iwulYDTcD1qKGr/ZkSuQSjPa+3lvrnTozGNsM5+B
 DqR406993dvSD6mevHREf97B5rglMuvcPv8MCXTuXHWnXopZ09f3agocGwDvhTeyJJiI
 tzuJOIqK1Gc+YQLGvcwzRCp1wpZhIp9GkLj6Ch6fX0J2ORTPPw+j/6rMf1OtIqGvSqdT
 u6icAw8icVw+tCOLk88I2GJ/a2Hnu5nEPTIyJdtINtUk95DeZdqT6SL6LFo4H9m2Srd0
 q7xw==
X-Gm-Message-State: AOJu0Yz21NYnsaaZAWo+h5NQ5WBRSqphkfC52T/qlkThvgigw1haN3l7
 /MfCoOnf18TdLvRJ1yPm1ZQX6Q2sbLt0oZh4stY=
X-Google-Smtp-Source: AGHT+IGpggkFyIkBUixeUSKNcYrFKcn+bnKrNcdK4A5JLNXtk7ZuNI1nZCzfID5emgXF1KO8lwSi3Q==
X-Received: by 2002:a2e:9303:0:b0:2bd:b99:ab7e with SMTP id
 e3-20020a2e9303000000b002bd0b99ab7emr636452ljh.42.1694142323342; 
 Thu, 07 Sep 2023 20:05:23 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 z10-20020a2e8e8a000000b002b93d66b82asm128332ljk.112.2023.09.07.20.05.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Sep 2023 20:05:22 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 1/5] drm/atomic: add private obj state to state dump
Date: Fri,  8 Sep 2023 06:05:17 +0300
Message-Id: <20230908030521.236309-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230908030521.236309-1-dmitry.baryshkov@linaro.org>
References: <20230908030521.236309-1-dmitry.baryshkov@linaro.org>
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
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The drm_atomic_print_new_state() already prints private object state via
drm_atomic_private_obj_print_state(). Add private object state dumping
to __drm_state_dump(), so that it is also included into drm_state_dump()
output and into debugfs/dri/N/state file.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/drm_atomic.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
index c277b198fa3f..9543e284dc15 100644
--- a/drivers/gpu/drm/drm_atomic.c
+++ b/drivers/gpu/drm/drm_atomic.c
@@ -1773,6 +1773,7 @@ static void __drm_state_dump(struct drm_device *dev, struct drm_printer *p,
 	struct drm_crtc *crtc;
 	struct drm_connector *connector;
 	struct drm_connector_list_iter conn_iter;
+	struct drm_private_obj *obj;
 
 	if (!drm_drv_uses_atomic_modeset(dev))
 		return;
@@ -1801,6 +1802,14 @@ static void __drm_state_dump(struct drm_device *dev, struct drm_printer *p,
 	if (take_locks)
 		drm_modeset_unlock(&dev->mode_config.connection_mutex);
 	drm_connector_list_iter_end(&conn_iter);
+
+	list_for_each_entry(obj, &config->privobj_list, head) {
+		if (take_locks)
+			drm_modeset_lock(&obj->lock, NULL);
+		drm_atomic_private_obj_print_state(p, obj->state);
+		if (take_locks)
+			drm_modeset_unlock(&obj->lock);
+	}
 }
 
 /**
-- 
2.39.2

