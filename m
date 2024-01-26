Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7382B83D4D0
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jan 2024 09:43:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB99010E1BA;
	Fri, 26 Jan 2024 08:43:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B5A610E6F8
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jan 2024 08:42:55 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id
 ffacd0b85a97d-337d58942c9so141819f8f.0
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jan 2024 00:42:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1706258510; x=1706863310; darn=lists.freedesktop.org;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=FHr39JH9ZAVO5s/Q6TxKvwEModPDg6RBhwecUYh/FLY=;
 b=qt6Ih6Bhp147wXcap46qdr3uBm+zpfbOXwxE+FzVx6rfyjSwyug7jizvnNWMU9B6EJ
 sWH/mqGA63yzT9Fi5SNm/CegDnCn0UDIyKKB+LqAujEq9wV9ezbo/FeQRca1lp/kuq8U
 ICB8C8zruKxSi9arZyn2CGOWXtnaNigCcQmuJAEUZiUQiUDNTpNxaCBoiQbNIq9iYVwe
 d/gpYBaZM+K4fIPeF5RDzzlY8OBMmQzEQrBXAFTqEVkRt1wOdhnWvajjYJEhkLnAt52f
 iE0Z76bQOgmbssCRwX5fja86MPenXbWKhC92qI7T4lUZxJBwUUtIooyPN/Ic/mv8p2CJ
 DQcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706258510; x=1706863310;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=FHr39JH9ZAVO5s/Q6TxKvwEModPDg6RBhwecUYh/FLY=;
 b=vrgRghRo1rDbrFo4q4aQJ2ezKzlJeUk9kWjBUfzIKrrdEATkUkHMc6nkV06XIh/J0j
 HEPNshV4FDJb2+mRQ7L4tQ/z8288V4Vw7IUkzQgsp4X7XEqnDo60ZfjMbju+jYuPGe1x
 pJHu1dnGC1bfq3IT7evGKjjAVzzcJE3j74MX8JDIIfeGzveBxZgQSE12tD864UTz0FDS
 cAa4XfAVATSqxLmAKDcOJOtymrqvjy1XJS+EIqL15HRrrtrpTTP+8WdeIiEoyzwmLMhR
 27Wg95mU3WKg5N3aY/1mE+xyd4c1dZlJk6ACGSNMHSwou0wbL3jZkviEy9Zg083KQcVE
 ztcQ==
X-Gm-Message-State: AOJu0Yyzz/ftzfUqO/KqwYWxLC/Gc6E258BalazeoRa8CU9rnMqhsYeS
 9eqBTbvrNm+oKu/WZXUEo9wUQXkHaFJ2sCmHDJ+XeArY/edqNlQjMK++R8VT+So=
X-Google-Smtp-Source: AGHT+IGODQTp1WGBJOYeb5QpU8MHe6FvpWAhmxNfECU8K2SX9RjwK0yxx8LAKL3RZy4pjkFNfgFKVQ==
X-Received: by 2002:adf:e852:0:b0:33a:ddff:7774 with SMTP id
 d18-20020adfe852000000b0033addff7774mr24330wrn.36.1706258510562; 
 Fri, 26 Jan 2024 00:41:50 -0800 (PST)
Received: from localhost ([102.140.209.237]) by smtp.gmail.com with ESMTPSA id
 bt7-20020a056000080700b00337d4ce6ab4sm766097wrb.20.2024.01.26.00.41.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Jan 2024 00:41:50 -0800 (PST)
Date: Fri, 26 Jan 2024 11:41:47 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Zhi Wang <zhi.a.wang@intel.com>
Subject: [PATCH] drm/i915/gvt: Fix uninitialized variable in handle_mmio()
Message-ID: <11957c20-b178-4027-9b0a-e32e9591dd7c@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 dri-devel@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, Daniel Vetter <daniel@ffwll.ch>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This code prints the wrong variable in the warning message.  It should
print "i" instead of "info->offset".  On the first iteration "info" is
uninitialized leading to a crash and on subsequent iterations it prints
the previous offset instead of the current one.

Fixes: e0f74ed4634d ("i915/gvt: Separate the MMIO tracking table from GVT-g")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpu/drm/i915/gvt/handlers.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/gvt/handlers.c b/drivers/gpu/drm/i915/gvt/handlers.c
index 90f6c1ece57d..efcb00472be2 100644
--- a/drivers/gpu/drm/i915/gvt/handlers.c
+++ b/drivers/gpu/drm/i915/gvt/handlers.c
@@ -2849,8 +2849,7 @@ static int handle_mmio(struct intel_gvt_mmio_table_iter *iter, u32 offset,
 	for (i = start; i < end; i += 4) {
 		p = intel_gvt_find_mmio_info(gvt, i);
 		if (p) {
-			WARN(1, "dup mmio definition offset %x\n",
-				info->offset);
+			WARN(1, "dup mmio definition offset %x\n", i);
 
 			/* We return -EEXIST here to make GVT-g load fail.
 			 * So duplicated MMIO can be found as soon as
-- 
2.43.0

