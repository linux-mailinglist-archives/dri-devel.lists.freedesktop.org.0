Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EBE283740D1
	for <lists+dri-devel@lfdr.de>; Wed,  5 May 2021 18:38:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCE696EC20;
	Wed,  5 May 2021 16:38:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0DD46EC20;
 Wed,  5 May 2021 16:38:27 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5416A613FE;
 Wed,  5 May 2021 16:38:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1620232707;
 bh=cuJraNm/ySXusB0u5w9lhScTSuhxVXyuD3eYZplHLlQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=QIwC18RaRnKbsBL0ibexYFde+hC8Ew1PdsuOdxGJRMFjN80YjUqUn+VydmY+ZpAi9
 j4XxkV4W+QbQ7gYTKbniE8iOTOCZxUU8tV7wZWlYexydiGcBqjef8kBWeNq1WTOJB7
 RUqhbuRNeZTqylr37x9m4WiI70qL0uS4luyXV/XgQORjKmUYsn2X9GjCg7YS+RLs5z
 loTGSqO66rKVI3wEV90otVmyQTuY0Hwzn0RAyLVkiaXr7txgYisKycJEckOrgepUHR
 i74FJOiIuBBJlo47q2Ko2Dpw9mh5vd66597Ad4KjnI5a6Ck+21VYx1LFmFxyrXzm4G
 HfsTHZlzz2mMQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.10 67/85] drm/amd/display: add handling for hdcp2 rx
 id list validation
Date: Wed,  5 May 2021 12:36:30 -0400
Message-Id: <20210505163648.3462507-67-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210505163648.3462507-1-sashal@kernel.org>
References: <20210505163648.3462507-1-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>,
 "Dingchen \(David\) Zhang" <dingchen.zhang@amd.com>,
 amd-gfx@lists.freedesktop.org, Daniel Wheeler <daniel.wheeler@amd.com>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: "Dingchen (David) Zhang" <dingchen.zhang@amd.com>

[ Upstream commit 4ccf9446b2a3615615045346c97f8a1e2a16568a ]

[why]
the current implementation of hdcp2 rx id list validation does not
have handler/checker for invalid message status, e.g. HMAC, the V
parameter calculated from PSP not matching the V prime from Rx.

[how]
return a generic FAILURE for any message status not SUCCESS or
REVOKED.

Signed-off-by: Dingchen (David) Zhang <dingchen.zhang@amd.com>
Reviewed-by: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
Acked-by: Aurabindo Pillai <aurabindo.pillai@amd.com>
Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/display/modules/hdcp/hdcp_psp.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/modules/hdcp/hdcp_psp.c b/drivers/gpu/drm/amd/display/modules/hdcp/hdcp_psp.c
index 3a367a5968ae..972f2600f967 100644
--- a/drivers/gpu/drm/amd/display/modules/hdcp/hdcp_psp.c
+++ b/drivers/gpu/drm/amd/display/modules/hdcp/hdcp_psp.c
@@ -789,6 +789,8 @@ enum mod_hdcp_status mod_hdcp_hdcp2_validate_rx_id_list(struct mod_hdcp *hdcp)
 			   TA_HDCP2_MSG_AUTHENTICATION_STATUS__RECEIVERID_REVOKED) {
 			hdcp->connection.is_hdcp2_revoked = 1;
 			status = MOD_HDCP_STATUS_HDCP2_RX_ID_LIST_REVOKED;
+		} else {
+			status = MOD_HDCP_STATUS_HDCP2_VALIDATE_RX_ID_LIST_FAILURE;
 		}
 	}
 	mutex_unlock(&psp->hdcp_context.mutex);
-- 
2.30.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
