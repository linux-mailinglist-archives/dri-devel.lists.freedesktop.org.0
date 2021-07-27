Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B67C93D809F
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jul 2021 23:07:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1BBF6EA57;
	Tue, 27 Jul 2021 21:06:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [IPv6:2607:f8b0:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59EFF6EA09
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jul 2021 21:06:54 +0000 (UTC)
Received: by mail-pl1-x636.google.com with SMTP id k1so17570219plt.12
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jul 2021 14:06:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=O5PVCm4vbOkHTdhySLNgX8cYsmk07det2tWYYr+tRf4=;
 b=gxKAidxHtXkH57cdgTrBRW+Iu6kBJm2gLTc/ZhTreM4nUhVINAm9hnCEsll5JLIeuv
 GXDrZXo19JKoLdUCWqYws3d6+nRR58XFL0Nk9+2Zzh54A6uGcEngTnaAEe4kkqqnI2fB
 ruSx/lD+GWJQolLfAMVF9OQXx6F28ZgkVPYx0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=O5PVCm4vbOkHTdhySLNgX8cYsmk07det2tWYYr+tRf4=;
 b=qboZdGjUYyAMdoCherFdaDAPvQgq/CJDuR/F6N8uMmEQ0y+wpPdN7war1FZaR/gGAg
 2aqNBR0CqM4BZHjpfTfvQvfFq5ETB6kusy/YFErsaFk52NhO9zp05ATm3W9cWcIL2+0r
 5U3AN+nKsmaJxorWFfIRtCHNp8CMOq/780S0/i59SOL2EqMhL0PCWwgNED0eKxTPPiO1
 UyM2QN76RqEFTqoXk8Zr9c//atEZLNJVPgrUFCRIJP7Pd5Zeri0/gqnA2KTTseY1eXXm
 jHlyC1BvzOv6tCk2oRLEmfkhbJuW2w43fyYSDAKndKPVgaNnaAeUYJSO2OCpGYScFKWv
 iqfQ==
X-Gm-Message-State: AOAM533HpqxGXAFsUdvHrpkXmqlKsESgKYqvhak1OGeP9oSYzbn/nxWg
 nggj3oYM0I5Y6MGb5FaEetc9wQ==
X-Google-Smtp-Source: ABdhPJzlXy/VcX23c9PQ65+XqlmSvwlYyjvPZKBc9QGkV1GFAs820b6KtM3ET4HtRC/ZSXPL17y+Jg==
X-Received: by 2002:a17:90a:c003:: with SMTP id
 p3mr23960881pjt.14.1627420014073; 
 Tue, 27 Jul 2021 14:06:54 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id q14sm4721670pfn.73.2021.07.27.14.06.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Jul 2021 14:06:50 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: linux-hardening@vger.kernel.org
Subject: [PATCH 55/64] RDMA/mlx5: Use struct_group() to zero struct mlx5_ib_mr
Date: Tue, 27 Jul 2021 13:58:46 -0700
Message-Id: <20210727205855.411487-56-keescook@chromium.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210727205855.411487-1-keescook@chromium.org>
References: <20210727205855.411487-1-keescook@chromium.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1274; h=from:subject;
 bh=oY909dEANo6V3IFn0noc67FV5hBK8uceU7oGCjc7zOw=;
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBhAHOMh317iG5OLcRV6f6KOkZ9q+C2N36hwkRl8LQQ
 C7eGawSJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCYQBzjAAKCRCJcvTf3G3AJg4UD/
 9BnzAT1Z7CsW+TRX8tpO/bHWsp1ALKoQrreRJNLcuwaofCAjFi8BnU29qFDffCG8DWqAC3Pmtj4p39
 RskVkYUAy5axxifQzhefjhk7tLjvkw2mmeV+0QGdeg2rbLL5Dpmmav2A7WaFsWyg7W74/0ud+a6Hbc
 M4RLDpYX0mM68jox12+Syr653lTWFNFS86gcN1Q975/PUD2xYk3dY3H3s2zF7i9XFyEP2N2G5zErPl
 ED8ZrAbuSSNxMO5rke2YVbiw/FbKveB5UCkCgtjoT7lSW9mZYdr144xmSl8iaDmr3LYdfAxQG6WpF1
 N2W+2K9FRkZT0VZd9PdKAMbV3Ofm9qyfYEnpmGGs0y4uhKJtYKpv60s7YXeG+eQtwR/bCFvecfShz5
 rvqvYF46IrMS8jbLeJHjqvjyd1hw+zCAJKd2c4R2LPUZ7WDVjRNGtq82PEZ2Tr725JvJTSLKrGx8YA
 tWmn4rCBBSu/PqTl3206VAZLiP+HeqZxC26TE27C7IcR67ONOX3U06CdJRm2X3VkQMJVPvT0OYPmRr
 DH5V/sNlfiZe0r9fNcKAYsCQaHKXs6D2jYAWqxqm2msNETdd60wrVAfUL77zKIV9hqqj6sRIXPhZ8R
 +len0ulP7Zp0NQRxZYGLikaPmhWeDXiQR88kCVUq6p0rdBPBuFSFYAGLjJSQ==
X-Developer-Key: i=keescook@chromium.org; a=openpgp;
 fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
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
Cc: Kees Cook <keescook@chromium.org>, linux-kbuild@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-staging@lists.linux.dev,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 linux-block@vger.kernel.org, clang-built-linux@googlegroups.com,
 Keith Packard <keithpac@amazon.com>, netdev@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In preparation for FORTIFY_SOURCE performing compile-time and run-time
field bounds checking for memset(), avoid intentionally writing across
neighboring fields.

Add struct_group() to mark region of struct mlx5_ib_mr that should be
initialized to zero.

Signed-off-by: Kees Cook <keescook@chromium.org>
---
 drivers/infiniband/hw/mlx5/mlx5_ib.h | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/infiniband/hw/mlx5/mlx5_ib.h b/drivers/infiniband/hw/mlx5/mlx5_ib.h
index 585fb00bdce8..830066e95260 100644
--- a/drivers/infiniband/hw/mlx5/mlx5_ib.h
+++ b/drivers/infiniband/hw/mlx5/mlx5_ib.h
@@ -644,6 +644,7 @@ struct mlx5_ib_mr {
 	struct ib_umem *umem;
 
 	/* This is zero'd when the MR is allocated */
+	struct_group(cleared,
 	union {
 		/* Used only while the MR is in the cache */
 		struct {
@@ -691,12 +692,13 @@ struct mlx5_ib_mr {
 			bool is_odp_implicit;
 		};
 	};
+	);
 };
 
 /* Zero the fields in the mr that are variant depending on usage */
 static inline void mlx5_clear_mr(struct mlx5_ib_mr *mr)
 {
-	memset(mr->out, 0, sizeof(*mr) - offsetof(struct mlx5_ib_mr, out));
+	memset(&mr->cleared, 0, sizeof(mr->cleared));
 }
 
 static inline bool is_odp_mr(struct mlx5_ib_mr *mr)
-- 
2.30.2

