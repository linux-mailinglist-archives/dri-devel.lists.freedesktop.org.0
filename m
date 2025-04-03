Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DB5AA7A67F
	for <lists+dri-devel@lfdr.de>; Thu,  3 Apr 2025 17:27:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C85E410EA3A;
	Thu,  3 Apr 2025 15:27:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="xffhSyde";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46EDC10EA3C
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Apr 2025 15:27:14 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 1836D43DF8;
 Thu,  3 Apr 2025 15:27:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 296E2C4CEE3;
 Thu,  3 Apr 2025 15:27:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1743694031;
 bh=x7yJljl0FuX2ULe3/tWYYeMQDlKJ7Z0cfPoDXlt0Aj8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=xffhSyde6MpnWDahBk3sGvwdQsLv8m0th96RVfVnn1SmaxznFjsmQDP1uvzZaucLh
 OWRSNL6Wlpk1wVT9oVgRc//Gwrcp0jzVTU7ZukNTmwkO2VLuEOZcZ0cpPf5CQidLZK
 bB1lZBfuwEVH43QfS13BdJf7vk9KPchmNQmIw38k=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: stable@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, patches@lists.linux.dev,
 Lyude Paul <lyude@redhat.com>, dri-devel@lists.freedesktop.org,
 Imre Deak <imre.deak@intel.com>,
 Thadeu Lima de Souza Cascardo <cascardo@igalia.com>
Subject: [PATCH 6.6 08/26] drm/dp_mst: Factor out function to queue a topology
 probe work
Date: Thu,  3 Apr 2025 16:20:29 +0100
Message-ID: <20250403151622.655368926@linuxfoundation.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250403151622.415201055@linuxfoundation.org>
References: <20250403151622.415201055@linuxfoundation.org>
User-Agent: quilt/0.68
X-stable: review
X-Patchwork-Hint: ignore
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

6.6-stable review patch.  If anyone has any objections, please let me know.

------------------

From: Imre Deak <imre.deak@intel.com>

commit e9b36c5be2e7fdef2cc933c1dac50bd81881e9b8 upstream.

Factor out a function to queue a work for probing the topology, also
used by the next patch.

Cc: Lyude Paul <lyude@redhat.com>
Cc: dri-devel@lists.freedesktop.org
Reviewed-by: Lyude Paul <lyude@redhat.com>
Signed-off-by: Imre Deak <imre.deak@intel.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20240722165503.2084999-2-imre.deak@intel.com
Signed-off-by: Thadeu Lima de Souza Cascardo <cascardo@igalia.com>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/gpu/drm/display/drm_dp_mst_topology.c |    9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

--- a/drivers/gpu/drm/display/drm_dp_mst_topology.c
+++ b/drivers/gpu/drm/display/drm_dp_mst_topology.c
@@ -2692,6 +2692,11 @@ static void drm_dp_mst_link_probe_work(s
 		drm_kms_helper_hotplug_event(dev);
 }
 
+static void drm_dp_mst_queue_probe_work(struct drm_dp_mst_topology_mgr *mgr)
+{
+	queue_work(system_long_wq, &mgr->work);
+}
+
 static bool drm_dp_validate_guid(struct drm_dp_mst_topology_mgr *mgr,
 				 u8 *guid)
 {
@@ -3643,7 +3648,7 @@ int drm_dp_mst_topology_mgr_set_mst(stru
 		/* Write reset payload */
 		drm_dp_dpcd_write_payload(mgr, 0, 0, 0x3f);
 
-		queue_work(system_long_wq, &mgr->work);
+		drm_dp_mst_queue_probe_work(mgr);
 
 		ret = 0;
 	} else {
@@ -3766,7 +3771,7 @@ int drm_dp_mst_topology_mgr_resume(struc
 	 * state of our in-memory topology back into sync with reality. So,
 	 * restart the probing process as if we're probing a new hub
 	 */
-	queue_work(system_long_wq, &mgr->work);
+	drm_dp_mst_queue_probe_work(mgr);
 	mutex_unlock(&mgr->lock);
 
 	if (sync) {


