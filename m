Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 043107EF7F9
	for <lists+dri-devel@lfdr.de>; Fri, 17 Nov 2023 20:44:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B858210E76E;
	Fri, 17 Nov 2023 19:44:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2e.google.com (mail-oa1-x2e.google.com
 [IPv6:2001:4860:4864:20::2e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5944510E08F
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Nov 2023 19:44:12 +0000 (UTC)
Received: by mail-oa1-x2e.google.com with SMTP id
 586e51a60fabf-1efa01323b4so1289647fac.3
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Nov 2023 11:44:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700250251; x=1700855051; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9l9Un6Vq4BKwmZrHqY5GaENjD6mCXDItjRLg6fRH528=;
 b=TiOe9kKlNK1F4jXpp7OljyGKuTMRes4teS78BdvQoHSj7OguDIHJOArKq/NAR9wLfa
 npEhIK0UOJnfH0KTMnm3Wv/swLou5xiUQbtmf2afS2NSMdS2yVII45n/9KjOwqRD0UPc
 GZmnpHVlvYEz3L6cToGmQmirb6fP+OOL3kRjBlefV3KqZnN23twRnxsCpyIalsjXPqi6
 2UvggXauHYtvfZUSik2SwMvwyCjdO4UaoqNzwW/2bKWxz4cyzK+jm4kW5XrDstRyaIXb
 3loN+TCvBTNkyNwkJGeggE1QWVdd1APUYPDkL1JN4wvxpuiUecGX4yKoBN7CEZ77LrRZ
 7lMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700250251; x=1700855051;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9l9Un6Vq4BKwmZrHqY5GaENjD6mCXDItjRLg6fRH528=;
 b=c65nRsNtPzXD+PsEJtZLRXCTW5ZcmlGeS2LKV2S6obZTdbmHOx7rNDfp66O4Ew7NRD
 e8Pym5P1ZZx6OHTWwKEEU/QjMD9K9/+XPotI/tUzTikT78HKgZ1APA1Gi/cQs2Xo8ukQ
 HsIGwzdtEVLt0NF9IBFxvlnUOo2b5AuH4stNTO9hFGvrQtN6mNNuYVaNXmTE926PKF9q
 9+wrXzymWqBpGb9XLSiQWt9BlPj2NttGyviP98YKwSM2D9XWkWeZI+sc4pAOCZJZiOfH
 /7HC0+rmXzwqesTk68SK5RJRU4UZpUW5sKOCFlXunGGc3xxRVMBd3w0DEuhirKn31Hqj
 YYRA==
X-Gm-Message-State: AOJu0YzA5jEfHrQ8bF7TcIClK1CjR14Xq2Kl22uKTqAJak0Dx7ZtwvuQ
 SZx8+bWSFiWRpvsweUTe6YF7kSZogpk=
X-Google-Smtp-Source: AGHT+IH9iv8LxeZK2QF2F/Toy73+oSMqBWi/E+dwYoA55DwtWDvYIC45mPkTmKCwZfEc+yTArNaNWg==
X-Received: by 2002:a05:6870:c392:b0:1e9:9215:3987 with SMTP id
 g18-20020a056870c39200b001e992153987mr205342oao.16.1700250251366; 
 Fri, 17 Nov 2023 11:44:11 -0800 (PST)
Received: from localhost.localdomain ([75.28.21.198])
 by smtp.gmail.com with ESMTPSA id
 y5-20020a056830108500b006cd099bb052sm338193oto.1.2023.11.17.11.44.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Nov 2023 11:44:11 -0800 (PST)
From: Chris Morgan <macroalpha82@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH V2 2/5] drm/panel-elida-kd35t133: hold panel in reset for
 unprepare
Date: Fri, 17 Nov 2023 13:44:02 -0600
Message-Id: <20231117194405.1386265-3-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231117194405.1386265-1-macroalpha82@gmail.com>
References: <20231117194405.1386265-1-macroalpha82@gmail.com>
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
Cc: quic_jesszhan@quicinc.com, sam@ravnborg.org,
 Chris Morgan <macromorgan@hotmail.com>, neil.armstrong@linaro.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Chris Morgan <macromorgan@hotmail.com>

For devices like the Anbernic RG351M and RG351P the panel is wired to
an always on regulator. When the device suspends and wakes up, there
are some slight artifacts on the screen that go away over time. If
instead we hold the panel in reset status after it is unprepared,
this does not happen.

Fixes: 5b6603360c12 ("drm/panel: add panel driver for Elida KD35T133 panels")
Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 drivers/gpu/drm/panel/panel-elida-kd35t133.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-elida-kd35t133.c b/drivers/gpu/drm/panel/panel-elida-kd35t133.c
index 6cd8536c09ff..f1fc4a26f447 100644
--- a/drivers/gpu/drm/panel/panel-elida-kd35t133.c
+++ b/drivers/gpu/drm/panel/panel-elida-kd35t133.c
@@ -104,6 +104,8 @@ static int kd35t133_unprepare(struct drm_panel *panel)
 		return ret;
 	}
 
+	gpiod_set_value_cansleep(ctx->reset_gpio, 1);
+
 	regulator_disable(ctx->iovcc);
 	regulator_disable(ctx->vdd);
 
-- 
2.34.1

