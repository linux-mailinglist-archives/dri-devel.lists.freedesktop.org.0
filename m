Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 792E73AEBFF
	for <lists+dri-devel@lfdr.de>; Mon, 21 Jun 2021 17:07:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB3336E1B6;
	Mon, 21 Jun 2021 15:07:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D03816E1AA
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jun 2021 15:07:38 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id b3so9814182wrm.6
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jun 2021 08:07:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UcQFtYcmOh5H3xEqT6zXnbAzZFfEffv4q6FmmdZPRdE=;
 b=CNk0dpvXhffwyAyXQogndxfcA7lvypG+7Oem6LfQS3RB8s6ZDZLLM6m7TmBrjX1xAv
 6gVj4FXdVvhHPRbcDdnqQ5BQuC0LctJFu0SWXtF6a2ODQNVrFpMjg1VZbhkc6qvEOiD8
 vjIHvCRny/FscUj9KXBX2mZ7Xgi5p6dMZJpGw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UcQFtYcmOh5H3xEqT6zXnbAzZFfEffv4q6FmmdZPRdE=;
 b=Jx+XhnMF/Oq5VwlutDDouZTCDNVD+O3QSlAWUoP7f9J6IE6LX/3Z4dhrFgUQWdGtgM
 qwfC37B6xAebIJq31PMWiTJVoflrX4/8plKGsU6cAy7g6BVx7sH5kxerIf+3LYxRttEG
 Tf/2uq430yqZKw3LjC5K/Mg5SjCnNPkvzELwEf3LG6m76DkFWJIiz75tEujKfuKGUEBZ
 iialtpXEk7roswgrUVM77kdutP1RDkMF477EY70i+3DKR+Jkd6FVXvKeH1isiVrwybwv
 G2tnf2g9pXcTT1SSrcONq63NCkEm2xbPrLEfliRICX4cMuGVvbrgD3umj1c22JgEtEGN
 Xm1Q==
X-Gm-Message-State: AOAM5333nLt6VK4Wvhv46qAnkhEkfhsZENc0lCeX5f3JoSM8SfICwmYx
 djqWpVHwkT1V6mzlLafI1wSx9+7K+DtoLA==
X-Google-Smtp-Source: ABdhPJz6co5ldEFRHWqW+xIRNE59F/DgRcZ5Olh/VxxxZPuDQnf853jq5Egqc9TloIYzU4usBf4dXg==
X-Received: by 2002:a5d:5986:: with SMTP id n6mr28745662wri.60.1624288057613; 
 Mon, 21 Jun 2021 08:07:37 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id t64sm10002761wma.44.2021.06.21.08.07.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Jun 2021 08:07:37 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH] dma-buf: Document non-dynamic exporter expectations better
Date: Mon, 21 Jun 2021 17:07:32 +0200
Message-Id: <20210621150732.2345632-1-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.32.0.rc2
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
Cc: Daniel Vetter <daniel.vetter@intel.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Christian and me realized we have a pretty massive disconnect about
different interpretations of what dma_resv is used for by different
drivers. The discussion is much, much bigger than this change here,
but this is an important one:

Non-dynamic exporters must guarantee that the memory they return is
ready for use. They cannot expect importers to wait for the exclusive
fence. Only dynamic importers are required to obey the dma_resv fences
strictly (and more patches are needed to define exactly what this
means).

Christian has patches to update nouvea, radeon and amdgpu. The only
other driver using both ttm and supporting dma-buf export is qxl,
which only uses synchronous ttm_bo_move.

Cc: Christian König <ckoenig.leichtzumerken@gmail.com>
Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
---
 include/linux/dma-buf.h | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
index 342585bd6dff..92eec38a03aa 100644
--- a/include/linux/dma-buf.h
+++ b/include/linux/dma-buf.h
@@ -96,6 +96,12 @@ struct dma_buf_ops {
 	 * This is called automatically for non-dynamic importers from
 	 * dma_buf_attach().
 	 *
+	 * Note that similar to non-dynamic exporters in their @map_dma_buf
+	 * callback the driver must guarantee that the memory is available for
+	 * use and cleared of any old data by the time this function returns.
+	 * Drivers which pipeline their buffer moves internally must wait for
+	 * all moves and clears to complete.
+	 *
 	 * Returns:
 	 *
 	 * 0 on success, negative error code on failure.
@@ -144,6 +150,15 @@ struct dma_buf_ops {
 	 * This is always called with the dmabuf->resv object locked when
 	 * the dynamic_mapping flag is true.
 	 *
+	 * Note that for non-dynamic exporters the driver must guarantee that
+	 * that the memory is available for use and cleared of any old data by
+	 * the time this function returns.  Drivers which pipeline their buffer
+	 * moves internally must wait for all moves and clears to complete.
+	 * Dynamic exporters do not need to follow this rule: For non-dynamic
+	 * importers the buffer is already pinned through @pin, which has the
+	 * same requirements. Dynamic importers otoh are required to obey the
+	 * dma_resv fences.
+	 *
 	 * Returns:
 	 *
 	 * A &sg_table scatter list of or the backing storage of the DMA buffer,
-- 
2.32.0.rc2

