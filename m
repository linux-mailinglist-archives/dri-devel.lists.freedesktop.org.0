Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 055B262E610
	for <lists+dri-devel@lfdr.de>; Thu, 17 Nov 2022 21:39:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 334A810E67B;
	Thu, 17 Nov 2022 20:39:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com
 [IPv6:2607:f8b0:4864:20::d30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8878210E657
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Nov 2022 20:39:12 +0000 (UTC)
Received: by mail-io1-xd30.google.com with SMTP id p184so2312555iof.11
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Nov 2022 12:39:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HFWkWqQjI46OeczyUCkFpr7MHjvDvFUokPuH4qzo/bw=;
 b=BNcRyYo1cs5H5wz/ooc/TaJyoeJQ8emL3WoCGbpKPrfUS1nlvORE78y9bqw3y0Z5w+
 w8ZqaO/V7hCEAv6ZwwP6eNc/npYjSfskSs1qpgMswcD5xRMpRkF/suTtrTX1DfSKkQzP
 IrFZpAM0rWr/KbthvifIe0mxC9QFGD97ng/4Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HFWkWqQjI46OeczyUCkFpr7MHjvDvFUokPuH4qzo/bw=;
 b=OKAxOgUpfl3/OIxUOrvYsUW31T41Wcs9XGj/NyinKh7Vq5NJA+xOwvigJgHYBPXIyR
 5frqjqWMrd/5Rn3gRgAqWEZXG1zDjKI5gkYZimTfQsiDoJT4eKQY3VZy0U7qKcqRh021
 4PC/GB16IeeNSMGcljl5y9M2l0A6Iox5yQEUwHxs8tVnZqq/ahBx1vbhWTKalpHUs7Wh
 Lob230uNEfKy045RYhgHOTlJFGRApKQ7Rhcvyu1OWwolEp8xaM++ylOJjuGKyHfRJ/uU
 CFIO/0sCY4zKQUgAoqUym5kN6vuQKic3R+BN6Z1g3QXBmAidGD4l6zaFEBOXuTFe8Rqz
 rCHw==
X-Gm-Message-State: ANoB5pn7Ho358l6R0t8WxI+n4idRZO3ELW/8nIM2VZoGeLdu06Dm8Gnb
 BtiN0bNbFuvEOhuR6MrRaI52k8VdsGEKbQ==
X-Google-Smtp-Source: AA0mqf5+BPEGrp46T/YWlC2wc+z8vnTOZvFcMl/0RZ2ToQg3vrCmVrcjDa9tb5KKgV2l07n5Xp5jIA==
X-Received: by 2002:a05:6638:4907:b0:375:ca55:284e with SMTP id
 cx7-20020a056638490700b00375ca55284emr1888278jab.248.1668717551175; 
 Thu, 17 Nov 2022 12:39:11 -0800 (PST)
Received: from midworld.bld.corp.google.com
 ([2620:15c:183:200:b285:6808:3f3e:f538])
 by smtp.gmail.com with ESMTPSA id
 d191-20020a0262c8000000b00363da904602sm570192jac.13.2022.11.17.12.39.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Nov 2022 12:39:10 -0800 (PST)
From: Drew Davenport <ddavenport@chromium.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 4/5] drm/bridge/parade-ps8640: Extend autosuspend
Date: Thu, 17 Nov 2022 13:38:47 -0700
Message-Id: <20221117133655.4.If6153da69ec4bc9e83d5f095ef6e6b07283940a5@changeid>
X-Mailer: git-send-email 2.38.1.584.g0f3c55d4c2-goog
In-Reply-To: <20221117133655.1.I51639dc112bbbe27259df6bdad56dbabd655d91a@changeid>
References: <20221117133655.1.I51639dc112bbbe27259df6bdad56dbabd655d91a@changeid>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Jonas Karlman <jonas@kwiboo.se>,
 Robert Foss <robert.foss@linaro.org>, dianders@chromium.org,
 Jernej Skrabec <jernej.skrabec@gmail.com>, linux-kernel@vger.kernel.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Drew Davenport <ddavenport@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Same change as done for panel-samsung-atna33xc20. Extend the autosuspend
delay to avoid oscillating between power status during boot.

Signed-off-by: Drew Davenport <ddavenport@chromium.org>
---

 drivers/gpu/drm/bridge/parade-ps8640.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/parade-ps8640.c b/drivers/gpu/drm/bridge/parade-ps8640.c
index 6a614e54b383c..f74090a9cc9e8 100644
--- a/drivers/gpu/drm/bridge/parade-ps8640.c
+++ b/drivers/gpu/drm/bridge/parade-ps8640.c
@@ -734,13 +734,13 @@ static int ps8640_probe(struct i2c_client *client)
 	pm_runtime_enable(dev);
 	/*
 	 * Powering on ps8640 takes ~300ms. To avoid wasting time on power
-	 * cycling ps8640 too often, set autosuspend_delay to 1000ms to ensure
+	 * cycling ps8640 too often, set autosuspend_delay to 2000ms to ensure
 	 * the bridge wouldn't suspend in between each _aux_transfer_msg() call
 	 * during EDID read (~20ms in my experiment) and in between the last
 	 * _aux_transfer_msg() call during EDID read and the _pre_enable() call
 	 * (~100ms in my experiment).
 	 */
-	pm_runtime_set_autosuspend_delay(dev, 1000);
+	pm_runtime_set_autosuspend_delay(dev, 2000);
 	pm_runtime_use_autosuspend(dev);
 	pm_suspend_ignore_children(dev, true);
 	ret = devm_add_action_or_reset(dev, ps8640_runtime_disable, dev);
-- 
2.38.1.584.g0f3c55d4c2-goog

