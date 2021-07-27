Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB6603D7FCD
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jul 2021 22:59:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 632B06E937;
	Tue, 27 Jul 2021 20:59:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com
 [IPv6:2607:f8b0:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3466A6E7D0
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jul 2021 20:59:10 +0000 (UTC)
Received: by mail-pl1-x635.google.com with SMTP id k1so17545959plt.12
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jul 2021 13:59:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RCqXotzAIvnXgOqstJDis4roVpoLDPnfq3WqfZlD8nw=;
 b=IsnPTTOIgdGKCXuW3XQ+MT6hIlhVYI7Io0wctUxwqvbJIIvtSltHPjtWeHzLWKF+kA
 CQvAxohJQYoF71joFX6v/3Z6eoC2GSqaTNcLccBsOh5LMFueIVes2gOSJpZyft2tneFd
 eIMQ6OLOd1lFb131IMCikGtxTAI11b8IFNErI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RCqXotzAIvnXgOqstJDis4roVpoLDPnfq3WqfZlD8nw=;
 b=Nlg0nsd+FmX7c1lEpna+AuE0WiYx9d36bjHvv1CRQg3i/uWmDZbzRU/EdOhuEk1RKx
 UMzble+HqIhEH5geAxncq8TeVyMUq7+DMV9OCy9dv/6FX5YZzxgNSkfx8tDzzKhfkoOQ
 tt2UTXB7UQVZMeFOl39hd1J1g2ifDg9BXEalrI5TBYPrXSRi5PKoGHcyYRl5AsXPZtHm
 oKEbaiF+wdw5qrXHdue10w1yhY45u39ZjkgC7faz/XPapCSE1/Bhi2DkGYqI6ILkqUPm
 SMgxT/P8hL5UPGaeRSyuJqoksaAj4y4ys0ow1AnCsH2jZbypPUmgsvZn8GbruikKfRGf
 LV+g==
X-Gm-Message-State: AOAM533rq5Nw7lcE0x6+TA2ZMrwaimwtUUawBBtj8Y9m19iHsGdhYOTk
 f9/PobSuuTquFLi4BkzocgOzNw==
X-Google-Smtp-Source: ABdhPJzspBBQMDyvDf6TBVh0kJFHAIruWS/HtAlIq0eRpPNOGgO/FodQZJlNxuLaUl6IYFezsXLBRA==
X-Received: by 2002:a05:6a00:1c6d:b029:338:322:137d with SMTP id
 s45-20020a056a001c6db02903380322137dmr25076229pfw.38.1627419549870; 
 Tue, 27 Jul 2021 13:59:09 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id h20sm4771196pfn.173.2021.07.27.13.59.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Jul 2021 13:59:08 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: linux-hardening@vger.kernel.org
Subject: [PATCH 11/64] net/mlx5e: Avoid field-overflowing memcpy()
Date: Tue, 27 Jul 2021 13:58:02 -0700
Message-Id: <20210727205855.411487-12-keescook@chromium.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210727205855.411487-1-keescook@chromium.org>
References: <20210727205855.411487-1-keescook@chromium.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2638; h=from:subject;
 bh=QKALqwrqhLc+7tVP8mb7u9vJwM2ktK3XL7hcr7RjisE=;
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBhAHOCimDJCcehKBIQzI/fV1vkomdBEz58Sp357Acw
 ashx10aJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCYQBzggAKCRCJcvTf3G3AJowOD/
 0cV2/gWpM3tzSGeDnd+48FkILInBduxYU7T8eAce0pFHdDWK3Xdzt0Rz/8KSK9g9qHiPAoTtE1ZDZs
 IdycA5PGwVU7OoMo9y8rxip+T0x8+0FTjiK0eEeADuraWJtuRkY7rqUv3anZB+7aFcy23HLSzsokDy
 v3K2NShHDdMr6+BTxCwT82oNKp7sflOMI9zqU65OfotImRrxPDAWNMY94XTaiIiAAWhAiHJTCCBy8a
 ww4ATYSVeRhj5CuJno8eppzIfgRbYoroFPSEqjpMIcR8XWfhMi3nGrZH+yIEDKzj93dnynMtjdt29m
 NwgegnkyruD3AJAJMQlWpROj7wM6tRwt/RQHzXD7ude5mYXinSx6o7qjeEh5KvtVaWGZNIyNH7QX03
 PtXqkYsIh8qzepHC9wr8mH6qkkUO1tkoy2yiGAA+MawqqegNs1HUQyC90hWs+rYewPsWZdHCusZQgh
 ZwPEDFuZ5NwYCIx582KcOGBtSe8ERTdcCF8QAsSe7eA8uVzZh7NgAKPp9Qv5ldepnhjwjiXDlXn1kl
 c6aG7NcBdLnGZLaWPMWbzyie+xLb3X42bGBryj5ZyD+7tJuSeBWhYRQ4Vf3KftFyOoXMrhYgc97usd
 VBN5UHc/ZqYheG58Rq9zQ6wjzNvKBzLmALvQsvOQLX+K6SPP+pWWlQKN4+LA==
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
field bounds checking for memcpy(), memmove(), and memset(), avoid
intentionally writing across neighboring fields.

Use flexible arrays instead of zero-element arrays (which look like they
are always overflowing) and split the cross-field memcpy() into two halves
that can be appropriately bounds-checked by the compiler.

"pahole" shows no size nor member offset changes to struct mlx5e_tx_wqe
nor struct mlx5e_umr_wqe. "objdump -d" shows no meaningful object
code changes (i.e. only source line number induced differences and
optimizations).

Signed-off-by: Kees Cook <keescook@chromium.org>
---
 drivers/net/ethernet/mellanox/mlx5/core/en.h     | 4 ++--
 drivers/net/ethernet/mellanox/mlx5/core/en/xdp.c | 4 +++-
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/mellanox/mlx5/core/en.h b/drivers/net/ethernet/mellanox/mlx5/core/en.h
index b1b51bbba054..54c014d97db7 100644
--- a/drivers/net/ethernet/mellanox/mlx5/core/en.h
+++ b/drivers/net/ethernet/mellanox/mlx5/core/en.h
@@ -204,7 +204,7 @@ static inline int mlx5e_get_max_num_channels(struct mlx5_core_dev *mdev)
 struct mlx5e_tx_wqe {
 	struct mlx5_wqe_ctrl_seg ctrl;
 	struct mlx5_wqe_eth_seg  eth;
-	struct mlx5_wqe_data_seg data[0];
+	struct mlx5_wqe_data_seg data[];
 };
 
 struct mlx5e_rx_wqe_ll {
@@ -220,7 +220,7 @@ struct mlx5e_umr_wqe {
 	struct mlx5_wqe_ctrl_seg       ctrl;
 	struct mlx5_wqe_umr_ctrl_seg   uctrl;
 	struct mlx5_mkey_seg           mkc;
-	struct mlx5_mtt                inline_mtts[0];
+	struct mlx5_mtt                inline_mtts[];
 };
 
 extern const char mlx5e_self_tests[][ETH_GSTRING_LEN];
diff --git a/drivers/net/ethernet/mellanox/mlx5/core/en/xdp.c b/drivers/net/ethernet/mellanox/mlx5/core/en/xdp.c
index 2f0df5cc1a2d..2d2364ea13cf 100644
--- a/drivers/net/ethernet/mellanox/mlx5/core/en/xdp.c
+++ b/drivers/net/ethernet/mellanox/mlx5/core/en/xdp.c
@@ -341,8 +341,10 @@ mlx5e_xmit_xdp_frame(struct mlx5e_xdpsq *sq, struct mlx5e_xmit_data *xdptxd,
 
 	/* copy the inline part if required */
 	if (sq->min_inline_mode != MLX5_INLINE_MODE_NONE) {
-		memcpy(eseg->inline_hdr.start, xdptxd->data, MLX5E_XDP_MIN_INLINE);
+		memcpy(eseg->inline_hdr.start, xdptxd->data, sizeof(eseg->inline_hdr.start));
 		eseg->inline_hdr.sz = cpu_to_be16(MLX5E_XDP_MIN_INLINE);
+		memcpy(dseg, xdptxd->data + sizeof(eseg->inline_hdr.start),
+				MLX5E_XDP_MIN_INLINE - sizeof(eseg->inline_hdr.start));
 		dma_len  -= MLX5E_XDP_MIN_INLINE;
 		dma_addr += MLX5E_XDP_MIN_INLINE;
 		dseg++;
-- 
2.30.2

