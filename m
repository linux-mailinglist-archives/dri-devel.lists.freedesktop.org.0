Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C7B2C497466
	for <lists+dri-devel@lfdr.de>; Sun, 23 Jan 2022 19:40:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8690B10E889;
	Sun, 23 Jan 2022 18:40:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com
 [IPv6:2607:f8b0:4864:20::52b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8649C10E889;
 Sun, 23 Jan 2022 18:40:11 +0000 (UTC)
Received: by mail-pg1-x52b.google.com with SMTP id j10so1012984pgc.6;
 Sun, 23 Jan 2022 10:40:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=5dgQylvVki0nkzDnS/+Po4tisaRNHjVIflYn4fyQ95A=;
 b=NPOFz183ei2daEpofKHSZlIolbNFGvjJd0bvuAgxnQXa1mbuzsB8hvhkTyioW5ltoS
 y5sMMuWjyvc6kDKU9Jy9RUasJPQQydggdGhHkwIb35VXWo1CaSQ0zCd9mdEPpwTnH9lE
 TQqSWzrtUY0GJOlgUr5T7TRU7USi2tfNg0iPTHfbRBNkqvnNmL37z4Z3nE/duk/GdyQ5
 cmvTi8PRmdLMbpY5nfSMCDbv/xdK/q2iKEIs8W5TKJvzZ6qlATNv/wm7uCbiAn1dPBU1
 +aM82cX+6IPqeayXYKuA7LfBX8rP3SzfEyhASY6EF68X1T6Es8PNFrBgcehKUkL4wkcD
 DEnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5dgQylvVki0nkzDnS/+Po4tisaRNHjVIflYn4fyQ95A=;
 b=AYkugjrNz8TiBaHH22me4/uU1G7+2cW/+Sq+DlAMiS9mluXOSwZIH67UIjlJaoQ3Wf
 /0R8PQfrRraDaYm/oU7WL0Dv0wORSaaLUkJfidg6ATg37kDYb5xP5RxsybojSax1+c++
 8eYa+kW1pnPr0NeT/YWZKXizAdsGAxii0yj4GsKXkMpXoL0p73TDqXsE68CaNfj0Gch3
 ZkKx6mP0F3w9Y0BpLwqyTYkodyaD8gclJKWGo7HRNoicbAsIcq+6CsR/wEmyLwGBysN7
 KY24CebedmiTly16ukU+tm+1FFuKwbv9N2iWp2KZ0eet3C0iH6+EQ7+nsMm7pErhHbz4
 XtMA==
X-Gm-Message-State: AOAM531Uf/ZkewXVR2j3knVJ/DYeMQIW9Z0lAFr7I35Vi3GKqkqtK2Ro
 H9mnDxSUvrp3uOmrid5xI6o=
X-Google-Smtp-Source: ABdhPJzsBbCwcI8UQ9QtXW6uxvo0U0RHWhtm06Iz8OLFP8vkslwU6MYNdswa+/Z1sC5DBYGMC9d39A==
X-Received: by 2002:a05:6a00:23cc:b0:4c6:d3b8:29ea with SMTP id
 g12-20020a056a0023cc00b004c6d3b829eamr11191897pfc.78.1642963211024; 
 Sun, 23 Jan 2022 10:40:11 -0800 (PST)
Received: from localhost (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id a3sm10460879pfk.73.2022.01.23.10.40.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Jan 2022 10:40:10 -0800 (PST)
From: Yury Norov <yury.norov@gmail.com>
To: Yury Norov <yury.norov@gmail.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Andrew Morton <akpm@linux-foundation.org>,
 =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Peter Zijlstra <peterz@infradead.org>,
 David Laight <David.Laight@aculab.com>, Joe Perches <joe@perches.com>,
 Dennis Zhou <dennis@kernel.org>, Emil Renner Berthing <kernel@esmil.dk>,
 Nicholas Piggin <npiggin@gmail.com>,
 Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
 Alexey Klimov <aklimov@redhat.com>, linux-kernel@vger.kernel.org,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH 07/54] gpu: drm: replace bitmap_weight with bitmap_empty where
 appropriate
Date: Sun, 23 Jan 2022 10:38:38 -0800
Message-Id: <20220123183925.1052919-8-yury.norov@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220123183925.1052919-1-yury.norov@gmail.com>
References: <20220123183925.1052919-1-yury.norov@gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

smp_request_block() in drivers/gpu/drm/msm/disp/mdp5/mdp5_smp.c calls
bitmap_weight() to check if any bit of a given bitmap is set. It's
better to use bitmap_empty() in that case because bitmap_empty() stops
traversing the bitmap as soon as it finds first set bit, while
bitmap_weight() counts all bits unconditionally.

Signed-off-by: Yury Norov <yury.norov@gmail.com>
---
 drivers/gpu/drm/msm/disp/mdp5/mdp5_smp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_smp.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_smp.c
index d7fa2c49e741..56a3063545ec 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_smp.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_smp.c
@@ -68,7 +68,7 @@ static int smp_request_block(struct mdp5_smp *smp,
 	uint8_t reserved;
 
 	/* we shouldn't be requesting blocks for an in-use client: */
-	WARN_ON(bitmap_weight(cs, cnt) > 0);
+	WARN_ON(!bitmap_empty(cs, cnt));
 
 	reserved = smp->reserved[cid];
 
-- 
2.30.2

