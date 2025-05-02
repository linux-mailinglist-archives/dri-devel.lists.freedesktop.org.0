Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C549AA6EA1
	for <lists+dri-devel@lfdr.de>; Fri,  2 May 2025 12:01:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C0C610E8E9;
	Fri,  2 May 2025 10:01:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="nDiucicb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com
 [209.85.218.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81A1710E17B
 for <dri-devel@lists.freedesktop.org>; Fri,  2 May 2025 10:01:11 +0000 (UTC)
Received: by mail-ej1-f45.google.com with SMTP id
 a640c23a62f3a-acbb85ce788so422099266b.3
 for <dri-devel@lists.freedesktop.org>; Fri, 02 May 2025 03:01:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1746180070; x=1746784870; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1anNv4Z25lfJ6IEDtR0M/iXAZvESKw8M2gLCl/3GqgY=;
 b=nDiucicbdSCTyOD8JiBc19o7CPJL3E3Qv1Yjsbh8HLQ1+p/xSgH8XzJUsLphEdwiX5
 aeVbKw1zsQFHKqXWUxMAxE/14zUruzlLfkt3H41ZiNL1sM6GCM9eOoPxxsmPnr9t+GfK
 abH3vKeWFgWhmTMCMklNp2EjgsE+Pn+XY79QVmqfO953MwDknsrxX3qSO0KE05jLvgNw
 6a2+Vw/pAoc2GIi+kWZBZ5qxWyx0qlSds68JQgrCOEzc0Z2S2PGgS2ki8V7y5FhehGn0
 cOJku12+p0/i2QmJHr/8p9neOC//foxJGng7S+1+VabOpANndBLlj5/FbWxrjEnE+6FJ
 ZD1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746180070; x=1746784870;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1anNv4Z25lfJ6IEDtR0M/iXAZvESKw8M2gLCl/3GqgY=;
 b=jbZEa7ZPXdI5g96G1MUYCSexkLgdg/XikNy4JL4E6sAh3VDIVAEyD7nsowSnfE/MBW
 S5kZWHewdz52kdPNv1tDixW+NDxxqS7zQ8IqnjFUryFYZLvStduP3TmY+/jQ3+wT4z1b
 Dkgp2r4roTHi5VfD4Wjd4NGlwEZrg6WhjSl+etqoFo0UYf2fUgTYh6wptLuwNPOAraoK
 k01TF3eIvm2oDOPTP0ZRjDt1CEfZaaOWaCkx0+xpWn6x3mglKnClUXUpkJMQ2xvtgKPO
 So5sCFQNf8NKytFsphUMqgBP7L3UQIOAK7Cj3nVu0WOCbVou1QPkgTANxbZTmNrbMJEm
 hOHA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWiOKqW9QvfBEBauRynTTzhayj62eaK66gUyge++rUw9cj1wya3HqB/2XPXEvn1BkEOvPr/9QmHKKQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxqXG77TYytcA6BCeBWa5+BIjFdqpUmu5IxecFE4KYZDBF151nB
 4qPCJpWJ3l7wWY3rjdLzyy0FYtUVYmLtipYxTucjdl558encvcwbMXtI3WfNrzg=
X-Gm-Gg: ASbGnctDdtoBfjc33I2qmYn3yaAiTM8gpr1uChUOB9OuDUzfto216MUudkiOWAeAWYH
 XnAv69S6ZxQCSiMHBErnVEWzTDAlywwv5CcxvhNp8GHwrxY/xzRJrtAL8mwcLtQffKv1tO7B02v
 lUGK5tl9I/wu4zJN1jvGC5Zl2+wPNk17UR8VXpGG1u9DJV41iPQsn/VcwwgB4tdpXpFC9dQVJxL
 S0Ln1S3QhtLf794imz289VD4n4nul2i8RtOmVcrJZ1cQIQiGJGmd62f3qUS9iFkvSogJg1oWPHB
 BBuucgEo5Hd+Oz7iw9KzA70N1zI0RRYLjDa80R6GyT4OiOBeAvoxmrDSbu+msy2OR4xCNOYOa15
 2fPXS7wGfkBGIW0fwMg==
X-Google-Smtp-Source: AGHT+IGbNYwwYka0rS/o95u834QMshNlm6ZE08gyDe8QEBQfbOvJaJeikFzKXGrLN54PFU3NRdyFmg==
X-Received: by 2002:a17:907:7255:b0:ace:f2c2:5a4 with SMTP id
 a640c23a62f3a-ad17ad5d279mr201865366b.13.1746180070053; 
 Fri, 02 May 2025 03:01:10 -0700 (PDT)
Received: from rayden.urgonet (h-98-128-140-123.A175.priv.bahnhof.se.
 [98.128.140.123]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad1891473a1sm26030566b.4.2025.05.02.03.01.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 May 2025 03:01:09 -0700 (PDT)
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
 Rouven Czerwinski <rouven.czerwinski@linaro.org>,
 Jens Wiklander <jens.wiklander@linaro.org>,
 Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org
Subject: [PATCH v8 09/14] cma: export cma_alloc() and cma_release()
Date: Fri,  2 May 2025 11:59:23 +0200
Message-ID: <20250502100049.1746335-10-jens.wiklander@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250502100049.1746335-1-jens.wiklander@linaro.org>
References: <20250502100049.1746335-1-jens.wiklander@linaro.org>
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

Export the two functions cma_alloc() and cma_release().

Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
---
 mm/cma.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/mm/cma.c b/mm/cma.c
index 15632939f20a..c60901e73a26 100644
--- a/mm/cma.c
+++ b/mm/cma.c
@@ -915,6 +915,7 @@ struct page *cma_alloc(struct cma *cma, unsigned long count,
 {
 	return __cma_alloc(cma, count, align, GFP_KERNEL | (no_warn ? __GFP_NOWARN : 0));
 }
+EXPORT_SYMBOL(cma_alloc);
 
 struct folio *cma_alloc_folio(struct cma *cma, int order, gfp_t gfp)
 {
@@ -1002,6 +1003,7 @@ bool cma_release(struct cma *cma, const struct page *pages,
 
 	return true;
 }
+EXPORT_SYMBOL(cma_release);
 
 bool cma_free_folio(struct cma *cma, const struct folio *folio)
 {
-- 
2.43.0

