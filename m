Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EDD32D771B
	for <lists+dri-devel@lfdr.de>; Fri, 11 Dec 2020 14:57:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB38B6EE0F;
	Fri, 11 Dec 2020 13:57:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D911F6EE0E;
 Fri, 11 Dec 2020 13:57:04 +0000 (UTC)
IronPort-SDR: akdISH2aZP69NZNcPjrzdtHOv421Lv3sm8ZTqCFwOzqfiYIeLo9fWenBioBZxymPC1SjpK5bVu
 USGMo+hOhLrg==
X-IronPort-AV: E=McAfee;i="6000,8403,9831"; a="162187738"
X-IronPort-AV: E=Sophos;i="5.78,411,1599548400"; d="scan'208";a="162187738"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2020 05:57:04 -0800
IronPort-SDR: zWQASDqjkUZmia7PJfp5B1sJX23c4iBMf8itBH0t2MIe8NW7fx2ENbOvMgQywzL1bJ3frqzK4k
 iy9kMA5u3Skg==
X-IronPort-AV: E=Sophos;i="5.78,411,1599548400"; d="scan'208";a="409228452"
Received: from genxfsim-desktop.iind.intel.com ([10.223.74.178])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2020 05:57:01 -0800
From: Anshuman Gupta <anshuman.gupta@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v8 12/19] misc/mei/hdcp: Fix AUTH_STREAM_REQ cmd buffer len
Date: Fri, 11 Dec 2020 19:12:37 +0530
Message-Id: <20201211134244.14588-13-anshuman.gupta@intel.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201211134244.14588-1-anshuman.gupta@intel.com>
References: <20201211134244.14588-1-anshuman.gupta@intel.com>
MIME-Version: 1.0
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
Cc: jani.nikula@intel.com, Karthik B S <karthik.b.s@intel.com>,
 uma.shankar@intel.com, seanpaul@chromium.org,
 Anshuman Gupta <anshuman.gupta@intel.com>,
 Tomas Winkler <tomas.winkler@intel.com>, juston.li@intel.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix the size of WIRED_REPEATER_AUTH_STREAM_REQ cmd buffer size.
It is based upon the actual number of MST streams and size
of wired_cmd_repeater_auth_stream_req_in.
Excluding the size of hdcp_cmd_header.

v2:
- hdcp_cmd_header size annotation nitpick. [Tomas]

Cc: Tomas Winkler <tomas.winkler@intel.com>
Cc: Ramalingam C <ramalingam.c@intel.com>
Acked-by: Tomas Winkler <tomas.winkler@intel.com>
Reviewed-by: Uma Shankar <uma.shankar@intel.com>
Reviewed-by: Ramalingam C <ramalingam.c@intel.com>
Tested-by: Karthik B S <karthik.b.s@intel.com>
Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
---
 drivers/misc/mei/hdcp/mei_hdcp.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/misc/mei/hdcp/mei_hdcp.c b/drivers/misc/mei/hdcp/mei_hdcp.c
index 9ae9669e46ea..3506a3534294 100644
--- a/drivers/misc/mei/hdcp/mei_hdcp.c
+++ b/drivers/misc/mei/hdcp/mei_hdcp.c
@@ -569,8 +569,7 @@ static int mei_hdcp_verify_mprime(struct device *dev,
 	verify_mprime_in->header.api_version = HDCP_API_VERSION;
 	verify_mprime_in->header.command_id = WIRED_REPEATER_AUTH_STREAM_REQ;
 	verify_mprime_in->header.status = ME_HDCP_STATUS_SUCCESS;
-	verify_mprime_in->header.buffer_len =
-			WIRED_CMD_BUF_LEN_REPEATER_AUTH_STREAM_REQ_MIN_IN;
+	verify_mprime_in->header.buffer_len = cmd_size  - sizeof(verify_mprime_in->header);
 
 	verify_mprime_in->port.integrated_port_type = data->port_type;
 	verify_mprime_in->port.physical_port = (u8)data->fw_ddi;
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
