Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E9D8FC44802
	for <lists+dri-devel@lfdr.de>; Sun, 09 Nov 2025 22:39:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 454A910E27B;
	Sun,  9 Nov 2025 21:39:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="AE/QsBKe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8492B10E27B
 for <dri-devel@lists.freedesktop.org>; Sun,  9 Nov 2025 21:39:07 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 6C31E44230;
 Sun,  9 Nov 2025 21:39:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDBEBC4CEF7;
 Sun,  9 Nov 2025 21:39:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1762724347;
 bh=CN1oEXUSojkUBmaZlWlvuSVJlA/WWlAbJVlcXldCc2I=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=AE/QsBKeL4COZDbWNKyPSb/Yeb4U/0zyaGDjqv6fz7Yf7CZDZasUkJDL9fz2jvP1A
 guxGCe+ViOhnrhhSbMo4ARJjAB+LGMNHwSNoCASXHrfHftFfwDOYyMV2rffepGqX2J
 m7jLtHkNq9h6MYUTUl69gmK4j9+mGkgMkaCOoehqY30OB9SDoWRZxrgJQVw0+oB4dI
 RphQ7zt0ZYEtu9OfwHOQb7mg+M/1ZD57U2qYKkvWDkJHM4JUmU4GYhonLk3LF87t16
 4EjtEkee052stjebv+wipougewFrKDaIRwEKHF/Otk1APFTM/YBsZwyIEKYz+bgoS2
 KTVvo0R0iTAFQ==
From: Roger Quadros <rogerq@kernel.org>
Date: Sun, 09 Nov 2025 23:37:56 +0200
Subject: [PATCH net-next v2 6/7] net: ethernet: ti: am65-cpsw: enable zero
 copy in XDP features
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251109-am65-cpsw-xdp-zc-v2-6-858f60a09d12@kernel.org>
References: <20251109-am65-cpsw-xdp-zc-v2-0-858f60a09d12@kernel.org>
In-Reply-To: <20251109-am65-cpsw-xdp-zc-v2-0-858f60a09d12@kernel.org>
To: Siddharth Vadapalli <s-vadapalli@ti.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
 Jesper Dangaard Brouer <hawk@kernel.org>, 
 John Fastabend <john.fastabend@gmail.com>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Stanislav Fomichev <sdf@fomichev.me>, Simon Horman <horms@kernel.org>
Cc: srk@ti.com, Meghana Malladi <m-malladi@ti.com>, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, bpf@vger.kernel.org, 
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linaro-mm-sig@lists.linaro.org, Roger Quadros <rogerq@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1060; i=rogerq@kernel.org;
 h=from:subject:message-id; bh=CN1oEXUSojkUBmaZlWlvuSVJlA/WWlAbJVlcXldCc2I=;
 b=owEBbQKS/ZANAwAIAdJaa9O+djCTAcsmYgBpEQna96yZlfyKuLZK25llM6B9VnnOag/jnGh9D
 91Dvo+PqVeJAjMEAAEIAB0WIQRBIWXUTJ9SeA+rEFjSWmvTvnYwkwUCaREJ2gAKCRDSWmvTvnYw
 k+LtEADUgCFmF6aZIvEYu7sabE8u6Bp5lcZDbwYqnRBpvb8Vj4koNaounoTMuRmXWpOpUPIX/Xm
 TWvBAML53q3C79zHyatbDkcp0TymeiAQybxky5gS61YJLI3Ti947kKm/590u+tUsSFcKUeYe/Ny
 Fz3LFHW0Bm/YcGuR7xytB4DAvhra8VO5LhQXVwmIbewxf0OG8R1k8i8jzfY3CUQbRTVeuuUY+j2
 F+GcdAD3WqM9CIKrM1uhBJ9gAhstsl7XB4pVKUMosjJ5NnSwyTrUiDEkrUmx0hgQWtryXu6Yhjd
 bWW2+mYQmPPPssI6C3UROAD9j9sLnufwsY9mDzgQy/ko0jx2kH9KlQ2cp7p7dkIrukRVTXMTGiy
 lp1EgHGhUdjJszxldCwV08sx5O+IecOKlahvuU5GfGDrex0vRiTWe5AP7djJBCqAEySr0hHaG6F
 MtdyUDcfH8vbZau0Jgvaez5btY1MziZwQ0WTxZd2VROvdthaDeFR4pJGI9+ZnfmpJ8yjUCFyp7O
 mgFnof9Vp9f9TJSQhnFYPTQWOqUFsquvYoKvU1pszELddV2Uh9ncX3g9g1xZIECcJOH8suiIUVs
 nJ2cnfLqBvJkF+M4sGBcXkPT1DJ8yZcI2ODkZs5Pmb6RWfxOWysx3rveW7VM7+V77rq8TskBHQq
 ms57HQrnSzz98xQ==
X-Developer-Key: i=rogerq@kernel.org; a=openpgp;
 fpr=412165D44C9F52780FAB1058D25A6BD3BE763093
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

Now that we have the plumbing in for XDP zero copy RX and TX, enable
the zero copy feature flag.

Signed-off-by: Roger Quadros <rogerq@kernel.org>
---
 drivers/net/ethernet/ti/am65-cpsw-nuss.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/ti/am65-cpsw-nuss.c b/drivers/net/ethernet/ti/am65-cpsw-nuss.c
index 2e06e7df23ad5249786d081e51434f87dd2a76b5..9d1048eea7e4734873676026906e07babf0345f5 100644
--- a/drivers/net/ethernet/ti/am65-cpsw-nuss.c
+++ b/drivers/net/ethernet/ti/am65-cpsw-nuss.c
@@ -3210,7 +3210,8 @@ am65_cpsw_nuss_init_port_ndev(struct am65_cpsw_common *common, u32 port_idx)
 			       NETIF_F_HW_VLAN_CTAG_FILTER;
 	port->ndev->xdp_features = NETDEV_XDP_ACT_BASIC |
 				   NETDEV_XDP_ACT_REDIRECT |
-				   NETDEV_XDP_ACT_NDO_XMIT;
+				   NETDEV_XDP_ACT_NDO_XMIT |
+				   NETDEV_XDP_ACT_XSK_ZEROCOPY;
 	port->ndev->vlan_features |=  NETIF_F_SG;
 	port->ndev->netdev_ops = &am65_cpsw_nuss_netdev_ops;
 	port->ndev->ethtool_ops = &am65_cpsw_ethtool_ops_slave;

-- 
2.34.1

