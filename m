Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 267EB678FE9
	for <lists+dri-devel@lfdr.de>; Tue, 24 Jan 2023 06:32:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A985210E5FB;
	Tue, 24 Jan 2023 05:32:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCAC410E5F0;
 Tue, 24 Jan 2023 05:31:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674538314; x=1706074314;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=BC1VPP22Mlmcs01JtmOQ0m+HiBeirYHITAo7/MqCqyY=;
 b=eoVwKShU28HzNCwWBfiKu0t++LhRzVLZq+vUZPVbgGF192UcQltKghtC
 MkKENla6bxSXK6NT1IkAoiU4TojXmoyXWAa49z+vRWqap6H1sU78dt7Lx
 nDrH4b5DpnOc6mihk5eWPSbdxwSUCXxOU8QbS5TquPBhqrCoHMa/2kCC1
 nOsATgiL0StuwGN//vbqbkVoyRsNIE1iseI6PXoJ39w48Xjnqn6lz+70v
 Hq4iOubE+04m7V/wLgBqpUDDFkXsRSM4A+2s3g5dc1QAPT51f43ONUPVy
 N7+1ZhvQQz51bRDEKfC5GmzLBt6bRZg85OXG26oTxH5PWvMhfmJxh/wsf g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="324906435"
X-IronPort-AV: E=Sophos;i="5.97,241,1669104000"; d="scan'208";a="324906435"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2023 21:31:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="611921455"
X-IronPort-AV: E=Sophos;i="5.97,241,1669104000"; d="scan'208";a="611921455"
Received: from aalteres-desk.fm.intel.com ([10.80.57.53])
 by orsmga003.jf.intel.com with ESMTP; 23 Jan 2023 21:31:53 -0800
From: Alan Previn <alan.previn.teres.alexis@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v6 3/6] mei: clean pending read with vtag on bus
Date: Mon, 23 Jan 2023 21:31:47 -0800
Message-Id: <20230124053150.3543928-4-alan.previn.teres.alexis@intel.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230124053150.3543928-1-alan.previn.teres.alexis@intel.com>
References: <20230124053150.3543928-1-alan.previn.teres.alexis@intel.com>
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
Reviewed-by: Tomas Winkler <tomas.winkler@intel.com>
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

