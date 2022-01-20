Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 94F46494EF8
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jan 2022 14:28:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 336AE10E807;
	Thu, 20 Jan 2022 13:28:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CBD510E7FC
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jan 2022 13:27:54 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 az27-20020a05600c601b00b0034d2956eb04so13672878wmb.5
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jan 2022 05:27:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=NMvNPKP34hAKYGcpxJqq3LnQ/oLcKhJxLzf1TGkhp7o=;
 b=LNchh6gl8Sin17f9Wh5+/HOL+rNQVvxSyd0bp6mFiYCrspxHZQU9U+hvKXcKIpg1U1
 UazaERxWOtIx6YUDh9JMiIzosFBPSpxII4osAS4ZUNCFXbDeO8QEu0i9X2CEj/YFdjI5
 bWwlNi/o+C2bmSXH49DQMovVVvKxYEGQYS9wwdrkesT33RNCvgjvPkDDfs3m68DjiiIb
 xVbzbCSzQC4DKcKcF+1eHAsLQa1/U82DW2+HY2CYHgguNQTHpS5bGW0N5QhulqLeyOnQ
 znAkuM03oahCp8aQq+CoPnR5LwzSSz82InPNk213n8MVV18WP/Wl6NtNA1tkEcOg92Mr
 NZZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NMvNPKP34hAKYGcpxJqq3LnQ/oLcKhJxLzf1TGkhp7o=;
 b=trQg8uLMII8WDPcMG8wYvqliIUgHpBfE2Z4mKd0759xJp2Lu6X2BF4qZZJDb+b5LXn
 5pM2xNwJzTLFmGqjG9pAAAhNCbpJ7wEUJN6R5fY9Kaem5HJys4eajA/pThadRUdl1yDs
 WGyoa4sXdl+sSkm7jNeKgQS5R2uVI0a6hHmBWMcW1f3a8ZjP9a8mx3y6xgbt5TeZd2ab
 vpmfggHqKjwwpRavXzgwxZ+2I8CpVrUqz5D4dRfb5vYMeK6CbZXInMvrROWAyT80eYrS
 iZ71haPNmBgIe24SlG+1aSASsHKx+dDf+0NlJzaI88pEAoAbqpvtmztzFyC4JQgCLOhF
 g+Gg==
X-Gm-Message-State: AOAM531M2YjqIb/SsiCdMBBWBE8Mce4RvzNJwUlE1q2antl5UfrppfS4
 HVAjsFiMN3Vwpj+BBGc8cAACjkrYBrM=
X-Google-Smtp-Source: ABdhPJwzwzhmn3CcMtiwnM1MVezq2gDxAcy2+ILKUo9enxe96/BtMCoq9XKzEf6HEkqNAqFTxFg6YQ==
X-Received: by 2002:a05:600c:5125:: with SMTP id
 o37mr9069286wms.161.1642685272749; 
 Thu, 20 Jan 2022 05:27:52 -0800 (PST)
Received: from abel.fritz.box (p57b0bff8.dip0.t-ipconnect.de. [87.176.191.248])
 by smtp.gmail.com with ESMTPSA id a9sm2658454wmm.32.2022.01.20.05.27.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Jan 2022 05:27:52 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: sumit.semwal@linaro.org, gustavo@padovan.org, daniel.vetter@ffwll.ch,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org
Subject: [PATCH 4/9] dma-buf: warn about containers in dma_resv object
Date: Thu, 20 Jan 2022 14:27:42 +0100
Message-Id: <20220120132747.2348-5-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220120132747.2348-1-christian.koenig@amd.com>
References: <20220120132747.2348-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Drivers should not add containers as shared fences to the dma_resv
object, instead each fence should be added individually.

Signed-off-by: Christian König <christian.koenig@amd.com>
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
---
 drivers/dma-buf/dma-resv.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
index 6dd9a40b55d4..e8a0c1d51da2 100644
--- a/drivers/dma-buf/dma-resv.c
+++ b/drivers/dma-buf/dma-resv.c
@@ -256,6 +256,11 @@ void dma_resv_add_shared_fence(struct dma_resv *obj, struct dma_fence *fence)
 
 	dma_resv_assert_held(obj);
 
+	/* Drivers should not add containers here, instead add each fence
+	 * individually.
+	 */
+	WARN_ON(dma_fence_is_container(fence));
+
 	fobj = dma_resv_shared_list(obj);
 	count = fobj->shared_count;
 
-- 
2.25.1

