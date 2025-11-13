Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A82C0C5811D
	for <lists+dri-devel@lfdr.de>; Thu, 13 Nov 2025 15:54:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4976F10E854;
	Thu, 13 Nov 2025 14:54:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="GF0mqSEa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com
 [209.85.208.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6F0210E847
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Nov 2025 14:53:50 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id
 4fb4d7f45d1cf-641677916b5so1693283a12.0
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Nov 2025 06:53:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1763045629; x=1763650429; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=VvIMk872eUcGrvr4oYbCLqZzU34y/qoctkmyPmiR2qE=;
 b=GF0mqSEaZ6FeeT0MGjhC2/gxOBEIJriunGSex220Pll8bEHQs0Ir/3PY8cVbPaKBXt
 HuC6+IWfbFvo6WAyJNM1o90uO0muqHMU1pjLuDzfa8A4V/elRs2NpbsL8+nF6t+UC09t
 bgW8FK/nL37XJj5rC41srmyX6Hnt5VB9LWTE2geOTgv21zWLeC5GqEfzKiXdCAgX0gnS
 xOrTl7uGoM2FAuNU1i4qD0KUMMxI/K+YfX+pqP6bWPQUOK0OOJT7KXwv92t2auyz6zbO
 Eu/2x9+9BjjAxuFGVxKNAWWuJuxFdoSy90B9Mh1JZ3q1GrtoGwVhSDNpPXueut6jHvBi
 fpYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763045629; x=1763650429;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=VvIMk872eUcGrvr4oYbCLqZzU34y/qoctkmyPmiR2qE=;
 b=OAw6tfSdbS4Ft3xZbdTJKhthyxwqHlEBD2qDlPONr22bRsG+AsefTR695gPQeCwoXO
 GtDP21uBTlfu/mwnMaRryQWsKyjOdNBt8+O1/AoTDkY1Ue32ZpsIMXWonf0gTp/ppazr
 VDn7LGODQhyF0iaS3hPpc9Wr6BjGFNCu0wwE4fQ7r497udWLR2oAhgtOMevyv4AdRHiU
 Nt/K8SZqvYbm2NjdTXr/kSgAzHmN1/f5OM9Ht6EshhQRJmrQOS+y3k08S8q/LXVQpzk3
 33nAqrg2yDfji/VICzqcNmkhwnvea5rW4iRzszSH9sv14RaamhhRk8mjYPEtMJBt2W33
 hsdQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVN55rLN/2kshCO1xEl3KPRs7qoDnGKg9fGKXhx3QeT6KHM/SPFPBrpLX7Zdv/Rk60DCMEHUDI6aio=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyfEXGk2QxIuP8lZf8f8dpVQcN94iVzsboOzU2f/2fgzXusM12e
 /ah7Ugvc6RD0wDSbUVys9ThaJors2woItxbbjEJqVIxyiDVypOcaz5RftiAzujIN9UE=
X-Gm-Gg: ASbGncuVQOMKAVXnBjEYUPP7Mh+dmadQAJtnejlv91Kh6rZkk49+7iUNWoZU9Aq+kDS
 0XSwJ+p2ByctyHXhSG0acT24rJHpMmO9+la9Fu2CimPLNH20wdZUPsC5pieeg8MJ9EfqRnvFI1P
 lDsCmx9MpQh0YXEALbmNwsnj8tN0n9viSlc6Dcpc5OmVpEDWC4f7FT1KQdIlfdnzLPXvX0budyw
 0xMsjgOMDR/AGBLOIVY9ti2YhonZ8iNjBIKnDdIA4+LA8E7Y05cyoWzpAAfiONMbvPLVhNJVNAK
 j/RTB9f0+JnIcntU9NrHWR008aVVfF0vC+WZnvJhns2wxYSjkvEjpdLWUVcHPhVFpg/5CTGW1Di
 GTRkyuLgF2NpSsP7G0oSm9XSzXcag+fSUo6X2Sq/ZdRgRGwedhZQJrDAwTour6z2d+akTbJsj72
 4N7rFmkk1WZ48=
X-Google-Smtp-Source: AGHT+IE/99yJLzL1YvwaBMM+Q6kz/sb5G9lncACbhK/4baxWDS2QRo+Q6OgU+cRk722RQAFO4cEcfw==
X-Received: by 2002:a17:907:705:b0:b73:1634:6d71 with SMTP id
 a640c23a62f3a-b73319af12amr827751866b.26.1763045629179; 
 Thu, 13 Nov 2025 06:53:49 -0800 (PST)
Received: from able.fritz.box ([2a00:e180:15aa:c600:cef:d94:436c:abc5])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b73513b400fsm173747166b.1.2025.11.13.06.53.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Nov 2025 06:53:48 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: phasta@mailbox.org, alexdeucher@gmail.com, simona.vetter@ffwll.ch,
 tursulin@ursulin.net, matthew.brost@intel.com,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, sumit.semwal@linaro.org
Subject: [PATCH 18/18] drm/xe: Finish disconnect HW fences from module
Date: Thu, 13 Nov 2025 15:51:55 +0100
Message-ID: <20251113145332.16805-19-christian.koenig@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251113145332.16805-1-christian.koenig@amd.com>
References: <20251113145332.16805-1-christian.koenig@amd.com>
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

From: Matthew Brost <matthew.brost@intel.com>

Be safe when dereferencing fence->xe.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_hw_fence.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_hw_fence.c b/drivers/gpu/drm/xe/xe_hw_fence.c
index f5fad4426729..8181dfc628e4 100644
--- a/drivers/gpu/drm/xe/xe_hw_fence.c
+++ b/drivers/gpu/drm/xe/xe_hw_fence.c
@@ -159,9 +159,7 @@ static struct xe_hw_fence_irq *xe_hw_fence_irq(struct xe_hw_fence *fence)
 
 static const char *xe_hw_fence_get_driver_name(struct dma_fence *dma_fence)
 {
-	struct xe_hw_fence *fence = to_xe_hw_fence(dma_fence);
-
-	return dev_name(fence->xe->drm.dev);
+	return "xe";
 }
 
 static const char *xe_hw_fence_get_timeline_name(struct dma_fence *dma_fence)
@@ -175,10 +173,13 @@ static bool xe_hw_fence_signaled(struct dma_fence *dma_fence)
 {
 	struct xe_hw_fence *fence = to_xe_hw_fence(dma_fence);
 	struct xe_device *xe = fence->xe;
-	u32 seqno = xe_map_rd(xe, &fence->seqno_map, 0, u32);
+	u32 seqno;
+
+	if (dma_fence->error)
+		return true;
 
-	return dma_fence->error ||
-		!__dma_fence_is_later(dma_fence, dma_fence->seqno, seqno);
+	seqno = xe_map_rd(xe, &fence->seqno_map, 0, u32);
+	return !__dma_fence_is_later(dma_fence, dma_fence->seqno, seqno);
 }
 
 static bool xe_hw_fence_enable_signaling(struct dma_fence *dma_fence)
-- 
2.43.0

