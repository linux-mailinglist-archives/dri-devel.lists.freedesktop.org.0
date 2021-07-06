Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 72A713BCCC0
	for <lists+dri-devel@lfdr.de>; Tue,  6 Jul 2021 13:18:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 957E06E23B;
	Tue,  6 Jul 2021 11:18:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9F93895C3;
 Tue,  6 Jul 2021 11:18:34 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 874F061CEF;
 Tue,  6 Jul 2021 11:18:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1625570314;
 bh=0I6sraG7t8CfgmD4CJhp+GC2kCQuB1+mEYLSPFGqnhs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=iwhr8ai6xUZSz3qGl7wKDfrrBRluCJZbE/Ar4cBba6bhLbeYfMo2wZUupxdl5wDUQ
 L8I2z9CSRNaUWfgtp7FM4euxUeK2u79QJ24gtUmGAJ4HnjJcwG/hUW/LhYCn+qF3Fa
 Ju32vVEkJTgrOcecYT3qlBO8DCoT1e0thD+uh0whX1ub6BCSfAn0Um8QIlAvTT5nCg
 8kZNoOmnyPUXmcjUdYWVumDgUQJJxjpCSknf5Kl6Fn6UPOJJ630SnZz6GcpYd3wR2O
 icP7gAIkWNZQSOMVcMHeZGKkPLUZac/Cto0JMZKCfyiLlPRyP4+5HpR4T8wONZYt4I
 sr2bAYIEDPcnQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.12 005/160] drm/amd/display: fix HDCP reset sequence
 on reinitialize
Date: Tue,  6 Jul 2021 07:15:51 -0400
Message-Id: <20210706111827.2060499-5-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210706111827.2060499-1-sashal@kernel.org>
References: <20210706111827.2060499-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Sasha Levin <sashal@kernel.org>, Wenjing Liu <Wenjing.Liu@amd.com>,
 amd-gfx@lists.freedesktop.org, Daniel Wheeler <daniel.wheeler@amd.com>,
 Brandon Syu <Brandon.Syu@amd.com>, Wayne Lin <waynelin@amd.com>,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Brandon Syu <Brandon.Syu@amd.com>

[ Upstream commit 99c248c41c2199bd34232ce8e729d18c4b343b64 ]

[why]
When setup is called after hdcp has already setup,
it would cause to disable HDCP flow won’t execute.

[how]
Don't clean up hdcp content to be 0.

Signed-off-by: Brandon Syu <Brandon.Syu@amd.com>
Reviewed-by: Wenjing Liu <Wenjing.Liu@amd.com>
Acked-by: Wayne Lin <waynelin@amd.com>
Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/display/modules/hdcp/hdcp.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/modules/hdcp/hdcp.c b/drivers/gpu/drm/amd/display/modules/hdcp/hdcp.c
index 20e554e771d1..fa8aeec304ef 100644
--- a/drivers/gpu/drm/amd/display/modules/hdcp/hdcp.c
+++ b/drivers/gpu/drm/amd/display/modules/hdcp/hdcp.c
@@ -260,7 +260,6 @@ enum mod_hdcp_status mod_hdcp_setup(struct mod_hdcp *hdcp,
 	struct mod_hdcp_output output;
 	enum mod_hdcp_status status = MOD_HDCP_STATUS_SUCCESS;
 
-	memset(hdcp, 0, sizeof(struct mod_hdcp));
 	memset(&output, 0, sizeof(output));
 	hdcp->config = *config;
 	HDCP_TOP_INTERFACE_TRACE(hdcp);
-- 
2.30.2

