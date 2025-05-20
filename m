Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A28EABD47A
	for <lists+dri-devel@lfdr.de>; Tue, 20 May 2025 12:24:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15D4310E1BF;
	Tue, 20 May 2025 10:24:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="iEgzGjSC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05C4410E1BF
 for <dri-devel@lists.freedesktop.org>; Tue, 20 May 2025 10:24:07 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id B65F54AB08;
 Tue, 20 May 2025 10:24:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67282C4CEEB;
 Tue, 20 May 2025 10:24:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1747736646;
 bh=nIrx+rQmiCnbtUaUn/P6Ik6giA5OLb1b5pJBQ3z/y3I=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=iEgzGjSCDNAreycfZfel/PDOPVl55vnX6//v3eJsVsLBymctEvM8+599Av2rZecEY
 mU1ndS+eeGnYbfFkYCo9yXW8Q7ASX5YYMYB8SyWfRf/Sfp+MkWcPq2eg/ZjQ2O7Ykk
 ZFgQ4rqcfVO1LfStwsqp43V03fEZTt3bGzFnWvaReDDq/uVq16TwdEuqBiQGnFcpSN
 o6g7yrhRkgJRRs4GxYHjxMfJkde2ERegaP4IaUblnmBrGtgD/YfSQ3ITjT8PRywm4A
 q78zKdZG1Q6tI7nQLFKJWw1gozq7rNAoWMdBub6E2Fm5W/zeircPNovOoMUYgVoqEk
 jbF1rQDqEL7VQ==
From: Roger Quadros <rogerq@kernel.org>
Date: Tue, 20 May 2025 13:23:50 +0300
Subject: [PATCH RFC net-next 1/5] net: ethernet: ti: am65-cpsw: fix BPF
 Program change on multi-port CPSW
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250520-am65-cpsw-xdp-zc-v1-1-45558024f566@kernel.org>
References: <20250520-am65-cpsw-xdp-zc-v1-0-45558024f566@kernel.org>
In-Reply-To: <20250520-am65-cpsw-xdp-zc-v1-0-45558024f566@kernel.org>
To: Siddharth Vadapalli <s-vadapalli@ti.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
 Jesper Dangaard Brouer <hawk@kernel.org>, 
 John Fastabend <john.fastabend@gmail.com>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: srk@ti.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 bpf@vger.kernel.org, linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
 Roger Quadros <rogerq@kernel.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1633; i=rogerq@kernel.org;
 h=from:subject:message-id; bh=nIrx+rQmiCnbtUaUn/P6Ik6giA5OLb1b5pJBQ3z/y3I=;
 b=owEBbQKS/ZANAwAIAdJaa9O+djCTAcsmYgBoLFg8vD0nQfmi6PcyMBmwmgeg6lxVKRdAM6c8O
 6WY76gS5dqJAjMEAAEIAB0WIQRBIWXUTJ9SeA+rEFjSWmvTvnYwkwUCaCxYPAAKCRDSWmvTvnYw
 k2L6D/4/z+FNWgxJwjERqYfSg+GnzlJJh4byuBEYjsYtx4BDFFicW8b7f6QIgKUkuOPA6c76eL7
 WO8HaxevvwV3oshGZYMJxoDFbsWYD69235tfLfa+j41GCM8i12M0P4iTWS5FDxSwm3Hoa+teUfW
 sR+5Fs72wLimc9XtV8U9Et9j6tOa+hHibTIvCn30XFf5EINzWtJ5mtf7iW2RjZ3Zj2XzBjowBWQ
 HYHceGJA0pn7tj/lRa/QCQFef4frkfSrDYd9VQoU52fMagHyR5NhTXOMPEVcsPcyYkvjA8d5D2F
 j/J3K6e49UrAnL6PxBdJgWmsf0JXEIU3yCkQogpy1nMbeEs+grSewLC660Czx5NeupmhT71CiLl
 wZqp0dr5X4hhkcuXrE8UuxaGS4UnudFn7EBu2i/mI3iVx0Fl6ei4CGKc2viBHftSOKbiVwQIflx
 hQ78Pk+JM7U/L+lJcknOQA8WH8QSD591uVTJesgLCEOVdCq8RtQ4jZVncxD58jAVXlDOvOegThx
 79p7dGeqwAAQbpttV0rZOxHX3UMPistIXcuZ9IFpk62hkI8dOwWXN6isF+t25dLxa0+uBSivv0W
 l1gUI7VFbe9Kx2+nUhYNTVcAKmoLAp6nB3A8Ge3Ubnz+VNL2ZxAz5isQ3dKO7zpfQW4rJlkBw32
 GyireYbsB+UxwjA==
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

On a multi-port CPSW system, stopping and starting just one port (ndev)
will not restart the queues if other ports (ndevs) are open.

Instead, check the usage_count variable to know if CPSW is running
and if so restart all the queues.

Signed-off-by: Roger Quadros <rogerq@kernel.org>
---
 drivers/net/ethernet/ti/am65-cpsw-nuss.c | 25 ++++++++++++++++++++-----
 1 file changed, 20 insertions(+), 5 deletions(-)

diff --git a/drivers/net/ethernet/ti/am65-cpsw-nuss.c b/drivers/net/ethernet/ti/am65-cpsw-nuss.c
index 988ce9119306..cd713bb57b91 100644
--- a/drivers/net/ethernet/ti/am65-cpsw-nuss.c
+++ b/drivers/net/ethernet/ti/am65-cpsw-nuss.c
@@ -1924,18 +1924,33 @@ static int am65_cpsw_xdp_prog_setup(struct net_device *ndev,
 				    struct bpf_prog *prog)
 {
 	struct am65_cpsw_port *port = am65_ndev_to_port(ndev);
-	bool running = netif_running(ndev);
+	struct am65_cpsw_common *common = port->common;
+	bool running = !!port->common->usage_count;
 	struct bpf_prog *old_prog;
+	int ret;
 
-	if (running)
-		am65_cpsw_nuss_ndo_slave_stop(ndev);
+	if (running) {
+		/* stop all queues */
+		am65_cpsw_destroy_txqs(common);
+		am65_cpsw_destroy_rxqs(common);
+	}
 
 	old_prog = xchg(&port->xdp_prog, prog);
 	if (old_prog)
 		bpf_prog_put(old_prog);
 
-	if (running)
-		return am65_cpsw_nuss_ndo_slave_open(ndev);
+	if (running) {
+		/* start all queues */
+		ret = am65_cpsw_create_rxqs(common);
+		if (ret)
+			return ret;
+
+		ret = am65_cpsw_create_txqs(common);
+		if (ret) {
+			am65_cpsw_destroy_rxqs(common);
+			return ret;
+		}
+	}
 
 	return 0;
 }

-- 
2.34.1

