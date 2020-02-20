Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B7B21653B3
	for <lists+dri-devel@lfdr.de>; Thu, 20 Feb 2020 01:42:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5FC06ECC3;
	Thu, 20 Feb 2020 00:42:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 681326ECC3
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2020 00:42:33 +0000 (UTC)
Received: from paulmck-ThinkPad-P72.home (50-39-105-78.bvtn.or.frontiernet.net
 [50.39.105.78])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3605F2465D;
 Thu, 20 Feb 2020 00:42:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1582159353;
 bh=t55/uABbK9O7ffaPzwW71TFFyFm0ZAYQaR7QPBbTp8Q=;
 h=Date:From:To:Cc:Subject:Reply-To:From;
 b=HHHnNOZc4rQFLxMgfF2r4UZarXcRCAgI/hcJxvES1h3JABM0Q64+rlrNdurHb+Iqq
 mWBJ8b+LqtCsfIkmVNQ64LoQmw0wZrGYMkZHJhrExikAEfGMZB51MTrJclueXTjPnW
 XlBgI+FBtnm2b+vPDz8h1cKmcFx4kFiy1fPr6jVE=
Received: by paulmck-ThinkPad-P72.home (Postfix, from userid 1000)
 id 0831B3520BB6; Wed, 19 Feb 2020 16:42:33 -0800 (PST)
Date: Wed, 19 Feb 2020 16:42:33 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@linux.ie,
 daniel@ffwll.ch
Subject: drm_dp_mst_topology.c and old compilers
Message-ID: <20200220004232.GA28048@paulmck-ThinkPad-P72>
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello!

A box with GCC 4.8.3 compiler didn't like drm_dp_mst_topology.c.  The
following (lightly tested) patch makes it happy and seems OK for newer
compilers as well.

Is this of interest?

							Thanx, Paul

-----------------------------------------------------------------------

diff --git a/drivers/gpu/drm/drm_dp_mst_topology.c b/drivers/gpu/drm/drm_dp_mst_topology.c
index 20cdaf3..232408a 100644
--- a/drivers/gpu/drm/drm_dp_mst_topology.c
+++ b/drivers/gpu/drm/drm_dp_mst_topology.c
@@ -5396,7 +5396,7 @@ struct drm_dp_aux *drm_dp_mst_dsc_aux_for_port(struct drm_dp_mst_port *port)
 {
 	struct drm_dp_mst_port *immediate_upstream_port;
 	struct drm_dp_mst_port *fec_port;
-	struct drm_dp_desc desc = { 0 };
+	struct drm_dp_desc desc = {{{ 0 }}};
 	u8 endpoint_fec;
 	u8 endpoint_dsc;
 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
