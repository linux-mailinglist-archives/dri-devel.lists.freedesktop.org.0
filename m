Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D41CAB4006C
	for <lists+dri-devel@lfdr.de>; Tue,  2 Sep 2025 14:27:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D83910E69B;
	Tue,  2 Sep 2025 12:27:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="d3OvI9F3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6905B10E69B;
 Tue,  2 Sep 2025 12:27:19 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 4D9934409B;
 Tue,  2 Sep 2025 12:27:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2851C4CEFB;
 Tue,  2 Sep 2025 12:27:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1756816039;
 bh=i3tuxvfcd5w4zp76adW9BEq62UuBzN/i206DxuwVeBw=;
 h=Subject:To:Cc:From:Date:In-Reply-To:From;
 b=d3OvI9F3IsS64G25rBhCpiN8d9I9fbukrSBiSmeYWroaaYgKaOYLryPdGoJWUpT75
 BPDBIIaikfGaYllmWQJ4DVdh/W3c7ElZDyuuxvoObhfn7vZjc8lBQShlZ9UA625TeB
 OlVH6dcJFjvaUn9Spci6PBXAQAzBoFykd8GOkVas=
Subject: Patch "Revert "drm/dp: Change AUX DPCD probe address from DPCD_REV to
 LANE0_1_STATUS"" has been added to the 6.1-stable tree
To: dri-devel@lists.freedesktop.org, gregkh@linuxfoundation.org,
 imre.deak@intel.com, intel-gfx@lists.freedesktop.org, sashal@kernel.org
Cc: <stable-commits@vger.kernel.org>
From: <gregkh@linuxfoundation.org>
Date: Tue, 02 Sep 2025 14:27:05 +0200
In-Reply-To: <20250828174932.414566-4-imre.deak@intel.com>
Message-ID: <2025090205-donut-commerce-d712@gregkh>
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

to the 6.1-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     revert-drm-dp-change-aux-dpcd-probe-address-from-dpcd_rev-to-lane0_1_status.patch
and it can be found in the queue-6.1 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From imre.deak@intel.com  Tue Sep  2 13:50:59 2025
From: Imre Deak <imre.deak@intel.com>
Date: Thu, 28 Aug 2025 20:49:29 +0300
Subject: Revert "drm/dp: Change AUX DPCD probe address from DPCD_REV to LANE0_1_STATUS"
To: <stable@vger.kernel.org>
Cc: <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>, Sasha Levin <sashal@kernel.org>
Message-ID: <20250828174932.414566-4-imre.deak@intel.com>

From: Imre Deak <imre.deak@intel.com>

This reverts commit 4f546a77671076a0a49c08b4c6a7d0888d72f7d2 which is
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
@@ -663,7 +663,7 @@ ssize_t drm_dp_dpcd_read(struct drm_dp_a
 	 * monitor doesn't power down exactly after the throw away read.
 	 */
 	if (!aux->is_remote) {
-		ret = drm_dp_dpcd_probe(aux, DP_LANE0_1_STATUS);
+		ret = drm_dp_dpcd_probe(aux, DP_DPCD_REV);
 		if (ret < 0)
 			return ret;
 	}


Patches currently in stable-queue which might be from imre.deak@intel.com are

queue-6.1/revert-drm-dp-change-aux-dpcd-probe-address-from-dpcd_rev-to-lane0_1_status.patch
