Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5CB7812FD5
	for <lists+dri-devel@lfdr.de>; Thu, 14 Dec 2023 13:12:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9374E10E05D;
	Thu, 14 Dec 2023 12:12:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B713310E05D
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Dec 2023 12:12:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702555961; x=1734091961;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=iPofThhQ77PS9scqo1bQTdcaJp6OXp0SsAUuRAnSUmY=;
 b=MpYQ7IWhA8m9ZXJQujF0uHZDYtbgwCIIlcUEp2q+knIZY8pwQAq1E9/I
 ZQM+pf2IBYsLL9a08rx8eQf0tm9qS5uReHI9sMuaDI8+JzMPSkw6x+amk
 Rl5epMDLamAyR9HWwuJOq4BXl6QOZ/FL/S9x0hpDnszfEQJumMtURgAjw
 pT/jvruo/jUnpqkKsE34zJOXfSQ9IYyiaegTkEwGhdwiV7jjlJ4am0uEw
 xGAhMhzPM5ykVVyaVrjAIQkzTxeeY/GvIHgBTCHIVpkCz0+dhPYLaZ7HW
 CY5nfezKh0LJ4YZ18fPEYm5eZTHJc1NpeCRjCeXMvnuMG/JhPi5L+ozUu g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10923"; a="2195278"
X-IronPort-AV: E=Sophos;i="6.04,275,1695711600"; 
   d="scan'208";a="2195278"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Dec 2023 04:12:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10923"; a="892446662"
X-IronPort-AV: E=Sophos;i="6.04,275,1695711600"; d="scan'208";a="892446662"
Received: from mkuoppal-desk.fi.intel.com ([10.237.72.193])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Dec 2023 04:12:37 -0800
From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [RFC PATCH] dma-buf: Fix dma reservation with zero fences
Date: Thu, 14 Dec 2023 14:08:24 +0200
Message-Id: <20231214120824.655946-1-mika.kuoppala@linux.intel.com>
X-Mailer: git-send-email 2.34.1
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
Cc: Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Driver can initialize without any fences. If so
roundup_power_of_two will overflow as it will try to
subtract one from initial value before shift,
(1 << fls_long(-1)).

Fix this using default (4) if num_fences is zero.

Another more radical option would be to return error on
zero but that would need a callsite comb.

Caught-by: UBSAN
Cc: Christian König <christian.koenig@amd.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
---
 drivers/dma-buf/dma-resv.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
index 38b4110378de..f5ad3ecd0d4f 100644
--- a/drivers/dma-buf/dma-resv.c
+++ b/drivers/dma-buf/dma-resv.c
@@ -192,7 +192,10 @@ int dma_resv_reserve_fences(struct dma_resv *obj, unsigned int num_fences)
 			return 0;
 		max = max(old->num_fences + num_fences, old->max_fences * 2);
 	} else {
-		max = max(4ul, roundup_pow_of_two(num_fences));
+		if (num_fences)
+			max = max(4ul, roundup_pow_of_two(num_fences));
+		else
+			max = 4ul;
 	}
 
 	new = dma_resv_list_alloc(max);
-- 
2.34.1

