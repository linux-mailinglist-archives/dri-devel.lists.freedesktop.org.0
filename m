Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB830B3FF04
	for <lists+dri-devel@lfdr.de>; Tue,  2 Sep 2025 14:04:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8332110E68D;
	Tue,  2 Sep 2025 12:04:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="0112SxHx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3314110E683;
 Tue,  2 Sep 2025 12:04:11 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 0EC74601D3;
 Tue,  2 Sep 2025 12:04:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47278C4CEED;
 Tue,  2 Sep 2025 12:04:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1756814649;
 bh=m4iVxB1YPBdp0DHClEAyxCmlXfIDdPJXaohrqyi76K0=;
 h=Subject:To:Cc:From:Date:From;
 b=0112SxHxE1taPYDAZFvx2+G71H42ucFbGUBKx8mbw3QxFr1/0X/V3RYDGOllHP9SJ
 TXF8FrvomT+ZIdXDzNXD4yHtH6RfDWLmEfS4DjXrW+WnBohbBlnbd/coz+MqaSGScT
 aXzFISdgJjtFEv8kX9N6lB4Nu42KrAns1LxKF2Cw=
Subject: Patch "Revert "drm/dp: Change AUX DPCD probe address from DPCD_REV to
 LANE0_1_STATUS"" has been added to the 6.16-stable tree
To: dri-devel@lists.freedesktop.org, gregkh@linuxfoundation.org,
 imre.deak@intel.com, intel-gfx@lists.freedesktop.org, sashal@kernel.org
Cc: <stable-commits@vger.kernel.org>
From: <gregkh@linuxfoundation.org>
Date: Tue, 02 Sep 2025 14:03:52 +0200
Message-ID: <2025090252-fall-embargo-d67c@gregkh>
MIME-Version: 1.0
Content-Type: text/plain; charset=ANSI_X3.4-1968
Content-Transfer-Encoding: 8bit
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


This is a note to let you know that I've just added the patch titled

    Revert "drm/dp: Change AUX DPCD probe address from DPCD_REV to LANE0_1_STATUS"

to the 6.16-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     revert-drm-dp-change-aux-dpcd-probe-address-from-dpcd_rev-to-lane0_1_status.patch
and it can be found in the queue-6.16 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From imre.deak@intel.com  Tue Sep  2 13:50:59 2025
From: Imre Deak <imre.deak@intel.com>
Date: Thu, 28 Aug 2025 20:49:29 +0300
Subject: Revert "drm/dp: Change AUX DPCD probe address from DPCD_REV to LANE0_1_STATUS"
To: <stable@vger.kernel.org>
Cc: <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>, Sasha Levin <sashal@kernel.org>

From: Imre Deak <imre.deak@intel.com>

This reverts commit 944e732be9c3a33e64e9fb0f5451a37fc252ddfc which is
commit a40c5d727b8111b5db424a1e43e14a1dcce1e77f upstream.

The upstream commit a40c5d727b8111b5db424a1e43e14a1dcce1e77f ("drm/dp:
Change AUX DPCD probe address from DPCD_REV to LANE0_1_STATUS") the
reverted commit backported causes a regression, on one eDP panel at
least resulting in display flickering, described in detail at the Link:
below. The issue fixed by the upstream commit will need a different
solution, revert the backport for now.

Cc: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
Cc: Sasha Levin <sashal@kernel.org>
Link: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14558
Signed-off-by: Imre Deak <imre.deak@intel.com>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/gpu/drm/display/drm_dp_helper.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- a/drivers/gpu/drm/display/drm_dp_helper.c
+++ b/drivers/gpu/drm/display/drm_dp_helper.c
@@ -725,7 +725,7 @@ ssize_t drm_dp_dpcd_read(struct drm_dp_a
 	 * monitor doesn't power down exactly after the throw away read.
 	 */
 	if (!aux->is_remote) {
-		ret = drm_dp_dpcd_probe(aux, DP_LANE0_1_STATUS);
+		ret = drm_dp_dpcd_probe(aux, DP_DPCD_REV);
 		if (ret < 0)
 			return ret;
 	}


Patches currently in stable-queue which might be from imre.deak@intel.com are

queue-6.16/revert-drm-dp-change-aux-dpcd-probe-address-from-dpcd_rev-to-lane0_1_status.patch
