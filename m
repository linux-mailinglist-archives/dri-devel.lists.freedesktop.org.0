Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A25A6667DA
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jan 2023 01:37:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDA7310E83F;
	Thu, 12 Jan 2023 00:37:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B428310E83E;
 Thu, 12 Jan 2023 00:37:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1673483833; x=1705019833;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2Lxj77hEAJ3S07gtUnrmnuW0iUn6nVX/lat5FVlG5s8=;
 b=R0X5pOOxuZG8Thpono1EUExhZhPfR4ofXZAVEmGTiYMSNi/6Rzei+ji5
 7peur2BQkEM3dta/rJLK08y2vH8gOriwDaTQJ4yU1ApM85OIhDVcdujvk
 4qpmf473irAceJcmCl848Eva+L0ukM8bAU64ldSn4iG+yb85N8P05ysP+
 13Nw0b2XsRVWrWdPSHj1FY4joBG7ZvWyVdvqR6h6o8pktUqy8/FN1O2Nh
 MEDft861KwJdJitfMhhxRSwvuaAIkIGfM5DKVNRnN7Ar14+eNLJrKSKED
 lSPJjilJzr2JTPK0gP2UejNATZ108/Z9GD9spbIMYtyCbFIX4nqhwAbkx Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10586"; a="303271482"
X-IronPort-AV: E=Sophos;i="5.96,318,1665471600"; d="scan'208";a="303271482"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jan 2023 16:37:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10586"; a="635179866"
X-IronPort-AV: E=Sophos;i="5.96,318,1665471600"; d="scan'208";a="635179866"
Received: from aalteres-desk.fm.intel.com ([10.80.57.53])
 by orsmga006.jf.intel.com with ESMTP; 11 Jan 2023 16:37:11 -0800
From: Alan Previn <alan.previn.teres.alexis@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v4 3/6] mei: clean pending read with vtag on bus
Date: Wed, 11 Jan 2023 16:37:03 -0800
Message-Id: <20230112003706.950931-4-alan.previn.teres.alexis@intel.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230112003706.950931-1-alan.previn.teres.alexis@intel.com>
References: <20230112003706.950931-1-alan.previn.teres.alexis@intel.com>
MIME-Version: 1.0
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
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>,
	Vivi@freedesktop.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rodrigo <rodrigo.vivi@intel.com>,
	Alexander Usyskin <alexander.usyskin@intel.com>,
	dri-devel@lists.freedesktop.org,
	Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
	Juston Li <justonli@chromium.org>,
	Tomas Winkler <tomas.winkler@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Alexander Usyskin <alexander.usyskin@intel.com>

Client on bus have only one vtag map slot and should disregard the vtag
value when cleaning pending read flag.
Fixes read flow control message unexpectedly generated when
clent on bus send messages with different vtags.

Signed-off-by: Alexander Usyskin <alexander.usyskin@intel.com>
Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>
---
 drivers/misc/mei/client.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/misc/mei/client.c b/drivers/misc/mei/client.c
index 9ddb854b8155..5c19097266fe 100644
--- a/drivers/misc/mei/client.c
+++ b/drivers/misc/mei/client.c
@@ -1343,7 +1343,9 @@ static void mei_cl_reset_read_by_vtag(const struct mei_cl *cl, u8 vtag)
 	struct mei_cl_vtag *vtag_l;
 
 	list_for_each_entry(vtag_l, &cl->vtag_map, list) {
-		if (vtag_l->vtag == vtag) {
+		/* The client on bus has one fixed vtag map */
+		if ((cl->cldev && mei_cldev_enabled(cl->cldev)) ||
+		    vtag_l->vtag == vtag) {
 			vtag_l->pending_read = false;
 			break;
 		}
-- 
2.39.0

