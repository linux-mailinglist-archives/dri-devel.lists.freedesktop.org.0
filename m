Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2659267AB9E
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jan 2023 09:27:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 453BB10E749;
	Wed, 25 Jan 2023 08:26:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46C1E897FD;
 Wed, 25 Jan 2023 08:26:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674635205; x=1706171205;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vbcjHN6c+T2ove7xe1N675QhwgjetRSgH+Q8NcZ3S/g=;
 b=VLPYvk3ZJ2CAibXYh1cg/dLQS1Lgkqrn9VAzDZR/1VSwdqmQAmDo0gNf
 1tYMYcSj+HPE1Mv+WnlDRciGp8RbCESn6ucmfeiyjZVNn76iFi+WEx4f+
 tVnOBxFMYnFNSwddh/NTLFjoyIRGgeMZQc7aJGgmJtM64e1neBElNJfYC
 P18ndK5avD7gpurEhK4U7N0P7nXhlCpXOyBGctV/S6tA3T+UmczAaVHsr
 r1uNh8D4n2tXvcSJdoQWcY/t8E2UXART94MeQLK70BR/iYJnmZgFkDkgp
 GNuBaP+EQS/moW8DG9LGseisXI2kpd4qtwItyin/3FojNWZhj2qKti2CT A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10600"; a="325180414"
X-IronPort-AV: E=Sophos;i="5.97,244,1669104000"; d="scan'208";a="325180414"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2023 00:26:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10600"; a="662426116"
X-IronPort-AV: E=Sophos;i="5.97,244,1669104000"; d="scan'208";a="662426116"
Received: from aalteres-desk.fm.intel.com ([10.80.57.53])
 by orsmga002.jf.intel.com with ESMTP; 25 Jan 2023 00:26:38 -0800
From: Alan Previn <alan.previn.teres.alexis@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v7 3/6] mei: clean pending read with vtag on bus
Date: Wed, 25 Jan 2023 00:26:34 -0800
Message-Id: <20230125082637.118970-4-alan.previn.teres.alexis@intel.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230125082637.118970-1-alan.previn.teres.alexis@intel.com>
References: <20230125082637.118970-1-alan.previn.teres.alexis@intel.com>
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

