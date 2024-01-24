Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD760839FCC
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jan 2024 04:01:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA3DC10F5C8;
	Wed, 24 Jan 2024 03:01:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E35DD10F5AE;
 Wed, 24 Jan 2024 03:01:10 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-40e5afc18f5so54498605e9.3; 
 Tue, 23 Jan 2024 19:01:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1706065209; x=1706670009; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2lKvsANFUcNVxLXJxZjgiBTj8Zdtr64bBDmNrQ/dGYc=;
 b=cA7a270f8WUGOIPUsQ5BDpPMPKja8Y0wJbZ/3xjaDDu8k74QH7xxWM0FSrumOTFQdI
 h++9UHSAO3Ii/prIN8RNZia5KB9fzBcddqtH0A8HVmVQBeJtQSxJLpQyiKtukgoZbO19
 +DsM7UlodB/24aH4ALgT18ylXXXgOEBoDAIBAAlC2WJ3xpvDE+gNRH1xR6xKwEi/wg8V
 vXkim6uNM+90qk4wEgA/zXwG2MGbA9Xhg/OK+Kz03GD2Fo2y/fU4He96t4w/cqfDIhwv
 +86N/w6AIeQZIgOU2pTGSLKF4jm3bq/PAxLkHSFImDf7K+nj3EpiNrEWokzSHgmE7bBZ
 WWOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706065209; x=1706670009;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2lKvsANFUcNVxLXJxZjgiBTj8Zdtr64bBDmNrQ/dGYc=;
 b=Jb0F0LH+5+bfKfDSpY5bDXsTygm9hxCqObjiA3eZSHYcn1+7ca/mAI1HJoULesSd+A
 82/iPMOnDbeGyq+HM1+L0aLeh8ivjD2lWMUmQ2m+s2qBN/fBEzWvPRJuArUkXCFpffnf
 l7Q0h28cmz2S3SlKcjnxiZrS8nB61knzuUOad+dIG41NT9F/zQ9l5Y8+tm2xik7j599w
 Ee6T9wpTfXXUl6jLegle9rGI8DOLt1ESDxQI5RaQ4t4r/ZsWTgMcwI+hIR6hdBLNOMw+
 rP2/eFfEdBol+1Q4jDIy+asUqt4CQOdP0zZFkfSE84C3qeTioraRixSYEVJtEWEggEf5
 Rgwg==
X-Gm-Message-State: AOJu0YyaHTv0GJtV8rmNfRvCbZ+aEqKEW4iykRwJakJzwG8M28UYjenw
 hFQCYhU4dS3kZhk1Ic9PWw+38BjRgog00bARogo8X3dZ9jfBMPLI
X-Google-Smtp-Source: AGHT+IFZ8JyJ3TC2xfMqcNV5Q5aHuhj3gsNkRM4/2otX+tMjwjVWKRVsJK9h8YN3NMi+Ch1oqtildg==
X-Received: by 2002:a05:600c:5399:b0:40e:9675:8416 with SMTP id
 hg25-20020a05600c539900b0040e96758416mr721099wmb.169.1706065209410; 
 Tue, 23 Jan 2024 19:00:09 -0800 (PST)
Received: from mosaic.enunes.eu (ip-78-45-66-209.bb.vodafone.cz.
 [78.45.66.209]) by smtp.gmail.com with ESMTPSA id
 dj17-20020a05640231b100b00559bb146ecbsm9637914edb.6.2024.01.23.19.00.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Jan 2024 19:00:08 -0800 (PST)
From: Erico Nunes <nunes.erico@gmail.com>
To: Qiang Yu <yuq825@gmail.com>, anarsoul@gmail.com, christian.koenig@amd.com,
 dri-devel@lists.freedesktop.org, lima@lists.freedesktop.org
Subject: [PATCH v2 1/8] drm/lima: reset async_reset on pp hard reset
Date: Wed, 24 Jan 2024 03:59:40 +0100
Message-ID: <20240124025947.2110659-2-nunes.erico@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240124025947.2110659-1-nunes.erico@gmail.com>
References: <20240124025947.2110659-1-nunes.erico@gmail.com>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 Erico Nunes <nunes.erico@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Lima pp jobs use an async reset to avoid having to wait for the soft
reset right after a job. The soft reset is done at the end of a job and
a reset_complete flag is expected to be set at the next job.
However, in case the user runs into a job timeout from any application,
a hard reset is issued to the hardware. This hard reset clears the
reset_complete flag, which causes an error message to show up before the
next job.
This is probably harmless for the execution but can be very confusing to
debug, as it blames a reset timeout on the next application to submit a
job.
Reset the async_reset flag when doing the hard reset so that we don't
get that message.

Signed-off-by: Erico Nunes <nunes.erico@gmail.com>
Reviewed-by: Vasily Khoruzhick <anarsoul@gmail.com>
---
 drivers/gpu/drm/lima/lima_pp.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/lima/lima_pp.c b/drivers/gpu/drm/lima/lima_pp.c
index a5c95bed08c0..a8f8f63b8295 100644
--- a/drivers/gpu/drm/lima/lima_pp.c
+++ b/drivers/gpu/drm/lima/lima_pp.c
@@ -191,6 +191,13 @@ static int lima_pp_hard_reset(struct lima_ip *ip)
 	pp_write(LIMA_PP_PERF_CNT_0_LIMIT, 0);
 	pp_write(LIMA_PP_INT_CLEAR, LIMA_PP_IRQ_MASK_ALL);
 	pp_write(LIMA_PP_INT_MASK, LIMA_PP_IRQ_MASK_USED);
+
+	/*
+	 * if there was an async soft reset queued,
+	 * don't wait for it in the next job
+	 */
+	ip->data.async_reset = false;
+
 	return 0;
 }
 
-- 
2.43.0

