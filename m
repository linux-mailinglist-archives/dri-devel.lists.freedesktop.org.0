Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 065DB126105
	for <lists+dri-devel@lfdr.de>; Thu, 19 Dec 2019 12:40:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AC7889FD4;
	Thu, 19 Dec 2019 11:40:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 088AD89FD4
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Dec 2019 11:40:12 +0000 (UTC)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 46A4324650;
 Thu, 19 Dec 2019 11:40:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1576755612;
 bh=utqe9imvi8op5IQ0YfZAWBSecd1QKIZm9SzAS02hoHY=;
 h=Subject:To:Cc:From:Date:From;
 b=PgrlPfVw/HQYv9q/xRDtyQCmjhfj58IhlzUJbzQG1F76Qew1WLooldGyppdsU1YxG
 Ezfl8U1luZD0+8CmNkLnJAU7O+Z1d4tM9bvXvwy+kNWLV1njTfxfglP3/YIKv8bSkp
 ZgSYAX+d3Qm33QJc3LbTnCCQy/VSX2FHYozKDa4Q=
Subject: Patch "drm/dp_mst: Correct the bug in drm_dp_update_payload_part1()"
 has been added to the 5.4-stable tree
To: 20191203042423.5961-1-Wayne.Lin@amd.com, Wayne.Lin@amd.com,
 airlied@linux.ie, daniel.vetter@ffwll.ch, daniel@ffwll.ch,
 dri-devel@lists.freedesktop.org, gregkh@linuxfoundation.org,
 juston.li@intel.com, lyude@redhat.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, sean@poorly.run
From: <gregkh@linuxfoundation.org>
Date: Thu, 19 Dec 2019 12:37:31 +0100
Message-ID: <157675545110354@kroah.com>
MIME-Version: 1.0
X-stable: commit
X-Patchwork-Hint: ignore 
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
Cc: stable-commits@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


This is a note to let you know that I've just added the patch titled

    drm/dp_mst: Correct the bug in drm_dp_update_payload_part1()

to the 5.4-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     drm-dp_mst-correct-the-bug-in-drm_dp_update_payload_part1.patch
and it can be found in the queue-5.4 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From e5a6ca27eb72c67533ddfc11c06df84beaa167fa Mon Sep 17 00:00:00 2001
From: Wayne Lin <Wayne.Lin@amd.com>
Date: Tue, 3 Dec 2019 12:24:23 +0800
Subject: drm/dp_mst: Correct the bug in drm_dp_update_payload_part1()

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


Patches currently in stable-queue which might be from Wayne.Lin@amd.com are

queue-5.4/drm-dp_mst-correct-the-bug-in-drm_dp_update_payload_part1.patch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
