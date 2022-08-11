Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2476558FFA4
	for <lists+dri-devel@lfdr.de>; Thu, 11 Aug 2022 17:32:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B21ABB43F7;
	Thu, 11 Aug 2022 15:32:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D213EB439A;
 Thu, 11 Aug 2022 15:31:54 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3453061620;
 Thu, 11 Aug 2022 15:31:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4AAE1C433C1;
 Thu, 11 Aug 2022 15:31:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1660231913;
 bh=drsoLwNUyuxmaoCNziTsEssVslCYX761EjJmCqn/8AM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=i+dElqMHRJyKyE9KMJEpm3bRDnbe99cB7wc6u3THo5/Utk7/d9+FS7O785kQ8otSo
 f+TNWNvNoRftxBzbgvZshAgopptqWMLL+z3q1XOg0rTA18lCs9b+PKvkNu+d7CSOTG
 CIabMQVJ5gYQJAEyYmD9lOEgDaBdzEVRjzH6A6BL9z5gNAzjQcWOqZm3rWeWILp9yE
 NV94KiGN2QnsKPwidYfxVLFX6oNlBCgbFqShW5is71r7Swlp2kYA1lKjkRKEqioF2e
 aA2JSSKdaWXqwjATWEUK+AGvStsSMH77DcvnrGjcseHip2JNlKltPlJBIc3Yv6BRWD
 Pyr7lRPlCsIeQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.19 025/105] drm/amd/display: Fix monitor flash issue
Date: Thu, 11 Aug 2022 11:27:09 -0400
Message-Id: <20220811152851.1520029-25-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220811152851.1520029-1-sashal@kernel.org>
References: <20220811152851.1520029-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Sasha Levin <sashal@kernel.org>, Hansen Dsouza <Hansen.Dsouza@amd.com>,
 sunpeng.li@amd.com, dri-devel@lists.freedesktop.org, Xinhui.Pan@amd.com,
 Rodrigo.Siqueira@amd.com, amd-gfx@lists.freedesktop.org,
 christian.koenig@amd.com, airlied@linux.ie,
 Daniel Wheeler <daniel.wheeler@amd.com>, Shah Dharati <dharshah@amd.com>,
 Hamza Mahfooz <hamza.mahfooz@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Nicholas Kazlauskas <Nicholas.Kazlauskas@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Shah Dharati <dharshah@amd.com>

[ Upstream commit b840b64bc8ed3fc46f6d6aa7f97c43862a33bea5 ]

[Why & How]
For a some specific monitors, when connected on boot or hot plug,
monitor flash for 1/2 seconds can happen during first HDCP query
operation. Ading some delay in the init sequence for these monitors
fixes the issue, so it is implemented as monitor specific patch.

Co-authored-by: Shah Dharati <dharshah@amd.com>
Reviewed-by: Hansen Dsouza <Hansen.Dsouza@amd.com>
Reviewed-by: Nicholas Kazlauskas <Nicholas.Kazlauskas@amd.com>
Acked-by: Hamza Mahfooz <hamza.mahfooz@amd.com>
Signed-off-by: Shah Dharati <dharshah@amd.com>
Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/display/modules/hdcp/hdcp2_transition.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/modules/hdcp/hdcp2_transition.c b/drivers/gpu/drm/amd/display/modules/hdcp/hdcp2_transition.c
index 1f4095b26409..c5f6c11de7e5 100644
--- a/drivers/gpu/drm/amd/display/modules/hdcp/hdcp2_transition.c
+++ b/drivers/gpu/drm/amd/display/modules/hdcp/hdcp2_transition.c
@@ -524,7 +524,7 @@ enum mod_hdcp_status mod_hdcp_hdcp2_dp_transition(struct mod_hdcp *hdcp,
 			set_watchdog_in_ms(hdcp, 3000, output);
 			set_state_id(hdcp, output, D2_A6_WAIT_FOR_RX_ID_LIST);
 		} else {
-			callback_in_ms(0, output);
+			callback_in_ms(1, output);
 			set_state_id(hdcp, output, D2_SEND_CONTENT_STREAM_TYPE);
 		}
 		break;
-- 
2.35.1

