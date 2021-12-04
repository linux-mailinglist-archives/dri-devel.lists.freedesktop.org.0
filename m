Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DE4C846937A
	for <lists+dri-devel@lfdr.de>; Mon,  6 Dec 2021 11:22:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D7E873E7F;
	Mon,  6 Dec 2021 10:20:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73DED6E8A0;
 Sat,  4 Dec 2021 10:55:42 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id z7so12770238lfi.11;
 Sat, 04 Dec 2021 02:55:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lyygTkATiuRhrYAmCBZB5JL9b+QAE7KNyFgVnfdr4xw=;
 b=J2kd6EO490vWFXaCl7LFrz/8P4u3qpQZpH4icbSfDlEUamdenfJwJSwk8sGUtbknNU
 MLTEFM/WH7wO+lfql7YAzXRrRXzeaTlEkeVU/quW2jFMOQASudPRH0m0Fx6EJIksdY/N
 Ds95sfVar2uzr2QXFuSYCzFMdbI2gfcT7ZUlD4LGLqf5RdIsdXTU5DhyONHPytVZr3Qs
 04MMOMAs9/y5MyggQ2hEBp5zlIbKblHt6OA7gU3NZYcslhUlajcw+akJ9/rf9eiesOd9
 9AurWHrFWDlaTD9xKWXsCbI4j9W0IFu0NdWapgtBgogA87bmW7KHmXQS0TYCXvhkas8t
 HQuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lyygTkATiuRhrYAmCBZB5JL9b+QAE7KNyFgVnfdr4xw=;
 b=l7DlWy5j13+BJ4q4QLD6injxhBm9cUuwRMlY9Qd6OTWzdTcXpCJJUN9g7mEJeWPjzn
 UxU1coLe4BzoDZY5auHmF8Qm0qaHy9Kkx4doLDhTGUc1TTq6IPHtjkLh5ebWNRHA7uki
 d4L4Qmq1LEwyCzw+7NvebRMcfB1hdjA5xqM/K0hjekF/eR1+jh3+b7v1H3urjxMyOjmZ
 /qQzPNBEKCWlKDZI63OjqWVTt7Q3PAqiA12IpHLcVC3kkT6E5QEkrNV/22rNtMaXLPYn
 KRSCdNcID0MiIKFqN/tyFmkKcFDksAVTqwWkO78UBehxptGGZ3DYRR1TF63+pZw3hKMp
 fmvA==
X-Gm-Message-State: AOAM533m/W/NkgA23cWQ1R6L5zt9TfWecWz8GhQTACw1ImY+biN7+Bea
 1yubpJlDXlnMHCd/8x+6qoo=
X-Google-Smtp-Source: ABdhPJwhZ8OGJIequinMhO9B6h+dZNF751Hz6WheXeDJ4m/rXPlCuS/K6i21b3Ua8MdNSlwkxOjpRA==
X-Received: by 2002:ac2:55ae:: with SMTP id y14mr23157543lfg.27.1638615340844; 
 Sat, 04 Dec 2021 02:55:40 -0800 (PST)
Received: from localhost.localdomain (h-155-4-221-129.NA.cust.bahnhof.se.
 [155.4.221.129])
 by smtp.gmail.com with ESMTPSA id d23sm723918lfm.107.2021.12.04.02.55.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Dec 2021 02:55:40 -0800 (PST)
From: Rikard Falkeborn <rikard.falkeborn@gmail.com>
To: Zhenyu Wang <zhenyuw@linux.intel.com>, Zhi Wang <zhi.a.wang@intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 6/9] drm/i915/gvt: Constify cmd_interrupt_events
Date: Sat,  4 Dec 2021 11:55:24 +0100
Message-Id: <20211204105527.15741-7-rikard.falkeborn@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211204105527.15741-1-rikard.falkeborn@gmail.com>
References: <20211204105527.15741-1-rikard.falkeborn@gmail.com>
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
Cc: Rikard Falkeborn <rikard.falkeborn@gmail.com>,
 intel-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

It is never modified, so make it const to allow the compiler to put it
in read-only memory.

Signed-off-by: Rikard Falkeborn <rikard.falkeborn@gmail.com>
---
 drivers/gpu/drm/i915/gvt/cmd_parser.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gvt/cmd_parser.c b/drivers/gpu/drm/i915/gvt/cmd_parser.c
index c4118b808268..ce9307546e7f 100644
--- a/drivers/gpu/drm/i915/gvt/cmd_parser.c
+++ b/drivers/gpu/drm/i915/gvt/cmd_parser.c
@@ -1144,7 +1144,7 @@ struct cmd_interrupt_event {
 	int mi_user_interrupt;
 };
 
-static struct cmd_interrupt_event cmd_interrupt_events[] = {
+static const struct cmd_interrupt_event cmd_interrupt_events[] = {
 	[RCS0] = {
 		.pipe_control_notify = RCS_PIPE_CONTROL,
 		.mi_flush_dw = INTEL_GVT_EVENT_RESERVED,
-- 
2.34.1

