Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 321F6B3FDFF
	for <lists+dri-devel@lfdr.de>; Tue,  2 Sep 2025 13:44:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A24610E67D;
	Tue,  2 Sep 2025 11:44:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="sRQkbhhY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 057AD10E67B;
 Tue,  2 Sep 2025 11:44:06 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id ADD4060206;
 Tue,  2 Sep 2025 11:44:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E614AC4CEF5;
 Tue,  2 Sep 2025 11:44:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1756813445;
 bh=DaJ6EJatQGC+ytu6Zrl/0Pk26QWT1XYEoFcww77ugFI=;
 h=Subject:To:Cc:From:Date:In-Reply-To:From;
 b=sRQkbhhY2dpH3gTZiqeCInER2iVnTwFZtIfqvaq2phUEXi+y6PrF7dLHETzR7ihxl
 u5k3ZXOc75ac9MgoI3Lmpog/W7jY+8tFd2HlV6LqUlG27yL9ZbR7ubs+3i+s/M5hWd
 aPU/72zgQAPLyB00V8y3pKW1JBt3SnhH4EcNY7DU=
Subject: Patch "Revert "drm/dp: Change AUX DPCD probe address from DPCD_REV to
 LANE0_1_STATUS"" has been added to the 5.4-stable tree
To: dri-devel@lists.freedesktop.org, imre.deak@intel.com,
 intel-gfx@lists.freedesktop.org, sashal@kernel.org
Cc: <stable-commits@vger.kernel.org>
From: <gregkh@linuxfoundation.org>
Date: Tue, 02 Sep 2025 13:44:01 +0200
In-Reply-To: <20250828174932.414566-1-imre.deak@intel.com>
Message-ID: <2025090201-unsafe-energize-b9cd@gregkh>
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

to the 5.4-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     revert-drm-dp-change-aux-dpcd-probe-address-from-dpcd_rev-to-lane0_1_status.patch
and it can be found in the queue-5.4 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From imre.deak@intel.com  Tue Sep  2 13:42:52 2025
From: Imre Deak <imre.deak@intel.com>
Date: Thu, 28 Aug 2025 20:49:26 +0300
Subject: Revert "drm/dp: Change AUX DPCD probe address from DPCD_REV to LANE0_1_STATUS"
To: <stable@vger.kernel.org>
Cc: <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>, Sasha Levin <sashal@kernel.org>
Message-ID: <20250828174932.414566-1-imre.deak@intel.com>

From: Imre Deak <imre.deak@intel.com>

This reverts commit 2402adce8da4e7396b63b5ffa71e1fa16e5fe5c4 which is
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
---
 drivers/gpu/drm/drm_dp_helper.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- a/drivers/gpu/drm/drm_dp_helper.c
+++ b/drivers/gpu/drm/drm_dp_helper.c
@@ -280,7 +280,7 @@ ssize_t drm_dp_dpcd_read(struct drm_dp_a
 	 * We just have to do it before any DPCD access and hope that the
 	 * monitor doesn't power down exactly after the throw away read.
 	 */
-	ret = drm_dp_dpcd_access(aux, DP_AUX_NATIVE_READ, DP_LANE0_1_STATUS, buffer,
+	ret = drm_dp_dpcd_access(aux, DP_AUX_NATIVE_READ, DP_DPCD_REV, buffer,
 				 1);
 	if (ret != 1)
 		goto out;


Patches currently in stable-queue which might be from imre.deak@intel.com are

queue-5.4/revert-drm-dp-change-aux-dpcd-probe-address-from-dpcd_rev-to-lane0_1_status.patch
