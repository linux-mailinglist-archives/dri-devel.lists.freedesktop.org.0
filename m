Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C9A6179808
	for <lists+dri-devel@lfdr.de>; Wed,  4 Mar 2020 19:36:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F5B36EB5C;
	Wed,  4 Mar 2020 18:36:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB5F56EB5C
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Mar 2020 18:36:54 +0000 (UTC)
Received: from paulmck-ThinkPad-P72.home (50-39-105-78.bvtn.or.frontiernet.net
 [50.39.105.78])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A164920866;
 Wed,  4 Mar 2020 18:36:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1583347014;
 bh=Q5zcdnLn8aFwGuFTh/7DkOTC8NTckx4eSzDvY5E0y1E=;
 h=Date:From:To:Cc:Subject:Reply-To:From;
 b=JYWYXyHbGO/ncCPzgBkUUpnpRqfBeqCVjch7d8VxsH0SW8CVnm2AsGQBp9GrQMAZh
 182YlsgWwKCaR/1pMuiu1HzWBb9TXYbQUJqj11/pj1k9qkGSYtj/E65zUDFjDiR8K7
 8a+pB2yya/d2xJb3a+7CgGkZaoBNKVPGgIi4+cCY=
Received: by paulmck-ThinkPad-P72.home (Postfix, from userid 1000)
 id 715BC3522731; Wed,  4 Mar 2020 10:36:54 -0800 (PST)
Date: Wed, 4 Mar 2020 10:36:54 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
To: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: [PATCH] Make drm_dp_mst_dsc_aux_for_port() safe for old compilers
Message-ID: <20200304183654.GA9011@paulmck-ThinkPad-P72>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Reply-To: paulmck@kernel.org
Cc: airlied@linux.ie, hch@infradead.org, joe@perches.com, kernel-team@fb.com,
 torvalds@linux-foundation.org, mingo@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Older compilers either want two extra pairs of curly braces around the
initializer for local variable "desc", or they want a single pair of
curly braces with nothing inside.  Current Linux-kernel practice favors
the latter, so this commit makes it so.

This is a fix for a regression introduced into v5.6-rc1.

Fixes: 5b03f9d86880 ("drm/dp_mst: Add new quirk for Synaptics MST hubs")
Suggested-by: Chris Wilson <chris@chris-wilson.co.uk>
Suggested-by: Joe Perches <joe@perches.com>
Suggested-by: Christoph Hellwig <hch@infradead.org>
Signed-off-by: Paul E. McKenney <paulmck@kernel.org>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>

diff --git a/drivers/gpu/drm/drm_dp_mst_topology.c b/drivers/gpu/drm/drm_dp_mst_topology.c
index 20cdaf3..b123f60 100644
--- a/drivers/gpu/drm/drm_dp_mst_topology.c
+++ b/drivers/gpu/drm/drm_dp_mst_topology.c
@@ -5396,7 +5396,7 @@ struct drm_dp_aux *drm_dp_mst_dsc_aux_for_port(struct drm_dp_mst_port *port)
 {
 	struct drm_dp_mst_port *immediate_upstream_port;
 	struct drm_dp_mst_port *fec_port;
-	struct drm_dp_desc desc = { 0 };
+	struct drm_dp_desc desc = { };
 	u8 endpoint_fec;
 	u8 endpoint_dsc;
 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
