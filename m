Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AF2284979A4
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jan 2022 08:40:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6954710E178;
	Mon, 24 Jan 2022 07:40:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5CB410E178
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jan 2022 07:40:51 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id v13so11812882wrv.10
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Jan 2022 23:40:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=NMvNPKP34hAKYGcpxJqq3LnQ/oLcKhJxLzf1TGkhp7o=;
 b=bAyiVbeL0O/tXrVEJoufHk2hMCElT7PNsdTJZ4q1rRynh+wz81LxDxU2r01Iym6VVt
 sVaIcM92UfKeJDnXO1Rf5z9TcBW/Vk/SwAaEpaYkTSaEuuaHCorczWFU5dpVe3QpJvHm
 8zXVgegBY1i23LrTU+T4IeYqBE9fHWevOENAlblziqtjiZuR1bpy76Pc17hS0zZtwRLX
 AWzZKJgOMcDr5lf946FqoFkO8RrLddgwIys8pL6IrbBIZoxCcQ3fSJgYZZIONsCYPamM
 2H9wdS06v75M6zo3keQG/CY/o3fMpE9zYPSubQjmQ9a0Mft+ASlJAz5l0KsEYKE/D5pS
 G/bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NMvNPKP34hAKYGcpxJqq3LnQ/oLcKhJxLzf1TGkhp7o=;
 b=NZldZn+2UsBWvx1xJN/23sEDT+KDr3xmgBYNmaep/f2zpIYhsoMl5WjLRK9pPFUNHV
 JGFeEw2AQ54wfr4ApQ2pQXW0TShy6+f6gr+qrDaPR1xnXjNLw9B/SKMYERRYqoDgv49c
 uw5lgTiPikxZSOeDCwH4q5+HF6p+N8BhttdonRVO+NcO8+OB2QvtYDzkpBWM2JGFnNIC
 Z8D3sH9TCtNF6o7KqdZTfI21e6e4To8xFBqzWprrKgP4fHYDsp1PqEFWjObLmFrwAo2w
 DrjvpuP7XPtAcmmPagxQ0reX9gb31+jPpmtEZJ823wlsKj01qf8gdfj8jWTec9cqYzr9
 NldQ==
X-Gm-Message-State: AOAM533Og+UYe1EfXvcC3/7dxk1xCGmRwMV4KqvZnbnnN0FodujicpY4
 yY4YxY0S77NWHwx1PqvEgP8=
X-Google-Smtp-Source: ABdhPJy6f2RHhcqqgDM9WwFjE7EjUM8xU24oiTj68CEJVDxm+pU6cyKrOR36zVZu7Z9+3QZY9dF4Dg==
X-Received: by 2002:a05:6000:18a1:: with SMTP id
 b1mr5366493wri.608.1643010050406; 
 Sun, 23 Jan 2022 23:40:50 -0800 (PST)
Received: from abel.fritz.box (p57b0bff8.dip0.t-ipconnect.de. [87.176.191.248])
 by smtp.gmail.com with ESMTPSA id u15sm516370wrs.17.2022.01.23.23.40.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Jan 2022 23:40:50 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: thomas.hellstrom@linux.intel.com, sumit.semwal@linaro.org,
 gustavo@padovan.org, daniel.vetter@ffwll.ch, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
Subject: [PATCH 4/9] dma-buf: warn about containers in dma_resv object
Date: Mon, 24 Jan 2022 08:40:41 +0100
Message-Id: <20220124074046.4865-4-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220124074046.4865-1-christian.koenig@amd.com>
References: <20220124074046.4865-1-christian.koenig@amd.com>
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

