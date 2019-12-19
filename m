Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2734E126B3F
	for <lists+dri-devel@lfdr.de>; Thu, 19 Dec 2019 19:56:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 056B26E3BC;
	Thu, 19 Dec 2019 18:56:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E17526E3BC
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Dec 2019 18:56:06 +0000 (UTC)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 51FA024676;
 Thu, 19 Dec 2019 18:56:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1576781766;
 bh=/+jet7Gbsw9Dd08gHvUBpEqgl3/xuwlJcZxKhbSxFwQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=0Hsx16eQz3gM/M0s2hY/qEb9Dliatr04b44SJeZ98IGI8kZc55ez3/Tw/5g7bKxd9
 NLcUmbhMuudpUhwZ84RYOZ7hXiHBFXw3NO26aWHbUSrt4olrp4PldS0DRO+TSpjKTT
 scXKcxRyJFcvuXdpRfSZPBFgjhcC89qcq8bZXQEw=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 5.4 71/80] drm/dp_mst: Correct the bug in
 drm_dp_update_payload_part1()
Date: Thu, 19 Dec 2019 19:35:03 +0100
Message-Id: <20191219183142.235583184@linuxfoundation.org>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20191219183031.278083125@linuxfoundation.org>
References: <20191219183031.278083125@linuxfoundation.org>
User-Agent: quilt/0.66
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 dri-devel@lists.freedesktop.org, Wayne Lin <Wayne.Lin@amd.com>,
 stable@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Sean Paul <sean@poorly.run>, Juston Li <juston.li@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Wayne Lin <Wayne.Lin@amd.com>

commit e5a6ca27eb72c67533ddfc11c06df84beaa167fa upstream.

[Why]
If the payload_state is DP_PAYLOAD_DELETE_LOCAL in series, current
code doesn't delete the payload at current index and just move the
index to next one after shuffling payloads.

[How]
Drop the i++ increasing part in for loop head and decide whether
to increase the index or not according to payload_state of current
payload.

Changes since v1:
* Refine the code to have it easy reading
* Amend the commit message to meet the way code is modified now.

Signed-off-by: Wayne Lin <Wayne.Lin@amd.com>
Reviewed-by: Lyude Paul <lyude@redhat.com>
Fixes: 706246c761dd ("drm/dp_mst: Refactor drm_dp_update_payload_part1()")
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Juston Li <juston.li@intel.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Sean Paul <sean@poorly.run>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org
Cc: <stable@vger.kernel.org> # v5.1+
[Added cc for stable]
Signed-off-by: Lyude Paul <lyude@redhat.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20191203042423.5961-1-Wayne.Lin@amd.com
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

---
 drivers/gpu/drm/drm_dp_mst_topology.c |    6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

--- a/drivers/gpu/drm/drm_dp_mst_topology.c
+++ b/drivers/gpu/drm/drm_dp_mst_topology.c
@@ -2465,9 +2465,11 @@ int drm_dp_update_payload_part1(struct d
 			drm_dp_mst_topology_put_port(port);
 	}
 
-	for (i = 0; i < mgr->max_payloads; i++) {
-		if (mgr->payloads[i].payload_state != DP_PAYLOAD_DELETE_LOCAL)
+	for (i = 0; i < mgr->max_payloads; /* do nothing */) {
+		if (mgr->payloads[i].payload_state != DP_PAYLOAD_DELETE_LOCAL) {
+			i++;
 			continue;
+		}
 
 		DRM_DEBUG_KMS("removing payload %d\n", i);
 		for (j = i; j < mgr->max_payloads - 1; j++) {


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
