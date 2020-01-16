Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BF67F13E116
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jan 2020 17:47:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC06E6EDE4;
	Thu, 16 Jan 2020 16:47:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EB166EDE4
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jan 2020 16:47:41 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id DC83821582;
 Thu, 16 Jan 2020 16:47:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1579193261;
 bh=UvBSdpWu94Cr/vu/swFwEY05gb5S7dZpvtQ4ZH8wg9Q=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=gp3hh562FFufViCb7wQkEBNZAnn6v/3KTBRiBUX95XSgFlpQVNY+5hsDUc18mUdIH
 gHtvhmjw43U4v6uKRieq0RqujkcW2LzYvkGqZQvjaNwda0z+W8HHmfe2DPdsNAefSK
 MCi2ZtsF42iV/AoD6dyqzKNIbujVw4V8neZ1HbFs=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 058/205] xprtrdma: Connection becomes unstable
 after a reconnect
Date: Thu, 16 Jan 2020 11:40:33 -0500
Message-Id: <20200116164300.6705-58-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200116164300.6705-1-sashal@kernel.org>
References: <20200116164300.6705-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Sasha Levin <sashal@kernel.org>, linux-nfs@vger.kernel.org,
 netdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, Chuck Lever <chuck.lever@oracle.com>,
 Anna Schumaker <Anna.Schumaker@Netapp.com>, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Chuck Lever <chuck.lever@oracle.com>

[ Upstream commit a31b2f939219dd9bffdf01a45bd91f209f8cc369 ]

This is because xprt_request_get_cong() is allowing more than one
RPC Call to be transmitted before the first Receive on the new
connection. The first Receive fills the Receive Queue based on the
server's credit grant. Before that Receive, there is only a single
Receive WR posted because the client doesn't know the server's
credit grant.

Solution is to clear rq_cong on all outstanding rpc_rqsts when the
the cwnd is reset. This is because an RPC/RDMA credit is good for
one connection instance only.

Fixes: 75891f502f5f ("SUNRPC: Support for congestion control ... ")
Signed-off-by: Chuck Lever <chuck.lever@oracle.com>
Signed-off-by: Anna Schumaker <Anna.Schumaker@Netapp.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 net/sunrpc/xprtrdma/transport.c |  3 +++
 net/sunrpc/xprtrdma/verbs.c     | 22 ++++++++++++++++++++++
 2 files changed, 25 insertions(+)

diff --git a/net/sunrpc/xprtrdma/transport.c b/net/sunrpc/xprtrdma/transport.c
index 160558b4135e..c67d465dc062 100644
--- a/net/sunrpc/xprtrdma/transport.c
+++ b/net/sunrpc/xprtrdma/transport.c
@@ -428,8 +428,11 @@ void xprt_rdma_close(struct rpc_xprt *xprt)
 	/* Prepare @xprt for the next connection by reinitializing
 	 * its credit grant to one (see RFC 8166, Section 3.3.3).
 	 */
+	spin_lock(&xprt->transport_lock);
 	r_xprt->rx_buf.rb_credits = 1;
+	xprt->cong = 0;
 	xprt->cwnd = RPC_CWNDSHIFT;
+	spin_unlock(&xprt->transport_lock);
 
 out:
 	xprt->reestablish_timeout = 0;
diff --git a/net/sunrpc/xprtrdma/verbs.c b/net/sunrpc/xprtrdma/verbs.c
index 3a907537e2cf..f4b136504e96 100644
--- a/net/sunrpc/xprtrdma/verbs.c
+++ b/net/sunrpc/xprtrdma/verbs.c
@@ -75,6 +75,7 @@
  * internal functions
  */
 static void rpcrdma_sendctx_put_locked(struct rpcrdma_sendctx *sc);
+static void rpcrdma_reqs_reset(struct rpcrdma_xprt *r_xprt);
 static void rpcrdma_reps_destroy(struct rpcrdma_buffer *buf);
 static void rpcrdma_mrs_create(struct rpcrdma_xprt *r_xprt);
 static void rpcrdma_mrs_destroy(struct rpcrdma_buffer *buf);
@@ -780,6 +781,7 @@ rpcrdma_ep_disconnect(struct rpcrdma_ep *ep, struct rpcrdma_ia *ia)
 	trace_xprtrdma_disconnect(r_xprt, rc);
 
 	rpcrdma_xprt_drain(r_xprt);
+	rpcrdma_reqs_reset(r_xprt);
 }
 
 /* Fixed-size circular FIFO queue. This implementation is wait-free and
@@ -1042,6 +1044,26 @@ struct rpcrdma_req *rpcrdma_req_create(struct rpcrdma_xprt *r_xprt, size_t size,
 	return NULL;
 }
 
+/**
+ * rpcrdma_reqs_reset - Reset all reqs owned by a transport
+ * @r_xprt: controlling transport instance
+ *
+ * ASSUMPTION: the rb_allreqs list is stable for the duration,
+ * and thus can be walked without holding rb_lock. Eg. the
+ * caller is holding the transport send lock to exclude
+ * device removal or disconnection.
+ */
+static void rpcrdma_reqs_reset(struct rpcrdma_xprt *r_xprt)
+{
+	struct rpcrdma_buffer *buf = &r_xprt->rx_buf;
+	struct rpcrdma_req *req;
+
+	list_for_each_entry(req, &buf->rb_allreqs, rl_all) {
+		/* Credits are valid only for one connection */
+		req->rl_slot.rq_cong = 0;
+	}
+}
+
 static struct rpcrdma_rep *rpcrdma_rep_create(struct rpcrdma_xprt *r_xprt,
 					      bool temp)
 {
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
