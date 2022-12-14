Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CBB5E64CFAD
	for <lists+dri-devel@lfdr.de>; Wed, 14 Dec 2022 19:44:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B5FA10E454;
	Wed, 14 Dec 2022 18:43:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D91AA10E44F;
 Wed, 14 Dec 2022 18:43:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1671043385; x=1702579385;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=TkO/OjLlcLjPgVfZQcfk+7JhxG4B2uNmLJzM3oSl5iY=;
 b=LX/AiDgBoYVJ1VAmezG3w0dyDqm+1hDK6q2fqpfI63Jsn2S36KgdNSxm
 0FAHYhbnas9TXzvLzf4ZsLsevSHyjkgP2LOLiRgWe4GqW9vu8lmzgdvnx
 TfeaS9LSvyGZI+NLulnw2iTrB6JakxsmHae+rdAebyRbuXXqLvd2Zl9fy
 liuK/Gy7F59RJqn4wy74z7KxBgl4VdBO4IC57k15XyHuWwv1Rx+yaWlVW
 HT1++uIJSZRNi4VqKA/hJNdb0xthEPAqFwCWvfZHjpJ7zGebbEYe3gMoL
 zP4LmQiKb9zoWo75bwgSj0yRntjFXQXokdO9W044ydrr+INjP5mu4d3WV A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10561"; a="320343557"
X-IronPort-AV: E=Sophos;i="5.96,245,1665471600"; d="scan'208";a="320343557"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Dec 2022 10:43:05 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10561"; a="894424798"
X-IronPort-AV: E=Sophos;i="5.96,245,1665471600"; d="scan'208";a="894424798"
Received: from ideak-desk.fi.intel.com ([10.237.72.58])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Dec 2022 10:43:04 -0800
From: Imre Deak <imre.deak@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 3/3] drm/display/dp_mst: Fix payload addition on a
 disconnected sink
Date: Wed, 14 Dec 2022 20:42:58 +0200
Message-Id: <20221214184258.2869417-3-imre.deak@intel.com>
X-Mailer: git-send-email 2.31.1.189.g2e36527f23
In-Reply-To: <20221214184258.2869417-1-imre.deak@intel.com>
References: <20221214184258.2869417-1-imre.deak@intel.com>
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
Cc: stable@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

If an MST stream is enabled on a disconnected sink, the payload for the
stream is not created and the MST manager's payload count/next start VC
slot is not updated. Since the payload's start VC slot may still contain
a valid value (!= -1) the subsequent disabling of such a stream could
cause an incorrect decrease of the payload count/next start VC slot in
drm_dp_remove_payload() and hence later payload additions will fail.

Fix the above by marking the payload as invalid in the above case, so
that it's skipped during payload removal. While at it add a debug print
for this case.

Cc: Lyude Paul <lyude@redhat.com>
Cc: <stable@vger.kernel.org> # v6.1+
Signed-off-by: Imre Deak <imre.deak@intel.com>
---
 drivers/gpu/drm/display/drm_dp_mst_topology.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/display/drm_dp_mst_topology.c b/drivers/gpu/drm/display/drm_dp_mst_topology.c
index 01350510244f2..5861b0a6247bc 100644
--- a/drivers/gpu/drm/display/drm_dp_mst_topology.c
+++ b/drivers/gpu/drm/display/drm_dp_mst_topology.c
@@ -3309,8 +3309,13 @@ int drm_dp_add_payload_part1(struct drm_dp_mst_topology_mgr *mgr,
 	int ret;
 
 	port = drm_dp_mst_topology_get_port_validated(mgr, payload->port);
-	if (!port)
+	if (!port) {
+		drm_dbg_kms(mgr->dev,
+			    "VCPI %d for port %p not in topology, not creating a payload\n",
+			    payload->vcpi, payload->port);
+		payload->vc_start_slot = -1;
 		return 0;
+	}
 
 	if (mgr->payload_count == 0)
 		mgr->next_start_slot = mst_state->start_slot;
-- 
2.37.1

