Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DA64A7BF52
	for <lists+dri-devel@lfdr.de>; Fri,  4 Apr 2025 16:32:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AAD310E206;
	Fri,  4 Apr 2025 14:32:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="VE3RuAiy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com
 [209.85.208.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DAC710E14E
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Apr 2025 14:32:27 +0000 (UTC)
Received: by mail-ed1-f48.google.com with SMTP id
 4fb4d7f45d1cf-5ed43460d6bso3468492a12.0
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Apr 2025 07:32:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1743777146; x=1744381946; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5ItVLbwXh6klaFZ4DOTZKuJkyifurR/QGuqAr/eTlGU=;
 b=VE3RuAiykeJzB1KQHO6uaxVZE/qBDcT6a1/R+7lnwMjYG21gmPg3wf1BVbC/hEkJ53
 IgScuzM34cflDRMuJ8LAr4vNWVfr6vthb3qEzMxSA6qM6dczfGcd3XgAh5K5N750T1ln
 LoBjnN8bvlT/HwfJ0xy9gobirEba4vVK4y2FqPcccO+iwR0hIHHKmWxZGfod4x8nzPlk
 nxrqvTx5KkQSMCPEqgja5zXiZqnCrv9kgB8vy5xLUNPzPdQBaX74knHOnF3UFnJO8BBS
 CUc0HxuYqxfQIlfyDcMowcy7MBfjopE1r5XcnERybWZaGLF62wvfSf1xLU5K6UKNzm1s
 3Rwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743777146; x=1744381946;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5ItVLbwXh6klaFZ4DOTZKuJkyifurR/QGuqAr/eTlGU=;
 b=iQjXSZvKwS2Q5PKdcVeRxF5jHz/4mK+dNSgCS71xRnMCm5OmJK08qFpvb4YZKyfa7o
 TcI9pUS5vf/IPQm/93mCq+yQU293q3LV9CO4/E4RDGCuRUeKI/dJKXaG/sev91vJEmcK
 /Y24kE9C7fPZMpJtfvW/2GYbFrrMg60/tCFNDogyO5jTQuYld8WYXZHvLWLafCI++Wca
 R5SpeROy8DCj0TDG/DQx3nRZ2xfXNvrQuJYv5eMmHB0G9z8gUjzy5oPOqBllwybeoynf
 yDns62qshy/YTxkCPc/bWcy1b0qvNufIWKcJCtOqoityQxjsORNwh0OyC8YO5wvQnO3P
 pLeA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXFbZ5qW32L0JVPhHPyki8YSUwmeor4T7k30ziTGHE5CMHaS/syjqk38WO5NQ0aYSD7DVXgwVXAQ2k=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzuuZBJx0vM8zSV1HyeaOHBuV0jiebT91nTVoAPLT9AUQiod1ha
 LeZDEX7PfDE6zYK6tDZ//ZMS6QJLgLxwEefUKFmAGtiszNPw9WZyIdI3O66aK9A=
X-Gm-Gg: ASbGncuIM5aClGUAZNWo/qtxJul0D1ho3+YuCI5NUJBiRQe+DZJTcabdGk1q/LD56VY
 Q9SE3EgVItrSKb0s+XF0QwN64VuU8qFCNMy42YvLhtWpyR5DWCdIsA1uQkGZSOybS9sjlEXNJUx
 1KhXCxWDSlpttnsLsZkwpOqe9yhNNq0vdpxyWPSdUZ+Qnjp8ufxWTKx6piShaGgjAYpibhNfkyR
 Fi3z3CA0dZGUu4ya7JdYrwd1wENyhU0xpz43ec6Ur9pXFruXR3VLBCrMJvtvoJN6NMnpc2essSR
 QxYHL7HqZ/uoVJW8rRhbw0JumR46TfflJaX5el4DmRKwKoumZatr84BlIQzEyYsK3qE/i7ik7+5
 aumDmDHtDMJm+pm9CwWtqhg==
X-Google-Smtp-Source: AGHT+IHJ/1I/ptH3pCVDAQfcdNx5KHUGy5Tb2VN4inalxBPszr0OVkQ817HOYwXzW+KxBXdP3/CVtg==
X-Received: by 2002:a05:6402:234e:b0:5e7:b081:aa7c with SMTP id
 4fb4d7f45d1cf-5f0b5ebbc4emr2568089a12.12.1743777145883; 
 Fri, 04 Apr 2025 07:32:25 -0700 (PDT)
Received: from rayden.urgonet (h-98-128-140-123.A175.priv.bahnhof.se.
 [98.128.140.123]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5f087f0a0f3sm2567450a12.43.2025.04.04.07.32.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Apr 2025 07:32:25 -0700 (PDT)
From: Jens Wiklander <jens.wiklander@linaro.org>
To: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 op-tee@lists.trustedfirmware.org, linux-arm-kernel@lists.infradead.org
Cc: Olivier Masse <olivier.masse@nxp.com>,
 Thierry Reding <thierry.reding@gmail.com>, Yong Wu <yong.wu@mediatek.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>,
 "T . J . Mercier" <tjmercier@google.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Sumit Garg <sumit.garg@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 azarrabi@qti.qualcomm.com, Simona Vetter <simona.vetter@ffwll.ch>,
 Daniel Stone <daniel@fooishbar.org>,
 Jens Wiklander <jens.wiklander@linaro.org>
Subject: [PATCH v7 01/11] tee: tee_device_alloc(): copy dma_mask from parent
 device
Date: Fri,  4 Apr 2025 16:31:24 +0200
Message-ID: <20250404143215.2281034-2-jens.wiklander@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250404143215.2281034-1-jens.wiklander@linaro.org>
References: <20250404143215.2281034-1-jens.wiklander@linaro.org>
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

If a parent device is supplied to tee_device_alloc(), copy the dma_mask
field into the new device. This avoids future warnings when mapping a
DMA-buf for the device.

Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
Reviewed-by: Sumit Garg <sumit.garg@kernel.org>
---
 drivers/tee/tee_core.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/tee/tee_core.c b/drivers/tee/tee_core.c
index d113679b1e2d..685afcaa3ea1 100644
--- a/drivers/tee/tee_core.c
+++ b/drivers/tee/tee_core.c
@@ -922,6 +922,8 @@ struct tee_device *tee_device_alloc(const struct tee_desc *teedesc,
 	teedev->dev.class = &tee_class;
 	teedev->dev.release = tee_release_device;
 	teedev->dev.parent = dev;
+	if (dev)
+		teedev->dev.dma_mask = dev->dma_mask;
 
 	teedev->dev.devt = MKDEV(MAJOR(tee_devt), teedev->id);
 
-- 
2.43.0

