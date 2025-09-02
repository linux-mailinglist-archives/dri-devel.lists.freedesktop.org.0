Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29AFEB400B8
	for <lists+dri-devel@lfdr.de>; Tue,  2 Sep 2025 14:35:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 761BE10E6B7;
	Tue,  2 Sep 2025 12:35:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="OojGcCfG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B22A910E6B2;
 Tue,  2 Sep 2025 12:35:05 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id B7E146020D;
 Tue,  2 Sep 2025 12:35:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF3C3C4CEED;
 Tue,  2 Sep 2025 12:35:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1756816504;
 bh=m9d/Q5uOT2VS5QNyb+GyKhdNjIgRLA4iyzPmJPCtyO4=;
 h=Subject:To:Cc:From:Date:From;
 b=OojGcCfGsMvOPwnSghaKTef7Oyzk3Apqg2XFGAxSmRz50DugktAkIiztasIGIVNk7
 9OrZZXmZvJMUHPMM5xORLk096x2URDcy4LxuTKPTJn2iIqX9QWjRm2biBD3e/2tDzf
 87wfE6PGre7fss9dc11fBcUoQtXS+K1/eKTFR9Rw=
Subject: Patch "Revert "drm/dp: Change AUX DPCD probe address from DPCD_REV to
 LANE0_1_STATUS"" has been added to the 6.12-stable tree
To: dri-devel@lists.freedesktop.org, gregkh@linuxfoundation.org,
 imre.deak@intel.com, intel-gfx@lists.freedesktop.org, sashal@kernel.org
Cc: <stable-commits@vger.kernel.org>
From: <gregkh@linuxfoundation.org>
Date: Tue, 02 Sep 2025 14:34:50 +0200
Message-ID: <2025090250-unhelpful-line-9166@gregkh>
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

to the 6.12-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     revert-drm-dp-change-aux-dpcd-probe-address-from-dpcd_rev-to-lane0_1_status.patch
and it can be found in the queue-6.12 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From imre.deak@intel.com  Tue Sep  2 13:50:59 2025
From: Imre Deak <imre.deak@intel.com>
Date: Thu, 28 Aug 2025 20:49:29 +0300
Subject: Revert "drm/dp: Change AUX DPCD probe address from DPCD_REV to LANE0_1_STATUS"
To: <stable@vger.kernel.org>
Cc: <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>, Sasha Levin <sashal@kernel.org>

From: Imre Deak <imre.deak@intel.com>

This reverts commit 3c778a98bee16b4c7ba364a0101ee3c399a95b85 which is
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
@@ -664,7 +664,7 @@ ssize_t drm_dp_dpcd_read(struct drm_dp_a
 	 * monitor doesn't power down exactly after the throw away read.
 	 */
 	if (!aux->is_remote) {
-		ret = drm_dp_dpcd_probe(aux, DP_LANE0_1_STATUS);
+		ret = drm_dp_dpcd_probe(aux, DP_DPCD_REV);
 		if (ret < 0)
 			return ret;
 	}


Patches currently in stable-queue which might be from imre.deak@intel.com are

queue-6.12/revert-drm-dp-change-aux-dpcd-probe-address-from-dpcd_rev-to-lane0_1_status.patch
