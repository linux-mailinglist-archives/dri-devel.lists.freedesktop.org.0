Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 224BC7E6499
	for <lists+dri-devel@lfdr.de>; Thu,  9 Nov 2023 08:46:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 489FC10E1C9;
	Thu,  9 Nov 2023 07:46:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4323.proton.ch (mail-4323.proton.ch [185.70.43.23])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86EA710E1C9
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Nov 2023 07:45:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1699515957; x=1699775157;
 bh=DdVm0IYAnpXIL8InOfPloMQ7jl511aw+QxHWadkrvrE=;
 h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
 b=lrFTuGTZ5pqI24/zzYbOBUTPfOrgtvzTsTFbaoESLvU6R0q4mBdvjputmHQ1W6WIW
 HIUm1LIbsVnh1UpFnHrIUvo/avAfcKan+MOzljA2j03Tc1zTLvbNIxe2Zn2QPEUCFq
 PAa0Ml4CP/EDANBXwGlpptdSfPhjaD7x/iyL1Mo559tGfepjewaTHaeeHsbNXDdNm6
 1CUuEowCEGW5O2Q+0BYytqQCRo88UqGAnbulM7xpU9ZI27hnN0h4efuSSkIJXxdIc3
 PnmjR5U/IcgcnPiWbGfV27LNjAuOIxzG5vHDG6cO6uEHJWwgdmb1W2O0bDzFT38JMP
 /q2QPEQzNHkOw==
Date: Thu, 09 Nov 2023 07:45:52 +0000
To: dri-devel@lists.freedesktop.org
From: Simon Ser <contact@emersion.fr>
Subject: [RFC PATCH 1/2] dma-buf/dma-heap: export dma_heap_add and
 dma_heap_get_drvdata
Message-ID: <20231109074545.148149-1-contact@emersion.fr>
Feedback-ID: 1358184:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Cc: John Stultz <jstultz@google.com>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, "T.J. Mercier" <tjmercier@google.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is necessary to create DMA heaps in other modules
(e.g. graphics drivers).

Signed-off-by: Simon Ser <contact@emersion.fr>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: Benjamin Gaignard <benjamin.gaignard@collabora.com>
Cc: Brian Starkey <Brian.Starkey@arm.com>
Cc: John Stultz <jstultz@google.com>
Cc: "T.J. Mercier" <tjmercier@google.com>
---
 drivers/dma-buf/dma-heap.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/dma-buf/dma-heap.c b/drivers/dma-buf/dma-heap.c
index 84ae708fafe7..51cd58b775d8 100644
--- a/drivers/dma-buf/dma-heap.c
+++ b/drivers/dma-buf/dma-heap.c
@@ -203,6 +203,7 @@ void *dma_heap_get_drvdata(struct dma_heap *heap)
 {
 =09return heap->priv;
 }
+EXPORT_SYMBOL_GPL(dma_heap_get_drvdata);
=20
 /**
  * dma_heap_get_name() - get heap name
@@ -300,6 +301,7 @@ struct dma_heap *dma_heap_add(const struct dma_heap_exp=
ort_info *exp_info)
 =09kfree(heap);
 =09return err_ret;
 }
+EXPORT_SYMBOL_GPL(dma_heap_add);
=20
 static char *dma_heap_devnode(const struct device *dev, umode_t *mode)
 {
--=20
2.42.0


